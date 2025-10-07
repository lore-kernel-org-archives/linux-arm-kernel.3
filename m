Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE92CCA472
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 11:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yg5EzbqpAhrvR1YouHoLR93Qim7L8FFl5LtkM7LFT7g=; b=EHbAsVnHxiHUIj8bajWgK0WlQM
	WcpEok33dN2Jd/TyUH+F4m3Ft0bROwtxWyP1kEqjHUmoUtTFKSf8m2JG+1zofINVNVG3vhX/Ggczy
	gUOYE7Ig+Nv/wrKQct6n0lzMkqH1AhZ9EEMSXyIHaPv51DZqBLGQJcWZGV3f94hbcIvxwVVdvdgvU
	pr5+0IjkBgS5otiTYpryQ2BGZfA1FJ0FIVGtIxqfIK62gbQ4OpISffArQwcsOGrP9gv6Su6nS1+Dv
	cxW7yzpEznJJTU1qfPv2bPoNzgCo7UkG/W6d02zFXhCQGcJzJBKg1NVfjfzyrPwyMccsA6F0E4+y8
	ZI973pkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65hf-00000001rTe-3pxD;
	Tue, 07 Oct 2025 11:17:59 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v65hd-00000001rRL-2Gsl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 11:17:58 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-793021f348fso305408b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 04:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835877; x=1760440677; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yg5EzbqpAhrvR1YouHoLR93Qim7L8FFl5LtkM7LFT7g=;
        b=Rcf3JblXJy6r7gD8esNA31y3BmhkPQiH+WaA4hQMyDMDknjZ7PzS1hPuAnu03wlkK4
         NgPrsWHWM+BjQtU+CpiO7ZFXhh2yBPKxpi597uTwUWfoCIUpd1P73Yb+SblNvQnF5LP8
         wG3jm9SAptXqmPkDcK9QKhldfWPyKBHwvQQ5Va8gyrJq0cuQEvS0C4BRjvcn4hW8SC7L
         iGVKFtyT2UBzJXmLcTmzI4IwEgzU/s4ohS24Ahh2mmQYaE/1EfEX6TIIUfk7Gn32jQZF
         95stidJYdVSa2magk/2e9Yk/7HG4FSKw+JmCri1KYo7iScWXwAs0zNkM2YIjgsE3caTp
         vMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835877; x=1760440677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yg5EzbqpAhrvR1YouHoLR93Qim7L8FFl5LtkM7LFT7g=;
        b=Wu3nKff7bc6RdC4EAwyrAQpfjVKzHMtvHOeX8oNa/EiTSDzOdcIihc6IAWx/IuMxlj
         racVe8JMh4QLTgkIiNMSunaL1H1M6Z4d2h/ClL9hDQbOyLX5OmdZvIyNtB+tP6GpfdPm
         dQsEjTHY5yMWFSwlwr8a7sdyCQmuMv0+8u7yoBuo991Djgeh6mUG5FOK5sFusuCpsNes
         8OZJkmZQq+XZBexqY3lhXTdozaRyZe+dyzqqjHYOBlpwaXrTfta4MB0qjGcBi9RNAkX+
         EBNns6lBqE4AYOlgwAkDut8dqoFkb/Gi98maiWi1aHaZy1k/vobqnMUPd57GDzyGusRk
         pfEg==
X-Forwarded-Encrypted: i=1; AJvYcCVxRfBemhAhQk5Uc0O8HRwsJrsYrvKKaSd8G91rWMWVAhP/4mjpYBCRAwp7AMIycEqqR9IYceF1l/I2HmgocVVp@lists.infradead.org
X-Gm-Message-State: AOJu0YwkOhftASiabuz0tXPguZRUtHxXNZK00+KTrPUv1mvJLNNZd+9Y
	Lk8WbbLKhftiXhZinDyEd//Yfat4Nwr5/D9rvui7Te8Cm5G79QfesibQ
X-Gm-Gg: ASbGncsyfAOnZnuTenMofGFiEeA+FwoNIPDlQ+vMT8tNEBH+TihgrsL7+0gUYHHkr7S
	GtYBRDahHGP7nDO5kjskM62dCkKLUhEgcrGCp8DJ8nb8rhJ5aVxkSm+F1+n9OecUklfF1iP97LL
	pOAiSvgvJpUs6R2hdyPxjKS9e4SkobnYJb/M0bjlYICDeHsV8w6TFd9yWEshE6b7BTft5dnUOhr
	xgTyIhAvbiqJ+4YtDqEDdAgssX/oJyAVaBHUk7Q6jnASRP0yAEaITuEM0a8dSTWTCFiszNaPjMu
	QPpQArViTZY5iv6IgwKuSdtstO6SKeHp3bKzp+ZGysc1+NfNavYkbbx6NtwD3bj2uey7KEPytxr
	ZpspLfuljmIfzY1rJZNEsafb7g5cFa3M7rR+tF0X0+S7hH9LFEzptz40899CtU5JcTIn3115GEX
	KWefBiZ+v4Qz38TVvXjeD1EF6BlbE/lwvMN4S4mR0TxA==
X-Google-Smtp-Source: AGHT+IFRXYX/j0MXYIPWCiTWR10pwTbuC3G1F7eZBn2sHdq/jwsyEH4FFhVQSAeDU8eQ2ogOkSv1Jw==
X-Received: by 2002:a17:903:1103:b0:262:661d:eb1d with SMTP id d9443c01a7336-28e9a5cdcf2mr198695115ad.1.1759835876672;
        Tue, 07 Oct 2025 04:17:56 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:17:56 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:46 +1000
Subject: [PATCH v3 05/13] mfd: macsmc: add new __SMC_KEY macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-5-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=876;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=DV+93RqA20zYsiZVil2ilvoMWgypauFCp2tp4wJbtLo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm3tcZkTMG3aVOZXVXxrFpwS+56WuPRU0ayerHnnf
 S/v287m11HKwiDGxSArpsiyoUnIY7YR281+kcq9MHNYmUCGMHBxCsBEwl0ZGf6qs+5+wnVo5xOL
 A7YzpstdY3508FK26vvLGpci7afbLF/P8D982frPV3QKvQ49zZfh5tEvMbh03DUz4Z/8M4mWRZv
 2XOEFAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_041757_586892_FDCEF177 
X-CRM114-Status: GOOD (  11.16  )
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

When using the _SMC_KEY macro in switch/case statements, GCC 15.2.1 errors
out with 'case label does not reduce to an integer constant'. Introduce
a new __SMC_KEY macro that can be used instead.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/linux/mfd/macsmc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
index 6b13f01a8592..f6f80c33b5cf 100644
--- a/include/linux/mfd/macsmc.h
+++ b/include/linux/mfd/macsmc.h
@@ -41,6 +41,7 @@ typedef u32 smc_key;
  */
 #define SMC_KEY(s) (smc_key)(_SMC_KEY(#s))
 #define _SMC_KEY(s) (((s)[0] << 24) | ((s)[1] << 16) | ((s)[2] << 8) | (s)[3])
+#define __SMC_KEY(a, b, c, d) (((u32)(a) << 24) | ((u32)(b) << 16) | ((u32)(c) << 8) | ((u32)(d)))
 
 #define APPLE_SMC_READABLE BIT(7)
 #define APPLE_SMC_WRITABLE BIT(6)

-- 
2.51.0


