Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256F2CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 13:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/PxI7IDG8K3Rp8aKLf0DGe+okm2zdYYk5VKmu5ka3A=; b=ROcP8yozo/4oYBJy7o3m44qzlF
	I0U3dliJ21HY+wKk4m57tyzhrlyztvYDXsu6KMGvU2wKxbS8O9Sl/ci4qplMjXHd3bft9wdRxPt/H
	SuC3TT3Vzj+El/FBrC70Q+oCy4FOTDBeiZX1ipi3YTNTIgsaIWy3cSwskH/LGC0ErjygZA+wLkb9s
	MwyAULOPk/mDgqU3B9uC4cNA6rZ1LDgVa5PJtgkn/bL2FykP1mBnfE7N5iu3nrfwLgofsKMrz6zib
	BWRQHd5FbFsvbACJyGW6PkvrQDjUG6y63EIeDz1W9wboZNFdJ+9tdtU4CxCbXXc+fy3QRge1zqKpK
	Zxr4mIwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBK6-00000008sQQ-0kTG;
	Wed, 12 Nov 2025 13:55:46 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBK2-00000008sOn-2XXh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 13:55:43 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4711810948aso5886955e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 05:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762955741; x=1763560541; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/PxI7IDG8K3Rp8aKLf0DGe+okm2zdYYk5VKmu5ka3A=;
        b=z1cvTyZ8VEMQo8rl0+IusAyVppAcmwHQTDQZyS5ePVkF8Ha7K15h78KwWkRREaSp10
         xNM0RszFT2meg50ilJiF8FqbYyrFV5Qy69CfAU3eGiCKv+BbryYaELRW/tN3fEYi/R1/
         B5m7mXGxmvTRV6dJ0UXNXroey8MZ2KwqG4lv/d59lHxeKDmd4wa2IH9ClFu0opsSKaP6
         7BQdmknJY9hlHpxfB/DMn0MRvN2Fd1ANfuVPgDH1Ox0i8zm4AN3NBWAzD7Q9Nt1legLP
         UaOibwHdYNaKb0fgf6zeQqz8E+neYUiitHl4EW0aCTJ4Ba9Be+7m/IVNyPvPdckH4Efg
         dyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955741; x=1763560541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e/PxI7IDG8K3Rp8aKLf0DGe+okm2zdYYk5VKmu5ka3A=;
        b=TIrXQX4myDUZd7c0jEHyN07KR4Jg/qCNPQFKe/2chHy9ro8fCpj8RUpPaAY/FTm61V
         7ay8vfHNuachg3twuWdMCbb2meaAGLnB3vDg8c/FfUWNzODR9F75WS7+ecA0M4KqphXp
         fvbAeUjyu2kbLCZx4U3pKf0NIWozTDZR9wRwKKJ4CWPe2q2ozgETg2vZBRRww3hOHJ0L
         XFtBpU4w4Lmc799kuPgxW3Dpsz8s4zIliBEbpVz5YrXUG/PV1uOHpM/iCUiz2/N0C1Nc
         S+RzEgwKiyhBKV/AeBC2hQxTZ1ZeMrbtOVV6YUeD9Kk57NDUNvoNZpiBPrtu1v5xcww1
         lmhA==
X-Forwarded-Encrypted: i=1; AJvYcCVaQCbAXv/xpA21HVowfTKaHeWNzGz+jAxuzBBuUW8+sqFdxMI3HtdYxsGW0NcRJf0qiBBkq5Lk+h0mfxt+yCBB@lists.infradead.org
X-Gm-Message-State: AOJu0Yywzk8KrgbNobEKWQO3uuhc7s6oB9uhjBsqdyDWEzd/nXcOLbdE
	f0strCYG+dipNTKvctz3WK9KWPVPlte2i5+USj3LLTywpFUBdHzV3Nq1ekjCJpVC/Qk=
X-Gm-Gg: ASbGnctrY49PXefBLIACHH+Ih/8igVUfyAIPxAVARDqmOLSrWLEid6aB7hRQDQ8P4mK
	cevIP4etaCvSt/i4OAWDe1ycbxRSM3dpKdEFAnIavvJlTyLgxxm7YaZXmHIzhzysTRGLFI2AB+Z
	BkWLZWc71uuitfGvjOvDcjHm/nVcT+upDbgecltbU+mCk71+8TwLx1+6/sbvb87YCM9dEiZ4nm9
	BmaBNA8dGQHpOWOpHDqnzV8vCqU+k/sHgLGwCWe0hdeDrzXYny2+fiUs69VWLRjlyF4/b5LtBjW
	Rj1jPt/RvDGqn12NJII3xgo8hOVd93tBEII3IyQvVpfCyq4yTevhfUC77TbaoJTboycuY9/wp+T
	3CecLYK08/ashv8Io2tqL6Dy8/QLGwXgSyMXAuq5BF4kNmQNdy4JHTAQ0BwI1YPyHWwc=
X-Google-Smtp-Source: AGHT+IEkRu/791wAeVxaQxp1qqgS3vo3K65X5o46qGVaUvWLYsNeU5tcRsDz23Tdw5hX7vdTv1ja0A==
X-Received: by 2002:a05:600c:560a:b0:477:8b2e:aa7d with SMTP id 5b1f17b1804b1-4778b2eabcfmr2794085e9.30.1762955740481;
        Wed, 12 Nov 2025 05:55:40 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2a6:e453:42d3:11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2b835sm37711685e9.2.2025.11.12.05.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:55:38 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Nov 2025 14:55:30 +0100
Subject: [PATCH v4 01/10] string: provide strends()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gpio-shared-v4-1-b51f97b1abd8@linaro.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
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
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2522;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=NlwU7Iav+zXTXT3/fww0HPRb4T18AYGPoXkxkIX1TvQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpFJHULZbr/rzo1SGp+CZMmaM8LAFTvG2Phhgh/
 gXknU2GN96JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaRSR1AAKCRAFnS7L/zaE
 w4llEACvO76e1Z+11Wt9stMT8nt5Xd7poTboTiqIpNa7/zy1Z0GEsEDf94lSJ/UH8LczyCwHVXD
 j8xWbDY0qNWkjv0JgLTClvjrOl85dQHdVvHxKeKP0ZLuiuscFQGpvZUTp8AsNWFQPEtlN3LLaiz
 ooYYDo77Ff8G5DbGYaDA7hpycv3vbEsD1pA1VlWzMOs03EN2jVs7ZP9LAwvujkEYtop2HO1fwXT
 +r4YkLwaHsGmCMgSxtwvslG3+H/fN6H/T0FuSIQTXrclWt39Gsxg2FxL1HxLPbu2zMWS0EL4pKD
 W5I7vww1qStuhvyBR1sf3bkf4Sm9pcvlpKLCJnmUxAAyzJOw+aoDvWajtnQua2DlqUy73VDuoJj
 UaitJ+CSofxBn+OMKBk3IsE20o5z7CsAdoa0S1wUK2dg8XxJqiryTzOT6zWJRYdCpauKD21/+E8
 f7SiuJZ7QyQkcDQBbpdQii6lD94oQFd8FMFNKaogV+/LBvE2FWUa4UbCfmYFcV/b+1xybajq6rV
 ZouVOU1i/FivCvcZfZtQ1akl9qZIMfaxB0czgHNdT3pajsiscNnqs929HQ5mORLG7SuNy3p586V
 hehheWhg7ZTbzJ/8FWiyOYgnKVprVvop3kDt5pBZIROAR7MXNCHZ93enl7OuPvUYhNKzAK9v5CO
 idZYiRwCMJSHIIw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_055542_677427_87E43F54 
X-CRM114-Status: GOOD (  14.68  )
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

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/string.h   | 18 ++++++++++++++++++
 lib/tests/string_kunit.c | 13 +++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/include/linux/string.h b/include/linux/string.h
index fdd3442c6bcbd786e177b6e87358e1065a0ffafc..929d05d1247c76eb9011fe34250b487834b2d3c9 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -562,4 +562,22 @@ static inline bool strstarts(const char *str, const char *prefix)
 	return strncmp(str, prefix, strlen(prefix)) == 0;
 }
 
+/**
+ * strends - Check if a string ends with another string.
+ * @str - NULL-terminated string to check against @suffix
+ * @suffix - NULL-terminated string defining the suffix to look for in @str
+ *
+ * Returns:
+ * True if @str ends with @suffix. False in all other cases.
+ */
+static inline bool strends(const char *str, const char *suffix)
+{
+	unsigned int str_len = strlen(str), suffix_len = strlen(suffix);
+
+	if (str_len < suffix_len)
+		return false;
+
+	return !(strcmp(str + str_len - suffix_len, suffix));
+}
+
 #endif /* _LINUX_STRING_H_ */
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
2.51.0


