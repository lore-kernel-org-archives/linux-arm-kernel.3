Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD78CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 08:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ft/vpNqCIi/QF0SB4p2hwGoqvR5q41HziIqhZwXL1Ts=; b=CTDvhuJar7t+zGMYA7uh37M00M
	2/FoPyQvvWQzWAxpkcqzE3G+y6CpnT/SjRb1jycOvJH1dVug1M1DA6V+7Cg6suGCJaT1PcnxXrDma
	DM1OT/LGl9QSt+VEvvBTxAXrWyY4dDbmrI0mAYp71vbwlyEQGAOoxDYjga0ow8Tyao27jobYUxJGr
	DCeu8KDNcCO/ycPKIUkBAFkj5iIIaYL/4gJVp8vxJ78Qn+L2XtIUQ/qGsXRDBVK3g07aDtMzydAzr
	C7Hk90BK9L73gibNqCxJgYO9KkFssRp7+uB4/eEuB+uY8l7TTl1GrdPK12RDMhz3s7GvXsB3eYWXB
	89NPDD+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSij-0000000A6P4-0cAc;
	Thu, 13 Nov 2025 08:30:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSih-0000000A6Ot-3mWo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 08:30:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EC1E8601A5;
	Thu, 13 Nov 2025 08:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5C3C4CEF8;
	Thu, 13 Nov 2025 08:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763022612;
	bh=owgvi7e/WVMKOP1mop+3LP3dxzPrNllYG4CabDQBWPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=noGiq7MmYCNKJ1cR2HQfHLE/DsKAWpRldbypcwbvwm69kmrXogxMDHzdOSgT1TJzN
	 cbkw5BS0zR/rrXovmgGmxFQjNLThhHVoBOV29tDDf738tUT3bFbf5Kna6K2SrxDV3w
	 4DiR6bgbxYZ5T1Tla7fN7f8nd2r9Y8taU2DyFgZvhxsyn5+gDW2PtqslAgWogZkDQN
	 8hbQn/kcGtQ2Ipl92ecHaX2yC7+Wkh7nLtDilUD+flb12/E9dpmBujPnGEKdM9uNkW
	 VSDlu9nl2WiFzkOJZ7QYKPSKXEo+t1O3xvoqPgLMzH/+GriLiWIlHyrZVw2SgJPk58
	 /LG7yuGEQIMrA==
Date: Thu, 13 Nov 2025 09:30:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, semen.protsenko@linaro.org, willmcvicker@google.com, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/5] nvmem: add Samsung Exynos OTP support
Message-ID: <20251113-benign-macaw-of-development-dbd1f8@kuoka>
References: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
 <20251112-gs101-otp-v2-2-bff2eb020c95@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251112-gs101-otp-v2-2-bff2eb020c95@linaro.org>
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

On Wed, Nov 12, 2025 at 08:29:06AM +0000, Tudor Ambarus wrote:
> Add initial support for the Samsung Exynos OTP controller. Read the
> product and chip IDs from the OTP controller registers space and
> register the SoC info to the SoC interface.
> 
> The driver can be extended to empower the controller become nvmem
> provider. This is not in the scope of this patch because it seems the
> OTP memory space is not yet used by any consumer, even downstream.

Quick look tells me you just duplicated existing Samsung ChipID driver.
Even actual product ID registers and masks are the same, with one
difference - you read CHIPID3... which is the same as in newer Exynos,
e.g. Exynos8895.

What is exactly the point of having this as separate driver? I think
this can easily be just customized chipid driver - with different
implementation of exynos_chipid_get_chipid_info().

Best regards,
Krzysztof


