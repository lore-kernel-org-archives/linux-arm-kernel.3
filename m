Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59249CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 10:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lT+JLRZTXmUkizcf52XaQYhGVpogr5HSaG3W4C826mA=; b=oflFC9u0WAqXlvgGuDuQ9fUBwr
	iGOK3O905zTCgR5FVr9IoO+/PgoSjoyFj6cfC465K8AUL2XIVX0aeVI0tVqIxEVXscxCwhE//9RN/
	99/z51SMcJS7m9IlfjTp2UaFIKBmiTQaPen4r3wW0xo2vlyOQb3n2ZK6prMzDeQdQjQIkvCIL6DVw
	8NUsi1UG+ZtHJhdIjW7svIhWZkYxGDo6MysuapnklvME0RVMqtmYqHGez/GYgNAN6muVJJNjbVj5t
	PztG9D1ngvLePDGu3l3c+aRdA27lEu7P+iwwpFv+3ZV0EdUtnqfqKm71Oue3S/XkQjhBftUlBc6lL
	yVty86fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMBH-0000000Ckke-3pGt;
	Tue, 02 Jun 2026 10:17:09 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMBE-0000000CkhK-34Pb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 10:17:06 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2bf77d4a4e2so12394885ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 03:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780395424; x=1781000224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lT+JLRZTXmUkizcf52XaQYhGVpogr5HSaG3W4C826mA=;
        b=R6M9rR51nLNP+TPUsa8ofm443+SrhrSSHa7mS+TC7DW6BkJ8XVNJL97Zh9/tFOjC6h
         iBwaPUZUDGXO72OouPlJn0MYQQM7LmIrp2paFGVGXyZ38SUYHXk/qjx0UdTEtojK9UKm
         lqFpbrZFb2T8XTzurYqZw8M6CsaC9pf0O5reUm2bYnG5u7GZy/hfCWw+KmBEYZVGp6ZR
         SxcpTUVntOJwekHqefluApNEcx/XAlM6shlBtcjsXkhh6KXBp/5DlpLznjYBjz9FygOH
         GFAZAjgX1MTr1UHYknFjBrU5ilh80ULMK2GvwEmeq8nWN8/BJLkyL4/AcQzmkbK7wiHk
         WDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780395424; x=1781000224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lT+JLRZTXmUkizcf52XaQYhGVpogr5HSaG3W4C826mA=;
        b=HXKAuGK427r90h2Th4tJ0uLSht71TwrZ/2nZITubgiiQvf3qjZMBsLpsO6aatb8v8b
         qQL/DaKjcV6MpgmQrxXP32GJnM1aAcB420rfTya92kImtZj4CJBZuPTBHy6GlkyBHBXz
         3560rpcGzVf64GE0xod+OBVL9ySNJwlUUEG+vC5jcUpZEGUvs/kT8NqV7Wxb2EBcAqJc
         Mav9bIH9YhN3bNHHmhPHpmYC9qKSrBjBbmUzWUO6XqAnLZ3U1T+GMTd3t+Rj3TGaN2U/
         LYeeLM7FlemycX92MbYvq/xoFLs8AddpaiuRjD+7iLYYCEy82GwL9mDMLueFp2F0g6vG
         0B4g==
X-Forwarded-Encrypted: i=1; AFNElJ/19Sd1U4jH16xGIDC2k75NxHpy6/SQbuW4XY/TS/Olhw9bn4+6Wy22nIDEC4Kf1pA3sLuuftaAY3HwguxCUdjN@lists.infradead.org
X-Gm-Message-State: AOJu0YyxBW7xXyq9fVv6KIVAuZ8hQR3ueCvKv27OHiVb7cCjwQHRz7Qj
	UB71D4/I1dgiKTH8kdA6Bp1LIGzM+V4LmVQqU1NUEPMeQ7DSHZKeqMUm
X-Gm-Gg: Acq92OGUbDBmoB5t6pTmjS4VQuzg6dt7+EDmKGEMZ1+b2nhptIBqV8+pZbFRaNYT8lf
	dw6jesQSx+90aDw3fkuzkR2X0/lC7qAw6mSPek8LCNyUhJFevAO5a/WGHOkpdQOgwhYaOC+WYHW
	g4DLdA84PTiRefKUfDHrkKj3hGu9MNbl4P6WCjpv0qNXrB8oMG62+PZbvfYHGFLf8Oe6BDtV/lA
	bVf1gtmnHytL95tbaiGfI15oIek9No0W2SYH7wxpadTKI96o8cprBeLIWQqvDGvl7chtXhCaxM+
	oMSE3urbcUgoCUNzWVFX9H9tLEtnj4DKXNpREvh+7C9tdzBclmO2SwFg1WwFNZV9KvNeWmuMln2
	l3w+9PmBGfrhub+wc0OGAnVUuvLmF+wq0DF9zbqanvdgTgs+DQkRqnSZR3spuLFcIYELBzsrKoZ
	T0RDa6oKc8tTCBLzF6w6hKFAh0RcGykT0o8kS+/Jiq9kpdA7PvOMnIgDITWDofbSMq5L3R
X-Received: by 2002:a17:903:3848:b0:2c0:a4c3:d7a with SMTP id d9443c01a7336-2c10ccfb095mr31503255ad.26.1780395423749;
        Tue, 02 Jun 2026 03:17:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd84fsm132766305ad.23.2026.06.02.03.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 03:17:03 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>,
	Sashiko AI Review <sashiko-bot@kernel.org>
Subject: [PATCH v2 5/5] ASoC: rockchip: rockchip_pdm: Handle runtime PM resume failures in set_fmt
Date: Tue,  2 Jun 2026 17:16:08 +0700
Message-ID: <20260602101608.45137-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602101608.45137-1-phucduc.bui@gmail.com>
References: <20260602101608.45137-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_031704_801891_C96A24FC 
X-CRM114-Status: GOOD (  13.81  )
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

rockchip_pdm_set_fmt() calls pm_runtime_get_sync() before accessing
hardware registers, but ignores its return value.
If the runtime resume fails, the function continues to perform register
accesses while the device state is undefined.
Replace pm_runtime_get_sync() with pm_runtime_resume_and_get() and
return early on failure to avoid unpowered register accesses.

Reported-by: Sashiko AI Review <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260522110302.349421F000E9@smtp.kernel.org/
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only. Please help test if you have 
    the relevant Rockchip hardware.

 sound/soc/rockchip/rockchip_pdm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index 8f78f7bc1806..115e90d3bbfe 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -321,6 +321,7 @@ static int rockchip_pdm_set_fmt(struct snd_soc_dai *cpu_dai,
 {
 	struct rk_pdm_dev *pdm = to_info(cpu_dai);
 	unsigned int mask = 0, val = 0;
+	int ret;
 
 	mask = PDM_CKP_MSK;
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
@@ -334,7 +335,10 @@ static int rockchip_pdm_set_fmt(struct snd_soc_dai *cpu_dai,
 		return -EINVAL;
 	}
 
-	pm_runtime_get_sync(cpu_dai->dev);
+	ret = pm_runtime_resume_and_get(cpu_dai->dev);
+	if (ret)
+		return ret;
+
 	regmap_update_bits(pdm->regmap, PDM_CLK_CTRL, mask, val);
 	pm_runtime_put(cpu_dai->dev);
 
-- 
2.43.0


