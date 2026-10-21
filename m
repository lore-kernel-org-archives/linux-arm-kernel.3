Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D77606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 13:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EqfxBTz8;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qgzxPSMr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBETWTnxgsHkOcOekkEoq8ejz9dYxGjVkKxycACZ47g=; b=EqfxBTz8mNNBdC7KVqJpWf3JbG
	oJEneCrRYFdcu54x+ejDOBvaxYh6y5WB42F46TrU4zYyZGU8MTy0dTxP1gKUigoZLzoLigZwEI/By
	114RIXfjVcJIuU1W9E1fu9smrrqZAIX73ne/OewcW/Bjfwzq5Di2x3y2w38oxG5a5uG9W8uJjLLdN
	bTFrp1wwKNbv5yb8ph5PfbIyVutyx8K72Dvc3mTrOhMO/0kzMXN7kvboGuNoV4JtodnRhy16S2EEt
	pVDgcWLQWgSKo29TvrKutq+2zeFrbWJMnHeQbz5mQ9nVxu1/mYI7aBuQyBV3T19IkJrPC9WGPbZ9g
	jg5yqI+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJW5X-0000000BsCn-3KRB;
	Wed, 21 Oct 2026 13:10:39 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJW5S-0000000BsA8-2Y5z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 13:10:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9AFAAC5CD75;
	Wed, 21 Oct 2026 13:11:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA2A6606E3;
	Wed, 21 Oct 2026 13:10:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5927F10328D61;
	Wed, 21 Oct 2026 15:10:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792588230; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bBETWTnxgsHkOcOekkEoq8ejz9dYxGjVkKxycACZ47g=;
	b=qgzxPSMr64yycANWhy8U4aGpnADy/vIATLDq4M6G17dx+ktoqTCqAm/Z700n1KD+NXcGmp
	BcUaGjvldmufkQ0M3uwUO3kz2wlQPw3Z8fgDls4uhKDVsrqcqO4nZfU5QgDqj6IdhebImD
	wX8P/7zzyKG1HYkkS0QgCBheoIfWxxPAiggw63d8LX4q9/Mpw1PFm5uedL1wRJ2cBpDhDw
	RoANyI6PLvuZQ0SZGu4cgAn3eSkHkoHkEGVsbcA7VLclkVj2WsJxAlrAWo9079lmD8Hq/Y
	8DKRzyUM7DoF9jaUceBHG43paWC+WJtuoKemQ3MuMd9QZTOyeTY3AqOwON/uaQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 21 Oct 2026 15:09:58 +0200
Subject: [PATCH 2/5] clk: Fix v2 rate negotiation with composite clocks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-ge-clk-lcm-v1-2-246cc35b5ffb@bootlin.com>
References: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
In-Reply-To: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Ian Ray <ian.ray@gehealthcare.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_061034_832824_E39ECD7C 
X-CRM114-Status: GOOD (  14.15  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

V2 rate negotiation walks the subtree using the composite hw clocks (the
ones that we have acces to while walking the clock tree), but compares
it internally with the inner hw clocks (typically the inner divider of a
composite clock). Since these may be different pointers in the case of
composite clocks, the comparison won't match for them, which fails the
whole v2 rate negociation logic.

Always use the top level core clock instead. Comparing the top level hw
clocks instead of the core clocks would also work, at the cost of an
extra pointer dereference.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Brian, if you agree with this change, you may keep this fix or fold it
into your series, at your own preference.
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 745b13a77c83..349c35ab8a5d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -917,7 +917,7 @@ unsigned long clk_hw_get_children_lcm(struct clk_hw *hw, struct clk_hw *requesti
 
 	hlist_for_each_entry(child, &hw->core->children, child_node) {
 		/* Use requesting rate for the requesting child, current rate for others */
-		if (child->hw == requesting_hw) {
+		if (requesting_hw && child == requesting_hw->core) {
 			child_rate = requesting_rate;
 		} else {
 			if (!clk_hw_is_enabled(child->hw))

-- 
2.56.0


