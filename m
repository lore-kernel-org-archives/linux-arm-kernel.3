Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320C7C88E42
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HK1J9Nil9WfDBB1j8vImy3/8qI+WNh2teR0R09fa4mk=; b=Fi3MivEwGfWaXD2azAOYa1r5yG
	rc6FbcQoTKBvbkk6aSgvsOm2M58OUNJ68YqI6sVPLEv+G38LVIUA2mZeGaR6hmYdUX/75VC8MX1hJ
	0ZEB+ezwhyCsfW+wABTdnQ7YNhlTzL5OhD8ITqeSJEDzV97RYxxFnoRmlNPTF8KFzFQnbhasDoUb5
	w3vZP/tUcQmZuEs2W1e2U45IkyFmfkzlZJYXjTANCReM0auJFUXuJG6vImJVyXVQGvDbWe/lElNXf
	3mdKtHpfyoCJSLfkSrXbk3Ifu/1yn0HZfmEoxm88EEh7FjTnutFta8kj/Ll+7IkqdSsRdfcHmDEB/
	1GlhxRig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gZX-0000000Elzw-0WjC;
	Thu, 10 Sep 2026 15:20:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gZV-0000000ElzA-214E
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 15:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HK1J9Nil9WfDBB1j8vImy3/8qI+WNh2teR0R09fa4mk=; b=gDd/dG8YSe4FjeSLniA++n/3Ts
	nAgP5k76YU5b5bDM+MAcIj1BpSWCjEI7KLfVN5BzSUZjkXDdvD2yy5Leu4MOhMqe/jjQKIvlnzTtX
	h7ZjVGKaehPoaRlpVjsBzIB1wAyEkURIneGjGlfo5AI4+0VOxAG8kd6aO5GbRQ3b4PdrvTp3FYApu
	VtumoqBjS+lmH4eM0uj1nih6e9gsJ9vKxBrMNop8UKwjUKonAzgDHzYczRcyl7hKSEdsOA070LnZC
	MZcUrwWtEn3oL6UwiteKnUvct58zMoAxf7RInBgTB60zk4lTRyxasEKPt5RHYmEnsKtp1boYuvVX+
	OSA5b+tA==;
Received: from mail.fris.de ([116.203.77.234])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4gZR-00000002fLv-1tm3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:20:16 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789053610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HK1J9Nil9WfDBB1j8vImy3/8qI+WNh2teR0R09fa4mk=;
	b=1KJKbJIxDdlKr+gfesvs+1Ram4tWnJ1YmbYMBsbAUClnjd8c7T2mgd7Imvg6MDclwkCSPv
	MEUOYNdosC9L3PVVLvTCd7rNM1sqPa41c52o3txHagdmBZTvkbzWGzJdNyOMLDxZuPaiWf
	5ziBbvlHRsOlNY4PrAbVcOpkgSCALW/v1lraYdGdYfuwxQTDj76v+cIhJdjmB89l/tI1ZC
	t3VwB0167W12TNZjZ9XHofziGmpb4e/To2v2JXciCtgflP3pWLtVoV6o0yzkpV3XsCOAiq
	oP+IwH+h1JByOnITQVzTeO7RflJwKJ5JyBoP8exP9CqRGD2z+UAYmLOwlY2wnQ==
Date: Thu, 10 Sep 2026 17:19:06 +0200
Subject: [PATCH 1/2] clk: imx: fracn-gppll: Add 350 MHz support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-upstreaming-v7-3-imx93-displayline-v1-1-bb9446e6ed6e@kontron.de>
References: <20260910-upstreaming-v7-3-imx93-displayline-v1-0-bb9446e6ed6e@kontron.de>
In-Reply-To: <20260910-upstreaming-v7-3-imx93-displayline-v1-0-bb9446e6ed6e@kontron.de>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Mikhail Vaniulin <mikhail.vaniulin@axians.rs>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1035;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=Xsy//X4zl+YEYJ0inyZ0UE0JWD9JAJYSxtqGVvBlRgA=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWvRqZXvts+VkvKS5Q+e93BPve3uS40ShoEtz6XnqaUfv
 TQzXCato5SFQYyLQVZMkUWK3+K1rVmsj/yx6iiYOaxMIEMYuDgFYCITehn+8JQaqQYpL3D5u847
 Vu3yQ8fAvvKEA3eMtHRmnu44t6GQkZGhR/NtK+eu6uc5Ltd31PvPrv034eecwwu7TaPZ/X5eX1X
 JDgA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_162013_659333_B846484F 
X-CRM114-Status: UNSURE (   9.41  )
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

From: Mikhail Vaniulin <mikhail.vaniulin@axians.rs>

Add the 350 MHz frequency support that can be used for display with
pixelclk of 50 MHz. The divider of 7 is important for LVDS output on
i.MX93. It is also usable for parallel output.

Signed-off-by: Mikhail Vaniulin <mikhail.vaniulin@axians.rs>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/clk/imx/clk-fracn-gppll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index 4048c16c0578..4d83907553c4 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -89,6 +89,7 @@ static const struct imx_fracn_gppll_rate_table fracn_tbl[] = {
 	PLL_FRACN_GP(445333333U, 167, 0, 1, 0, 9),
 	PLL_FRACN_GP(400000000U, 200, 0, 1, 0, 12),
 	PLL_FRACN_GP(393216000U, 163, 84, 100, 0, 10),
+	PLL_FRACN_GP(350000000U, 175, 0, 1, 0, 12),
 	PLL_FRACN_GP(333333333U, 125, 0, 1, 1, 9),
 	PLL_FRACN_GP(332600000U, 138, 584, 1000, 0, 10),
 	PLL_FRACN_GP(300000000U, 150, 0, 1, 0, 12),

-- 
2.55.0


