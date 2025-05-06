Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE62EC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w20yKHQ/VSVhNuC8t1SVSALz/E/ETSO4xbDb+FAhbzo=; b=1fVyjTk/2RxdxJEpKdTTFJ/ypX
	kq765C4JJnf3aeOK1vrHnAe9QNmcreOjqcOyTdVTPQgrAMsBhasM80JJ+qFiLk0j4q7I/CaTW7gKe
	xDjOyOjq3301tNnI78lMt63cdwcNwijIefw1zGmitz2msmIhvo+9VeSa2HSrEclsLkAWzw7Rznhpy
	vy0F8Bih/iVRkyV4mcRiPpiAGuNlRUiLQVfSVvZQVu9LeXLsvu7zuBNYd/3W7vDayjU7+1XCDNb1n
	b2BjicZJ/zxTZQN9+FXiGiyUaGcSUAPxXBX9SypK/zFMjn9ehWMFUw7mjsQOUVx2g6fzkGkhKnE6s
	QAisZXgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUb3-0000000DvN0-2jUp;
	Wed, 07 May 2025 02:33:21 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCPMH-0000000DOQf-25Rx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 20:57:46 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39efc1365e4so2978315f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 13:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746565064; x=1747169864; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w20yKHQ/VSVhNuC8t1SVSALz/E/ETSO4xbDb+FAhbzo=;
        b=DVkV/g+OOwIci0XYMtV0fR9FIaoYtC7N8huLyli1S7lYi3mXrCupD2cKavPzj/7uUG
         NjX/W5QkxlRFsRszzMeQAy+EEnlh/plzGYyAkOsGmmIjK749B4//Waco2g6+xHjkM4Hh
         YSLrpyWE87UaeZK9Qd8tEuakkscSSFhNIKHet4CZuCvgYO6mWQYT9JsbWttXjQiFT2MS
         btK68iMKKAm4r51h0X7yPLStKBxf41GIJt+Vz11cktsfTEckWb89LOz4S+v1hx6uFJUK
         USZqVfVL0AxQuxlVcRszCfUylIU4AqqAigXlmH9c02KDTsAE3N+fwxCwI2nux1nLwmn5
         GSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565064; x=1747169864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w20yKHQ/VSVhNuC8t1SVSALz/E/ETSO4xbDb+FAhbzo=;
        b=wj8OOamA+lJ0xJRI/prmUhSnXzEIOfiak920ozn/IbnDQloD5axVWrOl96jWZEEalk
         wRwRokWmGTjT2wy6p2947avZDYOC/nXiw97ScMmCVchRmdfeVO5iYxM2ZJnuZtasYg8B
         /iXhrB8bj51Mfcq1uEiy1YPo4f6aFbUjFHCPU/e2B3fxJjb9DBg5OE7Nl57W+3TU1Y5/
         8H0YkDJs8GfWV9/dlqOuFxxnkY3AKZCSd3KouRQggss6G+lH5227Z9KZt5gQk6OsY789
         ErjY0XBXYz9GMi6ITVCW/meGL8wVka9xY8PMcOe+7+MQ0hqIUlL6kxjGQWYUc6YS2Fm/
         ALxA==
X-Forwarded-Encrypted: i=1; AJvYcCVBohxwMwHtVlreKYxoWW8br+JuGcZx+QQOcPd/AQU3TVakyy685CggFBRB8UocSX86JI8uO9XP04WL3uJx+fRA@lists.infradead.org
X-Gm-Message-State: AOJu0YxNK5NsjqW4afCbvxwEJ5GqRoEZy2UOXNoP7INO23CFY4Gk0pRw
	9WQQrOP9KsEL8E/o88/Ve/kVYekpQoaMG+vkg6tYAkHvBDA41hXnTww7j/RPkZc=
X-Gm-Gg: ASbGnctIBS4yIcXZ+Mh4j62eCRylVadCnUKX0/ZjZxvbZ/grLKLvYu5ygYn0rCBu1X7
	md4rF5ct8td696TBgbC+eaK3hezea4ZKW9uRb77/PDL7gUpQgzzunqOy6NToJKBe7Ds/PcA0SMV
	LhAryvaiXoTjjXiRC5JY6Lx76EyNPYNsBpVeSpPPmxeAVKSifYnsLV5bVXQlpHAuQ37kxKNmFPD
	32OfJjy7a+XAJass0VOLEeRLqhObam7I+p4T+sYw8dsz0YZuP+B9t5z/+TCd6fVVYnnk5hGkqbT
	adD1Hty4dKrlCKFn0bjCdjF7+9zpCIsckC5bVOp9ibnyruh7aMfFIrE3TiiF46iUICHyxCs=
X-Google-Smtp-Source: AGHT+IEHZ0blTjnSlV/EPtId94yuTdz1C0toPOnIazWac5TNz+KDNfJ6QwNDagUaD8y8nOUEcFWNqg==
X-Received: by 2002:a05:6000:4308:b0:3a0:8c45:d30e with SMTP id ffacd0b85a97d-3a0b4a29b29mr683571f8f.35.1746565064232;
        Tue, 06 May 2025 13:57:44 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17022sm14671826f8f.89.2025.05.06.13.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:57:43 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 06 May 2025 21:57:30 +0100
Subject: [PATCH v4 4/5] arm64: dts: exynos: gs101: add pmu-intr-gen syscon
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-4-9f64a2657316@linaro.org>
References: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-0-9f64a2657316@linaro.org>
In-Reply-To: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-0-9f64a2657316@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=4fZ/jxB4g1jcf9SVpmhQ0BzBoZuH09GvNuVPULW3X9w=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoGne++5M5tw0yZYXWJclTcP2v4BRbsiSJlh/WX
 zPJy9E3VG2JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaBp3vgAKCRDO6LjWAjRy
 uuQUEACh5qGJv5Dgc9udkLYbNGA/60GYzyuVZCZzlhzGuB0KXzN4PNcnph4oyIVC1wYr6O31VtO
 5XOH0vwMt3WLDjvHMK0YwNMxjvdwEJqTvX8vgvvIU1NODDV4yCJG4paaniAcQHm7vvUM8kOYoP/
 lc+9FVCg1MXUI48lBjmtdFLbyaaPkxYc2QyF5XX4sAmQTGYAwIM4ZzkAwpnT6CF3IVIBfn+PUob
 Y8lUeTTQWrjLid+xtRUBAcRwVSv+ta/NA6LV05vtWIva0o4xz8627ThmEwT1E8J0kLQ6keS33c/
 LKSGdkfTPxcFWduBPheYdQEhTQfKYfCd680sroltfBxkUFmwBr+EypVQg/QDy+NHXEmJFfKsv6A
 kQswAFIAWkwMczDOEQG6d3RAPCJ5ytVNnxrfkyLoZC9f18X9OWGS1CsdhrLJIdBHe+MzvjpQdaN
 4UEc2JeLzTVvqHdF7JmwzaJD0kpAsH0Y5KoYE1g5M8rao1cbV/BKoaq9gAMF5BVt82+Ug2cowpp
 7zTqxRz7NN8KPacP5TCxyWhmPMqCGZ3RQsMjyJFkcoiXMjPf1kNjH1qikpcEUOWlD7Uc0Txvlwq
 fG7B0croRb5oXv9dQ4h69jOyLUN/77vDtLW2Q1JgU6bYsdjI37+XrDCfJiHlMcMPn/Ogh3XSG1N
 /r2HAItloyh+hBw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_135745_540287_3FCFBEFB 
X-CRM114-Status: GOOD (  11.18  )
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

Add syscon node for the PMU Interrupt Generation registers.

Additionally update the exynos-pmu node to provide a phandle
to pmu-intr-gen syscon.

These registers are required for CPU hotplug to be functional.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes since v1:
* Model pmu-intr-gen as it's own syscon (Krzysztof)
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 91cda7758020563b2c5b5768d8921e87b1f4231c..48c691fd0a3ae430b5d66b402610d23b72b144d7 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1405,6 +1405,7 @@ sysreg_apm: syscon@174204e0 {
 		pmu_system_controller: system-controller@17460000 {
 			compatible = "google,gs101-pmu", "syscon";
 			reg = <0x17460000 0x10000>;
+			google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
@@ -1434,6 +1435,11 @@ reboot-mode {
 			};
 		};
 
+		pmu_intr_gen: syscon@17470000 {
+			compatible = "google,gs101-pmu-intr-gen", "syscon";
+			reg = <0x17470000 0x10000>;
+		};
+
 		pinctrl_gpio_alive: pinctrl@174d0000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x174d0000 0x00001000>;

-- 
2.49.0.967.g6a0df3ecc3-goog


