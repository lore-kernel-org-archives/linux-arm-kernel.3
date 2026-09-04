Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54462C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 12:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5ydjw49DZM6ZNER4g2lcExI1LMpGhnZwTfnwbU+34mY=; b=AKWI6pEfcrJVzM1meG3oy85hBU
	UB2pCDVU/9AYLZ8NFEnOOC/83EBU6+dA0swsNHijU14MXcZvNp35vh3J+8ZkFrzpM6c6i+h5FE6H/
	+gDLfzLAGSS6D7+J59leZBx0CkqIVgFFCDOOEtOdN34MlysnZQF2vyE6dbn6cftx+Wx4zDHZNHsMf
	Q3UZCHGrVTORd5va61KJZ3tF6wQM1E8pmnD5Ic8jP/+ulRh9PGJ+S2fzs8NNXpK8kGcwGs5F328RG
	z14Y8gmCtiWxYYfZsk69FD89m4NhYpEDEblECyQ7lL9kK7IZnrCxZ4Xi53OKJz0P30Y002K4+j3wd
	+9pCqC4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SsK-000000020bO-3fIw;
	Fri, 04 Sep 2026 12:18:32 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SsI-000000020aZ-3wwr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 12:18:32 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso14906015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 05:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524308; x=1789129108; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ydjw49DZM6ZNER4g2lcExI1LMpGhnZwTfnwbU+34mY=;
        b=Kq/pRoTYrinltlK8H62AG8/hOoE38Gr49h13mvzpQdpaHV3qhHEAaDtPGZHvOjjFon
         aUmf9ZCm/1yw8RJiK8CbVBgELZuEM9g1kyjtRWFDnIhgrp5zDVd7yzhTjjNkDg//2pxK
         mBPTbhheLz7spHgXcxlz23/2728b4p301PqJt3J5mSsls37cKZJr2fEwXHWqry5YRX7W
         ZqA8S/y7S5mIvMJyELc8oJLLfi74eyDH6LHWNnRibSD/h/OZ6brN2fWGhLEb8qR0zCwe
         nFZutYLJXW4T2Zfn0JNjegjDp6A6re1ON63zAUClYXpnxB5zNHVRJsmszbcIbJSDATvr
         s7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524308; x=1789129108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ydjw49DZM6ZNER4g2lcExI1LMpGhnZwTfnwbU+34mY=;
        b=Eu5Rx7xK6TXmLwMurkz8oPqDx6uNu5AyoeYee9gGeNg739iZB33cJGooBZASmRqWsr
         Vy2Y9NO/TUsSTMxlzvkUS0EilmaSSAyMekBRuGBlXisQstN+R3QmD2Ke2L26PMNRUqUa
         IWEiMoOtGMGBhM/2sWmy+EzCazrcI2MEX+poO+y/obtjvqTlCZeymWZlf9N7zlo320zm
         HURI+yxPS/3iIpio9EyCQbQc4ceETj9llEKFyX0IUPwC6Od1b4BU/0Knngbelss/3KL3
         i/HbWAdkt51io5Xdn31k+mzX/chLYRz67askw/XLs+7m4o6siBGYTujqX/H10iwzlfdW
         ofEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbBGN/t0TkET2MxbEatJQAOY9Ag53lGNy0N8a6/cKexOWkVXOcStdTx3yeIs8dQy431KyvbllDixyFiGr1M2Gm@lists.infradead.org
X-Gm-Message-State: AFuF++nCMt+qg03Rd+tIq2/yaJyk1v5CEzBd31nRC8oLUfMNRqkzFrFV
	z7QVUIHnQmHGa64JivEbvDTA+3juuex86hxs22Z+pgNuLpeLGHPH07GN
X-Gm-Gg: AYBFou0kZYeAmdrgq6kxcgcbL0PkibUau6Kgd5LWlPXAw25FqsMEE3eZxdmGvv6o+j1
	qHMhMHpR8t3Nt0tanacFWYcUtzxOqLPWGcz3rPUl4R3rXDThkjmEFFFajS8H8eWfFY6DvH2z9Le
	g0QtAJtGcjtfEZdouOwAEVoYsthipzwQR89rK3PYVJPMds2eklk0IkyWXoGVu9YbDM3tlNUOV0/
	KgOn6G8Y/QR+SnsAeFQFz6HWF649PG1DsxDXEQZg7TTG977fNDCStkx3DGFPxDyGnvWQxhhYLEt
	1M/cqmX/Z0J+TdSAHa/9ZUSLH7roZ4y8xLFzNe2WIj6DMuYd6pAJe1SXi89cy1PQqoRTyDhPJlU
	bqkoZSnCUZd6qOaV6ZU8yoUtNy6DPtqAQJW32SKfK8XGa1A5Cf3n87v/qSB8vSGt1BeaWY9LQbm
	Q0zx3hGThyBSko33pjn8LBTKYOxhUkEe6eivihDiUqsjWd18UVQUUh2/jLUV9TzgfuhgVno1Sz8
	1NaHfdOu2AzhHjJ734xqz3Qje2sTOw8nfwmTNUh9fPaCqJt+9KNkZXJ27CNjEHM
X-Received: by 2002:a05:600c:8b8c:b0:49c:f13e:e52 with SMTP id 5b1f17b1804b1-49cf893b58bmr41215435e9.15.1788524308369;
        Fri, 04 Sep 2026 05:18:28 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm20697355e9.4.2026.09.04.05.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:18:27 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: linux@armlinux.org.uk,
	dvorkin@tibbo.com,
	wellslutw@gmail.com,
	linusw@kernel.org
Cc: arnd@arndb.de,
	afd@ti.com,
	aaro.koskinen@iki.fi,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] pinctrl: fix PINCTRL_SPPCTL=m
Date: Fri,  4 Sep 2026 13:18:25 +0100
Message-ID: <20260904121825.43320-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_051830_992709_BCC02A07 
X-CRM114-Status: GOOD (  18.39  )
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

The PINCTRL_SPPCTL option is defined as a tristate in Kconfig, and the
help text suggests that the user can build it as a module by setting to
'm'.

However, it cannot currently be set to 'm', because SOC_SP7021, the only
platform that supports it, is a bool option that uses 'select' on it.

To allow users to actually set PINCTRL_SPPCTL=m, let's remove the select
from the SOC_SP7021 option, and instead have PINCTRL_SPPCTL default to y
when SOC_SP7021=y, then users can configure PINCTRL_SPPCTL=m in the
kconfig frontend if desired.

Note that I have only compile-tested this change, since I do not have the
hardware to runtime-test it. Please advise if it would be better to change
PINCTRL_SPPCTL to 'bool' and remove the help text suggesting that it can
be set to 'm'.

This impossible tristate was detected by kconfirm, a static analysis tool
for Kconfig.

Fixes: aa74c44be19c ("pinctrl: Add driver for Sunplus SP7021")
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 arch/arm/Kconfig.platforms       | 1 -
 drivers/pinctrl/sunplus/Kconfig  | 3 ++-
 drivers/pinctrl/sunplus/sppctl.c | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/Kconfig.platforms b/arch/arm/Kconfig.platforms
index 2e118b65f93b..dc880addadc5 100644
--- a/arch/arm/Kconfig.platforms
+++ b/arch/arm/Kconfig.platforms
@@ -177,7 +177,6 @@ config SOC_SP7021
 	select ARM_GIC
 	select ARM_PSCI
 	select PINCTRL
-	select PINCTRL_SPPCTL
 	select SERIAL_SUNPLUS if TTY
 	select SERIAL_SUNPLUS_CONSOLE if TTY
 	help
diff --git a/drivers/pinctrl/sunplus/Kconfig b/drivers/pinctrl/sunplus/Kconfig
index 69f82590f6d2..7719838b39b6 100644
--- a/drivers/pinctrl/sunplus/Kconfig
+++ b/drivers/pinctrl/sunplus/Kconfig
@@ -5,7 +5,8 @@
 
 config PINCTRL_SPPCTL
 	tristate "Sunplus SP7021 PinMux and GPIO driver"
-	depends on SOC_SP7021
+	default SOC_SP7021
+	depends on SOC_SP7021 || COMPILE_TEST
 	depends on OF && HAS_IOMEM
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
diff --git a/drivers/pinctrl/sunplus/sppctl.c b/drivers/pinctrl/sunplus/sppctl.c
index 67e036d66245..89c6e2e92f07 100644
--- a/drivers/pinctrl/sunplus/sppctl.c
+++ b/drivers/pinctrl/sunplus/sppctl.c
@@ -1113,6 +1113,7 @@ static const struct of_device_id sppctl_match_table[] = {
 	{ .compatible = "sunplus,sp7021-pctl" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, sppctl_match_table);
 
 static struct platform_driver sppctl_pinctrl_driver = {
 	.driver = {
@@ -1121,7 +1122,7 @@ static struct platform_driver sppctl_pinctrl_driver = {
 	},
 	.probe  = sppctl_probe,
 };
-builtin_platform_driver(sppctl_pinctrl_driver)
+module_platform_driver(sppctl_pinctrl_driver);
 
 MODULE_AUTHOR("Dvorkin Dmitry <dvorkin@tibbo.com>");
 MODULE_AUTHOR("Wells Lu <wellslutw@gmail.com>");
-- 
2.55.0


