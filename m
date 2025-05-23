Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3255FC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/aJJumEOcgP/SHpHSm52hNIxPzlDOJRQ3oP2wL6guI=; b=Swliu7CuTdnJd5tEhyY5GSjMBW
	3IT6CMaAp65v5HB7VRoOgtt7N3ET9MCfJY97vNDOF14cfGNCIxJd5ziQ4vqfLO2y+prxyU4accLeh
	es1jz6R8/l7qCxpaSgUy7/3YAKoOMDYwfty3SXfqvJ3r8IhxXIAaWnvHMWNYzBRBly8+elMlcqKf2
	QaUxwT5AQAQSGOSJgwJxXsJefy0BNsguc6FR5sySYqQw7GRtrQk+VzS7Xu2f3VehREbYMUAHBfNEd
	BdYWLfTs7q3g2CNt0oNKC8oXJNfk3xY777WUJKei/wznKSWlLb9fGy4/jPS0cJHQv+z6T49Qh7rOZ
	aHYvPI2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITbJ-000000045kf-2Y1e;
	Fri, 23 May 2025 14:42:21 +0000
Received: from mail-lf1-f50.google.com ([209.85.167.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISdy-00000003zLx-3Dmg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:41:03 +0000
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54ea69e9352so11683610e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 06:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007661; x=1748612461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/aJJumEOcgP/SHpHSm52hNIxPzlDOJRQ3oP2wL6guI=;
        b=R99smYRCWmR6tPBWc64umaA/7CZwhyzcKR3ujLkJQ3OxG4WgyUn8RxLDSabWnVShSg
         Mcj41McmS+OtRLworuXZivbtzqRw9fC7EjEfAkjR0QKQWCPqeUKLYRBENXqUWi+JJQws
         0CKdOUHgmqbeL1fmslLqy2UF7MjHiBYZGMid08Cwx8tkgrz8sa0vsMfufgAmQ/PDtuwB
         kNBzVU+f73tz6Nqzb7TSXqecMVoEt1D8C4oNpakKxItTREV7a1b6CvRPwsamBkSqrR2U
         bCrip3dvpNlmoO9BfCoVPADi0pWbNdAzjZHZSRX1uJ/XKGsVdbFymn9cfvtFun37akyD
         DFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007661; x=1748612461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/aJJumEOcgP/SHpHSm52hNIxPzlDOJRQ3oP2wL6guI=;
        b=I4IVulF9nzyCJ92SpFOFNTFHWu2P6tzg4zJJ9sCb2fzo3rr4like3TeyLXtJU5kf6i
         KpOBwC+osUrM6/4T1PCzoxEgYGyvbGdKxrbJIdU/+oRjE8ej61aYFo0/DY+4bpwdxSrn
         mlmw2cF3GBlOWi3wBa0r/zYPH55wYmK6m8zPQJ9jFMPm9itLDLiyqD1j7gQsIbQQj3aW
         nDMsFl9zY7/roWr7yCVnA23EQvvVmp3ntKmLpPegmRPARU8ks9k5AAkFKznOXx1ngyyP
         ZQFB2pO7SYChsSwniZg0DaCStSMo3vbsGV6lvnupPYmdjPZ+X5o48roS+RP4BuLIxe9A
         2MUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP1oe3w0cYdAPhZuWI5DMdviEfqO7CC4hdMVVm4lTeeyaNrkh/6U7HdJpDQClbafx1LptBmUWR5vxzBMhbANK1@lists.infradead.org
X-Gm-Message-State: AOJu0YzGkbj8IP6H5D/Ejft8MqCkt89XeuoU0xCeqyUfD/FWlG4YTj1I
	6x3tIQnRpYI0pQKzgI7nwmhZHviIl8YyQUNAdTLsB1erlK6Eq9QxVcdF87fT5evLdts=
X-Gm-Gg: ASbGncsXsS5GHZZbDsR1GWoMyVEXL5Sfuo1YGq//3QgGJAqvn0T/z9I0KNe9WOIaXuY
	xT53BT4thEBKkx7VJr6OgiOPjEjX209MLxQqqY9d4hhzBRkw6vgSa6vVTtxBDntypkdgIPX3JtG
	ywNLpffCqgtVnUuCJ2RxjQQyWLQ9v8W+EzfUBrq+mCjJn785R1IWy4nHGdiRpn7sswUlsOy6AFe
	CFPmBoBux7BEl/rKdmF5MHtVym6jmoJxMGrgxxXNnKKGAcYu3xYge2ndagBqy0koX2ZK3FiucE4
	S47wabl2E6ltL83z2/GRhz53y3FwcfDWE2DHumtIKK1T0kPnFTCaxpRtaWhZlpdOFDcBtkoywhd
	Z/UuJ/dsznV/dgphV8Q35zKHQfT7OnVDVvLUa
X-Google-Smtp-Source: AGHT+IFqaMutTsheTfKkW2cqf5rtDAzYDo1ADk4nh7EfRPJsLI0D9Etd71qYegkMcQyfr86dVQn3qQ==
X-Received: by 2002:a05:6512:2616:b0:54a:cbfd:5517 with SMTP id 2adb3069b0e04-550e99259b6mr6555792e87.53.1748007660645;
        Fri, 23 May 2025 06:41:00 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:40:59 -0700 (PDT)
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
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/21] firmware: xilinx: Use of_genpd_sync_state()
Date: Fri, 23 May 2025 15:40:10 +0200
Message-ID: <20250523134025.75130-14-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_064102_806477_68293BE2 
X-CRM114-Status: GOOD (  13.06  )
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


