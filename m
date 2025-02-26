Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7711BC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 06:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4GvDwBZD4roAF/SEeFoR3akJsASSfyq/Z0vYBe+bC/I=; b=gI9YCxHtrz2sDi7m+l3YJKdDz0
	Ma9Z6baEIcP5OmIhTGncVMz5YSMoF1wbe+kj3IrKvWXr4aVqTogZUYoKeWzuWgQFTuqfD/9BsVoti
	Et9TOvS0zQJlkYHwoh9mWX/EikZDvBu2pY24hTDShv8KChEbqPWCDEa2cGBFyX0AUEYEJlYnIAXRf
	IUuq/fRNb2cwTeyz0JcOJZ77kOl1s8sZZYcSSXGBSR7CI/BmuR/5gWgJWn+vZeu8ylYSOdEovCJaP
	lgB2Q5QoDe+2kfwq7rE5ZaAa1EsA/BAQz0PPm1U8U1sJUpi808AYasxHri0cZg91z/eQOTE0S/m50
	bTlcjM+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAiW-00000002VSo-2cqs;
	Wed, 26 Feb 2025 06:16:24 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAgz-00000002VI2-3A9p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 06:14:51 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51Q6EbMA1988892
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 00:14:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740550477;
	bh=4GvDwBZD4roAF/SEeFoR3akJsASSfyq/Z0vYBe+bC/I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=oxUBhg5jlOUavE2PfQvYffDco9krGEJnYdAr8LdVoxqjbTpitIryBF473WMgGQVdZ
	 izS7JiPwER2NDErhH/mFzE1x/jVwMkfcsFbASWj2Qz3xUTzjXEl5VHabaXV5YRrkpt
	 J4AufRIpCdpPRVgYKi6Y0X7BfbNC5HwSucW5yXKo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51Q6Eb11056311
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Feb 2025 00:14:37 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Feb 2025 00:14:37 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Feb 2025 00:14:37 -0600
Received: from [172.24.18.117] (lt9560gk3.dhcp.ti.com [172.24.18.117])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51Q6EYfG062836;
	Wed, 26 Feb 2025 00:14:34 -0600
Message-ID: <503fcc32-8062-4b17-bb5d-1a2254afcf58@ti.com>
Date: Wed, 26 Feb 2025 11:44:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable HSR driver
To: Ravi Gunasekaran <r-gunasekaran@ti.com>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <quic_bjorande@quicinc.com>, <krzysztof.kozlowski@linaro.org>,
        <arnd@arndb.de>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <srk@ti.com>
References: <20240419060013.14909-1-r-gunasekaran@ti.com>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <20240419060013.14909-1-r-gunasekaran@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_221449_903255_E297EB7F 
X-CRM114-Status: GOOD (  14.58  )
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

Hi all,

Any reason why this patch hasn't been merged yet. Other than re-basing 
this to the tip, anything else which needs to be addressed to get this 
merged?

Thanks & Regards,
Meghana Malladi.

On 4/19/2024 11:30 AM, Ravi Gunasekaran wrote:
> HSR is a redundancy protocol that can be realized with any
> two port ethernet controller.
> 
> Many of TI's K3 SoCs support multi port ethernet controller.
> So enable HSR driver inorder to support this protocol on
> such SoCs.
> 
> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 11fa4aa40094..750343564f41 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -176,6 +176,7 @@ CONFIG_NET_CLS_FLOWER=m
>   CONFIG_NET_CLS_ACT=y
>   CONFIG_NET_ACT_GACT=m
>   CONFIG_NET_ACT_MIRRED=m
> +CONFIG_HSR=m
>   CONFIG_NET_ACT_GATE=m
>   CONFIG_QRTR_SMD=m
>   CONFIG_QRTR_TUN=m


