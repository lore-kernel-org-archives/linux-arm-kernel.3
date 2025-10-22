Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547B4CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUL6O2x/NPPlAHvfQ/3YG+cqGSjBZP8VuHP9QkP07I8=; b=RnI5R2NClUs3seRy75UeEFpfZE
	PetBwuVEYVPbcpRoI0/BlOWOXuxSG9oUUZ/fROWSj+YYC/GoV5xGVAi+h28uqbErrR5FfalU0OYz1
	8lgua+ChyvwPl6c8ilgXZhafRx6O+F0QV02RgYxIypWPOsG1lWeWFknx86Xi39UIgIJLIuQrjR9Le
	dRWrBqZ4gdnCmsjtj7fE5A9sZgpLfxSvn2L5a042L0BSS9dU9W0Aa31jPsPhJWOlwTHTwp4Y011Hz
	ykGYu27M/szIPRiibOdGSwllMYyJAn7mfRX/OS1bRv+83b1KrroX0d+p6AncmBbZkKXxDlu+a7ooS
	ldYVMdHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYcN-00000002w8a-3XV3;
	Wed, 22 Oct 2025 13:11:10 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYcG-00000002w4J-3hsd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 13:11:02 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-471b80b994bso51752125e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 06:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761138659; x=1761743459; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUL6O2x/NPPlAHvfQ/3YG+cqGSjBZP8VuHP9QkP07I8=;
        b=q7vdAq1GvD/o/mbYzYQkLfT5m22gyX+LOGYei15ZlLadjK7LK1ow8p3ARVWcUcvBXb
         6oRCtLM0tDj2FR87Q1AxcU/IXkj5yXXMtYWDYpyIJf9GUMzbor73f/XN1FIPslMnZEW1
         x+S0fqNYzcOb45ZmgTvQxXHjKj8+oId6iCp7T2c6gKwFv4EH63KK84ghMIDX69DF8eUT
         w3iWset+L8nWTOmnTpmErKFK4x5bVeYT4FdgSYf7e1auoW+gBgsX4rwzDsuuh7zYwTj/
         6mKJu5RuC067Svlx6f9NWGteE4JD2VlArnOwrH/8uPN6ZuoDBwln35RdUiR0naBzY0Lv
         5Rig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138659; x=1761743459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kUL6O2x/NPPlAHvfQ/3YG+cqGSjBZP8VuHP9QkP07I8=;
        b=TubXMtwCk3RhVIM/YRsBBwy0e0sfU26skzFtO/VeMiCOg185fdNw/JLocB2sKfiUAN
         4A+3noVwnwTgu5ZcH0uxAwP5naGE+iFjXMLLLzvTtqCoN8BBm7TH37cSfLxTFThIk3FA
         ZFkxoVMiXuzeNj0SQQG6/0gB74BkMqgC+MvWBC3YizYMvKwd9vQSgbd2qhwHmOQV7AyG
         JIUOX6EAu88loraTBhLvAKbfM+jWyaxa1TsjlpsCsqSgSj13TbGDNmlgi/x2TT4Jc/7c
         DArmvPAfhj1gij65rfeAQ3Xg5X74XuBAaRM0cM9oOwQxZFMJRRd6hYFZyz83Kt8IycMK
         y3qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi5YxQjqtCVW6+PZ6GhE53fyMi9/v4/A1GR53z4yXBQtO2vhT81i9t5QalKpFo4UZX3fgyVoNVlSiGa4VzsQQ7@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ92SfNdIC2BN5dX2sbqbxSFVZH9wqxbe0P+2mtnwyCC2r4QKR
	Nix1InGrQHCzXek6SP36fN0lFlzZySy3YdNd2tCmxOXSxcTxJqMccnr4D2a1CAsRsSM=
X-Gm-Gg: ASbGnctIuf/VHm6/7JEhvjmSLklsehQ55s/7/p5NxUTGs1/eBACVajt6WuzJWqlPXu2
	DA+Vtlh1fkM4ie0qH7nc179klMPlyldBFKBKjeGf1fzOfeDrNkSGtOsr5R9hykLvtODFw7wTTwr
	k0HYwppMSojcSgcy/eLRGqm13rGo09EDMF7GvRkGp1VPB2g1us5TrQ/SYU5jjDQWcq64lan1EmF
	7JivsZnI9STQNtth/VuXbTHeKCkr1KGile3L1+2kvO69WtHQRg66ea3zfygNGkS7nHlSnDWvBYk
	/1NJvQmq9h9bYRra1xWa2ig6J8qT/p7zBKdujTvfiz46pwpQ0SUL3SuLhXSFr9vcG//ACRbjsyC
	UPLKThabGDgRMclfTl7/+WkYGBforw3gcSYKYqBdLcCtpXsMZUt6MsZlsLSrqByIftYDuQjQ=
X-Google-Smtp-Source: AGHT+IHy0lW8aRLBPmXRjIDPC8mTab5QUgEvOgdYolOwgCBdc19L3kJXN3yUq0gQwRUG/jyV9vZrlQ==
X-Received: by 2002:a05:600c:1d9b:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-471178784c2mr170409895e9.6.1761138658987;
        Wed, 22 Oct 2025 06:10:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496afd459sm38839905e9.1.2025.10.22.06.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:10:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:10:40 +0200
Subject: [PATCH v2 01/10] string: provide strends()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
In-Reply-To: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+NfcwDJbBkx5ucXuoY0STS0Fcr8BiHjfoYGjt
 abNEB3nZjyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPjX3AAKCRARpy6gFHHX
 chePEAClv9rma9/Zj1+Dd1V5rBFn5At75Q+ldrHq3TX5K3fNqcCjqaoImr/yOEEQjFrLDUYeLnj
 NGBGbLb/pTLbHgU/ArVoFpORHOVW8hDXMUFIvZISHEdDrxd40KdxpNu+i0PGUjd476H5Bqu8mfJ
 x7v/yITPxj1qGDRIwPrBsrs1wJki3I9fEN6p71RnqG1nVcj1NTBxCw4WZ8RWakrJfwYF6As21LO
 o5jULMKY+FjNI/cmniaePf+8TtDVoxhVRh00CaOD5piXun7mZT+AhqUKJLM2j2UNM5/MPjn++Me
 4kvIppPGLUUrlTim16CxEYB5yFpGSz577krytdShCv8ewIxfIF6zxo9gs2owtKfB6nFzXY19xfd
 /01Hmy4DkiEyOTULKBFebihOzNF0MQW3sH30dwVCkhulfrRaUBA5m94LPUs8bldT/i+0d7k1sxn
 Kknrw7UqiNO2OTSVubi05FaW/epIRiv8tXhzgALAVFKbBqHlWB4rEZkc23v+jZ9kBerQyXYQ8k6
 lFDvk7iO/DjhBFatKLbzCxpzP40saFcoPL8Y3QSRg6CRQ+tqWhYHSNmBuX1zFQfHONHq/kEY0zM
 5e2oMXpXVh/P5XVP5ukSCP48w3PLStmha+wgX0TtjxAjF4uIxm/5T4mRRJNrrulH0JTbIawq+1J
 pXHRdgnjg0JegnA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_061100_954913_CEBC08A1 
X-CRM114-Status: GOOD (  15.47  )
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


