Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D68E77190
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 14:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmnDLoXCH6tCNgBRWw/i4up/cV3Jfbf1V+vLuWVLS0o=; b=ixenK0Q+CxbyWKz3g8SdS1Foc+
	5qIrZZklvWsfcT3K6T1E9R9GrtbRJJPhqGauSfZFRzmJUj0i16/Jm74VJkLwHBI3PA++chyrIF8k/
	G0yrqrmucuBrtAy39/3kIKu1m6kljEyZI70ehgEXIt2fjxgIfL0SXR5fDLIVUiI2MqDv8gLjcWeNt
	9f43NcgK/Zzwwan6A0MIKvi5/44Y6P32oxaw2xKrb09n/vg7JBxTQu/R7a17bqVfb6FB8yjx9OqId
	8pGgQuNdmAMkMnIzQwTmKpvMfI9aYh1r3Ca5OYL/pvFY3h1IhxLduiG9gdLrKHGLv0M2AyE8iXxj7
	xSkNqjWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPj4S-0000000A7Ex-1lHt;
	Mon, 23 Dec 2024 14:06:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPhyp-0000000A1KN-1xjW;
	Mon, 23 Dec 2024 12:56:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734958573;
	bh=IM1Q6HaiaXg6oZNGDXEIctOQsVVBIkBbPK450fxHLa4=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=PnZjejzaQNnQKGcHj69QdnLjjYL1KWDohfW64b6PdhFvI8Jef1P+1jMFXi6aoy87O
	 QZN2t/CpxI7TrlVDF0XKymLi2VwstnAqSiG+c6utZIjP0w42MQDuiqyGQ405qxBs2c
	 AP+yTne24M6ncM6uTwMMDti0Eo7auSn5RbsqTpyt8VV3YNNHDKDOH3fYkSBqLBEO6I
	 TgndOBH1RP7S/jlh5bgr0yUgnR7cYS4ckWtIO0QRBlswHEHutgzzpO25flxd2Zco7P
	 yhvSI41OQxRDXL9qZr19qTkV9cOqS1/gZclAOKMk0nE56ep3fqyamFo1Q9K/rNAbf4
	 nm/jcVdC/o+mg==
Received: from [192.168.1.90] (unknown [84.232.140.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8869D17E3750;
	Mon, 23 Dec 2024 13:56:12 +0100 (CET)
Message-ID: <19eca5c3-cedb-4c5f-9b70-9c25c8387414@collabora.com>
Date: Mon, 23 Dec 2024 14:56:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] PCI: exynos: Switch to
 devm_clk_bulk_get_all_enabled()
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <20241217-clk_bulk_ena_fix-v5-0-aafbbb245155@collabora.com>
 <20241217-clk_bulk_ena_fix-v5-2-aafbbb245155@collabora.com>
Content-Language: en-US
In-Reply-To: <20241217-clk_bulk_ena_fix-v5-2-aafbbb245155@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_045615_719105_E0692327 
X-CRM114-Status: GOOD (  11.45  )
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

Hi Bjorn,

On 12/17/24 11:41 PM, Cristian Ciocaltea wrote:
> The helper devm_clk_bulk_get_all_enable() missed to return the number of
> clocks stored in the clk_bulk_data table referenced by the clks
> argument and, therefore, will be dropped.
> 
> Use the newly introduced devm_clk_bulk_get_all_enabled() variant
> instead, which is consistent with devm_clk_bulk_get_all() in terms of
> the returned value:
> 
>  > 0 if one or more clocks have been stored
>  = 0 if there are no clocks
>  < 0 if an error occurred
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

In case you missed the previous requests, we need your ack on this patch
so that Stephen can apply the entire series to the clk tree and drop the
obsolete helper.

Thanks,
Cristian

