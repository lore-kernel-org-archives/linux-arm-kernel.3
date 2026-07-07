Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6080FC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 07:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgeIwqrRwEWwVAYs7V5QSF1WwroM+m3Iz8O4TkBApNo=; b=iWcfg6KLfMGCW/SSVTuxGNPANs
	k3fs1vJMD8tQrECcbrBbe1/EgfwPd5YEmswhTZiqYha+hPJLRVru+FNc/7N7TI4HWCLE/RQzJmuiZ
	4HgPwuJIWnLo4k6ZOI89kWGEmPhkgxFPT2D1PrWqJUarUqwj3hdCfX2xCd1b6kPGk9K8eZwslCIo7
	TodUi3L2N8Lh5wH+ogpND0L2Xww3KLFDL9kXvmOe1PGFX72rV/5Bpkf0eqDsbiLi682Q5VF7w1ASS
	+Ce5ErUXUnQNfWvH4NVtpVx3F/fc6EabwHoW83plZrKKlDnc/Ij3+V+ZeSevJ36PVFjI6aTdR8KJr
	M0D97FqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0YW-0000000EMLE-0f0v;
	Tue, 07 Jul 2026 07:49:24 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0YR-0000000EMHx-24yC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 07:49:21 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-383adaa461fso2050152a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 00:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410559; x=1784015359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZgeIwqrRwEWwVAYs7V5QSF1WwroM+m3Iz8O4TkBApNo=;
        b=SCcv5Sx2g7kCriomE8GqAq4MYbgHQj2zPnM54tjbzUgJSgXkipBzZisfKHPJqoA6Se
         lQqfDLbXbs746QIvzx7OrFbx85X15zxVcK9iW1LO+NNTnDIQtPcMpdfAGM8Z4SzG7Tdn
         YAdwohFZl8faSh2ZXQylXOIwpIuM50EoQqFNMexhAzeuUMJGsfXngVwv0xUAmA3sc/N/
         7FOup8SRfkYcTQdGZ+H6rmv39h0TYfhb57abmEWaDiuAlf7X7NyDUGXHKW9ges+9v5Rj
         ZclYI3NsLAkhjC46rSx2zvokqjxi0wDKg7JZ118AFvlSohVSzBkv5gkBgDJWwZHpct99
         RmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410559; x=1784015359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZgeIwqrRwEWwVAYs7V5QSF1WwroM+m3Iz8O4TkBApNo=;
        b=GbEAYuYWi9/rt9u4UC4edob9ipSyQj/jxGGVOhKsPYtVqO95J5sowwt1KqwlHzBokC
         eJF4kyrkgB/efCGrOM6ZevNObGBIv3IgWiwGEC5KkMOKNcX9O2PR4SoF8V8/ox42DK77
         TmlaBFoUN38sfEWzH8IVsuuH8iyA99rTvL9LN89J1ViB7RDzPk9vtZABncDcS2VH98aq
         UwbniKcJRopuFn943mZGQV7yW7bdFYi28fIcKaAc1fhAVzdJQIMgk/EqkIQOOC4OEbSA
         TBLuXm7ajWKjq9JkKzZNXqnMSDW4sbpi8UYOTGiFM/0IU4ihKHklIiS4s6YKnhEEW8oX
         XACQ==
X-Forwarded-Encrypted: i=1; AHgh+Roc0kQHyniB+QViim2jfcdH4ZqzhkvacLsWajZT80QOjTINmP9QXGvo741tcTw2PJycrK6PTKcA40pj67YB/Jz3@lists.infradead.org
X-Gm-Message-State: AOJu0YxkXsvK2rTWi+nfXQqToSl0Vh6jqOfCWDm9k3ZyJprEJYWKoTt4
	8s7A4anRTpBsZgYEj5gQ0R8FMLiMkTbyYPGEdfBNIR0O4fk/1pECT8tM
X-Gm-Gg: AfdE7ckXOIAzbkKienh2Ne2JNMWkpiiDfjEKUB487On8d8MMOsR65Su+yJjIZo7Nzx+
	adzHX5V9lTOVNzK6YYyvTFECXt44yAEc70sGyBwbj+Dp61UVwATt0owXfK7lEbXD22LLwmoWkBA
	uU11RY/lcMFKssilaBgcJkPD3JXQKpcvmq/QyJW623b0uMazCNh1rCqmL4CYbkMDV9Xzh554kS2
	sk8HeweA/vyyOhTIxZT+WG2aHbGJ6/0GODcsR27S+8hOoZW05GwodxpsxMrBBbqmvA7omYYDs0C
	WPEcuLTWfF7NyVG+mvSRUmiPhKamw7RjF4ophZeQjBJIaSICA7GuvsBuNrJvfQv5up1nU8/UO0Z
	+HY6bwHmcAthN41iz266rvJA8T3GV33e4/DFlWSLSVHAx8noWQ3zP+uKW8yYQ6qjJqUFClZSE9n
	BGBcMneWduU4VniAUXY5Bj3IgkWIBbHT1Brrz6QUdctciC
X-Received: by 2002:a17:90b:55cd:b0:381:e93b:f740 with SMTP id 98e67ed59e1d1-3875595f2c7mr4256887a91.15.1783410558557;
        Tue, 07 Jul 2026 00:49:18 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a361asm626710a91.15.2026.07.07.00.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:49:18 -0700 (PDT)
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
Subject: [PATCH v2 1/6] clk: mediatek: mt2712: fix memory leak on module removal
Date: Tue,  7 Jul 2026 16:48:30 +0900
Message-ID: <20260707074839.240676-2-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707074839.240676-1-akkun11.open@gmail.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_004920_017838_7B22F55E 
X-CRM114-Status: GOOD (  12.40  )
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

clk_mt2712_apmixed_probe() in clk-mt2712-apmixedsys.c does not call
platform_set_drvdata(), but clk_mt2712_apmixed_remove() callback calls
platform_get_drvdata().
This results in platform_get_drvdata() returning NULL, which leads to
calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: c6368ce86435 ("clk: mediatek: mt2712-apmixedsys: Add .remove() callback for module build")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
index 54b18e9f83f8..087cf574bcdc 100644
--- a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
@@ -129,6 +129,8 @@ static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
 		goto unregister_plls;
 	}
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_plls:
-- 
2.54.0


