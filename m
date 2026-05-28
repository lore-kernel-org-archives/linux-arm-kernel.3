Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FE3CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 06:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eyGymNqbhiXLlzQIXinZjQ2T/+xHy6TN3+8MZhwVUx4=; b=S3sssZYXuzBnXgDs5OVSaV8OgH
	LTE9Ri3IPvDHFVIOGDtbgopVVFVNsrjkuYeRNwfO0csJ73mC8QrncBQrJsyOxdASntjnfEAtOZEFg
	bLbxKQbQx4VTlNlm8rGGw7EVcYVbfsPB5OUP5VjANE/ew6SZLWNueaysT/Etcj8kWfjYIaOMAY7NK
	9QQMIMJfDaNLdUIDrGWfn/RO7623KWhN1ThxMUxKs69QQ6kQB8YFb/i9obAR8JgIPhtfZEpxlml8l
	Ns1iuVcILdI0AyfVvjt2qPM/hQoLx6sJo5M5A3/5HgN+oV6td7Cz+nvF8W86U8XD+jetb7H5uLxXM
	Cc2sti8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSURI-00000005CxQ-4B3j;
	Thu, 28 May 2026 06:41:56 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSURF-00000005CwA-297u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 06:41:55 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c802803ac17so5190357a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 23:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779950512; x=1780555312; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eyGymNqbhiXLlzQIXinZjQ2T/+xHy6TN3+8MZhwVUx4=;
        b=itAX+fe58TyxwUX+vf1r36WMLK6xuIgs8Ecg/C1a09t+iViyHmQ8YAUBKSMeB0Fz4w
         WPpLc0/8G5wTQuodbHMLooH9PcYfg5CiM6O4c/IyAv+6rmC2xc0UKa9WBNsNUmzgwGEl
         IquJT+ANfjzhFk9O+s1scCC7V0CXSoZ0+2WYnoUWGW9ZpcY8LYJu6n4O9IAgpOss+4jb
         SGW72OJIrpX6lVXh/erlKXDl7fVsm/6yQUlXnzQdMLsonRCt+3zAAd7gxnFnTlCLLkcP
         hzUk4MNz0ZqwpDAPRJoPz/OGW6MPMjfFGZ4S4fL3EStdmmVnJeM2dqWw9mfSoYhVUS9U
         xm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779950512; x=1780555312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyGymNqbhiXLlzQIXinZjQ2T/+xHy6TN3+8MZhwVUx4=;
        b=pEWpdhbw+Ksve7j5sVAxxxlG2X/0yrQo1u+qOiLUgKGu029oNkKwrfDqC4YVj4W38j
         k7CVrRIA5z9lz/VbdX1wVtxld4McFp0TKJiaZdDzqYiKglxz1KAZYL3UOeg7eQ/1Ea+h
         ebs7wDhg7Qvj6IMW9gyBDzimMvB7bAzhLzfcjzvlNvZJc+B8LsmDMKjlLtc2n4jn2lYk
         VdHT1M2i8+QEg+t0wSJ+Qa3ufdFDwOPbr85hEv5ilNeJyt2qgs7Dja9oihKV3r3WP+14
         MiCuGFBtnA/eaK4T2fNo7pi+RUA7qjzBQPC3rzfqeCUYz0nV5Wm5DOBG5E7OPVBwHzSg
         bOTw==
X-Forwarded-Encrypted: i=1; AFNElJ+3hiyONPgczjgcG5qRH/pvpdldg47ohCZKJvBi4mULvmMbNiYiM/upMjT+ucvk8xOYSQzvrctklnd5DQhPLXxy@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ3nbfsFV2udVWquKUul0j/Qhlf/iCfpOEB46HF5msKMYwSBW7
	cAkvRXOrUfZdqAKzJvpqL//Mwvju7mKnlcKfnGvDSFilIKpDXOr2x/JH
X-Gm-Gg: Acq92OEP+L6FyuSiQfxA9bz5Q+AOkj95DS2OJM8jgt7fGLG9/UDTCWPgaiVV5xVuRaC
	x+F/u3NYEPli0IQQUWm84NPvbwU3DJvkwVJV3IwSgIyQOr+yQB9LlVP/TZZboJlIfVdxyG/a5TO
	n8uI1KTOUyOYAfl4i8vCZBp2NZZAtT+/1JyYvLRep7AV0Ca4bJUjHuNJ3vtD8GNZE46JJLK4TeR
	JIpEPJEn4cPPM6FAn/pg3l2p2Z6yv/OQ13lpC3RWTNyej5hI0NGuHZ46NdMF3auiHayTH9x4OU3
	ExgHArRLtywEERqPs6Lq5TctvJUlLbvsd6zlH7+SIolDi/g4fpwY0w/nH3CyclqEGU+JA8oQexs
	DANTj6zc+rN+32C32qo8zxMTdGIkQ9FBlg4oQvxyBvdMjf95oFYYb862QBq53qC+/+kGTCyrjRB
	01/aLzpg7sFW1Vw7gVh3nC2GSYeD4IBjCtLNGi0wDgdozk3WAa3vWBrSCfIeMhWg1JbQ==
X-Received: by 2002:a05:6a21:9d91:b0:39f:9eb3:1d09 with SMTP id adf61e73a8af0-3b328ee2e52mr27362688637.37.1779950512300;
        Wed, 27 May 2026 23:41:52 -0700 (PDT)
Received: from oslab.. (n058152075021.netvigator.com. [58.152.75.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852056db34sm14417515a12.27.2026.05.27.23.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 23:41:51 -0700 (PDT)
From: Tuo Li <islituo@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	kuninori.morimoto.gx@renesas.com,
	ckeepax@opensource.cirrus.com,
	vulab@iscas.ac.cn
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tuo Li <islituo@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt8365-afe-pcm: fix possible NULL-pointer dereferences in mt8365_afe_suspend()
Date: Thu, 28 May 2026 14:41:06 +0800
Message-ID: <20260528064107.470824-1-islituo@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_234153_554827_B49FFEAA 
X-CRM114-Status: GOOD (  16.78  )
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

mt8365_afe_suspend() allocates the register backup buffer with
devm_kcalloc(), but does not check for allocation failure before using the
returned pointer. This may lead to a NULL pointer dereference when
accessing afe->reg_back_up[i].

Add the missing NULL check and return -ENOMEM on allocation failure after
disabling the main clock.

Also propagate the return value of mt8365_afe_suspend() in
mt8365_afe_dev_runtime_suspend() so that the suspended state is not updated
when suspend fails.

Signed-off-by: Tuo Li <islituo@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index d01793394f22..5966ca18c7c9 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -1974,10 +1974,15 @@ static int mt8365_afe_suspend(struct device *dev)
 
 	mt8365_afe_enable_main_clk(afe);
 
-	if (!afe->reg_back_up)
+	if (!afe->reg_back_up) {
 		afe->reg_back_up =
 			devm_kcalloc(dev, afe->reg_back_up_list_num,
 				     sizeof(unsigned int), GFP_KERNEL);
+		if (!afe->reg_back_up) {
+			mt8365_afe_disable_main_clk(afe);
+			return -ENOMEM;
+		}
+	}
 
 	for (i = 0; i < afe->reg_back_up_list_num; i++)
 		regmap_read(regmap, afe->reg_back_up_list[i],
@@ -2011,11 +2016,15 @@ static int mt8365_afe_resume(struct device *dev)
 static int mt8365_afe_dev_runtime_suspend(struct device *dev)
 {
 	struct mtk_base_afe *afe = dev_get_drvdata(dev);
+	int ret;
 
 	if (pm_runtime_status_suspended(dev) || afe->suspended)
 		return 0;
 
-	mt8365_afe_suspend(dev);
+	ret = mt8365_afe_suspend(dev);
+	if (ret)
+		return ret;
+
 	afe->suspended = true;
 	return 0;
 }
-- 
2.43.0


