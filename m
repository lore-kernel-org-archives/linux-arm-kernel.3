Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E23C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 18:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSpdqmQhmaEaEyQnbvHD5WvuW8sxRaHfdBO7i1cX1dg=; b=grKQvi6+lrKYZjVvgt+r6onmgl
	Wq+v/dxR1mO8yeJJB2OjgSOQXtsdd4l9GPY5mjBd9y3zd8Yks7GTic1jOgyOQK0GPFxg+Fq5cyhr5
	1lTE+aulXQEK1oN5lB/88ORLWHRzfsReGm6Jp7+dM3hEmYWt/DTzlaD1onOZDYa4CbZ7oT1voggZB
	3kZflkqQQDe67QV/2u6VTGgJIfWxw1wu1GRemyNX6QXsqCuMflKim1OELB8c/A1iE4vXBOaZGO0ub
	vEHI9lCJQr4jSrZ6F/gOPbTfsht1WF0xWe/8s/dOvn10iZi6EulkiJe0GH9itkifNGkySezijfLbj
	wokAt2Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjil-00000002Nrm-2r2n;
	Sun, 16 Feb 2025 18:50:27 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjjXV-00000002M4o-1KYp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 18:38:50 +0000
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2497425400C3;
	Sun, 16 Feb 2025 13:38:48 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 16 Feb 2025 13:38:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739731127; x=
	1739817527; bh=aSpdqmQhmaEaEyQnbvHD5WvuW8sxRaHfdBO7i1cX1dg=; b=d
	xURs7eHIZJSDD8ALfRKboyDXWphmZ/BGyvN1Vc8ypKj8RBMlbK3bppPCODAoHsD1
	lXdMtEcgjwG5OAF1WtBBqjdiHyAFkR4kuL66kPYs+bzL+YQaxAh9abUQ8FlWkK+N
	tL9D77rNXBJcYymgEsVIaf0leV8q2Go5Qn/Dd5Y3UDAFV579GBRVOhteH4a+1RQ2
	zUJBL1Y4pzQvzVq0ib41/EF6bwvipoNhPxArhNlmbCV9IfXUQbChNcgB0vht1Lw8
	HY8uc5JhxL5B73mVOTIimxrMoQ9BPM6TJkBpw2HxBO+7Rm3sYINlKhYkcRJPXpYy
	33LYzRssqe80oVe5+5sGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739731127; x=1739817527; bh=a
	SpdqmQhmaEaEyQnbvHD5WvuW8sxRaHfdBO7i1cX1dg=; b=Fy9a6MGkq57Wa+BOE
	PSdcrwK5dPIE3wd6HbtljvUBZQrYpa10gb+JKnMTZXFY7gcqPWzDEp7XrEve5bv9
	tIOJXlUhBsqM28mSvH5OGEWka7j3PzRTCxPWbGJME6rBgWoaS/HeozrVUYazE7vO
	JHfBm5pk4NAloGiM7MOraFFX6hgb3A3QHDFaH6zLmkuFdWBI2Akgmo4rlGUxfrc1
	nKTSvA0YMd5kF4+BQd0T648q3HwzldfBtIperwocKI5C8M5MDC5MxgUCYX9vku6y
	2mIvjozLEUjpieOmK2P+Kb+12JwvK8E3/Dc9DWcHFArCtLOkvTbP+GRezuNCI0jU
	SAjRA==
X-ME-Sender: <xms:tzCyZ0ARKQwFxKCNyskMajYYN4s_xhzf8Dnr98BOzic2Eo0dGR1LfQ>
    <xme:tzCyZ2j08cGQf6E0Oc1-aiIcJf9QB9iuQXRG0YQv8U61LsNGpCQDlbTB0AuQ1oD_7
    3Rzacc2-andEqqe2Q>
X-ME-Received: <xmr:tzCyZ3nY2mxNB754AQZ_dhzUphkF9hVdeI6Iex_tazgrlJg3iu_PMdPwq__KSa94C2bFNHYDOEtUDjRHHX0hU3OUQy5T_Dk8OrZtD1VJQnks>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehiedvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:tzCyZ6xNGrqoIHgF_FsCoj_aDzk8Tq2zKMVlBeOaAzxc-dMVFsDlQQ>
    <xmx:tzCyZ5Rez90N5Av4S--7fhKnVib1gvarrnVTQg6VVUYpdNzdChvhLA>
    <xmx:tzCyZ1bZmsk7bR-FWMSp9uSdYG8jQLR8XuBuTDzmTFkXVVKp2hlL3Q>
    <xmx:tzCyZyRfF1hV07S26XsSjKjLLU9NcDxGMPejoeOn63ddlZOX0oYNcQ>
    <xmx:tzCyZyBrHB2OH8UvZdKbVL8V0xHAp5pQQBx664Yt4Oi2v3lN8PR-M3Ty>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:38:41 -0500 (EST)
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
Subject: [PATCH v7 09/27] drm: sun4i: de3: refactor YUV formatter module setup
Date: Mon, 17 Feb 2025 07:36:09 +1300
Message-ID: <20250216183710.8443-10-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216183710.8443-3-ryan@testtoast.com>
References: <20250216183710.8443-3-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_103849_408495_AC975460 
X-CRM114-Status: GOOD (  12.03  )
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

Because the format is stored in the mixer configuration, the formatter
module setup function no longer requires the color format to be passed
separately.

Remove this from the setup function declaration and access the format
via the mixer object.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v5..v6:
- Add this commit updating the sun50i_fmt_setup function
---
 drivers/gpu/drm/sun4i/sun50i_fmt.c  | 5 +++--
 drivers/gpu/drm/sun4i/sun50i_fmt.h  | 3 +--
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 3 +--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun50i_fmt.c b/drivers/gpu/drm/sun4i/sun50i_fmt.c
index 050a8716ae862..376a3c9b993f4 100644
--- a/drivers/gpu/drm/sun4i/sun50i_fmt.c
+++ b/drivers/gpu/drm/sun4i/sun50i_fmt.c
@@ -51,13 +51,14 @@ static void sun50i_fmt_de3_limits(u32 *limits, u32 colorspace, bool bit10)
 	}
 }
 
-void sun50i_fmt_setup(struct sun8i_mixer *mixer, u16 width,
-		      u16 height, u32 format)
+void sun50i_fmt_setup(struct sun8i_mixer *mixer, u16 width, u16 height)
 {
 	u32 colorspace, limit[3], base;
 	struct regmap *regs;
 	bool bit10;
+	u32 format;
 
+	format = mixer->color_model.format;
 	colorspace = sun50i_fmt_get_colorspace(format);
 	bit10 = sun50i_fmt_is_10bit(format);
 	base = SUN50I_FMT_DE3;
diff --git a/drivers/gpu/drm/sun4i/sun50i_fmt.h b/drivers/gpu/drm/sun4i/sun50i_fmt.h
index 4127f7206aade..dd6816c90dfcd 100644
--- a/drivers/gpu/drm/sun4i/sun50i_fmt.h
+++ b/drivers/gpu/drm/sun4i/sun50i_fmt.h
@@ -26,7 +26,6 @@
 #define SUN50I_FMT_CS_YUV422    1
 #define SUN50I_FMT_CS_YUV420    2
 
-void sun50i_fmt_setup(struct sun8i_mixer *mixer, u16 width,
-		      u16 height, u32 format);
+void sun50i_fmt_setup(struct sun8i_mixer *mixer, u16 width, u16 height);
 
 #endif
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index bc934186bfd6f..3069329210085 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -405,8 +405,7 @@ static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 		     SUN8I_MIXER_BLEND_ATTR_FCOLOR(bld_base, 0), val);
 
 	if (mixer->cfg->has_formatter)
-		sun50i_fmt_setup(mixer, mode->hdisplay,
-				 mode->vdisplay, mixer->color_model.format);
+		sun50i_fmt_setup(mixer, mode->hdisplay, mode->vdisplay);
 }
 
 static u32 *sun8i_mixer_get_supported_fmts(struct sunxi_engine *engine, u32 *num)
-- 
2.48.1


