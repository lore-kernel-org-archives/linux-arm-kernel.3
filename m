Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4FBCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 06:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yUUNHiuEgnPPKqI5m8ivJnCwrgRBbv9ROPeU9S0a/7A=; b=T5deOJmfvbluxMx7xa3hSRNWvb
	RFOL22RLc/3RC5fOjn8tvy65bvSiX2JGwrIMOkCiK+ygzXlQmdyO4818wqhQ0VM8cPQRkgK2pdwQg
	HiApGowECRPI71SzXVFefoi4w5H5YXKfeFJBg3p039qYo5IgM7zWv8UqEFgfefTh052OJl1mI4KsQ
	iE9/Gzbo6toND5iUjAsxHX5tcVDZ+IpTfzzuPr5SxXtY9TgR4MCLhmVKDN6b7WorBdbcwkF/y90ii
	kdT0xijpWV+FdiCP32pPWZikZR99Bjyv2qMBjABrcJpKoJclw8BNjQiyyTVjiyvtI9q9kZkElRzbD
	Ir6ig+Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v76cl-00000007lt2-0K1B;
	Fri, 10 Oct 2025 06:29:07 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v76ci-00000007lsg-01da
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 06:29:05 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-afcb7ae31caso296513566b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 23:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760077742; x=1760682542; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yUUNHiuEgnPPKqI5m8ivJnCwrgRBbv9ROPeU9S0a/7A=;
        b=Vkq1rppH+Bs1kSz/gaXSHXwjesXx61btDfHn87WupbxCZ/nheXMAaUoKWe+BVGqQuz
         vW9NV1Wigl3X0E2cjlTURuD1Pcv2sLO2Ns90LyDtlPKa+38KHSkGxU4ukpVpQ4ci/0FH
         6i8xUc7dhJeGd3ca/peUUU6waMuQ0Se72SEXQSTqGWZktsRpC6Vf34GCrjm1afpjrjG1
         aPFenquvpxyCcf9wKo4hzIs8G/LhNrjFalA216OJHok1m1OsGwt2Zi4mGi8zrAPvVS/g
         xe2FpEWXFNCdVk0dgedBqrroU/AgrIYbnAQpNOHkxIWqgRvg7A2BMNOOqatQED5QTjvm
         zkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760077742; x=1760682542;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yUUNHiuEgnPPKqI5m8ivJnCwrgRBbv9ROPeU9S0a/7A=;
        b=EzTN2iM3CRngc3iiXUkGRKyvGs1TSvnV61m53mCZNlPIXwcSOpOjvatge+oXVKeNHG
         Rq3a5+TWqBL3UYXJBcfwaniXg8CPU6kEXhz22kbt7DlXLEkuOJ8L1FI4Khvwc7BQkInQ
         bYoDW6+OpeNrZ+wb/mKJdTW0aFJrhRvp0RTzgnZIurTpj90ODRahUH11BWNL4EAbBUqU
         iGoKdeJXsL9GLSHbqG/44KSJ9k4Zevz3OjPImysll2QQjcCTU+B4pxOyXZkWyy1QWRT0
         OIfsDNPHPMv6/t0oBfhaAlYbCcPsCKk5FV1kMRUPQM2/kXGsUL/oqQRHePJGF8uPS2hM
         jRvA==
X-Forwarded-Encrypted: i=1; AJvYcCUxxoTpdhJ0iv1i7hADa5EA4z+mQ3gpYu08D4VibHBjBx67Eaaz8I42SCX3ENX0OONqvLSsMJzt4yc51P2OM2eb@lists.infradead.org
X-Gm-Message-State: AOJu0YzfnuxG9COmax9RO9nNQGCxt3A4D/RSflipBT5dlfpEhIa4Bwf9
	mp89m1MgOOIga36EojBqGEPzdgntvNvMZuZkx35k2joTypKYal6mLoG/Da8jDKB0X4o=
X-Gm-Gg: ASbGncuLgcEuR3RftWZ6p1LcWzlBrVNVAcXiJLhKPzu02etbSLhNrnidiBl38ZYq7aT
	Crlow7VQZK+v3itlqsMqWpEkVu9LjczH1zooqp7aEflCYX+/Gb8aA5fhbtOcmirexbm5JcJu7NC
	vZyHYpqEE2MfA4KykhQ1lAfxHjcvAbRaMUqWOdsvzw8UO+jz2h3tzbaMPuiQ31XARtrWhZ30phu
	DSHtS1GMA5sA7qe4OumRpw1f5t0bHI/UeoCuPsPUoRL87/Z2OnMPA7guXzVFTJFPDffPzmZd1cM
	3MEBgUKRzg0EXYdaVQPn/og6m6dtNq+70Y5oX0skt5iLBXqcLzuKymU+fQ0Knyk8Q49mAYMVMto
	D6c2LirXpXCmbjl6xt9HlpRWqliN5h5OxUu3FrNUJn2lEqwtGowPnHT7ClHQjHMW/IDBGXgo2co
	Sxd+BNK33ylA8rkiosRhO5VuPsxVRUQKBsNyIO1f5lfMJidA==
X-Google-Smtp-Source: AGHT+IEn4M2YqhFbmRC2ndhdI24yjeQJVlUILDD3ySBiu6pkd6BQr4bN8V7llojmXDE9gUYXL+O6Dw==
X-Received: by 2002:a17:907:86aa:b0:b3d:73e1:d810 with SMTP id a640c23a62f3a-b50ac4da07bmr1000402066b.49.1760077742044;
        Thu, 09 Oct 2025 23:29:02 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d2a76499sm160895566b.0.2025.10.09.23.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 23:29:01 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 10 Oct 2025 07:29:01 +0100
Subject: [PATCH v2] dt-bindings: soc: samsung: exynos-sysreg: add
 power-domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251010-power-domains-dt-bindings-soc-samsung-exynos-sysreg-v2-1-552f5787a3f3@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKyn6GgC/52OQQ6CMBBFr0K6dgytIOLKexgWpR3LJNKSDiKEc
 HcriRdw+d7iv78KxkjI4pqtIuJETMEnUIdMmE57h0A2sVC5KmWeVzCEN0awodfkGewILXlL3jF
 wMMC655d3gPPiQ1ILR3RQWnsq6lqqNjciLQ8RHzTv1XuTuCMeQ1z2E5P82l/v8ldvkiBBt4U0p
 awsmvPtSV7HcAzRiWbbtg8bw49M9wAAAA==
X-Change-ID: 20251007-power-domains-dt-bindings-soc-samsung-exynos-sysreg-5dd349912b0c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_232904_252449_0DA1791C 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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

On gs101 only, sysreg can be part of a power domain, so we need to
allow the relevant property 'power-domains' for the relevant
compatibles google,gs101-*-sysreg.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- limit to gs101 only (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20251008-power-domains-dt-bindings-soc-samsung-exynos-sysreg-v1-1-ab41c517dec6@linaro.org
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index d8b302f975474a87e4886006cf0b21cf758e4479..62bce63a1557cf425a651de8864f350b0c46b1ad 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -73,6 +73,9 @@ properties:
   clocks:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -100,6 +103,16 @@ allOf:
       properties:
         clocks: false
 
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              pattern: "^google,gs101-[^-]+-sysreg$"
+    then:
+      properties:
+        power-domains: false
+
 additionalProperties: false
 
 examples:

---
base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
change-id: 20251007-power-domains-dt-bindings-soc-samsung-exynos-sysreg-5dd349912b0c

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


