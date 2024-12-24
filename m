Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC168E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 07:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KMHf22f47mnupZ5Z5sbHHAzvVBhWDSW7Bp1Wxhnt058=; b=uhq4ZLXkjHopRwM7IZQ3SbPDtK
	Gw6DVsggW4Z4EzCRseHwl49ku18U8Axdqkq9lW0/U9d+OgQzcp03X5nY0dnh+6B6c3kdqU6nlJs6c
	nAOOAlBYN8U/W4OGpIq0xXtrRYhM9TWzOv7hOL7PRuF4Aic9qg3o5hpO6HX4Ipzadx9CHUt7QmD41
	0WEDNXV8Zj8yX17gHVZGK+iirV9uUyc2qEJ24J5bJifZL2d9hGwWAyUTxg9FBYp+7prW7GW1mqXqE
	9boELE3mnMIQaAT+78TyJvAQO+3P1LOUWxSlEazdW+2CAXE+nH0BpOtdB1+qDw/WBrFmIF/G/VA3e
	zAbl11/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPzoI-0000000BSj2-37J9;
	Tue, 24 Dec 2024 07:58:34 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPzmx-0000000BSa0-08sV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 07:57:12 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5d3e9a88793so8467372a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 23:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735027029; x=1735631829; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KMHf22f47mnupZ5Z5sbHHAzvVBhWDSW7Bp1Wxhnt058=;
        b=iCdeC34cT+4oChxfvmWrZMsQ6wudrwANwq/luhNcwVD5wy9zOqa2r8yHWDlnGbAbpL
         eJMS/XXINSlIOai8Rs/lsQSQaAzGBbHyp/HtZtVNeWO2Atq9PhyZvfu6LlamXZIzpe2j
         r254gd/KvWWEO09grxVXlht/lzb3MrTBPFAUoHbQFtI3QIwGmZgLikYt6tIc4QDRuouD
         UeIp9ZKADRc22Sx8FWJm3+vErmanwlMf/22VcfJyAo9HjEUCoyG/aShrvWJvQRQNo1x3
         EC3nGywwCepyL3BdApiiLMBBIKMYadcfY5mxMuHvgspXzXrKL7acwYEKtlA5ttFwPE2b
         Xtkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735027029; x=1735631829;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KMHf22f47mnupZ5Z5sbHHAzvVBhWDSW7Bp1Wxhnt058=;
        b=vNRUiZh2ZBcGQhyHXisUFneLfQMNZSzw2d/pESUqr1ggd1BA7EtKu6vGrmGx2D1LB1
         m/8UsmLKoo+OexLJAyMYYCUv8EbhJZ/8rRF5v8jXBx7zEyAAc2lkW8MFRVFt1qVJj/Jw
         lHRlmOZmNiizA7k20jfhOsZWNKIkEfJUtlgHAvLSHIeERZ2bHxUchkozD0134GZviEAQ
         7RJqFOpSbicm92akCrW4vqMD6N7QvP8l5DdXMAgXctmRpyGGC0vSMulbZVWAlakz3y/J
         /giiJgv0iaPynN0oEVG+2IaC57HOrahL1LxZ5RXUMkbFGI9koNyYSH0v2vtPOEcNdXo5
         KMlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIOyu9QZgzz26SlNbzI5hdJjhrhFkZ37ysLw+2VkmNAweYiByCSoAYxvNkEXWqeWzej1dCaQzDaoQ0XpEswgC5@lists.infradead.org
X-Gm-Message-State: AOJu0YzH4Q5/MtGrcA6cAtFKsyK+Wp8TFA8yCFiSnb/L1oDCMd0x2ygV
	qHPkb0WnjycY4dyWTetMa3i4gF+hx8KKkZdoBHfgy+e2JDhG++u1
X-Gm-Gg: ASbGncsauHBo7L9rDJUQReMJtZ8VX09OLnxuXjxvoIi0kBv53znzJFNreoBZNsaNvmH
	l7E+wIzf6iFKBdcc0W1C9SOJmyJOfq0f1pjZQSNDFP0B9/sJQ8PMk6/pMh/iNkkVWX1iCxvqB8/
	YHcAQSIuJf0uSNEAyQBWa02zkD9C5enh0j98W9KLhkGw4vVI/EK6Z4NMJEuuCOpBKy+eWjrq3hM
	ITUreuEu9Aw3XrxhwIdlmmQJKYCrFF43HA3Vt7l8nsNtWBnuunFmvIwLEXyIpzZxYtZVGF+OAvY
	5Y/IWw==
X-Google-Smtp-Source: AGHT+IF0IsFB1olkgqlPZT89YXr7zJlXoISs3puCJLGzwYjyZTiwq5K2mzmoRf4eNKq8Wooc/NavtA==
X-Received: by 2002:a05:6402:26c5:b0:5d1:f009:925e with SMTP id 4fb4d7f45d1cf-5d81ddad8edmr14607338a12.16.1735027028563;
        Mon, 23 Dec 2024 23:57:08 -0800 (PST)
Received: from MBC02GN1V4Q05P ([151.189.136.18])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fed752sm6099054a12.54.2024.12.23.23.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 23:57:08 -0800 (PST)
Date: Tue, 24 Dec 2024 15:57:03 +0800
From: Richard Clark <richard.xnu.clark@gmail.com>
To: tglx@linutronix.de
Cc: anna-maria@linutronix.de, frederic@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] hrtimers: Update the return type of enqueue_hrtimer()
Message-ID: <Z2ppT7me13dtxm1a@MBC02GN1V4Q05P>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_235711_076050_0D8BE5D9 
X-CRM114-Status: GOOD (  12.00  )
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

The return type should be 'bool' instead of 'int' according to the calling context
in the kernel, and its internal implementaion - return timerqueue_add() which
is a bool-return function.

Signed-off-by: Richard Clark <richard.xnu.clark@gmail.com>
---
 kernel/time/hrtimer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 80fe3749d2db..bda3ffbd444e 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -1067,9 +1067,9 @@ EXPORT_SYMBOL_GPL(hrtimer_forward);
  * The timer is inserted in expiry order. Insertion into the
  * red black tree is O(log(n)). Must hold the base lock.
  *
- * Returns 1 when the new timer is the leftmost timer in the tree.
+ * Returns true when the new timer is the leftmost timer in the tree.
  */
-static int enqueue_hrtimer(struct hrtimer *timer,
+static bool enqueue_hrtimer(struct hrtimer *timer,
 			   struct hrtimer_clock_base *base,
 			   enum hrtimer_mode mode)
 {
-- 
2.34.1


