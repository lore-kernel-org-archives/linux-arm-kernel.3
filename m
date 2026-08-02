Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477B9C55180
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 14:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/eSA2+uClIahrAYzEIuh8oechnt30g1zfVwZP4yV0I=; b=jJ0wy6c+p9j8MYfxTCKM4291r+
	vgbeD2nTVhjrLI8cNhkQpe38Lz59Xfnz+4uxqAfNVQ6USadjCNpwxlmRssgyZ1w74cpaVM3i8o72q
	dHC7kFhe78CENdPjT11DzZCnxDxLyZlx07JTjRnuqtMPChkKme6p63/UykvoOhlQlk6HhGNctEcMJ
	NTxGaAX4We5wWsvuyi4sglBVe2rGOPFlyXNsiVi+kzhmw6QoAHJzXqUODWMZn+s0YRCz78t+29AvS
	AkJF6zBYL4/UsBJi3x4xu1stpLsRgXlcUP03/7Xi0vLLGQlawDQDxqcyJdyXfs1+u3oUJbcRj2R5j
	g3VzjVrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqXXC-0000000FjKZ-04t6;
	Sun, 02 Aug 2026 14:51:26 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqXX9-0000000FjIG-3Scr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 14:51:24 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4956242332dso11413205e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 07:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785682282; x=1786287082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/eSA2+uClIahrAYzEIuh8oechnt30g1zfVwZP4yV0I=;
        b=bhpFker3XPmQKiXD316kL2BKFpNdejmtUP4JrjUsFLtKeXaJLYEqUqyeHDuwA7W+rC
         FUYs57NRcthiDvHJ8WFoSfAI/r497PLhqKXVxJkjY3Z85k/Az5ZNEAZqp/jtjQhKzjRh
         fOlrqEftniIABasS4UZ/y7krPQIW73nL8Wi1E+0t2CwILcke5SH53X+TPzAONfD40ndo
         ArXshOFRbQutPc+oUgzHiGqXmDx7gGZl0SKEDrv1aleBAKScoB/3Fkg50V4MU/gY6KN2
         SIcX8CHtoFk0Y0LgK2ZBGiJIuaTIc9hleQ9EVS0skncax42BPJ8ICDCfOJ8CbzJcQHGN
         pmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785682282; x=1786287082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L/eSA2+uClIahrAYzEIuh8oechnt30g1zfVwZP4yV0I=;
        b=VlBMzsL57FrSMK4Lfh28z3nafGT4fVaITo6v+PgD0/mC/o/7/M7Q6mSag/OQyh/E6W
         oRDkZ3WNHVg3WThcWeWeKdnP61ZryFPCrlKP8wmc64H7IjDBXVGvEnrY5m2YujJTHtdv
         dvevQZWQBmtuNBt+K4EQWPur400B6Ub66unwvJjp6OfDBDALRw9Owth6ZrWTw0Y+3Cxu
         NW/KfGyYDn0aLl25d06/0tDD4djvLoz7ZkEzPSTkI+5to6Uj82Nz66jytKTKHgqHWKvB
         5sR5JjUfIdJgwFxAa0vYqJG2gOsTidUA1I4B/oH7wRwDkNxVOINUDITn0entWoKiVu/e
         YgOg==
X-Forwarded-Encrypted: i=1; AHgh+RrpRMnu2ol1kmzgnaH1Sw5FT7ravjgLcAKDJrY7NbWyuWL72Hia3eKTZgGyoJ6dhgxWyxmksF6epAVX6FeLATEd@lists.infradead.org
X-Gm-Message-State: AOJu0YxCyWurWM4NDWFqVAMpYCEGlTbhkXKO45MZts5pmAc/XapWi/Df
	MBLvcY3RBMqEuQ5+HYwZ633Z5g8QskwdCj8Fuwi0paodocpxkIwm4nAo
X-Gm-Gg: AR+sD13/7zd77TcUGezaXVOFDAiuw0fpP33E18yufJxDzPXAqhihZ6OXT015fLmJHEx
	FPooU4EDRlL4FmgcfBi58ifLsTOilRih9oK+p660Z3TwpG2ONf+j942Cp0VAetiOxoF1ld1aYe0
	lVx4892mztO6csXUBD94cZF1E+Gtyf+cFsmyjhn3muW+Lrs1FpHFS2CsXJ2BeiXd0L8LNsjP5ja
	LtN1yxpiP0r6rRL0YWYEdu1xY4CjNY+8QiDuFNEleHbDG5D/vxz1tibLjysV0jjoKjtQyPaGqub
	sb6kjcF+Q1OYxSPVEMTblKu8OCw/yLT3w4IHAuQThJclvjMKGg3d1KZ4YwOLALZnfgXEEEOFYOA
	fbdoXw8+WfjJ8eyTgGTKfiinenlI4MbGmaEAz4HoI7pgQfDKD5PaILZKCOgGIDXvC2S97h7S8fX
	ESn+VguRn6apIhAqCldx8Jue485t3MeJV5LhmzP6ULTin8PzpszEPOLjg5BZuR+rLQrLl946+6i
	jzebNA3NYW0gLK10lErSAzrKdiNaxhlowNmCQlwixHhScexslnOBha4e3GAQt2O2E3zTBcbTBdZ
	6BlrpOmBeVPdrDerZMcVM/MB4zs5j52y93KdfSBML2exPvLhn5Z7frzlAnvEZsY04LZZ0om5ECd
	UxDahPsD18xEgnRbBk4KEA/qpzmKi49bU3qL0WM+dn9mXiU491Ti5yBLBUSIZ
X-Received: by 2002:a05:600c:6990:b0:495:4d00:2fc0 with SMTP id 5b1f17b1804b1-4980c673907mr146632395e9.12.1785682281800;
        Sun, 02 Aug 2026 07:51:21 -0700 (PDT)
Received: from cypher.home.roving-it.com (1.e.2.e.9.4.4.d.0.e.6.8.9.8.8.3.0.0.0.0.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4980878dcb4sm234526335e9.13.2026.08.02.07.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 07:51:21 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 2/3] arm64: dts: broadcom: bcm2712: Add thermal monitor
Date: Sun,  2 Aug 2026 15:50:53 +0100
Message-ID: <20260802145109.728793-3-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260802145109.728793-1-pbrobinson@gmail.com>
References: <20260802145109.728793-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_075123_886696_FD66B933 
X-CRM114-Status: GOOD (  12.98  )
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

The thermal sensors on the bcm2712 (rpi5) are the same
infrastructure as on the bcm2711 (rpi4) so add those
details so we can get thermal monitoring on the device
as it can get quite hot.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index ae1fc9d728c00..c73ed9e066662 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -508,6 +508,18 @@ hdmi1: hdmi@7c706400 {
 			ddc = <&ddc1>;
 			status = "disabled";
 		};
+
+		avs_monitor: avs-monitor@7d542000 {
+			compatible = "brcm,bcm2711-avs-monitor",
+						"syscon", "simple-mfd";
+			reg = <0x7d542000 0xf00>;
+			status = "okay";
+
+			thermal: thermal {
+				compatible = "brcm,bcm2711-thermal";
+				#thermal-sensor-cells = <0>;
+			};
+		};
 	};
 
 	axi: axi {
@@ -724,4 +736,24 @@ hvs: hvs@107c580000 {
 		interrupt-names = "ch0-eof", "ch1-eof", "ch2-eof";
 		status = "disabled";
 	};
+
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <1000>;
+			coefficients = <(-550) 450000>;
+			thermal-sensors = <&thermal>;
+
+			thermal_trips: trips {
+				cpu_crit: cpu-crit {
+					temperature	= <110000>;
+					hysteresis	= <0>;
+					type		= "critical";
+				};
+			};
+
+			cooling_maps: cooling-maps {
+			};
+		};
+	};
 };
-- 
2.55.0


