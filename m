Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387BCC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 16:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OnPJY1YmRTCsjsI68pp1t+5Ummz4CbGGB5KW9cC+vdo=; b=u4oNC7lPK4DPDUe3/S3JRlRFra
	B80ytUlb3w6Ixh4jc9g7vEtW8kcGQwO6G/U1rV86jyD05W5z9P8VBO2iENIjZSCqzKFeEGKdUlWmD
	cQ4EEksQQ7+h1YY0zgD1lFFXj5yFkyf9vB6PxRMfOTCeLwigDUCj5tjfWUBTxduIXBBC8ifKgSw8s
	tkrZYC7k1cLI5BFVujoPxWeeTUYS9Vwt23qIG/Op1UhI4hqhAc35hT+t+fuYfi+wm934l37lGXhPx
	Lh2WqnpekRN7xCOgrcIEqdZ43hzuOvQAzbaAo0m/4Yoeu7x0wZeexWCBWd2H/vlQ1wVrTfS9dCCXj
	yY11PlmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVmJ-000000069Qw-3POq;
	Fri, 21 Feb 2025 16:21:27 +0000
Received: from s2.avantea.pl ([46.242.128.95])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVj2-000000068Iy-3EeK;
	Fri, 21 Feb 2025 16:18:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OnPJY1YmRTCsjsI68pp1t+5Ummz4CbGGB5KW9cC+vdo=; b=jzbgJ3N3bGi56lsr6UvckXM0yt
	yZOXDH4GRVzsBSgeNrr3aBGqiQwQpnU+4IOO/q1NKQxN6McMD2th6RTZnA7fUQVEU7Rxrld3qW7vX
	ejKqNS26vNC8GtFfck9M2CYKWAsz2UOfunS4M2CANjzsXU70trqtOsAVu6un+D38bSdy82YXFAVQ3
	CkCGDCpkLZrkQJCaiVqGu77keQZ+QWdamB/o8fAurdj+gSQTNHqyQbNr1JBSAjXjdL1ievKPNltPF
	vee2wFsY616tA0+8+f9+zbWVlSvCCkOZsDqYjM3u1vBdB2yS0njabCEcgYeR1r8sfhX5vVManuZKd
	TW3xjTWQ==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96-58-g4e9ed49f8)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1tlViw-00AOLX-2K;
	Fri, 21 Feb 2025 17:17:58 +0100
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
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] riscv: dts: allwinner: d1s-t113: Add D-PHY to TCON LCD0
Date: Fri, 21 Feb 2025 17:17:50 +0100
Message-Id: <20250221161751.1278049-5-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_081804_975699_45315CA0 
X-CRM114-Status: UNSURE (   8.48  )
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

Signed-off-by: Kuba Szczodrzyński <kuba@szczodrzynski.pl>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index e4175adb0..d241ba306 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -828,6 +828,8 @@ tcon_lcd0: lcd-controller@5461000 {
 			resets = <&ccu RST_BUS_TCON_LCD0>,
 				 <&ccu RST_BUS_LVDS0>;
 			reset-names = "lcd", "lvds";
+			phys = <&dphy>;
+			phy-names = "dphy";
 			#clock-cells = <0>;
 
 			ports {
-- 
2.25.1


