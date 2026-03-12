Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A2D106ACDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 19:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UUxQK5QJNlcyTiSWRj3BOnT+rEkUhbC9Gnm0lW0kamY=; b=jjRsplS38WwrupNp4KvbVXgCc7
	ZL9ZYGnaqAQbkAj1FPZ9pBiI61jAOZ94hh6JhkKic5zvTso457DeYsmYFebES50ojlxzg7wBF3haV
	d8JmTx/BzvbW6jeIDP+lpal3wrOwVJUrqG+BlhmSVOaFO2NxSSLBBnL+1EgbXZLtb0F1twAFErnSK
	xjSIz/ydWp3gEvWguJpnXxyoAYOQOvTNJTmVPMAG61M1rhFUGNnQi9Zf3hSvIFR6WzYpINyGhdaRY
	twCVidVuzo5Lq8hfptZuBub+RfGst0+kSLpO9xg4Uc5uJWwX/j6azplwk/axwrdXnfh44eRu/ODYU
	AhzKGkbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lfq-0000000F5iA-1VPT;
	Thu, 12 Mar 2026 19:26:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lfo-0000000F5hN-3x2g
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 19:26:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=UUxQK5QJNlcyTiSWRj3BOnT+rEkUhbC9Gnm0lW0kamY=; b=P3B5WoeERRokJ+KkFSlaGgQxV9
	JJcpVoiyZGCCbGXpeDKcDIopmT98XA42/St04AbHPSDwbVvihiHVBwpw5UVnyRNhQUGvJvyAFt0x1
	n1Eaxj6yuCMEHLeMtrmflbWaW3m/clsc30TdyJeyqnS/OXrnDHwVHXfRKMS2VmS5HkzY0MXgLZ+Jr
	pa0FgDSi2okU8JopW9OFfj0XsxOpISysFWj+qxSOu/4AZKZmrSX7l/JSTPkM60beHehE71+xLouf4
	7wCGzCTRCaGd3WOlXfz+KLgev7hfhYkxrd3YfrhmM/JaMyoBoT6A2I1DLopkdgvi2tOGFifkLPV1r
	rweajFsw==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lfj-00000001snp-1KqI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 19:26:18 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2aec4a71ef9so5505595ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 12:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773343572; x=1773948372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UUxQK5QJNlcyTiSWRj3BOnT+rEkUhbC9Gnm0lW0kamY=;
        b=LugSJ3N0xrbmx1WvgB06CVetWUVspr4cRGIxXOIR1NHtrxkhWavqIL6BtZSU/AZy2j
         akjefDz8nOHZdVs/s3yPeDZDe4t6Ly7S8Ajx5TFcQv6dZdh+t6r8OuHe9A2Fx8chyG5H
         E/Hsp4Wnns+/qQ7ZgCmyzEoyoGj+titNcqiRV4HGsnu9hlwtI/lY2As+ZsNFlBhWF+E0
         nd0ksIgf5/PWYWqS7cT6DWJPsXdzPNJMRGUlR0Y6fmU3uMgSE22Y8MpPIoHnkpsm000C
         iVyKR+Z/nRpEV8+8PDE4r2YOd6REwxIfDbBlEwlxLw6rNu99t1Tb/R9bSa8hNwiJHVG4
         L6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343572; x=1773948372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUxQK5QJNlcyTiSWRj3BOnT+rEkUhbC9Gnm0lW0kamY=;
        b=mUhqnMJNVIDpli6l4lqJ1pjASQZFZdSv3GZq8HNJlHceqES68I8WsZMOUHln3hN5km
         aRnlSYg3CxOOOMiTHvnZyg82PDKEFs605MwC8D0YWNdUFRwTXG0CcDHttxLVqBhAKJBV
         +9Z6GYoYk/zyovgSqv4b6vCx3oCBbDdjpAJflHvDoPPxp4cDvmaTXGQg5yt2bj5eXiLz
         a8+lWi2fqxO6BJXO24buwvl2+kwixx7Tmb1PAjPtoPBY/SIe3f70/5BuPkfgVPAiiWWD
         4SvFoRrKp1KOHaQW9O1XMFv0prvD7+14lpkk576ezopXOATKnokJhwSlEm3tNLcbhQbB
         gnpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvC4u/Rrb4PIvo5vGjZ+G44pKAno2oUyH4IowHfmEpypIGFbfmabE3Ssb4hIzWU5mia51+MuVKpFjZPjdUhApX@lists.infradead.org
X-Gm-Message-State: AOJu0YzKjjCG9/wC5j3xfNN/lErsMb/rU6qcf66GPwiXspndSHUkfPJ/
	MNa0UtsAo1CnRyI6/lIiiApLaSJIpeE6y6emjf3DzzpAMnw90sLXmEZ+
X-Gm-Gg: ATEYQzxmuhs/huCAnYIODrqi7AReuS8qqDHguh7WQETpDtY/pRvBG7jdR4drBQ/0I2h
	ry/jVxsAMS2IhFtC446DUkiH6ADoNrpTZS/fJaVfKWPFSrdUWZF/+Nd5KWQUjnEY6nAuuouJCS+
	T51P6eSLnNGy43CCgyQ2nQKr+7X4D7o9cSH5hj3VdK18TYQQzHMeuwoMHKY9NJOh6XOA3M+H/Fs
	lPfmT0/hEAPUl6+vaKqDI/1ZYNMO5NW0/QAAbA2ifT52PvaQbQx7jGgVTxD1tMSarmxvQZJ2PtZ
	SEuBo7tUHMu5zkit3ebh/m0/G913lliN2Fsjz/uAFFHh3FfUDNFUPigzsKmMzAyBcz6icwCiUnW
	/RDfg+OQB6DqDsjQ7wmxl6TsZU/KZyu3Gikdnjkb2t8q0Oj6nuj6b0oFC+hSXCLsOKsxvL35evH
	QyWO9mNvFyuhFt1Om9IMNx3eXsH2XtPypAjNxg/Djp8T8TARf4MQInig==
X-Received: by 2002:a17:902:ecd1:b0:2ae:5655:b42 with SMTP id d9443c01a7336-2aeca95988bmr5392935ad.12.1773343572347;
        Thu, 12 Mar 2026 12:26:12 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae34de2dsm67068375ad.59.2026.03.12.12.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:26:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE)
Subject: [PATCHv2] irqchip/stm32-exti: Use kzalloc_flex
Date: Thu, 12 Mar 2026 12:25:49 -0700
Message-ID: <20260312192549.4453-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_192615_445279_DCE0AC78 
X-CRM114-Status: GOOD (  12.65  )
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

Simplifies allocations by using a flexible array member in these structs.
No need for a second kfree.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fix title
 drivers/irqchip/irq-stm32-exti.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index 5fdf335acb46..144120cadfa0 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -45,8 +45,8 @@ struct stm32_exti_chip_data {
 struct stm32_exti_host_data {
 	void __iomem *base;
 	struct device *dev;
-	struct stm32_exti_chip_data *chips_data;
 	const struct stm32_exti_drv_data *drv_data;
+	struct stm32_exti_chip_data chips_data[];
 };

 static const struct stm32_exti_bank stm32f4xx_exti_b1 = {
@@ -269,26 +269,20 @@ stm32_exti_host_data *stm32_exti_host_init(const struct stm32_exti_drv_data *dd,
 {
 	struct stm32_exti_host_data *host_data;

-	host_data = kzalloc_obj(*host_data);
+	host_data = kzalloc_flex(*host_data, chips_data, dd->bank_nr);
 	if (!host_data)
 		return NULL;

 	host_data->drv_data = dd;
-	host_data->chips_data = kzalloc_objs(struct stm32_exti_chip_data,
-					     dd->bank_nr);
-	if (!host_data->chips_data)
-		goto free_host_data;

 	host_data->base = of_iomap(node, 0);
 	if (!host_data->base) {
 		pr_err("%pOF: Unable to map registers\n", node);
-		goto free_chips_data;
+		goto free_host_data;
 	}

 	return host_data;

-free_chips_data:
-	kfree(host_data->chips_data);
 free_host_data:
 	kfree(host_data);

@@ -389,7 +383,6 @@ static int __init stm32_exti_init(const struct stm32_exti_drv_data *drv_data,
 	irq_domain_remove(domain);
 out_unmap:
 	iounmap(host_data->base);
-	kfree(host_data->chips_data);
 	kfree(host_data);
 	return ret;
 }
--
2.53.0


