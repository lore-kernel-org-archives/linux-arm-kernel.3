Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD46CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 13:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Go6dZDillkE7ZYEa8i+61rrCqPsVJA3sA1UCW5TWE8w=; b=BGz01QlQ3bUKL55Xx+MmukhO2y
	RzZ62ALEqo5WE155ROO6HGdVkRg+Dw9HRN3ybzZT5BLWB0uSmgDUawRmiXRAJTNIVkB4T0CA/e+v6
	UvbNwaVtAtCrv+kDeOoaWrllzu2L4ugxrfQ9wN5+4x8dmbbw0MXE5H78gA36RC8fJfh/si/3hm1BP
	skC8xMEH9WitT14ISjKEwQ/JzQFVLjaj/F6Hipoufrc6Pm2479huOjG2TDY9JsbuQqWl71NU6MDqI
	W6GkRT8j/kiw3UDvvMNVH3njYGRWvzu0yneGH/PPvDrTA2NAatSXpehHOM7M0BZkaIqt4Xb9pKUW6
	qIWmLkDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8IUY-0000000DDE6-2FSj;
	Mon, 13 Oct 2025 13:21:34 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8IUX-0000000DDB1-0efR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 13:21:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Go6dZDillkE7ZYEa8i+61rrCqPsVJA3sA1UCW5TWE8w=; b=pi7OzHtWaoPTtUbxjGhS4RJQSb
	mf20QGptUwt7hzhoRvxnW9/CRC5cnAMX4etuBKdCVgsr2Vw1Hz/Q9U79r6p2TxLH9TDge88Wewe+m
	hx0k4cZbdBi+GuHdnrHSl4bjVeTO4l1uXuAg+iXGngnb7JZKfGAGIoipKBoWMW3a1Hl4deuwu/VX+
	pTMgydDbFtqZxfR/jYxlUPmcVthGt9XTH5GgrlIEoq/aTUSdWTCyH3FoujIYxC54uSE+XtVXBNeKG
	Kn0KSJeeq80896B21Zp/6/QkoSdfeV8CUbQtyrnKwzelg1yT1MVOqAlVUwgoaSB38osjzssrKX7NC
	hn5s1Qfg==;
Received: from [122.175.9.182] (port=32887 helo=cypher.couthit.local)
	by server.couthit.com with esmtpa (Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1v8ITn-00000004Tvv-2UOs;
	Mon, 13 Oct 2025 09:20:48 -0400
From: Parvathi Pudi <parvathi@couthit.com>
To: linux@armlinux.org.uk,
	ardb@kernel.org,
	ebiggers@kernel.org,
	krzysztof.kozlowski@linaro.org,
	claudiu.beznea@tuxon.dev,
	arnd@arndb.de,
	geert+renesas@glider.be,
	tiwai@suse.de,
	lumag@kernel.org,
	kory.maincent@bootlin.com,
	parvathi@couthit.com,
	kuninori.morimoto.gx@renesas.com,
	Ryan.Wanner@microchip.com,
	andre.draszik@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	twoerner@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	danishanwar@ti.com,
	pratheesh@ti.com,
	prajith@ti.com,
	vigneshr@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	krishna@couthit.com,
	mohan@couthit.com,
	pmohan@couthit.com,
	basharath@couthit.com
Subject: [PATCH] arm: multi_v7_defconfig: Enable TI_PRUSS and TI_PRUETH kernel modules
Date: Mon, 13 Oct 2025 18:50:25 +0530
Message-ID: <20251013132025.1436138-1-parvathi@couthit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: parvathi@couthit.com
X-Authenticated-Sender: server.couthit.com: parvathi@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_062133_215926_B00D7B5D 
X-CRM114-Status: UNSURE (   4.09  )
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

The Programmable Real-time Unit and Industrial Communication Subsystem
Megabit (ICSSM) is a microcontroller subsystem in TI SoCs such as
AM57x, AM437x, and AM335x. It provides real-time processing
capabilities for industrial communication and custom peripheral interfaces.

Currently, IDKs based on AM57x, AM437x, and AM335x use the ICSSM driver
for PRU Ethernet functionality.

This patch enables TI_PRUSS and TI_PRUETH as kernel modules for AM57x,
AM437x and AM335x SoCs.

Reviewed-by: Mohan Reddy Putluru <pmohan@couthit.com>
Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 12f706e2ded5..7f1fa9dd88c9 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -281,6 +281,8 @@ CONFIG_TI_CPSW_SWITCHDEV=y
 CONFIG_TI_CPTS=y
 CONFIG_TI_KEYSTONE_NETCP=y
 CONFIG_TI_KEYSTONE_NETCP_ETHSS=y
+CONFIG_TI_PRUSS=m
+CONFIG_TI_PRUETH=m
 CONFIG_XILINX_EMACLITE=y
 CONFIG_SFP=m
 CONFIG_BROADCOM_PHY=y
-- 
2.43.0


