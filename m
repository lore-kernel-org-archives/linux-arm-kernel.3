Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA375C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 11:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZQj+ONDwpbh4PJ71wQ7JZ+LMR8i+c4jITqEqjly3CM=; b=V5q0r/scUGKtBDKbUg8SCbw1wI
	KgKMfBVK07AXpEYltChefQW3rX5APaEnX0w6imlTqQ+VXXARyT/BM3n1jsHYGouFznDJe/btKcjeI
	0Gc3mzSMDUxPr/Sd0A6MIr+RbhysA8u7ai9iGhrzyRxi5C6gu6sTutAYrfjg+MYQJlBnwcwmN1gkQ
	X8boMz4XIizKAbwrMfsyWGemWeJCldBCZXADdwdNeD6TG1QexcqzpsffZ4Kettb0n0CVM/zRFTGtg
	3ihTNy/jh15p3Xg2UmM31w7Q9UChb8NzIQqU8eCH91unKltsVCRC2kpEh84+qt3sabpHh4UnYAfrx
	08h/OKCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvah-000000061rl-2App;
	Mon, 17 Aug 2026 11:33:19 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvad-000000061oV-3qfJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 11:33:17 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso3105735a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 04:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786966395; x=1787571195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZQj+ONDwpbh4PJ71wQ7JZ+LMR8i+c4jITqEqjly3CM=;
        b=WoEwAS7lO2owZEyOxAqIKz4p53jclZYOmFGL8bTrtn3h/elg7FxJbrYh9RxdUSqRQo
         Fgw2N7LLvr1PCa3NwwftoynpL68z6claRy2MWnaXW8GP8YQ9aFzgDMbHdJof90GafC1n
         1MSxxabH2b8KoD027DZsZyyQmtKitEOtWMwuoA2evKdzozXMBmGPIq66ZRF5Ktlvfa9d
         yeJhBeiVMEEJG4VtP+EUfg9XV1su4Jsn3j+JruQI16x2DOAhgIEjfpf6qzSQbG/gdKi2
         Xi9nrZSI/RKWiw6YWM1QAuMGAcEls62NQ6T3P+7TYmWSxyO5X/5vUmq6q6EoGbJ4SziY
         0lxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786966395; x=1787571195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZQj+ONDwpbh4PJ71wQ7JZ+LMR8i+c4jITqEqjly3CM=;
        b=kidGREYMwB3d0V6VZ2YfE7Ie2qHPsHEPf0GloBG/S/Krg1RTgdkrf6E5VxqfDabrLT
         z5YZVmkO9ex9W25G6aOk+fV8mZiaEp18paf6CKX+6sVVJxpG2Q6WE4x9K8gsl0gE2LbT
         vCiqwrqW20MC70rI43kwJTZyCTqJXIc/lTZmGWXAtgomh1Z1B2h2c8oAC0pGv6pvN79b
         VRkYk1/d2IlWiXF/GYvpwAS9dSoXiBroX7z/kRLEeIRDV5ZmwwIEO4sD62d+2UmwIx7P
         FgknFcaNpR+syLOxConsxG1qLa7osWzusHFlBEJ/dWG9EfqMFB9i8X9qr/6Cu1FwQaXl
         K98Q==
X-Forwarded-Encrypted: i=1; AHgh+RrkARPOkuLZve86Zf4GaUFDlEsl+4rodPkHPPx/koimHZhxOU7WCDNTjl4QMZEz1lRP7q83ZyXeJm3W9iUC274b@lists.infradead.org
X-Gm-Message-State: AOJu0Yyfow93tE/AgjPeenjLGzL5wHoqyHiR7OSmb+ZGGtp3hSN82s63
	gfiikNXU4fITrPI+xE8L/s8wR6cbYL2eGFCeh0PqMVONcM/x3rYtx4Jv
X-Gm-Gg: AR+sD13CshAv8eAwlUZPNM/3mSUWDy42FNc68l2PfdZx21rfrla+mZOwm8VeD1qZClW
	usrjpZ07baoIt6k12hBcraLEIiicjxZNZ/ues12Yb/BmEw5kTj9KqXaX3ntd/nS6qLmAyaVbeFv
	sCQLuYPF1kue4BCR693NfV4AgCMyz5VBhBlS36MN1bQJKdHbqnm20xGz5OXUsgE+QCslhudTcJe
	ZHuX0lhWyxV1i5ePfmMunWvQbwqC/+mrRfpwKFsqt7SXdCOxe85wHElWjLXvt4qsaghowWzJA2Y
	3rGHI3RJomgA2/LHgBCb1UJL/dqbK0UrGNkWKzGLGzKw6IgInExcJ8UCqbUP9bRz2lm2100F6T7
	8LH4qlnFe165l4668+qO14nfSjn//qaThKdILDY3gUwjJm8WOqrFpXlKOtP/sow3zIvA6TDJvRU
	pfOHFKuyZ/GIW1CK+wcVnkLImBm+eWKwG+JzFwxh2YMCikj3RtCywKWphLV62kFhy5+sy+60MLp
	qwp4yqB0tRJNR01nfp3CpJwaS2VSfH4hSExqWFNmjwt7l5KpxCNpAOnBnwtLoXWex7P0N7QO00q
	k9lee0YPrPPJRJ8=
X-Received: by 2002:a17:90b:1d45:b0:37c:6130:7a5b with SMTP id 98e67ed59e1d1-3933b7ff941mr24717362a91.8.1786966395038;
        Mon, 17 Aug 2026 04:33:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d3b3b91sm2071705a91.13.2026.08.17.04.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:33:14 -0700 (PDT)
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
Subject: [PATCH 3/3] ASoC: mt6797: Drop redundant probe error messages
Date: Mon, 17 Aug 2026 18:32:49 +0700
Message-ID: <20260817113249.69252-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817113249.69252-1-phucduc.bui@gmail.com>
References: <20260817113249.69252-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_043315_984761_CD96815C 
X-CRM114-Status: GOOD (  12.42  )
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

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index f62a32f2f2b6..dfe67727fe47 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -754,10 +754,8 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* initial audio related clock */
 	ret = mt6797_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error\n");
+	if (ret)
 		return ret;
-	}
 
 	/* regmap init */
 	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
@@ -800,10 +798,8 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt6797_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
+	if (ret)
 		return ret;
-	}
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
-- 
2.43.0


