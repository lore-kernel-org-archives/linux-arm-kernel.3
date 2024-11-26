Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E3DD65551
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 19:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gdOpj6n/TpCW+M6qJNyMJAxTe9+Oh/jv0QhEZd/cyn4=; b=l4ws3oHisSlu7+EW5EC1ibQUJY
	b/Jt0hJPavZWLIJQCo7pEQrH2Uqnhj/0ZQWgg/SWjClmcN0IgcUHgchDaNPPqFwqaeCqpDzC0tK0R
	KRf2VnjhKUALlk7/BJnJTULFiTlHuutnfK+BV1kHhCtrz+ZAkzVdaWWun/r29Ci3ixzXMqAdQrojb
	8oNtXStWC3acJWJWFZirbLCHQ0/GIVBZKw0X2KPmLTZ7xgSjfo6jrNil/Yex0P4rsqng82iJ4xlMz
	TL6hyz9CC+xnyOd/1+xi4TlsGWw00+4ffKkUIr/b/Q5eahJGOAce3dbOEg9XQUTvg/CCgcQpFl+ZL
	aj33u0Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG1SX-0000000BYz4-0Sv4;
	Tue, 26 Nov 2024 19:42:53 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG1RZ-0000000BYwM-2glm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 19:41:54 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-71d56fe8240so1080204a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 11:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732650112; x=1733254912; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gdOpj6n/TpCW+M6qJNyMJAxTe9+Oh/jv0QhEZd/cyn4=;
        b=coIeVGpdP65RK8AZOurBXNfht9QxN7OvVPnkxbuvnGlXm3WYzmzxdA0X4T2z+AQulE
         mrVQIutc6po8V+F10J9Xy3IOWQuAnWVbuLsDBwp0IV6HqkZ7F+h9fjYct/3Div1DIBC1
         5IT4/+dQ4SXBhQ/g5Yk0FY1rtEkrEpRq4/mpwYBTtB8k3T/v3LXMtTaza4EjKcxSr9Wd
         Us3FoIqmbZ3rkTDvJPt/JnWKTn793NAvO3ddA0FEBlBl3fyPYL2E3q0OFTIFDfWYIpik
         1rZnLuHaQaAHwkaCA0x8r0jxLiOCTclKwiZHw50gvdI4Jo3VzIZ+llqOOR3a2hJg8An7
         kNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732650112; x=1733254912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gdOpj6n/TpCW+M6qJNyMJAxTe9+Oh/jv0QhEZd/cyn4=;
        b=JMPV6yYEPpULxiq5B7d7cbO0ImSN2IfZQMLBkM6djys7mI5mzOeqrGkZ6+q1nddJcP
         c7wQwAuWzq5gj5CewgXgsDYdj4Ha+cNYwTg6MthTDH516nNgp9Z/AMfLVao9UP4GSKif
         tAdlwSVPN9rRn61MDZzNJUYuaALru6pjhEBdS/pZXhFuS1mq8WwbA0nbQwuT5tFJhqHB
         TvXj3dmVB4UJhYut5TLlCkaa4ftMqR2hOQX/neq5909lQ01jFH9zICeyRpMB/bCjBQCz
         PZDO4TvuHRL+l3ctZVxegr/9GzZMU1FSqtKDiE3ZvPSv4wsurqquzI1M+SpQUO3NTdDJ
         tJkA==
X-Forwarded-Encrypted: i=1; AJvYcCXgPwposR9qhKWZvOS0Y200rXka34tdFBPsJw3T7uS3BX7hxNvLJuEheo+I25cF6yOA3azTEQVsHD/Szfj6Li+J@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo1QvrFjaNX/3iKaE6ru5bcFGJNOkY0FerJg7+vWwj3FNEKUPS
	56AHYRds6cAYP2e8U2287tG34R4iGfbjF8CwoT9KdIntUFnFgWrA
X-Gm-Gg: ASbGncsmPw8eqdRucfiJJGIrhkyS1sFqbLTb7+3c/hBcukbQjucxtU0rj5pO4kbOVCa
	8H9uF4PiR2oPSs6XsOFccbFo12upADjSwn8njaVBoIVKbjJXcqHR7d/IGT5dQukU0yyEPOWZ+OK
	BukBrrDKh30akgL8iJQAtcKDCkj5+Yz5XVWVKLkO6LYYJ8o4iUyhq7Xh8RNMRvcuMEvROUTIKi9
	xxoW8xZ/InUxqmdhxWu+fhg3bkkCGTwUH6t4H7hm0WJTxZlS3zcRyF369H7jYL1
X-Google-Smtp-Source: AGHT+IF+qleM6e28lbhrKv8SHeOCH/FuIj3K4jQgailnXQEBm51/BgQbfblpSw+RSONlWze7PTecwQ==
X-Received: by 2002:a05:6830:700e:b0:710:e61c:7a4c with SMTP id 46e09a7af769-71d65d05a85mr309535a34.29.1732650111959;
        Tue, 26 Nov 2024 11:41:51 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8a47:3216:e3cc:f1d9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc1e25cesm9147384a12.28.2024.11.26.11.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 11:41:51 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: esben@geanix.com,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux@roeck-us.net,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ARM: imx: defconfig: Explicitly select CONFIG_PINCTRL
Date: Tue, 26 Nov 2024 16:41:46 -0300
Message-Id: <20241126194146.1193094-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_114153_677042_6CD90968 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

From: Fabio Estevam <festevam@denx.de>

Since commit 17d210018914 ("ARM: imx: Allow user to disable pinctrl"),
the CONFIG_PINCTRL option is no longer implicitly selected, causing
several i.MX SoC pinctrl drivers no longer getting selected by default.

This causes boot regressions on the ARMv4, ARMv5, ARMv6 and ARMv7
i.MX SoCs.

Fix it by selecting CONFIG_PINCTRL inside the affected defconfigs.

Fixes: 17d210018914 ("ARM: imx: Allow user to disable pinctrl")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/linux-arm-kernel/49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net/
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/configs/imx_v4_v5_defconfig | 1 +
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/configs/imx_v4_v5_defconfig b/arch/arm/configs/imx_v4_v5_defconfig
index 875c8cdbada7..1af29d12129d 100644
--- a/arch/arm/configs/imx_v4_v5_defconfig
+++ b/arch/arm/configs/imx_v4_v5_defconfig
@@ -83,6 +83,7 @@ CONFIG_I2C_IMX=y
 CONFIG_SPI=y
 CONFIG_SPI_IMX=y
 CONFIG_SPI_SPIDEV=y
+CONFIG_PINCTRL=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_MXC=y
 CONFIG_W1=y
diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 0beecdde55f5..73f7aa7e75f7 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -204,6 +204,7 @@ CONFIG_SPI_FSL_QUADSPI=y
 CONFIG_SPI_GPIO=y
 CONFIG_SPI_IMX=y
 CONFIG_SPI_FSL_DSPI=y
+CONFIG_PINCTRL=y
 CONFIG_PINCTRL_IMX8MM=y
 CONFIG_PINCTRL_IMX8MN=y
 CONFIG_PINCTRL_IMX8MP=y
-- 
2.34.1


