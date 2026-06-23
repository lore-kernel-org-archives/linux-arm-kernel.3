Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A06ACD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 09:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LEY4mxBInTV31P334VeLm1dxOKL0Pc0LaCfP0/xhKcY=; b=Rau6qdMlbaIw/+Cchfdyxr3pwF
	9hyn9MYC0GOFgkmlOYHd/47eeu3bqtcm/Qsyc9Dd1noPLeDcZhXiHUeZ9c8DDAXCaZjgPtHQA39Fa
	cnqdfpyFPWi3HD/GGSlosijCP4HBh6ORLE48gIJdhDUuXApjTBbeB0dz+Qa+zmAuTSX6WnQm1/GBg
	AlsEoRug0tzA+f82k6tytSsBIMcQGMTYeSoa4MX4veBBsTfOv+/ICfo7LtIKu8H0iNImTffIUIqal
	+K7xCTBqQ3mP1/DwALSrp6NDTqdZ0X8Dq7MFDG22gEOyajt9ss7qE3NvJHjDYLuhxGjqSX3NwEXg7
	UqvbDk1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbxdO-000000061k5-3niD;
	Tue, 23 Jun 2026 09:41:34 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbxdN-000000061jE-1S1V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 09:41:34 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84592b55832so388183b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 02:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782207692; x=1782812492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LEY4mxBInTV31P334VeLm1dxOKL0Pc0LaCfP0/xhKcY=;
        b=AvCA0ISIaoR8TH0IcEXmjq9oYlLe2X2Rt2+dkYiFG0XN+QWvlE7OYXBGAKsZuk5RLl
         Cs+SISPrL2RLllNIiNjxdHhCgKH3xMnKbQ7WVs5wqgVWZnY0l05MpVHpiEpGL+FYQeW5
         g/7z7f+aMX5cT3RxLYoqacoZRjSgDFAvtL7VWfveTpK6xsOoYsWfKncQPDECPK1TVr+4
         tEbYn58pc2+Cicf5nZIqaeJNLp+jpCsej/n5GacsW/aHGYRm/EpfsOuOpdF1v9O//Tj6
         z1282zDsHc3TzVVIxj/HmYxFLcbrH6H5nsq/60CSN8XWEs6tfPFnVY96eEnOzhh+GiyJ
         k/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782207692; x=1782812492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEY4mxBInTV31P334VeLm1dxOKL0Pc0LaCfP0/xhKcY=;
        b=hq3u8/f6La2dTzlRhbcnyyVKKwRbLWWCEcgSa4UxvwP7bJMi+/iXAwXy8fla90tIqI
         Gc3eA8DFL+6o625wvCkfUoFdLuTHJbDU/HRQyzcvjRAbE+ec3xmXdePdwqcoGgwIxCin
         p9/3cc4uVnnvxL42hRDxXF+jomOC6VYDZvr1MFjEVldePdgHdPC0rE2EN73wNZAqgN8d
         SqhF7l81qu5YM9Yc0pX6XYrlJ/YnrN6tJkepFPFNJuUDQKHjrC+p9TrbvpbItDYv8Njt
         2OacQBL+QYZ1s9JOyTbswQzqJ8c7u/5VCOiXfdh3rzRwZqqZORRQBD+sKgJ8kjHa5nIj
         1WQg==
X-Forwarded-Encrypted: i=1; AFNElJ/dJwCIFGGf/GLy4rV+eVCdwpuH20fQM0tLDgUpp1vX/WH1LmQfzKVeLF13Y7xGsQbhoZpYL9G50EP7+K5QVzpf@lists.infradead.org
X-Gm-Message-State: AOJu0YzODOJXYHRpcDDOC1/3bjo4MJPnMzpum9AbVF+ekN4gucawnVy3
	R58tHOWpkrxm66X6r1MAbh3iQ9rwpdL+JWlkFP51Kyk6KHm4U7q8Yic=
X-Gm-Gg: AfdE7ckJgPiCpMxJ9ZLb73VZTQLSnF6S8zWptNyyffhHaVyy8wlzgs2RLIKiDMu25PP
	GUqxl4/F2E0m+nqbMhUDpg558eGx6u2fEJgChsRsjKORYfyHQ95K+5YMmWXsqSrBuKr3foNRToZ
	C5/sBs0qEJ+KsPIhm9GJvGOOGe7RitGxozOTcLbzuM/lLCXwJDnZ7wiaDnlVS0FHZtYoMskUDDg
	vIGymS9+VC0JTZkvLxPr3n/nJH6LVoAZpq/tK7wPD3tKLQS3QYcEm/y05sUiEsOyqkioRTzy5/E
	CsM6jYZlwiWr+96m8GqY+/kriopRrvxkpfEMgHEZpD5LOJDN5y7FFzMbnrGpuwR7PCnGIThlbZv
	F9dBBWD9KxS+cQWoEjb0jC/mCYtWLKRr7Rq61h9p9pYod0X201xeAwhrf0y8bkZKxJs9Cet/ywg
	OV1yfEi3utwozuZkrs3UxbYGY1QMTRglzTvJsex+RFWONENRvUBBSJanCd25A/N1DvsP2S1tIoz
	JA=
X-Received: by 2002:a05:6a00:2196:b0:842:4387:34c0 with SMTP id d2e1a72fcca58-8459524d475mr2570456b3a.5.1782207692530;
        Tue, 23 Jun 2026 02:41:32 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d6bf73sm10180079b3a.5.2026.06.23.02.41.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 23 Jun 2026 02:41:31 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Yassine Oudjana <y.oudjana@protonmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] clk: mediatek: mt6735: Unregister PLLs on probe failure
Date: Tue, 23 Jun 2026 18:41:11 +0900
Message-ID: <20260623094125.95791-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_024133_382745_830ABA99 
X-CRM114-Status: GOOD (  14.12  )
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

mtk_clk_register_plls() registers the apmixedsys PLL clocks manually, while
clk_mt6735_apmixed_remove() unregisters them on driver removal.

If devm_of_clk_add_hw_provider() fails after the PLL registration succeeds,
probe returns the error directly and the remove callback is not run. This
leaves the registered PLL clocks behind on the probe failure path.

Add an unregister_plls error path so provider registration failures unwind the
PLLs before returning the error.

Fixes: 43c04ed79189 ("clk: mediatek: Add drivers for MediaTek MT6735 main clock and reset drivers")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
 drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
index 9e30c089a2..04cf9665ec 100644
--- a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
@@ -102,10 +102,17 @@ static int clk_mt6735_apmixed_probe(struct platform_device *pdev)
 
 	ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
 					  clk_data);
-	if (ret)
+	if (ret) {
 		dev_err(&pdev->dev,
 			"Failed to register clock provider: %d\n", ret);
+		goto unregister_plls;
+	}
+
+	return 0;
 
+unregister_plls:
+	mtk_clk_unregister_plls(apmixedsys_plls, ARRAY_SIZE(apmixedsys_plls),
+				clk_data);
 	return ret;
 }
 
-- 
2.47.1

