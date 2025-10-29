Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE78CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 11:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lIU4oOnd9wxauWH3/Fw9rcysB+ICjm9HLPuh90L95A=; b=Is9210YsuKwRjWlsUlpFaQZXK+
	Nrfgf0sz+7EAUr9xG4T/VZX2bWt4GVfXu5i881eald2wsPC0ew6awCg1NYmgdra8mzZVvLsR9Xm7s
	8AHGge7sLaBLfMie/xX1FSYBQ30m2JHPiJja8FazH7hhg6eGFiNS/9QfDO6xXjleYK2xojzQH9Asd
	UnoLe92TJ6MHzPZHEjRkb4C864inoG93Piafmeq9RWeIZyIuAOyXCd5Y7FNFVowW46eHsPdfJuumL
	4zgu6KrINFbs8EnpErTv/aBlJKkmzt56QBQok1tKuU/EvPrAP4MZp50NrNoP8UhVpyrlG/G0VC93/
	oIpeiPXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Em-00000000vr5-2rvL;
	Wed, 29 Oct 2025 11:21:08 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Eg-00000000vmh-3AZy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 11:21:03 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-426fc536b5dso4923087f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 04:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761736861; x=1762341661; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lIU4oOnd9wxauWH3/Fw9rcysB+ICjm9HLPuh90L95A=;
        b=0UvNqI8EaAv2lOC5LTNpC7ObzfRyvhW4b8s7eRtl4UcyjI9oMvLElopkMSqJlVY6yK
         c1iSt1gCtmYUYUZ87kGV2TxDniSIQWQKm9wqKSWz3Tnb5a3plh7fxVSBBE1uGgm+zjgb
         /5s1RGvhNX74FDZsY19qqEo310Da9ju5H9X02m+yxzPPtv6lubvX3+BTZ0/CQdoxwwRK
         M1jMoEpqPMcmKYCPAnqnCiN06XJ5XBpFhBoqThj+JIX0E2lCMe8Oh9N9bPndR/zOHgis
         N0LMvnOkDYLgaP9RVAH5oD7WJvy3F0H0wOSbCSx/Jkl65lAoMlqWirVpf7CYML6/rW95
         3UTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761736861; x=1762341661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1lIU4oOnd9wxauWH3/Fw9rcysB+ICjm9HLPuh90L95A=;
        b=MyceWxwWW4YsHrQVAS51IilxzIu5jXDgkZ0sE7i8twBXv2S14el+8KGP14NJOaRTqM
         klWnpN1oSQAS+2mrtaUJkneqKYon4L7f9OaQxpimEGVsO79wMquzWJeguEyij9YRTq6d
         kB62zDeR1jWyV+KD2lJKX5x7Yy3eGt3QgBP3RiMJUjnD+eSRK+6n8C3Yk6q1Qp6z2KUm
         uz4MxMxC7CWBd8VWKOzfcune1Kz4ZdvV37SuVBVoRx0XODlXnEoHbqWPIW2kO95UZI+8
         5ZmgpDxb07z+B1IRqIAMdIRSRLl3Z4o8nDnuH3gUYosNnn02gn/ByPY40yghs/I8ssVI
         RMSg==
X-Forwarded-Encrypted: i=1; AJvYcCVF5BuGwKEok3FqGiRCyxDk2JO7wjJoJ2mm1zk0O8aHSC0HlDuMBAQ61oZ1sKuGYe16nj25tDwjxrcgGKuNrQUm@lists.infradead.org
X-Gm-Message-State: AOJu0YzQOgFFq2Jzh4kP2aVXzaIMEzOqwugvUQVLSMWeUHH+eNVaWEid
	+rVS3Si4Dd0P3ufVKw/CAf/xuxH6/DttQ+ehbm/AE2S6UbKCEnhO4rKVlYTjyyDPd8c=
X-Gm-Gg: ASbGncvG12PLqBKcmSYzAiTUkyEBMO/W5Gh8jL33t99mHJPW9ngjXqv+Kb7+OvtvxIg
	nXeJ1GL2gkfKqidfJtofsUYApAzInzYcPjHOedH+LgTDAoIjdUOEfI6S5wHk0HOhuPfC4nxBCy/
	XCREszb5Qzxreq2sJG84Uhsr8bePqSPORnTVssL9WUbro7UllFxqHI1WUVnMzXhkf53lw8SiQtL
	FsXES0AkekBzCnCrq/wDLChIB6/IM/anHNEmDsdJHC0RUBYEcB0wo103eeSHeUtEnrlR+IGLKUu
	d6EelOhRvi5bNsUl7hP7lPJYcC6nUeT7nYHVI0tmzOBrzgLr1QbllhLTlfgp9RS8K8g6IiVwl8a
	1nhg4Mp+U3aYiYMV8U57w0O5ibfUwkwoI2ZWTX8djhEIAG+Lz8FZIcBa+UwoxAMtZJU8K+SWOlR
	1DVi/A
X-Google-Smtp-Source: AGHT+IELysTe56E+mhoHZ7NXstUIW6f3UKmtjVO8ghC70j+DW/TkQAucQOrY5XE0HuDLOQMR9DoHNw==
X-Received: by 2002:a05:6000:1867:b0:428:476e:e0ad with SMTP id ffacd0b85a97d-429aef81bbcmr1726436f8f.18.1761736860830;
        Wed, 29 Oct 2025 04:21:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69f2:5f2d:9ffc:a805])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df682sm25657486f8f.43.2025.10.29.04.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:21:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 12:20:38 +0100
Subject: [PATCH v3 02/10] gpiolib: define GPIOD_FLAG_SHARED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gpio-shared-v3-2-71c568acf47c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1034;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=e8Z3nS5BNhORSph6UaHIgaZHRcPU9qQgBhb27hulPU4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpAfiW4FA7llKfwCZoWb8G15eTM+Wy2jJjYF2bu
 3ooeffD6huJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQH4lgAKCRARpy6gFHHX
 cjYuEACaqpLISq4p8HrYrIb2+Rq8Nb5ILjV+P0hFXGHSWmJC1wjp0nJB2q+9ru0xbOxMWwtW/Rp
 HW4WVkKe+RFWNbdMb9jzaXp39XJvoXW2bNC8pMJcqH12jbX3+gYpHmUe5uVwilYz9qwxIhRbMip
 bQSbDMYxRxK/k/jsxUIxGDKzgFiD5nFCRDva0xP4oHly9vkeMQGzgkQwE3v7lxjzBWTo8KNCOMW
 2R6Y/Z+eGc+qU2hHrAa60nnOkwBkaS/yEgpiLp+gnBwYURCkMcZMR6CfJ5kLuNvaX6F6aNRbUV5
 0E5E3mPawJcF9EpW7UmjFRA240Pq5qs4LbmQy+24bqeZoF3AFFGyGb4F5pISWqsTARmjXJKrVJl
 mAzN6nRo8z1fPDRxUpZTCxr16WdZO5jvvjYltdIQ7rzduTGR3xiK0JPSK6XjzKGxMQNtbnP8sLt
 XK1LJZxGOEtEHQitBbf476R8P+DpKmTJz5uqIzYDk3Z+hIceObbngk687GDaaPmO7bjz9mDcsnK
 yDvbBQKeDs5NoDC1jn/oGqAsKdjei8JS/3auZOUaPGcueQVKL34E6xR6gjhNRjdNhSC3b2zxOor
 CLMRY0amk8PsuF1e5VnsqJ+aoPTLJT/y3r9XLgmvgGUMsqjFHidM8y6QyR+euKXB9P0jPGp8Msa
 dnvUq4A/hNw30qg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_042102_816026_9166A5F8 
X-CRM114-Status: GOOD (  13.32  )
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

Define a new GPIO descriptor flag for marking pins that are shared by
multiple consumer. This flag will be used in several places so we need
to do it in advance and separately from other changes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 14e6a9807a89da6d7c6594a0a2de5f5032c49e0d..c9de4bb10584206f4888c0f28468762a3680aae6 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -204,6 +204,7 @@ struct gpio_desc {
 #define GPIOD_FLAG_EDGE_FALLING		17 /* GPIO CDEV detects falling edge events */
 #define GPIOD_FLAG_EVENT_CLOCK_REALTIME	18 /* GPIO CDEV reports REALTIME timestamps in events */
 #define GPIOD_FLAG_EVENT_CLOCK_HTE	19 /* GPIO CDEV reports hardware timestamps in events */
+#define GPIOD_FLAG_SHARED		20 /* GPIO is shared by multiple consumers */
 
 	/* Connection label */
 	struct gpio_desc_label __rcu *label;

-- 
2.48.1


