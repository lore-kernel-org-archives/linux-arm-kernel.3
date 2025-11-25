Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48316D0EE22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 20:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v8yo3hO4mjCY+g/iV1oBOKZVnosI+hY7dYxVrjtrKls=; b=ceH6FykH89kC88H2Mt7zKD16p3
	kllSFdkJOZLN5PgY3tL7BZEqNhijsDnz5Y0S5gtPdBx1fDA2ntBwVWm1junH1MbsGUH9N+vnVhR1G
	+Fbg1FroqzCOQ8OZMR45tWZwmGP6eMvGqNiZNjQpVBsKGIi6Wbzkwt5lSr+09pF37JW7QwhQ8XSJV
	mDE+Ir94nETu2xFvTAz+W8vBaSQOMTfNyhvUwneX26Jnp6XIdQY9C73T3PYbcst1FByrH1iJun/Zo
	nR+U3e/Ce7O7TY5JPSEmiktM4naWhhvRY2EovlI7EgFxakLSd1hsjX2FLFDrMl8IDYzkyve0whAPe
	2hu+29qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNzZv-0000000DtyX-1LDm;
	Tue, 25 Nov 2025 20:23:59 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNzZs-0000000Dty5-0bXN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 20:23:57 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-295351ad2f5so7686725ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 12:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764102235; x=1764707035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v8yo3hO4mjCY+g/iV1oBOKZVnosI+hY7dYxVrjtrKls=;
        b=lUp2fwuxGxx3CxzqD9ou5aK4kqDmve0rlVbnUw7GRG3lI4V3MO+dfzub7dA7OxR86L
         uwEUGIH9woMBw2ADW9wJIywN9r09yAet165ZUCz09lt5Fgm0Ib0tHH6ttM2cVwlk/BPE
         NulBmCLxJrH2Z5v/JlGBC2ktMk2g1/Y5aTwlKsdqOzg9uMMMB5C69jikIfLehd/KeLpf
         ZnsIGd6oRNLNmieXl5kl4hHkmUEvlogyzQdcKmTG+xjW7Hw74fvwKOGjiMFDniD38aRw
         Hn/tF3my6tfSJKKOIWrWQ0+WvJedjIew7b8xLSEp2S21RKV4yAQ24FGSeQoKiG0+jNcA
         6Mcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764102235; x=1764707035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8yo3hO4mjCY+g/iV1oBOKZVnosI+hY7dYxVrjtrKls=;
        b=oB/el2mweiOw+ZV0NPIw938XIccXuz1dS2UhT/32SWl++NxrY1Dr547e4PcWETvqq3
         i+7EPHA6pOSzq6ZhqSDFcqmjNdtXeEQH81/MsI6A6euEhUmvGVblmLRqkGlsfKGa3KPP
         Xu7+Ygr6SXKhdIvCeCcqH4feMIJN5GKptLO6VHVyHrN5RlWImYMPV8QBULGHUR0Y0/1u
         ucpSjZa5WAv1qZcgMjemseOMn5Syx/aLbC0PpblCLG8HIVerunTRL2OHfHG6CxgW8TbU
         mq/q0HFVmTJr7roxpIsuqmPxiUgcYujU7Wa6kUbqMnJs0E4teyhkEXnw5G/ErekcmTWq
         TX7w==
X-Forwarded-Encrypted: i=1; AJvYcCWgCAtpZqDyjsmJN/9FE1P5MWIOvwMF9/jY1bzKJMy95clISw30WBIwHbNOiOYflkgd1fAFtM8qWmiZCZvFgvsd@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe7kCj+pxcWnIT6evQjITg6aQEM8mV8aS6wJzsYeFNBqQ4LRsB
	mYObsXEpchPTP19wNI75NoujxhrEr1LtAt29hqzhXl+vxrLFo+EeZOQr
X-Gm-Gg: ASbGncvwaXsKj+w+DyKQX5PTbwZRdAuyRNJiuLVQN3QplcoB6Zlr8uzSUPBTsAjuSjk
	FnCGXiYmNSyskbIfWbpf/sk2DFlUEI48Uuit+swJR1S4HPFY635XIb4jTiVgMJWMRQ+Q1Glts7p
	TkG8XvmQQR0z5TkwJZSsWHw6ak4gHwSsJBSnvXQDQ7DVSJ9tAXQBo9PYI9bf2hQ75cKP/F7RSJn
	D3ppRUVjwIPczFtQyQclaaMxjEscSLTzTJ/hks0WbcBw2sOGuHTavdJQL4C1NN4+9/uAc1vPdOP
	YLzoKmZy1en5ZAVTzWjf+NvgCXi98TxFG4dGUKF02XLnliWLk5J6zQ590myh57Vk5Wwxm6ymQ6B
	xGrZQA3yBKglpKd5C0Q23Qwc2sWafnhyYk3iCfCHupPCipbr6qt2nY5A9QjeSlmuy5IaiJBCE96
	aRXMj8GbJ+LbDdBAc=
X-Google-Smtp-Source: AGHT+IG3RTcRxFUsAo8usCNv69f81QaKk/JOFHEXI37wwk5ElPTb6WtM/qi0Gq+AIsPZSO6XeDWvSQ==
X-Received: by 2002:a17:903:1103:b0:299:bc94:7ded with SMTP id d9443c01a7336-29b6ff75aefmr104832265ad.2.1764102234966;
        Tue, 25 Nov 2025 12:23:54 -0800 (PST)
Received: from Kai.localdomain ([106.222.232.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b25e638sm176386135ad.58.2025.11.25.12.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:23:54 -0800 (PST)
From: Ayush Kumar <ayushkr0s@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-newbies@vger.kernel.org,
	Ayush Kumar <ayushkr0s@gmail.com>
Subject: [PATCH] staging: media: Remove unnecessary braces from if statement
Date: Tue, 25 Nov 2025 20:23:31 +0000
Message-ID: <20251125202331.36505-1-ayushkr0s@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_122356_207180_10E50D98 
X-CRM114-Status: GOOD (  10.68  )
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

Adhering to Linux kernel coding style guidelines (Chapter 3: Indentation).

Signed-off-by: Ayush Kumar <ayushkr0s@gmail.com>
---
 drivers/staging/media/imx/imx-media-of.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index bb28daa4d713..7413551052ae 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -57,9 +57,8 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
 		of_node_put(csi_np);
 		if (ret) {
 			/* unavailable or already added is not an error */
-			if (ret == -ENODEV || ret == -EEXIST) {
+			if (ret == -ENODEV || ret == -EEXIST)
 				continue;
-			}
 
 			/* other error, can't continue */
 			return ret;
-- 
2.43.0


