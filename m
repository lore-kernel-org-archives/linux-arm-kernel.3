Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991DDC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 13:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOt0MErLmP9Yr+F5drnOwPc+dt8sk0jZ+IKR7qQ8siY=; b=4N54PnzOwhosbN2i4khZ32tegn
	lxEsLwRvdM0vUiLhS6/HmF+xmq6zZxXi2Epg/DhD8g27BlC/t0pY9XreJ6+kVZhERUOyF1rgOKeUI
	khyVZ5IUn5SogjRK//93DVZFbjUi6w5SdwNXcGdSUy5YoKg5YmABNWHmHNoadvAW2K11bVmIeuIfC
	0Kxwc3fd4/reT+nA1ILWlEYNxiVMtWIf/8YXwSpGDUW1Ej+r2WFvXGyeyR150qHpJD5vrZI0o5/2z
	cbKmHHPYPNvzi5rzWYgq0Qi+Cwk349SeaJg+lsEK9t1HfC//rra4nxUy7mpJhXUJ+7Kss3vARd6JF
	K7iMbB4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOciY-00000004Fvt-3Bhz;
	Mon, 09 Jun 2025 13:39:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOcgM-00000004Fnv-2ClZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 13:36:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F6B4150C;
	Mon,  9 Jun 2025 06:36:34 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F95A3F59E;
	Mon,  9 Jun 2025 06:36:52 -0700 (PDT)
Date: Mon, 9 Jun 2025 14:36:49 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [boot-wrapper PATCH V2] aarch64: Enable access into FEAT_SPE_FDS
 register from EL2 and below
Message-ID: <aEbjcQLBKG7TepPg@J2N7QTR9R3>
References: <20250606052602.3387225-1-anshuman.khandual@arm.com>
 <c7c97edf-8e2b-4196-9660-a15b86061c96@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7c97edf-8e2b-4196-9660-a15b86061c96@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_063658_610332_15131209 
X-CRM114-Status: GOOD (  13.43  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Jun 06, 2025 at 09:49:07AM +0100, James Clark wrote:
> On 06/06/2025 6:26 am, Anshuman Khandual wrote:
> > FEAT_SPE_FDS adds system register PMSDSFR_EL1. But accessing that system
> > register from EL2 and below exception levels, will trap into EL3 unless
> > MDCR_EL3.EnPMS3 is set.
> > 
> > Enable access to FEAT_SPE_FDS registers when they are implemented.
> > 
> > Cc: James Clark <james.clark@linaro.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

> > +	/*
> > +	 * PMSIDR_EL1 register is present, only when FEAT_SPE
> > +	 * feature is implemeneted. Otherwise direct accesses
> > +	 * to PMSIDR_EL1 are UNDEFINED.
> > +	 */
> > +	if ((mrs_field(ID_AA64DFR0_EL1, PMSVER) >= 1) &&
> > +	    (mrs_field(PMSIDR_EL1, FDS)))
> 
> Minor nit, but the extra brackets on the second condition are unnecessary.
> Probably not worth a second version for though.

I don't think they're necessary for either condition, so when I apply
this I'll simplify this to:

	if (mrs_field(ID_AA64DFR0_EL1, PMSVER) >= 1 && 
	    mrs_field(PMSIDR_EL1, FDS))

... and drop the comment.

Mark.

