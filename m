Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCA5C36010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 02:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9gVv0/lFUKCYB76B/uhhr7mW5D0FE05CDx8S7RsfxM=; b=YNz98MmCs0oR6gEsU6qMj18Jos
	qDHmmqWrlqDvMTImJt0IH18Ow+i4iA2iA10PCO4jTnr0jGTxZnHkmzw5AZTCk2l2z+AgxYJfyOTJC
	1LhQjcBc+DIjR0Uk5M7nI/VFgrVSbaIxuYI7WgDLgJUPRuig36m1w63Uza1gqPUE/h/gaT1esCXod
	JZBotXa48tWsXNBPJIBvVFxarDZrGSxvvtmi9WWaVM06EAZtfG7fD1FJ13/FuBXU1o1Wy/CKVUCcy
	c2F6PegofKlE2YFDb12PTvrsLAkN4EhZynXFtshcDQN0HYkk1a4u7dRjBCMNb3KWLcfau6NwA61qA
	IwcqG05w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tznVY-00000004uCL-0V9E;
	Wed, 02 Apr 2025 02:07:12 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tznTn-00000004tze-1g7m;
	Wed, 02 Apr 2025 02:05:24 +0000
Received: by mail-pj1-x1042.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so13452965a91.3;
        Tue, 01 Apr 2025 19:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743559522; x=1744164322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9gVv0/lFUKCYB76B/uhhr7mW5D0FE05CDx8S7RsfxM=;
        b=aQHBwerDJ7uK5MyUfXX6fNG+WGwkfNErKIoSPaB6eyUTNsbcqaZ07J4pMmr7nhVGO2
         2VkuGb5Vfq5vfkpu4BYKUDT3NmAueAji3LwkXfYJwXEPU20Dwv4k2aJ7eo3WMQ03mwh5
         3ZXW1QmWSVhZBNS1KUCR3ImpSwwSSXz9oITIE6TBDyPo9u+DeKQoZIr2DPLpZ4bXR6Ag
         eqOPaivJqN4Tgs3ul6EhkJl1EbDfiKakp4pqwBs1udY4RBgmi1GGxuucs9GwyTS4V4Hq
         AO/KFbzD+/Y9T5iOEULcj887iPA0qC8e/8x+7hLyUw5U8Y/rIdMI5RKnBE/f3DYmpvCF
         tFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743559522; x=1744164322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9gVv0/lFUKCYB76B/uhhr7mW5D0FE05CDx8S7RsfxM=;
        b=ASmJfb7PTphzbIu2f8EU8WSbld25Dpgs0UXu8/gm2LYVWWuGVffQtS2Y58dxKoq03H
         6LpICKVtZiKxPeOSvTvDIL1nI9klh8FfMtvmPa7d1gW3+D5PTh5ii2X25UwGIPi7uBzd
         JcdDXnR4eSnJ6a+slPGnluaHPma6/jQRkFmGlA9TLpqOrc7JGmjms9Ho5Pwa0CRh6dca
         xUR6+97KLVrucdNTFhf8lvCojI5QZPcs3irpiMGA3nVp7u/zzwL4sMb37KGN2U0b9254
         zkb5x+1JhywJYFTF0tMwHECF64yhZYrchYb2kPoKEtiFDnBjFYiipsBHlHufDhuT7Bu8
         JV/g==
X-Forwarded-Encrypted: i=1; AJvYcCUJfmt5p2rdB4QsPFVykTYKlR34mSOAvgaD8uPJGidPiBqVu/P5in6312m+1Jl0tol4U8rkBEpkPQPyl2LJqnvp@lists.infradead.org, AJvYcCUdcKrjW2vkHykpGL2uV8YPxascMQPct19Mp+sZvH+hutzhIBFBdVKymRokjD0UT263wcVDfDyfo+8d5cD73EVZBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXCfupmyFn34sF+rJjMgBS77srjNVFek7Y5Hv+2lm1j+FWEITN
	WUIE2hObfmH8R2xl86BFdl3AMJQoQBhDmtp6sCa7oavBVdHyzm14yAZMG2GvPGobSw==
X-Gm-Gg: ASbGnculhlajL2MlmoqTTnqWKul8+Q1lQb+FeWg6U/ryhCQ8jnsOYkQ7JjBC0FnABWK
	U758+Gz99wJcCUjmr3lhVuHZm9S37GKHMBZ1JU0GBGGIH633pgRAhmwDRVFT3qNjw7oxqSJ37pz
	WwDblpL5wF4P0pcg8hMBEt3kfucsEy6pk+gJ83dXyvfi1L4DKokG0CHzpumZUjNfSFeFDMXaC3o
	I15MQzD860c8PBWoE/GO0P/V3B54+LamyleLjSXWkxod62l1UKMBPEDsYbojl9MAUj8ucJerCZm
	WJh76K+b0gWR3q9QC9Yr/2txnHgB2aOycqqBrVj4YdazFNVnOhHTnwQtSbuhwfBrTpZ9ucw=
X-Google-Smtp-Source: AGHT+IGYOTfs8itG/9LV0cKs2C451I86DIdU7xhHpNkIKc6/RhBynUFKMtIV+3x5zV3ZEehIEE3Ehw==
X-Received: by 2002:a17:90b:518d:b0:2ee:e945:5355 with SMTP id 98e67ed59e1d1-3056ee5bb27mr1165789a91.19.1743559522249;
        Tue, 01 Apr 2025 19:05:22 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf51asm96808645ad.151.2025.04.01.19.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 19:05:21 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: dave.stevenson@raspberrypi.com
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	popcornmix@gmail.com,
	mripard@kernel.org,
	u.kleine-koenig@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v2] clk: bcm: rpi: Add NULL check in raspberrypi_clk_register()
Date: Wed,  2 Apr 2025 10:05:13 +0800
Message-Id: <20250402020513.42628-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAPY8ntAFHW3kiqCnXjFtzL9FnRoQ69v8+3yJ+jR8_W8Bb+6d8A@mail.gmail.com>
References: <CAPY8ntAFHW3kiqCnXjFtzL9FnRoQ69v8+3yJ+jR8_W8Bb+6d8A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_190523_593103_217A807A 
X-CRM114-Status: GOOD (  10.03  )
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

devm_kasprintf() returns NULL when memory allocation fails. Currently,
raspberrypi_clk_register() does not check for this case, which results
in a NULL pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: 93d2725affd6 ("clk: bcm: rpi: Discover the firmware clocks")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
V1 -> V2: Correct the commit hash in the Fixes: tag.

 drivers/clk/bcm/clk-raspberrypi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 0e1fe3759530..720acc10f8aa 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -286,6 +286,8 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 	init.name = devm_kasprintf(rpi->dev, GFP_KERNEL,
 				   "fw-clk-%s",
 				   rpi_firmware_clk_names[id]);
+	if (!init.name)
+		return ERR_PTR(-ENOMEM);
 	init.ops = &raspberrypi_firmware_clk_ops;
 	init.flags = CLK_GET_RATE_NOCACHE;
 
-- 
2.34.1


