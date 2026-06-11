Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F6CCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 01:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1aX965CQukLCI1Qo1GktUQYfgY2SwoR7uedgK0lphqw=; b=DwN9NtCGUqNJwepg4Bz+oJM1R8
	jy6pLz9YoewlXUoqA4Ylnt6Kqj+k8AR5ZLB35gqtNGd65KN8n9INP6iKUdDlX6E8ancE1bLsdv/CD
	VkiKHOItg7W/q4/6Z85jmuhJM79mCSXdm1PpMRdRCT6uNpAhfaNun0JeDn6XNUyczPG4A/wse5dg/
	C00wTHEoVUgmXDwM2yAwqJMxDSGYkWWsshmCxXqNNJqeYIaeI3lUiW+vfY+iuK1uIQjiawJAwc5tj
	CwZIUrs8xsyTdzvUftjDqzmWVBi/5IghYrvKnJPYKSMKekyU+rKmkspS3Is2uxtZAxc3cjDjyZshj
	Eaq+sCdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXTmV-00000008VtS-3gEP;
	Thu, 11 Jun 2026 01:00:27 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXTmR-00000008Vt2-44AZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 01:00:25 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gbPSz00VRz9vNd;
	Thu, 11 Jun 2026 03:00:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781139619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1aX965CQukLCI1Qo1GktUQYfgY2SwoR7uedgK0lphqw=;
	b=PjjQcqlNBL/NM4aa4Qnqov9PNKb2hAYKOq4vrwCrkzrdIOag4K9EbMKxNGlsZBFMfbx7z6
	2mHxFK79hhBp0Uo1N7VTsUhPt+Pb4qiX2PkMg6MSD/cZB09ATS/KBv/A1Lex47hoBU2L+R
	Du8m5/43WdPJgR55HWn/1/ogCOfaCkwD13gWBZ5vdVCkkuqSwA06I2Z2/9DvtCL1dPaBp1
	LfqKCXoU/0CoRWYWBBBgVC3tjO1sKrrmVZDPl2yz2t4rClViVFFoL2Uc8dyYPJ/JKWQrhm
	FZ3AtiGqoCtn4cU3XxHSaA29geHSqO+P7qIYgm96C5GvvFqFVMMYkaHu/uvD7Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=tyGggic0;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781139617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1aX965CQukLCI1Qo1GktUQYfgY2SwoR7uedgK0lphqw=;
	b=tyGggic0YnscO44Vj+ppbuM0zhnC3fz5NVGdsymk0TSpHVL710q93YGYBYTY3/EChkKwLi
	0QlGu+g5tatVuoP0TyJv5ajScj+6S8yjyUvQhjDkFVBoby/dLFrSYlO+EEkEdHGoUt4YCR
	/cebDBWASBXS7OjC+TwmVmD4dSiqw19AQttRxlbvYnTYxTlGlr2An4PzHH4yG31rE4THmW
	CULd0db219ZCwmOeN3YIQDPVIEMEO7LXulsVnAIGvttV5UdSC61hBbo67TOvhZTsRrGatN
	CKyW963cn8dAzemPkxcPBlu2mRubR978XFLvwAav5qZyBeBsIX+7AmpUyoI9lg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: renesas: r8a77965-salvator-x: Enable GPU support
Date: Thu, 11 Jun 2026 02:57:29 +0200
Message-ID: <20260611005952.146825-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5umjyam7fxaw386rcihnthbewtayxad7
X-MBO-RS-ID: 07aa668f81783f80a0d
X-Rspamd-Queue-Id: 4gbPSz00VRz9vNd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_180024_176625_3224F8FB 
X-CRM114-Status: UNSURE (   8.41  )
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

Enable GPU on Salvator-X with R-Car M3-N.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts
index f84c64ed4df7b..af8cfdccd2103 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts
@@ -30,3 +30,7 @@ &du {
 	clock-names = "du.0", "du.1", "du.3",
 		      "dclkin.0", "dclkin.1", "dclkin.3";
 };
+
+&gpu {
+	status = "okay";
+};
-- 
2.53.0


