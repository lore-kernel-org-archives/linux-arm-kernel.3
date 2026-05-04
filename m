Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124E9CD3430
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 14:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+w1luitm//CsWxQGEdc4H06+WVuZOC8TbuCR91/229M=; b=JYgHnaA4EEY3dhI4vdykJRcM0E
	WWKcXfg0PjJrEEsdw8HVaubQpShTVwnZZJ5cHx1pBdTyptrFwfDVCz3xj2pz0pW69xe6zTV9mmz+Q
	01F8JF3B+NbbPx65aOZfmpYNptX99o4KpXNwWIllQa/zOP0b3inqg4ywNf36zgMxDMhrNWE0ueo+w
	KgbTsJySIwzkGBYfMd01iaMtgOC5uHdOgBW++YrmXL8uzfVKPZ3pNc5NxKCm805OvbxIq1uli/XRN
	j1pjNJW4fSwuqyHjJsAPuG1KYUJyZUVaXiB8WHuhgGyagwO0SXAspZbSlrmwxX3G4Hlo8P083p+io
	6pzz/rBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuYe-0000000DV7O-1Oax;
	Mon, 04 May 2026 14:46:04 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuYb-0000000DV5o-2NtS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 14:46:02 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4g8PbC354Lz9trX;
	Mon,  4 May 2026 16:45:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+w1luitm//CsWxQGEdc4H06+WVuZOC8TbuCR91/229M=;
	b=HCU7wnhR3a01tXb2gPVvhk5D8sa0qwUTA7WfyfluY/fPOIZ53GxFAU8Bk+fvJ3FXMDVDHF
	b8REGQg0YXGVkaJ25CpzXfUfyjIADwFj4QqP47cf4GaVR2273qeAwQJHyADlg1z1xVPyRG
	BniKBPo8Bfu9voC/kypTJ179kvGiuSXKk3teLc5kGxXWuo+0qumX3J/DxGOmQEZMA3oAnx
	vE2lZtgYkSkmMdf9qsCld2F2H8STrMg9Zd3+8XS1OagGJ5yCEAEPE2lPKcPkrUtpP9PhZl
	XXdmPsxmAkKUA0uORpNOUI7IJI1x8n8JJW/3IVDrJDEV0c57VwQh8FdNVQTulQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=ggxet2wN;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+w1luitm//CsWxQGEdc4H06+WVuZOC8TbuCR91/229M=;
	b=ggxet2wNxVUyjK+/VsdfwiI8ssP/RBR5Tl+IFBwjvKHIJl9UiuA15zI08BOM0cqG5oFIb8
	/KstOI8HZ6IPoCGPOOZoUuCHR+o1gP7kI33DORe34nBFdOQvs9kNeV1bg8yeJdPCxn/Pgr
	UY7rnYeF9sdg/LQl/dzeM4BN7+Jy2r1XPUQdNvMr8FFayIqezGpwRbXh3LiXuUsoILcCnI
	TlAJwXVX6R5/Dd/uUd82XYTU/BZ/BzcoBxgTTxsNMQOx44cFTVcg9OGOMurKwLggsU7uoL
	EMu12nDgeVaFLtnomYToyrJvyaqfCFrZy4QhcxAcXD4riNoPUQEYZM1oP8K+dQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/7] mmc: renesas_sdhi: add R-Car M3Le compatibility string
Date: Mon,  4 May 2026 16:43:24 +0200
Message-ID: <20260504144534.43745-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 151800571d8e8c141d2
X-MBO-RS-META: 8n1w6r51ue7uqfmdhue7djdswtg8zmok
X-Rspamd-Queue-Id: 4g8PbC354Lz9trX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_074601_754478_FC455D71 
X-CRM114-Status: GOOD (  10.81  )
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

Add support for the SD Card/MMC Interface in the Renesas R-Car M3Le
(R8A779MD) SoC. R19UH0260EJ0100 Rev.1.00 , Dec 25, 2025 Notes 7.70.
indicates that HS400 mode is not supported.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Brian Masney <bmasney@redhat.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - New patch
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index f6ebb7bc7ede1..b716a518f2650 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -285,6 +285,7 @@ static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
 	{ .compatible = "renesas,sdhi-r8a77970", .data = &of_r8a77970_compatible, },
 	{ .compatible = "renesas,sdhi-r8a77990", .data = &of_r8a77990_compatible, },
 	{ .compatible = "renesas,sdhi-r8a77995", .data = &of_rcar_gen3_nohs400_compatible, },
+	{ .compatible = "renesas,sdhi-r8a779md", .data = &of_rcar_gen3_nohs400_compatible, },
 	{ .compatible = "renesas,sdhi-r9a09g011", .data = &of_rzg2l_compatible, },
 	{ .compatible = "renesas,sdhi-r9a09g057", .data = &of_rzg2l_compatible, },
 	{ .compatible = "renesas,rzg2l-sdhi", .data = &of_rzg2l_compatible, },
-- 
2.53.0


