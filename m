Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5311CD132B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 11:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lNJzNaryy4kHU8DxIjF6Clb4qY33tjCs9DMZRXUgfDk=; b=s2V4OTKhVFGxchXIZIg/Rj+/ni
	8KjAFOxQD0Xdj4Ci0XW91y9KtlSsafRG+JVXGmDiJkn4tzTHqLcU4XmwpWE6Z9DU40hzLztvZ5Ny/
	ayfwgUzaeVw0BKZUlp/giVjMskEeBKBxl7ep6eV3E4uXWcCQWW4OYKKaL5HEXc6QbwzicnodNPkyi
	n2g3ZT/3BGnN/CrmxUzK56rt4MYK1NixBCBiTfTr9ZJiqR+IcxXpA0wnrj+JElUefj9MLyR54J5jT
	l1hDOezZ5SwOaAFC4v77M5YzHUy8j4j68SDLzcZJ++1oABEYOZGz9duL/LdKtCQtKgKllqpxkQCOg
	LYkYI0YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vIa-0000000DWw7-3MPI;
	Mon, 04 Nov 2024 11:31:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7uAd-0000000DIU7-45t1;
	Mon, 04 Nov 2024 10:18:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730715530;
	bh=/BqvSMpzIqUrh5h8PydNqYZk+71Ku8Hj2PODCROFwpI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CzWRbvj8/pyD1ZMGCxhxWd7tLZTkAJdm6ZqhdISZcqc3Of8hl7ClnfCJ9uNK29czu
	 8qjJMjbf5L1ZAhAoNZhFfL4kdMsaSg9XYJfqUABwQgaFVEG+buPWl+uSMrhcDucnC6
	 40Pwfvei/3WemTpOZRCRDi5GAo797qNEvZbbmNK2z1plwGdxckWhjdGvKeCL2/NrbR
	 npqhZAEk5SIfyr4ksowGlfrFu9YBIvHaQnNNdjM81FCfLBf/QIg9GZBoLxaH29gpdg
	 Yf8V060wqDVEK0istqFXnnYmQmJbF6pncJ9H/QfhC+m0LrITeVLX/LiYYc35E3RNFt
	 drkQCwiPEF9KQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4C1D017E1541;
	Mon,  4 Nov 2024 11:18:49 +0100 (CET)
Message-ID: <9a1ce320-e1ce-4d2f-a8d1-7680155ef71f@collabora.com>
Date: Mon, 4 Nov 2024 11:18:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] net: stmmac: dwmac-mediatek: Fix inverted logic for
 mediatek,mac-wol
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Biao Huang <biao.huang@mediatek.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: kernel@collabora.com, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
References: <20241101-mediatek-mac-wol-noninverted-v1-0-75b81808717a@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241101-mediatek-mac-wol-noninverted-v1-0-75b81808717a@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_021852_210097_354FDD2E 
X-CRM114-Status: GOOD (  18.02  )
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

Il 01/11/24 16:20, Nícolas F. R. A. Prado ha scritto:
> This series fixes the inverted handling of the mediatek,mac-wol DT
> property while keeping backward compatibility. It does so by introducing
> a new property on patch 1 and updating the driver to handle it on patch
> 2. Patch 3 adds this property on the Genio 700 EVK DT, where this issue
> was noticed, to get WOL working on that platform. Patch 4 adds the new
> property on all DTs with the MediaTek DWMAC ethernet node enabled
> and inverts the presence of mediatek,mac-wol to maintain the
> current behavior and have it match the description in the binding.
> 

Actually, I'm sure that all of these boards *do* need MAC WOL and *not* PHY WOL.

The only one I'm unsure about is MT2712, but that's an evaluation board and not
a retail product with "that kind of diffusion".

I think you can just fix the bug in the driver without getting new properties
and such. One commit, two lines.

Cheers,
Angelo

> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> Nícolas F. R. A. Prado (4):
>        net: dt-bindings: dwmac: Introduce mediatek,mac-wol-noninverted
>        net: stmmac: dwmac-mediatek: Handle non-inverted mediatek,mac-wol
>        arm64: dts: mediatek: mt8390-genio-700-evk: Enable ethernet MAC WOL
>        arm64: dts: mediatek: Add mediatek,mac-wol-noninverted to ethernet nodes
> 
>   Documentation/devicetree/bindings/net/mediatek-dwmac.yaml     | 11 +++++++++++
>   arch/arm64/boot/dts/mediatek/mt2712-evb.dts                   |  2 ++
>   arch/arm64/boot/dts/mediatek/mt8195-demo.dts                  |  2 ++
>   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts         |  1 +
>   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts        |  2 +-
>   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts |  2 ++
>   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts         |  2 +-
>   drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c          |  9 ++++++---
>   8 files changed, 26 insertions(+), 5 deletions(-)
> ---
> base-commit: c88416ba074a8913cf6d61b789dd834bbca6681c
> change-id: 20241101-mediatek-mac-wol-noninverted-198c6c404536
> 
> Best regards,



