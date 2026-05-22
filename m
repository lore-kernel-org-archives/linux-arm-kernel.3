Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD65BCD5BB5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dxXaOJSuBxLpTcleO22YqCMwLnSiBPBLJ7fTD4JoKzI=; b=1wOxpRRqwkiKVneQGVv5Nyeox1
	C9QywDqznCTzStHaoUeIF3uYbddNDSQ7BnKeanQnjafXJB6814BO3g40JiMDP7lb4jXzLJfzMnvKc
	HejWwvgaNcdKc72vMeKx3U9KqYZfOpnaVI6fqERO6f+uC/3isbrDsjlRTrRsB/oq1T5wtQNXtZxxx
	hnU8P08nL+bgU67WaOtaUwdOBUdW2Nlwla0AfH6sq6bd2FFGD4AuTU02wrxVsBzJug3r6AMhoH9uc
	HLDPOM+7pTdmNZDkf/vNB7emtzxzFMQr0PUs330fAy9YxQrYEXKPOqqNIRPCxHqWHYIxaacCTdUwk
	lkMUIb2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQC1-0000000B2PX-1d2d;
	Fri, 22 May 2026 13:45:37 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQBy-0000000B2Oe-2dRB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:45:36 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c7ffe8eeaf2so3138093a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779457533; x=1780062333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dxXaOJSuBxLpTcleO22YqCMwLnSiBPBLJ7fTD4JoKzI=;
        b=dF6V1xPVPq4OsUkTbKwN/k2FC+C91jSslljNST3hOjGkX0V3mmw60GzsV2dwCAmjko
         TIVAt9wsiWwJVSoD2Yum/e9Sfxy1A3arswIN04CIrvjwz7Y6h3KwOA3MIjQ7MlMZ2Hx2
         cSueWbw9jXmQTTym2EZTJ1hkIBE5kZD+LvWZFNYYruQN59RiPGrypALi4j2O9Urag+1z
         thKdazbY63AEWfwyK/RonJwEMxn7MYL5PhfWTRVceTzCOV3l80vbqaUjtdlrObSeZyRV
         +UsaAUAmDCKHd8gPKnM6WuWBV8dy8H2I7E9427Zxyc4Jg5ZVgoVctCbALjJ59wZgTtXD
         tisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457533; x=1780062333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxXaOJSuBxLpTcleO22YqCMwLnSiBPBLJ7fTD4JoKzI=;
        b=NGBGo5fUxX0csM5oDiXbrd9lxAmWsQi3kJpkptA6vmdfcz+GDbaAzPkTDkaCdB4Zv0
         RzrR4G/Ne9paDN0tuXHjpihHTBFWX6rtutvbqmnk4rr/RsN+fzXZWa8yaxQdyAG4bAyo
         XExAYKcY5wrHaTgo66r9wxGEn7g9S7bIfHCYSgE8c2OI9Jk7kRxReuL6uwqNfcE4yuDk
         uxOjayPeufaGL7FJu8r8pQQEah+p3hD7xyau3GqmqJiqcI1P1LEzjjZzlDy/xfRuuixV
         nZpPxobqUjvNzjsvc6jNR9ASLZZQ6arzhHGOlrHov7LoGeA3k39sFQctnLZZ1r1MmLWX
         KawA==
X-Forwarded-Encrypted: i=1; AFNElJ9Fl4VapeWkWKbBJKfJmnE86U2fhECWkBjohdBm8WLTDqoCwf693m96MNAjHNSMUjXlNlfZmmdlzpARkSxtHXVC@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9FZL6klwXLAhDeXwPhnbEJ272Bq0FZVy9x73DEBAbQC1gxTz6
	4fmWxu6xdUaYw2cGrmsfrRgjXuomNi34e4C9JtZKpSnvRC6MWZXz62oU
X-Gm-Gg: Acq92OGsPQKWTn2QVVove4R2Oez8KoKF1S5HNz5AGcofriuoXyMROsmGrvdVN5uEOOY
	vfOlWnBOeWvs2I7uEi2euVI5QtcgdxCnMq5MJQy2ZAs3udbn8mm6WXqmKZZ0ljaw9Ln2qBtmwxs
	0v7b3rA21W9cIN7jwH/FapJG4VvoYhd/Ucfszw/7ZNma1h/e0rNayNk9lHmyOXYbbdNOlAujlgY
	AzU2RmhEQw6ZvyrqAGnUJ8Z7nM/tmKTeuYVKnyRqpzrR7qCO4ZsIKf+dGbE5QD5Ft7GJC1tHHsd
	nXTNS2KBHiwSF1mpvPRVjSGWqfsGu/te91pn3t7CpJYSzuSGMDaZMgwI0m1rF91VuPT3tp6qU/a
	PA8iw4YQNGiYr/wGqGaqNUtNub1wM9z8eU9zo6CLqK9EEo8ar89EH7s0cUd4Ke2HqXQ5afM7/oC
	Hq60QmNnKDFG31SJaTzbKNoaqt1kEfKYEaW57lR+iHpWaQzo9/50nEt51sxjp7ZJLkShpuHuFmm
	XrjPMs=
X-Received: by 2002:a05:6300:6d8d:10b0:3b2:8675:47ef with SMTP id adf61e73a8af0-3b328ed49damr2269027637.45.1779457533469;
        Fri, 22 May 2026 06:45:33 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fb00b6sm2677299b3a.40.2026.05.22.06.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:45:33 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: james.lo@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH] soc: mediatek: pwrap: Remove obsolete NEED CONFIRM comments
Date: Fri, 22 May 2026 22:45:22 +0900
Message-ID: <20260522134522.368073-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_064534_674099_E81A43C6 
X-CRM114-Status: GOOD (  12.06  )
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

Remove the obsolete "/* NEED CONFIRM */" comments from the MT8196
configuration. These values were previously confirmed during review,
but the placeholder comments were accidentally left behind.

Link: https://lore.kernel.org/all/2a117e5fe9fe0ece39e9165a463082ef42be973f.camel@mediatek.com/
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 0bcd85826375..87bcbfa2d5f1 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2396,8 +2396,8 @@ static const struct pmic_wrapper_type pwrap_mt8183 = {
 static const struct pmic_wrapper_type pwrap_mt8195 = {
 	.regs = mt8195_regs,
 	.type = PWRAP_MT8195,
-	.arb_en_all = 0x777f, /* NEED CONFIRM */
-	.int_en_all = 0x180000, /* NEED CONFIRM */
+	.arb_en_all = 0x777f,
+	.int_en_all = 0x180000,
 	.int1_en_all = 0,
 	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
 	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
-- 
2.54.0


