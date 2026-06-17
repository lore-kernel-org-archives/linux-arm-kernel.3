Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C81ACD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 15:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sv7WK0TLi0qOIuMOvJwU6mbH3yERNXs7/fEc4Hx4c8E=; b=R5UhSAgM5qz+/hpN4h4K8K4CgW
	07rA9Wf5M2ugOXh0sd/sNwqeoqhj2tgG8qkNIdg3Fe72KXY/CpwikAd8jMfGt+SqLLYQXiAjTRqZm
	W13iHWdA5lLD+aQIv9bZ5b6JZs9X0XmmebkdlReIbHMBtQGHXeDghlYkRhFzO+OOv2n/uQdWpCoXi
	LGbPFvNOeY1heTcNKXomlS1rAaL63vbRiJvL0ghPhDOo1pqzAZw8InJCb6FgADxZvYnYljoOs7TKe
	lhlOfp7b8OyPjItDGK6kN3NhORK1MCEhDz1cD0QI7uFi+s/tEQ1Kcg7wQ7ENxrCPUiyK+n8t1SlkP
	d1fMq1XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZsOb-0000000HZdn-0yCa;
	Wed, 17 Jun 2026 15:41:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZsOa-0000000HZdS-2jyl;
	Wed, 17 Jun 2026 15:41:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 04A9B4408A;
	Wed, 17 Jun 2026 15:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B0E1F00A3E;
	Wed, 17 Jun 2026 15:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781710899;
	bh=Sv7WK0TLi0qOIuMOvJwU6mbH3yERNXs7/fEc4Hx4c8E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aUbx83mXCE+WKkE8VV32ftbCXH0r52gqX/y897tbK6cSBbc9oFa1CUdep0NNkVDMS
	 u1jZqyq4K4DGwBLuqJiU7r/RAnQVDT3t/P+wcgUp6BkJnAAIix7vvwpwQ0iqLN0n6J
	 qyPN5BkiHdYRo8lFkwnsoyQKBT5hRQ1MotmAlsK8sL877MNk4V1bv1wgCVUxZUTbdp
	 qcWZF5PV3TnwPXfDq3bVuh+ClBEvwcJvXRfPqCkxxM068kS7C8fEWjhELds9UqdLQa
	 prIzA40cwi5BaIv+lv0yZ6bIIA8QFvcZeSCB7ACyf7gTVDTlZrM+TxumhSTupvvnz4
	 OKYIzZGXkiBJA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-omap@vger.kernel.org
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com>
References: <20260608-n-dt-bindings-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/3] dt-bindings: mfd: syscon: Tighten
 checks
Message-Id: <178171089542.1654059.1933552286028471529.b4-ty@b4>
Date: Wed, 17 Jun 2026 16:41:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Mon, 08 Jun 2026 22:44:23 +0200, Krzysztof Kozlowski wrote:
> Changes in v3:
> - Drop patch #2:
>   dt-bindings: mfd: syscon: Drop unneeded case for syscon + simple-mfd
> - Bump dtschema requirement
> - Link to v2: https://patch.msgid.link/20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com
> 
> Changes in v2:
> 1. New patches #2 and #3
> 1. Add missing part of patch #1, thus not adding Rob's Ack.
> https://lore.kernel.org/all/20260531110404.12768-3-krzysztof.kozlowski@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: mfd: syscon: Disallow simple-bus with syscon
      commit: c11c918b40295dcb0ad2460d9534454072386f4c
[2/3] dt-bindings: mfd: syscon: Drop custom select for older dtschema
      commit: f78049ca80ba2e68f7f46870b0d68eb54a6ce378

--
Lee Jones [李琼斯]


