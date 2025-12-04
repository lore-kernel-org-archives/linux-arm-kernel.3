Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5FAD20697
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 13:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wQ25eK9rtOdDvZ2WDSfbjIg4nCUaaXpwfzi5L9+e/I=; b=douJt5vXJcN/6i9Qi05WQEtrqL
	4UePyU9nUzjt+hCGcOBV26Pf628xbWoX2RbthpIeQud90VHRGOf6H9drazsq4IvLVJjuOGltGSD2C
	kuATKoFD3BISxpVHItLcBbWaBV1KZBlDnpgsM5CkHXTnWqMhbFejcZtmnJiw3uF7xYp0+gXqbzeLj
	veAVOlJSaeC9+DkLHbis73nANlEQnIP93wL7d8dM6PMm4sibIj1LS2i2W1zizocPFjUtR0GEvePFD
	RY4Xp3zs0v6wp2dLtezXPrSSZ/WA2H90efUefcOPg/b+W/32lnkEdwxu/O5V0wco44ynoHIQJWxXB
	ZbsNQ5bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9bb-000000084ZD-28IL;
	Thu, 04 Dec 2025 13:42:47 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9bU-000000084Sq-2iV2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 13:42:44 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id EC3AA1FBD6;
	Thu,  4 Dec 2025 14:42:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1764855751;
	bh=8wQ25eK9rtOdDvZ2WDSfbjIg4nCUaaXpwfzi5L9+e/I=; h=From:To:Subject;
	b=jBMICrEUga+Tmai9JqyaffuG3B+H3RxltATzFlCLD4thSX3Wfk4YhUx1FR2xehK0o
	 QQrdq1C0gAHWMqSPye/yQAq0PEQd8vNKSS5O7W3Ibz8BttpKG7GyzeetPHmINYHU8L
	 Q8UYpNAC59WhpPb3McpnfC5tNyWTk7Co7zKp9NJj8nXyjbVkUVPi5pWqm1Qy6FUrzC
	 neBkQQWc2FTyXbsP2D2IdFvfGGVcoyYuSbyhF7CN9GpPdnBK7gy8ThQMdks6NeB03k
	 axf+hj3o8w3Du7MCKF5gho/UbxRmU5+/rNMQOtqZXlRUY5HruXOW3ED1nxe02A5ONG
	 N7hvX0HFTmFhQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] arm64: dts: ti: k3-am69-aquila-dev: Fix USB-C Sink PDO
Date: Thu,  4 Dec 2025 14:42:18 +0100
Message-ID: <20251204134220.129304-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204134220.129304-1-francesco@dolcini.it>
References: <20251204134220.129304-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_054243_064782_03D167AC 
X-CRM114-Status: UNSURE (   9.92  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Change USB-C Sink PDO and the amount of power that the device can sink
to zero to maximize compatibility with other USB peers (the Aquila
Development Board is not sinking any current, it is self powered).

Fixes: 39ac6623b1d8 ("arm64: dts: ti: Add Aquila AM69 Support")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts b/arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts
index c7ce804eac70..f48601ae38b7 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts
@@ -399,8 +399,8 @@ connector {
 			try-power-role = "sink";
 			self-powered;
 			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			op-sink-microwatt = <1000000>;
+			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <0>;
 
 			ports {
 				#address-cells = <1>;
-- 
2.47.3


