Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23453E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 08:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ST36cQk/II1GUrnWcbOlEN3GOcFrIWafpNCcf9RzvD4=; b=5Em7MnmUya9y83hUcoD8VDlAZY
	KiCK58gEpCCMGz3qNnA6aEu4T2TxiFgj42w+fW71gE2Z2r74hmz2ulVj+plCZtBScPKhO2pmZROQV
	juPpcN22rCm1RAz2uGJAskpnc1poJxuSRbworOYi132gHfx38IDjFMaJuE+ffylfPaOwkEE5JlHoe
	hFSRAXi03cQ7MTiHIRGNL5R6f+9PxSdvKq5HQoSlx6rmKHd0LEpAoBsEZ+u3xrzff39jEdyl5NCZG
	+JoScahHYjlXo7o1V6e1IGrQVdHSNGX2Xpr4gEeHK54IioDsIHGnPgGXiKTWg1r6Uf4zrwvkiBYYe
	XhZRvfEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFqs-00000004P2G-3KNV;
	Mon, 13 Jan 2025 08:31:14 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFp6-00000004Ogg-3UiX;
	Mon, 13 Jan 2025 08:29:26 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D8BNgC016373;
	Mon, 13 Jan 2025 09:29:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ST36cQk/II1GUrnWcbOlEN3GOcFrIWafpNCcf9RzvD4=; b=3wawvasmyROAJ9D5
	t/72BpnoqyfhESMwNO43ncIDthtkDCfdpcbMIl+Sx0k7z8PVCH7lDzR81H4I0t26
	eL5UqhJuJLrrvUKA2hLOpHxZjWYw1v07L8Tpx72JVjrlezds3YXnfmH515ynXsm2
	CJ9SaWze4l/iF/f3ntRnXSWELFkJIV93MwN91cV93RTkpU7LmM14DyMkBRMru/qa
	rb1wQgqhJa4agsufI6muAiE/+mzZnlnLFBxtrocmy3WeFPCklgK3Jj+Ie37uugei
	BwvNbtp1HRHU7cmyM6zaCfidkSEe1hPhrOsb1X22tB8hBry6+3iQp1FlGNaUTixM
	kL7Skw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 443hj5d3m4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 09:29:12 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3437440045;
	Mon, 13 Jan 2025 09:28:18 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 797A62303A4;
	Mon, 13 Jan 2025 09:27:52 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 13 Jan
 2025 09:27:52 +0100
Message-ID: <d1a62a29-7407-4b34-929a-c5174fed449b@foss.st.com>
Date: Mon, 13 Jan 2025 09:27:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: stih407-usb: Use
 syscon_regmap_lookup_by_phandle_args
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Vinod Koul
	<vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250111185407.183855-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250111185407.183855-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_002925_162150_C1E62646 
X-CRM114-Status: GOOD (  19.14  )
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



On 1/11/25 19:54, Krzysztof Kozlowski wrote:
> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
> syscon_regmap_lookup_by_phandle() combined with getting the syscon
> argument.  Except simpler code this annotates within one line that given
> phandle has arguments, so grepping for code would be easier.
> 
> There is also no real benefit in printing errors on missing syscon
> argument, because this is done just too late: runtime check on
> static/build-time data.  Dtschema and Devicetree bindings offer the
> static/build-time check for this already.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/phy/st/phy-stih407-usb.c | 24 +++++++-----------------
>  1 file changed, 7 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/phy/st/phy-stih407-usb.c b/drivers/phy/st/phy-stih407-usb.c
> index a4ae2cca7f63..ebb1d0858aa3 100644
> --- a/drivers/phy/st/phy-stih407-usb.c
> +++ b/drivers/phy/st/phy-stih407-usb.c
> @@ -18,8 +18,8 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/phy/phy.h>
>  
> -#define PHYPARAM_REG	1
> -#define PHYCTRL_REG	2
> +#define PHYPARAM_REG	0
> +#define PHYCTRL_REG	1
>  
>  /* Default PHY_SEL and REFCLKSEL configuration */
>  #define STIH407_USB_PICOPHY_CTRL_PORT_CONF	0x6
> @@ -91,8 +91,8 @@ static int stih407_usb2_picophy_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
>  	struct phy_provider *phy_provider;
> +	unsigned int syscon_args[2];
>  	struct phy *phy;
> -	int ret;
>  
>  	phy_dev = devm_kzalloc(dev, sizeof(*phy_dev), GFP_KERNEL);
>  	if (!phy_dev)
> @@ -116,25 +116,15 @@ static int stih407_usb2_picophy_probe(struct platform_device *pdev)
>  	/* Reset port by default: only deassert it in phy init */
>  	reset_control_assert(phy_dev->rstport);
>  
> -	phy_dev->regmap = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
> +	phy_dev->regmap = syscon_regmap_lookup_by_phandle_args(np, "st,syscfg",
> +							       2, syscon_args);
>  	if (IS_ERR(phy_dev->regmap)) {
>  		dev_err(dev, "No syscfg phandle specified\n");
>  		return PTR_ERR(phy_dev->regmap);
>  	}
>  
> -	ret = of_property_read_u32_index(np, "st,syscfg", PHYPARAM_REG,
> -					&phy_dev->param);
> -	if (ret) {
> -		dev_err(dev, "can't get phyparam offset (%d)\n", ret);
> -		return ret;
> -	}
> -
> -	ret = of_property_read_u32_index(np, "st,syscfg", PHYCTRL_REG,
> -					&phy_dev->ctrl);
> -	if (ret) {
> -		dev_err(dev, "can't get phyctrl offset (%d)\n", ret);
> -		return ret;
> -	}
> +	phy_dev->param = syscon_args[PHYPARAM_REG];
> +	phy_dev->ctrl = syscon_args[PHYCTRL_REG];
>  
>  	phy = devm_phy_create(dev, NULL, &stih407_usb2_picophy_data);
>  	if (IS_ERR(phy)) {

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

