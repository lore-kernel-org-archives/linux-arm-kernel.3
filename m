Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333C5C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 11:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bMadN6VBiKEQvvZox4M1avk0HRML78KU4CFtSbLK3WM=; b=sjnpfsHwzRJZcLMEbnHBvd34Lw
	MoG2RXGlZOcUx77FkRIZ+QaT90r8AawzXUCSNYiigv89TfM23FrKiyttqZP3dPRIhnuHhIsg0Z3zN
	4foe7giWjqtJaxuTHtZzeRSIu2ZXSRDCNqtKmigizsrltcwJT061oOCoEfeyo8qxAP9KaL34U2odZ
	nwshmId2xWakQlVIkVQg+0HyRHAYhEsDoLvvaPoNZ9qxus77GOu897d3/xvwtsbUA5Aqhdmjn6IYB
	mDgWFPoYnYJHQqyP7MYupwirvhycAEWeyIQgxt92u+MpTsZym1MoZnuNn5wEaaFO4hfVEz94+qPyK
	cICEX26g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3trT-00000008rz8-2GUn;
	Tue, 08 Sep 2026 11:19:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3trS-00000008ryp-2IQ5
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 11:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=bMadN6VBiKEQvvZox4M1avk0HRML78KU4CFtSbLK3WM=; b=LdbMOPd+kvVL7VTvtUdVyO5Suf
	rTsNX+vmgMWanJkSxX3uH/YbpLUVUkk4Wqb4WnJoY2OwaSv1lx9tRcZlA2SJhiruZPdxKH5BqWNjP
	qZDVRJZPRsHP1weXz+gDH4UrQzXOmjLixXdKIeveAZSt1k7g3POrLpuCCYOnPPibPlURygTcbtqxq
	vh58cKhsKGYyJ2FYBim6Qbzv7v23mbu5lRwlnzGMNZ1ggNsKKeB5maRORa1Xt13rQSfsoopJlQCNd
	e0vPovIa02tramlgG5J+lfvo9o/E3jAxBn1/uSG77QQV0HOIU70/zsrV7mNvQOUa/iu+3EeYaPT5X
	jo8N0Uug==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3trP-0000000HKbq-0XF3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 11:19:33 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-484399babcaso366481f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 04:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788866369; x=1789471169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bMadN6VBiKEQvvZox4M1avk0HRML78KU4CFtSbLK3WM=;
        b=AF9JhU/IR58pe7w3eDczI4AY9H+JQUee9z9APaq4oCLr5BttcvOL8cYR/6K3T3vEHR
         fCup/KnqRZAeeL6RcHXUqZJrxGee5w73Q1/S8a+3nhrfmRKlcNyiUCeZ6kE+zn2lING8
         GslvXBoD5UFUdv/UZ0QsJ7Wu7rr7FzW8eHtyG1gWqPtjBaIEW3yHMHjtTPbiIXj4jf3u
         wmj+RTyuGeVxWAQ4kYRT0pd9FSiZRlLvUbvQNgM8TRsLSkCjGCLYISqmlMI/TyADpxDL
         l3fpmX575LdxSHH481mMlmuzw7v13SIsexMzbk0qegt6fYKhd4x5div98odrZqCVAPW1
         N2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788866369; x=1789471169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMadN6VBiKEQvvZox4M1avk0HRML78KU4CFtSbLK3WM=;
        b=gIoHfPtsF9GnFKtDYXrtbAg+t7AEdQKIs51SBQRcFNaBWNG07sXTrkWp+k81lKU4vt
         JV/iTcaDd7nL7bcVqxND5ToPkV0WIqp+BxR+4ducdpxgBTtvvIdEPPKC0mOhddwWw/sn
         7uy7cfatmRbVOi83d6pRoIEJcycj7CLVQ5xptXK3zRPi4rUHf9oBBnLIB/oY9L7+GGQm
         hKuTpZZBS24Lgila/gz908Lz1452wglIYNbUTaHtnsC0x9Tnljr02qgPyfUYQSiDygWG
         m3ucHgESfv+3HTDSD93beFqOSOUrZuUxAagB+Yq7Z4PWLxorS5akIvhRtfl6NEGIpUnH
         Rq5g==
X-Forwarded-Encrypted: i=1; AKwUvBzMSW9I2LlZTj6mifFik0fymmIl0RQPMOrDbo105Tua9KdtF48mwY0nybeh4Y18zA4peHxD7SI5RuKcHd4oelbd@lists.infradead.org
X-Gm-Message-State: AFuF++msJ4b16wRrSRTzD+8q97exdjJqg2NWz9OPr72ZURPzI9U4TdDO
	6GVa1wYe70JkALP0E8L36larL+oerEi45QJQ7hYYO5tgyJYP6XPR+4JF
X-Gm-Gg: AYBFou35YES7XTfXkPLJPfK+zQbsrDysOFRVsq83QFcHKTrkyJSbtJfLfCMdK4oCTSn
	FWR4rTD7yZ0PoLxQKrV2wmfZFjpCsAGc7q7g4574gusqmX/rmVBTensh1Vs7H7RygzJjGBeaojn
	bb9ZQYwp4XnotxZp/HE5zDnH5PvLshEnUQxhlsLLidp8QfsRTQVWRiTMmGEHSGP8DL7+Ke8VZxm
	AZlHCwyb99y1p3alddoQFSM+58rG7ZnaTjM8LFFCP+H54QfZrjuMClIBEbzQpPGN1T/ifMQvDdb
	/U/ehQ3lOZrguyHtgeWiNhlbJfYUcoJ4pr09oaLsc3LQ4ubwzNv0r+z/rSyrWcBg0yo+AnVCnc0
	DHpXwHV9VoUcyqEq1PvP08bqw8TdZ7bwOV7DrBA/XPyk//MF/uz4/Ysjwgc/jB9eE0Pi/Ju5H79
	tuHuKaYMi+TuKO69WPphuv08UsUoOkpVCfVbPAXaRono2LWfVXStLC4fs/a8comtuTfZ0Smnsvt
	CkGDyh64zGXzmeTpF4RslQ3GBi4ZOm2EYIwx4dfO6PByQnEMgX0aU2PHKNMMZQlpdG2
X-Received: by 2002:a05:600c:8b2e:b0:49c:cbf4:572b with SMTP id 5b1f17b1804b1-49d01dcc1fdmr173785985e9.2.1788866368697;
        Tue, 08 Sep 2026 04:19:28 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B825D009E74109367A274C5.dsl.pool.telekom.hu. [2001:4c4e:1b82:5d00:9e74:1093:67a2:74c5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm973747855e9.0.2026.09.08.04.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:19:28 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Ondrej Jirman <megi@xff.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v2] arm64: dts: rockchip: fix hym8563 interrupt pin on Orange Pi 5 Plus
Date: Tue,  8 Sep 2026 13:19:08 +0200
Message-ID: <20260908111908.19371-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_121931_275882_A9CDB825 
X-CRM114-Status: GOOD (  19.11  )
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

The interrupt line of the hym8563 RTC on the Orange Pi 5 Plus is routed
to GPIO0_C6, not GPIO0_B0. The vendor device tree uses RK_PC6 for this
pin; the mainline board file uses RK_PB0, which does not carry the RTC
interrupt on this board.

As a result the alarm interrupt never reaches the SoC, so the RTC alarm
cannot be used as a wakeup source on this board.

This was verified on the board by enabling the alarm interrupt (AIE with
AF already set, so INT# is asserted) and sampling the EXT_PORT register
of all five GPIO banks: GPIO0_C6 is the only pad that follows AIE
(high with AIE=0, low with AIE=1, in two off/on cycles), while GPIO0_B0
stays high and its interrupt counter stays at zero.

Switch the interrupt and its pinctrl entry to GPIO0_C6. The board has an
external pull-up on this open-drain line, so no internal bias is needed.

With this change the alarm interrupt is delivered while the system is
running, and the RTC wakes the SoC out of s2idle.

Fixes: 236d225e1ee7 ("arm64: dts: rockchip: Add board device tree for rk3588-orangepi-5-plus")
Cc: stable@vger.kernel.org
Assisted-by: LLM checkpatch dtbs_check
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Reviewed-by: Ondrej Jirman <megi@xff.cz>
---
Changes in v2:
- Drop the internal pull-up: the board schematic already has an external
  pull-up on this line (Ondrej Jirman). Only the pin number changes now.
- Reworded the effect paragraphs to state only what was measured; no
  functional change.
- Link to v1: https://lore.kernel.org/all/20260906181622.11991-1-royalnet026@gmail.com/

Notes for reviewers (not part of the commit message):

Measured on an Orange Pi 5 Plus. The input levels of all five GPIO banks were
read from their EXT_PORT registers via /dev/mem while toggling the alarm
interrupt enable through /sys/class/rtc/rtc0/wakealarm; GPIO0_C6 was the only
pad that followed it.

The s2idle wakeup was measured with the v1 form of this patch (same pin, but
with the internal pull-up still set): 'PM: Triggering wakeup from IRQ 52'.
With bias-disable, as posted here, I re-checked that the alarm interrupt still
increments the hym8563 interrupt count at the programmed alarm time, with no
spurious interrupts on the level-low line.

Note that on this board the resume itself can still stall later in the USB 2.0
host controllers (a separate issue reported in [1]); with those controllers
unbound the full s2idle cycle completes. It does not affect this fix.

[1] https://lore.kernel.org/all/20260907190000.s2idle-usb2-resume-royalnet026@gmail.com/

 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
index 145986695720..3f2806284754 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
@@ -189,7 +189,7 @@ &hdptxphy1 {
 
 &hym8563 {
 	interrupt-parent = <&gpio0>;
-	interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
+	interrupts = <RK_PC6 IRQ_TYPE_LEVEL_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&hym8563_int>;
 };
@@ -298,7 +298,7 @@ hdmi1_tx_on_h: hdmi1-tx-on-h {
 
 	hym8563 {
 		hym8563_int: hym8563-int {
-			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 

base-commit: 1fc5a74b108fc90951890ec513ac81869f5eaff1
-- 
2.43.0


