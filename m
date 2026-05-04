Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7924ECD3430
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 14:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ti6+6uIrTc5CzZkQNK/RyPsBVgyhMVMZ6DVEhtAUyM4=; b=gGzyzT8BP8s+Ai1nr2ov0AUYSe
	ah8xKlMexSRk1u0aplM6DcffD4OFJS3FdWL65HOQG0hDCyRp9j3sCgBV+spUc8KceBSasiSDswliL
	jx6lNgxG8ARUk7ZCUtLpd4vQbpmHji835ylLo/gowbQa++2LpsNJhqfubAcgfvNt6fKqlH/MWrvrL
	ZBc6sVqkVuBLxVCewLlwekYpKJO3FehfXvuqpsQ96kp3eeK0cAv8JfPHZ99d7ZRdaJ1uNYShgCf/G
	RHeVcwWA44rm7XvATDl32fihPGlXbxYbR5mTW1erHPpSTytI3eoTM4giWT/fI2maSK3vfKgOaYb8p
	p+CAXtgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuYZ-0000000DV4i-03gF;
	Mon, 04 May 2026 14:45:59 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuYX-0000000DV3V-0KBD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 14:45:58 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g8Pb66yCSz9tl2;
	Mon,  4 May 2026 16:45:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ti6+6uIrTc5CzZkQNK/RyPsBVgyhMVMZ6DVEhtAUyM4=;
	b=ZzocibSkSJwYaMpcpIa7suU2w5hQa53/TtJdJlwndwftRamxnqorL2TROZHz7Ypodj09Or
	5MmkMDloJ3wFdHplzhKkUDCsEsS06aTn19j1iHtcC/sO9TfeqnRNFc44HnlWSdu/odQ4RA
	vnvKhgKDobGrU0N3oiuShMwqO0ZYq+l8TPPELx//nI9Epa8VenboYA6Stzc2yuwIP8aB3P
	vVhtKbitUF4aw7Ej+OkNz2G4lgviB+sW8Q9Uq0yZgjylUOT5FEDsUTOa5jeS/Y5Vf/62mV
	zsvHN1kO/XbU2z2wodqYoRRDoEkyMSYv4g95c7gzWlEsB4Z7JkLG58DnX4KGtg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=E85YcZAd;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ti6+6uIrTc5CzZkQNK/RyPsBVgyhMVMZ6DVEhtAUyM4=;
	b=E85YcZAdsc+IDPoa4cHnVBRieUN0zQvJm9WunIjlAs1zxiemYUkicN5y2+5cc8Jgb/oq86
	KuYAxsalW7awZVBZRFoiTHM6y4LvPIK6g5PDoYF38af3ZsDSb+V7z7IKOyJSpR9wCENP2x
	zuXJ/gzwO3RUore4EilZeG/ahBMPIB/1D+4iKctsE6hs5EpfzH/cbeN3jwKJXsSbUuDqGc
	68DMby9lGb/xMeYhTKv1bFxgb1Qq7bL1zNhj6sticMvXFqg7GxG0UigWPyaG5bUXhesLdo
	yF4GIO2nzvvRPEpBgXAKUSUhkyBWn1o3XYp/5jTUjmQMbjKLzLVJGblK0kLafw==
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
Subject: [PATCH v2 1/7] dt-bindings: mmc: renesas,sdhi: Document R-Car M3Le support
Date: Mon,  4 May 2026 16:43:23 +0200
Message-ID: <20260504144534.43745-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: o751foihtp4ir9r3w7n7idypuxjneeym
X-MBO-RS-ID: 033870584481e9df80b
X-Rspamd-Queue-Id: 4g8Pb66yCSz9tl2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_074557_262288_F2127434 
X-CRM114-Status: UNSURE (   8.99  )
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

Document support for the SD Card/MMC Interface in the Renesas R-Car M3Le
(R8A779MD) SoC.

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
 Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 64fac0d11329a..4d66966ce2900 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -52,6 +52,7 @@ properties:
               - renesas,sdhi-r8a77980  # R-Car V3H
               - renesas,sdhi-r8a77990  # R-Car E3
               - renesas,sdhi-r8a77995  # R-Car D3
+              - renesas,sdhi-r8a779md  # R-Car M3Le
           - const: renesas,rcar-gen3-sdhi # R-Car Gen3 or RZ/G2
       - items:
           - enum:
-- 
2.53.0


