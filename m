Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3AAC8303D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 12:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fe5xgad5AXlWIH4ix+NrVYG0DCMVBlY/Hz/zA/w4CmA=; b=FIJ5slyqnHJFI8dVF4JtldhVzI
	eiFzD5TzfQSy5YOJyGJYa2yHMtSESMOGXvZKBK5YcyuwvouBfv8VUFnYV6piIU8Qh2JXQ0KGry7zV
	iAZAQJSNibclXiB3jjlSZrHc3TLeNSOj5AAmOxOGYlqEmuLoD6zApWHIQ5ysdtBtEaQ49aW11OmnS
	rdGspvabpK9iEoNPqqtY1wjYv5SBLhtZIv/UscGER0V49ULnexErd57+tpts989WHp/ZFF8+KeP1o
	EGz0aElSclBLv/dnxq6kdL5lGKZLJaytovxRtOtxwNFLn0pQw8gXj1pA98b58HzFpJBLiZYPZyik1
	YMOjS5aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWa9E-00000005K5M-41Hm;
	Tue, 01 Jul 2025 12:31:40 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZT5-00000004unv-34ui
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:48:08 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-54b10594812so3736429e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370486; x=1751975286; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fe5xgad5AXlWIH4ix+NrVYG0DCMVBlY/Hz/zA/w4CmA=;
        b=Xtl07VR+T32qMpXtXyoq7ypvzMEhzk0AhvFQ7mG+M66OgaJNBd0vJyYm5qv6/IgsDL
         zGjDsFZOWgcSD+sxWBvuABql1DpZPRiv9veK1pI313pNCDKQwLXhEcxheI933wtR9nl2
         bU7X+VywT5xPMDCjYr/cUcdqUqDO0BHjwjurgje/VJWjZf6Y+eC9z7w3sxaL3RHneZNU
         v2cGN5tjeedDWID7puEll0slzPrhx2cgVLva4xJ4Mk0WHtBR8GDek2mImuHmXdCGu6MX
         6oKG/o7F8HAE4axtUq0ALKsSWdZhnygUyZd8ZFMgp+Xr5q37v7g3vQxVVlgoXEZn/wxh
         QRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370486; x=1751975286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fe5xgad5AXlWIH4ix+NrVYG0DCMVBlY/Hz/zA/w4CmA=;
        b=nwq57IAOQYWTCO6Dzw2gi7psXPlxlpWHvapljXqv8liN9ijNQQAajfQq80G2ENeg+S
         bL3nMbSuGAHYbUgmmBFsvS4xC6fPKQrsQZfD4LNjYAdNHRIWxCp67yV/PvMtAPShp7Nt
         8QXo49NM7GJ+ZR//Lw6fQzKfUb/JIf3jBWgcT7NFTZSHGZeXTZcOfS310aYIkI44JFVm
         ToNGoK1QrinbJMQCloVPBwi12oEcgfsgj3fxYzup23gW+Uf9fiBIvBkQ8graIYa+A0ho
         O0f8BbSV9DciFKYx2jQZr83dfXxq7VnTxdcuDLwErKg+I9RzkFrsygbDZOoKuwccT8sD
         qv+A==
X-Forwarded-Encrypted: i=1; AJvYcCW9o56cWkW617LzZzGnMEuPijj7hz+CChhA8U9jg0vbUlOdb6rKyOwES2X84MhSY9poAKJdFewuN63nlJGou4aR@lists.infradead.org
X-Gm-Message-State: AOJu0YzB9Bs/R2apMZ3GyTX6Evj7O1wzbnl6mQ7SazjCQMPr0TKjrNaF
	C6ff9L+TXKfyVWFbCzbPpzQ+1SecMQjmxIkly1nH/PCBo4KpxwwDZ32Ugwf72rdPEzc=
X-Gm-Gg: ASbGncssfS3OxxOAIMpcyXzzeAE+jV5GJWwb34aEmi0pwloY97I5/Qnj1/zjKgB9l0L
	AeTgENUlm26D2w6eWBavx1RsNm+Md9+YQ2BIWFozhIfziAH3zspmlzy2Rx+OVdvce5dYxE37T5/
	RF3dYL5T0vy0jJDfHGlNY6sD7ILJur0Dl1EyqLlO3wzwKN3nW3kzViKk2BO5E3hxDLZUsNC1whh
	f8RHFNBHk9bJ6lPfENDkgGVVcdvba5FG+uxvAB0rkKKCM7AyTnIeSEofR6KIodI66LKIQH10fNp
	s7DodRQVJzkk+tV9Jz74Up7nzf5TED7bQYAD/TDI3GEnEGwWDR2tQRdgwdq9tEBfJ+frUxiK4zU
	oDBQwt9GdBiTLz4NDE2i5o1qypQuaDZTF425B
X-Google-Smtp-Source: AGHT+IGPH5aM5Z4YbOMg/s4pZiEhmK3ttk/WWSZNeNphwAL/3oCJAKxe81UqHvcdpBdwTW8Yth1UsA==
X-Received: by 2002:a05:6512:3ba2:b0:553:3407:eee0 with SMTP id 2adb3069b0e04-5550b860e0dmr6025596e87.4.1751370486189;
        Tue, 01 Jul 2025 04:48:06 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:48:05 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 16/24] firmware: xilinx: Use of_genpd_sync_state()
Date: Tue,  1 Jul 2025 13:47:18 +0200
Message-ID: <20250701114733.636510-17-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044807_772024_8E21474B 
X-CRM114-Status: GOOD (  13.59  )
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

To make sure genpd tries to power off unused PM domains, let's call
of_genpd_sync_state() from our own ->sync_state() callback.

Cc: Michal Simek <michal.simek@amd.com>
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/firmware/xilinx/zynqmp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 87ddbb7d11c2..02da3e48bc8f 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -20,6 +20,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/hashtable.h>
@@ -2101,9 +2102,13 @@ static void zynqmp_firmware_remove(struct platform_device *pdev)
 
 static void zynqmp_firmware_sync_state(struct device *dev)
 {
-	if (!of_device_is_compatible(dev->of_node, "xlnx,zynqmp-firmware"))
+	struct device_node *np = dev->of_node;
+
+	if (!of_device_is_compatible(np, "xlnx,zynqmp-firmware"))
 		return;
 
+	of_genpd_sync_state(np);
+
 	if (zynqmp_pm_init_finalize())
 		dev_warn(dev, "failed to release power management to firmware\n");
 }
-- 
2.43.0


