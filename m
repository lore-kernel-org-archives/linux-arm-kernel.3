Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E1ACA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AxFZWCSKR4desKiHPJ6haTS2ebGrBTXqENWB7tlhWOw=; b=JhvalFqAu8yteKw2O/2bxJFmFx
	YfLVO9ye9Go3KMZTNLBpRn+EQ/XqLPfGqjn9aY/ehog3cAjCLf1fi1yLZNWyForrb/0cIIQf7/xVE
	rREJ+/o4y0fykElpn0mbUnYs14zSsgJ1sd7IS/6kvlXRvEJcRkm2H+xvi8H3J/M7TwUwOKb6dYPT6
	L1ESfZtGVMpNAxIbMyFgeHdd6B6FOqqRu/h3a9cnhcK+q2Xw4D916BPCSg+9JTOQcVn8/rkjp7QMA
	9Wr97UTJy1SE4f3eFllPLT97DB5NMI4pK9H15AdKAo78+Yw36yQyG5P7ua39ldJmn/qS2eA4IdF5n
	Ve4orsIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQG8-00000002N9u-2ex9;
	Fri, 22 Aug 2025 11:48:40 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLGn-00000001hIf-2mJc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 06:29:02 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-323267bc2eeso1451464a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 23:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755844141; x=1756448941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AxFZWCSKR4desKiHPJ6haTS2ebGrBTXqENWB7tlhWOw=;
        b=WgsnfrC/K2z5KexlSLVcLz6aCz+v+7xKwXSjIg4V9UXJfgzfNHOwXuXvddf6sEYXz8
         KbV3IVDbtlwcfR19KmXIqZOcW6ojXtMmqYScg/JJg4+J6qiN6k0JlRYTNLrXsSYJgnCB
         EMTwuUV4ZuTnpwd24vvMTkzTRufeF7sugwW9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755844141; x=1756448941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxFZWCSKR4desKiHPJ6haTS2ebGrBTXqENWB7tlhWOw=;
        b=W3MQw45XRMSq5bdSgtZSQf0EjqmxQb1+DU+RMv8SZ2l6NI+/ZOtvw3M9IKaboHoRH6
         tsmpX1LMquCBhIGgaNKQNEBnLRoZvbUhSqsUvxLK8X852CUPJf6w8K48Aac2R36qNy50
         zyA3QyWQIohxuyJtq3tJhuaedL1hEhxp3GIsH5xR2j01h0fuCdlKyn2mJYGAopMzK7F1
         wTPqzyR67XUChv7uaJxvLx80/iRI/2txOS7iUBJHqwd8uRzTBU0ZxbEx7XcLAHM5OHwZ
         SNJrNeW0tRt7lmnT+DoHHYbLvdW/cbV6jfO6MAEwiml6ar1neJxf7GgwzmPmqeeZCk7l
         cC8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+VeynN46jxwSo7NIGTghF390LOyijHK6aClBfAITi73ubvl8zgK5RU4584sXsZgp6WKIPJyQwC0cM7IzJ7wqu@lists.infradead.org
X-Gm-Message-State: AOJu0YyVoQgkKlKQQyOHH3ia1enr9f6SfSx8+KOU56SV4egLYmW1tgE0
	Iiv7STQXz9q4pOqP+p973ec7D8BTfgHKCu5cGwYPR7YcfAl3abCQRAcuwB3uVCMjcQ==
X-Gm-Gg: ASbGnctdVPTfXD835c5xjlJY+7l4/g1+eed9Ftj+ZDF9ZgPvlnmrn6W5/YwsRewBwqY
	hXx6bObwLZcwUufnWo6fFHnN7TRsMxf/YWUwJDCTj//iQUlC+Cou1EAq1+udJuzVGhw17M28f8F
	tAk5LGH98Eg46FjgQwbBOfT45vBYvi1ACKMYuXhJ4iXsgOE/IkxFh+gjQgYRc1767EO33iqk8mP
	LeRnBo05pGbFD/D/YgnGxWfuQt3nHomR9+WjxwUZ94wkpekGk5zuvGE+ppyT5PpFDKQm8bhK8yf
	9cZYsirygLJBexaUSX9MzvyKFKjUptHGAZAhm6wYnoiNR10X/cmg/RIshtwf1v19aAH8n5RZ57S
	pnrNm+wbUc81orasZZFXut+iUJzGDDGfj7LIKv7rQ
X-Google-Smtp-Source: AGHT+IEmIoRbqzsMhT4RaCduv/mgQBiZTCW0YMv/crR9hLxBxCwCtU4VSoj9WK1ncCfxE24zov8CFw==
X-Received: by 2002:a17:90b:2e0e:b0:313:f6fa:5bca with SMTP id 98e67ed59e1d1-3251744cbfamr2642987a91.22.1755844140925;
        Thu, 21 Aug 2025 23:29:00 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8278:5411:367e:2f11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-325143959e1sm1530661a91.23.2025.08.21.23.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 23:29:00 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: clk-mux: Do not pass flags to clk_mux_determine_rate_flags()
Date: Fri, 22 Aug 2025 14:28:52 +0800
Message-ID: <20250822062854.2633133-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_232901_700735_077C9990 
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

The `flags` in |struct mtk_mux| are core clk flags, not mux clk flags.
Passing one to the other is wrong.

Since there aren't any actual users adding CLK_MUX_* flags, just drop it
for now.

Fixes: b05ea3314390 ("clk: mediatek: clk-mux: Add .determine_rate() callback")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 60990296450b..cb015dcf8d30 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -148,7 +148,7 @@ static int mtk_clk_mux_determine_rate(struct clk_hw *hw,
 {
 	struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
 
-	return clk_mux_determine_rate_flags(hw, req, mux->data->flags);
+	return clk_mux_determine_rate_flags(hw, req, 0);
 }
 
 const struct clk_ops mtk_mux_clr_set_upd_ops = {
-- 
2.51.0.261.g7ce5a0a67e-goog


