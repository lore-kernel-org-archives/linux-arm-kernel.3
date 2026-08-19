Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB047C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 06:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dCQopc0/5gTOcyX0UlbT9zZ0g8FHrtlmJMlCKQo5u3w=; b=Ab/zoNvQAL7jntaJAD9d+4TKni
	Re1dbWwk9umHyhifQ4mouq81ZyECxNL09XB716WT00vAI6CC0hdmzQfjhwzXsL6wyryTVTnKd3CrC
	5YTKG8paJsO5MtthUZuQKsTtT95TmB71KO4SlZyAmeLN9EMIw/HcnN9VrwgGO4OIqfs+fSlsC/HSp
	+MettKUkC1DdDLIbvUKztf58eL/yHrQx40AADM512ScI9i9VNntBCyOOYgL/CCVviWhun2xIZeqJc
	TzXX6eXKcEK0cRrCRHzZkUOctM59GiMZkE9+91sKSoWs261Z1AGcnS4VA+WDY7EvRTd9dwSIUXPfQ
	S/OcUbbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwa50-000000097S2-42UP;
	Wed, 19 Aug 2026 06:47:18 +0000
Received: from flow-a7-smtp.messagingengine.com ([103.168.172.142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwa4w-000000097Qw-0Rul;
	Wed, 19 Aug 2026 06:47:18 +0000
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailflow.phl.internal (Postfix) with ESMTP id 9BCE1138031D;
	Wed, 19 Aug 2026 02:47:12 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Wed, 19 Aug 2026 02:47:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1787122032; x=1787125632; bh=dCQopc0/5g
	TOcyX0UlbT9zZ0g8FHrtlmJMlCKQo5u3w=; b=N0ZbeHuBq2Os7mlE48DAcWMTwL
	T/rHwPSV6rKFlBZd8c/nw+HO8Kzvk2+N0oFO18HvBK+LBzShYW/4yf7HfTY5GLqD
	K/RVcftGlfhawrH4iKRX42QkZ2dRBuF7OLBiyUPWZozIfu5PmZy5QpjelKYakxy+
	6KMmtwcVf+5TqJoi4R/oxFdhSuq/g7wYfKEp9KQ6ni4GpjzY6BvRQj5zL0YLypTX
	eHkof2DRyQtjpr/KldqWH/iSA1uXdQc71yNmUxUkx2lxKzOlrH2FAKRZ55bq/9u4
	7AvS62M904tr5fgWygNkI1Hk8frXTAZU/05/8x8AmQKqKkFr1Gs/AS3woyWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1787122032; x=1787125632; bh=dCQopc0/5gTOcyX0UlbT9zZ0g8FHrtlmJMl
	CKQo5u3w=; b=Yqs5but1h/B59V5N5ge29c0Fvae5vvpptVsX3vJMW0qcnJaBIzg
	G7Qgfn4y4UwiVV1LWGLkXHg2Qu+LwbxpqQc/BuqcvFKirw8TK8tP9JJnz87B6UjC
	vbMt4mgE/0cE+Ba1v+8WzUWOFeyBJ0Mf87aTJgSjjPhgzBMvZ2DYrgzLtXC4kNGH
	82/IiCEUOEvc5is1YNHctOGPos6UG12R0qQN5DNQxJP6k3ZSnKNVs+aTtWTb5R/j
	OlbQoyJyHPG6qtLaXxkuy9ja3eItdGO6mry+O1uTFFtyUf1esxuIzff6ER6d78k6
	cUgFxjKOCojRlnVVpgSPIB/3QFgJA9Xj5xA==
X-ME-Sender: <xms:cFGFatUZTp0g1G5wQBpv2NuFNL4kk2xQQc28dGNo7qkP1lutqip-rg>
    <xme:cFGFami3zq8tSlSHFbSgmsEObu4SHy6Sz5UyKmCqrrmbf5uCGRK7bRpYyrl9PT59_
    zA3D8iVMkqnFpt6eR-cdYUL_4_f3XXQ1QRZcE_HiOBaljU67sP4FpE>
X-ME-Received: <xmr:cFGFak_P5C39UIDRxA7C8Gl3CeVRCSIGVdMYkBbyJlANuPe_3Uh8cWMQplOv8JkDHkrHtHZ72w>
X-ME-Proxy-Cause: dmFkZTGhF2YcC7w/heOpjVvDG86mXkHhhhBkskNhbMZFlN5mpaikwnCyMfR6sY47/LlhhW
    cR9c2jFLYEgdhvZ8VN+0zDuUVLI3HebWpJJPWuvWjQRh7LjN+EXd4vx8QPjLLdpq27ZRBo
    MPfaxmgtGZQ90+n6Sd5nrrOWEQXhBRvxnUSRyfXzVCw06F1nm8Odw4nfXeGDWj47ZNTtY8
    sT0HxsJO6wgzCLbXTBGJiWIjnoa+3pPWG7g5YFhR/Og982o/HX/QdoY0x6CJtK5qMRlnj6
    hU5eJTMhrKLCNqE818bxloCE6D56H4BTw8lUpltlOQdONSqa6uK821DEBnkxMfsE5MHNY8
    CBdenvA5caA6kHUCgR6cz3a6D2pjGBVw096k3+46zpW8UO3z3BQbYu1qUCYAwLSjKZPMnB
    FTXOhF8WAHW5exJIIrrjkN70AP1zNZAGNVtDaNi5QDFKYigkv3fFI7J9tVfE/PVQu9X0w2
    Ruycii/C7mth2vM0LuagYtcMPDnWrhdh2iIL4dYZQLh2kjfU/Yw5o8Aj9Qlv97SDK9XYRV
    /KE8sUCPZCcCWnXcZWgJkd/wJUXMtysMWh1+1DNhxZDs10aHqA0GpJsBRPQFg7s60AlJFs
    xxlX0AeMDANtHJSoRDxflPTK/J5LmrpE6OGn4AGnw0ylPKTgZEysdYxn3ebA
X-ME-Proxy: <xmx:cFGFagaA8rLGsxZQmjR9uGILNe325dnc2eqqQj2LzxP12pGgzN8Miw>
    <xmx:cFGFaj1BkZKv6-GnGF2jmw5mene2BLujxDslosJhy9SqCE7l0tyuLQ>
    <xmx:cFGFarYEn9aHlq5DwVQj_yXnH4nkCPqDCQu8aPZlpNOWa2VwTUk9OQ>
    <xmx:cFGFarJULtJ7GT3fvxu0YDhNBUBRwNtY2PzdMAj_GMtL9eLE9PWa8g>
    <xmx:cFGFanYPmAygGr1AQ3wiT_jAMz-tn2JqI66ShE6xZsrESUTB8cDAfsCZ>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Aug 2026 02:47:10 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: fix an error and a typo in the CM5-IO comment
Date: Wed, 19 Aug 2026 18:47:07 +1200
Message-ID: <20260819064707.1667292-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_234714_915122_8900A320 
X-CRM114-Status: GOOD (  10.80  )
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

Two mistakes in the CM5-IO header comment.

The USB-C line names combphy0, but combphy0 is the M.2 PCIe lane, as the
comment above &combphy0_ps says. The USB-C SuperSpeed path is the USBDP
PHY.

The USB-A count is also wrong: the carrier has four ports, not two. The
RTS5411S USB 3.0 hub fans the single USB3 lane out to four downstream
USB-A ports.

Comment only, no functional change.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
index ebb231271..335963227 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
@@ -5,8 +5,8 @@
  * Carrier provides:
  *   - Full-size HDMI 2.1 (HDMI TX via HDPTX PHY)
  *   - Gigabit Ethernet RJ45 (GMAC0 + on-module YT8531)
- *   - 2x USB-A behind a USB3 hub (combphy1 + u2phy1)
- *   - USB-C with PD/altmode (FUSB302 on i2c0, combphy0 + USBDP PHY)
+ *   - 4x USB-A behind a USB3 hub (combphy1 + u2phy1)
+ *   - USB-C with PD/altmode (FUSB302 on i2c0, USBDP PHY)
  *   - M.2 PCIe 2.0 x1 slot (combphy0 as PCIe lane)
  *   - microSD card slot
  *   - Green/red status LEDs, 40-pin RPi-compatible header
-- 
2.43.0


