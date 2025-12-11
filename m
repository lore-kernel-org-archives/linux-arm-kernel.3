Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8553D4335F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 23:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWALxHwSjMipreZEX2Qfe1SphmPwPCWuPZgQtUxY9NY=; b=j717utZ3YUWQC2VnSGiZIbOS7v
	3nipjWF20khRiCMtuR2FioItGhb3RcrRhMqf2UaOoBoMx/cyaGnLyzLVsgrdIL4JZNqDxh9WhHjF5
	1VWHRo7Xc7VmFgU4JXAP3GgKDxtCeuP9Oiod4Qjmg1tdaPlYcQC8beK/5OMlYC5W6KnsxwJp/x5zv
	BRU1/dElLM4XCKE/3WcFT4L3SHGRW0mcDsJYkJoZoRa19IrvC9Ie+oXB9uCVOAi0ZDpdzTu7/hi7M
	j+jWnnetHJYeCdRUSTfRba0acNdKM7KjVBrJn4EVCqtqWumvlhVE7JX/+eDFUfDzcj6u6urr9hQ6J
	ADmJJG+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpuM-0000000HOjZ-42ad;
	Thu, 11 Dec 2025 23:17:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpuK-0000000HOgZ-1TN8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 23:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CWALxHwSjMipreZEX2Qfe1SphmPwPCWuPZgQtUxY9NY=;
	b=CshSPjVK3jhIaV4xCQ+yx/hxPQy8BF/xnswdaHMrecvNjtI8xZ8FAe6Jqz2EdgHseu72tA
	3zqzq/EXVzJW4WrkfTq72yokuyx5ZFvt7STAoLsheI+kzxk60f7QHRaS0rwY7/O2rukaWL
	QKO1BKu3LWonHEw6EBqIn7/yyxLOzsY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-Hm8M4eOpMjuzTKcQczGYVw-1; Thu, 11 Dec 2025 18:16:56 -0500
X-MC-Unique: Hm8M4eOpMjuzTKcQczGYVw-1
X-Mimecast-MFC-AGG-ID: Hm8M4eOpMjuzTKcQczGYVw_1765495016
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b9ff555d2dso162731685a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 15:16:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495016; x=1766099816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CWALxHwSjMipreZEX2Qfe1SphmPwPCWuPZgQtUxY9NY=;
        b=XqG16H34iBjwBFLta/x1RGQjXmGN59uYOT0JiFgXidMJdBS/buEAWl9qcwczymI5wh
         fE37Ngz6buoDkdvpfHrGGqeGUhNaYaYCOvrSjuIXFasNrnmNC14Mfdrtc1tBP7QS3VRJ
         TNgu1a9Ik6NxS+tXR6a8xKiYskl5at85UZKMIRrmPE+NOBsbZF6z3uBVYBtZlPI7X10F
         yzRbuW7AtCq6FCjMweiC88C+NCQ9JS8W3fl7OolrkCBxkniN+bEE0S8vrK4e/DRYxO3s
         MFziwNxKk/6VzgUhnzr5eACaB1iDdaEKpW8uZrkQ5e9i9TVsCwQncWeAjG11h6rm61dy
         EfPg==
X-Forwarded-Encrypted: i=1; AJvYcCWxXiqqHP02rSJvAXGGzCpo2wwIqq9JpOHiIVaCeZ5fRNomIpQYU5mSy3Lz3s4LV8jdeinXrOks/9xKx/mUWgxv@lists.infradead.org
X-Gm-Message-State: AOJu0YwBBZVSRw1VUNoEpAHlAxMvgE2RBl9y+qjK+BZ9lJFTqvml+LH5
	UVa7oCKPBvCev2/5xAVcYGBDvRSXuwZpo757ExD1k1UU7NETMMBWzUcWmIW0eQOvhgQXu72qZTW
	UIcVeLvulQULb8iI4qLaCYugIC9AqGzBP+Jyd3ojwXZav9qeLkkfJR+eMz8EJCImrExJkBxIcXo
	7/
X-Gm-Gg: AY/fxX582CIzsffTMVkJ75mqhA9heq4niS0niXXMgPJUwbXz9SYYscNkMo0T5JuCJR6
	Hq0+cp525dpQIQDsB7wNA92PNr6c2yejw5zXyvnis8Zq3t5EQXYyGL/8IZNkxLKCkIss156mUQV
	8fcgKsLEh4zaAnJhpRh5miKSEwMUlftxCZPfG0C5ivAZkRUwW4Y694xW/bR2T9w9+EbDh63VGck
	kRbmgAEtJknd9asNUZUCTj+aWlxgf0WnC+/Sn2weAezgPm2xchhNJ9laZwFQCnzB8F41eLLBrjX
	GEpS2fiaCawVOJaf6ZJwUw8AUT57Mw0QAFQW4nHhTAM6SdJoTs99BmGm6qD0teZf75LFU3SAjYj
	hnxRB2qUqoUCf/ot0UGMFHLetTSKmVBaVmC9MxwDSIUusM/iPn9WJHw==
X-Received: by 2002:a05:620a:29d2:b0:8b1:8858:6ead with SMTP id af79cd13be357-8bb399d90bamr39282085a.11.1765495015854;
        Thu, 11 Dec 2025 15:16:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2s8wwcOmxwXaF7bKZgVpwocL48364JqbwVZMFBYNgdRIsZcitJ0mH0HHmDGJg8J0urTG96Q==
X-Received: by 2002:a05:620a:29d2:b0:8b1:8858:6ead with SMTP id af79cd13be357-8bb399d90bamr39277685a.11.1765495015467;
        Thu, 11 Dec 2025 15:16:55 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:16:54 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:20 +0900
Subject: [PATCH v3 2/9] phy: mediatek: phy-mtk-hdmi-mt2701: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251212-phy-clk-round-rate-v3-2-beae3962f767@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=b7GdsrXKjZPd7UPmB5Kvn1MxBtjV4+5gYAk+zH2wXY4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy4eruXZckDLUdGk4NCf1DMH3S23NTlWqza05L27d
 j9Mk3l3RykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABN5vo3hv/s5eRZ5xg+sCw0l
 u954X731i2Wfsyj7rWvTHExexWhducDwP2M694nJjgtaZ3hrX35Y2b7FPuB4oXXsynttk8VNEja
 v4wYA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sEtwfzxgknEokfarp6CcPHrBEeT4KwrjG3ynBcNYdwE_1765495016
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_151712_460357_BBB2523A 
X-CRM114-Status: GOOD (  13.55  )
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
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
index e51b2d13eab473dddace48c75c2a8d73c8c65635..b0b6497e7eedcb6867541b573d22156ded29a4d5 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
@@ -90,10 +90,10 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 	usleep_range(80, 100);
 }
 
-static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
-	return rate;
+	return 0;
 }
 
 static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -170,7 +170,7 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.round_rate = mtk_hdmi_pll_round_rate,
+	.determine_rate = mtk_hdmi_pll_determine_rate,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.52.0


