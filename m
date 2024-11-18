Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCF7D6DDF9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 06:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjqiB/dvgLhRBke5JaOUBda1VwKVsEnYb6Hgr74HrbA=; b=bb45wwk/ayO2r9Pgm2UXkZb8jb
	7fMVuGIUZ6k6ObzacO8wc2xaICG134hS3tH5KMBirl3VZBMtoi/zaLyRYI2JGEpac30BibZ58qJ/X
	605aKmsRbO3JiAzpchnFz7KL/Cz7y4B3JVSBLWvAZsgDSCNZIz049lzykpX7JiqsBf5SdgKSAXZHk
	NxA4hGuRQLtUl6GDPImgVnXAcLXm0Pxv6ytl5SsvuE3dyOjqzzWcTAjkEWkxhApBHimnHOAJYfAYT
	MPWKW10KD5elHu1rk4xR/s2DPs0zR3lOYTzLaLNdsQRkyK+1zFiQ3hfxjByk4bwAev2NchW352SPt
	TQb4T2Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCvek-00000008Zub-34p2;
	Mon, 18 Nov 2024 06:54:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCvZo-00000008Z18-1abP;
	Mon, 18 Nov 2024 06:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731912574;
	bh=ULUv5k6/b6OAJTH3xB9QMwYTCfFWvEVCAfCK2tBQHLQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T2bONE88Z4ULg6wAyJSoOW9n3ZS/rl9Ep6AT35B296kM3kG53AP5t9rtGf6M3WY4y
	 9mOOuAiZqaVdG1R4kJBxdNnJXr43ju3/EtI6Kql/RS5whSt9/7enA+wfqXqkH3trij
	 7zNCRqORxVIW3oECjzrBZjW3YQXcmvLJLHz3AsYUMTtZ5hnM1WSqliTfOW5H97QKzt
	 sJ3BYj2ks2k06As8qWScwfooUiYDyXdoCrNApLs9qUn9YoNnFPDdgI5rYje72ev/5G
	 FPC0/vr45+nDBeCsFnA67NOpNmNkXXY6Z7BxXP+BUKV7iabtH+B8AuSZtGyChwhzTF
	 TN/xgiilT9jNw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5958817E1247;
	Mon, 18 Nov 2024 07:49:34 +0100 (CET)
Message-ID: <197fde88-f3eb-4c09-9d49-6450faa150cc@collabora.com>
Date: Mon, 18 Nov 2024 07:49:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] PCI: mediatek-gen3: Add comment about
 initialization order in mtk_pcie_en7581_power_up()
To: Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20241116-pcie-en7581-fixes-v3-0-f7add3afc27e@kernel.org>
 <20241116-pcie-en7581-fixes-v3-4-f7add3afc27e@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241116-pcie-en7581-fixes-v3-4-f7add3afc27e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_224936_604268_A2753068 
X-CRM114-Status: GOOD (  12.58  )
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

Il 16/11/24 09:18, Lorenzo Bianconi ha scritto:
> Add a comment in mtk_pcie_en7581_power_up() to clarify, unlike MediaTek
> PCIe controller, the Airoha EN7581 requires PHY initialization and
> power-on before PHY reset deassert.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>   drivers/pci/controller/pcie-mediatek-gen3.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 2b80edd4462ad4e9f2a5d192db7f99307113eb8a..dd30530a43b1097871acc9e76a7534f30819432d 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -928,6 +928,10 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>   	 */
>   	mdelay(PCIE_EN7581_RESET_TIME_MS);
>   
> +	/*
> +	 * Unlike the MediaTek controllers, the Airoha EN7581 requires PHY

Unlike the other MediaTek Gen3 controllers, Airoha EN5781 requires.....

(because Airoha *is* MediaTek anyway)

After which,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


