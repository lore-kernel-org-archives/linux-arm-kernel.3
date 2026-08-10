Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6F6C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 05:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nbcA9WfihtzxcJZe+GIGSV+aV8ohwK7+rsbkazv3zo=; b=I/JhTuznQ2kp4xGAglhMnQy14w
	zplKvOW4sVtTSCVoXM3lBY5kznwBOySqyOkWLaOwluqmzAWMejRrO+ESN8Pw1ok1FecdK5aQ1tsl6
	OYDokOMP7zjnID9Vp/UvPMyqtd17XOS5AXQULFzof7BD3lQbsz5Od9UkMXj/dlSDS2mNthI38gOka
	q93R1QaR0EOQB2phMyQEoTylUDqEXnMjiVqMGzbvBOnOx3oJC2uPBKgsipc0r8Xn754yHXKrNx75y
	ozDqcArZh+OfLQ+yYmrnM6Mqj0tIv12lWtk0QbTO/NzPUjxZoHUhW79dwZQKs1ElPwBDsfESafOaJ
	ePdvYSIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtIcU-0000000B388-3ODo;
	Mon, 10 Aug 2026 05:32:18 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtIcT-0000000B37B-0YZ3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 05:32:18 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso1303572b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 22:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786339936; x=1786944736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nbcA9WfihtzxcJZe+GIGSV+aV8ohwK7+rsbkazv3zo=;
        b=kmOKm59lEWHl9dPURYFoVyvbq/uFwxtGMeF29kMhYr62dYn1TVITNWCbe9oZygJ7Do
         pebrosmGtuqjScALD+IeEOsrtXDZuQ0J676ccEEXmc86/aDIUnAkiJzxRqU1mhypKdCV
         c3nrZ5Hu+d42BbLDJ2UA464wv0Q+Wxz76xo+JPjWGXCmwiLNkzxgXXA1JJC+WJ2yfFxj
         RGrS7iKk9nbwYb6eD28Jx//Z+GGV57uFDU1U3BgvfZfnMGVi6kIseG0zgK7k9PoB/iBw
         WW/YAN7RJjHxurxePf7vxvKuy+IjAIzI9KJzc/kyY8FNmIoFzObzz9HKQpGA4TusndZR
         TCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786339936; x=1786944736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9nbcA9WfihtzxcJZe+GIGSV+aV8ohwK7+rsbkazv3zo=;
        b=Pc/dvvHoq1fbk/mFvQg213dMg7zDQm/0hCvoaac7GwoLeDMq1KVSuEKWyUfGGGtqLf
         m++YiJ/JXj/6OxiFEvgQlSHRxnQesafS30g35jiTnmcl3mT1f+4rMwP+aAyLosTT2PVT
         8Dtg75LlhD0Iizu7nFz5f725xnUXHPXtGCX7/wprRVCB99T+SCkfSz3Het1p+4imCZAL
         SBGqBNwqQNYv45HsN2KkqMQsr4GPVTITvmUFenvWsl7QeCMHI+ZqL0Fno7P6hZrFuuta
         1HNPeHbOV/xIsqBafjCHBaA2SYC9Czu2YfxkOjcURIvvDGqlyRwSAPIh/O/W2uazFVE4
         dozw==
X-Forwarded-Encrypted: i=1; AHgh+RpTJun9vSL5blgDVzsvAp4Pk14GqYxXpUxwabO+UoOKQSFJrHf/NADRN6kAW7v8tKuJDEDhHhXA4dqKC1MUpPBd@lists.infradead.org
X-Gm-Message-State: AOJu0YyRAcT/jzlvRCRWxrykvr0Qx5m0ch+7Yt0wQ5oHfYC++1pjk7Is
	pX+Dxt5JhuVFiDOMAGwbbyV51Y1SuRoM+r8c08R1WC6EH+2uwfUu6Ku8WhoT/g==
X-Gm-Gg: AR+sD13GnAGJnkqRzubhfKPsyB1R7sf7pwMTXTkRmNpntSxuHiY3RVm1Ja8rhMxDRR8
	/YteG07beXRnnm9Q756gcCKiUrqLNZpZEX/K4r4gBT6bNlqplecI/pey6YdEDwpgtN9WBnHwv4I
	zMVstYnxrrVvthepMA48sxoOOl8McYRdgBwXAOVwieY3gHerIJDPypYg/hdttwc7fb6mIh85+uq
	N9Flusxa2x+AhYY0WHHwwI/fdQSCTdBGB/vo5r7+KAnJHoivSetPjCSDlATFaIYv3zxFTqMLL/e
	11oqkMuvu3Mot41I9RUUZOvuDZ+oVdjHflpp5D8d01NsgmdSRmaASsPBY4EK1sCfXB2GCkQGytD
	SikJP5nggmkchkBKsMEIZ8H646ppCHh2ov4mj0r6aioEZwRL9OSH8Sxo+JofMqwjYkZZOkjrCMO
	/gPHyErb6whK4Zfxn2IDFFlE0zZBvwUgBrVIgVUUooTFbOSEZoDN8hbBfdgipqdmyuxDKIIrwgM
	EoQeUbIj8ouLwYtdCwqH12SxtHKNbfebPpD7vHNVeypctlBQbvQOPY4f/+cmWqFxnWJHR08vWul
	sgx+
X-Received: by 2002:a05:6a00:3d0a:b0:847:9d6c:a56d with SMTP id d2e1a72fcca58-84f6b78b1bamr13366983b3a.12.1786339936184;
        Sun, 09 Aug 2026 22:32:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3cadf2sm3243298b3a.22.2026.08.09.22.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 22:32:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Linus Walleij <linusw@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	robh@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/5] pinctrl: baytrail: Propagate errors from optional IRQ lookup
Date: Mon, 10 Aug 2026 12:31:41 +0700
Message-ID: <20260810053142.27938-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810053142.27938-1-phucduc.bui@gmail.com>
References: <20260810053142.27938-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_223217_177628_EE0D8F5B 
X-CRM114-Status: GOOD (  12.27  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no optional IRQ is available, while other errors should be propagated.

Propagate all error codes returned by platform_get_irq_optional() other
than -ENXIO.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index b733ec31ad9d..bcc77bf6e811 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1533,6 +1533,8 @@ static int byt_gpio_probe(struct intel_pinctrl *vg)
 
 	/* set up interrupts  */
 	irq = platform_get_irq_optional(pdev, 0);
+	if (irq < 0 && irq != -ENXIO)
+		return irq;
 	if (irq > 0) {
 		struct gpio_irq_chip *girq;
 
-- 
2.43.0


