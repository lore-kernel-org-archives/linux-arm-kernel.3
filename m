Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D48C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 17:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y1yIb9vlAx6eXZrDbtARLEZKJOAQuRNFkzrMMy/6d4o=; b=3LEWqomSks2G26
	Du8spWTyZ28za13A6bl6Q8NZT/ySvxUgtcBBiH3uXY2RiRrueNKO+fRLg4GN9HK/yVckQGAa4pvbe
	jQrbeOYzoDJtZMySJtAR8ksK0RehyqVimtZRtGZVWpNtIZeThCvgtlcCQodEj8lOzcAbsJXnOoJeN
	DWskEefY1xG/kJ5l8KoV0QM/3iSdeH9htmz0JnFmSbh91BnwhZtQyMiaIeeTzIg1GL50BRJVO4uhj
	KS7Nqr0tA/rDHPYoWtkzR3QCexAJGTcvTzMBshh1gtCX4ARVyfvEOyJSFQwbevqXfpcFw8huEHgTT
	bzD7l4r36ZCbxuDFVR8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Mbg-00000000M5z-2TLA;
	Fri, 25 Apr 2025 17:12:56 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8LrW-00000000CXr-3CNb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 16:25:16 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso16975875e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 09:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745598313; x=1746203113; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y1yIb9vlAx6eXZrDbtARLEZKJOAQuRNFkzrMMy/6d4o=;
        b=oossTjxdVhsjs2Em4CgUUDHwEoG1qv2WEfJphwYK8LWu4LANdviyGFNv/A4KCnFLZ5
         S8kI1LiqAvZoqIDo2BSvfeLwuKUq44ruWSTRR9Vi79saklZTtEasDouuGXvbh2Nz+Ohd
         iYMYhiYmIvYHOOGf4wTlm8cIraR86rh5rH9B6SN1HHQutH4/JgOKSx/MC35UrdK3FeHn
         jpYt0u558bYyPzAmNeO3cOcUeTIj/75/0IvptY5PLar9pxm+HGrKoCQaFNK1s2ovMdqH
         CIQDGWtV0SjjS0inlFJ2vthsaqLCNxF7LJDRDrKXls515iu6PDQyNvT37cJkb1DGtOVW
         1gWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745598313; x=1746203113;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1yIb9vlAx6eXZrDbtARLEZKJOAQuRNFkzrMMy/6d4o=;
        b=K9Xkh1Fa9h+86GFnQTUAfxGoxdTQmqZKa76reJEwKjPICbT8yArtcQkaj+Hu43Osa0
         1+/nX7q9OFSJcnZepgDNfk6d/UQK2IZOB7WnauVKIJZGtrAKE3pUxZuh578feefIWwa9
         JNEVSl07pHg0iUyJTgM6LPRgVGDdVrqZN5FUGIPr0i1We3m3uEriZNCbc/mEmSA2cLvx
         ySmKEPRhgGCcgl5JnXs8sSbXP8mYGyaLuQ5O9ThkJJflZNOY+eW7aGVkKtx4O2CQVJtt
         7cRe7b66qIAGFx8zLa7Kc2lbZtFj68Cgb37WWLidXTafOpDZ1ASc8gAroqHCzy/bRnt5
         9Shw==
X-Forwarded-Encrypted: i=1; AJvYcCVnvFN3KEHP+SedoKztr74Uf9oC3beG2es+AHRuhmwIs8faJzgZQTWQu1fQYA7R1aeEfau+B8Wo3skQwO+0wAy+@lists.infradead.org
X-Gm-Message-State: AOJu0YyhM4JP5Jeeu1HnUE54G3z92pPyXJe3mDdTdVzTyuWgBA37QvRd
	gwkGaBhbGuSoo51SE20Vq8ck5BtW+Grd7yoHZRX5NNvO5WzLbDkwW0G2Eufi8NM+CXo3cODhgwl
	QJSA=
X-Gm-Gg: ASbGnctVRA78MT44iDVfkKRjBFvrjxPsmWGq2RT1ibbEeC4fdESWJRiVQ4mzqlP0rpv
	ACai/TtYr0jTMVIcJIC3qFsCFcVEwHpCEsRk86bumvEcr9NX0Sa9s3Evt5n3VriKqx3vV4peu64
	imQjVVcGq4qb6JBVA4+fO+xaoprlkcxcxI7OBwEeNspdfNUmNFdpocIhf0rinaDIAXMwmt86TCI
	L5vyqdD+9GRSiboUjAhX9wCvBPYPrNbHTs5Y9Yn38TiglCWBDOvP2MrgfWLIK0n2ZyklNUnNShV
	gf3Qrwl3GAOTYWjc9BgylSgy2hPjkeJzOUGPOa0uunyglRuYjDDRdvQqpN/82OfnPUMNojQR
X-Google-Smtp-Source: AGHT+IFGbF/3oKoTkhJNSQEnm844Jh4uGGPVOVNnWUuScpNORw4BsrTufYm+XeqAIsbp86SS7E0SGQ==
X-Received: by 2002:a05:600c:1e29:b0:440:6a1a:d8a0 with SMTP id 5b1f17b1804b1-440ab7827f3mr293955e9.7.1745598312604;
        Fri, 25 Apr 2025 09:25:12 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8976sm61263715e9.27.2025.04.25.09.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:25:12 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 0/5] Fix gs101 CPU hotplug support
Date: Fri, 25 Apr 2025 17:25:04 +0100
Message-Id: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-0-f1530de9da42@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGC3C2gC/52NQQ6CMBBFr0K6dgxT0Aor72FY1FLKJNg2UyAaw
 t2tHMHkb97/yfubSJbJJtEWm2C7UqLgM8hTIcyovbNAfWYhS1mjxApM8DPTE6IDExcYwxynxUF
 aUrS+l6xfMNDbJlgRcFC6r019aUoU2RjZHlsWPrrMI6U58Oc4X/HX/veTU4JRslG34VoprO4Te
 c3hHNiJbt/3L161k57nAAAA
X-Change-ID: 20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-1f7ad4c45901
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3894;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=diTZhcocMiW1tt8bMkaTcLnUmNjS+inVml49QG49OLw=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoC7dksEBKjkuUDUowN+BhMHpZceFtZmK9pBOBv
 qjxR2YRyHGJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaAu3ZAAKCRDO6LjWAjRy
 uk5gEACD1s+Y324au/PR1s0PTfS0YlTi0cPocZRyxuIYsWdK1y5Sf8I7yBMghwecoa2EfRebeKO
 MS/bJ+BrSjSOEDcF+QTgBlBdxziWT5XTO3zsPrOzuIb5JkAxSB17bgkHE804iWGClr8cSCkkgyw
 OiHbuLDTwtw3bLhmdLpTehe+AHQneMInLoQ1Cgh6MHRuTbOMSJC7aE0i5KyKVGeouQ17tSDGVPh
 v6b+lXmMw3JWx1rgCTYeMR3qXhdEZGupa3oWCA8o+HdrGBSqD8JHXUR4hjJbbppoRO2CX27DXqZ
 WjhDN3F4rFkAGK3XOoc6dMgLrxlKSPBPsp2i2yA42/i+i5nfCmt7YkLncu//PD2bG+n3I3HvM7U
 BeAwEyZDg7jNSeaCLgyVsMTbLHQ5LwqlQ4y0AphuG9sNAgmqjsgRT64YgrOAEQqa3DrX6XYGPpk
 0n79FJolcZjM7asBGGS2zAL9rjncZDyJMsZC7DkOGQz/iYXUdSy+/QNSjLN5Rz9bPOBerkysdjf
 YB25WkitwBya4wErXK1X58MyYZbH3ONbcYI0vuFFU3Eg4Qr38aNhcZ/voRs87D0Cf9kVYOLV12T
 GddZJMSeMZnbFlkVmG3l9gq40fQroIEG50VAJxMq6BHDgdEB0TQLlljEFeZTZXvNmOrb66F4vAr
 J+zJ+crBbQPI3BA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_092514_818698_9B9DC99F 
X-CRM114-Status: GOOD (  19.72  )
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

Hi folks,

As part of an effort to make suspend to RAM functional upstream on
Pixel 6 I noticed that CPU hotplug leads to a system hang.

After debugging and comparing with downstream drivers it became clear
that some extra register writes are required to make CPU hotplug
functional on these older devices which use a el3mon firmware.

This series adds support for that programming the CPU_INFORM register
hint required by the firmware and also adds support for the pmu-intr-gen
register region which is now modelled as it's own syscon. With these
changes CPU hotplug is now functional.

It can be tested with commands such as

echo 0 > /sys/devices/system/cpu/cpu6/online
echo 1 > /sys/devices/system/cpu/cpu6/online
[   15.880597][    T0] Detected PIPT I-cache on CPU6
[   15.880638][    T0] GICv3: CPU6: found redistributor 600 region 0:0x0000000010500000
[   15.880685][    T0] CPU6: Booted secondary processor 0x0000000600 [0x411fd440]

This would (prior to this series) hang the system.

As more of a stress test, I ran a script hotplugging CPUs 1 to 7 in a
loop 200 times which also completed suucessfully. In addition using the
recent fuel gauge series from Thomas we can also verify that the power
reduces once the CPU's are offlined.

Note 1: It is highly likely that similar changes are required for other
Exynos based SoCs using el3mon. For anyone following along who is
accustomed to looking at downstream Exynos based drivers this replaces
register writes defined in

drivers/soc/<google|samsung>/cal-if/<socname>/flexpmu_cal_cpu_<socname>.h

Which are used by files in the cal-if folder and exynos-cpupm.c driver.

For the moment I've used the GS101 CPU inform register offsets directly
but these can be moved to driver data once we've established other SoCs
benefit from this.

Note 2: To ensure older DTs which don't specify google,pmu-intr-gen-syscon
phandle still work. The driver only issues a warning if the syscon can't
be obtained, and the behaviour remains the same as today (system boots, but
CPU hotplug will not be functional).

Note 3: I've added the bindings doc google,gs101-pmu-intr-gen.yaml in a new
google folder as it seemed odd to have it in the soc/samsung directory, but
it's likely this may be re-used by other Exynos SoCs that use APM/ACPM.

kind regards,

Peter

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v2:
* Use BIT macro (Kryzstof)
* Use gs101_ prefix for cpuhp functions (Kryzstof)
* Model pmu-intr-gen SFR region as it's own syscon (Kryzstof)
* Use regmap_update_bits() API (Kryzstof)
* Program hint on current processor (Peter)
- Link to v1: https://lore.kernel.org/r/20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org

---
Peter Griffin (5):
      dt-bindings: soc: google: Add gs101-pmu-intr-gen binding documentation
      dt-bindings: soc: samsung: exynos-pmu: gs101: add google,pmu-intr-gen phandle
      MAINTAINERS: Add google,gs101-pmu-intr-gen.yaml binding file
      arm64: dts: exynos: gs101: add pmu-intr-gen syscon node
      soc: samsung: exynos-pmu: enable CPU hotplug support for gs101

 .../soc/google/google,gs101-pmu-intr-gen.yaml      | 35 ++++++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           | 15 ++++
 MAINTAINERS                                        |  1 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  6 ++
 drivers/soc/samsung/exynos-pmu.c                   | 80 +++++++++++++++++++++-
 drivers/soc/samsung/exynos-pmu.h                   |  1 +
 include/linux/soc/samsung/exynos-regs-pmu.h        | 11 +++
 7 files changed, 148 insertions(+), 1 deletion(-)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-1f7ad4c45901

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


