Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71848C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 16:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EfnSpC+DeabzkULff+AUMkf4VBlRYodyzNOftZiHnGw=; b=0onaKoVzGBFerbKXbn1fFXWv8w
	VsJvfIOYsJ0fmNKrjBSlhhVIaR0Rmd1WBYN2f9z470txN1HlmCMz5haX58UNFTfAHIcnc1HjrsE84
	zF5WF/kVXE23KhdWxcmjNje3Cy87rfH56hXFJjMduEVACTMu9kkYqqememKHgwBEw7ou1+TsZr5YZ
	u4nUss5foNBDH7oDbLoNkIuI7VKOK/PVHoqZ8OKGCxFr8DpU96t+nmzKs3U1Zf8RLcaBAn3PwY6Ny
	zfU1IoB12OA8wegvQU6O8DaZD5zeBJwpxDKCjX4aKW4MFGSJL5OrGHtt5Gy5DkNGDhzQgwGELh1NX
	dZK/d4AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBOW-00000006011-0Tel;
	Tue, 08 Jul 2025 16:42:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAaH-00000005sPa-1tTs;
	Tue, 08 Jul 2025 15:50:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751989815;
	bh=lXcwdp32iiymNLFQz/K2sNz47GpZk/42dMVTvWiz2ZQ=;
	h=From:To:Cc:Subject:Date:From;
	b=j1RQVjxwIoVnBJQKqwktgowBn2Rb1sYctGTO9LFC5kbxzwSJXNTuDeBa2c5669kxW
	 hKhorN+7Jg5tfls4P+XvkoRizppcY4MVJ/q+OVre3i0+ZecIhl9KfoGRyXDDq8iaIG
	 mD8HO5CcDiPIjj7l7RVzYpNnxsOay70RRPPvTirlgNXuJX591wiBMKCorhziCmiKEP
	 0F4JBfzKCKwB/KJb0XDjfKXkjwjqESasXscCGRyvdlyfefUI7vXbkVYFtV2FL+AukZ
	 kMjS4O6ocYfvnx4BVSeSYEukg+zhkMIdydyhUj5QJC6uFLjhUGYtqwVbE5L755M8ez
	 CIZVqx+ZdzAAQ==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2541D17E0F34;
	Tue,  8 Jul 2025 17:50:14 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Stephen Chen <stephen@radxa.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] arm64: dts: rockchip: Add UFS support on the ROCK 4D
Date: Tue,  8 Jul 2025 11:50:10 -0400
Message-ID: <20250708155010.401446-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_085017_629693_3D368C38 
X-CRM114-Status: UNSURE (   9.93  )
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

This device supports removable UFS chips, add support for it.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
index 6756403111e70..c7b65ef588bb8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
@@ -730,6 +730,10 @@ &uart0 {
 	status = "okay";
 };
 
+&ufshc {
+	status = "okay";
+};
+
 &usb_drd1_dwc3 {
 	dr_mode = "host";
 	status = "okay";
-- 
2.50.0


