Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C53ACD3430
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 14:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shQ/eL2qxQz2BRj4gWIICBknwkCLqyf7KygYF9bKWHw=; b=q0Q0uUbUTl9uP9VaLKDJL4Um6o
	D9C4/QFMWBLXGj2yFnRgURAi2CIGhoiAYOnNLiRusQlj2Jj3ce5MEgoxLVEZqaxN1lFhT4QNW4rnK
	nniC+E+p437IQ72R8ciJaYR7e5cIVdg+DbMN6XScSgASKJdpD1JQy1XDcrFJpWPDjFrC64py7Rtmd
	ZXGhrqgCUe+z1X7JFWlUgZhzU8Sa5+Zke29vZTbua8IFoO4qfGXpmVg/UZieIA2qvnMA4i9Hr4szP
	IwmwulDwrhzOMbUKgHGdx60cYUlCrSYqiBkw+XBQkXtfkL1x1WMREr9UQsKN1W5QCsoG+EGqg8ke2
	/dscY3DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuYq-0000000DVGV-3s9q;
	Mon, 04 May 2026 14:46:16 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuYp-0000000DVDj-0YER
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 14:46:16 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4g8PbS6mjGz9tmY;
	Mon,  4 May 2026 16:46:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=shQ/eL2qxQz2BRj4gWIICBknwkCLqyf7KygYF9bKWHw=;
	b=ShiwKXMPfsuNmwWG5g0o+NnRXHGf3slSPYpsezrbZem8xM+L71wi9narwSHJph8vt3sCak
	DA856+B3t0eJ1gRScw2cmpNIW24zOOfJlMFLmErciKqDW82KaLUy+pbLL+pbdwBx6hXPVP
	DPq/OjRgTJQvQwmn6UYRQ4ohtaZYHEjS7VvN0J+38G8AMIWj1r+LVA4DBv5V91U5xXS8sJ
	Y6vp2QoMeukzxQW1a1V03dE3Xi4GMlWYbZdHvH4lLqk7Y+fNc9QgZiVfaDj/jF2jWNTjY5
	z1hAVl0mfpKMa7DRGb+dNJMFIZNB6xqz6T6TvbxFUJm0t9mUX8ruYsknRiV0Bw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=xvaZ95XE;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=shQ/eL2qxQz2BRj4gWIICBknwkCLqyf7KygYF9bKWHw=;
	b=xvaZ95XE88t9HIaXqhjsGt1ucaCNkmqKuJH2MWDiRYAxIRJ/0UYoXsOp8iYp1M1aN+2tBa
	W4GFifUWw89OOg7Sxq9UzJkYKWPd3FL9j3w3WnYRzTlmW4Bx0S8zdnEvkVGsh3wRBFGGWY
	qsViBVx+9DHTY4S5XezzjeTlQU7HulXnZPWOzfN6TSe/3aZMgwtSbWKQn4VTN1xHG2uylj
	/SM3yN9c08B+eVbTWDnX9tlQPLEEw9Mdq/JtW5/iX5PobvFSNgTBSaS9DJrNw4KzVxwolx
	CFOr7ZfeQvCkrmd/bH7an+n0Wh7yMypOLvMnROLldD6pQsPuTqLlWacDOsGLgQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
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
Subject: [PATCH v2 5/7] soc: renesas: Identify Renesas R-Car R8A779MD M3Le SoC
Date: Mon,  4 May 2026 16:43:27 +0200
Message-ID: <20260504144534.43745-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: gbowz8rnb3xnaqfryekujdys5seeip8b
X-MBO-RS-ID: 35ef8a64b290b1dee0a
X-Rspamd-Queue-Id: 4g8PbS6mjGz9tmY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_074615_314911_8726D658 
X-CRM114-Status: GOOD (  11.30  )
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

Add support for identifying the R-Car M3Le (R8A779MD) SoC.

The Renesas R-Car R8A779MD M3Le SoC is a variant of the
already supported R-Car M3-N SoC with reduced peripherals.
Enable support for the M3Le SoC through already existing
ARCH_R8A77965 configuration symbol. PRR reads 0x67c05501 .

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
V2: Add RB from Geert
---
 drivers/soc/renesas/renesas-soc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 38ff0b823bdaf..c82835cf6d8e9 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -361,6 +361,7 @@ static const struct of_device_id renesas_socs[] __initconst __maybe_unused = {
 	{ .compatible = "renesas,r8a77965",	.data = &soc_rcar_m3_n },
 	{ .compatible = "renesas,r8a779m4",	.data = &soc_rcar_m3_n },
 	{ .compatible = "renesas,r8a779m5",	.data = &soc_rcar_m3_n },
+	{ .compatible = "renesas,r8a779md",	.data = &soc_rcar_m3_n },
 #endif
 #ifdef CONFIG_ARCH_R8A77970
 	{ .compatible = "renesas,r8a77970",	.data = &soc_rcar_v3m },
-- 
2.53.0


