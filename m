Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4A2C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 18:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejWrq6TGbjAd26qleaa7jEfcM/wgJg4o/vWWPpGilgU=; b=w+9jYr8xYqYpYARA1JgCeZOjCn
	VH8WySq5HwYP7lQ6rw8mLp4PZoX4AjKeLL04ZWm+bCaNuUBfC1uW5tWKGcHYm/OlDblNZu9eAuqqL
	BFAqXTZkgezvacS32d2Ry1aPLiIiJmKd96Sp/X/GqCp5wJt0foIUaUzv6x0Nz0dm25JCv8GtVEbpQ
	oi5XHrttz2GNKrZWuZBSKoL+pdmuBuzJRCWmoiJ8aJNNQrP+gRzGNRugxQlyDBJ6Ahe2dMO2KsMtJ
	a0NkgvA9jgz5QbL/XlRx8SmyyPGQEHjqgOFWUAt0U0L/X9/6INghtWGCmhyBmECblgpwqXnZs4X6X
	+8rAGP0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjjc-00000004Bht-0RjG;
	Wed, 05 Feb 2025 18:02:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjba-00000004Auo-3uG1
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Feb 2025 17:54:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ejWrq6TGbjAd26qleaa7jEfcM/wgJg4o/vWWPpGilgU=; b=GGHAKULb9oNjRoLn5eZabLoxSW
	kMKIm0NxFkhoLfPn4PS0fGzuObE1H72T9zvZ4vglWr9VE9SLkQVIxocDwhzrdJ+iOYf2Y6XFzEBuK
	55JU/eihk4yuQ3tmNgTZUbAHjt6GS37Rr72ad3Ni32di8H0C/RrjOpELWsLlfPMVlwReGLgkhDs6k
	FnFxAo4UNd2TB4x6sB0SXW8E+HJswf/uafKg2StcwsycuNIypqxmO+NERyYtdo6O+grj3seMlNc1V
	0Ub+T7wWhYkqAyAJO8CA1MNwbZnnN6v4OTG8otJfaTW1oQJocFWlZtaqMd0+ciHTRwpaMohIpuGj4
	L2E62SGA==;
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjbW-0000000Gk3N-2es2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 17:54:29 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ab7483b9bf7so10271966b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 09:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738778064; x=1739382864; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejWrq6TGbjAd26qleaa7jEfcM/wgJg4o/vWWPpGilgU=;
        b=xh9TXjgZfXhPiSjfdpxsahW1nDMu7vebEK7J2fB+QaRSZkbza5Ovubaemf5WOHY/RK
         e1gy5tsCx4RrMfC6f4QfVXL0wr9trKSQCH84Dxg4UCcIKb6wgXMZrOPLbdNKGjsI10Vo
         qOKgSpgw3f43KLo8xtnad/9i1tNUNUrCAq32zEZgO6qOO1F+3BswqE1BXvz9yeaYjcHq
         H9rrurJsNKQGKNdAtlLo95HvdMjy6+mQWtSiHmyCEDuEUO6xORbNAEcOLgtjQ3PKuwaP
         hIIO3NLu+rRhWayn/1xqWx6NYYnbhwhsKM5SrX6SBMdH/VfIRNxURDN1ljpSewxvZgmr
         f78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738778064; x=1739382864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejWrq6TGbjAd26qleaa7jEfcM/wgJg4o/vWWPpGilgU=;
        b=KofstXcjxGLfXmGYEa+umTm6yeKXXW++8Lq+CS0N2j7Kw1moTx5/3KokUKN+NjUWCP
         BGK3HkZ/y6fA2KONXYsNfBS7S2/bxAla1RGSRnedvDlVgsGmc2vovZzW0JcBJwrWoD37
         fsTcGM2i6oownWnXvQwVJA7MxPbHg3fPIDwQ01PAIA7rXBiUS4Plk0zCAyHYm3zTe0uL
         kPFEO1xfy9697rruo2SFMhQmJW9iphM5yDpCyzrdIj+SsuyUgMBuYtML3srMZAjLyRdb
         JIYBObi+VeFgzermzuWaGLs6nbF5X3CDJE65YtnRw7oIRvHl/9LNU8vMJ6taQ9pg2miN
         Q8NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkCUqjj/mSfadQUB+HVSwLr1S6EtwdCbLSLxtOlZa+2F/i9n+xKvLklBRbaSY53olzkU/dQ1o3s71e/q8OaOZY@lists.infradead.org
X-Gm-Message-State: AOJu0YwXXk8ET/JQESGTLKt/E+gAyRncZvGzGD9392m6rtD/lnwHpszc
	RbYVQW/n85NB5ipud22XLAarm2uh0nWHix7EPaB9WUIOAHRpa63kc4hIkteepOc=
X-Gm-Gg: ASbGnctDRDN0FKDfVEtgbOBzCqM8Y33HZislScwmW1FfU1eMapCNhleztYuy6pEagS4
	+eabL1qvbdiY8B01d96sIvAAx096+kMFnlljMnD2AD1GZgzaQ2Bxw97juFVh7fv4tlRl6EQBlpY
	ECEUZFCFMQGfgipEKkD0wJbl4Iz/zGCFAfgn2F5T3Juy+gM5gdiYLY76QGlLnBnR+weriERyUOK
	I9OwYhQM3clTPm11abBeHO8qE5ZR5prkZT2nljzDU83V6fZ8NndJdnVgCSVus/uYZdO3uyfGoVE
	WShbYfEGxhK9vtIY6nEdHZeqhGzGl0HDqGIeX1qDgBUJgXctB9FXM4Qzyg==
X-Google-Smtp-Source: AGHT+IFi+I2QYC8SCv1Thd4fTlvD9JpT7oehKfpn2hd6Q7dIRYgFRRv14859tXC16oyIXhFfgdVHFA==
X-Received: by 2002:a17:907:7da6:b0:ab7:5c95:3a82 with SMTP id a640c23a62f3a-ab75e216488mr361291566b.1.1738778063563;
        Wed, 05 Feb 2025 09:54:23 -0800 (PST)
Received: from localhost (p200300f65f018b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f01:8b04::1b9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a560afsm1116492366b.163.2025.02.05.09.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 09:54:23 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/3] pwm: Add upgrade path to #pwm-cells = <3> for users of of_pwm_single_xlate()
Date: Wed,  5 Feb 2025 18:54:00 +0100
Message-ID: <1829c1a040c707326d9c53aee3577763e2139d58.1738777221.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738777221.git.u.kleine-koenig@baylibre.com>
References: <cover.1738777221.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2059; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=y7Oa0HXBmU0/PvBO5RRFWrwovXtwoap5Pkcr2yApIVs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBno6W63WuM92iNknmqYpooawZh3QTBAcb8wp4Xc xEhAhPpMxOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ6OlugAKCRCPgPtYfRL+ TpnDB/9o3E5Rkl1Ie3Dz1olMCefNaINVPnui+wUhfYEqUbZraMf8EyoN2Is75BF97QrKk9EVG/O HypieBoLrrq8NTPejeFFWGOWqMdRvydtz/dm1RrryJBV4w1fEO8/egw0MNdwD4CtUkoL69q7N0s GfMipxg5eX5o4eEyibOheuTG6DgGnHHKVl4xkOftWNaaCKmvl2FBQmzlhZQahhnEzJTGZLQIAzF LIJ1vpsJxkN9EWvNp38NXdvcR9VCaGwdddPR+ko+Kw+vul3HuiCTrDls2fcXgFCctX10IbJHoj/ GbS2ikJyLim/5wOOqAcVWPfi/MCu+yjoKCupZ7Wi2c8tyJMW
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_175426_953804_2F975CB3 
X-CRM114-Status: GOOD (  19.99  )
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

The PWM chip on PXA only has a single output. Back when the device tree
binding was defined it was considered a good idea to not pass the PWM
line index as is done for all other PWM types as it would be always zero
anyhow and so doesn't add any value.

However for consistency reasons it is nice when all PWMs use the same
binding. For that reason let of_pwm_single_xlate() (i.e. the function
that implements the PXA behaviour) behave in the same way as
of_pwm_xlate_with_flags() for 3 (or more) parameters. With that in
place, the pxa-pwm binding can be updated to #pwm-cells = <3> without
breaking old device trees that stick to #pwm-cells = <1>.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/core.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index ccd54c089bab..bc05818fa370 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -1000,11 +1000,27 @@ of_pwm_xlate_with_flags(struct pwm_chip *chip, const struct of_phandle_args *arg
 }
 EXPORT_SYMBOL_GPL(of_pwm_xlate_with_flags);
 
+/*
+ * This callback is used for PXA PWM chips that only have a single PWM line.
+ * For such chips you could argue that passing the line number (i.e. the first
+ * parameter in the common case) is useless as it's always zero. So compared to
+ * the default xlate function of_pwm_xlate_with_flags() the first parameter is
+ * the default period and the second are flags.
+ *
+ * Note that if #pwm-cells = <3>, the semantic is the same as for
+ * of_pwm_xlate_with_flags() to allow converting the affected driver to
+ * #pwm-cells = <3> without breaking the legacy binding.
+ *
+ * Don't use for new drivers.
+ */
 struct pwm_device *
 of_pwm_single_xlate(struct pwm_chip *chip, const struct of_phandle_args *args)
 {
 	struct pwm_device *pwm;
 
+	if (args->args_count >= 3)
+		return of_pwm_xlate_with_flags(chip, args);
+
 	pwm = pwm_request_from_chip(chip, 0, NULL);
 	if (IS_ERR(pwm))
 		return pwm;
-- 
2.47.1


