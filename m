Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263E7CE7B08
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 13:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWdQjfJEv17Sa7ZPlM69WVgkJ4xrrn+SVmA6eSQkM3w=; b=2M3ByW1ys4H/Vma7Z0rdqHUw1L
	VZuPGvugmmP3V1mgwv/FFMO8Om1iATKLZUIjHSPVkhcFfyzGl3iM8NQYontOZp/q+pO8z37l/+F89
	GjU1gYA+x5X3U1RoW8vLunXMrnql9hJVlrjRrhO5kWTZsT5uyGP7ILRa4vfG3iQq+OmIukr8BG41d
	7oErtPds6STaibgTpv0bJcuh75suqG2IIYt969vdZ8CbvHUJj1GtD6KFUIv8EL6vojgk5Dmf5Uu2S
	KO6W+tYl89ssRmpWI55vSGnPD790Pa4h42lrZODpv4cuO8IvNAqJverk94ZOhpxi4JdI5avaPUzqT
	XNAmZdNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJu0R-0000000CH91-156Z;
	Fri, 14 Nov 2025 13:38:27 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJu0O-0000000CH6K-16CZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 13:38:25 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-63b9da57cecso2932762a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 05:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763127502; x=1763732302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWdQjfJEv17Sa7ZPlM69WVgkJ4xrrn+SVmA6eSQkM3w=;
        b=FMq45GWYCtJt2zNZs9SVHFD9TondSDf2o6KZ+uAKYxKbiMAiNDLtEpnd+F27tcBoLG
         Xds49ZPMozjrWGdWFJxt8wu3At4DfSFshVvbBLkpT1snrhWd7LLYQroMeVne9S2icrfI
         iZ5bIaHxCh+UzY3PepnDi1XuBD/e/wsRrLYm3BXZnzfSfzByGA548yB3E+Nm6GV7nkct
         uLm619GftxUszkQsrk1Lw2j9y/TY4LeR/p2RT/SebFq2tPzrbHaDeNTZcPwPEblzL6cF
         cSo4sU9A1LHQw932sikEWppGb0ps2XX/Q20bfjLY+cO6pPpxI58dUoLQqdwt/g24VVHE
         DmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127502; x=1763732302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VWdQjfJEv17Sa7ZPlM69WVgkJ4xrrn+SVmA6eSQkM3w=;
        b=KyKUagNsNsjJG+LGRxnq41X77k+9pd7SRrYoFmlc2BApscqzciSXa1GZHQHHLGF21c
         ASE277NbxLXFyAQ1k69JidkjggrOoviuGxBR9g1Zo4XeDh6kjVGhlo2BrX7kjhMrdDQk
         oPsLTO+WaGbUYdwNbGgQU3A+1/jZqbji1GBFPXfWRQ9uvIAfMxCN1byn7xyAGDBbNJvC
         gimXKU9YstF0YMY7A35lQklUgWPrEnJAGoy8LPSp9tHbxAXoSfTM3/NtvLl+1EGW6jsi
         WZbq479VUyQdplyYz/RPbJyUaEn49l1TlqXE42clyIdUBB/KxpP/mVLcqyM0/YiFk4E1
         2KXg==
X-Forwarded-Encrypted: i=1; AJvYcCXY2V5J1/zqpCs8JvWafDcmpBszpJLcsuWH6Sxtb9uHS9t+IZY1huD3p5CXqbPMp8jFlXdObpBCG99JUZ1JBnnU@lists.infradead.org
X-Gm-Message-State: AOJu0YwosTLjT6mL7IuZCZviTCYeOscWVQOVGMgCK2AeHVBcdfl4msVv
	+7nVXRsF/KAou5MorcnbmYYgfV2k9vO2ywEE1M6e4huBe/aqdWAe0pox
X-Gm-Gg: ASbGncuvtLzq9Qxs1jP9tKR0bt6Vk/IG2QVtaz46CPIeHDZVFhube1u9wXCx4ibXhvD
	FV7hd5zHVYiAk1YsK+roTnu2m+4xuk6WSIOLzz4KlVNNM6YDI5AmxDgllh04y/hP5Jz/WVYLhZU
	2u/CtUSOW+gFe9t9+TQ/+DAWN6IrFNxkep7Cr4O+jdW/DCF+EZ3CLM00z6geJ32cdPIdzX66Wam
	sYqiF3/3bWWIl2rQo5vhmgIDvhL9toDkCQ4hfRHKgXJ4fqZOu8jeFOZI2ID4kD06yy6sWZCKqe3
	tuZPAc5jp91DgyBJBFz0ENoC/O383BsPfhDqPOutn7OehVT+5K8bvu8UpWLNgNHQQ6zcvCp+www
	YHIzPZagypYN9I/uESXOIvNpUnHDlQEYapIzWBrrdyQAWiPeaZyUp4ncPjkjfLROWpcvSnfu9RQ
	tKimuWNnxyFaCGy3/x6mwelYq4UcJY4R54VJuZBA==
X-Google-Smtp-Source: AGHT+IHL8SCZliSxbU3IoQx/aVhNRnS5pIg2oX9HCryB27tJyt6t44B6IxSN0UhqL2jYg3FBXXfTZg==
X-Received: by 2002:a17:907:1c81:b0:b73:42e5:a59e with SMTP id a640c23a62f3a-b73677edb7bmr274842566b.12.1763127502138;
        Fri, 14 Nov 2025 05:38:22 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb2cfsm385330666b.71.2025.11.14.05.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:38:21 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v5 2/6] reset: imx8mp-audiomix: Replace mask with bit index
Date: Fri, 14 Nov 2025 05:37:34 -0800
Message-ID: <20251114133738.1762-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_053824_327358_A3392775 
X-CRM114-Status: GOOD (  12.87  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Replace the reset map mask with the bit index to make it clear that all
reset lines are managed by exactly 1 bit.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index acfa92b15329..d993c294c548 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -19,24 +19,24 @@
 
 struct imx8mp_reset_map {
 	unsigned int offset;
-	unsigned int mask;
+	unsigned int bit;
 	bool active_low;
 };
 
 static const struct imx8mp_reset_map reset_map[] = {
 	[IMX8MP_AUDIOMIX_EARC_RESET] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
-		.mask = BIT(0),
+		.bit = 0,
 		.active_low = true,
 	},
 	[IMX8MP_AUDIOMIX_EARC_PHY_RESET] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
-		.mask = BIT(1),
+		.bit = 1,
 		.active_low = true,
 	},
 	[IMX8MP_AUDIOMIX_DSP_RUNSTALL] = {
 		.offset	= IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET,
-		.mask = BIT(5),
+		.bit = 5,
 		.active_low = false,
 	},
 };
@@ -60,7 +60,7 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
 	unsigned int mask, offset, active_low;
 	unsigned long reg, flags;
 
-	mask = reset_map[id].mask;
+	mask = BIT(reset_map[id].bit);
 	offset = reset_map[id].offset;
 	active_low = reset_map[id].active_low;
 
-- 
2.43.0


