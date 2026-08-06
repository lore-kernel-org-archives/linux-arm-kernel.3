Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3673C56205
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 12:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p02VpneCZKfAKPbd3V425RvaKg3GG4ltnmCt6pEGruE=; b=kRMWoTN1TBL/oWUcj0z/RU1wmG
	8fSUMZTVZqGgCATFlbGkreZb52kLNrmrgCUuwsnELBXReN4zHfizDqWtAUVfOOKXi43CvpkrrynHg
	Avi3uoUKLJ+P9pCns6M62bn1p2sB2l50ULirX7TRaPJWRj+yaP/g7dla1FE+y+a20wgdO3d/3j/YP
	yOynss+pLYIpbeGF7RuY/ZlIK1R2PBixA2DiezKhPHKMAdj1Pbk6oOrRj0pAjYXqxLbBC1crqITfd
	O9QcLNZqF58rI0arTouz0ADeQaX3ACt6b7Lkmo5effLJPKxPHPAlO6P7Hkvt9B3IYzWsKJTw4TWG4
	q118H8xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwwD-00000005j8H-2Ny0;
	Thu, 06 Aug 2026 12:11:05 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrww2-00000005j4m-2i9W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 12:11:03 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so1693163a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 05:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786018253; x=1786623053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p02VpneCZKfAKPbd3V425RvaKg3GG4ltnmCt6pEGruE=;
        b=pfaWOC3t2B5mRzb45uYKG1YgRxyeWm4A3W2y2uiRUFT55ptHQq1IG4bgQVg+UItf+u
         erF1aHst9TX7Z/D0oZxnEV84jF+6xIpW3ag2qo6APsd534mkyjoT3JraVKzWMrXx7nJJ
         G7DpLCDmhtrQjl6EJ6nfR9JRoIfUk/bp3xBvi0WwUosTUggHv0EDrmDFueKdut7facqe
         lFkXdFSNMqeEb21G//W1eXLSUlbD+gZSbLrbip+DDDQE5nDkxUTEwRMlviE9a0FZ2UFn
         IOYzuqE3uwG16LdIi9IjdFyzkbNfV1FZIKD5KK6674Besc2aQDce3FdcY95FZsKiS/KP
         sJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786018253; x=1786623053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p02VpneCZKfAKPbd3V425RvaKg3GG4ltnmCt6pEGruE=;
        b=ZzEigz+rfW1bBqOpx4R+jhCc2PlZQmSPLEgB89wt+AWTpMBxLVPZx8/5FkBCBg65Gs
         Ee9lpLnjtLuo57CCZ5tVIasg1teraM9uFBv6Rz3XPV2NrGF2/Z55qy8O6IE+gvmEoSPj
         UGoKCf/21dMVIZ2O549rqumxjwXA7mZfWOIZzx8Dl/oeOnssIs1BAkKksQBGjOLr0b6t
         XXNYUrNsrGkUFz6EG70sEkGw20ChIw6jAN63Ey/oeHsWc5Cizq5RbJXcJxEXIsQC2aWd
         OoAXFTBflTulPaiVs8n9MODRPL0aseXycyYbOnISzuimxRNq34kNy6eTOIEafYApAZZn
         kgjQ==
X-Forwarded-Encrypted: i=1; AHgh+RpvkcG7T1IT0evKQUTmUu9QzsaF/6Hzr1oUkUnemXsA+3BWzSXpZn7dERaUQclyXqTgCUfu3gjxnut35trAJXSR@lists.infradead.org
X-Gm-Message-State: AOJu0YwVvJq17F8F+c13h0F9s5igLf0bnlop/7HdqIdRrQLYKTJmz8L8
	Gq2OTCn7BDoGrEcHDprHaB/R8AeshAgxSAxfrv2tKQDv98URwZhjmO1T/EnNlg==
X-Gm-Gg: AR+sD11RdzVNxTkbSMiIuxK6fwEPa/SO+GVVhnCJNkAa7RZFyGbDJwfehFeOrUqlIde
	nVgjbt46m8kq97+BhV8Zvvw42B7ewta+/dKfxigCxoApOAhLjzPa8hv5baTVp+rzag1c14WcUpa
	RdqOI7HB5KZ2PkJeexmBqLgAmkFq0BmWM/n2zKvE5cjugi/5Pv/mCYljfNLunGCklWw0ngxywWp
	9PoNZG8UbL0DgtKG2w21nUsiYL5g8J05szytVS+EJDpqRUTN6Rk3u1B1mvkQbbZn1ll5PfTFr0T
	uctAOwH3jVCJtWNiKhsqiqWM09tEq0Hy8LndnL4VTh9tXCy5ZraKyotqM+UlWxU54w4z+zhczh5
	0/ARWs331ewnEFD254t4HIgvb78UBHCTNdS+/Pi3zZy3VrH8miyyxaNKchaZoaJDNZZzYJyGzkv
	zk1wgR4ta/6A7xNd2VLzXrIWctDIFAgDwbEv983St219oOjDxUhacckmRZy5cTp/Kd4QY/h+L35
	x1W+6nKrbJooAzD6HsbgsdowlmUm6AF+E5ziQ==
X-Received: by 2002:a05:6a21:9983:b0:3c3:69d0:c57c with SMTP id adf61e73a8af0-3cb8603af02mr14408140637.32.1786018253110;
        Thu, 06 Aug 2026 05:10:53 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:e1cd:daf4:8fac:b7e6:4f37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7b2sm28406824eec.19.2026.08.06.05.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 05:10:52 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/2] arm64: dts: rockchip: Fix the BT clock-names on rk3399-hugsun-x99
Date: Thu,  6 Aug 2026 09:10:38 -0300
Message-ID: <20260806121039.16967-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_051054_693789_688B8E29 
X-CRM114-Status: GOOD (  12.45  )
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

According to brcm,bluetooth.yaml, the correct clock-names to describe
an external reference clock is "txco".

Change it accordingly to fix the following dt-schema warning:

clock-names: 'oneOf' conditional failed, one must be fixed:
        ['ext_clock'] is too short
        'extclk' was expected
        'txco' was expected
        'lpo' was expected

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
index 352c8efb37e0..27ebbbc66633 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
@@ -703,7 +703,7 @@ &uart0 {
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
 		clocks = <&rk808 1>;
-		clock-names = "ext_clock";
+		clock-names = "txco";
 		device-wakeup-gpios = <&gpio2 RK_PD2 GPIO_ACTIVE_HIGH>;
 		host-wakeup-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_HIGH>;
 		shutdown-gpios = <&gpio0 RK_PB1 GPIO_ACTIVE_HIGH>;
-- 
2.43.0


