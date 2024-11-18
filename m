Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDADD6DDF1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 06:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mN6nVEcoPISEYklUhSMWBRQPy/vtzkfKeCoa1usIGDw=; b=rLkSghVUd1QyQkifR+AcCagNDm
	2Hpz+6C5vBAD7sdEFk4YpRtX89KmffvQw8RIp6dfh9/tUavypyw3GGSBEaHaW9YM8dsRCmI+wGKwl
	wjkkEEEr33pcxjTPq8BYmK8YoQ7OjnOgzeOPiGHtDVlegwVwfKocLlxrQ0wFFIfgMirrk92GPdTPJ
	YYR99PaU/jM76t8ehJ7+ths4GP7/s8bJvKGYTTlZ1/oa4QKEuIq0cqarpMaARYL3szxeeiCmBArUt
	6V5oob0HTUnQsb+Bc672K79NoRMBjHQvzrU0975bkwq7i0glh0dU8+cPxd5ffDv4JYuDIYA/ciADa
	tLpYnA5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCvb9-00000008ZGi-3cl3;
	Mon, 18 Nov 2024 06:50:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCvZK-00000008Yrz-2uJC;
	Mon, 18 Nov 2024 06:49:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731912544;
	bh=5f3+0N5E+t/8bl6EgkA4h6pAYo4sfXjYtUc+GcRng1c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YsX5+12M8t2YkPPLP2hKDGbJ9/svYkafagAIYe+LMmnbciqvJ7cK5jAc+J81QxsZr
	 PYDGiVIzHGGBr74L6QFR+cLf5nBqZdJkFNvUQz3ThlKrUle/T4+TJ7ozyEbPSCNsYC
	 E0kLDM30e4QQpkOXibqG6VWPGZLx8H1+lX2nNAHaO6YQX3s2um15Dkg8vRD4rdnl9W
	 O9tFKC2IK3fp8mOla7mD8EJYh9KYO+0YJoSMIHDqrRzkZipXOPVI/L26KSqFdEJC3Y
	 7T6SFY4efhs8dm2gAxjjmpLU9hjV2eHQ58P0QrvOAscedQG2wpAGqV2b6dHQGn3Qjt
	 Krk8fiOcI1fHw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B68C317E1247;
	Mon, 18 Nov 2024 07:49:03 +0100 (CET)
Message-ID: <3c6e250e-8c53-4f2a-a902-0350bca47b8e@collabora.com>
Date: Mon, 18 Nov 2024 07:49:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] PCI: mediatek-gen3: rely on
 clk_bulk_prepare_enable() in mtk_pcie_en7581_power_up()
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
 <20241116-pcie-en7581-fixes-v3-2-f7add3afc27e@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241116-pcie-en7581-fixes-v3-2-f7add3afc27e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_224906_877501_33E463AA 
X-CRM114-Status: UNSURE (   5.60  )
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
> Replace clk_bulk_prepare() and clk_bulk_enable() with
> clk_bulk_prepare_enable() in mtk_pcie_en7581_power_up() routine.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



