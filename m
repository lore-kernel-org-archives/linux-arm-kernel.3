Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AE3CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 13:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPO9NrD7t7ozHNmv9SwKBa5YjnO0HgIRT0temEkfh70=; b=bYwrI9N8pj54t7sSv9P1D70tR7
	sx015+l7Sg/9uJ3XDhn2ubn0jQSezLdrdgyTqvIoQtZWzC7KpH0DnnP0NZ6kD98um6wfWANfMTCh9
	HRyJ8CiV8Cl4uwryN3s82KtVLvqvO/4M+oQtTHaoRjJv9u7BOoMoWQ0TCpzB7unNXi7DxaY7kpQOd
	iW/+d5JjuG0SZMETKbOIsI1dmsaMKNdsFmpzhnc68rTUeSbjzBBdG845sShvjUZCYkAS057dY0v+y
	fjoloM35S/N/n2d5RU+sb/Fu5FIx2HZfJf4o6YgABkVsJLQKBV7WA+qFrcYoz9lCrlQYhsUSTOS6h
	C2ehK26Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKd8v-0000000EhvN-1p7t;
	Sun, 16 Nov 2025 13:50:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKd8r-0000000EhtU-2bJk;
	Sun, 16 Nov 2025 13:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BPO9NrD7t7ozHNmv9SwKBa5YjnO0HgIRT0temEkfh70=; b=TpS+xd3M3g9s19Oc3mWs8VSFZ7
	rTez3qB38WehkMBkoW8THvSKvFRHZxTNASMmQKVS2Zb7WPd3YNLhVIQM5lRmZWUrut2X8UvbZrgr9
	UeTBYGWpx3KVSoD3mvAlIsYFtISjMmx1Fq/iyVBBOqesB+w++9Cujf0dqQlPgn9k3n1+w0BDtUz3/
	cJ3J++L9OJlHLoycXbzafXG+R5sjAby3MntDfhSUvb726AifmCBoupuARHmrI0xzxbli7Pz1PvUi2
	BqBcu96Yxh8F98wB6TU6fi/2ni+K937QSf6s/9vBajqAbCQfpx6KBcfhjAZl7B/GnK9+VkMIY5X3o
	STp9ChwQ==;
Received: from s2.avantea.pl ([46.242.128.95])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcHA-00000005MJ6-2aWm;
	Sun, 16 Nov 2025 12:54:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BPO9NrD7t7ozHNmv9SwKBa5YjnO0HgIRT0temEkfh70=; b=Gg+j1iN23n1xHJQNAyHu8/3ZYX
	XvHAhG3jyG1PpNQAeLFit19IsBKmN86Nb2Zyj5mlmQkN2/V005zWuP9lJbWs5szW7dntwRKci25Xc
	c86GTd+4URPW9Mo7oXm5Sfkv8k8oY7nGo8rMz1N0tUjMYdn9vdkMweUcgWvaIVAvQHK9tYfGnUX94
	bXBBYvqTqs9NayEiTXczKmSDDVG3UFmu6qGReiG59Z6aVEj0iNS4ri6YivZmggmB67Nw9jVLEwHhQ
	JRi/6HGoJ6M6S92GuxSn3ccsNEg1WnZLCse3sTRbfjw8AUN/t95E8QktjTbPWLOUtP7h9KbunJBhd
	wuHQycew==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1vKd8k-0000000FXVf-3tGq;
	Sun, 16 Nov 2025 14:50:03 +0100
From: =?UTF-8?q?Kuba=20Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
To: Maxime Ripard <mripard@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	parthiban@linumiz.com,
	paulk@sys-base.io
Subject: [PATCH v3 5/6] riscv: dts: allwinner: d1s-t113: Add D-PHY to TCON LCD0
Date: Sun, 16 Nov 2025 14:49:57 +0100
Message-Id: <20251116134957.447529-1-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251116134609.447043-1-kuba@szczodrzynski.pl>
References: <20251116134609.447043-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_125440_817793_54BFF0BF 
X-CRM114-Status: UNSURE (   8.61  )
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

The sun4i TCON needs a reference to the D-PHY in order to support LVDS
on Allwinner D1s/T113.

Add phys and phy-names to sunxi-d1s-t113 common device tree.

Signed-off-by: Kuba Szczodrzyński <kuba@szczodrzynski.pl>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 63e252b44..78aa61607 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -876,6 +876,8 @@ tcon_lcd0: lcd-controller@5461000 {
 			resets = <&ccu RST_BUS_TCON_LCD0>,
 				 <&ccu RST_BUS_LVDS0>;
 			reset-names = "lcd", "lvds";
+			phys = <&dphy>;
+			phy-names = "combo-phy";
 			#clock-cells = <0>;
 
 			ports {
-- 
2.25.1


