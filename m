Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BAECC6B24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FkSrvzv025Cve3dpst5Lo/aC86j8VHVRGBxCGikq32Q=; b=1HPqFvZ0/eJVRRBbeUd/+zA91o
	AGGieBMwa2uSXI6Hze3SVn5D/ZtOuzDcaOH8QAgroRmR9nABYiqpLrA1w5x63r4F28vwDuXxQ9TII
	Rrs5YRV6ar050CSLhpwlmZKFj60K7a5HgSdiKWYprVRiaMZ8pqnjk6OdcvDBIi2EbukRHsSvyrWeP
	YWlIjJ8XWQDyi0cJHpyqQKEE/RQyNTRaXT+xU6XFVzxz/jfKl+xP7K7mgZ3qDPYLx/eADDGgTMjgX
	Tb4kZMpSn6QxPo8so3mrVv1J5PVqf3ZzVz1fo4glD//bHI3pz8tfPlK1QW2jp8rV+jG+J6lQyYz7X
	Y52OT1HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwjb-0000000FGgS-3wJQ;
	Wed, 14 Oct 2026 11:01:24 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwjX-0000000FGey-0MZI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:01:23 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-35c76e9614aso1980095eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 04:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1791975678; x=1792580478; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FkSrvzv025Cve3dpst5Lo/aC86j8VHVRGBxCGikq32Q=;
        b=f+aY8+oZCocKJmaLsO+aphVoBGq1fLUQKnCudnNIsOjMI+OIT5gKOWxwG038YL4cvZ
         zNxlhmIwY16PnAm+eAIOJJoi6EG0TimgSHIfTGKOev+SOdlrAza2L1/AWOjW+xGlKjSL
         R+1PIV08D7kPdEqbeaS42H8p8WTqxKo6OhnAYX38nCknxYYKRbdI/BgNdMQKgVmnso6t
         KNLRite5rIjYK+7G0JugPRbB4NUAKYefMlLujKqRqhX2Tg5ypb9z8Y8pUSPqRe7Xrk2W
         pInjbnkp77fOfyK/mHyFbSZz07X0V1aZCRksD6khMEm+qON3eFgAdMHmSuUt+McjTVoA
         SVow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975678; x=1792580478;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FkSrvzv025Cve3dpst5Lo/aC86j8VHVRGBxCGikq32Q=;
        b=CwDblX/cHjP6dEm8JSU6F0eOy5ESRSM/d7HQysc1Ld3QSSqsE8istPU6gk5VPVkABN
         0ixFosWxiAqJd3krdxu9iFN374cxUwrRHrMVvA5pfUuTM2oKtSjkhDTCkJAB5hytIBdG
         t9eSqRd20hfGYsyKL+xdHbtbEJfxzPt1owEk+SQQr8vqyRozcnfTNlIBB/3/3Z+Omtqx
         +lM0Z7iEk8YHe27m/nN4dPtYvL0D6eNa0e5em3OoVHF9Zk5h3+Fy8QM1Ghm/Ub3Xj/a3
         jJF53Y4XXHVwfD8ZaZnAWZsHDfoTeANotnFumJQsL+rpvoCnBLXyrBQ8YmOU1u1SI5pg
         aXmA==
X-Gm-Message-State: AFq9FYKh/WdNLDjvJ3CMYLf5FFN3dZvK3hgmI+VbS/m04RYCHpKdwqM2
	8Z3MWtTyQovURR3L7ZYjECMvTMU6diTPFgMscCssCWT+4RGpWuzHdB8aVMAD7W7kG5utYxajXHn
	pMl4828zn/w==
X-Gm-Gg: AYBFou1lMFXW2OVk+KIPHccLFa+E5zXA1TIZcDlqk+KsrKMe3aPAHaxUgjDWHlkuyUb
	vScqKRumV897+3BKnZCjb69CgftPImViPZsMxPmWXXEJhftGxfWjYrV+2c4feSd40tRwJ6oQlvi
	JPzMyG5MfQnMeyYPRK95Bzfl+5CIGHUsP4B1OS3HFJ8DLJItI5+PNHF9hTorPLZiCwlEAD099H9
	bR5AQOUwrqKNqrpVniKkdYoNhDsthb24UCOF+5gCK0RKu+0ZezrMcVGk8UH85VXSV3lYa/C/38W
	N1HYrvVyjmNkxqfQWLydzgfAk+w8DSOk449ouMZX9gELNUzQtJuOMDiO9sDdo9ZJ56aK6VG8+WL
	Zu23tRLVkB3zrM2qaJ8+F0pL2ujXKq2TgKaHKadeDRHQyzUI59uoJhR/NHCKjh0rd8rTm53s1Ed
	LWqVAtQMIs4sHHK3m5cZTHllsP6dZVF8TTXamvrPKvKZ1+50XSMmEP3D/TX3PM/EHgmhRf6QaIz
	KV5PKjjw1oy
X-Received: by 2002:a05:693c:6089:b0:35e:2c6:d46e with SMTP id 5a478bee46e88-35e02c6dab3mr2383001eec.41.1791975677968;
        Wed, 14 Oct 2026 04:01:17 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:bf23:2386:c0c:815])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b29c2f861sm34407993eec.11.2026.10.14.04.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:01:17 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 14 Oct 2026 12:00:43 +0100
Subject: [PATCH] irqchip: Use named initializers for acpi_device_id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-acpi-irqchip-v1-1-821917378de3@thegoodpenguin.co.uk>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0MT3cTkgkzdzKLC5IzMAl0TE0NDo0QTE0tzi0QloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loA3pC27nAAAAA=
X-Change-ID: 20261014-acpi-irqchip-44112a44978a
To: Marc Zyngier <maz@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>, 
 Samuel Holland <samuel.holland@sifive.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791975673; l=5723;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=H07bD6qOZsBemHcEi3dRq2VupQcxtQJdhbKbUJmW6II=;
 b=KnGKX2c9fWwUze4Svws/LFuCXmSjykvlWpd8zJPn5A8/r2ednT1o1wRjZ0QUBNLebrGroghet
 EK4YT/EWBN+AaFhTQJeuZsJsUCL1FJ8jkPJNl5FLjNyMpEu+CRmzxCq
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_040122_180132_466617E0 
X-CRM114-Status: GOOD (  19.92  )
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

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
This series is converting lists that contain the acpi_device_id struct,
which is defined in the include/linux/device-id/acpi.h to make use of named
initializers (which they do not use currently). This work is part of the on
going effort in the kernel associated with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces. I already have
patches that implement this and touching a lot of kernel subsystmes that
use the acpi_device_id struct and that list keeps on growing. Therefore,
I have decided to split the series per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new
  driver_data_ptr member (does not apply to this tree)

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
---
 drivers/irqchip/irq-gic-v5-iwb.c        | 4 ++--
 drivers/irqchip/irq-mbigen.c            | 4 ++--
 drivers/irqchip/irq-riscv-aplic-main.c  | 4 ++--
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c | 4 ++--
 drivers/irqchip/irq-sifive-plic.c       | 4 ++--
 drivers/irqchip/irq-sni-exiu.c          | 4 ++--
 drivers/irqchip/qcom-irq-combiner.c     | 2 +-
 7 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-iwb.c b/drivers/irqchip/irq-gic-v5-iwb.c
index 442c20614dbe..34afa036c34d 100644
--- a/drivers/irqchip/irq-gic-v5-iwb.c
+++ b/drivers/irqchip/irq-gic-v5-iwb.c
@@ -282,8 +282,8 @@ MODULE_DEVICE_TABLE(of, gicv5_iwb_of_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id iwb_acpi_match[] = {
-	{ "ARMH0003", 0 },
-	{}
+	{ .id = "ARMH0003" },
+	{ }
 };
 #endif
 
diff --git a/drivers/irqchip/irq-mbigen.c b/drivers/irqchip/irq-mbigen.c
index 12919836dadb..0b4d78a0bbde 100644
--- a/drivers/irqchip/irq-mbigen.c
+++ b/drivers/irqchip/irq-mbigen.c
@@ -247,8 +247,8 @@ static int mbigen_of_create_domain(struct platform_device *pdev,
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id mbigen_acpi_match[] = {
-	{ "HISI0152", 0 },
-	{}
+	{ .id = "HISI0152" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, mbigen_acpi_match);
 
diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
index d9afb6ae98cf..1676d64e6e4a 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -305,8 +305,8 @@ static void aplic_init_hw_irqs(struct aplic_priv *priv)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id aplic_acpi_match[] = {
-	{ "RSCV0002", 0 },
-	{}
+	{ .id = "RSCV0002" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, aplic_acpi_match);
 
diff --git a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
index 612f3972f7af..bc80c38bb864 100644
--- a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
+++ b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
@@ -313,8 +313,8 @@ static const struct of_device_id rpmi_sysmsi_match[] = {
 };
 
 static const struct acpi_device_id acpi_rpmi_sysmsi_match[] = {
-	{ "RSCV0006" },
-	{}
+	{ .id = "RSCV0006" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, acpi_rpmi_sysmsi_match);
 
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 5b0dac104814..ba9c200b12fd 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -538,8 +538,8 @@ static const struct of_device_id plic_match[] = {
 #ifdef CONFIG_ACPI
 
 static const struct acpi_device_id plic_acpi_match[] = {
-	{ "RSCV0001", 0 },
-	{}
+	{ .id = "RSCV0001" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, plic_acpi_match);
 
diff --git a/drivers/irqchip/irq-sni-exiu.c b/drivers/irqchip/irq-sni-exiu.c
index bfd2adedf8f3..108d7f2e59c4 100644
--- a/drivers/irqchip/irq-sni-exiu.c
+++ b/drivers/irqchip/irq-sni-exiu.c
@@ -307,8 +307,8 @@ static int exiu_acpi_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id exiu_acpi_ids[] = {
-	{ "SCX0008" },
-	{ /* sentinel */ }
+	{ .id = "SCX0008" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, exiu_acpi_ids);
 
diff --git a/drivers/irqchip/qcom-irq-combiner.c b/drivers/irqchip/qcom-irq-combiner.c
index 09819007d08e..6d83e1e4a7ea 100644
--- a/drivers/irqchip/qcom-irq-combiner.c
+++ b/drivers/irqchip/qcom-irq-combiner.c
@@ -262,7 +262,7 @@ static int combiner_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id qcom_irq_combiner_ids[] = {
-	{ "QCOM80B1", },
+	{ .id = "QCOM80B1" },
 	{ }
 };
 

---
base-commit: 4056b3c9d3c92ea45955641dbafeb9b960e146ef
change-id: 20261014-acpi-irqchip-44112a44978a

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>


