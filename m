Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67C6CE7AF8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 12:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UvAB0mCQYQ8c80Klm7WQAFVp/EeiM2LU4sVj8vpf494=; b=RNoScoTSip+VpdeAXAldSrb+lL
	UlPRSwszeckT72EZQXxD+eVPNgno4+ZT4npV8+TepdPUCcUUx4oRXVwbIgMKlicCZUceCj1qV+4Y+
	tnR4aDKwUa0hkqjPv9/ldIu2rIJRmA/YBH1A5sCJOF0WycgzCoXMGl5KaXhIRWU4xWwWPf4LepYze
	lJlMQ2WMdhREVUJc1UmQM0uDgot7862aLFuOzN39s38WyyBl+2msr6/8eSJ9yr8xa5/yFljSwbh/L
	TANlvy/f71ZJRJwlAuIBfOgqcx8Jbgou0g/EH2Zl0uuSk+ItsXULNg5LqTsmca5UyKIcKC7v/BH22
	1DLSu07w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsTu-0000000C9yX-1Bg6;
	Fri, 14 Nov 2025 12:00:46 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsTo-0000000C9wc-0aK9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 12:00:41 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-42b387483bbso1575600f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 04:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763121638; x=1763726438; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UvAB0mCQYQ8c80Klm7WQAFVp/EeiM2LU4sVj8vpf494=;
        b=ouJCT80MGMY5TX0+8zjAuJIpz8Qd8ASrYGmoNvxjhnHM2woFwIMNorFpwkCXGNzZox
         lw3716llP41cl2zXu380K9qk8WB0QcSH9WvwOascxDnA6qZFuPTLHB3oOCsIbREZDHMA
         ebcRju11/TdJcJlaS7agvBjxtxfNSIadnoI3jUD2MfaGSAUCC1Iqi4d7bVzLoVZkRxZo
         MjB8IQSaaN8dZKQQ+8Ar4XLrnhbxCumnRgh0XkW4YAtQJXKe8y3dgO7qYMz0TiutpD7a
         UEsMt92unKMImSjb19TzXpbo5ZWknDA8jK0YL4HQ3Qdc6XeqUoGXOM6MHmQuAuh0PMiM
         gbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763121638; x=1763726438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UvAB0mCQYQ8c80Klm7WQAFVp/EeiM2LU4sVj8vpf494=;
        b=FyWivsNPrhKAnqQzJCA8l7npmKk3HggCJ9sXGpjLXlWR3pK/PiRLypTykr676cIS5I
         WT5eQpgdnRhZOTdBTavQhQHB9upcDH/xIsNs5p1aAORHQadCf66sGvTVZ40nhlY7YlGM
         uUTUKSQOiy4nkzYAG73u0xVJKoUzZCxocB8Elsh+wk9pCCGSxDKxIk6Y5nlYRALk2wpf
         OESiniMmgU2L2Yv4C1Vum8Y/HPufcU6dCNs3OQ4M2zpf9VuEXjyB6iUBfdQZGvSmtCA3
         LqdvOLP3ZDnEu97wsl4yMxEpCmMpedC5tstbbBrUmiO1KU+uEM1yfi3Fkf2+DoCcMrO7
         VSFw==
X-Gm-Message-State: AOJu0YyIxbhY0roV7b7kKDb0dnYlzf0ljwOWJrguZvWMZxyxcac6Rpha
	jEERQgK2NtKpp8B0Ucl47yboZrYgGKjaTpDfBdSleXWKqpeVQSxnr3BP2pEWpKV4uec=
X-Gm-Gg: ASbGncugbyoM+U8ns4sDXPtIhh48Jix6S5qWMrM6/8dq6YnDp5jiaveOODonUs33ezY
	GRzZFCR8xAvVbqsZ/RmGAgb4CQF+tF7m89lYiIOS7P2OzoA4sq1Z8FiCIVE6OT5z+pg8EFJRjcJ
	F1uqK2fXkCiTS4xTEVKKgSZaz01ZVnbM0fs/ejg+k+5FvfhnY7jidIpC0heeFh51jBwFA3OBQZt
	MJ2oU+e97kobAK6P+2PHPVaalqtLhqmQNg80qqUSb0CKsaGKCL01UPsOOVBb5CS76U/T4QQwx2U
	t+1NC818hwuRjVMo5oZsJz2KGce435hO3ow8FBi9mdm7L7QA7NDlhzdQNTX2pYv/h+b/wGcj14u
	XgUg74bceVL77RtHnuY6xcgAZ5QGRYX9j/zvJ1h16N21lzP3kvEHvTGr6rMcSB18z+2R6CCyMT5
	NHjSwgoqh4TugLbLaeKQhOtg872cQ6dTAoHwPjRKaN
X-Google-Smtp-Source: AGHT+IFDytDOoxWCznl5GNdQ7r3wEaAqpdygs0quJMyPhhtYCqkt8A4W3XGhbVCI7Rkl0znQmLbd+g==
X-Received: by 2002:a05:6000:2890:b0:42b:30f9:7998 with SMTP id ffacd0b85a97d-42b5934d76bmr2913871f8f.27.1763121638277;
        Fri, 14 Nov 2025 04:00:38 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae5bsm9487578f8f.8.2025.11.14.04.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 04:00:37 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 14 Nov 2025 12:00:17 +0000
Subject: [PATCH v2 2/2] arm64: dts: exynos: gs101: remove syscon compatible
 from pmu node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-remove-pmu-syscon-compat-v2-2-9496e8c496c7@linaro.org>
References: <20251114-remove-pmu-syscon-compat-v2-0-9496e8c496c7@linaro.org>
In-Reply-To: <20251114-remove-pmu-syscon-compat-v2-0-9496e8c496c7@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, willmcvicker@google.com, dan.carpenter@linaro.org, 
 arnd@arndb.de, robh@kernel.org, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1844;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=cmENj0W8XtjYOV93TTYCBYmHtN9YboPhPdx0mxFR9/w=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpFxnhnEbiRUV2bxgCurkMI1ULYwN3pjRsDVkQ/
 Iqdy1H47GmJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaRcZ4QAKCRDO6LjWAjRy
 uphND/93WTuH9XIpzNaqeJVvHv8NtS/9c9v8swUUO444EIliwGiCxxV/coXPYhWI8QUrfPTrqh+
 1Bf3ymdvHWfKrjBBhR1/QMZ3bI2I8JYczEvAtxPSpc6qUqmV8ET09puYBhtdQERfJpo78+hsVg8
 JfJD7UXGuSvpq1fITtC92c0aUIsHGcid0RXoFFTlOyaG0nklcSIlwmyK/2d8DzxQ/28HOy6+omx
 +ysHJkTdoG3pd9ErIYABY1NmpKOQX/+bKmTZ1DIGvXw6Er0xtqd6Rzi5cHdSbI9s6xYxIi6gb9i
 EZ51sbexkWvVRRXAFf272t3IS7voZ/PbJef4NAfopXrjojS8fUT+AH4N6EX3EOj9Hgg7aJwWhp/
 eFtbMpr5stHFvqWj9bcKX6bgJf21qrgr4KpHDKkF8ZoTT5mzjoAHY4gnfJJHa6Dm/CWzyREyYtl
 kwaFEeZ3HmCtAK3vi3NVlGb51SqMQV9YRJJmS57/Rxs/qNBH8/CGhDhKeqeVq7p+vOdTW0VYuOg
 PaUX8ZHsFl2lbqbbW9UGN92azRbYAZePGPLcYMDFLUEfnM2Yl9Jn+pc7eLweT9C/4rHZNxomI12
 Cm5YGjJm64UpUNmTB6BkvVanUq7Lf1fAmB7hGzJdjCJhaEMPG63UchaVDKttcdJDrLeSRxcG+2y
 zWSCtDBgHgBu0UQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_040040_201153_D00A0255 
X-CRM114-Status: GOOD (  14.26  )
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

Since commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
"syscon" compatible") it is possible to register a regmap without the
syscon compatible in the node.

As mentioned in that commit, it's not correct to claim we are compatible
with syscon, as a MMIO regmap created by syscon won't work. Removing the
syscon compatible means syscon driver won't ever create a mmio regmap.

Note this isn't usually an issue today as exynos-pmu runs at an early
initcall so the custom regmap will have been registered first. However
changes proposed in [1] will bring -EPROBE_DEFER support to syscon allowing
this mechanism to be more robust, especially in highly modularized systems.

Technically this is a ABI break but no other platforms are
affected. Additionally (with the benefit of hindsight) a MMIO syscon has
never worked for PMU register writes, thus the ABI break is justified.

Link: https://lore.kernel.org/lkml/aQdHmrchkmOr34r3@stanley.mountain/ [1]
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v2:
 - Update commit message (Krzysztof)
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index d06d1d05f36408137a8acd98e43d48ea7d4f4292..e1a7d33fd4a369f7b352b81d2070beb62a0ced16 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1705,7 +1705,7 @@ sysreg_apm: syscon@17420000 {
 		};
 
 		pmu_system_controller: system-controller@17460000 {
-			compatible = "google,gs101-pmu", "syscon";
+			compatible = "google,gs101-pmu";
 			reg = <0x17460000 0x10000>;
 			google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 

-- 
2.52.0.rc1.455.g30608eb744-goog


