Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61124EA3F08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 05:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=onU77N0wQuj5Lnll1/fvZOs/qEnLfPl+2FK8REXemOY=; b=cnHJpDxwzpiCqmRT1KM9rEh8zt
	3ZRvn4Zcj4tDYpnUf9RTWhcvRWSDXDQztHV22PWXNotTBPwxtw6RK2hgZNC0IXjquyeSi68YNosiY
	04MfwP4bZvoJw9ZIwJP262yWHKrOmbSXEu69AToCK+yryFxjYlHjKrZTmVWM44EhOPsQwG259oJci
	l9fw++E1HpkjyJbl59LxX2oTaR1ZrFvZSoaAydDcbwMyG/pm6sCSek9d804BaO4HUL/rMqVkkLE40
	RKNYM6qXNZ/1oNLsjd9sCkQwpYyJYzE2cDveejwVLpmWjQzzfGfg3cpH5i9ZkFS+wiSd/UZSuT4FK
	teKmlU9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgUZ-0000000GU0v-29OH;
	Tue, 10 Feb 2026 05:41:00 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgUX-0000000GU0A-1UHd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 05:40:54 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-8c70ab3b5fcso515630885a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 21:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770702052; x=1771306852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=onU77N0wQuj5Lnll1/fvZOs/qEnLfPl+2FK8REXemOY=;
        b=X0g0fLtSzCI+OAxzLa1ZIoHCKyaIUREt3U7SIG8jNU9Y/57kXG204h7RRU0OAvuzeu
         uiNHv3OHb37dEJX5O8b1RJs04QR9x3dVNF0pwLlxaR3I6LStnnB0m9rA09FC9nl8Dqip
         qkB4PFALT89b/00W8lxAcSBgzZ+Mq9LUbJL23ktr2EiAFFelskVuFe1lCfql3MXyWHyH
         V1zseEm6unYMhKb2mXMCFXDifID1+RthrDW4VOk2HBjXlYIGxzGxk14Zz7GpW78Xp8iD
         10DPlaaLgFxGlGBY16ssR28UeXMegac3j2fMEqyZr3nJ8BXDhWE36ComEfwRr8wXT3FF
         Pz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770702052; x=1771306852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onU77N0wQuj5Lnll1/fvZOs/qEnLfPl+2FK8REXemOY=;
        b=VeJxGrIIhIMFBIjPA2lA/HcrODxKSoFT754BVBc/1Xjy4uc85ez+bPCAyvAjmAp87K
         +SIKRxvE0XXlE5TvIZLu1k1Z2WYvrct9hY+sCF84B6NNz9sdmLqWW6qsiy/UwqUbx9Td
         J55ui4xtouQ4Zj9PC9SzWPa2Lwnqb98WWVUIuk5InDvOL7UGmMXIrAYiPmHCFIiV30Wp
         lkF2E4D8p/lr3rmD9y9pwR8lIdPRymxqJV2Yooajcq6SnbeFejUtXf+fUngzACOocCN5
         8Cp3AWKbSTLIZ2rFqHQ4Kt9JgzUss1xNAjmQ8jwKjeyyop9EA3m16o7TJPpQTta5JtQT
         BzYw==
X-Forwarded-Encrypted: i=1; AJvYcCVUUs7heEvkspwaTg/2ZzSKjY+xhgpGNhOsA4Wp1CS0hxif3q73oBTt4qG39kCHhTmO8nCglVEV1jV0RvFd0LpI@lists.infradead.org
X-Gm-Message-State: AOJu0YwtqFVjpL58rhvh16EfONIcTxaijkq+qzeMjDAc9mjFgHuP6np1
	LPUVxsNRzL0oGRVzPSJyFA2TUuIHpRvB9kaph8CDJ1btsJuCkQcKITpdO/ZcGCfM
X-Gm-Gg: AZuq6aJEGJJQikd46BblikKgcOTiD5/VVcD/UYhZxg4azwAhNXZGZz9D5t5zbKxc9dd
	RAh4y4Y/Rx3W9vNpg7C95PVQ0+a2tpUZ24tdnR5geY+hHpHE5YKIh9ay7NPEf3qtbSaDgJF4cH9
	4d+5cuBogk3aIZPf1PoL8WJ7BYiISu855Y0xx+skWTzd6DCaHGv95hsurD1tNAg7UupUQoJSpLq
	XA6yxHsEhaMcbLjnWXW936RCJjhM0A9f8g7vaAELGdmsoCGG76gQgtdFlPR5+OOBnLR40iXPdLm
	Yqg/TIpjNMyo1kQecahQMw93ZKWadFROj94jNBpDp4Y69vy+Ns/kHkbEQMfiBjK4deReH7ODB0c
	1JmF+Dzz0kh1GmA9/3z1E18CF5fVlAXGimSdsK3oZwWIOtEthjTu+wXEDC+WnKmM94xlyxJJSMz
	ehd9SaAzfS98gqqAjQXEwYiBnDyzXJYyU3QCi8+YJTeiyoQvRgeNfH98uhuZypeWgT9DmDtoV07
	g==
X-Received: by 2002:a05:620a:1982:b0:8c7:16fb:ed45 with SMTP id af79cd13be357-8caef7e16e5mr1861918185a.27.1770702051590;
        Mon, 09 Feb 2026 21:40:51 -0800 (PST)
Received: from aford-System-Version.lan (c-68-46-10-116.hsd1.mn.comcast.net. [68.46.10.116])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9ee9fbasm978632285a.39.2026.02.09.21.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:40:50 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: angelogioacchino.delregno@collabora.com,
	Adam Ford <aford173@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 1/5] pmdomain: mediatek: Fix power domain count
Date: Mon,  9 Feb 2026 23:37:01 -0600
Message-ID: <20260210053708.17239-1-aford173@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_214053_406916_86B990C0 
X-CRM114-Status: GOOD (  13.92  )
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

The wrong value of the number of domains is wrong which leads to
failures when trying to enumerate nested power domains.

 PM: genpd_xlate_onecell: invalid domain index 0
 PM: genpd_xlate_onecell: invalid domain index 1
 PM: genpd_xlate_onecell: invalid domain index 3
 PM: genpd_xlate_onecell: invalid domain index 4
 PM: genpd_xlate_onecell: invalid domain index 5
 PM: genpd_xlate_onecell: invalid domain index 13
 PM: genpd_xlate_onecell: invalid domain index 14

Attempts to use these power domains fail, so fix this by
using the correct value of calculated power domains.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index 58648f4f689b..d2b8d0332951 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -1228,7 +1228,7 @@ static int scpsys_probe(struct platform_device *pdev)
 	scpsys->soc_data = soc;
 
 	scpsys->pd_data.domains = scpsys->domains;
-	scpsys->pd_data.num_domains = soc->num_domains;
+	scpsys->pd_data.num_domains = num_domains;
 
 	parent = dev->parent;
 	if (!parent) {
-- 
2.51.0


