Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D37C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 19:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owmp13+PRVCZr2KaoeYEeTrebxFfw3J5vKLj7UHan04=; b=KcVSsQ00ymwcMqpVpgcuryhEB/
	9hnWAGLHkbmnbt/ouGPzrQOz6Epg5eCPLWL1NpedGl0S2+UtoLkLPKnel3KTycELMLXoX+HkAQmb4
	MjLnqs9p8RR7RxfyVdIFUpzcizCsPhuOuHJ7mMPUpJbDJFFoOKaMuy/iP9nZqRUGeNSG0gSR+uMl8
	AWyd5kw0hTCXZoQG3bi05QRxTdBVznD8+z8vJWow0J+dRtnmRvBYLDl7UxPk7pCn1Si5vj6n4kV0R
	0dqM0J/ED7mhFIOVjyCjhkiInMnXizvxm+ccEp6N7Ij4fVSaqQxUjAHq6jvckf8L+46I+ZOFjGSEd
	ZTiu2BZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjk75-00000002Rc8-0YBs;
	Sun, 16 Feb 2025 19:15:35 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjZh-00000002Me1-3Z38
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 18:41:06 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9E18D25400C3;
	Sun, 16 Feb 2025 13:41:04 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 16 Feb 2025 13:41:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739731264; x=
	1739817664; bh=owmp13+PRVCZr2KaoeYEeTrebxFfw3J5vKLj7UHan04=; b=r
	TVis3JI6IbhMfm1QieteT8pxK+JNnJJqHZOj8G11xtF02VvlRS+n0zXzbRU00z73
	qqOEZa6orLbm9Bz9szRF69ziZazInZmaymroEwpwPAZLKqDlFfgCIArhDBjEc2dl
	sqpsjxLVIDCGuib/9KmXze/Vr7ZZMEcfokB1dwRwk0+GHvKrv3XFer9CWpMAkc9w
	GTx++CxHmsLFW75hCscKppQNn1XF93CUDBZMyk5TPQXNkxL+x0q08TdCmeiRasVV
	OvDlgPxHFg1qUCuaCXG+Rb+2zblyiCl4rHTy/rmsMJatj8qvceCZkmOHu9Uz4wU2
	mVQxccVLctVVcThw19XEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739731264; x=1739817664; bh=o
	wmp13+PRVCZr2KaoeYEeTrebxFfw3J5vKLj7UHan04=; b=CDHvsdkxRpy0jVxAq
	XBTVGKInAvrMW7XPYAy6fMpF6ye1isZtnQTxdqw7YMV4SHAKEo6B71qB0i1jy2JO
	7I+yLUMLu1A9288pQCGPSqid5nXzoUUZTRR/S/ySHxFdBZCcvZtZI8T2Y9Hm65a/
	NfcyHlUFIkFLXQKlWwWHrLRN9NvKxrf49kdZB+usu9E627OxR8CQyF7dJmF98cQf
	4EonyXMpcdkT+ATAkSCbsI2Arl8AgvDQ2lhXk4kcP2NvR4+Q9cWFWQU/ga4sRu/Q
	XpVOZwTxcpqdnW6j0CKxeRf90iRtEh8JpTtcQkOowSWeb2gdOPRr6cF3nygG4dPN
	h0T0A==
X-ME-Sender: <xms:QDGyZ6cxJagFtAykH6tESz9gRllSFGxHBkmeWmvk0dzAWmlr8AyvUg>
    <xme:QDGyZ0NKXOJWyA0PjVXkhDjM-1_SU9_eutUKXhW9PdmhQtnwqI9rjwJTOLqD3KGxg
    ACOm3ezfm_K2zhcSA>
X-ME-Received: <xmr:QDGyZ7goKNPYreRU7Al9hsahYhzV0FwtKC_iun2ZZ9h6v8F_8cpaH2bgkC9aa2DjGtklDOlLB9VR02Qymsl2AJ0283w7UWql8u9yzgEbn3WJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehiedvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepieenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:QDGyZ38SMlvf-tHTl3yeHir8qyUvT8mjlvw8v25IAMSO8vj00WTqug>
    <xmx:QDGyZ2u-Rzy7PB9o237_XGi3VN_YJzjxiki6RNlVfyMDQl6nIlHWVg>
    <xmx:QDGyZ-HRKvV62XWn_Fn9VBuN7roKoaDh0u52-ZuSWChx1KnapU8PZg>
    <xmx:QDGyZ1MU1ecz9r4Lfvbu2h6bNg0znOtaX1zMQx6aJ39pBCUFFaGyjA>
    <xmx:QDGyZ9_GqbTgZxX-PeHUpgf0dM2bSQERS2_p_j6JHPlxQJjE6xwdjn3Y>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:40:57 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v7 26/27] drm: sun4i: de33: fmt: add Display Engine 3.3 (DE33) support
Date: Mon, 17 Feb 2025 07:36:26 +1300
Message-ID: <20250216183710.8443-27-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216183710.8443-3-ryan@testtoast.com>
References: <20250216183710.8443-3-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_104105_937895_7690EA84 
X-CRM114-Status: GOOD (  12.85  )
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

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Like the DE3, the DE33 has a FMT (formatter) module, which
provides YUV444 to YUV422/YUV420 conversion, format re-mapping and color
depth conversion, although the DE33 module appears significantly more
capable, including up to 4K video support.

Add support for the DE33.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun50i_fmt.c | 21 +++++++++++++++++++--
 drivers/gpu/drm/sun4i/sun50i_fmt.h |  1 +
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun50i_fmt.c b/drivers/gpu/drm/sun4i/sun50i_fmt.c
index 376a3c9b993f4..03d5d7132d1aa 100644
--- a/drivers/gpu/drm/sun4i/sun50i_fmt.c
+++ b/drivers/gpu/drm/sun4i/sun50i_fmt.c
@@ -51,6 +51,19 @@ static void sun50i_fmt_de3_limits(u32 *limits, u32 colorspace, bool bit10)
 	}
 }
 
+static void sun50i_fmt_de33_limits(u32 *limits, u32 colorspace)
+{
+	if (colorspace == SUN50I_FMT_CS_YUV444RGB) {
+		limits[0] = SUN50I_FMT_LIMIT(0, 4095);
+		limits[1] = SUN50I_FMT_LIMIT(0, 4095);
+		limits[2] = SUN50I_FMT_LIMIT(0, 4095);
+	} else {
+		limits[0] = SUN50I_FMT_LIMIT(256, 3840);
+		limits[1] = SUN50I_FMT_LIMIT(256, 3840);
+		limits[2] = SUN50I_FMT_LIMIT(256, 3840);
+	}
+}
+
 void sun50i_fmt_setup(struct sun8i_mixer *mixer, u16 width, u16 height)
 {
 	u32 colorspace, limit[3], base;
@@ -61,10 +74,14 @@ void sun50i_fmt_setup(struct sun8i_mixer *mixer, u16 width, u16 height)
 	format = mixer->color_model.format;
 	colorspace = sun50i_fmt_get_colorspace(format);
 	bit10 = sun50i_fmt_is_10bit(format);
-	base = SUN50I_FMT_DE3;
+	base = mixer->cfg->de_type == sun8i_mixer_de3 ?
+		SUN50I_FMT_DE3 : SUN50I_FMT_DE33;
 	regs = sun8i_blender_regmap(mixer);
 
-	sun50i_fmt_de3_limits(limit, colorspace, bit10);
+	if (mixer->cfg->de_type == sun8i_mixer_de3)
+		sun50i_fmt_de3_limits(limit, colorspace, bit10);
+	else
+		sun50i_fmt_de33_limits(limit, colorspace);
 
 	regmap_write(regs, SUN50I_FMT_CTRL(base), 0);
 
diff --git a/drivers/gpu/drm/sun4i/sun50i_fmt.h b/drivers/gpu/drm/sun4i/sun50i_fmt.h
index dd6816c90dfcd..e15f9803b3574 100644
--- a/drivers/gpu/drm/sun4i/sun50i_fmt.h
+++ b/drivers/gpu/drm/sun4i/sun50i_fmt.h
@@ -9,6 +9,7 @@
 #include "sun8i_mixer.h"
 
 #define SUN50I_FMT_DE3 0xa8000
+#define SUN50I_FMT_DE33 0x5000
 
 #define SUN50I_FMT_CTRL(base)   ((base) + 0x00)
 #define SUN50I_FMT_SIZE(base)   ((base) + 0x04)
-- 
2.48.1


