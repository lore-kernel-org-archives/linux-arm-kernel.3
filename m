Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CB0D59F44
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 22:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=750ln4d5IZ+5twsG5klcrtotTQHvrYbgJe5RP9Qdpfk=; b=LcAwk4RLbCjASYN4z0l8G6m/G2
	Gq/AAWXYZJvVSEKFss7APN1qiyIsfp2GyyUxFw/pZmT5hrZAzOi47knIfcDlPjiHrWjzUHfrffwmY
	5Ee0QZ/1kSM4MI3e7O6NOcLAzmXvaT58kzyHFzUmzl5KgcKCArE1htWUH+Zu69UpWhytJlm0dhMMC
	f6tCO07Nsy2fFubMnglF13sL02CBEy0F/mu/cwtQ0jsFKS7ESzVTQEKMJG9DXE/9RlbT8tX+JxPtq
	AZO2VHvBx7DrAq85XpvOvnJt6pIojVn9ppqekkEDHa6cN2NWRB+5L1TrmselqKql16xKPNfPOoI16
	JcDN0NYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUBDb-000000018Su-0PZI;
	Fri, 12 Dec 2025 22:02:31 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUBDY-000000018SI-0k8D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 22:02:29 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id E300D240103
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 23:02:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1765576944; bh=750ln4d5IZ+5twsG5klcrtotTQHvrYbgJe5RP9Qdpfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=bzVvM2e8Gea+qx5rdLE5QGllabmTMstWgWUcVFNe3oqv9SBq6UB54wNhxC8LIsqza
	 v8Ai3PIOtsEmze425tkEFdLgM/gEHd18OEdwJTluPqWATXiSJ3bHBYJKMV6j+kewWu
	 fRjYu931PtKNRK69lAmpkyHVe8Yp//i5ffMG4REaL3dox4QYXuUEUn/KmkvWfDhzJl
	 lhZwzvUDoCzRQvELQPbt2zCwXazAPo2hcJyIRFeAMH4mdK/hcgqc5k+K7TOp/nGkMq
	 G6tm9pnPkW8a54EOu/2hSP2XnFErAh36niRdBH9zIdT9xWZpRB57NjKr0t3nRJ/mxr
	 GTzQo7sZZF7wA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4dSk2l69Nsz9rxL;
	Fri, 12 Dec 2025 23:02:23 +0100 (CET)
From: Adrian Kossmann <adrian.kossmann@posteo.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Adrian Kossmann <adrian.kossmann@posteo.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: rockchip: Adjust RGMII TXD/RXD delays for the Rock Pi E
Date: Fri, 12 Dec 2025 22:02:24 +0000
Message-ID: <20251212220151.574860-1-adrian.kossmann@posteo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_140228_356683_F707439A 
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

Current RGMII TXD/RXD delay results in link instability
under load, with throughput eventually dropping to zero.
Adjust the RGMII TXD/RXD delay values for stable link
under load and stable Gigabit throughput

Signed-off-by: Adrian Kossmann <adrian.kossmann@posteo.de>
---
Changes in v2:
- Changed the patch subject as the last one contained
  incorrect changes
- Drop incorrect PHY compatible string change from v1
- Adjustments to RGMII RX/TX delay values
- Link to v1: https://lore.kernel.org/linux-rockchip/20251209210658.458506-2-adrian.kossmann@posteo.de/

 arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts b/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts
index a4bdd87d0729..29ff0b8b8f18 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts
@@ -153,8 +153,8 @@ &gmac2io {
 	phy-supply = <&vcc_io>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&rgmiim1_pins>;
-	tx_delay = <0x26>;
-	rx_delay = <0x11>;
+	tx_delay = <0x1a>;
+	rx_delay = <0x14>;
 	status = "okay";
 
 	mdio {
-- 
2.52.0


