Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C12C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 16:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWBrjH6js2nFce+bLoPB/th2NWEOtvdRjUhQW1smgG0=; b=xWAxRbtg/jyRSxMORZeKLjyf9o
	LWoRtCXpGRlyyGCzLZm7B1Xqsv7c6p0UU6uygcNNJv8w1nAObuVOSaU3SLlcFB7ehDdS8ALOuorSh
	jOQoxeR0abNAY6Nkd1f/ePIRb5UWvejnpujS2usXcAbC3Vk8E3ekGgHfwpk9PHj62SIqj0K+kpG6T
	d+FJGRrOwy/2juk8Vr8wOXJWpscoHBDOdnjGu1aJcvMh1Jgam7z7SySSoTsMBfyS5TMnT61clgSNE
	1Rsj1emeNS21fQAYjfVp3KaWiLei/ihDKiXP2rQVDEdQTgGVg2JAjWnqhy6zzINt3Z3NRvR2Fpq9a
	a95PaZRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKwn-0000000Cdlo-0cHD;
	Tue, 06 May 2025 16:15:09 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHh9-0000000Bxi8-1Cqr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:46:48 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso7749629b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 05:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746535606; x=1747140406; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWBrjH6js2nFce+bLoPB/th2NWEOtvdRjUhQW1smgG0=;
        b=EhpS0MhoWtF04EbAGg1qjM36w1Y9EwcUcZEObeNYeoHQ+Y7wKQa8bbL7t9VL9y5n0a
         DKOqQal/dTOmAksmsNnCewImaqHeUiQsiUaxVUMqSVCGp8m6aWfWvwYRi5PE0xZJ5LA8
         zIm+rYki6lcBv9YTBMNGmwDobJllh02u6YYo2lqm2pGRjjeoODBAktpzAK3Y5p4ip0vu
         wZ/8Sj0Be1Di+bwExQhQBM2rlBlGa2K4B5rQzkiL3RFHMEYyf2rTBahsFphzwTki2/H0
         1F5UcT5EoyLYYPsA8aXCjzsgkjgFbgh8HqLjca4rWsfzdKngZ2iBkQHR3BNCAMoRmy6j
         VVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746535606; x=1747140406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rWBrjH6js2nFce+bLoPB/th2NWEOtvdRjUhQW1smgG0=;
        b=CslPzfgpNewjsM4hyFhVEYzUrfc4+YUre2C49yl7IdxPfZRp8FCAMkkMWB10TXGxNS
         AdTWBERV4r0vvnroj4l/OQhNHH5/0RJIA078gVLbrKNsRj/h9k7wKqZ+CVRhIT6TPvnj
         o1NbGxVfYNcCfT51mn3hnpdDT58CwFcOam04xvaU9gjZs1gErBgR8uE9iSD4qRP8cepx
         dvB4Be7IcZXde9Wb6S5ZGRLj7kbjVqsTPRRwE419dDPv6+aCeR5v0m/re7Pm6KxK7vwV
         vPDSrXrdlcFTgur9oTEVebRE6ixzWKewCyooQQCj8+8vEc3J7ZWpK+TdCERwoFiZoT1H
         d/pA==
X-Forwarded-Encrypted: i=1; AJvYcCW+BuCaw5LauLjVC674NTjA5CXX1l1vn0sEMc8nJCMbhlO033FQymNG4MUmIIgrcstaHpjB1jUbdthekH1Qiu69@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl7XDr22Ks8hJLBiSxMXv7/NvPmVm0kOXQkRIXfHLKcSuLg0Ft
	mKNSkL1IyAJF55o7wBBmbqH3chbi+Ab6/mFWvcOjMPUwlItIoWv7
X-Gm-Gg: ASbGncunKUKflV3r+Y8s5NjDik0P2w/vB6D2EBnWz2xgILA1R4wL4NSiJqWfvCA8LhP
	2Ml0/Amp/41bFRxKzRBIZr6PhgIHYh6eesGBOkZf/T6zVUGryQZXFwWqDUV4BViBYvO4Jy8N3bp
	ogF1b5p/sJ1WKUhzmfH858LyQOzAIZCPktcXWUUUSk6kbG2hDwx2zWOnx5Jb+aN5VwVH7+cI6eD
	LJ24FurX5BlLG5kmj/QaZP9KZvFyQ6HnpQQCrK9C5QYKYiUf/usaA8EO/jvp7G0EqMGf6+wPyyu
	Gf4pln5H1cGAX8ghMYBu1RKvcs3pSpNDEEL58YDKDcJ/R/XH8RVY
X-Google-Smtp-Source: AGHT+IH/s+XBsMtzUorpno5+btU8tbMk6Pgcbuceq94+SH6/HsF1kgmbs7irvdW0hiZ7S7FOSD+ohQ==
X-Received: by 2002:a05:6a00:8c05:b0:736:eb7e:df39 with SMTP id d2e1a72fcca58-74091b01025mr4069318b3a.24.1746535606545;
        Tue, 06 May 2025 05:46:46 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405909cd89sm8756817b3a.169.2025.05.06.05.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:46:46 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 06 May 2025 16:46:16 +0400
Subject: [PATCH v2 3/5] irqchip/irq-vt8500: Don't require 8 interrupts from
 a chained controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-vt8500-intc-updates-v2-3-a3a0606cf92d@gmail.com>
References: <20250506-vt8500-intc-updates-v2-0-a3a0606cf92d@gmail.com>
In-Reply-To: <20250506-vt8500-intc-updates-v2-0-a3a0606cf92d@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746535586; l=1330;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=PJOB22Kv3PJwwTTW6D5ax3TpHEhXSzaZpTr6rXL+klk=;
 b=ebUFwm60fraNvK1soHQF8KMtUOBLXbLoIcTJcRuJhyhljahIxR6s5gtd6hwd7GoMT/J2X0wbr
 OmU0eGtaMAABxwJdxIutML/sEKvaGKdzg4Cm90iQsYx8qNqq//H9EwJ
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_054647_329289_85DBD253 
X-CRM114-Status: GOOD (  16.28  )
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

VT8500 chained controller can route its interrupts to either or all
of its 8 interrupt outputs. Current code actually routes all of them
to the first output, so there is no need to create mappings for all
eight.

Drop redundant checks, and only map as many chained controller
interrupts as are defined in the device tree.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 drivers/irqchip/irq-vt8500.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-vt8500.c b/drivers/irqchip/irq-vt8500.c
index 6d46e1a0fda953d76679ad2318674fdf0a977f0b..cf24a88f52d1b90f033d429288c88398439b92d1 100644
--- a/drivers/irqchip/irq-vt8500.c
+++ b/drivers/irqchip/irq-vt8500.c
@@ -220,16 +220,9 @@ static int __init vt8500_irq_init(struct device_node *node,
 
 	active_cnt++;
 
-	/* check if this is a slaved controller */
+	/* check if this is a chained controller */
 	if (of_irq_count(node) != 0) {
-		/* check that we have the correct number of interrupts */
-		if (of_irq_count(node) != 8) {
-			pr_err("%s: Incorrect IRQ map for slaved controller\n",
-					__func__);
-			return -EINVAL;
-		}
-
-		for (i = 0; i < 8; i++) {
+		for (i = 0; i < of_irq_count(node); i++) {
 			irq = irq_of_parse_and_map(node, i);
 			enable_irq(irq);
 		}

-- 
2.49.0


