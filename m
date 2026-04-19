Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F16EF99C8D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 00:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j2Cl+gYnYHO1DKTjmBwPE5+KeWxesc/PgeGQx8inu54=; b=ATjrOj/CRj+4n3i4E9OX87T6kd
	+4tpe5vRul5/T0UcjBtBqHnJVmGZ8Rs/WOx23lSDOFsfihW4gu2y1xLxIV2u+ZYMBkm254YIPuSzG
	+A6fW5CTLoSii8QsczjJJvD+oAbOThJKCJG4nTUxcmSm7QkPEcbyFlceS4le65JvPWghsEdgd1mwf
	Hd6wSl01LxBuPTSufXX2uiWJoY8c85usB5ys/Uv/sreK07KdJHIege0b+i6svr8EKup2d9GfqJh60
	xDUcszihdTJdJ7t72G44anDUlrQm1q+ynxo0QHlpdrNxVWd0CYL93Y+RCkgxxrvPReT9GRWIgk4d2
	9tzKPEJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEGUk-00000005PFu-3euG;
	Sun, 19 Apr 2026 00:58:42 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEGUh-00000005PFJ-0WDS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 00:58:40 +0000
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B1D3B7A0053;
	Sat, 18 Apr 2026 20:58:34 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Sat, 18 Apr 2026 20:58:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	ethancedwards.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1776560314; x=1776646714; bh=j2Cl+gYnYHO1DKTjmBwPE5+KeWxesc/P
	geGQx8inu54=; b=dHmOjF0vM7xLwu4UiCXlrh28BC5r6W96ex6DJOR4r5naMO1F
	RNNGCwVTTlg7hcsD4yvQycZqL+C+vs6fJ7MTrS+Z/MwyQh1BmI4IkahLDT1McE0j
	TPBUhQGLaEGWwa6qYh9pbzp7ND1HPZsfGkLisI9hM0TdR9QkkO5OCj77KKohPtn+
	EUMWunFVneHRFoJE4Y3g1+A6ibQuNJEn/ZtF7A74j9IWfrnO8hTg/lZAK0zlRpsU
	h0JxmdVINw5MC1fKZchFcYKeGV0l9j8ufGMUlkHflslGOYANN9igS6zjeMOUWDM/
	RHTMLKTEgmoX6kT2HcjWf/aDfsjHLmrW2nDmHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1776560314; x=1776646714; bh=j2Cl+gYnYHO1DKTjmBwPE5+KeWxe
	sc/PgeGQx8inu54=; b=DVBlaSbXael4yTgd63brmPkjisGyqZqGIZp5GY43gYXN
	ijRaW2d97lOxKnDS+E5rmbJpclfdFSaCAWzv/YLc2TKgFW2wHPkHuCmHkUl4UeOF
	v+sI7BKxZ7pHarvrCzyQtRxdmutZRqNzztLGBanBNqxrEZuA3LNHvdmZ224OtYvv
	WfUyl9XUyNsAFANJlESCzfO12FVhGAIt1ljbNmccTR3C42NKhAgWHvYc2YcLHWZG
	yk6KD5UmZYk+ZNJLS7hH+8IYoviUaE0lMkA7zMRJGQ2kUd+80HMqRky0SUlMd6Yk
	XFVwYiYkgtt7Ub6kQrzQp0gf2XPijEB3n3ciBUOY1Q==
X-ME-Sender: <xms:uSjkaZEMuXhaqYBsh8hSXKxZlg2AVE3F_Z9o8owvMianfjSGXAvrpA>
    <xme:uSjkaf7cbi7OpXIYdIgssCezBn-aoOVUrLfL2ovxRyrlCq_XbhmK5PLUbyrWPcC_a
    Qd8X2LwdSH5bc9rCB5VQLcltoJaVj_7eg9Noyn4wys0AMztEPNg>
X-ME-Received: <xmr:uSjkaabicqQDK-k5KeCfs2TDekHnJ9z2iZc2eVS1Fkb5jURkK4-9NlRmHmMz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdehgedviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomhepgfhthhgrnhcuvegr
    rhhtvghrucfgugifrghrughsuceovghthhgrnhesvghthhgrnhgtvggufigrrhgushdrtg
    homheqnecuggftrfgrthhtvghrnhepieeuhfeuhffguefhffekfffgtefgjeeghfdukeel
    vdduiedutdffffeghedtiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepvghthhgrnhesvghthhgrnhgtvggufigrrhgushdrtghomhdpnhgs
    pghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuh
    igqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgt
    phhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopegumhhith
    hrhidrthhorhhokhhhohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidq
    khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehimhigsehl
    ihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepfhhrrghnkhdrlhhisehngihprd
    gtohhmpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgt
    phhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvg
X-ME-Proxy: <xmx:uSjkaVh2kkzbUFf3o-Ldd9IC7gDpbTVuZBe0fJ-DTVKE1MbnB9agKw>
    <xmx:uSjkaUeBaGNrZlyz8L3_6MFuN_L2nq6UhHNU4hcKFgNjg9Fh6zLQzg>
    <xmx:uSjkaclTg0nm-8BM5HImW1Z_Sn9RZ6Gx1o5tQdKbOfq1ZDu3pwGogA>
    <xmx:uSjkaRxkbVKXQvVnmqiSKxA48j9fqNy8y5rNV8Tfo7_HCJQpPoXjpQ>
    <xmx:uijkaQ1pIyb1aca6tXczcx00zkazgd-OrrDrnLJxa8896xfu4WXuI4my>
Feedback-ID: ibf9e487c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 18 Apr 2026 20:58:33 -0400 (EDT)
From: Ethan Carter Edwards <ethan@ethancedwards.com>
Date: Sat, 18 Apr 2026 20:58:32 -0400
Subject: [PATCH] Input: imx_keypad - Fix spelling mistake "Colums" ->
 "Columns"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260418-imx-typo-v1-1-2a15e54ad4e7@ethancedwards.com>
X-B4-Tracking: v=1; b=H4sIALco5GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0ML3czcCt2SyoJ8XUMTY3ODpBSj5FQTcyWg8oKi1LTMCrBR0bG1tQD
 iqiU6WgAAAA==
X-Change-ID: 20260418-imx-typo-14370bd2ce47
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-input@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org, 
 Ethan Carter Edwards <ethan@ethancedwards.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1379;
 i=ethan@ethancedwards.com; h=from:subject:message-id;
 bh=yW0F6v7t+BIRPX5uD4zJjeNVn0YMh9w/VIBBFWel3fs=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0o0bkp2QXk4ekFKWGJEOXFoNThlVGp6e
 GhQcXlVeFpEN1IyQ0VzWmpKTjljNUZ2ZXZkVndNdXovT3Z0REdlCk1TV3kzK0RJM3NYbjVRc1l6
 azd0S0dWaEVPTmlrQlZUWlBtZm81ejJVSE9Hd3M2L0xrMHdjMWlaUUlZd2NIRUsKd0VSZW1UUDh
 GVnAyN3UyTWFSdWlYdTVuVkpBejNQYUZZZjU4NWYwTDNWWW41YTNlY1h0Uy9RMkcvNzdQWm56SQ
 pMVjJmTXY5VGRvdmloSC9mbHZ6L09DVWw0SmVON210WC92eFpsemdCRFdaU1JBPT0KPU5jdy8KL
 S0tLS1FTkQgUEdQIE1FU1NBR0UtLS0tLQo=
X-Developer-Key: i=ethan@ethancedwards.com; a=openpgp;
 fpr=2E51F61839D1FA947A7300C234C04305D581DBFE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260418_175839_361048_C2221085 
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

There is a spelling mistake in a two comments. Fix them.

Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
---
 drivers/input/keyboard/imx_keypad.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/imx_keypad.c b/drivers/input/keyboard/imx_keypad.c
index 069c1d6376e1..ccde60cd6bb3 100644
--- a/drivers/input/keyboard/imx_keypad.c
+++ b/drivers/input/keyboard/imx_keypad.c
@@ -324,7 +324,7 @@ static void imx_keypad_config(struct imx_keypad *keypad)
 	reg_val |= (keypad->cols_en_mask & 0xff) << 8;	/* cols */
 	writew(reg_val, keypad->mmio_base + KPCR);
 
-	/* Write 0's to KPDR[15:8] (Colums) */
+	/* Write 0's to KPDR[15:8] (Columns) */
 	reg_val = readw(keypad->mmio_base + KPDR);
 	reg_val &= 0x00ff;
 	writew(reg_val, keypad->mmio_base + KPDR);
@@ -357,7 +357,7 @@ static void imx_keypad_inhibit(struct imx_keypad *keypad)
 	reg_val |= KBD_STAT_KPKR | KBD_STAT_KPKD;
 	writew(reg_val, keypad->mmio_base + KPSR);
 
-	/* Colums as open drain and disable all rows */
+	/* Columns as open drain and disable all rows */
 	reg_val = (keypad->cols_en_mask & 0xff) << 8;
 	writew(reg_val, keypad->mmio_base + KPCR);
 }

---
base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
change-id: 20260418-imx-typo-14370bd2ce47

Best regards,
-- 
Ethan Carter Edwards <ethan@ethancedwards.com>


