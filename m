Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38332CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 09:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RXfGzc8hdtZCQ3Z9H4MqjIVNYjUY3/62+AlWXklvNU=; b=0FQLBz1UxNddakMCuWrnwBtmqV
	ZEWLv2W6ZboxALpUWhc4bxg/nXZXRWiSRuk8UlDNTvaKJMHv+V00+rAKBdxxJpqeT7UgR2QfcrODW
	wqAusbKXblqvdUzxMLheAKixL1MWsZ7iA8CCaOM2yVQLHjWmHia+RO2jRP1vZhS2JLOxCY28oJ0kc
	1avx4Z/9IPNrMoY5EDPfq2iuC2KWT5kID7ah1C4FgDMJaESeE6RBh6BT/d1pVU6RhsSINtELjupZk
	to25r87F8HMXCHBeILVXhT6Ttbpnvk3dSl0CMBsRALL8m/6oeTvwhpIo+nLZb3Jo4fzhhtKvoiozX
	+rABw/oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuT6X-00000000rVV-2DN2;
	Fri, 05 Sep 2025 09:51:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRgT-00000000Jvl-0vNi;
	Fri, 05 Sep 2025 08:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757060435;
	bh=OAnRq+EFKKwYtkRHr0XwJ5eAzkcTuotAqvUJYtyAA7w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aolFvpWn/tCj2yIGSvsHAhJDidaC+yNPqGzu1ARtT+PyBYBTtd+fcOWCWjFkbTlv5
	 uFoQNUncMb9hUb0NDMi8pur6WyqqDA5e4reB8ZVZuxc0rZ0Vaat3d9bLvb59nsKtT+
	 isbHtl4x2zbtuoZeqxvrKXW+VperMTogzjNhSEhblCaJO7jVrIuFuVAp94HThD4V+a
	 6aC82FaNcKQYbGnbHCXfvkIvV9+S5W4b5AQCtRKGpcwSzh8NSOBSK7GPHB3mkn4pNp
	 58HdvIOIyLzkxrV+JQHJ9ZQwpRUFk7RrxazV1WhYJ4eHS4rcMjt8cRn6Erl8yrkrVv
	 EqP28fESmLtPg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6957517E0AC3;
	Fri,  5 Sep 2025 10:20:34 +0200 (CEST)
Message-ID: <000a0636-2a78-433b-8bfe-2534ae0a9bee@collabora.com>
Date: Fri, 5 Sep 2025 10:20:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/27] clk: mediatek: clk-gate: Refactor
 mtk_clk_register_gate to use mtk_gate struct
To: Laura Nao <laura.nao@collabora.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de, richardcochran@gmail.com
Cc: guangjie.song@mediatek.com, wenst@chromium.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 kernel@collabora.com
References: <20250829091913.131528-1-laura.nao@collabora.com>
 <20250829091913.131528-7-laura.nao@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250829091913.131528-7-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_012037_438033_932C7DBC 
X-CRM114-Status: UNSURE (   6.80  )
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

Il 29/08/25 11:18, Laura Nao ha scritto:
> MT8196 uses a HW voter for gate enable/disable control, with
> set/clr/sta registers located in a separate regmap. Refactor
> mtk_clk_register_gate() to take a struct mtk_gate, and add a pointer to
> it in struct mtk_clk_gate. This allows reuse of the static gate data
> (including HW voter register offsets) without adding extra function
> arguments, and removes redundant duplication in the runtime data struct.
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Nice cleanup.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



