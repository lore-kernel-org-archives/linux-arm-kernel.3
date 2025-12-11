Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27EBD4335E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 23:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bHDjO/kgoaGYHTOpTXBh+Ta+qpEREkcfpNn1mOnGExc=; b=0L24D8Ebp/x2lHdoIp2/z/u5vY
	ev+KQiO/IclMeqQSgFkQPEK7/WJ9OD8s8D0EFMuhzRUMOCuHCrFWF+N5wFmvMbOnHNuV3NBrWxhfV
	4uA+CjGBaMVMDxFGAsnn4xIef5+Aj8UNc7lo/9HT6m/ECNR4YdQGGi9OB9UHwzz5Hf782L1p5G9Al
	18bt8vMtVf4o6Bx9tyANiM+5tU1bfgIQcUGkDUnIXiVc19GyMWLta0ECYvcyDcJGhw4SuG9PeTYRN
	/bgq3zAt7I6n1qYiOamih7lJntakO/+BZsBIzAA+jjNMczaLA4u86Ufkb+vWdiWmjT4sstPohuF5f
	lfUGotww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpuP-0000000HOnF-3Wrz;
	Thu, 11 Dec 2025 23:17:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpuL-0000000HOhS-1Jhg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 23:17:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bHDjO/kgoaGYHTOpTXBh+Ta+qpEREkcfpNn1mOnGExc=;
	b=gwrXM5yfZ1I1+JxUpyglj/vhGkULa1TE2o5pE/0cwK8BxQrAHiOOh1xwsVoDgVhoBbFOOr
	Q2ZoNAp3D9HIuzEqWdScCQ7VdrIhYebmiI9xQW1F0Sp1qloK7/+p0R4p5LaHKUV39ZKjs0
	IjyChzogMdkErwTeUTrMcmWxE2AIrIU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-rfX1mhn1Pce57Z-LeYC9uQ-1; Thu, 11 Dec 2025 18:17:11 -0500
X-MC-Unique: rfX1mhn1Pce57Z-LeYC9uQ-1
X-Mimecast-MFC-AGG-ID: rfX1mhn1Pce57Z-LeYC9uQ_1765495031
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-882381f2092so21353586d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 15:17:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495031; x=1766099831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bHDjO/kgoaGYHTOpTXBh+Ta+qpEREkcfpNn1mOnGExc=;
        b=MGOmVA1FJGRUFBxPsFkhLmbsMVBllISvCDBrBVHxXK9VeHSlDT3XJH1KJM59pATJOy
         wJUZpra/hgAM2HXREUg8Ftgr4cZanJ2s1Nj5l9i2Sn5L5jxBV9B8IUnHV0jviSPvelBn
         out2VEOkRo4jNXajt0ve74ejysqfrgpinduu7R2sfTNNgxS5Ne/g89zYrTCj9h3CnDaI
         RUNllX6alME0hwH7aWX7HawjNT8rR8oovewj+ZQ8mPWu6o3E2Xk98nPkhm+jafG3zU5V
         uu+QpFWRFe6y5WlryACDtCj//PK5czojdWU14auQx6fDno41u2Dn2y4WcHikXH7GEGlY
         Twtw==
X-Forwarded-Encrypted: i=1; AJvYcCVzseEX+BWSzZQWKAbMQgFXvVoxfZWrNyEUD445NT1Y2C+dzg8xzbLsriuJKFITtOP85ZhoHjahgsqCXMCEWzZC@lists.infradead.org
X-Gm-Message-State: AOJu0YwfSul0ZKggxsf7pF4nl3wbQpwSlFVVRb4Hk2ie3ZMW1ENcSE0H
	Rtirx1kxvscFeck/yswFeS4WIAXMHjy6Ekjkz0FvV6puBJT+vNIQXXoRf5x4DSY5LFlRcoYL/wq
	CtJXvCEgB/yYu1l1Ha4lDQ4UmD4A9zyY3dKv47H+OUtAtBp7tH9U4gAJKj0WCV6jF7Vptx7nJCa
	z3
X-Gm-Gg: AY/fxX734ktwXV1FFG61hyloi2zDG8q7Q+/SbdEzFBfhWZRyzOuutvSnTz7lIrKjzY9
	5w3nut+yoKHBP2FuFx5XGkB88Zz0+jUJk9MKmY6WFwOImlBNr+KW54YNhTrTDnYNfkUOt+FqD3j
	ft34JzIMUO4qLX4YiFeMielTHA6c0d7sMIZjsPwH1LcpJdx3jt1UQhUIZOUg8jLF1W+v6VoESUp
	5Ksv0cBEeVBx96HiwW8KgsJrqmip/CxQDcUOBTr9wvrQsv3N2pLNhAlk6G2haD7ZVqGjFFByupO
	B/lnzpvf1hGOoD8Ch3yT+yUd3y8gHWboJ3hbRorXnTqF/c757Bsqx5mSaH/0uwz9sZfkIU1cnhh
	zYDZkMKbWVrRyrcI/54n4DtgTZAv5mj3aUsGff+3IfyWnDvWG3xCuJw==
X-Received: by 2002:a05:620a:319d:b0:8b2:74e5:b11 with SMTP id af79cd13be357-8bb3a39c0d7mr37228985a.82.1765495030847;
        Thu, 11 Dec 2025 15:17:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOzc1K0inF9u8pzCleS8AGBiFhiCFwZWvQwaIqfiguX4BE2rhrbkOrS1UeTFCK9BaNhdqc/Q==
X-Received: by 2002:a05:620a:319d:b0:8b2:74e5:b11 with SMTP id af79cd13be357-8bb3a39c0d7mr37223585a.82.1765495030371;
        Thu, 11 Dec 2025 15:17:10 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:17:09 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:22 +0900
Subject: [PATCH v3 4/9] phy: mediatek: phy-mtk-hdmi-mt8195: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251212-phy-clk-round-rate-v3-4-beae3962f767@redhat.com>
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
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1668; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=9Rby/gTtrwRqsiL8QVGL8ZbeE5p6/9ylnJs1vpPUAak=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy5NFQ+IipFUK78RHpdWFHDi1cVcbxE26yeXHc6Vh
 O+zE1XtKGVhEONikBVTZFmSa1QQkbrK9t4dTRaYOaxMIEMYuDgFYCJ+VQz/K3VcuHa+5pQqd10Y
 WTnjKhPnpr8+1w5c0w2UTf/PFv5UheGfooXXh12n7AWuedZrRn37XS3jEh45cYbfFtUtZt8rQzp
 5AQ==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xzJt-7jDsh1wS7a7ighVRYtKh6nV0kTbRMD_JGqQULo_1765495031
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_151713_432887_6B02242C 
X-CRM114-Status: GOOD (  14.24  )
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

Tested-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index b38f3ae26b3f3d8c9e73b43d86510acf6cedb471..1426a2db984d53b91125b18f7725738c44f19555 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -418,13 +418,13 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	return mtk_hdmi_pll_calc(hdmi_phy, hw, rate, parent_rate);
 }
 
-static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
 
-	hdmi_phy->pll_rate = rate;
-	return rate;
+	hdmi_phy->pll_rate = req->rate;
+	return 0;
 }
 
 static unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
@@ -439,7 +439,7 @@ static const struct clk_ops mtk_hdmi_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.round_rate = mtk_hdmi_pll_round_rate,
+	.determine_rate = mtk_hdmi_pll_determine_rate,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.52.0


