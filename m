Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804CDC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5aEp/8JtU93ixaErAVWqgNJDOtLrawJ3jNzY/478Oc=; b=3+ZqYWFtmyC2CgZa3Xljdyqz8a
	Qq4uvU4tpwrwCB91Yo1kN+hPKnEz4kPfZG85lG+wEiWP25uVj0DwTjwpw+iCHDB5t1fxwawqDXm/x
	19KbhpxPvic9uh+ryIJCcIGCaCNEbj2DCM6s6b6cWi0ZbLnBPAXb8+a5thYCBm6mJFfbWi4UaVvYx
	0UNfR+SUflq3lEgUEDLUe3mu54kp8ZFtwt8NsDfL/xlzGC2W7vf2hd46A2QdEY2Cn3fv4rxi8HouC
	S73py7PTdMvfC96nINyg+p7t0IkGtDhDi0svr7xNxaoKTymb4w6IHK76m2lBlSVtsl9OK3CDbYvZw
	scSoS2vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITbI-000000045jx-3pY4;
	Fri, 23 May 2025 14:42:20 +0000
Received: from mail-lf1-f54.google.com ([209.85.167.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISdw-00000003zLG-46qY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:41:02 +0000
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54b10594812so10956716e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 06:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007659; x=1748612459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5aEp/8JtU93ixaErAVWqgNJDOtLrawJ3jNzY/478Oc=;
        b=MHGb5nqROzN6Gr2qpSNsrRZyO9Xp0+grsN1MTmU6lLlmzzwoIy+xaVrUobvBhrhOMY
         ip5eJFcOX3P59NCFcWOIws9DBKB1j3h+kX1AjGnGNOJbiMmptQzrK0ZAmmiBZah5HljZ
         aF6OKCmWSpc0F9zfssD+a53D5zxUVgEHRa8sDXUwKBj30QSuStRnFfJIxM0oFtl1ciaS
         jf4mnX/6UmrSpUw3nU9Ef0gG30UnJcKoLtM48S54uwCUIYQtDWtLkT04bjOnmmdmar+Q
         GOM6c6Lb9H7atdiqyeehKmPlC2ItHFInfEehwBoIWa9dWxE5UpdSrX1fhbIfrQ756jAe
         FHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007659; x=1748612459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5aEp/8JtU93ixaErAVWqgNJDOtLrawJ3jNzY/478Oc=;
        b=wxKcXykIYIO8zTp20rxQY2OSRaoLyjoDMNY5zxMzsi7oK4P2tVYpPQBzA8W0M8Od8i
         8o2+K9l6OBL2XR5MYwx/8rOXp1djjKU5VpO+wkUUqbL0KYV++2NM3jjIsim6ICFeynfc
         SQplL6kumaHJpDQ1UmuN/fQMXFMuC6I2W+C13aJY/WUU8mTUG//6HszZwBstUNXLLz5w
         9DMkdSPZiQIjqHVr8XjxG4gMVgEnSFQIeOBtgLp2LNlf21JgF5G2rXYCv3TKKX3GdiHd
         V503mfnCQxx967qEOVPudSX+KHe090rZFRRNh2Wf8RkmrIF41NKUaVEXCGnCuoJP0pDv
         yCZg==
X-Forwarded-Encrypted: i=1; AJvYcCW9AiaF0zmEP5ZWQUlbBYuSyIL/pqIGs1mqqFEui9a1wMldAM09IiQIvN3jdYiqNeQ/ilky+9Q3vzkEpofGjGNa@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjhu5QgCO+Ax8hMYe8wEycUaKfKzIGbDLhfU3EI6/kNADFF204
	B0kRlWefNN42Ck10//QXvonLxcxFS/QXfoGvVbaiXILqcoaLcV7FWJl7w8cFe9UgBFw=
X-Gm-Gg: ASbGnctCuIRny4dSAT5u6goE8sl69M+G25HXI+X/hDi/Ta+Hbt634uNNpEIeQxTaBSh
	N3yfF3HwjY/JoWdmtLHXmC3Ib7FSHEQZAnBWzMgGJ5lJ0KcRRcmBXX5ZkMie00FqqJ8m0Cgef5m
	Rq0HQHo5IyzxhJqiibesjkoDMy5pJ415fjW+4n4j1OaXn90k4lqucflq14u2yb/K9GBWo4DaEsa
	waaJ76RewCZmPuBQIp+9N/uQxE4OvrBgDNfBwg54jhCGsPmWy9o7O5Y3MAdxFO/nWfQk44zZS7A
	RC03dZpapXpfgUKjzVETCusKVLUD78IrmEC02LdUc96oTh4tcvYdNFF4nMjvAE07plVjb+I/FuU
	BLc+gzAgz1hFIm+C5g5DrKWOHf4ScA4BRlM0Z
X-Google-Smtp-Source: AGHT+IHew3rJAA3EL1rPz5CTB3uwQqlEQeWho80HyKc1TwZE2NDcF2OqAfkY0OELPgTm0zJ+F3OM6w==
X-Received: by 2002:a05:6512:1196:b0:550:e3de:63bc with SMTP id 2adb3069b0e04-55216e456acmr896941e87.25.1748007658748;
        Fri, 23 May 2025 06:40:58 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:40:58 -0700 (PDT)
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
Subject: [PATCH v2 12/21] firmware: xilinx: Don't share zynqmp_pm_init_finalize()
Date: Fri, 23 May 2025 15:40:09 +0200
Message-ID: <20250523134025.75130-13-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_064101_024004_0F1FC015 
X-CRM114-Status: GOOD (  12.62  )
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

As there no longer any users outside the zynqmp firmware driver of
zynqmp_pm_init_finalize(), let's turn into a local static function.

Cc: Michal Simek <michal.simek@amd.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/firmware/xilinx/zynqmp.c     | 3 +--
 include/linux/firmware/xlnx-zynqmp.h | 6 ------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index a91a0191c689..87ddbb7d11c2 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -1299,11 +1299,10 @@ EXPORT_SYMBOL_GPL(zynqmp_pm_bootmode_write);
  * This API function is to be used for notify the power management controller
  * about the completed power management initialization.
  */
-int zynqmp_pm_init_finalize(void)
+static int zynqmp_pm_init_finalize(void)
 {
 	return zynqmp_pm_invoke_fn(PM_PM_INIT_FINALIZE, NULL, 0);
 }
-EXPORT_SYMBOL_GPL(zynqmp_pm_init_finalize);
 
 /**
  * zynqmp_pm_set_suspend_mode()	- Set system suspend mode
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 6d4dbc196b93..ae48d619c4e0 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -585,7 +585,6 @@ int zynqmp_pm_reset_assert(const u32 reset,
 int zynqmp_pm_reset_get_status(const u32 reset, u32 *status);
 unsigned int zynqmp_pm_bootmode_read(u32 *ps_mode);
 int zynqmp_pm_bootmode_write(u32 ps_mode);
-int zynqmp_pm_init_finalize(void);
 int zynqmp_pm_set_suspend_mode(u32 mode);
 int zynqmp_pm_request_node(const u32 node, const u32 capabilities,
 			   const u32 qos, const enum zynqmp_pm_request_ack ack);
@@ -746,11 +745,6 @@ static inline int zynqmp_pm_bootmode_write(u32 ps_mode)
 	return -ENODEV;
 }
 
-static inline int zynqmp_pm_init_finalize(void)
-{
-	return -ENODEV;
-}
-
 static inline int zynqmp_pm_set_suspend_mode(u32 mode)
 {
 	return -ENODEV;
-- 
2.43.0


