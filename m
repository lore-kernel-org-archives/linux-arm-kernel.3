Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EADC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 22:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYtRvLWH1nEitW0lp1POxLyrQ3/VdPLRfNjB0vWutHg=; b=RfsYN1KGv6omCa/6vGtlRBOHqQ
	x0KJpKKl3EwuwaT9Eyzf035D1mWgBD8Ve81cyY8zJoq+0NQISPretx+arppP3vHZO0g0Dm+oO3Y7W
	E1ZQIFCfK/vx+eaQjmy8ivu/Qtf3tKmykWKa6FDMhQ9IEHMT5oXilSUa8XVsoqANvpK4prM5Pcpr2
	nPaLORryU8YzcEmtzMfbyinpDfCsInEGij87QKs5BiAwRDs9tH7Hdgq3UbX4gUhr0mYNHZ531qpVN
	TjnOaFlghwOk8+UocQZBJNGzwIi9kd06RQw3I1ze74E0lUg4MXG7aJLWBf4Wc3htSGXACyPvGFk4V
	R0+gH2cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulExr-00000006946-3YEy;
	Sun, 10 Aug 2025 22:56:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEo4-0000000685T-0FZa
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 10 Aug 2025 22:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:Date:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CYtRvLWH1nEitW0lp1POxLyrQ3/VdPLRfNjB0vWutHg=; b=QouSYgAC+FgWpfdezpj/uMxuPs
	xzJ2I8h4CuVXnlBDaOh5JISMVdMO4euxFi1zsIpTJ1x9+nWmo3AaoDow0kT+J/mRKER3aw22pvAHw
	3RJH+INeCP7r7aEY0MoqM3vwrZbujIeFS0T+zhjW6IdZMFyAp+/QkZ1UZ6L7EldFQ0bQs8QHw4WOW
	YDRsv4wwtpstODjqJknfgpa+UUe6JBAZpWQiDb6Nz0e//rSDlLB9Z1GPxCzn4xXfTfzuWvnzDhMXm
	Z0Yai+n/aQtXzcGIb6G9CfJg867Wz0FZeo4CXq8H7jIhBDFPa6aQUfdTuHMUe5t8YH1IyXZ2gQv9q
	gCr2+B5w==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEo1-0000000FJfh-1UmA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 22:46:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754865980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CYtRvLWH1nEitW0lp1POxLyrQ3/VdPLRfNjB0vWutHg=;
	b=M8F0fhkKz9mJBNNzMjFCLKEy51ZvhoXTFBBuPMOH0ijJ+ZPd5kCvTxrDw58Ir7wkJrD16B
	8Wso0oSylPKNComMVKkmofuEbaPd4MdUQRavCPVzfsylXRhGzQ/o9mDZwawpddilVrl7qW
	DHpii5Xi4e3DkGyx72YLVTQihnlTyXQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754865980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CYtRvLWH1nEitW0lp1POxLyrQ3/VdPLRfNjB0vWutHg=;
	b=M8F0fhkKz9mJBNNzMjFCLKEy51ZvhoXTFBBuPMOH0ijJ+ZPd5kCvTxrDw58Ir7wkJrD16B
	8Wso0oSylPKNComMVKkmofuEbaPd4MdUQRavCPVzfsylXRhGzQ/o9mDZwawpddilVrl7qW
	DHpii5Xi4e3DkGyx72YLVTQihnlTyXQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-EkSsfj5YNUmhSccF8FpK2A-1; Sun, 10 Aug 2025 18:46:19 -0400
X-MC-Unique: EkSsfj5YNUmhSccF8FpK2A-1
X-Mimecast-MFC-AGG-ID: EkSsfj5YNUmhSccF8FpK2A_1754865979
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e7ff9e2738so853552285a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Aug 2025 15:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754865977; x=1755470777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYtRvLWH1nEitW0lp1POxLyrQ3/VdPLRfNjB0vWutHg=;
        b=ZYAUmTIOK8pCPat27cDRo6pXmlN7qz6Fw9jnAxdF7mOCujcRWTVcAJ9IWA3wuiKCX2
         W8hsAQL00INZO0nEJ2gFEyVcXpjyujhtIcCCXmB4ov4imfNDZ5Dym5J3N1jR6O4pwEAe
         5lJdqvg/diBttZkVgPA0vFAdXpELYB4zW2tvhRNpnVTPFt6vmVyEfhCFTGIovSLQBZO+
         8JHKidXMhNjolZi47P4aZBC12yc3+Xwh7ob+dxSORMfucvxQ5lDnAEJirvAX5NCoXzK2
         +5OQ+H772ZEqcDozf6+yBposYz2GIUlLjjspIr/M3e6m5gTi3PIri7m3rBWRW8h/tmP7
         s6qA==
X-Forwarded-Encrypted: i=1; AJvYcCWNik5nP5i3e7KR2FLE9WX63tCMC8x87n5zMLrSG86aeko8aYUtNne1BDaPVRhtPlm6/BWHAorPWylMzM7+NFFE@lists.infradead.org
X-Gm-Message-State: AOJu0YxYLtjOnkMiDTonCmJqk9XRPl5BA07Qz2zazZdUpRWQ5ivok8Ki
	5OqdJyGfyb83prne15bf+vknt9Bha5sztXQGxoN/HcERq0Cva+kXlBz5hHDfZdlsc4GN0pNCx4x
	V6Rj5AiIbRG0f6trNFwnigmZ8cGmvV7W5rpk4150BEQKqZSpwFAljIo5Q4ms9PyzEB1r9o/i/bN
	Cy2d04DpPa
X-Gm-Gg: ASbGnct47mA0N5Q8GDImyVawqxLoJjI8jYh8t9PESerx1SDqQA6bsaUn+t+6Mz6UkFc
	EukiRUeQoRbuPAvNIHEoVvgTZVPxgBbu8yDdnZkKEsR6Gy/NtQeqkvFz3UAMk18Kc+FUU0wBIrO
	T50DBhFLSVc0APvqcNxeE/rNCNgy8JIyV2jU3wGKIdZmLfgwiVVsk1ByzZwWZENgHu4vQZ77GvV
	WjlVh80O+k8j13pKmpVn45BBx5DQuzek+ZzExtkFahRFPtqdZKdksfXBdQjKMLlPoa2pl6IUh55
	H8rUZ0GnMP/rIaZGBRygpBmtDz4orBXj5yQATjyeVyaFsjQnSgMseSsmi/3h5kO6dKY2LYOQeAk
	9xobrFw==
X-Received: by 2002:a05:622a:1a93:b0:4b0:8037:c0fa with SMTP id d75a77b69052e-4b0aed93038mr151727511cf.58.1754865977535;
        Sun, 10 Aug 2025 15:46:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExCDCgOrUi7VTan6/AGqAAE3FbTWvD0DlZHmaitVHPb5PTrx90u14A2hmRLrvSxJ8XKrUUiA==
X-Received: by 2002:a05:622a:1a93:b0:4b0:8037:c0fa with SMTP id d75a77b69052e-4b0aed93038mr151727231cf.58.1754865977145;
        Sun, 10 Aug 2025 15:46:17 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0ad996459sm42685171cf.46.2025.08.10.15.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:46:16 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:45:31 -0400
Subject: [PATCH v2 3/9] phy: mediatek: phy-mtk-hdmi-mt8173: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250810-phy-clk-round-rate-v2-3-9162470bb9f2@redhat.com>
References: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
In-Reply-To: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754865940; l=1767;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=+ttqLK3CCvX22rG8r1u2aky/pyqBIfYJ3wcP4wTqxkI=;
 b=3obEgP8yrDCMdOaBGI+w4Tat/8TZLPDL5bV/fvqowKe5RG+J17OP5TtRquid0xdyZAAnUyd/x
 LCD0oPAU7awC9owBT91elCcJ0kc+tWZOGloj7ttnD+fpn6ULYnrgJiH
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ISNWGKkY-DCSHPzv4jlnudd07YLIzL8Y9uEdQNM7efk_1754865979
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_234621_593355_1D2DE583 
X-CRM114-Status: GOOD (  13.15  )
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

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
index d04758396046363ab9edc584ae10bf31e9c5fb0f..58c6596c8c20bdacf96a97709b8f5709f447e85b 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
@@ -118,18 +118,18 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 	usleep_range(100, 150);
 }
 
-static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
 
-	hdmi_phy->pll_rate = rate;
-	if (rate <= 74250000)
-		*parent_rate = rate;
+	hdmi_phy->pll_rate = req->rate;
+	if (req->rate <= 74250000)
+		req->best_parent_rate = req->rate;
 	else
-		*parent_rate = rate / 2;
+		req->best_parent_rate = req->rate / 2;
 
-	return rate;
+	return 0;
 }
 
 static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -223,7 +223,7 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.round_rate = mtk_hdmi_pll_round_rate,
+	.determine_rate = mtk_hdmi_pll_determine_rate,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.50.1


