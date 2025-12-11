Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB807D4335F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 23:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sgu2onmClVBrEtqR34A/IFhyYtiocvS0uvbDkWrkkaM=; b=uIowdbAbWEmStz5ZCF/VyJI6YU
	hX4xBH0czQW0t+6MNjTTPUY1KJ22IFb729xqEuTAs3/BJm49qxeuVT2D8aOotPbXOLwC0An1Gv/NN
	MWlOnCGO6MiKIpJ2mWYLZVI9g9185/qc9uff/2I1Dia0g0B/gi3SjkIJ1Lc4L5YejBi394pxHW2ho
	cfXziCQJ92bgkD7YeG0Kh71cXAXSnF6vH20dSgBhzLdoD1Vz+BMfb59+JYs8+kCuBwZ9r+dOawIC1
	jVXkGN/9yNnUc1rIQTH3E4GQsppl7UBklTO0SZ92dEjJdPyNbqf9TBo49Ps4oIHk9vy9YcK/JFGnV
	kUH6MH1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpui-0000000HPBs-0GpE;
	Thu, 11 Dec 2025 23:17:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpuf-0000000HP6y-2PJd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 23:17:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sgu2onmClVBrEtqR34A/IFhyYtiocvS0uvbDkWrkkaM=;
	b=GILXfsOWECAicfBsiPJblYDP4kGobNMdAL2S11ddPMw4yqXlsbMLGuFhQ+Q0TboSf1K18F
	9EvlZ+5404VVHIicyQlF4HBbTj3dMnC/BnObJUeDxzW8hQ4UxkgTHRzutcGHDctdmhgtyV
	OAOBemHt+cyK/aARnlnZj9W0f70iHrY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-robUTZ2rOWu4WjAM2qQS4g-1; Thu, 11 Dec 2025 18:17:31 -0500
X-MC-Unique: robUTZ2rOWu4WjAM2qQS4g-1
X-Mimecast-MFC-AGG-ID: robUTZ2rOWu4WjAM2qQS4g_1765495051
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee09693109so11293811cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 15:17:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495051; x=1766099851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sgu2onmClVBrEtqR34A/IFhyYtiocvS0uvbDkWrkkaM=;
        b=bK64OopNY/t6TyYsoEvV5gYiigby6nnXq55aLZZ2G8eNdodJVpGTClQZgFHqYgKc88
         vv8zttaqjGVqHaBhJ6+4ctfRMP02j4aLSu/nrzLKaLSKguBsHYRtLDchedktBI2CgJ5Q
         GqzQXdvhQ7+FwzyV9N9/f4XWGurHdKukjxi3CrkbNHsIBo3DhfvFdfXMmn7bCB6ENCn1
         +Za5IW1vnqLZim6+Fh0haeEjdzvdkC07DqSi7dFd/6Wowtu8N372yTSCNRtP4W1k2D/Q
         vnVd3oyehW2kLC5vw+5gGody09FzcedOmbWGpZTF1Kf0+EbcSG9xwOKfsI8VqigLgUkc
         RDkw==
X-Forwarded-Encrypted: i=1; AJvYcCU4ADD8YU6Wjt3R4c/158073/sQBTbT0dh3Wjq6AnwkHdu5HgC1Tyj3cSJkxK/hwZdd9BppQpTtaQn9fKXoGCVM@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2oK2yJ9Nl+e1bfh09S82n80aIxFH6Ghc9tVFfUyJZFe5UPuja
	UERmzLb5O+qeDXYYudlDaou/JVBxROTIzxDiBJY8ndwMhgm4JrMWsdUyi+ZRjuD2YtUrQFTG8yy
	UX7Fh4N+NWGDmCjZsXmTefblhlqoqQyOfhMV6/8jLvnQUq4QmowHOrxB0fu/LbWrAuwCIe6W9lT
	dy
X-Gm-Gg: AY/fxX7f29HAS5GE0EfW6bfwqNCE9984nR1m0CK3jm7x/vX9sDrUTC1z5F5LJ/oLAgU
	DuW/Vo8sIfmNzFNdAYsgAxq7CBn99l+nlE3AeUZtE28loxHcsdlRLkomaAk3igbOtzTRDVaSlHM
	yRCyNVhn6MXfwzU4ioq53bTUljZmaqPpHHd3psfDMGLCxhiTRE+xARZp0rG2jLoeL8pmeI8HNuJ
	RYqQWLLBnolMryK8hpLqRAiSBLq/y3vWKQESgKtv2nfnBgJmmDwzp10qjM6zeQgqqhBPMFj/Zha
	ppa68dT/BIG2+2/9Dx7CcF3LTM+Yc63/GwQKLH5gqMaWvLZ8hZd5pjN8pWv7lZbuF38bqA0HKz0
	dIrmoptnAGdjXyV5DImNVfvkB+X2qZ1hh4L3BdwR8Jt8saUh4G/YH7w==
X-Received: by 2002:ac8:6f1a:0:b0:4ed:b0f9:767f with SMTP id d75a77b69052e-4f1d06121ccmr776251cf.70.1765495050792;
        Thu, 11 Dec 2025 15:17:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ2mASGrb1uGzvUHEFvIvmoh74d2qrejs22ELk7Vj6VjgPY8UzKXQvMrAzIodArePD3T0o0g==
X-Received: by 2002:ac8:6f1a:0:b0:4ed:b0f9:767f with SMTP id d75a77b69052e-4f1d06121ccmr775831cf.70.1765495050403;
        Thu, 11 Dec 2025 15:17:30 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:17:29 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:25 +0900
Subject: [PATCH v3 7/9] phy: rockchip: phy-rockchip-inno-hdmi: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251212-phy-clk-round-rate-v3-7-beae3962f767@redhat.com>
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
In-Reply-To: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3256; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=An56TAX1cqo7N9lFvO25vdxikpcfbBNUoQ6JxN8UiKo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy5922P1Zs7hiGnB+9TFs04zdHhsnafw74/pp2aRZ
 xsa/1Ud6ihlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiL8IZ/tcuZ/74xmunwK8+
 K0b12kU3f76araLG+bUwwmBtXFmp8SOGn4xTJlnuvLvryMOzu/sCg/+572ItvCozoev822K9vIh
 jf3kB
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xQLdXf8XoB5cjgZHIX0UmHGAUIG-GWzq7ax97G9D0T0_1765495051
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_151733_786037_8E7694FF 
X-CRM114-Status: GOOD (  14.06  )
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

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 30 ++++++++++++++-------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
index 8dcc2bb777b5455d21a10f06c5ad842b2ddbc834..1483907413faa5ce1dc8614db05e6e929410404d 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
@@ -749,22 +749,23 @@ unsigned long inno_hdmi_phy_rk3228_clk_recalc_rate(struct clk_hw *hw,
 	return vco;
 }
 
-static long inno_hdmi_phy_rk3228_clk_round_rate(struct clk_hw *hw,
-						unsigned long rate,
-						unsigned long *parent_rate)
+static int inno_hdmi_phy_rk3228_clk_determine_rate(struct clk_hw *hw,
+						   struct clk_rate_request *req)
 {
 	const struct pre_pll_config *cfg = pre_pll_cfg_table;
 
-	rate = (rate / 1000) * 1000;
+	req->rate = (req->rate / 1000) * 1000;
 
 	for (; cfg->pixclock != 0; cfg++)
-		if (cfg->pixclock == rate && !cfg->fracdiv)
+		if (cfg->pixclock == req->rate && !cfg->fracdiv)
 			break;
 
 	if (cfg->pixclock == 0)
 		return -EINVAL;
 
-	return cfg->pixclock;
+	req->rate = cfg->pixclock;
+
+	return 0;
 }
 
 static int inno_hdmi_phy_rk3228_clk_set_rate(struct clk_hw *hw,
@@ -835,7 +836,7 @@ static const struct clk_ops inno_hdmi_phy_rk3228_clk_ops = {
 	.unprepare = inno_hdmi_phy_rk3228_clk_unprepare,
 	.is_prepared = inno_hdmi_phy_rk3228_clk_is_prepared,
 	.recalc_rate = inno_hdmi_phy_rk3228_clk_recalc_rate,
-	.round_rate = inno_hdmi_phy_rk3228_clk_round_rate,
+	.determine_rate = inno_hdmi_phy_rk3228_clk_determine_rate,
 	.set_rate = inno_hdmi_phy_rk3228_clk_set_rate,
 };
 
@@ -906,22 +907,23 @@ unsigned long inno_hdmi_phy_rk3328_clk_recalc_rate(struct clk_hw *hw,
 	return inno->pixclock;
 }
 
-static long inno_hdmi_phy_rk3328_clk_round_rate(struct clk_hw *hw,
-						unsigned long rate,
-						unsigned long *parent_rate)
+static int inno_hdmi_phy_rk3328_clk_determine_rate(struct clk_hw *hw,
+						   struct clk_rate_request *req)
 {
 	const struct pre_pll_config *cfg = pre_pll_cfg_table;
 
-	rate = (rate / 1000) * 1000;
+	req->rate = (req->rate / 1000) * 1000;
 
 	for (; cfg->pixclock != 0; cfg++)
-		if (cfg->pixclock == rate)
+		if (cfg->pixclock == req->rate)
 			break;
 
 	if (cfg->pixclock == 0)
 		return -EINVAL;
 
-	return cfg->pixclock;
+	req->rate = cfg->pixclock;
+
+	return 0;
 }
 
 static int inno_hdmi_phy_rk3328_clk_set_rate(struct clk_hw *hw,
@@ -989,7 +991,7 @@ static const struct clk_ops inno_hdmi_phy_rk3328_clk_ops = {
 	.unprepare = inno_hdmi_phy_rk3328_clk_unprepare,
 	.is_prepared = inno_hdmi_phy_rk3328_clk_is_prepared,
 	.recalc_rate = inno_hdmi_phy_rk3328_clk_recalc_rate,
-	.round_rate = inno_hdmi_phy_rk3328_clk_round_rate,
+	.determine_rate = inno_hdmi_phy_rk3328_clk_determine_rate,
 	.set_rate = inno_hdmi_phy_rk3328_clk_set_rate,
 };
 

-- 
2.52.0


