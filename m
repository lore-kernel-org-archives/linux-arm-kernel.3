Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589DDC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 11:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSS0SfwEXWK8UDGH0T0SV6yCqHjHKlU1qZXbtoO+aOs=; b=MmIcy+CC9BpAMiVc0InM1F65B/
	qC8JxaS9BO/mGtIdVCVvGr+twd67oShaEcZ1HL5gMT0k0Ir6yVvb77HvN7IWLMwKMuefFNq4/ZTVn
	e+2H3Mvpz3p5ChCOLDwWdHA7Z2U//+A1Lsd2WmoYxpoFg5mNcfU4brFwyBL/YxXoZzKvtasQ+6SKt
	FGeXgNGsTX+kd//CYZmk+l5aYUb6P7/Ne5vGHa47I8Fr/3M5Vlq/SSi9cfLGv3jDS7gLnCstpF3jS
	cWPnoLFLFPD85r16qqaTJ4RbB6Tq9BRRZfafCEygA3diWyuWRiU2vOR/lwdIpeu5Tg0oDAf3X/olB
	KduwqLzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvad-000000061nu-1MkX;
	Mon, 17 Aug 2026 11:33:15 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvaZ-000000061lN-2X2z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 11:33:12 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3811f512167so4604831a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 04:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786966391; x=1787571191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wSS0SfwEXWK8UDGH0T0SV6yCqHjHKlU1qZXbtoO+aOs=;
        b=LJL+9Ni3sjyMP2I95ZHstVueW2gs/faBq6fJESsC8Pf8CbqQNnRBJ/b4pTe524cymo
         2DtVs/4K0LM/9dVDEKBeElNeZODGKFRKqeqoLJOVZhFKWHEgwz0SIZY8amMvGFLh5bql
         HgIO0gFioc/pt8jZeNJnGHvCzYz30snK8np/++2h51zElOWS4ZfCn52CRpE3trYqCMRl
         /Q69SZKKLVUXCnaiH+e2k4PxNkEmKHDrW4iykkY9SwJ0CFuc6RJcJYUbSamVMH5Whvui
         ROavlh6Z/r4PsUVVIf4V2Q2sL7BnujJX7EMhYcuVk0SWhDJWdaKVSIOFvO+LazX6t9dr
         oAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786966391; x=1787571191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wSS0SfwEXWK8UDGH0T0SV6yCqHjHKlU1qZXbtoO+aOs=;
        b=XkqVMewmajooUH11hRSBrCb8FiFBwqL0YOiRUL44J5q7vEf/wW9gQBvfVGUJu2370F
         GkzdYIykb0diq9DCo7jDALKVw5uFK12GgAU8zk22nth4foHlPZfh0p7rYTWs6hzo9vy6
         3ryXejJNd88Q4+04y9tOcs2ezvuztvYLlsmbtCOekT0GRfgfUmamcMbZsGw34jGXtroN
         NG7SN8dAbk81QAsZg/YA7NcGQb9Lys4zYX5g8qT7IzVo8uTDkuABuIdLZX2ZwfP2S+Gp
         ZPAUCA9yYYD766LeGaQbA2ozxZquTGCJO+Uz9NfxtKqp2ptQ3O6mMLl4n/9B5oGx3+76
         K0Rg==
X-Forwarded-Encrypted: i=1; AHgh+Rq8bmbSheyk+Unjr0KiabfKsfV87kQWbeMjsHuO5sS9XqLCK6dcIBG66TWnYKXzyHZmWS8/wMUIfeIZu0wlJ1HK@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ2qlL8kLZbJNFIbRuKvghpx464LrmWrrwrCb6S8TOTJ/73ajY
	efJBkqLUMwtG69GBn/21B9UDhASSSWfY0e2znDY9gvk6DaP/bLGewSl4
X-Gm-Gg: AR+sD10nQIfYwdKPLbahGtNC8z8ujKOlW0cLejwLP3ibslkEKG+dQukMJPRGnH3BHeu
	b0TXDun5h3KRrao9moMXGYbz9+Tq9iJb8kfjYASvV5Oraw5CyoUF9nK5h8FNew3pho+qdwnvWhF
	XKhQ5Mhd0ockNXspyp4AIEu3AlE/WOA5EcQyuEqbgKIak4EI4Mm0gSdFz2oF2AbN2SX6HSzCRVh
	z4gAfLXFkxOtSPfiA5vhlbPJ24rruO7uwjDdF0QhkQM8IVz5pGeBaEmivQf8YlhrS3Q8CVMKqmF
	TNk/naEB2Rw1/bpwQciCUAp7SzJYGBWCZwy0OSIBEuhvqes5TuJrBhdbDjGp1Aw3pJEj2/eye4T
	GdgSCl11D+lVfhPjWkyOM6gSlKNfdRuQV+rADNQNGflJQJhW9wGlIFlu6sJOUbRVEoyK/4HwEfF
	rMnIEknmIa3N9GlbdLKAQbGJmM5ie/GSPldROTU64ky6AogyHB94Qhmoy0NE+pHnLiRtQum4Pq8
	hP+EKXHSjVFMVb2miLyUhY8IP7NG6OQjxIYdZ3BC6Bs8FpcsmS+EztEm6AScZ7nfznuPWY2+JHd
	UmnXGtkKjQ==
X-Received: by 2002:a17:90b:2891:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-3933b8e1ec2mr25650063a91.11.1786966390655;
        Mon, 17 Aug 2026 04:33:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d3b3b91sm2071705a91.13.2026.08.17.04.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:33:10 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] ASoC: mt6797: Use dev_err_probe() for error handling
Date: Mon, 17 Aug 2026 18:32:48 +0700
Message-ID: <20260817113249.69252-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817113249.69252-1-phucduc.bui@gmail.com>
References: <20260817113249.69252-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_043311_735806_2D2CFA88 
X-CRM114-Status: GOOD (  11.23  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt6797/mt6797-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
index 0ac04d73b777..2326496f8b27 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
@@ -43,12 +43,9 @@ int mt6797_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	return 0;
-- 
2.43.0


