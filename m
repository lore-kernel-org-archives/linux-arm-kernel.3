Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996F3D46BEF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 18:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VPiGGxfGk9qyGZNYwtEphY2A7pL305cD7LB8ReFqHtM=; b=wxpWtYUR1P/Wr7
	WcCnC2tFTk0fg1F6nEz2uiGjeNpUm9TIur9dcTJO//asJuJmj4GQBzROzb0Q09+cm9aqq0KuHw9X4
	fL58LyYiFDapSMBjfqWjyU0RoDwza3xaz3DeU0nRBpWbpyKKx+6YZ/vGOOJ+KpIGv1lkNcmu6TvMA
	6wZGGZTglCcqdNW0B5jqLs0bCKMee/2UU2jAl0rz1FVuPEcAoM5l+vqkTcPZvlSnFc0Hu/iE5hnRw
	b9JTVD9xRI2SQcYZDxPTtwuIFBGuXBKTBuu/R3SPqol9ekkn0DbZMSgZ38PDEHcM1hyBpeZ9gIfAy
	TOWwdBF0udyep3d+JHLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlASL-0000000Gd63-0nkA;
	Wed, 28 Jan 2026 18:40:00 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlASI-0000000Gd5U-0W9E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 18:39:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769625575; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cJzG+f1Lp5kPWoClVFG3pHdmgaQWHCCm/4QRxmbYJGgtIvyJqBEWUZIpA8QpzORTggpj6rZBmo8mbNJ4erzRaPznOG587qn0de687wOYrcCtEp/evwLO/Hp+MtaeVbjxxwvmGFg76tN+EhJ32JiPOd+/Gaa1HL2wkh1XVfuPgYM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769625575; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VPiGGxfGk9qyGZNYwtEphY2A7pL305cD7LB8ReFqHtM=; 
	b=FyhxyttixDXvWIUwxQjv5uhh9SJWPABBcar/WnZnbQUDD5v2blrvzMMXlsbn5M6x8PNlJ624hZW4wwLPxositCFcA+rVfdznwHOXGsoTxi2pYFaW4Dv0b65sD+r+EBPz5MYT4VW6nupssCMGT5Q87i3CYfcPIeLMJJ8UsXhZqGs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769625575;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=VPiGGxfGk9qyGZNYwtEphY2A7pL305cD7LB8ReFqHtM=;
	b=H+U+O24mv7g7vETn8N+6833+tmyfjUDguKJA4VGyB6PQVmJ4F+kZf0RrZjdto5B7
	9m4L8pNNRuCYGpPL8BAVZvmijpSHuDONichWdhVcPi5UXwwOSA0Ty133A6WjCZhmHPB
	BE2Np5xP9zvwZd4ao/PunpVaFLINgDyfiWPm9icQ=
Received: by mx.zohomail.com with SMTPS id 1769625572938868.1314700606614;
	Wed, 28 Jan 2026 10:39:32 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 0/2] Fix a __clk_core_init parental issue
Date: Wed, 28 Jan 2026 19:38:49 +0100
Message-Id: <20260128-ops-parent-enable-fix-v1-0-ff39cc37f98d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ6CMBQFr9L8tT9CVVCuYli05amN0Ja2GhLC3
 W1k8RYzyZuVEqJFok6sFPG1yXpXoD4IMi/lnmA7FCZZyaaq5ZV9SBxUhMsMp/QIftiFmwtwvrW
 t0cOJyjdEFP3v3vudI+ZPyeddklYJbPw02dwJM76PZeywZOq37QdEK1balwAAAA==
X-Change-ID: 20260128-ops-parent-enable-fix-65ee4977cbd3
To: Mark Brown <broonie@kernel.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_103954_228980_07BFA80F 
X-CRM114-Status: GOOD (  11.10  )
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

Mark and Alexander, please test to see if these patches resolve the
issues on your boards.

I expect the first patch to completely fix the problem on the Avenger96
(STM32MP1) board.

I'm less sure about the i.MX8MP board. I believe the second patch is
needed there, but I don't know for certain, as I don't have the hardware
to test.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Nicolas Frattaroli (2):
      clk: Disable CLK_OPS_PARENT_ENABLED parent only after CRITICAL check
      clk: imx8mp: Mark arm_a53_div as critical

 drivers/clk/clk.c            | 6 +++---
 drivers/clk/imx/clk-imx8mp.c | 4 +++-
 drivers/clk/imx/clk.h        | 4 ++++
 3 files changed, 10 insertions(+), 4 deletions(-)
---
base-commit: c099ccb60bc99900dd54ac22d7e68b8e56f15e4b
change-id: 20260128-ops-parent-enable-fix-65ee4977cbd3

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


