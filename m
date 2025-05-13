Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7CBC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 10:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8dBK6vbp1JpEHHLt8/xtt79SEaE3cK2HcOeapRU9QY=; b=ITZDy44KEXp9Qfp1KlCM4nx6/7
	7E7qgLl+bIVBu16xwF7x+r0y1zd9I4EKpSbdHWx3ioP3JCwlyYzlLkFtGnq5oGWxAV8nDgXGNm6Fw
	wWCfeRBthq8ogHpCPjpCcIMsNnbuZewD3nRc0pjH/uROKFVGVQSx8esOzgDCmI1G90jWYHBQgVH7c
	3ekdCXIwdfWMQ4HGI+mJDLAo83PFuwkUsRBlekOugoMKGryx9NmfeDuuMx19qIpNED0sZMpSfSr59
	NqzQfG7d8ys1M6bRGM1pDHDZJWQwCK3c5BOARTLafe1f4w6syqzNf+8peXjZn6sNQssKgyl8+y2r9
	cFTJmRoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmjH-0000000C4XX-21Fm;
	Tue, 13 May 2025 10:19:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmb0-0000000C2Yq-33wa
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 May 2025 10:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=b8dBK6vbp1JpEHHLt8/xtt79SEaE3cK2HcOeapRU9QY=; b=hHn08TDilECWTEyt7nmS8qHInw
	1TW+luEfJi6GNIeSEZg7INPg99AZVXL29Z9GRW61022qoGrQiyck/ph3irFlor/4i01yQuBN2f72H
	XN20zoa7pO6CLzl52dApJ9onprlkqVTiXWeG54D8UQ2Bjc3hEgk7QdhHqpvAx+/HcrVCKoqC3O5O7
	8WHIL1eeZEFQ/eZwaDfrArX1eyExBrE0MbczLTo8WWeE+CZsYeP9NGBANgrKtar3xjUfJsyBBCakz
	UYVnOIVDjh04NHx8A8EeyrnpIcGynQ6q12ZGCZoneVskHlLG3o6ExCC83Mkh6GzcNP6jw8mcQTQWk
	ivm35iDw==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uEmax-0000000GveN-1Wf5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 10:10:45 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf89f81c5so4652295e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 03:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131041; x=1747735841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8dBK6vbp1JpEHHLt8/xtt79SEaE3cK2HcOeapRU9QY=;
        b=tna2oMjsnxyJ2Ueg1BJk353CqP7syRqueviq/vSiABgqP1yr3G7SEU3ZC/QydIjpO4
         XxrUyGoZu8nJm/ISFqWSpf+RzEEE2mVNafwQ08H21hlos5veTwEvRExt/3sAq1y2jARh
         OFwdJ1YXgIeWk0s3UIg8RowlfNgJ9Xu44TSs5RzI1EUoEXWvvx9S0Iv0zTwLCMrhP3e6
         N9RINwJ9SGz/mvZY0fVuWnQcUZhhaUCbNHc/Hw2BQPHxgTOOt5SHYjf1NlqB7ct9dSs6
         05MzIAUXdsOF/Mk0o/iaE/Mks1k3/TluyKKxJk9IeZeqMfrx/92plxDkMsUGyFk5jRco
         SVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131041; x=1747735841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8dBK6vbp1JpEHHLt8/xtt79SEaE3cK2HcOeapRU9QY=;
        b=Gr33oCAz4NAiVtVD/z/NKkrftEypGBa36Ix2snvl0PuVK+zjDHIsPqUQVJeH0l6HEI
         6wevy4tFwKNjB99GOMtDle1mfJkE1yQh1mRjmVUTPNZym44GSDdHjaX6x6+6Xb4niG7J
         HXzIq8r21zHihE7zy8s+sddr+N9dvSjJnwbmWBo528j4ccXQvjwIu/6roTc1w1sp87Uy
         5arxqqv5TS5hvWXEvoOe79CG1B9Bhrrdt0qIm4FaJg+xoCwinFoOT76beeJ24HLUf11J
         wpQOGxLmo1wvfTli7vd4t7Yg7NH9heFrIXo/KUzYTjoRu6m4NuDYus67HEC5fbgjxhMI
         FnkA==
X-Forwarded-Encrypted: i=1; AJvYcCVcHSq+3pbcg4fHn68QSxmxGpV+juxk6ajCIvsM/w40bwQlVX4yTbVwBP4LrIPiv2jRKq/Gzc9ftYFJx1ahAHNz@lists.infradead.org
X-Gm-Message-State: AOJu0YxmjUffZuYPwH4r3nIguHRgiNN+rLnKaAjxV4zjSiNrfGEIEpHz
	rn9YclboaBqMoA+Chi4qCjboDVijckoFG0bsNySJo3yPTxVvKAWwBrnlk4yMdkA=
X-Gm-Gg: ASbGncsMV9DVUJ8/EmV6XpY+FYp9WJAbtDqP3piFQ6Y9SB3ga3zEcGkItPJDnCiPpQ0
	NZfdnPfJvRQn2IT/lgHZU9Z6Isd1su2jCix6hfstp0NN1VZrEFQf5W0U7wB2xgp9QzXtc6d1xjt
	dqAHDQXK1GYsRjwM4tl32zRPaj9hhp+ac/ugyXC4mLk/SP7Eg1YuV3C7iTicOax18myJU6t52iO
	Eugm+MwVD2PoYR5Oweqze9xPzGhfSbo7EgMBJkDfa6AiUbug0kbffkCDEtue0ouicpQyfC+bl8f
	V4JD2RAdwYVNhJLAuajjoPDJ4qHjl50HXIlYCc74AN4fl0Wl9z0AGGan0H1EOcAC/hvQGtOwG7T
	a+cfo2Dohiy8hQp8SWgsgjFsFCPHuIPF6DTdSL+g=
X-Google-Smtp-Source: AGHT+IGTa8DSyODAQzBZKZ5d4ecGtFrjDgOJkla3p4mKacsE9TPMC3VixJsrixwN7OQ/qL+vFjc8kQ==
X-Received: by 2002:a05:600c:4f43:b0:43e:94fa:4aef with SMTP id 5b1f17b1804b1-442d6de7911mr53186185e9.8.1747131041032;
        Tue, 13 May 2025 03:10:41 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df574sm159683635e9.11.2025.05.13.03.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:10:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH PULL 4/4] ARM: s3c: stop including gpio.h
Date: Tue, 13 May 2025 12:10:25 +0200
Message-ID: <20250513101023.21552-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
References: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=887; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=bTvi/Wlka4LN1Gko7gZZp6DhLneFC3PKb0/XbChbsbs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIxqSgi9HNbWtstkm3Z3A0GUl00WkCIY7pKtqv
 bOCMTw2E8GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMakgAKCRDBN2bmhouD
 13MxD/9Aw74xNyjJwRIgwVKUPalXjz/+g5Z7eOUhQTnCoclouaD8LEGtCRL7rDaSMf3Fj5HOrRF
 6lN6J281zgiiZHHer1bQCt0E/t0WFZ9DdXEPX5pKwWAE7A3jaeLJ4AVucC1qI1d0OOZdiol2Rqf
 1Ps/nAHELq/COxJZphBGSZbJMOBGNzCT2RqsaC1vRkmyvKMYk4Geew5gr8Ur/pQLlqJD60kiXFv
 W6vRDLbj7LaP/Z9dgQ2btHNyR40NUB6BfzlRCgjZCXhUK7C8sfPmP8yAXaq3TbE3USOpjGL6sgC
 T/E4Fy61CArIUzY5UIDC8xnwjBI115aKmPsMgepiTD85MULQEfXG4Npc/qkc1z7e9O04mL0Jmxc
 Mp43csEyv4c2AW4dBCXR6z8OtUfFDjwfaaRASPpVic2yC8ZVcgnKa5eiNI+TMtqinWVZ041HbfO
 HH2J0vWo23OP/Nxgb/2RXU7Hn6iMPt99J6A21D/hm7snJDKN0H6OLEQ03/h4nAZBIHSa4BAUlFD
 lWkh7n0jYysRA9MPDkft0Z1nr1A/F2yL8A2dElslb7W5+dI7oEOBWqpyLFYqGEkeTe3YCY2a1GU
 ZH4kn80kZQZ7Tb9nzielaVffA+2B6THw15avhLmVp3jFCMj1U6tzHXquaQifcJim8pbEv6FlLm/ bldpnWXxn1iVXDw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_111043_661724_CDC423CB 
X-CRM114-Status: GOOD (  12.26  )
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

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The driver does not use legacy GPIO API, stop including this header.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/r/20250331093650.4028999-1-andriy.shevchenko@linux.intel.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/mach-s3c/gpio-samsung.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c/gpio-samsung.c b/arch/arm/mach-s3c/gpio-samsung.c
index 87daaa09e2c3..79fdb52c4a6b 100644
--- a/arch/arm/mach-s3c/gpio-samsung.c
+++ b/arch/arm/mach-s3c/gpio-samsung.c
@@ -11,9 +11,9 @@
 // Samsung - GPIOlib support
 
 #include <linux/kernel.h>
+#include <linux/gpio/driver.h>
 #include <linux/irq.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
 #include <linux/init.h>
 #include <linux/spinlock.h>
 #include <linux/module.h>
-- 
2.45.2


