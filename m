Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F45EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 09:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrLGdyCrYcyWnlhdUubAx74PyGYpBtAE+f94qB8hv+8=; b=4l30xP6BOMW8baSBGkNzGzN4fa
	AH9IBwZZwug7fAM+BxCoTg4dQReC5d0tnLOYkO9/vL/tUWc1sLeFCBLT9NXvzU7Y+cL1WRLTCgCr2
	W2XaXwFIJmaPK4mC8/RhYt2n2LrNU4GgzCXLWCrsm6tVsdYnq6myhN20Ifv4Q8Bpj+pBf69d9NCGh
	eZ/Fh0ysMqM2xhqaGtRsaMgxme/OzyG0djZDD8s4LV8Osk8BZrIAf5Rbk+Tydu7TDzPDa8iFemwc/
	Ij4Q7nSQT9cpQLToQALWDUV4o0oyMyVzaatV3C5ktEnEB2QjmsI/MimvCo1nB4FrGQDQ24lFp0Z2P
	HRlAbucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdmm-0000000CZlf-2KDO;
	Fri, 03 Jan 2025 09:16:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdlY-0000000CZT9-3hdR;
	Fri, 03 Jan 2025 09:14:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735895686;
	bh=87NFexTc1MyhVTnaxRXYUPIPkVUDQPmZsOB6r5tc5go=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bHPeFGJ1NwUKWS7llEBq/Mc+Y1g3AeSjTi25nxdmeV/TJIGpm4plKhafik7Q4Hr4v
	 vbhyuBCf/TGK+j1n7KDXVhW+xHqfJG/kXf5ytfToN2sJyn5CVhOHq9G89UFdJZ+mdy
	 zRJ4dfxWtPuLh0wDU1BSjUNsRZiUk86hBE7/QtxD0IZFs/Ljb2FH1GUQoEjXZepEBe
	 PccH/eZBIJe5gC/7zEpQ5vlZ/Whd+/O0ojxbSkB541h9qQwaqSoGqihF7KH4QB0Wsw
	 P2pEK9QBdJ3tRsdE36AZeYZvMzprKipyxFacwTe88F9k6OMY9La/i7//9cySbgFhgb
	 vZ6zvtmXYD61A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 266C817E153E;
	Fri,  3 Jan 2025 10:14:46 +0100 (CET)
Message-ID: <f23dd67e-d3a5-47b5-af14-bf0120348ec8@collabora.com>
Date: Fri, 3 Jan 2025 10:14:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] PCI: mediatek-gen3: Keep PCIe power and clocks if
 suspend-to-idle
To: Jianjun Wang <jianjun.wang@mediatek.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Xavier Chang <Xavier.Chang@mediatek.com>
References: <20250103060035.30688-1-jianjun.wang@mediatek.com>
 <20250103060035.30688-6-jianjun.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250103060035.30688-6-jianjun.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_011449_095514_602D5528 
X-CRM114-Status: GOOD (  23.35  )
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

Il 03/01/25 07:00, Jianjun Wang ha scritto:
> If the target system sleep state is suspend-to-idle, the bridge is
> supposed to stay in D0, and the framework will not help to restore its
> configuration space, so keep its power and clocks during suspend.
> 
> It's recommended to enable L1ss support, so the link can be changed to
> L1.2 state during suspend.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>   drivers/pci/controller/pcie-mediatek-gen3.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 48f83c2d91f7..11da68910502 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -1291,6 +1291,19 @@ static int mtk_pcie_suspend_noirq(struct device *dev)
>   	int err;
>   	u32 val;
>   
> +	/*
> +	 * If the target system sleep state is suspend-to-idle, the bridge is supposed to stay in
> +	 * D0, and the framework will not help to restore its configuration space, so keep it's
> +	 * power and clocks during suspend.
> +	 *
> +	 * It's recommended to enable L1ss support, so the link can be changed to L1.2 state during
> +	 * suspend.
> +	 */
> +	if (pm_suspend_default_s2idle()) {

AFAIK, this works only if s2idle is the default system sleep state.

...and besides, for good measure (especially in the event that in the future we
get hotplug support) you should also check if there is any active PCI-Express
device on the controller instance before deciding to leave the controller and
link UP, as PCI-Express controllers may be enabled even if there's no actually
connected device on a PCIe slot (full PCIe, or mPCIe, or M.2).

So, I suggest to:

- Add a `bool suspended` member to `struct mtk_gen3_pcie`, then

static int mtk_pcie_suspend_noirq(struct device *dev)
{
	struct mtk_gen3_pcie *pcie = dev_get_drvdata(dev);
	int err;
	u32 val;

	val = readl(pcie->base + PCIE_LINK_STATUS_REG);
	val &= PCIE_PORT_LINKUP;

	if (val && pm_suspend_target_state == PM_SUSPEND_TO_IDLE) {
		dev_dbg(....)
		return 0;
	}

	/* Trigger link to L2 state */
	err = mtk_pcie_turn_off_link(pcie);
	if (err) {
		dev_err(pcie->dev, "cannot enter L2 state\n");
		return err;
	}

	pcie->suspended = true;

	/* Pull down the PERST# pin */
	.... etc etc


and

static int mtk_pcie_resume_noirq(struct device *dev)
{
	struct mtk_gen3_pcie *pcie = dev_get_drvdata(dev);
	int err;

	if (!pcie->suspended)
		return 0;

	err = pcie->soc->power_up .... etc etc


... so you only check if we're going in s2idle in the suspend handler, as
that dictates the value of pcie->suspended :-)

Cheers,
Angelo

> +		dev_info(dev, "System enter s2idle state, keep PCIe power and clocks\n");
> +		return 0;
> +	}
> +
>   	/* Trigger link to L2 state */
>   	err = mtk_pcie_turn_off_link(pcie);
>   	if (err) {
> @@ -1316,6 +1329,11 @@ static int mtk_pcie_resume_noirq(struct device *dev)
>   	struct mtk_gen3_pcie *pcie = dev_get_drvdata(dev);
>   	int err;
>   
> +	if (pm_suspend_default_s2idle()) {
> +		dev_info(dev, "System enter s2idle state, no need to reinitialization\n");
> +		return 0;
> +	}
> +
>   	err = pcie->soc->power_up(pcie);
>   	if (err)
>   		return err;




