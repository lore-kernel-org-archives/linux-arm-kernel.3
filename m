Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2787CCF9F7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 11:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2rTEU/R4flNUm5DKfIw19dyA8fnd0V3L0Lxu0SXKBI=; b=0frcAUFIvPm6K5BmSHjyxoMq2f
	oeFE18m5+EAd9UUa99jiGu8L+o/FqA2L8D6/GM/C59wJSRWWQ5aNt+FllTQW2GTJrkMq6Ll6gMsQZ
	+KSFrdnn7eCfFWLAD5/kymqxMMGJ96gZ5fsLG+Qrdum6UnWHjDqAOxqBU7munPdSSg2lShzR7ofcx
	DFljB9p/5WsVpnuNLoA3W7uwvpZ+/YYlwidfy0nFUoqlfpnypSTmj0948cNyiJbCGVeTNMQHhkGcj
	gIFSbNbEeGuI8v8I2MUIZsNU4+nQVlBJOS93f4txJdCnHJKq5eFNZTwTDKrS8QwgWFyu3DLQgmudt
	SUhZzJNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4FA-00000000wET-0Nkx;
	Wed, 29 Oct 2025 11:21:32 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Ev-00000000vzN-0Tdu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 11:21:18 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so46680955e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 04:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761736875; x=1762341675; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2rTEU/R4flNUm5DKfIw19dyA8fnd0V3L0Lxu0SXKBI=;
        b=BLMNht378mn6TwV+rph6UCjmNhrzTnT4X0J0HeUYwLnSNFC4klnzsgy9zSmMl6HE0n
         hcY0kWavjkcTPGrVjZ+kAtS3I2CzE12BuArSGeEBjwfnCo1EpyHIlRbRtlwh0MRjrA2R
         gKF171x24e0oNcvRt8xtD51mN7UW2I59QQECGAN2mqnJo6H1Bw7V2gXlz1meCcBFFU+F
         Q/AV/A707TmMGTB8pdMKSFUt8I94GUNZnTLln0YG5eRDsh26qxA2OWma65dWgJr1Qpkc
         xu1LvA4o2ubbU3VkTGkLyk5P8yz03tzmBG9C5tUJxk/tJfbdSp9RcgvYuc1/gRx7LwWw
         dQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761736875; x=1762341675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2rTEU/R4flNUm5DKfIw19dyA8fnd0V3L0Lxu0SXKBI=;
        b=stiWQgJgj70SEevQ62N4ckrNuXKrNd8mftOLO+JP5gBlVypuusXAN1WDpgXX0E3w1t
         r6kdYEZwVWCwM9prFCbg7uCnWhFnmQ6mJ84t3tvYhfrAUS351CMAIEgQ0uDlNCg/zSuR
         LvIsYX+7bAVteGWr53pTRwoXKt2hwyL+PviCXnzpXDnmqHbGZyQC/7c+aJmdle+OSyCY
         y4rKp9X5rqL4NME6+gBPPKVIKHhxvK9z2IUp9IEwb8135CVCnR8C4G9bs0IPvsbTJP3X
         ugFvYK4LKzLBcKg5ZEmaB4B9OWOzy3gY6rfe1RaTf7FPwXw5KWWaiDfw+zTHlyAWbDwg
         VQDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa/uUhMgxoFTbapQk3B50wGzMYvc3yKIW7wE+Gds1Kh60dkq4IbJFlS+rHXa64aQEg/yAiMPNoWxkWlIcoxMR1@lists.infradead.org
X-Gm-Message-State: AOJu0YzFi8wZPP6d+L95UWJ5ApTLQDXetdm/IqSAwSI3nCH7RrdOJkgN
	HGpHxySisguoIW5trKMFl17Myb+JN4OJYJIHbUyHNR4l0Oc6ig2ylGyMqZ3MXFlkQgg=
X-Gm-Gg: ASbGncsNQ3k2NE7gL7Y7Gk53OnkJbPUbFOUdecnja6iKMTvqKvx07cDzpjuFVQ4d5wg
	+Leb3D01hlKQ2PePa0h2eMc2YwMkFxB0dunY2LtYA/KIIH15Po2egUDxXd0hY0J1no4n2zXYjog
	KIw8te219dHBc8IwV6PgEsQ5V3ePK4a48CcaAFP4AdZPsH2cDh1hSsxWYhi9l+zhqAbTVLBlaIU
	eMA1B7YpRlyc7B3As7tOl+7vM9QXM8LgX7jlp6pL2Shn0YfmBsZ7Lmem3kN9SxfRQ/Bz+N/OY1H
	l4h12HNnNgxsE9XhfM835LliNqhW3bGUy7e58470U2VPDVDBOVODriaO95xzlmqRkNOgrI6AQW+
	9gaIQ9c6RmCP0V8TrW76bbdH1929PzRAI9PNjb9GXY0oIWM4CYa4JI/8AZdZlBMSlusmSBg==
X-Google-Smtp-Source: AGHT+IGR7PwU0mQOpYzSCMCZbMwDSmhLvLVnDgvEOcrKX+beh3H3tKQBd4cE2sGECLQ4LCyzu99rrQ==
X-Received: by 2002:a05:600c:c48e:b0:477:942:7515 with SMTP id 5b1f17b1804b1-4771e17e177mr21559155e9.11.1761736875026;
        Wed, 29 Oct 2025 04:21:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69f2:5f2d:9ffc:a805])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df682sm25657486f8f.43.2025.10.29.04.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:21:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 12:20:46 +0100
Subject: [PATCH v3 10/10] regulator: make the subsystem aware of shared
 GPIOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gpio-shared-v3-10-71c568acf47c@linaro.org>
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
In-Reply-To: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
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
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1401;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GIqAeLMClqYJzQksRPUzaJ9e76p5dkwgt728MWTS1+0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpAfiXYH7uSZSvv2U/L5oE1AwbmsCdQLfg+BT6I
 BexNof4UFKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQH4lwAKCRARpy6gFHHX
 cjuVD/9pKMy9xOMmFOqySa84qtPZZ//MaWg8zuKJKEL2j3t/Hf1aiGZpWMx1/YNjCFZIAGQ3H0A
 NmjnygexP/IQFMGnRRSzA3mCgF/IU11qJSprjKr4evOZYIqoMxfFlWR6eDpuSncPQmqpCSV9MDl
 YZ35OCglMwmVOaFaPRnjzfhvhbGZkpo03RrPkeI7EQ+v4h4S2bpY2UveAKe71Br5o57eAmvik8v
 rwnRwpIvS1cmm/zK02sGg0go1c/tbdKbFrwoGdJ1OZhEtTxv+iiB2PXpc22/MJlDUi0mQBhS07m
 b8LPIoT6scWDQHlLr1K5qWSPfJt7u5OhjUfhXNa8Q/GdP6ViFr8EzemKdsBjUeJxwkOVS0zWc77
 V4kkjWa2olMwV/ZgOY313FoUVqBxBu2lCJuEE5C3F34WDSVzP80gsG9VlL8yznE6JhH6MaGf5ZA
 0zh3q323KhY+vaQ2Nb6MbS1C7sKA09nuBUZEOQ7HoD2oTY9Pp6krNOpSDNkJnT3jdyQrIfTvRlL
 fwpPx0GQfTYfxGonj6ayd0vZO/elG2eQSjCgUUcsdVvYgrasgibmrH6S7kxSo8/teNU4ptvP8H0
 fjA+DVAvFqG6lY5ipB1BVRVcoaywy+RgkCu5Kqk4zWOBT7yMzLZzxgNtsDabMykXPK8ciXibwvJ
 zSkCr/gfsw52I2Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_042117_187417_464557F3 
X-CRM114-Status: GOOD (  15.29  )
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

GPIOLIB is now aware of shared GPIOs and - for platforms where access to
such pins is managed internally - we don't need to keep track of the
enable count.

Once all users in the kernel switch to using the new mechanism, we'll be
able to drop the internal counting of users from the regulator code.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/regulator/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 84bc38911dba308539a25dd3af30a5c24802b890..e13cf5e120466cebc4d3f8400b89be07d3303338 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2737,6 +2737,13 @@ static int regulator_ena_gpio_request(struct regulator_dev *rdev,
 
 	mutex_lock(&regulator_list_mutex);
 
+	if (gpiod_is_shared(gpiod))
+		/*
+		 * The sharing of this GPIO pin is managed internally by
+		 * GPIOLIB. We don't need to keep track of its enable count.
+		 */
+		goto skip_compare;
+
 	list_for_each_entry(pin, &regulator_ena_gpio_list, list) {
 		if (gpiod_is_equal(pin->gpiod, gpiod)) {
 			rdev_dbg(rdev, "GPIO is already used\n");
@@ -2749,6 +2756,7 @@ static int regulator_ena_gpio_request(struct regulator_dev *rdev,
 		return -ENOMEM;
 	}
 
+skip_compare:
 	pin = new_pin;
 	new_pin = NULL;
 

-- 
2.48.1


