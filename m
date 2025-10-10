Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D89CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 12:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euDBh1JPBik0jtg2IFON/RfdHFmTQnkqEMlQtD5Hj7I=; b=erHYrVAMWuXAlXtvyrWjO4zwE/
	IU7W/++WP7a7lcPl4N9iqUVHbj19EEA2H1VCcOwDHiRwUtovjUf09zmEu0qaaQR04iRq9kA8YV5Gl
	6Dgw0TVnVyMCnNfNv153oikB7s/6qjcFkd8hPiiLfC5GQ2zAVJwhLeSFaihqGnPYCLUAbYn48e3pN
	JwiDQgd3MCEeAES3t5W+/F3uh6GZ70hvZiT+/WI2MgoH3le5Lmn3UZigcC0W8Kxmmmv8kSdOsBmjQ
	5YHwiePW26FPLl5ETpFhRv4qo1CSDgjKv1iD7dhwwZWiJuwzHlmDvF5M+yAegocmhDDu1juHE9PWY
	JQQlu6zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7CWL-00000008Tzt-3IbZ;
	Fri, 10 Oct 2025 12:46:53 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7CWI-00000008Tuj-2fCe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 12:46:51 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-46e542196c7so17002165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 05:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760100409; x=1760705209; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=euDBh1JPBik0jtg2IFON/RfdHFmTQnkqEMlQtD5Hj7I=;
        b=h9MSiWf3rNt7sN2f4d44OI9i7Di63q1ABY/zrMODxS9nKfrNazdPvYj0EQJ8ENJ8yb
         dcgcwfAATkdWpj9vHlpDIP7lzeTACOwL8X3lVAfhGGpMJlXfnNwxNPwAFnBr533NyKSa
         3KWzicj4NXyfSMZbNIt8siw0DKLCJIcCyEpdH9PJpQkknZf0237u3ZBLwOJMHIaR9Oqy
         ba+4QVgVay0kC/oviRpTAAOvN3tb6J/rE4r5B8Iw3BY8QmuUETt0yhz4vUzGrThWMb2u
         OUJSAj+sXkV1m7oDYhwwoHqqdwXUaajzjhjp0UGufymTArRvb+hhCr0cQGnDVfCuhcbR
         Qiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760100409; x=1760705209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euDBh1JPBik0jtg2IFON/RfdHFmTQnkqEMlQtD5Hj7I=;
        b=oUetpTbO+3PMB1tA4IuTn49AQKVPWxnD5pgMPv+Md0hyhN4jsewXiNK/2ItHfN6pFu
         PuTL0rC6fbWidY53sQjsP4TU9O1g+1rGFnw7bhJ9OBUe9wXi6CNVR0qw967GPU/haxij
         JlmsBIrig5JK8WgTDgtH5y4D0pCRIupbJ4lfLublbXcqmos6VnpvqEpebJJlVAEf5mB7
         fuflW0gf/019DT3kdjytQ+R1QKl+HEq1poDmBMTTaoaEaRSPVH7NrpF0yh/GPC2ai3Gw
         c+T9Q5rQ7Nwd+paPCIY7ZytLq7Nve//Txn+sqkS6l7Y0D7FJscodPATvX3fHCJjnACJX
         uH0A==
X-Forwarded-Encrypted: i=1; AJvYcCWpjNWnHmHUAfJuQqEpbWJtqG7nD+hTuh4V3G/Z7NeTE2Dq5N+tXnPRSlwvjh1agB1EzI+7vPGjStjd10z5G+q1@lists.infradead.org
X-Gm-Message-State: AOJu0YzQrZMexxb7+4qKxG7qA1StlbgZNTYnO8l3DvySqsCMdozPILQy
	kckzui1e9g3GtBSm1KT9IZhFZmOufsYxHAEE1bQgEspftN4vUBRB4yZIGx/CwcdQORE=
X-Gm-Gg: ASbGncvSqxZqb5qTrDUrgxA1ALSlXrmsK9EQvyKjNePcOKBxvCVgAciEz9rSnAzYVDs
	0DkRScgBIL1nSVDrNVV4SxGU3EYZMCElCPUGoPfCtpPYdjCsDcgCxMVRXVfeLSkBW6c3sJ5aIVC
	T8v5tf4HAP5m3C2+xWJZklUPkrXLj6FQVYXc4OawFDeC632Fj1ryhB8G5YCbZAudDNBndJhsfS8
	kl/3kZjVDx3btSbu9tKyNvcHN1DJSVfPvSjgplyUMgtLIChHOpmOL4a47+hieFOi8GnMCOvoBt+
	uJW2vAwjbXWNPv28OYxUkZaMkCHa88Wc2gBl3ww2j5NNQ3gtyD0QJR/TnQho5PEf0i51QgnL7hA
	qwDHLgpCT++1ojOWXCENjgwDowztUc2mmad0psD1aMolXrdqlZivQueaVxdea77Ooz3Mu8WLHzP
	G5PX+WeQUlVHRMzbfRsP2QlQ==
X-Google-Smtp-Source: AGHT+IH8x0QfTr6wJYCjDE3d42CDoKbarW30rvQ/Cc2ORyEX4B7UUOdkskMSSnIc4XAyGE82hs4N5Q==
X-Received: by 2002:a05:600c:6592:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-46fa9ec796bmr84534875e9.16.1760100408792;
        Fri, 10 Oct 2025 05:46:48 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb484d056sm46376895e9.9.2025.10.10.05.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 05:46:48 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 10 Oct 2025 12:46:36 +0000
Subject: [PATCH v6 6/6] MAINTAINERS: add ACPM clock bindings and driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-acpm-clk-v6-6-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
In-Reply-To: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760100402; l=1202;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=hUk7p7wXwxuWON/P6SaBYN67C9x3HyQcVroLLSWoXfk=;
 b=Enoypv5lWz1jLL8VOiF8wE4cWDFIyo47tyJbQitxtWSbq+eKO6jjL0y+BmtW8IkT/uywAVSZb
 namtqWy2kaMATnFmk94Ffxc0XmxkNambqyqvWPYoai4R6uOhoewf3BJ
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_054650_694524_2D8A44BE 
X-CRM114-Status: GOOD (  12.09  )
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

Extend the Google Tensor SoC support list of files to include the
GS101 ACPM clock bindings. Add the ACPM clock driver under the
Samsung Exynos ACPM Protocol entry.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a27901781c2b2589a0f95678cf3df06401cac3c..6a6727ceeef67622e96441165aec542a2cb696c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10599,7 +10599,7 @@ F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c
-F:	include/dt-bindings/clock/google,gs101.h
+F:	include/dt-bindings/clock/google,gs101*
 K:	[gG]oogle.?[tT]ensor
 
 GPD FAN DRIVER
@@ -22756,6 +22756,7 @@ L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+F:	drivers/clk/samsung/clk-acpm.c
 F:	drivers/firmware/samsung/exynos-acpm*
 F:	include/linux/firmware/samsung/exynos-acpm-protocol.h
 

-- 
2.51.0.740.g6adb054d12-goog


