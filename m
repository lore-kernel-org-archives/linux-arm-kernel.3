Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF443C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 21:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVuGYqyOCxrx0bxlw72g6Yb20FtXoXWThattOhk1oP4=; b=H0Sub9/OqMuYEPCMXWVaWHK5Ve
	+71JFvV8RlEk0+TBRBR9UjaQPxmDL3pftQMweZf5vxJNJEox8pFEihlKMtf8KMZCkEg7PtxifhCLL
	eiHuPsJ7dU8/FjqHhu3fwXCCZw7txOzofzQx1HXB+c8k9hWHWhVIP7WeGhmGqEkkYZJfOXf1v8G/4
	9c5cJ2kOJlUxIKmBy9/SyWzOjETCc+1gePzxTOlfYtuxDJBDIIRi42IJfPASZG/cS5LNaKtB8/Tdk
	7fGzAKvvWRRcNkRuUzKK+u9fKYcbbP3VxIx3MofsJtWjVqsnfPYBO5nB/BgwhfaCclSbVFaLo3aJN
	l/p+eEvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tueGL-000000076Kp-3rej;
	Tue, 18 Mar 2025 21:14:13 +0000
Received: from algol.kleine-koenig.org ([2a01:4f8:c010:8611::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tueBK-000000075se-2x8a;
	Tue, 18 Mar 2025 21:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kleine-koenig.org;
	s=2022; t=1742332140;
	bh=2HK9IF+akkeuRsTijfaoaW9JXFacNDKLeDLibhYgLkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jrYsdF20um1Z/S1pc6mMQNAdNXnVFC5IViGthUP67uj7YFI42MIZOdFRc4VPK+0R9
	 8v0pB++/Vtm7nyUrwSLqxHpl9LqNb7XzL11D3gQcdJa5miU7FWX3IW4dW4h0rvjR/N
	 GaFDKj05sqnDHQNm48y4TH0SHbCaNOi4y+9AQmpiv8JTK/X5ijzPgvnAyC4E0KM+6F
	 uYcGD11EgqXdj5jVzlWxv4urGwl5Zz/DuioJKhX6obV1ZzM2AhZHFWkl7INoNS2PJe
	 7K80SAzQtPjYAVZM7QPyfSh9fi7CUzB0yXCNxM+mmDSXg25g4o1vMJ7b1C2zIfPmBX
	 TaeBrLEz2UBHQ==
Received: by algol.kleine-koenig.org (Postfix, from userid 1000)
	id F33AAFC59B3; Tue, 18 Mar 2025 22:09:00 +0100 (CET)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To: Heiko Stuebner <heiko@sntech.de>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 1/2] arm64: dts: rockchip: Correct gmac phy address
Date: Tue, 18 Mar 2025 22:08:45 +0100
Message-ID: <6b8ef7e37e646f4cd399ceb2f46017644d76da9d.1742331667.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1742331667.git.ukleinek@kernel.org>
References: <cover.1742331667.git.ukleinek@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=857; i=uwe@kleine-koenig.org; h=from:subject:message-id; bh=2HK9IF+akkeuRsTijfaoaW9JXFacNDKLeDLibhYgLkg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn2eDgCA8hjGYQffJnJk4imvIDUZ/G4YlTrfvun cBiJ595uCuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ9ng4AAKCRCPgPtYfRL+ TiGYCACl4ARWpmgEnSX7vX8yLNRMwbUVrv5AQHzBKBvj6wIEXSp1r3WtgNECRXTapeTlOsWig6T 1LyqbUeCRX7ECmZUFSUQMp4iGztVmahm7VyuZ71O8sO3GLsasAudArdUiCoUmRg1sqxPU/7yRq0 Tu38BXnLq21WM+DKDpTQaFzi14PyVqGYe/VqyGKhkxN26pVneRnYHqJFwNaZtuOVaRBaPJQFcoz HdT3NZrIXkkx3Dp8XXMirWwoNUZkMkpiEk2olWb//L4JyBc8d2R/QF29mfPDbt/Xg18DsvajTWV VQjg1AaQiWWcKSMsTcp26FX7Xzz+nbvrTRyRClhyCObqYLc4
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_140902_917208_C3EB4EE1 
X-CRM114-Status: GOOD (  10.82  )
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

The Motorcomm Phy can be talked to on mdio broadcast address 0, but the
actuall address is 3. Adapt the reg property and node name accordingly.

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
index 7bd32d230ad2..70e88769e21c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
@@ -481,9 +481,10 @@ eeprom@56 {
 };
 
 &mdio0 {
-	rgmii_phy0: ethernet-phy@0 {
+	rgmii_phy0: ethernet-phy@3 {
+		/* Motorcomm YT8521 phy */
 		compatible = "ethernet-phy-ieee802.3-c22";
-		reg = <0x0>;
+		reg = <0x3>;
 	};
 };
 
-- 
2.47.1


