Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36580CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RdHOLLqwx7tJvI93Mas6xLDQ23Ec8f9ZA36n15YArp4=; b=sOU2/QYdjU9AbCXw4rP/ccmauf
	2Iu2dYLiLHZ95jUmECXXHhuWX/shVx7/VsyZXbdn0zx9KF+ud3XAE89wt9Z8Nb99GwhBTW/HSUJ82
	jo2xfSVlWoV5DpaavY2Abq9K3PLIBYwvL9eCbbFZ5rhBIY4ERuvJObZLfMue8tdjDkiWg+VOUVBth
	m8DXz9usRlri9n8ewSFTiGS1l1P1YkTapqnvCGBE7MhOUG3N0E3zPuwrMGh/qS+sfbtAglsS9Vb8z
	Bh3l9QQNt4zSkkMHF+BwdUDe1cAbF9O1Ri2IbU/71O4MrFqgWkZ1rdyhwsiTvBQvaXJCO18hHQIgY
	u3hP7B/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugVN-00000005R6T-25r7;
	Sat, 06 Sep 2025 00:10:09 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZFN-000000035vb-2Z03
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 16:25:11 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3dbf3054ac4so1282724f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 09:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757089508; x=1757694308; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RdHOLLqwx7tJvI93Mas6xLDQ23Ec8f9ZA36n15YArp4=;
        b=jrqN2MCsY+fS4oneQ5IujPqujXDcJ0Cp7JL1l5NKvcqKzzwdjm5iha4mCx3DzS8Thu
         RtGDdFv9BZwPM58cXm7iu2z2/l/MF0hiDC/6c7AaGMYbCuYMqcDMlg166/+kVj6jhooX
         SzF1Gqod+rW+sIoGnlj/FYHoPMBt6c9juAvOBmTdwi7lekKSSsQqY2/rFKaJ6FLeBg5G
         nm/Ft6Q0SbvpyfU1ehItydMk1ox9XgwKvZ33oi5gI3LPTM+jKfd9Ek1YXLWQaYZEfaAB
         UVO2WdaNbYWvHaW8RH9luM0ltFz1CKbztCIEaBdRN8VGGUjbAmTR7hkcTAFu/CCDRhLj
         TroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757089508; x=1757694308;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdHOLLqwx7tJvI93Mas6xLDQ23Ec8f9ZA36n15YArp4=;
        b=wxT3PzNaEuHq9XOm6Y48yPbQlEn8PiUesWwVW7UnwJ6Kgk8Uc8TlHsUE1dg36RmeiM
         O+TqIuiwX5jhyQMt/hG5w4Qdk+JFAQD98KxnYU29jJT/4mFEhhv3FrSP2gJKWwcgQ8Yk
         NSOYbtbGCwW/X1/6njRbu8xj5xP7pO98t+Ep7rUbqfXNAwAp7KdXBCT3KtmZn8Ryg6qm
         Bk0RNx1P7+XfWAfCmn9EkT+Q3qWx0Z7orT/+xO9SGGSB91NQX61hlKWRsWOwldKm84bd
         +4yA8zGDtcDffyazPMmMDNXEVIb+Aon1hNdlJfsO3xBD3vtIjYzH3mRbZ8giKeitpBSm
         RXNg==
X-Gm-Message-State: AOJu0Yx0x8GvM9BFdvbB+Tc4wjuVEe2DV8eiva/F/4BlGAGzAte5rbWX
	rATCbcoY4BRhp6isJmZmIzhkfbzQ3ix7lGILBm9PSzqEATK4LLdRnogsospi5JEgtKKmkV5CazZ
	/oP/orTYwBSLMDaW1BIgd7dL9UymBVT9LAI5Z0YG3g8NXN9MnEMqIB+kdgGc95AXMB+TQiaW7jr
	ojTeBA7k7MJOeih4XbJLX/PtYUIw57CqZFKlE2kef2syosiXnwd/4b2mVPEsPOYKx+CA==
X-Google-Smtp-Source: AGHT+IFCF8RSEKc2M561aTeMp6Eg3cFM8Srz5/Q2pYIUE/bN9+Udlr5Snzmc+NupcbxxSPDUPWNVnLF2ct7JsA==
X-Received: from wmbhg14.prod.google.com ([2002:a05:600c:538e:b0:45c:b52d:d2ee])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4284:b0:3e0:152a:87b8 with SMTP id ffacd0b85a97d-3e0152a89b4mr5750276f8f.8.1757089507832;
 Fri, 05 Sep 2025 09:25:07 -0700 (PDT)
Date: Fri,  5 Sep 2025 16:24:46 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
Message-ID: <20250905162446.88987-1-smostafa@google.com>
Subject: [PATCH] soc: samsung: exynos-pmu: Fix for CONFIG_DEBUG_PREEMPT
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: krzk@kernel.org, alim.akhtar@samsung.com, 
	Mostafa Saleh <smostafa@google.com>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_092509_694201_D71C5522 
X-CRM114-Status: GOOD (  12.15  )
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

Booting the kernel on Pixel-6 with `CONFIG_DEBUG_PREEMPT` prints the
following WARN:

[    0.784187][    T1] BUG: using smp_processor_id() in preemptible [000000=
00] code: swapper/0/1
[    0.784328][    T1] caller is debug_smp_processor_id+0x20/0x30
[    0.784433][    T1] CPU: 6 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.1=
7.0-rc4-gd69eb204c255 #1 PREEMPT
[    0.784439][    T1] Hardware name: Oriole (DT)
[    0.784441][    T1] Call trace:
[    0.784443][    T1]  show_stack+0x34/0xa0 (C)
[    0.784453][    T1]  dump_stack_lvl+0x7c/0xb0
[    0.784460][    T1]  dump_stack+0x18/0x24
[    0.784464][    T1]  check_preemption_disabled+0xf8/0x100
[    0.784470][    T1]  debug_smp_processor_id+0x20/0x30
[    0.784476][    T1]  gs101_cpuhp_pmu_online+0x40/0x108
[    0.784483][    T1]  cpuhp_invoke_callback+0x188/0x2d8
[    0.784490][    T1]  cpuhp_issue_call+0xec/0x240
[    0.784494][    T1]  __cpuhp_setup_state_cpuslocked+0x140/0x2c0
[    0.784499][    T1]  __cpuhp_setup_state+0x58/0x88
[    0.784504][    T1]  exynos_pmu_probe+0x2a4/0x380
[    0.784508][    T1]  platform_probe+0x64/0xd0
[    0.784516][    T1]  really_probe+0xd0/0x3b0
[    0.784520][    T1]  __driver_probe_device+0x8c/0x170
[    0.784524][    T1]  driver_probe_device+0x44/0x140
[    0.784528][    T1]  __device_attach_driver+0xd8/0x180
[    0.784532][    T1]  bus_for_each_drv+0x90/0xf8
[    0.784536][    T1]  __device_attach+0xa8/0x1d0
[    0.784540][    T1]  device_initial_probe+0x1c/0x30
[    0.784544][    T1]  bus_probe_device+0xb4/0xc0
[    0.784547][    T1]  device_add+0x4d0/0x700
[    0.784550][    T1]  of_device_add+0x4c/0x78
[    0.784556][    T1]  of_platform_device_create_pdata+0x9c/0x148
[    0.784560][    T1]  of_platform_bus_create+0x1d0/0x370
[    0.784563][    T1]  of_platform_bus_create+0x234/0x370
[    0.784567][    T1]  of_platform_populate+0x84/0x178
[    0.784571][    T1]  of_platform_default_populate_init+0xf0/0x120
[    0.784579][    T1]  do_one_initcall+0x68/0x2d0
[    0.784585][    T1]  kernel_init_freeable+0x2d8/0x358
[    0.784589][    T1]  kernel_init+0x28/0x168
[    0.784595][    T1]  ret_from_fork+0x10/0x20

As this value is only read once, it doesn't require to be stable, so
just use "raw_smp_processor_id" instead.

Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/soc/samsung/exynos-pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-=
pmu.c
index a77288f49d24..338f4758a089 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -338,7 +338,7 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
=20
 static int gs101_cpuhp_pmu_online(unsigned int cpu)
 {
-	unsigned int cpuhint =3D smp_processor_id();
+	unsigned int cpuhint =3D raw_smp_processor_id();
 	u32 reg, mask;
=20
 	/* clear cpu inform hint */
@@ -361,7 +361,7 @@ static int gs101_cpuhp_pmu_online(unsigned int cpu)
 static int gs101_cpuhp_pmu_offline(unsigned int cpu)
 {
 	u32 reg, mask;
-	unsigned int cpuhint =3D smp_processor_id();
+	unsigned int cpuhint =3D raw_smp_processor_id();
=20
 	/* set cpu inform hint */
 	regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
--=20
2.51.0.355.g5224444f11-goog


