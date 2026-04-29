Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D94CD13CF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 13:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Mo2IeU/AaXoLyUW0cqRpgQJYVfBlAhtHpp2oMUPg6A=; b=U9GlAIRtQ72f3rgEasNqy00uXH
	R2lrbXFPVdD6irKCMi1McYJf8teRTmMlV+pcOfoZ2813cxz8NlrZ1v4uCv4g1zPp1ELIGLEY8y+Io
	NR2hoKAy2/ynQlW8VTxwaG9mBtYlgfQzDAmC+xfmuQGYwS5uHcDguLAM4oYaFdsGy73ix9Rt9Gyr2
	Y6tURJq/cp/UZ2dKZu4Xc3pCUdX9iXUcxaUKBPt38pp4y6OSorHfeaVgz6f21lYBPN366lNEHNyIi
	PzWXah23Jl+OondEZB/fPj/ltIHA0XyHMkMF8gXyjsC9Ob2Ce8oc/AvDpG5IbDCDCaVKxbTvOE8/D
	n5K/5+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4hy-00000003dXZ-0Cbh;
	Wed, 29 Apr 2026 13:12:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4hr-00000003dV4-0SPT
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Apr 2026 13:11:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+Mo2IeU/AaXoLyUW0cqRpgQJYVfBlAhtHpp2oMUPg6A=; b=JAYiveVN6ByzFCy8lHEQSbhmVg
	37O5EhK4cU2Bu1fO+7kq/kHRUewDIHHa+y7Byq/hXMZxgbxljti5RKVGpXbLFHWSr63TxZthSeMdm
	JpSit4bFkSzPIFYU3YT/mfaNN36DCpxPky6pDd9WJFGgLhB7bYITJDVMcAuNGOq0yJ6E3Zd2cmuxh
	oV/92dUdLWx74yrzs+47fCTwBhnMeCNnOVea4nPT4aRSBT/Eh/+1nle5AsZy36USfepz7T5KcpOBU
	FMilHp5mcuiCFNb8Hwlb2IwQ0m04mNjLQCrIAf/IEP/3Wqw73dz7JZwtbJiCvLPqkPrqE4FpsF5Kl
	nZedlDFw==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4ho-00000005Mco-0GlG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 13:11:58 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so11025370f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777468314; x=1778073114; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Mo2IeU/AaXoLyUW0cqRpgQJYVfBlAhtHpp2oMUPg6A=;
        b=eZJI5tec79ORDMBP/Ef5l/dDflKTGbZj+jezR4agEupG4WY25iGhYiQLD9le4E9Myc
         u/NE575ydMaiWPHJ8AsWCqmJA8vpRlKE53yXmd9T1VUaY0gTrNrIt7vME5lB6qzSTeBO
         wb1Vw7noQm2ZfA6Mg01iK21yG2LGZuxHliFyteUo27qzHhbKqoRNO85k5Ahg9m0cFxAp
         Rss3XW4anEf0ATnjijpgs/p1o8wMPc712x/kTLkd6FdNottBo+UXrcN08+gX09L5WBgL
         mfzROyhhhgMzrABq7nV09USP7c/WuE/baKzi7KxOmEblLQ6+0lA8GL5r0nUMpzEFZVhQ
         D9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468314; x=1778073114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Mo2IeU/AaXoLyUW0cqRpgQJYVfBlAhtHpp2oMUPg6A=;
        b=k3ROjBfIPVW0cyXWdhGti1gryvtF6MRX+Be9VemEB7DOt7jAk0vLl5nA0jUg6A3ORP
         bMLAHS/LXUsM5hsCAhIWuMAYjUNAQgUQ9ByXe/x4DCuGxqToH+mqU1TcRRWye1UcWuVg
         T6zOaIdtzM6qIHJ5uP6vX9ZHBk2zjptCX8ZlcGcP+qPWNCPiiBbrXW3JTXV62En5WawS
         31fKVqghil4XiYPnXLtfhlRn+cOf3ffXhgH5lFJ6Q7Nk0UU59kSzx+sWpM2gHoY1mZ0F
         kDwc+GLYoNUofDrNJHHtOhOwmC3f1q3qVeem9BRNAS6axqODVTqbc7Jai0/B/1QjT9W5
         hV7A==
X-Forwarded-Encrypted: i=1; AFNElJ953g0J5HA6YJ/lzSr62hU47d9m/NKBNnMnT4cjjZ+nvIB6Wx4/xk8Yjw8XeR7gth6EJpHnE7nO7ymearFUnDJf@lists.infradead.org
X-Gm-Message-State: AOJu0YxUx0jNqmB0siRHCZhZjlOiXCikHZkMYOvy3eu+p9MJ0dlUQqfc
	sL2sjozDFXrpZU/7PBSQJhK4JStg7aA+eoNGtA7lkFPM+W76iaXAumzg93XtShKs7RM=
X-Gm-Gg: AeBDiev8YdghrR/LSvEzx11/bJ4bRZ+/gTuuTxbKHSEzl1YoMYClYv8z62KQ/YmtYPD
	GJzK6jv12Ve958WUmHrqi3TxMbhmu7FqvLNUoGIqpzI3aRx6zcxxLVA0HAVE1ejhWigBU8o6Kuq
	BUhZflQT++NjVjViwBgyIqanGUNFq7VZeNUka1j4wNakKTrOyRfC+rYfDclHr1/tMeJwHNah3MB
	bdn6IvUYfYPrH+UVHtSey+AhyK5GMouLge6Kckg6//tRzEvfDiKkUlzSACWagwxvIbTgyL/AUeS
	oeLZ0SLWAuqzVygZD9d5Of1ISI7H0P5E351Zrg2AAns1t2P2HTiVxTaykeyMmXiT7GJ6zKRjrR6
	J9hlBId3/ukZ/jbq4ZGxmM/CxITZJfJmgcdM/Jyf3kuhZtfdCbLxUHV48JoLhnD4Y+wuwVgRDMl
	EycO6vMir44L9HOiEMxmP+/wY+0UWoQORDSumXuH2Hgn3MI12IoIYvED3vnZHS+gCBlssb4GGG1
	/vFs0NM42GNn5JRXA==
X-Received: by 2002:a5d:5d82:0:b0:43d:7946:bae6 with SMTP id ffacd0b85a97d-4464aced1c2mr13929202f8f.43.1777468313490;
        Wed, 29 Apr 2026 06:11:53 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca67b9sm4752867f8f.34.2026.04.29.06.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:11:53 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 29 Apr 2026 13:11:52 +0000
Subject: [PATCH v3 3/6] firmware: samsung: acpm: Fix dummy stubs to return
 ERR_PTR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-acpm-fixes-sashiko-reports-v3-3-47cf74ab09ad@linaro.org>
References: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
In-Reply-To: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777468311; l=1843;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=TrETAIBRtr5BpleipM5VXU32aMTdlU394IStlNmAoNo=;
 b=BzENjihfCSCZFL3n7ZtJCw2aaF7Gh/2Zynwp/jBunN4QYv/RWtS8Taoiuk5IhWHY6l6iEMxVW
 ufkny/ebf62B5nQoJpAwAt2YH2fLC9o7HUUqzZp5c9a71p70GqOONME
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_141156_220947_DB8AC6B7 
X-CRM114-Status: GOOD (  13.92  )
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

Sashiko identified a potential NULL pointer dereference [1].

The dummy stub implementation for devm_acpm_get_by_node() returns NULL
when CONFIG_EXYNOS_ACPM_PROTOCOL is disabled.

However, the active implementation of this function returns an ERR_PTR
on failure, and the consumer driver checks the return value using
IS_ERR(). Because IS_ERR(NULL) evaluates to false, returning NULL from
the stub tricks consumer drivers into treating the NULL return as a
valid handle. Subsequent attempts to access handle->ops result in a
fatal NULL pointer dereference.

Fix this by returning ERR_PTR(-ENODEV) in the disabled configuration
to correctly propagate the disabled state and match the API contract.

Cc: stable@vger.kernel.org
Fixes: 6837c006d4e7 ("firmware: exynos-acpm: add empty method to allow compile test")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 include/linux/firmware/samsung/exynos-acpm-protocol.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index 13f17dc4443b..d4db2796a6fb 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -8,6 +8,7 @@
 #ifndef __EXYNOS_ACPM_PROTOCOL_H
 #define __EXYNOS_ACPM_PROTOCOL_H
 
+#include <linux/err.h>
 #include <linux/types.h>
 
 struct acpm_handle;
@@ -57,7 +58,7 @@ struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 							struct device_node *np)
 {
-	return NULL;
+	return ERR_PTR(-ENODEV);
 }
 #endif
 

-- 
2.54.0.545.g6539524ca2-goog


