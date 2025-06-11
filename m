Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6167C71131
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umjNWPKDERjTwunqlhctbYZ5OjrmC9Gy7QVgvFKys+c=; b=g3oxVsFWrYqpOI2X18uBbg8/gf
	JOqsl0wwXsLIrs6BVszQqFWGfPzCH5xdKSCxFzLWHESw+ly8ZU59k5cvZPwio6OY7iX+GTztRDJRV
	60+sdc0ZdQVInX1AO0isPr0i+Bk4ERV/XsEkJzYu/0F4o2YL+54m2LcxDxayupsVy45C4FbZyPEIa
	dP98i+luGbr5V/kkT9R/n1PgmNtGRQxG0I2PstLOVlzxu/Utt/CWF2sLAfaoZx/PCH98R1a+Igi3S
	CGekURAfsNTJmSYp0fYaUWCz3n98VMHapUFXtUYxQspdjtizbF5NPtPVuorr5j/lRbJD1nBt6fMmH
	Ibp8nBsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMkx-0000000A9eX-0kCo;
	Wed, 11 Jun 2025 14:48:47 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHqt-00000009UFm-49iM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 09:34:37 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-450cea01b9cso25247105e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 02:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749634474; x=1750239274; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umjNWPKDERjTwunqlhctbYZ5OjrmC9Gy7QVgvFKys+c=;
        b=L/uQoB1ZAWyiopJBvyBxseWlGXxlfBCGhRLvrmO7QpZD85AnkZsqy5pjC6pl2hB6Bx
         xhN4TaOvgXYQmLKgZUYaiktl9RKJWat3LyxCETPx8FW5Ew1XkIlfxNq9M1JKiCm+IbQN
         8FhIzyOZ31yGzg+LvTrAy9j0+a3+UpqPmPzWIhqFPwDAdIiRHfTUCiUMVYcp/MZwZ5ng
         V0oxPa97AJXRjF/efKuuwuVj+VF4DLw5QNQtDVdNxtakC2nhDy0U5KS2MaCWrrVnzciV
         5B+kzLDLB0Oi0gwXKCfF4VYDFwOeprThNwZDCJpwHi5xEQrhzL/j1A8UEZx70MzEQ3Fz
         B5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749634474; x=1750239274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=umjNWPKDERjTwunqlhctbYZ5OjrmC9Gy7QVgvFKys+c=;
        b=P2ZYPdq41O72WVyG/QVpWPgvQG6wJhwJU4qCw+DC5i2XGNaXCfs2SWVWw4DT4H3uIE
         QyPviJdzDWXLi6x6pYYwALS4u5/cCJySqh8n7FXhBNk8GC7ccCMw7/REn7CJK9bmBja4
         b7VXWpvHJ+UMmbMt6mf6zi46sD3VQiNfJSxTuccNFlT5l4YLOooJUUbKdtkOeuwpNtOo
         Vv5uEGc2FbiHLewWGER/bAh2H0B7y+raQ3XgTLVZFWavAFhLTN84shtool+92ctLAW+9
         1rv8LB2YEtcunKY7cDb1yF9Bvlo4Ck2vC0OwwD1KOqbCsIaX3+l3owZtf9nJkxWiRfsO
         EZiA==
X-Forwarded-Encrypted: i=1; AJvYcCWh+tFDLrWo13kzuYxT382ryYemCABlO3RmN/UUHLptfcrnI7X9R0LIQicJmxiJIa69HYRy+5fo4+/D5Du2AVH2@lists.infradead.org
X-Gm-Message-State: AOJu0YzLl6Xg1u+UuCjs6KWBSrS1uGjskohF9QV1ex/Wj/TO5X/VFxm0
	5Qr8eYoD6SodnY3Mi78udl+E1kx3BcqvfsieUD2lJB6Zw7lXdd+muy/IOm7pG5RUHCU=
X-Gm-Gg: ASbGnct6HWUbzbYhXHzM/nWXjffPPiTTkmIEWV+Q/RtQLS4MxkMr1swoPG20jYsm3+d
	JiMEYBKOeC8pGj0r+P7GMro1FhGOlCem57hfsq68tA8V9GnFjAUrV3TwjNAEVgKJSSVy1o9gucP
	wooFdTOl5hi7UshCjxp2mM1AZ0IdV4PywmGrXk6z09vMXy/i7tpayyiMzXB+kRv8omsl/xUGNWs
	RzE3cgIMLxKTSd+H16FtHlUyF22/OrZ9RKE3oh7rWNq9h7jJVVW1Hbj7ESWiF/tPRWtLrAq8T7S
	4oxtPi0G2CPpMuE6mBaLLj97W5raPaRCQoqJfkxNLM4xEJBjMg+G0d8BM6+gxM9dJlPFO6d0hg2
	oSVl/p/iWZt5kWpo=
X-Google-Smtp-Source: AGHT+IEWBMj7CqwS07MNQkBH5I2Kfcy9sAeVsKYwFR/3Yu7E4iKy8d8DQwqF6l9GtrYs6FgzlssFCA==
X-Received: by 2002:a05:6000:2913:b0:3a3:6e85:a529 with SMTP id ffacd0b85a97d-3a558af7c26mr1878681f8f.51.1749634474379;
        Wed, 11 Jun 2025 02:34:34 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453251a2303sm15467005e9.31.2025.06.11.02.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 02:34:33 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 11 Jun 2025 10:34:25 +0100
Subject: [PATCH v2 1/2] arm64: dts: exynos: gs101: Add 'local-timer-stop'
 to cpuidle nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-gs101-cpuidle-v2-1-4fa811ec404d@linaro.org>
References: <20250611-gs101-cpuidle-v2-0-4fa811ec404d@linaro.org>
In-Reply-To: <20250611-gs101-cpuidle-v2-0-4fa811ec404d@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: William Mcvicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Will Deacon <willdeacon@google.com>, 
 Youngmin Nam <youngmin.nam@samsung.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2031;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=GNkE/x3QELPf9uEv5AeKZxVXHxNGOdHNzMbUcWU+Scg=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoSU2k/uEPXjihPn+w3dlTSEkJlfoWeDSKU0p9w
 37LXIXg2GqJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaElNpAAKCRDO6LjWAjRy
 uoFuD/4rGwT+igTL4ZuLmclGc7CRg4Sw/1TwTnyN/BTh71f9GewP9YV0B5cusbH9f98FQClTs3t
 wlhpRQ5saF4lj4s9lSZqT9xYZvQ3Hh4gEBANrlSHI9jnXEFC9JNHy3JquCOrca1+a42gelFj9sb
 Gwu8TyFvQAepHFY2wcimsvIge+tM2W30YChXX3EPhlIrCLyqS1d5FwrI7j+1mt/OQpPBTaoKqFU
 ysYc9R9aFw6gnrpcAMNEH1Bvn5AhE60ANyd+o31h1vsELt8qaXTZF9GLhX3H9kDN8wowQnEg3MX
 iWjNvc4j7U4jLJ6RgQHVuk/jy0KodAYRcG4LcygKwimHECJFP8KYpg/SKV80OC1rSm6hWTL3PlZ
 AOFlU121+clnRJpOrm0BF9qIqDCqiAg/cO2V/X1stE7AoGqwTpEg0Df4zhhtDS3Zmvpw77XlsYT
 xxt41j0W2Q9AtOtn2qzPZ18SKm5mgWJA1xpYqxolsUIowr5acU7awSS58TA2RNoT9LizOZira5S
 sUQLhrud89K8X86RnjbzXCu+fmNwUFxJ711+rPE2rblTKwO7YakhcPKGHIUQyFo3ehSfGYMnmcr
 YbgwwmBbfsaChKEWGs8WHBP8caa8+CcpJpodG/ZfdNCpFsm3R1o6l3gak+Ohm2qCH/WG2bN3ctV
 fCxBW9dBst6tT8Q==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_023436_039976_9EC22039 
X-CRM114-Status: GOOD (  10.83  )
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

From: Will Deacon <willdeacon@google.com>

In preparation for switching to the architected timer as the primary
clockevents device, mark the cpuidle nodes with the 'local-timer-stop'
property to indicate that an alternative clockevents device must be
used for waking up from the "c2" idle state.

Signed-off-by: Will Deacon <willdeacon@google.com>
[Original commit from https://android.googlesource.com/kernel/gs/+/a896fd98638047989513d05556faebd28a62b27c]
Signed-off-by: Will McVicker <willmcvicker@google.com>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
Fixes: ea89fdf24fd9 ("arm64: dts: exynos: google: Add initial Google gs101 SoC support")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 48c691fd0a3ae430b5d66b402610d23b72b144d7..94aa0ffb9a9760c58818c0417001fd187b048ea8 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -155,6 +155,7 @@ ananke_cpu_sleep: cpu-ananke-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
 				entry-latency-us = <70>;
 				exit-latency-us = <160>;
 				min-residency-us = <2000>;
@@ -164,6 +165,7 @@ enyo_cpu_sleep: cpu-enyo-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
 				entry-latency-us = <150>;
 				exit-latency-us = <190>;
 				min-residency-us = <2500>;
@@ -173,6 +175,7 @@ hera_cpu_sleep: cpu-hera-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
 				entry-latency-us = <235>;
 				exit-latency-us = <220>;
 				min-residency-us = <3500>;

-- 
2.50.0.rc1.591.g9c95f17f64-goog


