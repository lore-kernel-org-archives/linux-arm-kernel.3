Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29FFC44500
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 07:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6aDPvskXT897p+or3xpt2a/W5VjcXH3b9UnC1ZCrck=; b=tZE5xD+vqBWHRyXjAU9IPSPvxV
	cYJlOzwfghnWzkbqTUKRg8uPLb3zi5YHUAGImmEUqZr+QZn6xzf6nwbiUJj5GsvMi3oPhsJf1l8yP
	GR+rzLzy5tUD92a7p31pkuCV+uEq4sYEv45Vh7DXABoVyTQEX3nnaCwMu7QYf/QCOy9tgcuL4hCoy
	wFSUm4iNjrX6HnPKpfE9BwO97jwrd3J1MIqa4W61xBCFCs7y3SgYzy9CSimZzz/GW6r8sIFqDhc1k
	IR9ovjiA2q4SdPIwc8o3qLoAWEqzWD58Ir1skAnQXhDo6HXqtwJYdv/6cEDvQFISvFMj07LY+2g2J
	7O6hEvKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0Yo-0000000EMav-0Obl;
	Tue, 07 Jul 2026 07:49:42 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0Ye-0000000EMS4-32rp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 07:49:36 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so2605864a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 00:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410572; x=1784015372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6aDPvskXT897p+or3xpt2a/W5VjcXH3b9UnC1ZCrck=;
        b=kAip2jPTrq221P+fpRe+THNFeh1nwaLzhCK6N9u/l0vQ2det3/SDyU2Xbl6UOga+O+
         +G4u6X2vor88Gz7Vre9TtY/0OutlFTGwg9YJ3SxV04p9iuJlkBSPtOBJ75wgpzHstgZr
         nKlO6kQuH5JWzftMbejMRhhszYmkSt3tsG8ko9BazjbskgboidmGex6S9i/6x6L8CpJl
         CuHlNcUxfrNZQgPF0wMvfI1JJouhXoa+TPZwpQ8oOeXdd7bQH5adsgwiKng/FjLJvacX
         0lB5Yfw0o1ndqnwY1idem5/l2qbeNFv+w6K9KUtYEIaMWU+7pa95dgZDnqPgGPuLBvh3
         3QeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410572; x=1784015372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c6aDPvskXT897p+or3xpt2a/W5VjcXH3b9UnC1ZCrck=;
        b=PE/8JNs96+k7HcGFBXW0H56vQ7+KtZofuf7vK5Hw7uc1UVkWtiumF6xrIzIWtkmnb1
         5w56DWkBC+2M8l+sWeuTw+jneIJev3ewCHRL6EHGYhOSOkpm/Y2SAyd9FGKqzgoGeqzK
         YCmh3c0PyArhjW6KZCsURXyMtb1labs1I9TFNcu0uOnOXM7xP7es52LKHUqvlVx1L7QS
         TDLAyompacUDC9izBop5+/asNVTzHEv7zSWd3nUtKYiZswKA7evOjggCgOspcmRyZcMC
         HuO0TP1UhJBcXPZ0B757FECtaR/09ztyPBipBeiUzoE5gV2g1h5nruhHp/3jy0MJ4LcL
         lNvA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+0CkFznXtnF96KirhR5Uc8zDW2UOx4nWrjGP2YlSEgOErBmiKC1KiWABFuLlS6H11ruItsTW04K4DsUiQbuVm@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9HOY2+yLkfh6gBfB3rZwul6keFdG1fvQGaicimKijWnRtFlY/
	KEtHk5OVwEq7Jh8UpVnFBrtyTaaNym6baQE5pUyQydMP/kqMLd9WndC9
X-Gm-Gg: AfdE7cnb/oxmUXKihOQTBwfq+L1o3PlL6+x6B8bHIc2ZpbgfjZGnb+fhTntfUgL/lgM
	80l+tw76PMLBO13L+H7l8kkJrmViG7HtXiYkwUVg3p+vN336ECYjlX+499obKtOcxl9aQBHLAuB
	NgMT3wK+rkw6XD0uD/dFMhhMaI+nzxsoRltxSDl/Mg6BlnC5VPlhPknQOaXzaS8jzPnS6vk5wwQ
	00yn3VgKR5C44EaCAlkDwiNyoYIiP8/wYpWMZ+HCbIR8AuaRFqaiVliV2JhnsNJvn73zBuvRmyC
	JplVdnIM1jn4enGHli7GUDkB9Jv6rxzhlxxtoSPXaEara94ISDwgQ7vEfi5ZpsPy9Xs44LIWtTg
	WdhYC3BDfrNjIiV6+O/rQawHz6b2R6r8EfCNaIUPHEIm560e1gwHooxDHW5gnT47p7yrC5dc4A0
	Z+bk2Y5jHRPQ2KrEsQJykiT+y4tNfoX0pJweDiarj1BzlvTPaSYNWUtRw=
X-Received: by 2002:a17:90b:4f45:b0:381:5bd6:eb19 with SMTP id 98e67ed59e1d1-387570c4074mr3687519a91.18.1783410571866;
        Tue, 07 Jul 2026 00:49:31 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a361asm626710a91.15.2026.07.07.00.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:49:31 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	stable@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 5/6] clk: mediatek: mt8173: fix memory leak on module removal
Date: Tue,  7 Jul 2026 16:48:34 +0900
Message-ID: <20260707074839.240676-6-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707074839.240676-1-akkun11.open@gmail.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_004932_761628_FBDE7CB3 
X-CRM114-Status: GOOD (  12.78  )
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

clk-mt8173-apmixedsys.c and clk-mt8173-infracfg.c do not call
platform_set_drvdata() during their driver probe callback,
but their remove callback calls platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt8173-infracfg.c   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index d7d416172ab3..65dc4489a09c 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -179,6 +179,8 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_ref2usb;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_ref2usb:
diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
index fa2d1d557e04..8b69009e1965 100644
--- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
@@ -128,6 +128,8 @@ static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_clk_hw;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_clk_hw:
-- 
2.54.0


