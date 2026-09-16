Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96196C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 10:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGVXZUA+g62REzEChQK+lwmP5e863LfuKjlacn2KTRI=; b=jaDB6Ykv8xjDhqyTD/aV840Ych
	rZy6pyDsEAlHlwZYYsm0bcARNomqSEex1mPRQ19tHDDB8umay9zP8lxEwy0yMGKnOhBeSMVp+Q2Xp
	Pto9E5dFL1CE5dy3eN6hifEUkNMbtCvC4EYVeRKq8jTINddmkNDrERBXR661AIoWTJ046IP7+MYWg
	/lRB071DtzNGuspDDBVyXNpMd24O2KYdzJj/WjGI0Or5VtLjjJ28PBXwBeD657Jm1KUBhz2HsX8N+
	aQ7hk167j4iXNcikV+8esN5TX8llynl9SIjGbsifiD2EXEeZgHxGYmQjs/W9K53MfF0Nfr/z5h59m
	Wuvix26A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nKR-000000091Ik-17Op;
	Wed, 16 Sep 2026 10:57:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nKP-000000091IK-1Qs3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 10:57:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05199152B;
	Wed, 16 Sep 2026 03:57:19 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A8FF3F882;
	Wed, 16 Sep 2026 03:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789556242; bh=5sS8Pv43xatXOJ2DntYftUU17HocoYWUvGVZRmaQXc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jl/i1j2p1BX6BhBdjYRtagyYym1tFDsOw2ZvjpvW4sBBGK2hfgGcE5xfFemcxgGrZ
	 tYLQoj0zI+daIGgWA8BUzAQe08huBUV6J1EQQL0HHMfhY/nOhYOE2c9GfcuPORFpgQ
	 ab6D4JzJCZVKhcrhm9Zzeo1e1UuerEsN9kzJ07Ug=
Date: Wed, 16 Sep 2026 11:57:17 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 7/7] coco: guest: arm64: Replace dummy CCA device
 with sysfs ABI
Message-ID: <aqp2DRInEhzpEqAc@arm.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-8-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914060511.277948-8-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_035725_417879_6FBF0A40 
X-CRM114-Status: GOOD (  14.64  )
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

On Mon, Sep 14, 2026 at 11:35:11AM +0530, Aneesh Kumar K.V (Arm) wrote:
> diff --git a/Documentation/ABI/testing/sysfs-firmware-cca b/Documentation/ABI/testing/sysfs-firmware-cca
> new file mode 100644
> index 000000000000..bf177d636b92
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-firmware-cca
> @@ -0,0 +1,10 @@
> +What:		/sys/firmware/cca/realm_guest
> +Date:		May 2026
> +Contact:	Linux ARM Kernel Mailing list <linux-arm-kernel@lists.infradead.org>
> +Description:	Read-only. Indicates whether the kernel is running as an
> +		Arm Confidential Compute Architecture (CCA) Realm guest.
> +
> +		The value is one of:
> +
> +		0: the kernel is not running as a Realm guest
> +		1: the kernel is running as a Realm guest

Does this file ever read as 0? It is created only if rsi_present and
always reads as 1. That's fine by me but we shouldn't document 0 as a
value. More like if present, it always reads 1 and RSI is present.

> diff --git a/drivers/firmware/arm_rmm/rsi.c b/drivers/firmware/arm_rmm/rsi.c
> index 2dd69febedbd..52f40256bd78 100644
> --- a/drivers/firmware/arm_rmm/rsi.c
> +++ b/drivers/firmware/arm_rmm/rsi.c
> @@ -9,12 +9,15 @@
>  #include <linux/swiotlb.h>
>  #include <linux/platform_device.h>

Nit: I think we can drop this include.

-- 
Catalin

