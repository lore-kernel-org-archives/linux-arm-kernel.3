Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FE4C18E7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2EOvlAclHzeQp38EozYAQpR/NIfs720sD/vFVN9IDmA=; b=2hw1RWDSLRQoCdC62O6ErZESXW
	OEwuv7cb/V20/OBxLr61d58cpd/uI5qxehHOEo6O9sIZwal7c/b6GGiPMuRHBq5AXo5AMQWxRld/D
	zqtHf/pqcP+s6MWgl4lYoqy2g89dkyJ2gb1t1Tn7vvmJlEBHR79TIrHTfh1LWhNAAUqzpcFBWpCsT
	cU0kaBhnT3CXihAPYBWPwdf/VaCqygDacZF3TfEVhzcvDuC+9quJvhllX9BCPYzW8zZmLIvUZzV2S
	Ob+2RBY+T64Qcze7gTxWC+gkB+Y/rSsONIQB2jdIZtdL7DsprZLN9pHTZCKJoLXXG4dPFqVn/gyCl
	eWxhRf5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHsm-00000003yyY-3Q7F;
	Wed, 26 Feb 2025 13:55:28 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHrE-00000003yhG-2K0s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 13:53:53 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51QDrXEg1558673
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 07:53:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740578013;
	bh=2EOvlAclHzeQp38EozYAQpR/NIfs720sD/vFVN9IDmA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=BflfOoIKoe3ZMuBooXdYzUcIURGor7uEcCvrRrE7hwrDtxFPyPAUDQLK9WFwgKo7e
	 mFzx6HAvmdpG9Y30AHISfDanoeG+kOzh4lysq4jVK2LEt1zoArEMjreuwiDjMa+V9d
	 iPeCbZRvSnAIWa/M/CMJ1LDdcaRxl7wmnjrksY1k=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51QDrXm1128702
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Feb 2025 07:53:33 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Feb 2025 07:53:32 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Feb 2025 07:53:32 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51QDrW4B126476;
	Wed, 26 Feb 2025 07:53:32 -0600
Date: Wed, 26 Feb 2025 07:53:32 -0600
From: Nishanth Menon <nm@ti.com>
To: Meghana Malladi <m-malladi@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        <elinor.montmasson@savoirfairelinux.com>,
        <javier.carrasco@wolfvision.net>, <ebiggers@google.com>,
        <biju.das.jz@bp.renesas.com>, <quic_tdas@quicinc.com>,
        <nfraprado@collabora.com>, <arnd@arndb.de>,
        <dmitry.baryshkov@linaro.org>, <krzysztof.kozlowski@linaro.org>,
        <geert+renesas@glider.be>, <quic_bjorande@quicinc.com>,
        <will@kernel.org>, <catalin.marinas@arm.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>,
        "Ravi
 Gunasekaran" <r-gunasekaran@ti.com>
Subject: Re: [PATCH v2] arm64: defconfig: Enable HSR driver
Message-ID: <20250226135332.5g3ydyukzy5oqivo@legume>
References: <20250226104517.1746190-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250226104517.1746190-1-m-malladi@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_055352_683312_49D72E90 
X-CRM114-Status: GOOD (  16.57  )
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

On 16:15-20250226, Meghana Malladi wrote:
> From: Ravi Gunasekaran <r-gunasekaran@ti.com>
> 
> HSR is a redundancy protocol that can be realized with any
> two port ethernet controller.
> 
> Many of TI's K3 SoCs support multi port ethernet controller.
> So enable HSR driver inorder to support this protocol on
> such SoCs.

Which boards use this? cam you update the commit message for the same?

> 
> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
> ---
> 
> v1: https://lore.kernel.org/all/20240419060013.14909-1-r-gunasekaran@ti.com/
> 
> v2-v1:
> - Rebase to the latest tip
> - Included TI specific maintainers in 'to'
> 
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index c3df5120b23d..f3afc0ec68f0 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -177,6 +177,7 @@ CONFIG_NET_CLS_FLOWER=m
>  CONFIG_NET_CLS_ACT=y
>  CONFIG_NET_ACT_GACT=m
>  CONFIG_NET_ACT_MIRRED=m
> +CONFIG_HSR=m
>  CONFIG_NET_ACT_GATE=m
>  CONFIG_QRTR_SMD=m
>  CONFIG_QRTR_TUN=m
> 
> base-commit: 8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
> -- 
> 2.43.0
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

