Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA15C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 11:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CR+LHOxQNJH4mrdkRrblEPU2A6Ou6dlR4qZMmeyZ4e8=; b=NY+Lbsa/ABmhOnfyovRFiz9Q/g
	xYGtYWjxoqM7IdIzGupvxpEi6lkQilKLuOzEuudfBP4+jyHcibeDUXQx+NvykbiVaiQ/Dthx0wuuB
	v91zcjyqIJ4OJWEfMKNNNvr1R9xFPqwCxDeURhdcpodp2hQc7/KGUKi91sHEXBqtm3jDJTp4SoOUT
	t2+IAVIbDTnjibhRIa42/YCMwADruG/nb3NnFEJG2TrGzZ2b05nqCh6+tMudUIqQiqwYdQu3n1knu
	BeGgSmYyyo7/YXj0HtFQOyzLivwX4o3H9IuAB1SvWmeJ81aM2SUo6sSVhUVfB9tZ2BsWa5og7akYX
	v/cRLYaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQcX-00000007V4d-09gN;
	Mon, 11 Aug 2025 11:23:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQD3-00000007Qlp-3pFk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 10:56:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CR+LHOxQNJH4mrdkRrblEPU2A6Ou6dlR4qZMmeyZ4e8=;
	b=eUMN4dSQ3le9FS/Y+6Y244khcoOhLYX3ErDME7G3+JqrItrM3btxiZa4VxtdirKP6n+uVz
	bKdOfahB50Z39mmUTDcCmij99rrkoz/YQHYs97rsBTh7lYgC0fX7KFzWbQTg/8Dqn5Y990
	K+ndaUng1xI4r+jRbtzKOn34Udo47z8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570--Z1ZX7oaOHebGLc_SwCqBA-1; Mon, 11 Aug 2025 06:56:55 -0400
X-MC-Unique: -Z1ZX7oaOHebGLc_SwCqBA-1
X-Mimecast-MFC-AGG-ID: -Z1ZX7oaOHebGLc_SwCqBA_1754909815
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e8106a41e7so1030889185a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 03:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909815; x=1755514615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CR+LHOxQNJH4mrdkRrblEPU2A6Ou6dlR4qZMmeyZ4e8=;
        b=CH98XoWGkIC4UgI+4Q7TAopxJKH71oBre6oZMbapXflK2lHiwsNrGUjfVBzmr5Opsf
         D3M4FJHxRNsGmMeyHao3olVlN11nXQ8KTmSmn7jfnSQBDCyI3kyVRh1GJ7TsGUadtbcK
         mro3aytBySCbtUc+kWuvfzIP2MlCU/9mYdB8WF8tEfR1CUAw8MSwXkV19rIVVFpvIVNF
         ++zWBMagQwtSUCNmlCleiaUSaA7jukqQIxcsXrv49UYhQKJmsq/XgGU1Edee4+DGRetI
         ncWWrk2yqhd+408Fg+vj+TAtOhV45LkuiUKn94VreCaP5U4AD3tb/GAHHxgsCsIhbt0B
         z+mg==
X-Forwarded-Encrypted: i=1; AJvYcCXUHfuyr8cT3oi6PH66/XaCDVrzR8rHeX069Tz73a8qWTdXWEBT2R959Fka4WWklowbvzxGVJhbTAFAXhITqQjh@lists.infradead.org
X-Gm-Message-State: AOJu0YzQbydbrIDBgAkHODpudnNK6gCYSw/gCfMoPx++5vRI6FrlvoWv
	a8/ohBpghcxYn54/DnjAh1gE4QhjTV27DPOTCRAzBMQ9H5tuE+vmZK6fEaW9XwNpnK5MvTS6vYV
	0Osmsj7eduVVMl0GIP3EXZ5ImxLAzFbEaYqzKidJ1OIZu3f0raobj9XPidMSF6J9vLdm0V4Japp
	kn
X-Gm-Gg: ASbGncsYhQ8xe4BTWbyXiasVkm8zoLs7OHNrXH4xN7mqAtno5F85LA4uczNptkPq5Tj
	XzzfjHLxrE4gy0EjXNT9tdduOSpXLvUCtA9L8UShq5WKVzFSQUWMj+VNHAuvrXHj6u4Bx3HdDLy
	Qz9JPLII8/QFGUOqsmCeuNq//s8YXFBZV1j+zWp3RsANMHJfVKeV5pRkdMeY+6ozI3ZTRLETywS
	njzYuy+lPcIPaIoDRGBC+oe5cabsXNGSET9O3ANcbBAhYq38mLisUgaZU/a7dyuKNsduD6yBlf1
	anoc+VgPJbHMyTQjl+GH08X+3o8xJU4HWzZ9abO4u3Ikmt/NoLpCqqNorYvDztFFI2yO5mL/B/G
	0wq0=
X-Received: by 2002:a05:620a:1996:b0:7e8:54f7:67cd with SMTP id af79cd13be357-7e854f76862mr91487485a.50.1754909815366;
        Mon, 11 Aug 2025 03:56:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSii5P15b+af3L4E7F/cQGCM1Xz8KwmyfhCdGkZGKODW+eFh6Bky1dDzTK+GfwnJZiiMZJQQ==
X-Received: by 2002:a05:620a:1996:b0:7e8:54f7:67cd with SMTP id af79cd13be357-7e854f76862mr91484185a.50.1754909814934;
        Mon, 11 Aug 2025 03:56:54 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:53 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:13 -0400
Subject: [PATCH v2 9/9] drm/sun4i/sun4i_tcon_dclk: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-9-4a91ccf239cf@redhat.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
In-Reply-To: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=2307;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=y0KLkFzoWiBCsjyKHVyFf5yBXdH+nrgv9bMtrhIbLXo=;
 b=j1ZnE8gcsk3YjO3zCEvUNiC5B3rrw/rsR6rCeLo5Q9BxZp8jvK69xEFMszvH1iDCwux2pSDHd
 eRkR0peMpaDCxDNa8Bi3chrL3Nda3ZZTmewCk0Eb5cefUz9pD7/Qw2Q
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ftveKCucJ02hhPQMOGjNWwL-RlZOUS66WJ1FyeNg7sU_1754909815
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_035658_030406_A727CA4F 
X-CRM114-Status: GOOD (  15.37  )
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
index 03d7de1911cd654f395ea85ad914588c4351f391..4afb12bd5281f0d1720cfe2c8f79b80d97244ef2 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
@@ -67,8 +67,8 @@ static unsigned long sun4i_dclk_recalc_rate(struct clk_hw *hw,
 	return parent_rate / val;
 }
 
-static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *parent_rate)
+static int sun4i_dclk_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	struct sun4i_dclk *dclk = hw_to_dclk(hw);
 	struct sun4i_tcon *tcon = dclk->tcon;
@@ -77,7 +77,7 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	int i;
 
 	for (i = tcon->dclk_min_div; i <= tcon->dclk_max_div; i++) {
-		u64 ideal = (u64)rate * i;
+		u64 ideal = (u64)req->rate * i;
 		unsigned long rounded;
 
 		/*
@@ -99,17 +99,19 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
 			goto out;
 		}
 
-		if (abs(rate - rounded / i) <
-		    abs(rate - best_parent / best_div)) {
+		if (abs(req->rate - rounded / i) <
+		    abs(req->rate - best_parent / best_div)) {
 			best_parent = rounded;
 			best_div = i;
 		}
 	}
 
 out:
-	*parent_rate = best_parent;
+	req->best_parent_rate = best_parent;
 
-	return best_parent / best_div;
+	req->rate = best_parent / best_div;
+
+	return 0;
 }
 
 static int sun4i_dclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -155,7 +157,7 @@ static const struct clk_ops sun4i_dclk_ops = {
 	.is_enabled	= sun4i_dclk_is_enabled,
 
 	.recalc_rate	= sun4i_dclk_recalc_rate,
-	.round_rate	= sun4i_dclk_round_rate,
+	.determine_rate = sun4i_dclk_determine_rate,
 	.set_rate	= sun4i_dclk_set_rate,
 
 	.get_phase	= sun4i_dclk_get_phase,

-- 
2.50.1


