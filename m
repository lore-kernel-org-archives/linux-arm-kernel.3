Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CABC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 15:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwxYCmlSm6kxcPL6nDU1EuAVKbf+32LYUbjheomZo/M=; b=Z7FBPXdVHgC/a9dFvbC3F8NbtO
	TgXuUc5yNTuJMwkTBMs70ochSCWJhIBvLsjhYWFFHdGT/sGENxXsSoJBHWEYjI0B/anQ7n1Bh1UCm
	3/7zsvETjkL4uviTEWlVdxdtbdYF7afB0Hz2Kzmt9UKzGRK63Jz86nZb4CWXq520oB0MisN54MQaD
	na8aHKUKGfCdWaieVW/g7KFCvtO8wy0DT1Jm77z2g1h6dG0HxunuSEiLW2GVFhXEaEUudz+mKIBZH
	mGIjJ+aJYorMoAamOOrBhHZMUXwTQtSPfrKD04rYJGpJLdVIakaun5TtovpPpWOxHK01uFyR6jV+M
	Ij8uqPSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzNj-00000008n9G-2kH9;
	Wed, 02 Jul 2025 15:28:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyYX-00000008drx-2gwU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 14:35:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8102C22C7;
	Wed,  2 Jul 2025 07:35:09 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEC8A3F6A8;
	Wed,  2 Jul 2025 07:35:23 -0700 (PDT)
Date: Wed, 2 Jul 2025 15:35:21 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/28] coresight: etm4x: Ensure context
 synchronization is not ignored
Message-ID: <20250702143521.GX794930@e132581.arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
 <20250701-arm_cs_pm_fix_v3-v2-5-23ebb864fcc1@arm.com>
 <aGUTmZgrN13GtrBp@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGUTmZgrN13GtrBp@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_073525_726289_0EDEF6D0 
X-CRM114-Status: GOOD (  17.53  )
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

Hi Levi,

On Wed, Jul 02, 2025 at 12:10:17PM +0100, Yeoreum Yun wrote:

[...]

> > @@ -579,6 +572,13 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
> >
> >  	if (!drvdata->paused)
> >  		rc = etm4_enable_trace_unit(drvdata);
> > +
> > +	/*
> > +	 * As recommended by section 4.3.7 (Synchronization of register updates)
> > +	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> > +	 * ISB instruction after programming the trace unit registers.
> > +	 */
> > +	isb();
> 
> But according to 4.3.7 ("Synchronization when using memory-mapped
> interface"), doesn't it need to dsb like:
> 
>   if (csa->iomem)
>     dsb(sy);
>   isb();
> 
> Or am I missing something?

Section 4.3.7 suggests using a DSB barrier to ensure that writes have
completed in MMIO mode. It also mentions an alternative:

"If the memory is marked as Device-nGnRE or stronger, read back the
value of any register in the trace unit. This relies on the peripheral
coherence order defined in the Arm architecture."

In the etm4_{enable|disable}_trace_unit() functions, each time the
TRCPRGCTLR register is written, the driver polls bits in TRCSTATR.
This acts as synchronization using read-after-write (RAW), which is
exactly the approach suggested above.

This is why we don't need DSB() anymore.

Thanks,
Leo

