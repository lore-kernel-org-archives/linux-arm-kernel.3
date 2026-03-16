Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E63DF53D67
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 15:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c153/eFSK0FoXSdZJ7Uwh5iF9H38b6f8SrCMH7YVoKw=; b=PvlhDt6UNTBCLEJpMGWB9m86MD
	OzqszFgR+2v/3TI1hj2BiYK7vyhIYLpIz553UROJ4d9+TDEyw1DUW56vQ2OLei9LcU23MvF3lA86f
	J1+0KxoR5KZMKFARo963MYlVX07NFpg3dMIz2+HC1HhLfUArtrgiWUQbg80C7Epa1mkdDBGQyItZB
	wyG4T29uibLrWzQIaFo7nu1nSEKkxjBDU1BBBKcRYtO/WE8kHLRTdFpLEUP6kzmG3f5vafXS/pI4D
	9nlT2//rPpun+wBuR7qt/w1SNrwoDvjycGPYIK1fGZBeStrIOtp1XpHook6xRTmT+IBoLhSc2ZuRj
	DCeOAOOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29Vx-00000004Hwr-1KWX;
	Mon, 16 Mar 2026 15:05:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29Vu-00000004HvU-16l4
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 15:05:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=c153/eFSK0FoXSdZJ7Uwh5iF9H38b6f8SrCMH7YVoKw=; b=qiKJnEFlluhkYazc/KuUkU7YBp
	qWq0Z61EZHjtsItc5AStRY0QN0PYRJ3AQwhHDPit25Hr8whNmtMmrKdsLeOYlHuRHrs8zlRTSKzFU
	OWlCfTY2Ynlz1c6MCWLFUXTkfMnpWTWlxf/+Xvqv9Xvj0gmDOFvjGehrD0/NnJ7WPHSctzXXtx0Ao
	/cJc237CDoCxUh8hSADwZXX25EQqxihTN2wXmt87IiDVZk3iU2CkiDEoYQydO5WIwv3kvDGHY1SoR
	ZxgGCXmiV/iC7hUwKHx4eLCdzxQ27Wcs65zv3GnZdYVpuzB/Vv6jrACLjHlY4pur0FE1kEA08n7HX
	KiGqdKaQ==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29Vr-000000071wm-16iI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 15:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=c153/eFSK0FoXSdZJ7Uwh5iF9H38b6f8SrCMH7YVoKw=; b=aM7jRrDTNCBq7tx9aNC0o66TxY
	bbfhkgbmbbHnCnCruGuyVdZyjObN8rUi5WETCa5C5fSGy4ixkw4Ux4txILuJXU4opZCLZCKGoKhDC
	t1gjfsnjCCOxvAaXu8YZobV2TLpJv3Wn3fEJ/IaWuJoy2deM9qfSWPgawlFmVM7ouX9dULrSEBIL/
	EaNTcwFEwHW7e8O/8YK+Sv0EV+hsiAyYCST33R4Kb0o66fCiaNion8NQFCezsXL+yi10OHibYs7Tk
	kyVgG+F74U9bmx9QSyvDZnGWzYg2CEqxuSXBibbpwkotQi9IVZY/scG0k3wjQgFqPfOwStI02HyCU
	0N1AiCPQ==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w29Vq-0009Lr-0I;
	Mon, 16 Mar 2026 16:05:46 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w29Vo-0003GC-21;
	Mon, 16 Mar 2026 16:05:45 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/3] arm64: defconfig: enable EMC2305 driver
Date: Mon, 16 Mar 2026 16:04:53 +0100
Message-ID: <20260316150535.786122-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316150535.786122-1-alexander.stein@ew.tq-group.com>
References: <20260316150535.786122-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27942/Mon Mar 16 07:24:14 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_150547_395278_49F86380 
X-CRM114-Status: UNSURE (   8.19  )
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

EMC2301 is used on MBa95xxCA mainboard.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4bfd712f9144e..c4586e7061107 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -754,6 +754,7 @@ CONFIG_SENSORS_MACSMC_HWMON=m
 CONFIG_SENSORS_LM75=m
 CONFIG_SENSORS_LM90=m
 CONFIG_SENSORS_PWM_FAN=m
+CONFIG_SENSORS_EMC2305=m
 CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SA67MCU=m
 CONFIG_SENSORS_SL28CPLD=m
-- 
2.43.0


