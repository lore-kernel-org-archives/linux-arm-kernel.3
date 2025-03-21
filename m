Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F965C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 15:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUZ6WT9xaTB6U8uX2ZQ4bJClS2cOzeuW4hOfPq1GbHQ=; b=1bv7WQoKCnPuXxqwDu6vyE3cYa
	IiWmJhceoZEXkwVP1eoVuv4dHncJfdEGXzbjxh3hk2/nDavU7SagdwcuZCBgxwP6Yo3yBlcCn7lWF
	79T9dlvqib65aic17sSlJZefZ1C07qeMEAZ1bwj3GFp/iDyLWDnADFa4cHgbvRqNG8KDxvF2rSXc9
	+5U0lDzDmlmiup6JHrsZmGAniW47V2bu29pkegeWJ/FgwUWoTogxVmW+Aj+q0wz59gLr7r5W/lBTY
	0kOf/C/JC0uMRGe5o+tZQo1OfdZ+To6TJySt1c8/ueJeNM6osBoXM3+4RhwZGsIeuA+9jWCElTgvV
	m5AclPMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvduy-0000000FEyB-3SEa;
	Fri, 21 Mar 2025 15:04:16 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdn7-0000000FDXT-32vp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 14:56:10 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so14277715e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 07:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742568968; x=1743173768; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUZ6WT9xaTB6U8uX2ZQ4bJClS2cOzeuW4hOfPq1GbHQ=;
        b=AgJyRSzv70q73JfY/nRFca1fckFAOAeDTy2/mrgVJz8d9N1BIIYPjX1rNCVnZwx8PI
         nGwqqTDada8kSmz//+pvLyxWucslIhszPyhECoGEJHcDsolYltE4VAMtUAfL/fX/QA8u
         m543MYAeOeBJE5YXwhY+lzhci0m2BO6jGr5jbNL02ckmJf2vOnCPK5PIUitdHpEzNiIp
         MeG3Aq6+Doke9Je6yV5yecbDYeK16gImg5b1xlUkzEDwLptBk1Lo2r0uL41hX+XHkdvn
         Dxz2zdviruLgn8hMVVUAoTDwUgpPJChqCuiHC/u/+UPKeUdb2kS0gycVmMrbytzKRr89
         z5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742568968; x=1743173768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUZ6WT9xaTB6U8uX2ZQ4bJClS2cOzeuW4hOfPq1GbHQ=;
        b=AJ7proTdRbDOVVDVpAzaq3yF/8hZSCD10w1XLQvLPWRuwVyDDBYCDBwQb+Sfz8VRyZ
         RizqzhsXb/Ik1H1UG9KQxnppBEYQULIJOw/8uzZf/snHaNEdVDQylVdwG+YVW0J/k/xu
         5J8gQdeydZGcvNjN1TxMlp9VyUZP5dVZAJcuFEeMqTcuyLLOWo/QwzoyNJ1By+G+TC2I
         59BDItq8ldgI2rLTmM/k0orNQTQMQw8mVK9UL1A62q/ugq6ar1dnMjnVsVsaS/GAeSsV
         l4U7ja4AIAiEGW883UL+gg8OlnRwCIoodCuk0we7Rhk6hsFTOJnG3COG4/3BqLhAIIc6
         uBjg==
X-Forwarded-Encrypted: i=1; AJvYcCWj15aTtOEBHzRxwsyyk6BgMQnpvOGK7dsV1yDQJp7kADhkPgelEgsu/5uYUyFwKIKEZVWFGwaKTJtg2VEve6h9@lists.infradead.org
X-Gm-Message-State: AOJu0YzNwywMLoGmJtc0CjlBgzetrPCKI77mSyhWsU6/Tj2GBZipI/+T
	etNRIOLZ98nne5SB3kNURie15ge97YXCNT6/Ms5GszQH2gRisq60
X-Gm-Gg: ASbGncv3QX0V4lWWQKBQRDaLucpezHmA4bC4VqfYXAd8BPiNajH0yM+W+Y/f/oxTsmS
	y3bLRHR8ZNBTt59vxg/bx0WHL6OVdsl1zDGhcTTLTKxzHs0oL5qQ/A3ZTfKWVlFAYqF49woJzAQ
	pBVFI7ZZKgi735y9vI0GCkE7Kl7sAYVDZWDlvnkPdLQXJuJJN5T1p8OUAGz2GLBLBTxmpWrBnen
	MHIy95qzLs0XLYst9Qheubzke6oYk4wxfVbPLscE3AQdjsMNGVPjGKqEhptgTaJWmfsr/8kDbup
	/KvOs9hBiyu+9L/zIGWkfGxIHcuyXsuVmwGqVgkJnrSrgm9FnAX05Nq+NXXkZkiYN0PiZJBi237
	eQAxdjW/GMw+EJBhrbyMU
X-Google-Smtp-Source: AGHT+IE3QMyFT0D9MvVR4njoTTNE4SagQmeQKwO7Dkym3v+KnikA8kDn6rCGTzWMbtXD4HGpHjc9pQ==
X-Received: by 2002:a05:600c:3b9f:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-43d509ea8e7mr33219225e9.10.1742568967875;
        Fri, 21 Mar 2025 07:56:07 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd28a46sm29217095e9.24.2025.03.21.07.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:56:07 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] MAINTAINERS: add entry for Samsung Exynos2200 SoC
Date: Fri, 21 Mar 2025 16:55:56 +0200
Message-ID: <20250321145556.1436201-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321145556.1436201-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321145556.1436201-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_075609_760563_D59F7C40 
X-CRM114-Status: GOOD (  10.21  )
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

Add maintainers entry for the Samsung Exynos2200 SoC based platforms.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e4f5d8f68..f3ef6f862 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20937,6 +20937,16 @@ B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/sound/samsung*
 F:	sound/soc/samsung/
 
+SAMSUNG EXYNOS2200 SoC SUPPORT
+M:	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/samsung,exynos2200-cmu.yaml
+F:	arch/arm64/boot/dts/exynos/exynos2200*
+F:	drivers/clk/samsung/clk-exynos2200.c
+F:	include/dt-bindings/clock/samsung,exynos2200-cmu.h
+
 SAMSUNG EXYNOS850 SoC SUPPORT
 M:	Sam Protsenko <semen.protsenko@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.43.0


