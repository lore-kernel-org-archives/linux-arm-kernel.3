Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D4DE9D800
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 14:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YWxgN07OZVOqO1Bvp7LxV7r6cRwAlkUDH9yP+maR0zM=; b=GS2nlGmRgSrafN3/MM0Xwkpyk2
	68srRtnIpDPzoY92Etq9IeRgQqzwFE3wnS8TfrtZpZcZU8XeYsBmxfcK3T1ZfJHRSOIpXJRQCvX9K
	rsg5WOZhlW4IeSnZAGITuIjld3MkSOO0EHQBn10rRTuob0j2P5ZLvEo5WSaMyaTyAqzFbONbGSlbC
	AL2ZqLa73OSHuMJ0erL8JhUYESzcYjORhMjimj55u/sZt+RDSiehEWJVcFqtD/A06qKF5isYeV0Oc
	GdNSnF1spN53v5JhRgUPDzIfa6+vLi8JFLUczlhQol4bNTWf/SVcydm7ULaW8tzD7wvqV3nNI4+l/
	++ItbV2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9OmG-00000004GKY-1QLE;
	Sun, 05 Apr 2026 14:48:40 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9OmD-00000004GKD-0eRK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 14:48:39 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-35d9923eec5so1883389a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Apr 2026 07:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gapp-nthu-edu-tw.20251104.gappssmtp.com; s=20251104; t=1775400515; x=1776005315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YWxgN07OZVOqO1Bvp7LxV7r6cRwAlkUDH9yP+maR0zM=;
        b=rizhSSbzMXsGtszqCFYlvhmZ1ArUYxzcIaYsNf0Ivk9cyi56IMW0413tzPmuEReCod
         sInMgtR65jGNCfYdDUFiIXMo7EFwl7AcGWmHqBW7X1dqK2fzhrnNrrmdG7PxXO6LoK4l
         bPPQxo/txD33z954FvYVopsPjDYF/0oTHwH4V0+FS4TRZj76u2avN8cgBhyT8W8e1Q3t
         WcyCgTZwBd+p7WfkdSYUFKcrhvwlpl7abi6CcV8anEcPnPe8PgxRLydFxKPjjtO79VGB
         9pStTLtq0PIWOGTDU9uimGcebtDN6ZuD9p0R8eH5vjKSKKbilrOjdWiah1REssOWHuYl
         luEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775400515; x=1776005315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWxgN07OZVOqO1Bvp7LxV7r6cRwAlkUDH9yP+maR0zM=;
        b=AZEHBWPlyAgRJU7GMcB9BUpl4jy46eq9LznnGEOSsyu7h48efarm2cAD2BJTh1hZrY
         TTpbEBcHRb+QlPqMN9HDJCE1r3xOcWbDgi+9JaUhmD1kJpKegtYvfhN+vqxeYOcZGTEH
         OK8y+WSr8yWu0lWEB7VEX5rwSjVRlx+OSZ4MvPdijbo/vZowMRwq0ILoybw+XGuQOhzJ
         a/pnuG2WorPVEv0FbNWf8d4BwBqrLkz7J4piZ2vDIMs5t0U1pGff7q+q916C8p0sGhXj
         bDYA56GmKleLBYeyvYj3cAZcW/IbiWa8NSdn7wmf2/zCLBVEg9ZqfymWKkUVN3pCdgbA
         XiNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGwTe21tx+ysfKpm2j1bzMlcUa5ZG6/0ChR0D05GaCmjb9/UB5vrFNd6GhCD607Lu0EpkhdzFohIdcNq3QaB3k@lists.infradead.org
X-Gm-Message-State: AOJu0YwJUvbZM+i6GYAFMf/yD7EFtiveg2y44ehjLDbZWWpqZRzrp/yK
	dOTuM/a+yDzYbJhCLit37h0+iwx4JS76IscRgAd9druVbDZrqXvwSt26vRLLjd0u1uk=
X-Gm-Gg: AeBDietj8wOOWBVc1N/xcPX94X8kKwmfyE21yEts3gJoM3VABSRjJHtIQF/05EF+3yj
	kKAFjXgtkEUa1XhYyHl6kODFzXWcf+Nzbuislbwql5ZIAiCmp1kByKUYroB7TCgBhcWb7emDkLd
	RHnKi9KfSFm0amURj6J3y6FWBM4a6IeUcjQGnmx5Gz7xhFUqHSmjf3EKrELq3NtG0B5xZobd8Zb
	3GkyfITLMmqstY8QfRzhjYnpOdle6+uaVMsVm9vlS2UO+9/5X5pfIw4COLgXZVCk7BYShEd7PIt
	5hINr5IR7+VdAbZimt8XamNynIZjj5vJMBAJY0XIBap5/ZKu7CY31OU5cppi3acjh8DU7z209fz
	6W5AyZpxO2VrJAPKJR2ijlohQHFcdtd+4VAmc54yfE7OkdIRHXD7qwuSJwmY/4Gl5EykqyFwS2q
	wlntMozPp0vNu48uolptEyItw8ds0rDOME07QU/w9mEeG5dg3/MJLt4WT5j5SqbR3QaGDegeU/k
	9c7vo0Vot8BhU+ieIVTkTbbHAH/PRvCK8YiBT2gnBeR6O9g0w==
X-Received: by 2002:a17:90b:3c0c:b0:35d:ac4d:3cb6 with SMTP id 98e67ed59e1d1-35de68417eamr8177597a91.5.1775400515423;
        Sun, 05 Apr 2026 07:48:35 -0700 (PDT)
Received: from tomato-cultivator-HP-ZBook-15-G6.. (2001-b400-e3d8-86cb-6841-8517-e166-bc96.emome-ip6.hinet.net. [2001:b400:e3d8:86cb:6841:8517:e166:bc96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe9709b8sm15357742a91.16.2026.04.05.07.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:48:35 -0700 (PDT)
From: Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
To: linusw@kernel.org,
	brgl@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
Subject: [PATCH] gpio: aspeed: fix unsigned long int declaration
Date: Sun,  5 Apr 2026 22:48:03 +0800
Message-ID: <20260405144803.31358-1-ku.loong@gapp.nthu.edu.tw>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_074837_449361_016C8A3D 
X-CRM114-Status: GOOD (  10.37  )
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

Replace "unsigned long int" with "unsigned long"
to follow Linux kernel coding style.
No functional change intended.

Signed-off-by: Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
---
 drivers/gpio/gpio-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 9115e56a1626..e6af7f3fba5e 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -655,7 +655,7 @@ static void aspeed_init_irq_valid_mask(struct gpio_chip *gc,
 
 	while (!is_bank_props_sentinel(props)) {
 		unsigned int offset;
-		const unsigned long int input = props->input;
+		const unsigned long input = props->input;
 
 		/* Pretty crummy approach, but similar to GPIO core */
 		for_each_clear_bit(offset, &input, 32) {
-- 
2.43.0


