Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F32FD5F99
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 09:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Lp9Ew+Rf6TGroNBJ0CsSs4dH5Oc/FGhit4JypNx3eA=; b=pnnlTc8Itx2hDdVimiLHa+VPgp
	/ENOGs1dCO7NEUYOM+Jgc3N2gD91m9BqqDxp5oeS0Gz4Mlst/ShorLeYHsca4KD34MypDMwTw5IAp
	1Bt1vGGxiRQkTTaqDXKVfoYsS3Afrj3LNtXotcOuSO+QqpqXN0B2qoeabcrZwMASc57PYnQ+3lYea
	SjgXJ+Eq5VKQroYdcSowfIFaYxS1slYdU4xrCNWuApRUeXdJtK6xfQ+ZHBnzbIrpREM5FDktQoTh7
	SyU1K+gLGLV66VzIlzpRNyrA1BOGtwjEcBsalYBpzZUzwsVIjS/WpGIPLuMqTczTBEJB/i4vgHsbF
	pldakFEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOsT-00000008ZCT-3SLu;
	Wed, 08 Apr 2026 09:07:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOsQ-00000008ZBR-4BsV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 09:07:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C43AE293B;
	Wed,  8 Apr 2026 02:07:01 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05A443F641;
	Wed,  8 Apr 2026 02:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775639227; bh=W5LEguNCP4i5z7VzNmBYP1xbD/RZ4RT18i4OzYMTBT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gc5iu3VSYOasYG43MFYMUiI7Junj2YNPfM/1eL6e46J1NtvvOTE6nLBMmaWH84QXX
	 EIKRs29ubUpoie2xV/JMp9WNRGBE6pFz7HJiCOj5G3TxNIzrKQ3ZX4/2GAUotZ7jpm
	 AA+ONrRgQOH4qQRq7+0x3aCinXMqGqfpsHuXRuQU=
Date: Wed, 8 Apr 2026 10:07:03 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, mike.leach@linaro.org,
	james.clark@linaro.org, alexander.shishkin@linux.intel.com,
	leo.yan@arm.com
Subject: Re: [PATCH 1/2] coresight: etm4x: fix inconsistencies with sysfs
 configration
Message-ID: <adYat8QVFkVnCRFZ@e129823.arm.com>
References: <20260317181705.2456271-1-yeoreum.yun@arm.com>
 <20260317181705.2456271-2-yeoreum.yun@arm.com>
 <f62c7138-bddc-4bf1-932d-bafa683f5ee0@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f62c7138-bddc-4bf1-932d-bafa683f5ee0@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_020711_074751_1D532462 
X-CRM114-Status: GOOD (  12.88  )
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

Hi Suzuki,

[...]

>
> >
> > To resolve these inconsistencies, the configuration should be separated into:
> >
> >    - active_config, which represents the currently applied configuration
>
> To be more precise, it is the "Applied configuration for the current
> session"

Thanks for suggestion. I'll change it.

>
> >    - config, which stores the settings configured via sysfs.
>
> While we are at it, should we stop using the drvdata->config for the
> "capabilities" for the ETM (e.g., TRCSSCSRn in ss_status ?) Instead
> we could save it in "drvdata->ss_status". This keeps everything
> separated:
>
> 1. Boot time probed capabilities of ETM
> 2. Sysfs configuration for the next Run
> 3. Current active configuration for the ETM (sysfs or perf)

Agree. with the Leo's suggestion, I'll change it.

Thanks!

[...]

