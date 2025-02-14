Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9846DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 08:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zPJSzB3ans/Le3b+v/iIwQk+DMI5JmC1qjWM3kVcJo=; b=qLG64P97KNCHzQ4e9ESB04n01L
	mzGh6BatRS3MxILGMoKMHNET9CnNOZxy2LSpUqbpH/X7Iz9qeBxH2/PAXXDT67yokP3j1Ze6IY8yF
	OR8fnuU+Ez/+n27VSNz8T/frLZzFHtlmnljlWD6bB7bseVjlHOE2k7LtUcbH2/4dBduhgAOE+e6vL
	aZmfZOcCW2EguMpkukXAKAwipuHbLwIHIQQWgZZUMo4yDBHNpcf5IpwZgq5N508l7jBAUYAB+mmrJ
	nByBtXv2YXn4mqVWXn1BjP96AVyHbWbcF2d/JfMFxbT0VLQNXElIw3XbqMTTQWftMozuUSY4sVhX+
	hhvisPpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqhS-0000000E3BP-1y9T;
	Fri, 14 Feb 2025 08:05:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqg1-0000000E2vS-2cs4;
	Fri, 14 Feb 2025 08:03:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 528E25C10B8;
	Fri, 14 Feb 2025 08:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA967C4CED1;
	Fri, 14 Feb 2025 08:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739520236;
	bh=ZJTleOr+aCVydGuBXvDe9vmxgmg7Hou12+O0aC141WM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rNQyXiewYUFgMh/V+W+aYjDpnFSpGmByYccCQTdDs+utzhny0WTB/CV7Pzdtk6unF
	 nIZ0LXNKlBANxtHtRqoN/q8ugYylWxYSafBFsUVmBpkTH94wGaT1JQqaZgbT+l9KDo
	 z0kzoy37mljipUA+YCzLw1g7xedqbQIcv4I7rQqsIeztYoss6AhLGzabOMvyYAeNdX
	 n5Vv4k4vXto83RiJc6QeEI8esqSmTLfSN7ncfglGEkHynuy6Xi5aZHy7icTc0oCJHf
	 +ZCpiRW6GuWfeSokxvBGKZbOttm7c0ISkKTwJcaObnz2KeSVknBe3wxh7sz+8td7SS
	 bO7KKW97He9/g==
Date: Fri, 14 Feb 2025 09:03:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>, 
	Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, upstream@airoha.com
Subject: Re: [PATCH net-next v4 11/16] dt-bindings: net: airoha: Add the NPU
 node for EN7581 SoC
Message-ID: <20250214-futuristic-goat-of-enthusiasm-bba020@krzk-bin>
References: <20250213-airoha-en7581-flowtable-offload-v4-0-b69ca16d74db@kernel.org>
 <20250213-airoha-en7581-flowtable-offload-v4-11-b69ca16d74db@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250213-airoha-en7581-flowtable-offload-v4-11-b69ca16d74db@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_000357_737347_6F66323B 
X-CRM114-Status: UNSURE (   9.84  )
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

On Thu, Feb 13, 2025 at 04:34:30PM +0100, Lorenzo Bianconi wrote:
> This patch adds the NPU document binding for EN7581 SoC.
> The Airoha Network Processor Unit (NPU) provides a configuration interface
> to implement wired and wireless hardware flow offloading programming Packet
> Processor Engine (PPE) flow table.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../devicetree/bindings/net/airoha,en7581-npu.yaml | 72 ++++++++++++++++++++++
>  1 file changed, 72 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


