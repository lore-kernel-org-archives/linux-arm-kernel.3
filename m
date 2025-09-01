Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A931CCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcCpW8RgqaPE7Th410oya6PZEKiFlg46eszgxKJNhtM=; b=BfRRRQE5Ma2DYQRrBv5glWBrGg
	a1cGJ9n7/m7M2Pw3JCOgAEoyk0+T6PyEyUmpFR6HjeZoeX/aD0cz29xY5aUkiMI9Do25InDFEFqLc
	DnG+4PBbe7plLTL7OBcwEuikZCLA6d8NFFw3CBd7itNHG1XoREh28SlQusR6tXNzruNqjBG2OsPd4
	5k5GBcp+LNxMj3yGBCeSSnXZB3mc96Q30D9lAn+6an41zrkMqKCUEkPdtHtwf7tmGIzV86z/sZlDm
	YRxK8LYXU7CN6BlwtFbwoAKNL3Y1QjMttZ6w6MBTFMYntZNf06U+6iJllLFGJ5AELNjuVoiFFYUUd
	QgO9xX9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7Vh-0000000DHPm-1S4q;
	Mon, 01 Sep 2025 16:36:01 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3zV-0000000Cak0-0H1c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:50:34 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-55f7039aa1eso1810739e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 05:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756731031; x=1757335831; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tcCpW8RgqaPE7Th410oya6PZEKiFlg46eszgxKJNhtM=;
        b=zysqU2kwksYYJ3BHva8yH8vy19oyp5ZW2QjvB2CUVBRZN0bxsFyjNhEhQuwz5Duq4/
         pO8t+ApR/yquz2VhoEe647+GbIn71mrBvD5iWzXYd+bcEMGTJPH9q4lVm1uPrwAbp/Db
         VvTEkH0/GufD50gwhS6/VFJD31SP1ccZPYTqIikry921zGC6MmJagwlrddtxBcb85URB
         /7HEnRF++/7EFzwxfj0OXr87lEVypFv8mDdtbtrk//Lps8kdXbHsjuJ9mH7vXdb3cFSd
         jzKCcfqWAL/K45YsRdks85YSe+F+JH+8mzYd8aE9t5JIgy8YAbJenlUECo+lyzzffKT8
         NtDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756731031; x=1757335831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcCpW8RgqaPE7Th410oya6PZEKiFlg46eszgxKJNhtM=;
        b=DzsN8d2+jZpW4VU3Xn8lbbX5xLXUP+HywvX77wsW9NWZE8lE5I9PV23BMnAqXE3nK8
         mRZExqDXebkKolh+5db7Mn2ApOkMzzah6gtGnysqfcIq3xOMlqP9P+Jz45vdt1YlegrG
         ITm1COk0wfwSS5GFZVyZf/H/HPvBWzWZl+sJbnoWEdEnBORMHMcx4EXVQLoSAl4me3l+
         XIPZ6ijhzoxLtN0Gj8wo8xIEsSetgpTH2VaOWsfv2DApyDRoFPaliAAt+DjcrQy+q6sN
         k71X9JqKUFfUqPrLFRZnTsJ2Dn4rM76fO/Ygg01GvEUDVNLE/BBlfamfxQmJ41+/4/GJ
         zQdA==
X-Gm-Message-State: AOJu0Yw59UFrw03vqciCv6eKxXesbNrmvejmQH0WHs4aauuWKFJq/Pt0
	nL1dw1sLbF80F66d0ZVF+RTHD2F9JvrmEYNDRqYiDn1tVC1WhYupkmU76pklC6qLGnk=
X-Gm-Gg: ASbGnctoGoAyVxhCnRlZqsERS9m0w3YvuACvBbO9Wknbd8uXoqtLJW2xnr5QPGZfCkz
	LWWhju0zieGrhxkasYkVFgfw1BF+gZWdBMhYNCJq/AaQprFhAutulj7dBnTST8T+071roB2LB0s
	d6dciyxHVGHqmRicMQ8vzKJ95LDS/CpvIEc1ASPbRF+VRsjMRGqLxBhkKjSEfJlFwQ/stF4AnBu
	KkN0DflfYUUSx/wA2UYX6I1Qk8Io0XXfRZlCWGjv4L74Ov16QLYovSywRIsObLd4bBmppA765bs
	6Hg75EuZR6XTsR1I3bnHwRNvYfCPnkyzAxtKYa2NCG9djRse06ND9atU5oLPTCdj0jmI6Oq2O+Z
	o/jms44GPhIut7CSSNJUxNefqWQGTpcrI
X-Google-Smtp-Source: AGHT+IHpdaZ+LQxgwH5KSQnYNQoYnWPU0rhLvJDjqQ1Sfl129thVLPtWXTlfYU+y2AKyPHtfCUDZhg==
X-Received: by 2002:a05:6512:2c09:b0:55f:4839:d045 with SMTP id 2adb3069b0e04-55f7093eabcmr2352495e87.32.1756731031223;
        Mon, 01 Sep 2025 05:50:31 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f6774bc3fsm2926155e87.59.2025.09.01.05.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:50:30 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 01 Sep 2025 14:50:28 +0200
Subject: [PATCH 3/8] ARM: dts: bcm63148: Fix RNG IRQ
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-bcmbca-i2c-dts-v1-3-ad81f60d4276@linaro.org>
References: <20250901-bcmbca-i2c-dts-v1-0-ad81f60d4276@linaro.org>
In-Reply-To: <20250901-bcmbca-i2c-dts-v1-0-ad81f60d4276@linaro.org>
To: William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_055033_108393_738CD45F 
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

The BCM63148 RNG is at IRS_TABLE3_OFFSET at 94 so
the IRQ is at 94+21 = 115.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm63148.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm63148.dtsi b/arch/arm/boot/dts/broadcom/bcm63148.dtsi
index e071cddb28fc2888b8f408b4bc275290dd135642..d94da16ab799c0ab25946e9cf24ae25812e85817 100644
--- a/arch/arm/boot/dts/broadcom/bcm63148.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm63148.dtsi
@@ -152,7 +152,7 @@ gpio4: gpio@110 {
 		rng@300 {
 			compatible = "brcm,iproc-rng200";
 			reg = <0x300 0x28>;
-			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		uart0: serial@600 {

-- 
2.50.1


