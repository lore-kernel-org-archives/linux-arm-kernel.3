Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D744CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCO7FheBb0QtZY1aP+C/CKmQeFmIqEIk287fXx6Tx9k=; b=W9NjbcMxYWuEbDXzJwIUIKLCE7
	UaJR/eVRZIW1jix7lB4SH3GopA4sLjhJi8owKg1U1DpofDbkVp7L2PihHmauFFw29fVIi7k3daDNF
	9hqE3O5IPRWUXBy5H+RQI9qqIkeuU189YTBoKgDWj2lQNr6Wxizj35ptZCmZNElSeFR9+AG9SmwJJ
	KxFiJhF3v8z8Mqbk1WgMT80A/WMTGinKh0d1cRxwFfpNkMxw8FpGSF2pEXRsmu9wDqPqSIjG6RKt2
	+iti+48gfFdZdfUraECgBMnt1y3/DlbprYl4b6r2yri96MHN9EYFpHxnhVZjaDqbVK3El8TSQKM6t
	ALY4UpPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCCK-00000008Arv-0k7U;
	Thu, 01 Oct 2026 08:31:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCCH-00000008ArE-3bko
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:31:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CE1B419D0;
	Thu,  1 Oct 2026 08:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAEE51F000FF;
	Thu,  1 Oct 2026 08:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843481;
	bh=qCO7FheBb0QtZY1aP+C/CKmQeFmIqEIk287fXx6Tx9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RRPjT6uEl8jvYU2BQEX4mFlM3STmFQT82C+soXKo2LGVahgTGWVUThfHMRvPVLSrw
	 gkRuPV5J3G7nfnBo7GaTmqSWBg6+Y4y1ozODB8JODDsqJImXcd7a8GXYHlpLvhsrOk
	 83PD2HcCLoOTKUIfKR9QY8HSixYK5vKwgnAxqfbd9l4BmO/HRsBFl9ZIjZkqfZJwUG
	 JJvu/nNuLgKWmnpIgL0ccLbwlU7zZ0lsimVw0BV1ZhyuiUGwDmK/FjdBOkmQdbJ9hT
	 HsRXF+gRngLgSn+VGcCbD1YqxEVgIYxdn+qCimtDaBmJZMJDs8xjtL1xJ8ghZBt3w6
	 RxAiOAN2Wq9IA==
Date: Thu, 1 Oct 2026 09:31:15 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
	gshan@redhat.com, joey.gouly@arm.com, tabba@google.com,
	yuzenghui@huawei.com, linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
	lpieralisi@kernel.org, enju.kohei@fujitsu.com,
	jonathan.cameron@oss.qualcomm.com
Subject: Re: [PATCH v20 6/9] firmware: arm_rmm: Ensure the RMM has GPT
 entries for memory
Message-ID: <20261001-military-foxhound-of-conversion-d80e7a@sudeepholla>
References: <20260929221623.1342076-1-suzuki.poulose@arm.com>
 <20260929221623.1342076-7-suzuki.poulose@arm.com>
 <20260930-judicious-loris-of-will-dea0a3@sudeepholla>
 <210c0b27-c7cb-447a-b6ee-bf6b3fb63acc@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <210c0b27-c7cb-447a-b6ee-bf6b3fb63acc@arm.com>
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

On Wed, Sep 30, 2026 at 04:55:38PM +0100, Suzuki K Poulose wrote:
> Hi Sudeep
> 
> On 30/09/2026 15:44, Sudeep Holla wrote:
> > On Tue, Sep 29, 2026 at 11:16:20PM +0100, Suzuki K Poulose wrote:
> > > From: Steven Price <steven.price@arm.com>
> > > 
> > > The RMM maintains the state of all the granules in the system to make
> > > sure that the host is abiding by the rules. This state can be maintained
> > > at different granularity, per page (TRACKING_FINE) or per region
> > > (TRACKING_COARSE or TRACKING_INTERMEDIATE). The region size depends on the
> > > underlying "RMI_GRANULE_SIZE". For a "coarse"/"intermediate" region,
> > > all pages in the region must be of the same state, this implies we need to
> > > have "fine" tracking for DRAM, so that we can delegate individual pages.
> > > 
> > > For now we only support a statically carved out memory for tracking
> > > granules for the "fine" regions. This can be extended in the future to
> > > allow modifying the tracking granularity and remove the need for a
> > > static allocation by the firmware.
> > > 
> > > Similarly, the firmware may create L0 GPT entries describing the total
> > > address space. But if we change the "PAS" (Physical Address Space) of a
> > > granule, then the firmware may need to create L1 tables to track the PAS
> > > at a finer granularity. Linux therefore checks if the platform firmware
> > > manages the PAR region. i.e., the firmware is in charge of managing the
> > > L1 GPTs (creation and the required memory for the GPT tables - via static
> > > carveouts) without host intervention. Support for dynamic GPT creation by
> > > the host will be added later.
> > > 
> > > If the firmware requires us to manage the tracking or GPT memory,
> > > deactivate the RMM and reclaim any memory donated at RMM activation.
> > > 
> > > Apply the same checks when hotplugged memory is brought online.
> > > 
> ...
> 
> > > ---
> > >   drivers/firmware/arm_rmm/rmi.c | 247 ++++++++++++++++++++++++++++++++-
> > >   include/linux/arm-rmi-cmds.h   |  18 +++
> > >   2 files changed, 264 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
> > > index d982cf158f8da..d4d098448e46e 100644
> > > --- a/drivers/firmware/arm_rmm/rmi.c
> > > +++ b/drivers/firmware/arm_rmm/rmi.c
> > 
> > [...]
> > 
> > > +static int rmi_verify_gpt_firmware_managed(phys_addr_t start, phys_addr_t end)
> > > +{
> > > +	unsigned long l0gpt_sz;
> > > +	unsigned long next, par_state;
> > > +
> > > +	l0gpt_sz = 1UL << (30 + FIELD_GET(RMI_FEATURE_REGISTER_1_L0GPTSZ,
> > > +					  rmi_feat_reg(1)));
> > > +	start = ALIGN_DOWN(start, l0gpt_sz);
> > > +	end = ALIGN(end, l0gpt_sz);
> > > +
> > 
> > Is it guaranteed that end with not be = PASZ ? The spec says RMI_GPT_INFO
> > will return RMI_GPT_INFO when top >= pasz. Unlike start, end for good
> > reason is aligned up(ceil) instead of aligned down, but that also means
> > end will become PASZ when we reach end of memory, no ?
> 
> Good point. The RMM spec needs to be fixed to make the condition
> 
>  top > pasz
> 
> as the top, is really the top the region and is not inclusive.
> 
> This is already a known issue, tracked by FENIMORE-1807. The proposed
> fix is :
> 
> pre: UInt(top) > rmm.static.pasz
> 

Ah OK, all good here then. Thanks for update.

-- 
Regards,
Sudeep

