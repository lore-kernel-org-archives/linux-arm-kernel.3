Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66653C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UiWyf1Dh9nthmX1SJ2zMjXD0YayBfWTFNKR/lg5M5tg=; b=W1gzq5FU3rjunMp8Rox+jhO4ie
	JtgJYT+XH01rvp8Yqj53DMQE5Wyt2Hi8uUuny9FfOAj36+bRy3p6JlCSNgACKdGOEt0z57YgeqW+O
	S7Cy8g/r8AsXsLPs7ci+AamtlhE6D0Ta4qHw4sev2IRLemq1NHw8Ny1wofFjxKhKmPQGlbH8xqMp2
	Q0XlOoYE8v+rq08jdOTEv4+toYKqvg2i1eCPOw+sdXL5F1OsXff9yTrAGVtPskvPqowQv/00QF/zU
	SBsLKlTi3DQ3wy010XAFRhRewA9xGt+SM1FtqC8EL/b8kh46GjzI9CiLxRnC5BFVayD9Q71+bqrm2
	yQiEMycA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x617i-00000002Y8B-0lyZ;
	Mon, 14 Sep 2026 07:29:06 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x617e-00000002Y5s-4C5k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:29:04 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cc4d03f95dfso1616618a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 00:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370942; x=1789975742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UiWyf1Dh9nthmX1SJ2zMjXD0YayBfWTFNKR/lg5M5tg=;
        b=ptEsveh3/MKdB/i09J+oYfEwMs9Q/vRLybYZ41xRGKkCzH2LPOLHkbVHimE0CuNAy9
         Df0FFJwAK9m1ePxSfsIbzXs7a5pWpJlXFBYHIa64DOd6Nv9CzHKzK+Db7YkqTco9xEHE
         ilnF8TbjzV6vMihXs+lxpan7XxH2kgO3pau0bwv1IktQvT+8MC2UUmtgxis8lJl4DVNh
         W4aXYnA3IdAP4wYIhgGvHxX6XXrKTakW+Ewd9zA+joPyzgf2LlCRwemO20IpgVujIt2H
         vl7Nj6eFUmUgkm/tymvDv/fLtr4a9q6A4tbixDkHSVHy2LqhuhOHtV68ujuTDdZJCCMD
         p62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370942; x=1789975742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UiWyf1Dh9nthmX1SJ2zMjXD0YayBfWTFNKR/lg5M5tg=;
        b=LqLbAC4jixvjcELCSv9r//jp+k1cXbJY7u0QTXuls3A0tT6egi2jJMSF/6jyHGwJGa
         nf6QODHAQhHvz3PQX3oxmmYz86+d7u/1tZfJ++1EbIZ0WjPFqFmw70kkHFkReVkR8qAw
         Ao1NXBfpTsoKAeFiqCMhjkjR5wDxPbdODVD7uInxITU44rwhao8vtwD/jyQBVM3NN/Az
         /hFy5npf7UdXTbvjAFvavt5x1JmHzFqCJLxfiumtvswznLBO3iDD4Y8hoHyawmoyjnum
         3fjVtyuPdLGD5spBHP110nLmWLpJLHJh2sVSDyPIOiH9LJTrd7MG0yCfV4VQi9AeXJSM
         eduw==
X-Forwarded-Encrypted: i=1; AKwUvBxwAgT6JwPSsOU8ZEMk7ZIJjjnVL9UEA0yIpGBDIb/DqVWt4IyU9JxasB/SX2/fyt9O0XHqJBYFCg0oclzXuUSr@lists.infradead.org
X-Gm-Message-State: AFuF++l17lxvvd92EThHdl84AjiYCLmQNXUtQfM7BUuQMpaA1tFpG5ah
	+zAVsInAdp2+0wlcVvuqevHO00YxVOzgB+KPFw8YnQrL9GEI1VxYSXv8
X-Gm-Gg: AYBFou1L+uUgje9XmL4ezTbUJGGwQ0EpLrOJjEeh8vwr57wu+7jp9wIPzATaCJTXQ1C
	7ITHY0BrH+DNX+SEWYql5R+tdMWoQJC65hDVdwJ4ceNNJYNJeUhrMl41Dq+/O9E62yo83ICAVNd
	A0kufxD8tr4rgUEM90BbrY5c5CwOTRl6wyBG7mfQ8pF6odEyj9qevDk2bGF2CU62x88VFbppey8
	gDiQawfOT7G9198fU751b4smVN2p6K4OBoXZaRHDxp3KFwdPCfqF8/XU/hvjoOk1qpq0NnQrgXm
	4w4CRJrq1KfCSi+BXYhDfkIHFRnfyr2MkE6ev6SX30QlSTbraUkTUICm4aIB5nj6ZBbyWWgk0C3
	Qo+NaCY6CldiLBXnoAFTwH6q+vO2h61BGS7fbwK04fXjDrGRgWZXtphhWASHQj6n2X7a4xoAgib
	DjuauGyU9ek5+ybvCvk7BuTfQPQywMLMOvF7n0HHhcLduVaa/Q5oYa/lcPwaw7Ww4xAc7biqcNs
	evpyBf2euu5ub8f8m55QDJgAbMtddH+hTDUIMnWBwhwMzr8E77rq+w3m30OYjJg3Qs+D09qvlbB
	Ayc60JnVgCkGVPCN/ayPm5tFSQ==
X-Received: by 2002:a17:90b:582e:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39dec08daf1mr3030942a91.16.1789370941989;
        Mon, 14 Sep 2026 00:29:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 01/13] ASoC: mediatek: mt8189: Return error for missing regmap
Date: Mon, 14 Sep 2026 14:28:30 +0700
Message-ID: <20260914072842.24420-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_002903_052185_D8E3904A 
X-CRM114-Status: GOOD (  12.84  )
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

mt8189_afe_enable_top_cg() currently returns success when the AFE
regmap is unavailable.

Return -EINVAL so callers can handle the error.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index fc7a7a73b0cf..63e03a40dbbe 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -236,7 +236,7 @@ static int mt8189_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_ty
 
 	if (!afe->regmap) {
 		dev_err(afe->dev, "afe regmap is null !!!\n");
-		return 0;
+		return -EINVAL;
 	}
 
 	dev_dbg(afe->dev, "reg: 0x%x, mask: 0x%x, val: 0x%x\n", reg, mask, val);
-- 
2.43.0


