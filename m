Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97F8D43360
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 23:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nS5xyU79VC7pO9m99ZFsFBSh8nnXakLQbi3bsJkRuyw=; b=Iq772xFi4zBACEdAArYFmtqZXm
	cDFy2wG1lAICJQxuk3sxDy7ZmD6DMTwXDOk/Y2UI/Gcb6REzUdXw2t4tgIsgNVg87V7NIEohBkxjg
	tA9/A+mEi5DKQ5nR5gXWqx9uifb4fkuEmdvrJMP55k8pAvFZkeFP62eY1GXgTRi10snxJkj4GEeoY
	HTb13dEjlhd+19MwWoMNTQilulAOuFxmkV0G5gl+ff1/rz2v5mUNWavQK4IeOgeECp2L9eueHWaEa
	LoC4//mn/Z8TLSiW0EtCUwQxUkGX2lHlGCnAKy8a8B3+qUFGJpLL4qqhFMLP+Qor/W6cHtF/6I4jV
	e30ak/Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpuI-0000000HOew-1wHt;
	Thu, 11 Dec 2025 23:17:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpuE-0000000HOZZ-1aKO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 23:17:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nS5xyU79VC7pO9m99ZFsFBSh8nnXakLQbi3bsJkRuyw=;
	b=J81QapgwbYH44uKbWJ6ROx8uMLQ/Shcg8r4Apek//Q5R8unlgrtzIWOgh3qXVEeVBvYAyT
	1fKHv1EHDA9FjJDMAmORhFxcEeqJC2Ld6yobyjPdxuJQN89CrB7nsHtsiAUmbR5xb1YAMB
	vs00BQHtkMFHBkrBZFTRrB3lPoylZCU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-sOlVJyVaM06ZjNVRjoHRkg-1; Thu, 11 Dec 2025 18:17:03 -0500
X-MC-Unique: sOlVJyVaM06ZjNVRjoHRkg-1
X-Mimecast-MFC-AGG-ID: sOlVJyVaM06ZjNVRjoHRkg_1765495023
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88044215975so18656676d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 15:17:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495023; x=1766099823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nS5xyU79VC7pO9m99ZFsFBSh8nnXakLQbi3bsJkRuyw=;
        b=WQz9xCTVm3LnEMINrWdlGbV6EL4wZL2Cv51yA26a8EBL8orswxQzgbL4bnGZZyearP
         38afKzPFSB5EO3wtDKjGmY5oCHSNRd+NBdfKSjqkZSh9JgjVmY8Sig3gbqomBGFq/b2V
         oDD9kSN3jULAJsn0aCU2AspzDdTmxv958v+EGOJ45+pXBBX4uL8/SQ04AQLSZBw7uGfc
         3nCC+Z7ZF7J6sdgHo7CpTABEuoFlbnVoDcZzkuZD8RsNdUYMqdgXTqJsXSYVTQcweuam
         QufHyrBcOZ3vepsRn1BXcNykIiGWeTG+DAHNyGgQXUOQH1trGom4dRUpZdMnDET/SlTr
         5GFA==
X-Forwarded-Encrypted: i=1; AJvYcCW50FOLsd9YsGmMiDtX0m/7UYXCxsj3Rk1nMfg2vQPCSLKXQSU3SCyAcALtBodFgAwMbDHJJvv21WD8j3Q9Cc7P@lists.infradead.org
X-Gm-Message-State: AOJu0YzSLhBr8YGDlO6zspO9PRMWoRXCF+VhCCq7dkajp51lpoz53k1M
	LtwztzCDfeGZvo0SCsM57FVQ43LvlG5YRiYWgZ5JdopNSLZjxJ6AA86pNiGFlICydmWExUfzeKE
	1yRkmpG9o5k1as6/J9NHNV/ToxzoeDvJ/ukt4IC4ExUc3JCNOT8uvzifRj6A7nEl4vqiG6xM1Mo
	sV
X-Gm-Gg: AY/fxX6CXj1rdrgrJm2xgsdW/kjt2zTSizDxo57O0aXKkgWeYbdgOTiKKhMO0QnPFfE
	uxtCBHAgXVbcjiBwnYKi9DwH4k8ZUhUmNfitEoClVzIErVTBz6xHVBijRjzb7GD8r+O4jaH3QXu
	3ZF+1Yj666Jm6MVFLpG3TcunQir4iHqkmPsT2aCBf9KZRhN0eiUC+FyiLdQrB5UQKdmoOcso0pR
	yXc4BEGm+mx5iBctXJ6GbTavUdyzuQ2pvT0SqJoeCDNgQVZrFHKXldYkrQgehvDtW2UjN5Z3KH7
	qGTnmwXHickwCA5dInKw/uWjCwcd//byUpwU+TCG8HbZv6B74BUoGuwM94/u7nxYJml+fIi1Svh
	6eDIpkGYOwTGdhkbWtbFMNwh06uHhEl8WVdL/cosA39utTBQEYrheKg==
X-Received: by 2002:a05:6214:da3:b0:87c:2bb6:741 with SMTP id 6a1803df08f44-8887e1b44f3mr5869506d6.29.1765495023039;
        Thu, 11 Dec 2025 15:17:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmZS1L2hV5aQ7zoKqGzhOlVyBusG0wgauo3NmQeNT0uE4Z7Yi8ZXh/Hs5OUyLkYfq61AO84Q==
X-Received: by 2002:a05:6214:da3:b0:87c:2bb6:741 with SMTP id 6a1803df08f44-8887e1b44f3mr5869096d6.29.1765495022716;
        Thu, 11 Dec 2025 15:17:02 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:17:02 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:21 +0900
Subject: [PATCH v3 3/9] phy: mediatek: phy-mtk-hdmi-mt8173: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20251212-phy-clk-round-rate-v3-3-beae3962f767@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=dOjKoMKrjNLxDaFcShGY+TJnvlU5rN6Rp3COkTM41N0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy6tW+pYkrBzwUUlxS0J0x7VsluaTZ6+7OiGG/29C
 o0TxA+mdpSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCR1qmMDNvD7Qu+nZTe//Nz
 zwtxS0fpvY6eBWGv0n+W8BRfjc2fqcTwv2ByUtGe3QVXa0ztl0SYGceaG7w8xMv6I5Zpvld6Td8
 bDgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ns6_8GnSqPR0eVs2Y8hV0G9qbDkIbq2wb2dvsSnGza0_1765495023
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_151706_501071_9DF58DCD 
X-CRM114-Status: GOOD (  13.57  )
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
2.52.0


