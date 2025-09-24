Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05CFCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 14:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0Q+Hgya9r+CWJ27IcqRYKkvlXmEyTvOuBCqoT3y8qw=; b=2n5ZlncHTsH0cMt0xJHOlNg8Pt
	z9XeuxKJbrp2eSyMyXUEYtWKFz1bLe7QSm4eQTNCSp9LlzSHty8Tqascv1YstWVHXwiHte5M8cDSI
	Z7EjVxss9WbeuR29MVqt9wHfDjMFBG5bq1x+MBja+Uy+ogWJ9M6D5fCk6M57UMmVAkeicSqrhBhZk
	eBfGWfpjB3OUS/JBJXJCn3RM76fI6cGqIBlyiDIiSCtEJWQbF0uNMr4Jsf42ipvant4yPCBmB1HgZ
	OL49LvcZb/PArrZ3mQZUp2J2lEKmwNTWrdOhsYKv6kcDCBmnDMX3YDDzFjrGyCmiV39f0h4fp/myA
	z97f+9MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Qqg-00000000t7J-3BTG;
	Wed, 24 Sep 2025 14:52:02 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Qqa-00000000t0g-3taR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 14:51:58 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-46c889b310dso9404935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 07:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758725515; x=1759330315; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0Q+Hgya9r+CWJ27IcqRYKkvlXmEyTvOuBCqoT3y8qw=;
        b=zfIqUzbeic2QfmxaDoTyG7ZorVi8u3iuqMyb5dj8wLB+kF0b2mLF9DCIiDpYMarotG
         7uecQNyRRxdjomBLC2aolfo5MhIcJJjMLcsWFzaxbYUaQBQp3ToQLjyI8pqonYRxU8qf
         Ba3G0rWLt6/gwYNkaeKlWjSQxlhK4PyIQ6nG+pwE1ebJO3ZQGVFndZO7B7xlM6b/88Gu
         I/B0QIkg/vwMMowWNCrWGSSokzjYejL3M9bswE4UiRKdGO26Lk9JZoqOW+i/AwpFaxMy
         pE+cnazsdb60C5CK9dKbahat5IKm41Xlwxo90t4M7a1rbtxSVPQ/Ro06lz9y17Q2fd5f
         ZMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725515; x=1759330315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0Q+Hgya9r+CWJ27IcqRYKkvlXmEyTvOuBCqoT3y8qw=;
        b=TIbRmCrF7AKznSN2g0rthz+AAFIgiQpquwZ5IfmvNfhj7MAMcdKoqPmqkNtuVHNOc3
         03D71y2E8lb0w3gHG0bQPLFZ5oWB2zgou8biwNGuS7eZcfmSelo4RcTl1VPw94GnMZyW
         5g74y6awmTgOEPxK08Ad1y1dwNr6ZThhysM+IvzpfEyHy3dta4ISTQMLPf1vpU1N5k2V
         KgU0CGDMEU47g4oQQ34pgpMknKO0kCdyhjhONeLiemhSHRikb93+pWMtOwcHiVt2aAp/
         SvAHsfkdC/7XY34zNCTtBKCKCG7IanSht+hB3pN99UrDg/Zl6ZphODhhteYIlJ44I7qW
         NkOw==
X-Forwarded-Encrypted: i=1; AJvYcCWIQxt60hDJXD05rtZgDoriQm3PQG4iNKIW77vKn5Mdqt3RvUAXQSAs/zbKAeY8t+A/q2GsMlh4Ys25YGWyljNo@lists.infradead.org
X-Gm-Message-State: AOJu0YxFnZ7Cq2l+AasZxoJqbDjTXV+BvGqF3uTUg5l0cXFmy+BlYnTS
	tFASfscxK7pNkIGSZPjLJ59W2FRmJLKXjWC4U+3i6NjbiesNtLN5hPTHLr04ckDoTQ4=
X-Gm-Gg: ASbGncuuMO2AGeJ6wcD8JjdSXzg2Kzlcaikbj+AaQTqWK/b1/9KN6KnIzCfPE+s9Bkf
	BwFY5s995vIN6JZVozKTsXDRwaj7pCUnBNRWXfBFhvFpwc6bBqj6ktdw+i6CQNsPt7YREdOtLh1
	n2ubKFY7rLMoO+kdVcPuS8YBgARMUgU5an8/QR8l3xW3aa8Feeh8VSEaQh366xO/NGQx/GdjUB4
	ptcpmx3Vwfh7a984yQTVBdNfxNWu3tKEwmRB/lz6FdU1M6NqyfcF1aqm2/vY/EUtxvbhUr6Q6iL
	FF/m1Cjctto1W4JZfUTos5Q5Ij4ec0OzW8QOj1SXv7gDya57tOiH0NwOqdJheYkal5xxpttMSSG
	6qYQHSyTobfsHXvEpbgty7pbjdSbM
X-Google-Smtp-Source: AGHT+IHqrlf5Iy0gafewEVEvZvdqGPtxzn/dahd6Ieio03KFz2MLsdyrnS63HEdvlLZHwR/e4CQuAg==
X-Received: by 2002:a05:600c:c1c8:20b0:45d:5c71:769d with SMTP id 5b1f17b1804b1-46e2b52c35amr23884575e9.8.1758725514877;
        Wed, 24 Sep 2025 07:51:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1729:c9b6:7a46:b4a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbc7188sm29514750f8f.37.2025.09.24.07.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:51:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Sep 2025 16:51:29 +0200
Subject: [PATCH RFC 1/9] gpio: wcd934x: mark the GPIO controller as
 sleeping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-gpio-shared-v1-1-775e7efeb1a3@linaro.org>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
In-Reply-To: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=990;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+onLqCs+uky6KqRfHsDH/gKs++nVX/GXHjjSwDpjMnY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo1AWFZY+Dx2G8yimcnZUw4X/JDBSCEab4BzQX0
 SEHR9ic5oyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaNQFhQAKCRARpy6gFHHX
 csl7D/93a8AjEBhJdr57hZV94lQ6L3oHzmrrx5+I11yewNKQjKjTiq/Sv7simTbkw5LqRHTNOOk
 QWOaGEuOezZILvfSLh1t7XubpcAX+zTbbff5+vb4ZdNe1XGw3g5MD5RLUzKZQ0hjOMJHU7L9tAJ
 NoggHvBT3EnG8Ws9nzAODXZt5TqCAudVYwg8tTt59kKaEXKVyQUpgfYieAEBx3nstzHVwhBZMsN
 PN/W57PhQSenmFgTdbS8wyVjzfM0yQvStz23TE80h/aC9XZT/OgLk/12DNudAF/HRKS5/Q3iuPS
 2HKCzPlKXS+fjOKXLiTomcVP8ARRmUp8VToNMHo4J4KYtNQXi08TC6HgRORLT/1wWctRhPuhb61
 OkA0dqVJVQGYlOElCn2+hsp5eNzF6oKi/t/I3jiVl7XiGyw8uvkoTWCUnNLGmIHFco/iJoLw7Kt
 sPE0BsweoKRZL6tWX9N9iebGP0cqbHMEsyPDeXu8SFvahdcdKtrNFDCksbyNqOKy+4aBmsmslUl
 SuxtbhyvNcNsX/RjP5FpdoDfQkcDHmiWoTFQvz1YGeGNIJeCLCBmFu+3Gbu4uBalakSNLTq5T40
 g+otJPzjjKDtCQ1tClpK7Ad+moqy7orLr6M64tCCWKk2ukhBIo+iwX0F9X3nRRLdISs6m/qIoR+
 N1Boo054QFUaFwA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_075156_992534_1E19CB2D 
X-CRM114-Status: GOOD (  16.21  )
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

The slimbus regmap passed to the GPIO driver down from MFD does not use
fast_io. This means a mutex is used for locking and thus this GPIO chip
must not sleep. Change the can_sleep switch in struct gpio_chip to true.

Fixes: 59c324683400 ("gpio: wcd934x: Add support to wcd934x gpio controller")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-wcd934x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-wcd934x.c b/drivers/gpio/gpio-wcd934x.c
index 4af504c23e6ff5ad2bad1d70a0c42e2fd91f0c7a..572b85e773700ea0740d3e4efc06d3538f7e368e 100644
--- a/drivers/gpio/gpio-wcd934x.c
+++ b/drivers/gpio/gpio-wcd934x.c
@@ -103,7 +103,7 @@ static int wcd_gpio_probe(struct platform_device *pdev)
 	chip->base = -1;
 	chip->ngpio = WCD934X_NPINS;
 	chip->label = dev_name(dev);
-	chip->can_sleep = false;
+	chip->can_sleep = true;
 
 	return devm_gpiochip_add_data(dev, chip, data);
 }

-- 
2.48.1


