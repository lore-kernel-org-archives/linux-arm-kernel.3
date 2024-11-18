Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB7AD6DDF9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 06:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4I2r/3XshUJHt0K/5r4UvZ/3MbBNnDWurDqHZYr17Yg=; b=ep9IevzqfEMpMTZPN2Alqv7deO
	QBYWuGTdKrvkY/z3uaQ3fSUTNiuN65KQjN41BWQxIUNE5PNNNQxqbflYZAQB2HpT64NQhhKRwlGRs
	AnBcBMQR4qjgMaCshGBwQsQyWKJjyqcAe0gzJB+u/eHMyLoMWiOvtk5Pl2IuKlJ+SOGNiOhijkFq7
	ORAG2uHKcDn2nta8uBXW8CQXuRxjEbNJntO2DD5KzjUrBHNeb1IC0srgRX8l9BxvONaiFjPDAwuw4
	2xlK1QKD6fYM5cV2vVKv6GnrqFi14NaNKTz7J4IlE4XoWMTsEVYKQYupOV8SOv/Wzp0oo6t/NJrXO
	50tDb9/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCvc3-00000008ZO2-3O4f;
	Mon, 18 Nov 2024 06:51:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCvZK-00000008YsK-3O14;
	Mon, 18 Nov 2024 06:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731912545;
	bh=kwiYyBq946ppy7DeH0DRr1qHz4dCl8Tkb0n0W/MvIUs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FUlAA7eqM5cT1kjfn/sNiSVvKvM5eipu1mOf826vsD4IYsjHnPIAnlTrkNZQs8Ut4
	 SHbD3yZpZWDsazF8ATy7+c/J8o9paPXyvBZOKtIvzMx9Dqh2eik973yt59J6VPOQwx
	 PTivSo1T/fIHKVwxmBjhiMOiCZeQIW3QtO96sHTQIpNaRhoofOYE1u5Xu/u6q4GVK5
	 kaxgfww0diUZO0Llk18uNX18mAX5r8IJ9DNcwXB6niL6YLr2DYS62LH6bdTojSDNpB
	 537clpYQWpkruxopzItKVhWkIqNhGE/aJm9QrOSrsPxlqPwOyl+QPfr0Gc1WrRwhd2
	 HLwXMeCjqy76Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DC1DA17E124B;
	Mon, 18 Nov 2024 07:49:04 +0100 (CET)
Message-ID: <30da4271-f249-4e92-9d22-a4491b7c8618@collabora.com>
Date: Mon, 18 Nov 2024 07:49:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] PCI: mediatek-gen3: Add reset delay in
 mtk_pcie_en7581_power_up()
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
 <20241116-pcie-en7581-fixes-v3-5-f7add3afc27e@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241116-pcie-en7581-fixes-v3-5-f7add3afc27e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_224907_002017_A15E8BD8 
X-CRM114-Status: UNSURE (   8.67  )
X-CRM114-Notice: Please train this message.
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
> Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
> causing occasional PCIe link down issues. In order to overcome the
> problem, PCIe block is reset using REG_PCI_CONTROL (0x88) and
> REG_RESET_CONTROL (0x834) registers available in the clock module
> running clk_bulk_prepare_enable in mtk_pcie_en7581_power_up().
> In order to make the code more readable, move the wait for the time
> needed to complete the PCIe reset from en7581_pci_enable() to
> mtk_pcie_en7581_power_up().
> Reduce reset timeout from 250ms to PCIE_T_PVPERL_MS (100ms).
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


