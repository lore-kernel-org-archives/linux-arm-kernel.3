Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C792FCA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 11:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xaRZ3orPuVdXJjVO7RddRtX98nkKU7skjLyME4PeVHk=; b=RTLXncN7mXQMBYGLchrUMrswBa
	Y1GYEizZgUKOcST4aNdkJBDNn2dw66t9Qc10tmGkmwWMugEWPabyR2wT2o5m6jeE5ayhrd/SVnXKj
	EbBvIEXLKGcXUDfp351SJCoseCPqrkZ45KYoBpC3aGtn3po/DQoGMAje4o1C/Vg5RtF5Wz0RsdMaE
	EkrfB3udir4ba8OeDvrkIFHiTp/bP1LgzrurCG110dc6pugc8rLiy447jGcOgJv7z01jxIAGLNfJu
	SS98yJusx8kkCxBDqph7WWmRPQ7Cz4gt7G0CwoQTgvT9ZYHNGOYyk6jddrbU9uAMc0Sv2QFmJUFll
	BD4NavMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqrUU-0000000BiYM-1p3R;
	Tue, 26 Aug 2025 11:05:26 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqOB-0000000BVo2-3PSF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:54:52 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3c6743a10e3so2191542f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756202090; x=1756806890; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xaRZ3orPuVdXJjVO7RddRtX98nkKU7skjLyME4PeVHk=;
        b=LCCqFagbB8m1bA7/rW3TU+t8UQrKWK7V4qXIQbIUF0Zs1xrvzLoaZKE/DrdLCKFxro
         Z4EuIVimN6V+ZQ1PZcGFicEESsjpBDxHT7E87AgyojCb78VNGBPoI0NytP8VB0EvK3rk
         PlEk0pQ89P+LdKk6G4UoegYcUBqcvTd+eXE/stWBBI4AF4GMog2dS3x6RPZrLz0mgCpZ
         2IyT2t7VyByg4Hb63zeIZ66U7AmPcILwgy5FoEU8qJY4W9HP3+P8RiBl8tfIbmgVNUDi
         NahqxHxsOwWOECmXjefJib/XR+nU8nnCL+6ptYl9x0jBz6b482/UhwcFwXtWo7o2MRAR
         gKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756202090; x=1756806890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaRZ3orPuVdXJjVO7RddRtX98nkKU7skjLyME4PeVHk=;
        b=m0Qk6OgKESQNkCX1sTqR4Bfifo9QB7KWvD5XdXtBjzhWFJ5DMPst/yBlE5tyAkzuRs
         m8BYXqwXd68L3wAmCJo0BlVmMXa59ztst+N3Py+stOypH46ZFvlRy+SHFyf/bZrqNr7l
         qCgUgeCkVQdIN+ySvbJLO0MhV5/onlNzep7CD2Nyai18GdIC17iOcCYwFhDup2nR2oEC
         AP34EecXwfzc8CDVRmvxAOyfctwZlwxiumllhOkYWva0std2ZpkDIriUZN0X79P+Kgn/
         v0UZunGM00GGxEZykpl6t85Kldvc3pzOsf+Jt6NcnmFG38l9f1RUsp2AH7guRUy22qYs
         /28w==
X-Forwarded-Encrypted: i=1; AJvYcCWqtCq4dEd8mKDVqUE1JYzVDKdEK2JjR2lBov+xNd1jA/8DG7+hnxdxCThU2yxltEBh9Qx8wIQdS59UFd0HFpcW@lists.infradead.org
X-Gm-Message-State: AOJu0YxcJ/CFZBq4XpACYUhk9bPfZD4a9HePHeiIx5WOQ+ABqa3QsxR2
	oMB+4i3L+1BJCNUt9mfrAoYnmwSAS9/2A3vHxSWR9+wXz0++19KdCfTs7TcqofA5ey8=
X-Gm-Gg: ASbGnct2FxLp6HHt0fyWFZoEyGckXOf+tx94Dh8OpfgnRNM3Sg+UtvjgxMw/ddK0Q+f
	CbQidyaT6HPkHmLPsyEyjmjqJc3JFi5aKkVciTdnWkc3JuxJKZ/bYWuCcC/8Jso5k0bb1lR8KiA
	rzUthmGx9m8UKKsz8cj1xldEfY+lFQ28u3MBokeBV6uXp+MZDGSUZn80bXSaXHQ+J1qOMsEbAfV
	MzWjdjoAbA/EPbQiSaa+Rtj6jOpSIuslb6phCOmzx6uw1yYwv2+QcZFJJJkBkE6EUARj8BLXjRG
	xpruxZhxshXaLi5gixAFPy6oAq9FYLyDMUQZOaIRT9DRhg401dfntUuWjuBS1gwaZMvW6k6GKM8
	b+Mu1I/Pi2Iob9H9gVQ==
X-Google-Smtp-Source: AGHT+IGn0GRxBvM+WD5O7v7/hNVOsDJAMieISnJTHVWyn0GlU/XBWButKenSU4mlUYhOne1RniJKdQ==
X-Received: by 2002:a05:6000:25ee:b0:3c7:44eb:dd77 with SMTP id ffacd0b85a97d-3c744ebe211mr9929433f8f.12.1756202090400;
        Tue, 26 Aug 2025 02:54:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5977sm15708447f8f.51.2025.08.26.02.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:54:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:54:40 +0200
Subject: [PATCH 6/6] gpio: xra1403: don't print out global GPIO numbers in
 debugfs callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-dbg-show-base-v1-6-7f27cd7f2256@linaro.org>
References: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
In-Reply-To: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1069;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=pqwEZ6klxsSv4inQWR27IXYKVls3Qm/tc/R/XY/nCmk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorYRhrRtwf1VkVEx/r9gY3Cm0Cya/2HLTxHfso
 Z84jtpt+hSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK2EYQAKCRARpy6gFHHX
 ctnOD/9TINMbHZubtrb6oT50/GRpHQJ063AdQj7zfSKZ59ymB2wM/mX8Pl1NkWFkEcxS9+JVk4Q
 lPCGUt2qfdhvXm5FVVMLwUbmtM9xF3GyeqiUrPPM80PrH0YhwCSOhpd8ghSm6QU6/mcbPNIAxnz
 iHZQDZsDHSgZhL6rcYIzKqG1T6MnBHYERna6eOUJvJflW6t1z+OV3LWM3rbImRGtgzgExtv7SLC
 30vj3gnkMzlCC3/9UutUGDNB1kPT2iIHcQlPVPX3NT2J2i9c4JjsPzRHKmOJ/tf23t6sF/WcQY8
 0K/+WFMJgJCYuA+BBeBvluPlLQadUddZSRNVLac8YMfZVbYS+GJgQvIH/51XCZKdmHV4LmsRxW8
 OWeFH5Gxi2NYcqQOuJm92rLshkHQtFYUp9EdF6UniY5jyq2cMRjDlptaZX5r3544iUHG5UFl/px
 k4HJTHxyqPdHLwJDjbPrvddnDgcVqx4s1Jqth/Bz+apACEuyHb6IQAX6QQMzRFNLyE9VSnUNa9C
 iFFiyE1jb5ZspnxT+439i1UlBmTqgbQv2KXU1/QCJAba6Xalc2I3GIjoFd3cmf0xgJ4uhW2RytJ
 GepfYgtLR5FAxX02LJpbPuWxSPU83zXmv7NVjSnrk/lHcncdZLC4mtHIwKf+gcVHuW31WpU23Na
 lZ8o9Gcmx7zGsjA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_025451_877421_BA1F9AB0 
X-CRM114-Status: GOOD (  11.84  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to further limit the number of references to the GPIO base
number stored in struct gpio_chip, replace the global GPIO numbers in
the output of debugfs callbacks by hardware offsets.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-xra1403.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
index faadcb4b0b2df0744711b4a8d211adf71ce49a38..7f3c98f9f902013cb4f1c9109dab331609b28997 100644
--- a/drivers/gpio/gpio-xra1403.c
+++ b/drivers/gpio/gpio-xra1403.c
@@ -135,8 +135,7 @@ static void xra1403_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	gcr = value[XRA_GCR + 1] << 8 | value[XRA_GCR];
 	gsr = value[XRA_GSR + 1] << 8 | value[XRA_GSR];
 	for_each_requested_gpio(chip, i, label) {
-		seq_printf(s, " gpio-%-3d (%-12s) %s %s\n",
-			   chip->base + i, label,
+		seq_printf(s, " gpio-%-3d (%-12s) %s %s\n", i, label,
 			   (gcr & BIT(i)) ? "in" : "out",
 			   str_hi_lo(gsr & BIT(i)));
 	}

-- 
2.48.1


