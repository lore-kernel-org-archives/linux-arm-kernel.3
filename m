Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B767EC88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 10:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lPrmKt6fjdtzKQMfjHOce8MoH8Mwpyf4BPOVo+W5EYI=; b=zue3mn68fz2RJDA6SkVNq+iOgW
	wY8Qu4b/FBSU6Fcm5OBgPSTl+AEzNro2wAgpEj82e4cZJpydgRocg8iY/W9svOjmqU5i9mLTa1Z2T
	O1AUmcBqMInGKm+i7LT8WGDmDrAVWgHLPtFC2T5sxJGP2XGI9Bvox9dxOFa6P6OeZYSOkhr2OGhw2
	Sw2XlU4D10uX6r/ygWDUSA4Xd+uor0cdGnNWhGE1+XuKnCzUmupvGnGlvP50Aq99/mr2FvF/myosy
	GJ3c628B621yelvv+Z3ljV+DBjGkChRgpkiOrDKRZkwo1XKDqREs6NtVoiPYE93DfjqLZ4mEj8RlX
	pOp/fIRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nCj-000000090O7-2Qm6;
	Wed, 16 Sep 2026 10:49:29 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nCg-000000090Nd-3oCl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 10:49:28 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so4470845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 03:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1789555765; x=1790160565; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lPrmKt6fjdtzKQMfjHOce8MoH8Mwpyf4BPOVo+W5EYI=;
        b=C3k0tdwD7EVPUEjgMIxqwGgkfqdn9Qpq2pes1842IzMtBwpWhF9W6D3sUJJVY/bNl9
         ocUHrcHy7cUEIVPppUtlRM+p6Jjgs0mtO8j+zVOJyuDQvk7Xtvw/emKyIB8MSm/tFN5l
         Hv4QIA3fRN4gh/P+SqTDnRGTChztYf1Wu0NvtDaiP20aH8gilTKTDpBO0Kk1Cddm+EC1
         KsKUPdgHAHKRRDFpCnLHmRZQ30P/RoxCc4gD6BGF49ORyodxndsP6Uzd8yJ0dWi5nDQn
         vUgE5bjqBHAeveKlV+rEwQAN3pSI1x5NjicTJrWvQ6bJh+9eSzkqqwFpI0iKjZwertiH
         iljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789555765; x=1790160565;
        h=content-type:mime-version:message-id:date:user-agent:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lPrmKt6fjdtzKQMfjHOce8MoH8Mwpyf4BPOVo+W5EYI=;
        b=Nyt9wep+zvX01T5BMARawoUy3ePIUZhbYgNnr4GzSXyWA2Jn51EpkQEo4hSteQdmdU
         p4X46eWbmSC8PJbXpP6vHaHDXnsfRK6IPD+RDCLzExrGF+uRgNFsG8M7pCfj6CiATHoT
         rFV2SfRaZF/1Dnf+qWqV5p78/oepqmE1zS5OQrSK+y6wiLiay5rnUnG8sOluVxKq1F5K
         1G58bTKtjt80jx0l9RBCUfq8RyFfxObJMS7Yv4UoDmlrx5YDOc7WxLrxEbW/B3LlA7Kq
         2KeGydKMyWbZruIB25/P+T1iCPqTXqTfAkQqb9ccV2A16rMbRa7mdykCGHP6xTQ8hVDu
         y45w==
X-Forwarded-Encrypted: i=1; AKwUvByYfB2dC9fjA1N75cHi4m9xQbYBuoCYPxxnX2GW9nCXbimN/4x1wUwryEUr2n/flFTqUSQIPgLv+xGxZ+GQP+94@lists.infradead.org
X-Gm-Message-State: AFuF++keP+HXzyugE7cz/qroeP1ICpQl/T8klV2e/SNpT6PwgH4WjLUI
	aDHNJJ2NwCcsW4i8CZLvhAzq11ELq1sTGWHmHoaEvyv8FnSp/hhkt/E62V75oTJKIPY=
X-Gm-Gg: AYBFou0tBR33E0ZQ+UE3wHbcx6xRRfz5ber+b7UrFIQua0/uOrY9Ib9Xr+gx3DYjdfO
	oXBu5lyf3yPY5dD5dffHI0tNO4IJL0y4uA7TVbxANKKSwZzaBO3tk0LMHiGBN5/Jtey6iR+818G
	IQPsuhj6yR0lMX4FFrDXoOeAbvxJDN4qMzEFV0KArv7TkWW++nu+JBU23C0Qx8cVhOGRV9pBTeC
	M5P0ot3T5rwPBmNb7cWFp8U9GFmIxC06FyCQu3YB4ydzghaOWrpi33O7YM0k3sUgctHmgPZBJsU
	ce7R50WDbT/ysSIuTwVW/vjUeqqPVNmCHewfS9c0ujKq8QSpo6xWZTKWS5s6sIxD7Z5+g9n+y0f
	nwQLZw33IcbaTs33/S150cbe3M/yq0orLeWVV+lNiTojgOtSWfVjmRWbX/iq6Q2foPYs+8GFoD9
	YOr1jT0d7HInE/ebPu24l4vCESn3/3zdKTL16FImSQ498oiX2meT++Nm6KvkXu9yONZtHpGqxJB
	j/m3XOKw/dZHTo=
X-Received: by 2002:a05:600c:46ce:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49eb7339895mr43206945e9.13.1789555765101;
        Wed, 16 Sep 2026 03:49:25 -0700 (PDT)
Received: from dev-ag ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef766dsm6157208f8f.4.2026.09.16.03.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:49:24 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux@armlinux.org.uk, dvorkin@tibbo.com, wellslutw@gmail.com,
 linusw@kernel.org
Cc: arnd@arndb.de, afd@ti.com, aaro.koskinen@iki.fi,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] pinctrl: fix PINCTRL_SPPCTL=m
User-Agent: mu4e 1.12.14; emacs 30.2
Date: Wed, 16 Sep 2026 12:49:19 +0200
Message-ID: <sa6bj9x31zk.fsf@dev-ag>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_034926_958378_398F8107 
X-CRM114-Status: GOOD (  14.97  )
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
Also, the SP7021 requires this driver to be built in, in order to boot.

Change the tristate to bool and fix the help text.

Tested on linux-next-2026-09-14 on a LTPP3G2 board.

This impossible tristate was detected by kconfirm, a static analysis tool
for Kconfig, by Julian Braha <julianbraha@gmail.com>.

Fixes: aa74c44be19c ("pinctrl: Add driver for Sunplus SP7021")
Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 drivers/pinctrl/sunplus/Kconfig | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sunplus/Kconfig b/drivers/pinctrl/sunplus/Kconfig
index 69f82590f6d2..aa9435d023d8 100644
--- a/drivers/pinctrl/sunplus/Kconfig
+++ b/drivers/pinctrl/sunplus/Kconfig
@@ -4,8 +4,8 @@
 #
 
 config PINCTRL_SPPCTL
-	tristate "Sunplus SP7021 PinMux and GPIO driver"
-	depends on SOC_SP7021
+	bool "Sunplus SP7021 PinMux and GPIO driver"
+	depends on SOC_SP7021 || COMPILE_TEST
 	depends on OF && HAS_IOMEM
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
@@ -16,6 +16,4 @@ config PINCTRL_SPPCTL
 	help
 	  Say Y here to support Sunplus SP7021 pinmux controller.
 	  This driver requires the pinctrl framework.
-	  GPIO is provided by the same driver.
-	  To compile this driver as a module, choose M here.
-	  The module will be called sppinctrl.
+	  This driver also provides GPIO.

