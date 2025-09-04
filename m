Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AA4CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 19:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zcywffTAPMM3Aelnx79fSslBG214GVPApnPBoT9pItY=; b=gfcfF26qXR5BF+d742aqk0dGJN
	lM02RuVhyuRPcZ0k29NtK0otV+1nkzWOp7RbGInF0XyrBD9NjBxrRTkDuG5fIui8hsKDAVgcLxNzm
	m8aszCfpdhXIBhIVMv1jm/KW7TY6DHWnxO/p2h4Cbn6it8JTImVeU7ezNTwcqB80gEBIytr/A1NdX
	n3wXw0rtJpxCB8VVQ/oFTHTWbVkukUgLx4NRS19bCUTr+VsnPu/RBKj/ItkPVK2YRz2i4DMFqYh/v
	uDzTy29o/npVI/Ws0KV5SR5jNCv++0NmJlv3hLnIfR44eUyk4JrepCA25ofkplfpwqXfXy8MVZCIx
	CAtqxDXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuG1L-0000000E3qX-0KPB;
	Thu, 04 Sep 2025 19:53:23 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuBx2-0000000CYr2-0Jp1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 15:32:41 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3e2055ce973so487739f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 08:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756999958; x=1757604758; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zcywffTAPMM3Aelnx79fSslBG214GVPApnPBoT9pItY=;
        b=aB2NKm4SpTp5ieZCRZDJ7DoA1AVT7KzPLqGU7i5uqjXUwcYi7vnhM7nuiePZOJsC36
         t2mA+JCHwCM1gr91gKqzNoOar+vMr6Z8CCj/k15TA4kZC+BKnZRWJeSPZQRIGWmVAkv8
         laN+qMFcR39r3aUzLE0QIOuYpOjcVfZ61VHUqxTptx9CoWVTmNhnHWsxviHqbeOeAPyQ
         XP+r4TsmQEt1G9/+ZVA/WgwC6UatNuXG8QE2l7r6ci8OeNXJdISP6SDx9eKFl3MOvquy
         RH+gTPVy48OGsljI5L5fIQemP5mQT5iFcaFlyDzFcQfTDMuydJHBbzCXEEVg5Q8/HoKl
         puuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756999958; x=1757604758;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcywffTAPMM3Aelnx79fSslBG214GVPApnPBoT9pItY=;
        b=GeoZ5iYgaUEGYGshFpjl6FoHmf68Mf1G9CpizQjQgpcKhV7fPdNt8GZserYtf5ibGZ
         oNSzffmE5LacdCGOpAYKwMm5j5UCLGQ72iY7XDEScfgKYICU2a28iQtjNIDl+MWwXEuU
         mqWHThNcHyktloSCq9iP+hKK8rEnnJ8BCOEkkuJKRmHslYmuWbiWFv2Gyiv6dy5UuNS7
         lpWspfUjM8YYHQa6rKFqgtiTb2g7kRLIB+wkDwwhLxg99fd/W7zTYr/+Ove7Ysh687fE
         ziTxYEDja9kpB//S0AtBz2SuK30DC/qTDMYBcK5mW0rbmvWI4Tp4BMbmR+NuH/2ZbCpI
         W96w==
X-Forwarded-Encrypted: i=1; AJvYcCVu6PmpJtKzNDw8AdzzMPTdvuTItfSERYhl1YT1MKKWuGBlAmrXCGiXYKjGeQYT/8wZ1ltLu1QzYLG/hA1Ezj3m@lists.infradead.org
X-Gm-Message-State: AOJu0YyY1qOQa3olq61ELDPr8cEAzlRnWznWUpZPwsHZNZiroA+19sFy
	oLrVpwcvRmQs90Nt2qnP9PI0jJT8r9GqUxSvHFKAlocxha4YgieBIVChPymbi8WW3vM=
X-Gm-Gg: ASbGncvfywp3/Ob2VRa5yRTiweV8Vl8rDHYPIlgz1VXlCw/I4V4GHJYqJQ4ROanmKcA
	f3E8TgQe2CrO5a/RzIu4OAIojVA6ofKmztdbBeyN029yofpo/O7SfUecJTKLmMaN5+opOj8Zbwk
	PbU99o119C8AydP+yMAKZUm+AEFxyH+Bw730K3m49IidGJkgqd0K5B0yJq5uoVagzSgAlt5w8Ex
	hfnZov/GQqiyaimdz+C3T6SmR+3kv9XZVz5bzmyM45onxho90E3MytiR0Mdld5T8eoUe0zR+ic5
	JNJzkBB/cAoChH9EldejAvduqkKYmtTpx5l/2qwnxsgUU+R9Lmiji7T68wlLDlGl6mMMvzRPG7v
	sOolWLqvOIBG+Bz+rC15WZK7M3J5o7R1f5r0Sy2YQl1UEDfurpVs=
X-Google-Smtp-Source: AGHT+IEOK+thU4lBF9QkvDsW3QAK6jUHRnRYoVFlARXInUUOYeTnV9kbJl8HLIspvAB0lbR2Tb1UIQ==
X-Received: by 2002:a05:6000:2886:b0:3e0:b982:ca5a with SMTP id ffacd0b85a97d-3e0b982cf37mr3073696f8f.5.1756999958082;
        Thu, 04 Sep 2025 08:32:38 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34494776sm27889919f8f.61.2025.09.04.08.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 08:32:37 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 04 Sep 2025 16:32:29 +0100
Subject: [PATCH] clocksource/drivers/exynos_mct: only use IRQF_PERCPU flag
 on ARM64 SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-exynos-mct-arm32-cpuhp-regression-v1-1-5d9e4dd356ab@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAyxuWgC/x2NwQ6CMBAFf4Xs2U3aUg74K8ZDUx+wB0qzqwZD+
 HerxznMzEEGFRhdu4MUbzHZSgN/6SgvqcxgeTSm4MLgRhcZ+6dsxmt+ctK1D5zra6msmBX2s9n
 HqQ8eMQ2jp9apikn2/+N2P88vx6ou3XMAAAA=
X-Change-ID: 20250904-exynos-mct-arm32-cpuhp-regression-14f321e4a591
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Ingo Molnar <mingo@kernel.org>, 
 Hosung Kim <hosung0.kim@samsung.com>, 
 Will McVicker <willmcvicker@google.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 John Stultz <jstultz@google.com>, kernel-team@android.com, 
 youngmin.nam@samsung.com, hoony.yu@samsung.com, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2713;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=ZovBSTg3+nS4gEH8MquKWObavniQvrJ/CjBnS51s8KU=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoubEU/E74sQgeTf+abf8JCGdjferSkVZiIA4BB
 SPYJAGILouJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaLmxFAAKCRDO6LjWAjRy
 uhFYEACRe7uggDyXQmWDb08QOlfPW3pieYUctnlx1bnlUd8qsbJmBmdwTnLUvDmX7bUGx08DvCm
 UOxqkOZD/FTTCfIXx9DVZKsUYEWQnlevCSJDINtIFSLakExB+yNXfTz7BQ2g7aEOlFVv96CpDg3
 7BNqnTNsy3K6awhvLIkow2aNwNAgBoX5HnQig4WTbchmFO7SGPkqIOLo7oWqhRidAY7S38TqeBS
 t1jL8vFaZpl+TovAbn0tkMzdSM9ynUFKHfPXQpG6pW78cjfLvSPSJNrZK6FWAfhcfEkdUP565FF
 UZKi1k9ZHrAqAkgMdTnPCIdXJc2RbbkCGzZf0I8+4EBS1zzO6+DeJArO4lJjDqpHkbeMoTDfxj5
 3gitcgPJ4M8XOLLegJdppIPn2VysPWxxqMeNSHfZfpAZZ2Mu0wXx58jTA/fFRf728CJcV8Op3Xh
 PWXwrdtN58YsmVBiZNY9VQn/ryGRcHyEklwMtdSjx+xNPtUO/hG0BeNxZHjaW49OD2f1lyQOFbu
 bw71aQ1JoA3GJZuKXZuvG6TPGk2NZU9nzBNIEhPugDhqsHGsDA0IdqD6VlZe5CDsjNh0LD/kr0r
 nLY/g3nGIphqaXwDoJc9GcsEkg2qDlp9nryDfIVUYt8NUdpwBiUegQZVM6uOX+sfme/Iykiey8w
 vtuTK3l+nGVzpzw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_083240_122969_3EE9EDC0 
X-CRM114-Status: GOOD (  17.06  )
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

This patch addresses a regression reported in [1] whereby CPU hotplug now
fails on little CPUs (for reasons that aren't fully understood) for Arm
32bit platforms such as Exynos 5422 used in OdroidXU3/XU4 boards.

Note: This patch makes an assumption that the exynos_mct driver is only
used on Arm 32/64 bit SoCs.

Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer interrupts as percpu")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/lkml/8c861182-7e90-4bbf-ac04-173d59f5af69@samsung.com/
Link: https://lore.kernel.org/lkml/8c861182-7e90-4bbf-ac04-173d59f5af69@samsung.com/ [1]
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Hi Marek & Krzysztof,
    
Can you test this patch on your Exynos5422 based boards and see if it
resolves the issue Marek reported of CPU hot plug failing on the little
cores of Exynos 5422 based boards?

Unfortunately I only have gs101 based Exynos hardware (which is Arm 64 bit
SoC) to test on. I can confirm CPU hotplug is functional on the little
cluster CPUs with IRQF_PERCPU flag on Pixel6/gs101 though.

Thanks,

Peter
---
---
 drivers/clocksource/exynos_mct.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 62febeb4e1decec7f5db104db395884824563915..91d79b73a96a7e8a354d803c2b497bcde92af8d8 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -532,6 +532,16 @@ static int __init exynos4_timer_resources(struct device_node *np)
 	return 0;
 }
 
+/*
+ * For reasons that aren't fully understood IRQF_PERCPU breaks CPU hotplug on
+ * little cores of ARM 32 bit SoCs like Exynos5422 used in OdroidXU3/4 boards.
+ */
+#if defined(CONFIG_ARM64) || defined(CONFIG_COMPILE_TEST)
+#define MCT_IRQ_FLAGS (IRQF_TIMER | IRQF_NOBALANCING | IRQF_PERCPU)
+#elif defined(CONFIG_ARM)
+#define MCT_IRQ_FLAGS (IRQF_TIMER | IRQF_NOBALANCING)
+#endif
+
 /**
  * exynos4_timer_interrupts - initialize MCT interrupts
  * @np: device node for MCT
@@ -602,8 +612,7 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 			irq_set_status_flags(mct_irq, IRQ_NOAUTOEN);
 			if (request_irq(mct_irq,
 					exynos4_mct_tick_isr,
-					IRQF_TIMER | IRQF_NOBALANCING |
-					IRQF_PERCPU,
+					MCT_IRQ_FLAGS,
 					pcpu_mevt->name, pcpu_mevt)) {
 				pr_err("exynos-mct: cannot register IRQ (cpu%d)\n",
 									cpu);

---
base-commit: 4ac65880ebca1b68495bd8704263b26c050ac010
change-id: 20250904-exynos-mct-arm32-cpuhp-regression-14f321e4a591

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


