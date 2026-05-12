Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619F4CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 23:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmHUKL8NUphLHwFZ6i5s/xt6HVZRF/yrFKUHEgOkX6A=; b=kzeucawi8lGZFANj94jBAzQLqX
	6sbeoQDBs5iiz7JLNStnpRWN5SrUobyBI/oZIq4syUQJBHkiv+jxzSLEQXMmSNgM8apA5xhA9wLim
	ifXk5Zgj4PfNKM1k64o03tJdp+LQT8FuU9Sx/hSh7CcDXK60CHK5FMpZk8YrzDOMb9Q4kR9KkUc1V
	S02OlAuWqCpavb+S5FksxB4sAsaHi2JrYogO30KDVkSFEHfE/W+ZWB7W2P/y7p+kIooVMkvFrUtF4
	gXHduZ4PLRaapjXpY1nzlFMg4E+E0HqEEggljzWTQye3MClnAY2waUKAXPJtzT5h9f2M1qfKAMXjR
	3rsnF+nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMwH6-00000000fU5-0eUA;
	Tue, 12 May 2026 23:12:28 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMwGz-00000000fSE-1Uc2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 23:12:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso69856765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 16:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778627539; x=1779232339; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HmHUKL8NUphLHwFZ6i5s/xt6HVZRF/yrFKUHEgOkX6A=;
        b=HkyalSUhD8XffxW1/kUkV6THXO6FvBue/3swPg65A8+7n3SgJDBPA9gpRZ40jxHgaS
         EIWyK2hKoAlaG0+KADION8PcD0zJ09XnNfUf/E/oUNB92nECsC/EaV+1p/PDeFldhlAp
         qwsAHexEjWMyecMjClr8Y9zZXT0qMdxbTCuFh+Si9fCBga9qidLIwHOJrjlNqvuiStA0
         rmZ+4CxjTzFFB+dUKoS2Vc4n8aVmHTjGtp4lXe5cjHMNLlVcYBDv7j2Gw6GjWScfZlsI
         z+oI+ulocDkMthw1d7O+YegPYbwB8BpY1jwF7Aul7l6nDBuB+LE3c7TYwgdf4/+OzJmJ
         oX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778627539; x=1779232339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HmHUKL8NUphLHwFZ6i5s/xt6HVZRF/yrFKUHEgOkX6A=;
        b=jZ6gvrW5zTDzo69w4RT8/a8mmHqBMyDpnhRkV9+OALrogQVngmgS8PerlRgzW3Yhdb
         T8y9VHdGLntyicm1RKiRGL+/EX3VsxRWvTIbsCc4+xVwqxSRUACTkccqF2cnthrI0Whq
         wEMxdidMgUiho3gwLN29lEXZlIWk8La4s5KTS8OjjPssayVkMeO6lqzYZszsfzWwMQGK
         7bdhcTLIaMM7YiFaiUcgjvnbSeYy55wI8fNJ1LpD/cPO+JYdq8gMj3iufBDfK1SHXZPn
         7VUu69xZ3PTZzE+Pj8yLn2lYrqICv4jGc1Tx5ZSOlFsPrb129UgXa30NGN27+YJTgGrm
         U6fg==
X-Forwarded-Encrypted: i=1; AFNElJ8kCWsaz9jMFDAduDa3AEc8UBiSZ+hzd9GuQ7JosSKDry51/8YuSUngodML7OuRuhvoNnVjm+UKzsn9jr1AfI7V@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8Z7zWqAA14wSLuxvpHBmQ92nUrMpArSP7tP6Srr+67iHdwjjs
	e12tY9VcQhGwGfEyB/5DvBV8XgeV+V53RxCC/DZH2wBE3181KpcHfJSBVilMwNvK4pM=
X-Gm-Gg: Acq92OHaACTELEKS3giKvqX02SSIegyY1UxR5D9LrV6F7FPT4vGso8vrwW3+/YImE0S
	oIhadZCncJuk+b65HbiFDzoO7cbuFK6lNwy0qwvFOQ8hOZSfoI77evjIx4NKlxm6/BGokVuw3z0
	euGXV1aH5nslqZOCpA68W1CfPQ0zEgApZBg/1jQVOfycBWD0xgjfXNtJh34gaHzxrxyxa/mDMAd
	j4ZSOOpcBo+HXjZNvtRoAbdNKb0w9ayCWZNQI2kNxg7DPeN7n1hAXEXgCW41Pjkba6HyGHDTUnt
	hxACOGt2n+igq3lIXsa+A0GLZZcbN97SWK5Bdn4Uvhf9IVoQPRyxYXNk3Puhlfs4QWkLVFr3mVC
	OsjMtUe5bsS1VdBTcsJTeyCZsPGdgYOL3kr4GE7bjpwk5exa3a7FppVe6WoE3medYgCnbehSEhu
	sJihWFgmWc/MYWvwMvx4wCBFfZcJ+eWQgxkJuw9Eo0uIBxkXWASR4e+vKVryzNXxGO2tGHfJQco
	4dYGEduAwJ1AFlS
X-Received: by 2002:a05:600c:458a:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-48fcea00708mr1365685e9.27.1778627539442;
        Tue, 12 May 2026 16:12:19 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e913469besm20712305e9.14.2026.05.12.16.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 16:12:18 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 13 May 2026 00:12:12 +0100
Subject: [PATCH 2/2] firmware: samsung: acpm: add Exynos850 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-exynos850-acpm-firmware-support-v1-2-3858d097e433@linaro.org>
References: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org>
In-Reply-To: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_161221_416611_602F144E 
X-CRM114-Status: GOOD (  11.43  )
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

The Exynos850 SoC contains an APM co-processor. Communication
with this hardware block is established using the ACPM protocol,
which handles IPC messages for clocks, power, thermal management,
and PMIC control.

Add the "samsung,exynos850-acpm-ipc" compatible string along with
its associated match data. This includes the specific initialisation
data base offset (which differs from the GS101 offset) and the
"exynos850-acpm-clk" device name required to properly instantiate
the clock provider.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 16c46ed60837..db4138f36038 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -37,6 +37,7 @@
 #define ACPM_POLL_TIMEOUT_US		(100 * USEC_PER_MSEC)
 #define ACPM_TX_TIMEOUT_US		500000
 
+#define ACPM_EXYNOS850_INITDATA_BASE	0x7000
 #define ACPM_GS101_INITDATA_BASE	0xa000
 
 /**
@@ -766,6 +767,11 @@ struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_acpm_get_by_node);
 
+static const struct acpm_match_data acpm_exynos850 = {
+	.initdata_base = ACPM_EXYNOS850_INITDATA_BASE,
+	.acpm_clk_dev_name = "exynos850-acpm-clk",
+};
+
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,
 	.acpm_clk_dev_name = "gs101-acpm-clk",
@@ -776,6 +782,10 @@ static const struct of_device_id acpm_match[] = {
 		.compatible = "google,gs101-acpm-ipc",
 		.data = &acpm_gs101,
 	},
+	{
+		.compatible = "samsung,exynos850-acpm-ipc",
+		.data = &acpm_exynos850,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, acpm_match);

-- 
2.51.0


