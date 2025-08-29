Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492D0CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 18:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2PWHDO5VkUFYcFN4dC8kOLQKL08W+S+lK3eg1XecLc0=; b=qxGPGnnriL78jqmWs8zBda4NHS
	3zoB6Ps5eEA8xKkulIoQgTz2Vm9rXuPmnQ6Pa2BQ2/BfX8GAqmiH+1jxZ9E3xUYrlTt23Pf6XrwVQ
	tF9BM1j6roc5fAQmyjmsnnyVbRendpXGUrz+XX7EcXSUWnxTdRf9qtbjHGcEorKyEUl1f9sSef3UJ
	m0B4hPlVz3/GeDbdUArSZjqu25hpNEfTTSzHjP1+tX+Ue4LcJsH+Cnj5ea2Qr6SqDnP7im/OgV8Xk
	35MEMHbnrA4xSzm9/71DXiTde5V05GrblDP2KnFeQoNq/YbZgE2jOWW0hx25SKukndD3mqzSjoSHh
	SHWrMKIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us3P1-00000006b1C-2EMZ;
	Fri, 29 Aug 2025 18:00:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uryCQ-00000005eot-1OQh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 12:27:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9B9F19F0;
	Fri, 29 Aug 2025 05:27:12 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44B753F694;
	Fri, 29 Aug 2025 05:27:20 -0700 (PDT)
Date: Fri, 29 Aug 2025 13:26:49 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: Re: [PATCH] arm_mpam: Relax num_rmids parameter advertised to
 userspace
Message-ID: <aLGciannXznRgwsb@e133380.arm.com>
References: <20250820131621.54983-1-Dave.Martin@arm.com>
 <58eae4c3-51b3-48ad-b077-aefdff969119@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58eae4c3-51b3-48ad-b077-aefdff969119@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_052722_419152_58281170 
X-CRM114-Status: GOOD (  19.65  )
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

Hi James,

On Wed, Aug 27, 2025 at 06:16:00PM +0100, James Morse wrote:
> Hi Dave,
> 
> On 20/08/2025 14:15, Dave Martin wrote:
> > On MPAM systems, monitoring groups are identified in the hardware by a
> > (PARTID, PMG) pair.  Two monitoring group identifiers are the same only
> > if the PARTIDs and PMGs both match.  This means that the number of
> > monitoring groups that can be created in each control group is the same
> > as the number of distinct PMG values supported by the hardware.  The
> > number of monitoring groups that exist in other control groups at the
> > same time makes no difference to this.
> > 
> > Currently, the MPAM driver takes the cautious approach and always
> > num_rmids = 1.
> > 
> > Relax this limit, by advertising the number of distinct PMG values
> > supported by the hardware.
> > 
> > Code/Data Prioritization (CDP) makes no difference, since although this
> > doubles the number of (PARTID, PMG) pairs available to a control group,
> > each monitoring group now consumes two pairs instead of one.
> 
> Thanks, I've picked this up. It may get squashed into the patch that adds these lines
> before going upstream...
> 
> 
> Thanks,
> 
> James

Thanks for picking this up.

Will that be in the next snapshot?

Cheers
---Dave
> 

