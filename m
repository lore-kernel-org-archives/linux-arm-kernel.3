Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820EACAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 14:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUL6O2x/NPPlAHvfQ/3YG+cqGSjBZP8VuHP9QkP07I8=; b=LIi5JgmJwC7J+DvTbtX9Hy73gd
	CmWpXCXLohSi0+QC2piCAJMqlwhnDDU2SP+P94MdrcYk3YCTSdmtSiDYRCE3RRId5Bu3o9hdHtrd0
	QzWo57ej/Sp/9R0/TGTVBsjNK1cwP0UrKvf2mcXViOY4yaUwhKQ1wzdkm91jcAfojlipINxn8m4RT
	qqr8o3fL1ZLCiZbSDKyZcRW0fTHwUWj1KyIR0sIo6l1oiFLt2JTEIOuNURmsuwU8vtld3BIJPy+ux
	kQM78Mn86e0eSGqyq9ycp43192FkCeIQUiKxq9GdC+W9kwN2y/U+lorzGKCYjSHy0MShcRZlibhl5
	BQXjT6AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Qqh-00000000t80-0EY2;
	Wed, 24 Sep 2025 14:52:03 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Qqc-00000000t2I-1oeR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 14:51:59 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45ed646b656so60387035e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 07:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758725517; x=1759330317; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUL6O2x/NPPlAHvfQ/3YG+cqGSjBZP8VuHP9QkP07I8=;
        b=3AciUEmaaz9W92mS+K065xVV9iSArQsU4LXzIHCXieuiAwEuDTHKc9LqPtQd7/3iWu
         MbwsDipkj0ETlGiRwf2pqmb+1cK7swEBQHKZo2O6gX1oJlmfu0fuEYM50hMxr+6TwQqx
         tb1ZwLqbnP+uuxfl8uAqd0Vu/gQEHuqrKSJfYiEyfVktR/0Tac5QVrLxy3AvYaezeSTa
         au+EZG4btZDUJurFxD01OoQ7DgU43GGjWzBu8ZBmK+m1ID68ffVqjmXM1ezw0sHlmrzn
         rb2dwPVHM1o9ZJt2rX5vrZjnsu0CzrFJ/lssw4dqc3ghUxjsprD1K+QNxAsoAqZMdKeY
         V1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725517; x=1759330317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kUL6O2x/NPPlAHvfQ/3YG+cqGSjBZP8VuHP9QkP07I8=;
        b=D9e4qteAtNR3alDt3fAJjYGYOEDNHSybBeo6s5ksXbpIt07RtGZE8ope0UBGVpM3jc
         UcpSZeOoei753vJbBzltdWzoBbI7ns3V8pFSl0nuByLZ9J7T/bXK1LGy8x6vGtWHjCOQ
         6q4IPEfW2oiGbcP1U7Qzi6bAxjlvF6Nqz4S94XAzsVcvrQMHVC0ZHIromEe4tvh5Uque
         DqJ6ViyH6V3ID8dnLCHyOR6D3l1DovRu9aVksO2RaBVXL6Ha1xje+E/LtRUArfAQFjCD
         mtgc++JN6yMn11Z0oYeIQuYszvkd64y0bWWBgAvrICEekpFG/BsedJjhw/3NHyxi3ypA
         GfdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvs4g/SdLMw/TjGeMBlAe6xCl68ccMuEQkdvC8bcPvBj6r0bZEUrdh5xRvV+cGS/3kmi29SO/ofxmaBf8jWIkV@lists.infradead.org
X-Gm-Message-State: AOJu0YxL+60AVrnDw021wpYuV4OvH9gys123M9/R0F2Z6i8yMKYjJf/X
	2de7TWDE4WrjLqDk/xRb4Jn99qTaq/NK3i+6otwKeX7SqSAAte8KNJnfylL5urCcS64=
X-Gm-Gg: ASbGncvnL5KSwx43wznAMlMMXlOASz2lunoVxNBu47UFQlcASBSVJ2t3MIOPICcXx39
	OAtWrsqv091dkR1YpftNlEejupMkZcBY4RCr1CM5rcZxaHlwQMohT9QkRNTzIvzwqOmsPhWtudF
	JIJprcCQG2UStkSgQwrbZZ7XkZg/ocOXWSnQp64XBl0qatDsfLx0esOFza6TqnE2+gIG1cyqTA8
	Ok5uOhejPZIeqyS1uN+7pJkJl4Y3dswmMEWQ0H/TrOGyXWs7JGEri1uR8+AfO64SCmaoBjYOvBf
	f8HQ3V4+0IuN4KpC/AixBli/u9zMGjTGLWpDPHpCAGlf8FVt7ahLIun9joZsvyS9cJSVUyroStY
	jUDmAU6bXPa+3Wsdyl3JqUK92gQDN
X-Google-Smtp-Source: AGHT+IF/b8KtJGrO2c7FsOGp+7VILetZJbVWastKmh5680LJka6DmS8H0qiOcUh0QohfrhRcm7VWjg==
X-Received: by 2002:a05:600c:4f49:b0:468:7a5a:725 with SMTP id 5b1f17b1804b1-46e329d499fmr1394735e9.1.1758725516760;
        Wed, 24 Sep 2025 07:51:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1729:c9b6:7a46:b4a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbc7188sm29514750f8f.37.2025.09.24.07.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:51:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Sep 2025 16:51:30 +0200
Subject: [PATCH RFC 2/9] string: provide strends()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-gpio-shared-v1-2-775e7efeb1a3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2913;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=rk7LOdXp57F1p1eS/LT1Bp//+s+MccpAywVrjh9Sj2I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo1AWFLLNKrVdT/LzU5mrMjyhofZl1pTrhJ6Uky
 MqoP34eGneJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaNQFhQAKCRARpy6gFHHX
 co6cD/4yaODnssjJFuoZ7p50b03D1KfIY95TO6+G69PuffncMCFpi+DH7pJfgY0IB08sl6Myb3j
 ZyO9FoV9P0DjRbv1mk0U41wjF7nRRWsNgqzGOjAFZXXccX2vo5WbZEz9M1qXGRqXffnCrqSIIgB
 JFuRGgJMxfYQDShBtPP5Anv6At1X1TgqNB4yBo+FlntLyczF0e2A2L2Y1YSqog7Nuj/kIHoSNgW
 kKLAEgabncRXTqPkEKF7FfPG1r6nnJsHc3/7ROcEJW1jtHg8vZgMCpt14W7TgVTGEwCc1hE+c7k
 qdTREcqK6mmS/7tNP7HMqmL6HEFADuvffkJPhGj2CBo/iOB5A6yAdzKjHm5jgLyMKqk0k/0IRw0
 jrA1gVycBI4KQJQPJXWkekgV3no1O4Nq1Jb2ALEbBFlNqvI67bKYydRFtW3zejLuYB1WgLOc4Z1
 P+bq+sc/9359/e6oxB3p+J1zH/0WaOYmv3OihFKCRnBAO6ANXR+ZVkVEYr7i0/lZTTA3QzQqGVw
 V/GC1cKCIT/ECMMVD8yW5TQVkudGOCmQ1lYz+RPzPrMuOSocBKUHIm8VuaaE4R7PFD5puC3Pty7
 MSJJdskZZuaW/JrZeAnTfE2txMMqOWLEobceB/r28/vdQrre5Kd2bxCCHv3+aSB+shgxI6/6ht6
 AvtofBUF192zP+Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_075158_516589_95371E59 
X-CRM114-Status: GOOD (  15.41  )
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

Implement a function for checking if a string ends with a different
string and add its kunit test cases.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/string.h   |  2 ++
 lib/string.c             | 19 +++++++++++++++++++
 lib/tests/string_kunit.c | 13 +++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/include/linux/string.h b/include/linux/string.h
index fdd3442c6bcbd786e177b6e87358e1065a0ffafc..16149404fc3aed535c094b9550f7bd7c9b44a0c9 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -562,4 +562,6 @@ static inline bool strstarts(const char *str, const char *prefix)
 	return strncmp(str, prefix, strlen(prefix)) == 0;
 }
 
+bool strends(const char *str, const char *suffix);
+
 #endif /* _LINUX_STRING_H_ */
diff --git a/lib/string.c b/lib/string.c
index b632c71df1a5061256f556c40a30587cf45dce18..ac18313d9c52b38132f0bfdd952cdec6b1354d76 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -880,3 +880,22 @@ void *memchr_inv(const void *start, int c, size_t bytes)
 	return check_bytes8(start, value, bytes % 8);
 }
 EXPORT_SYMBOL(memchr_inv);
+
+/**
+ * strends - Check if a string ends with another string.
+ * @str - NULL-terminated string to check against @suffix
+ * @suffix - NULL-terminated string defining the suffix to look for in @str
+ *
+ * Returns:
+ * True if @str ends with @suffix. False in all other cases.
+ */
+bool strends(const char *str, const char *suffix)
+{
+	unsigned int str_len = strlen(str), suffix_len = strlen(suffix);
+
+	if (str_len < suffix_len)
+		return false;
+
+	return !(strcmp(str + str_len - suffix_len, suffix));
+}
+EXPORT_SYMBOL(strends);
diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
index 0ed7448a26d3aa0fe9e2a6a894d4c49c2c0b86e0..f9a8e557ba7734c9848d58ff986407d8000f52ee 100644
--- a/lib/tests/string_kunit.c
+++ b/lib/tests/string_kunit.c
@@ -602,6 +602,18 @@ static void string_test_memtostr(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, dest[7], '\0');
 }
 
+static void string_test_strends(struct kunit *test)
+{
+	KUNIT_EXPECT_TRUE(test, strends("foo-bar", "bar"));
+	KUNIT_EXPECT_TRUE(test, strends("foo-bar", "-bar"));
+	KUNIT_EXPECT_TRUE(test, strends("foobar", "foobar"));
+	KUNIT_EXPECT_TRUE(test, strends("foobar", ""));
+	KUNIT_EXPECT_FALSE(test, strends("bar", "foobar"));
+	KUNIT_EXPECT_FALSE(test, strends("", "foo"));
+	KUNIT_EXPECT_FALSE(test, strends("foobar", "ba"));
+	KUNIT_EXPECT_TRUE(test, strends("", ""));
+}
+
 static struct kunit_case string_test_cases[] = {
 	KUNIT_CASE(string_test_memset16),
 	KUNIT_CASE(string_test_memset32),
@@ -623,6 +635,7 @@ static struct kunit_case string_test_cases[] = {
 	KUNIT_CASE(string_test_strlcat),
 	KUNIT_CASE(string_test_strtomem),
 	KUNIT_CASE(string_test_memtostr),
+	KUNIT_CASE(string_test_strends),
 	{}
 };
 

-- 
2.48.1


