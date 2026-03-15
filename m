Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1171F3026E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 17:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIEg7cppvNlK1uJeRyCMqJFg9lbXRMhPBqnGtbbFM64=; b=igAVeW67fzP+KwBgnXAut2ZpRr
	eWZmMnMyKhnMn4Mwbh48jragYg913pNrWiFLixwHOPW+6RU2uDgbVKCnK5gmRkDMe9RjFWQNiOqZ1
	KhfDojcHRSkJr6UXOa9B81rtTlnPxUGOaNeCOviNLhZMweZpjCX9a6DVfifty/rrAQXfNf1duXDUQ
	xDq9sSAmm0bJD6PhiF9OmrGG2N1/3vDIqiGMNYyky80dAVUJC2UddUeExMTAcjUgnQeICCD9pnUwv
	GtSTrucLwy5hCeeRnvzIBlZThWn+p/8CGxDNFKNC2TUOuLAZS/Nr1MrTM59GtYlakZyiwztWhtlRp
	rfmhp31w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1pG3-00000002mSy-2LYp;
	Sun, 15 Mar 2026 17:28:07 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1pFz-00000002mQh-2SiU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 17:28:04 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso33629395e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 10:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595681; x=1774200481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIEg7cppvNlK1uJeRyCMqJFg9lbXRMhPBqnGtbbFM64=;
        b=YiV7whDETMv8KZI4+vEBpXwi8R87Uk5znRKIKWMLRRcdfuI0pr9yV+q9N7xUECgcjZ
         GeecI8bKeSuDnQGw19i3hERLKaCT+r91gGUBR7x6LT1fGVw8m1M5Qk8CU76/+45h7ySD
         8BVeCKk8k1Y+JB04syE+4wPR4j8ca62072al5VgeDCAq2Bll2t5uh7cn0QunnFnYQjtZ
         HksRfRCLPmP5zeuT3HzF7XfRsHEYJSpsWBWD/kfQgnUjHT5cGX2vxxQeG150CeQYgn/2
         RBOKZmlOMU4D6//f/w++iGLFUDIHzizanod48EYWC64h+kvXOKXwTf5lXQDH8bWhgObu
         k4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595681; x=1774200481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YIEg7cppvNlK1uJeRyCMqJFg9lbXRMhPBqnGtbbFM64=;
        b=dReSV+j/52TuQiOFJ83noV6kpIfXNC/TcivoxCYtVZTzbBNn9dbMWhttnPS9JgnFf2
         x6K1+fuwHrBe0wTPOeaWFgL89vpY5yo2wC3IsHLNHsv2aZ3pI7DVBUUorDEyASnPA3Sz
         aqDYvAzGvtRdVWS7+CyTV1+F0lL6MG54z3DtC4hpZFXtXnz7nD4P42S2clH68uAkX05N
         iZp5D7tW7YWEGBQvfvwY3+V3JIultmytNPjciu0EBanHIgVEyKdmrRaGDQI39TewTbNQ
         B7krw5AqhsQs/mNohOwOgpQ2/VBe3X3uUVjEWgAOHS3vP891EOg5Ob2ZnEzaWL9SNo/p
         jkag==
X-Forwarded-Encrypted: i=1; AJvYcCUaoFy5ScaDz1ae0aiSomIIf/FpOjy5tJePJAvb6ndDUnLK/9PimJIJQWzIoysSu+VCvAoSo7CreheYooFXYD0s@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn23zlo9CcMn7LsMEKUnH9UFMxj72/8s2gGHKz8OtASFM0Ajxb
	0mQsXQCcA5eZR9c4LeHavi/Gi8PVhM1sc9bhBBiDse/CgxtmtDTAzt4m
X-Gm-Gg: ATEYQzxj9mx3diKrdOmRZJ7wH5qdKJNJ6EKG7qF81BuQn49ffyCgyQl0vZ1lrOBLeOa
	xbn2JS6qEwQxE6S70rdEydftG/u8IgKaxKZ9HboakgCXb094+aTLX/QQLgtH0qRY2I7kBdwefz4
	RWkua88G6XQnnYud1EYzLIGAKVLv6gF/1Do5uCFBaE6UtLlx3TPv1tdIQiyShnXvzxg7Oyl38Vb
	b+K092la3R6daUp3MF+GO9TgQ43EueAQ1qjH9Ot/qOVBQGGwXii3TbsCY+RMQDkCCvfk/ZCe/VX
	mkp0G7ff2exVIy6TaR8/hAY8W1c2sx14AnL1vaZhFaZfG6yhC5bqacl+ucQqokgrC1C/7DdWwa3
	BotETKjq4fHMOFhzfOtnWjrEZ9x2ZVPcKC1m1CYfYLXFknU8G0UCMIlQ+RITCtUr+mp5gR9ZaqH
	jIyd9hC0WEedwD0v2F1+dVUi62BhrM5JaRbSU=
X-Received: by 2002:a05:600c:64cf:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-485566cf81fmr167182995e9.5.1773595681386;
        Sun, 15 Mar 2026 10:28:01 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c6586csm73644905e9.20.2026.03.15.10.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:28:00 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Boqun Feng <boqun@kernel.org>,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacicuelo@gmail.com>
Subject: [PATCH v2 3/3] mmc: sdhci-esdhc-imx: consolidate imx25/35 data and add Kingston CID
Date: Sun, 15 Mar 2026 18:26:40 +0100
Message-ID: <20260315172746.270734-4-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
References: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_102803_647478_7565F573 
X-CRM114-Status: GOOD (  14.31  )
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

Consolidate esdhc_imx25 and esdhc_imx35 soc data into a single shared
struct since they share the same flags. This reduces redundancy. Also
add the CID_MANFID_KINGSTON definition to quirks.h for centralized
management.

Signed-off-by: Adrián García Casado <adriangarciacicuelo@gmail.com>
---
 drivers/mmc/core/quirks.h          |  4 ++++
 drivers/mmc/host/sdhci-esdhc-imx.c | 12 ++++--------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/core/quirks.h b/drivers/mmc/core/quirks.h
index c417ed34c..d736bb4be 100644
--- a/drivers/mmc/core/quirks.h
+++ b/drivers/mmc/core/quirks.h
@@ -15,6 +15,10 @@
 
 #include "card.h"
 
+#ifndef CID_MANFID_KINGSTON
+#define CID_MANFID_KINGSTON	0x70
+#endif
+
 static const struct mmc_fixup __maybe_unused mmc_sd_fixups[] = {
 	/*
 	 * Kingston Canvas Go! Plus microSD cards never finish SD cache flush.
diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index a7a5df673..9cfa26722 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -256,11 +256,7 @@ struct esdhc_soc_data {
 	u32 quirks;
 };
 
-static const struct esdhc_soc_data esdhc_imx25_data = {
-	.flags = ESDHC_FLAG_ERR004536,
-};
-
-static const struct esdhc_soc_data esdhc_imx35_data = {
+static const struct esdhc_soc_data esdhc_imx25_35_data = {
 	.flags = ESDHC_FLAG_ERR004536,
 };
 
@@ -391,8 +387,8 @@ struct pltfm_imx_data {
 };
 
 static const struct of_device_id imx_esdhc_dt_ids[] = {
-	{ .compatible = "fsl,imx25-esdhc", .data = &esdhc_imx25_data, },
-	{ .compatible = "fsl,imx35-esdhc", .data = &esdhc_imx35_data, },
+	{ .compatible = "fsl,imx25-esdhc", .data = &esdhc_imx25_35_data, },
+	{ .compatible = "fsl,imx35-esdhc", .data = &esdhc_imx25_35_data, },
 	{ .compatible = "fsl,imx51-esdhc", .data = &esdhc_imx51_data, },
 	{ .compatible = "fsl,imx53-esdhc", .data = &esdhc_imx53_data, },
 	{ .compatible = "fsl,imx6sx-usdhc", .data = &usdhc_imx6sx_data, },
@@ -414,7 +410,7 @@ MODULE_DEVICE_TABLE(of, imx_esdhc_dt_ids);
 
 static inline int is_imx25_esdhc(struct pltfm_imx_data *data)
 {
-	return data->socdata == &esdhc_imx25_data;
+	return data->socdata == &esdhc_imx25_35_data;
 }
 
 static inline int is_imx53_esdhc(struct pltfm_imx_data *data)
-- 
2.47.3


