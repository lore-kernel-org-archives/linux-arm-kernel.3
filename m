Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23C9C678DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p02POhk1qgcjXqN8CWPa09qIjiWuPqoUdJQt80qLrGc=; b=kcEo53kB+pDZLm91SSdFC+o1EH
	uuQDVDjdKNhBaNjRUrvrbBioFVTEGr4PBliTf2XNkNvZ5nCRVCRR+epZxq1ETIgwjtJ5Q0MA5sO73
	rwEVnBTTPFvpF9O2oHRBjPnsKGs2IJM2+6acrqepwbsaZ+dWVafHF9f1dUz+JtdyrbJXDOWwNfOvf
	y/OjJJ+m1Tdm2Zafs+nLIU3U+u+X44zovDdDe1qHgGn63BilAX6GghTE8Dj1G2kX0MxsOCrf2mNfn
	kwYpa0iaj3h9kwQ7Ky92imefS+ZCDtw6jRPh/9uaWAglor84Fi6OuVor2yp3wqD+BLbjIHkKymgSH
	DypGj52g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7lF-00000008EhL-1GsS;
	Tue, 10 Jun 2025 22:48:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2bJ-00000007bJD-2lQV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 17:17:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FBE314BF;
	Tue, 10 Jun 2025 10:17:07 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 349073F66E;
	Tue, 10 Jun 2025 10:17:26 -0700 (PDT)
Date: Tue, 10 Jun 2025 18:17:24 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [boot-wrapper PATCH V2] aarch64: Enable access into FEAT_SPE_FDS
 register from EL2 and below
Message-ID: <aEhopO3sODMWooZC@J2N7QTR9R3>
References: <20250606052602.3387225-1-anshuman.khandual@arm.com>
 <c7c97edf-8e2b-4196-9660-a15b86061c96@linaro.org>
 <aEbjcQLBKG7TepPg@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEbjcQLBKG7TepPg@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_101729_734578_08F76474 
X-CRM114-Status: GOOD (  15.10  )
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

On Mon, Jun 09, 2025 at 02:36:53PM +0100, Mark Rutland wrote:
> On Fri, Jun 06, 2025 at 09:49:07AM +0100, James Clark wrote:
> > On 06/06/2025 6:26 am, Anshuman Khandual wrote:
 
> > > +	/*
> > > +	 * PMSIDR_EL1 register is present, only when FEAT_SPE
> > > +	 * feature is implemeneted. Otherwise direct accesses
> > > +	 * to PMSIDR_EL1 are UNDEFINED.
> > > +	 */
> > > +	if ((mrs_field(ID_AA64DFR0_EL1, PMSVER) >= 1) &&
> > > +	    (mrs_field(PMSIDR_EL1, FDS)))
> > 
> > Minor nit, but the extra brackets on the second condition are unnecessary.
> > Probably not worth a second version for though.
> 
> I don't think they're necessary for either condition, so when I apply
> this I'll simplify this to:
> 
> 	if (mrs_field(ID_AA64DFR0_EL1, PMSVER) >= 1 && 
> 	    mrs_field(PMSIDR_EL1, FDS))
> 
> ... and drop the comment.

Applied (with the changes above), and pushed out now.

Mark.

