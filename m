Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1735FD5C0DD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1w6RpVPZFLgX8W7zDDIW9Bt9wUWPJmCNFHj/06iwgR0=; b=o/kQBfbktvbl2wvrvHldCHQ1Lr
	tHGbnKA+bPnSY2hqeRrtHbynnAbYjcHT+ElW8zERLPE9SpSZKLSG31MKmbxCpH85jZtVga0ZF6tUs
	3ob4cWMVWxeBpbzTSzRkGNixXy4CRGY+J9duHb6Kos7Lt5YKu44T7ESRfp13RseTaTOtN/zIlbnbG
	JRjpLxn4Szx7iORrzRHJ1W23Gtso2bEuaokNyHUr607l8LGauZ5cMHCkGiZhS7mtdUsheWrKhBT/4
	HGWvwilwXwhMAYzFDETVjQn/5uOQphKnq+26/MHFRvD3bZTP9GbDGrYWAEdFgf2iacaeeN419eD4i
	YfkNF7Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QOD-0000000AvLC-0tO7;
	Fri, 08 Nov 2024 14:55:09 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PVt-0000000AmLS-1lNr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:59:03 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-37d51055097so1405299f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 05:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1731074340; x=1731679140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1w6RpVPZFLgX8W7zDDIW9Bt9wUWPJmCNFHj/06iwgR0=;
        b=LzpsBHPK2j1ZEloRPvC9cM036ntlIDdQ4lP1rg2clwfxJUu34IXjZrjEWh4HYibBTO
         vz3qoZSquqSfyW40AxdH5axOuOJ95HLwpyK04va3VGGgsyt0wRUGKYy3g22bZW/FyJgB
         tXR7ZEJUwwvfAu8PpbCdAxxKRwKJ+KZWeLKBkVqZ2PIfREZV1xuXWkHoNztExUMRkBxv
         M0UGfsuwCfOByaNX7wSk16EKyEgwQx1CEdg3b3cb8agSPyDcChTRk2yLWIhFQrhxkr7u
         Cr5Eju2+e4L0gh/d5LGCOHQSUqEsSE6yxdlZJWw32FQNfgK6bluspxpljQNtYqMyrPBV
         wtog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731074340; x=1731679140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1w6RpVPZFLgX8W7zDDIW9Bt9wUWPJmCNFHj/06iwgR0=;
        b=KXa2I+uf4qKvbR1SHdHFs7USCMd9AhcSoyUxJjjdez66vaHKOvjUc98chQYABaPriu
         j4D4DdaYPHXAzZHg9VKhzCexeFGfAwV6YbTWDLWFHmGJ3GWcwlp+I06PCtnYuSgzYuF3
         eUehRCYilIU1ALHQ54gEgasI/9oP0ro4LZbl8u749gHaqjH1UTgvur46SNkEU+RTgGXy
         cszkr+X9yecr235WWdLx5RHKGG/7+1USi4MlOo9tBBq3H1TgYQ423GyTu7PKyvhWH42L
         5OIQ4rhYFFKeG+2rTiyvEfJqNbK55SFK1jWnzb77WnnDub5IZNgXi60KnEfh/EVbeulK
         J+Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWd+GcTgSoHQ2mG/cxWFECoH2RSVb+Now4oTP9CwqZ+6whWBKdtQVMX0/hOKwmvPJ+a1QAYPWBKOyqfId1vPalO@lists.infradead.org
X-Gm-Message-State: AOJu0YyoGVlTT00LylfW9/vUtsy+Sl5/KpRQRD5LDfuWcrpYrguVCwpW
	kWCY2Lj+vN6JD8z9+mHhqkmHPAishNUP51zH8/HhlfmCLYQTOxyDfQg6Mk9BkeFR9YHvaV+eWzI
	H
X-Google-Smtp-Source: AGHT+IE+nAqhwysBWUwaiDHL8021dYLt45cexYtLiP8CXTNVID4kP6yjzuHQfUBix0HKH4CQF1DrWg==
X-Received: by 2002:a5d:6d06:0:b0:37d:45ad:8394 with SMTP id ffacd0b85a97d-381f1866bb5mr2611022f8f.15.1731074339782;
        Fri, 08 Nov 2024 05:58:59 -0800 (PST)
Received: from fedora.. (cpe-188-129-46-99.dynamic.amis.hr. [188.129.46.99])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-381ed97cd97sm4924431f8f.27.2024.11.08.05.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 05:58:59 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lee@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 2/4] clk: lan966x: make it selectable for ARCH_LAN969X
Date: Fri,  8 Nov 2024 14:57:32 +0100
Message-ID: <20241108135855.129116-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108135855.129116-1-robert.marko@sartura.hr>
References: <20241108135855.129116-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_055901_521745_C40D21A4 
X-CRM114-Status: GOOD (  12.89  )
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

LAN969x uses the same LAN966x clock driver so make it selectable for
ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/clk/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index ef709327cba1..713573b6c86c 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -270,7 +270,7 @@ config COMMON_CLK_LAN966X
 	tristate "Generic Clock Controller driver for LAN966X SoC"
 	depends on HAS_IOMEM
 	depends on OF
-	depends on SOC_LAN966 || COMPILE_TEST
+	depends on SOC_LAN966 || ARCH_LAN969X || COMPILE_TEST
 	help
 	  This driver provides support for Generic Clock Controller(GCK) on
 	  LAN966X SoC. GCK generates and supplies clock to various peripherals
-- 
2.47.0


