Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4ECC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 09:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6Fu6WaKV6UwFUaV1JRbU4BYRYqi9fvopRa8oATbj0Q=; b=pmGkKZIRoRaQ3iSVnlzLbs3vAq
	pFHk7GFOBse/M3hVhgKWLfRTb9nSK5E4UgRu/2mFpmKtSy6WuIW8gnqg47mgum3kDaNDB/kjoCRL2
	am+Al1WhU84BC+Xjc+bLdVuvg/v5qNAqMbX61jhV8nqBpy4BDCSh1kv0wbP1Nu/gCXILH3saxycH9
	LxwMrrK+V1kzaeTdcvSJPOpvx203BpWK030UFJ6Y0FLf9Xdc1Y8ql/UKmbs4at+tv/85MxlqTcPCm
	piDEz/efx8EtQ4vR48TVlMIESYtG6elkCvSidLSdJC6ded7PTGRXOd4ZTBhOSre7orkgYsfKgdr1E
	OgBUKBKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx0wS-00000005MNF-1ADD;
	Tue, 25 Mar 2025 09:51:28 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx0rM-00000005LcK-1e0e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 09:46:13 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ac3b12e8518so283047466b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 02:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742895971; x=1743500771; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6Fu6WaKV6UwFUaV1JRbU4BYRYqi9fvopRa8oATbj0Q=;
        b=EFxdlqBiKPZgCHjhxEKkJjEJq2qo3sK37b4Nzt2MzP6XYg0j9VBGuuKST+8RMwDW4t
         jQjsZQpQQ5KDdkIS5F+uBKOT6vaBh2iHXb57feugW/sSlZNXRIctpbWzD6M49Z75CIcI
         8tnGYE2YKEGtivImkhyt8NHzLp6Jr+7/NcIAIaa1L4e2U8HZ3Et0CTvbq0alrmFr5Cru
         FV0AO0FXSOaFMO6TvuAEp7RtdqHQwt8PZW9zSqgqCuV/4lQS95/wh/OW4/OdHK7IMAYd
         yPWmHsVw7jz3DxH2ZE4SRfKgyNWcKaYBRH2v/8vgeHVzuhnDhFdbZWvac+/0SIcltyzg
         XtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742895971; x=1743500771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6Fu6WaKV6UwFUaV1JRbU4BYRYqi9fvopRa8oATbj0Q=;
        b=w9o+CY/fN8tB4HEHGrLSSPKgtnXCSwmhOPUZJEZAUrF9xl2VOCmq0I96qecm5q0poE
         /ukRDBbBVub2j2mGZ+xRp7OOVZoaoS/2vVKsk+WiavkClyxTo/C/TwyhTCPaSwk/9aCY
         r+UYhNYPXdP5tcIWZs+ugudBdROO2xMmrgJqCKT9v2bCbdED9bhBsXJ+n5Gh96uud04+
         noYOrF+H1Fp0mH6Gjzjx3YlbWCv/Mu4yoeY1fBviAm+KfHCZsd1i1oGt5ZMmmnPRgJ+K
         /hVDeLt6efkrXOqJ1RwSSR0XHalmcSA1ynOyv/EyxD4SvvPhwPPa34LKXUv8LTzz/tlB
         4Wtg==
X-Forwarded-Encrypted: i=1; AJvYcCUKVuUyzM34ISNusVzqrQkr+R8nW7Ulgdh88cbEJxgj6F1tcOKi4Pn/UM4tgUxJtHnreXemKVj/HIoYTTNA56th@lists.infradead.org
X-Gm-Message-State: AOJu0YzmuKinJ8m3inrC+xFOlbI9PiCdjiHYGNoxPf8v9MgBbY6vVzr8
	nbu1y/SDIr3j+xzQuwErS5x29I77ziKA/4oejCSGr/iAcDlS/HkozMKmhCSlAwU=
X-Gm-Gg: ASbGncvcy3fqTQ6XVIjP9rFEuZ1M0DY3Ku8Se7lm3U//m+hKRIFdBdZNML25HE3ACqc
	uILtEaLnAl+Qfh9JM4W0g47V3GJZZPS0GW5au5htx6JO1+kEY7v+6D7UgI29JfVHJpO+kmihU3G
	bsU1MT0wmTmrepw4YlvK6kByrT/3tZV451ltWNuA0Ih/ZHH4xWy9Cm2oozxBLntfh8NYKxATwMt
	cgGuD0j75IHPwCfaWjeGkT85/PDv0+b6nxwEkTEXGQCz0VYuVddEeXH+KGiEipxjBCh66bSa1Lu
	nSLTJqcnKkdBCgVnQGB+uhQpPeUCG3i8bMexpg+ANBaFCVVV1gyFRMgKCx8VBIOCv8d8dNeKl6n
	wkMjPw/4nlzn+nmlzNFVKKWzDNtgK
X-Google-Smtp-Source: AGHT+IHJAkOOtBg6Ow48+caX8OWgjB0vQLeBKP45DnYtGc5Gk49AKHqQCTiXRKEbwQxhd5ygBBxnoQ==
X-Received: by 2002:a17:906:4795:b0:ac3:b372:6d10 with SMTP id a640c23a62f3a-ac3f2081eaamr1405346066b.4.1742895970561;
        Tue, 25 Mar 2025 02:46:10 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8e509dsm832834566b.68.2025.03.25.02.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 02:46:10 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 25 Mar 2025 09:46:08 +0000
Subject: [PATCH v3 2/2] firmware: exynos-acpm: allow use during system
 shutdown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250325-acpm-atomic-v3-2-c66aae7df925@linaro.org>
References: <20250325-acpm-atomic-v3-0-c66aae7df925@linaro.org>
In-Reply-To: <20250325-acpm-atomic-v3-0-c66aae7df925@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_024612_427659_B8FB94BE 
X-CRM114-Status: GOOD (  15.04  )
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

We need to access the PMIC during late system shutdown and at that time
we are not allowed to sleep anymore.

To make this case work, and since we can't detect this case in a
non-racy way, switch to using udelay() unconditionally, instead of
usleep_range().

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v3:
* use udelay() unconditionally (Krzysztof)
* drop previous Rb tag

udelay(20) causes a checkpatch --strict warning (it suggests to use
usleep_range() instead for usec >= 10), but that's exactly what we can
not do.
Reducing the udelay to be smaller than 10 will generally cause the loop
to be iterated more than once, which I wanted to avoid.
I could reflow the code to hide the actual value from checkpatch, e.g.
with the help of a local variable if that is preferred to ignoring the
checkpatch warning.
---
 drivers/firmware/samsung/exynos-acpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 542eaff03f9e39422a8c5345ca75e05c1710a9ee..379da420b9eb3fcbca5461bec7e2de6bf0774659 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -300,7 +300,7 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 			return 0;
 
 		/* Determined experimentally. */
-		usleep_range(20, 30);
+		udelay(20);
 	} while (ktime_before(ktime_get(), timeout));
 
 	dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx.\n",

-- 
2.49.0.395.g12beb8f557-goog


