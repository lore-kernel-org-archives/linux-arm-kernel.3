Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3DBC02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 13:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bEWiMUNEqLClrTF3KdKFb4oug1HLJiE4dMnSAetMkog=; b=iAQ2IVLe2BMOBBaqdfdQPUn5xw
	QFTY7Yb4VVB6YRBSz/RstxPSwXkayUfwcDBBgCTGBUuM+oxmN+NvgDx6eetbeev8Zr4GDlbq1SyZc
	ZMyT56VkzWeJoJx+gtt5pXbwPmF9Kagrsct5N1dI8BTqS/xZBIawotXcHn3qVAIaaCZVjVmv8VRO6
	aW6h2PXFcismEKizvyFsh6ITnJ+Rjft4ghnm01QFMRPJD8LtE/iXo9d8ZF9LrPx+iTxGo1po1R+Sw
	0SagF//HAlmBZUKjIBRpbTHHw5dsND84U/dsV0l6K/y0+9iaVgXjWZvTow8eyGnA7Aoslv2E0ZIRY
	ba9XpsQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1jW-00000006NjY-2x4p;
	Thu, 06 Feb 2025 13:15:54 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1cF-00000006M0B-0GOb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 13:08:24 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5dce27a72e8so2094420a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 05:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738847301; x=1739452101; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bEWiMUNEqLClrTF3KdKFb4oug1HLJiE4dMnSAetMkog=;
        b=lpYu3pE2dqnXyh/vGZRwS6JyoGjPXrV6FCFTUp/Tu2ExqY12NoJ6LsKBv0Z5C0HqDi
         YViOsIbXyobPJmUvFe/2MtjRnTaOvOeYTzQTP2vjV7WQAPjhgDc4rNF52krk3SKV5Rtn
         BZY2TZdpB947m9CkrTV2DjvNEaxe7IL/rwdXJOxMr2WVIF3Lk2+TNvvMUrWQhFpEJdB2
         7O3WZN9tL8KH8Sfo/VJW5hgwa4oIk4hYjmKUbW9vIV7TgxVqH+w7E3pup6GihIH7Jkyz
         zeSxqA94B9Mp6bhCuRwL/8YB/ZYwTwV7a+e830fx79a0VxoxWTFZljxflCnHC8rNeEWu
         RQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738847301; x=1739452101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEWiMUNEqLClrTF3KdKFb4oug1HLJiE4dMnSAetMkog=;
        b=OymWOE2Oy5wquVZZUI9ylqjS3CexX5uLxfZGn+ESjHOMai7/t4uVgfM/aA8bqa4DqY
         +mDzzLiuZ14ErZS+U+8WnQ1sHi44snC9PNDVdlyPfYHf4yCZk9BQrxYyUDCRe0d/6e83
         AePzzmZEAODP3st0eBnbJLmljLAfsVEPhg0r/QtY5hgYha/fbfv3JQMseSxqE1ooSkg1
         g7UjZLLxL+CNQ+XkQYlAMG9t0mKpROoPTnCLCfcZ/pWXlHT59779I8Lru5thRJLHOoFL
         fSBsI9kpb8UkOFTrSnhvhFUUvBhGNlIFGiPYl/Hx7ZYAybCJ28GduoC4mbnGIujQBgTb
         KAeg==
X-Forwarded-Encrypted: i=1; AJvYcCU6wlNiN7oc43Ei3wG19ReY9Gmm3XHsGo4tE96v/C4aTqsBhxpHwtBrgyr1n4kCP8CnsAknVFQM9ZI7j6ZYSKQm@lists.infradead.org
X-Gm-Message-State: AOJu0YyowhO/YTbC0Tytu2l4tGNlJp30MPGZ2IeAOeGg4Ul7EFTcotdG
	8pTWC3nGh5tAhohmeA80Dq1TceAjiRdQst2I62PyZmzYELG2VK8TGHpxTiL3KI0=
X-Gm-Gg: ASbGncusUScn3N787uyIIZNkjV7He7wwH+dwkTtaK0C5ODwloJTHQJgAVGClFXWfca7
	j3i4bc/fRXxOItgrvjkROKzNf/QfcAK/1kaTaatY3rPzK9Kz/afKo3lnxUivRSVIFZMjv3VkObg
	kCa1WTtTdIuwIMyYO+xlUOygh50hBzJVJ3hwvVa6NpY8N+p/hiR1gpZsBmxjANpUKzZr5P5yKY6
	b9cf/u/YgTHBa7mdWlX3FLxwh+ZJc/7ZQZ5d2udb5/TH4dODGfPqG6wSdgN8JPMiPQEvRMlntD0
	QzXBWX3ptWuCwTHiEwX18HVqdXfIXnwkzDdKdo3hkcXO4h04tneB8Ia56IjJ/BnItJTDQD1VvR8
	=
X-Google-Smtp-Source: AGHT+IFeO9gqDBs4A+ukV7FG2tWykoGpIb5Yum5uOgYOlnokRh3L3ZP9VDrs1qPmq6hH48wtb1DiLw==
X-Received: by 2002:a05:6402:845:b0:5d3:e766:6143 with SMTP id 4fb4d7f45d1cf-5dcdb77fba0mr7904791a12.30.1738847301240;
        Thu, 06 Feb 2025 05:08:21 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b73f8csm830235a12.8.2025.02.06.05.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 05:08:20 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 06 Feb 2025 13:08:20 +0000
Subject: [PATCH 3/3] arm64: dts: exynos: gs101: add reboot-mode support
 (SYSIP_DAT0)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250206-gs101-renppt-dts-v1-3-cdfe993fb3c5@linaro.org>
References: <20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org>
In-Reply-To: <20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_050823_133138_177241A3 
X-CRM114-Status: GOOD (  16.51  )
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

syscon-reboot-mode can be used to indicate the reboot mode for the
bootloader.

While not sufficient for all boot modes, the boot loader does use
SYSIP_DAT0 (PMU + 0x0810) to determine some of the actions it should
take. This change helps it deciding what to do in those cases.

For complete support, we'll also have to write the boot mode to an
NVMEM storage location, but we have no upstream driver for that yet.
Nevertheless, this patch is a step towards full support for the boot
mode.

Note1: Android also uses 'shutdown,thermal' and
shutdown,thermal,battery', but that can not be described in DT as ','
is used to denote vendor prefixes. I've left them out from here for
that reason.

Note2: downstream / bootloader recognizes one more mode: 'dm-verity
device corrupted' with value 0x50, but we can not describe that in DT
using a property name due to the space, so it's been left out from here
as well. This string appears to come from drivers/md/dm-verity-target.c
and should probably be changed there in a follow-up patch, so that it
can be used in reboot-mode nodes like this one here.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 4f45bfeb33c0..f4c098ca9fd2 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1410,6 +1410,19 @@ reboot: syscon-reboot {
 				offset = <0x3a00>; /* SYSTEM_CONFIGURATION */
 				value = <0x2>; /* reset value */
 			};
+
+			reboot-mode {
+				compatible = "syscon-reboot-mode";
+				offset = <0x0810>; /* EXYNOS_PMU_SYSIP_DAT0 */
+				mode-bootloader = <0xfc>;
+				mode-charge = <0x0a>;
+				mode-fastboot = <0xfa>;
+				mode-reboot-ab-update = <0x52>;
+				mode-recovery = <0xff>;
+				mode-rescue = <0xf9>;
+				mode-shutdown-thermal = <0x51>;
+				mode-shutdown-thermal-battery = <0x51>;
+			};
 		};
 
 		pinctrl_gpio_alive: pinctrl@174d0000 {

-- 
2.48.1.362.g079036d154-goog


