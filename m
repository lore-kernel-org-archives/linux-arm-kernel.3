Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64A8C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 12:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27vCRapRpRoLV9KzfQODt7M6d2jewQo10FyC4pKnCE0=; b=QTAb+yPD3TB5HgXFBxmElJ0Fu2
	JScA8X6JFlrBF7n5uJYZ2ILlIqLbZgSoeePN9WDuexOdEAshvx4Ir8gRo7E5dCKjxMXu0PY26t7kQ
	NoUqw35I2yP/IVNgGS+GCyAJSPB0IV+pJoGRAGsqcviS8JCU50gr1Bx8/61ZO5wsASTeWhxyXoHsW
	SMEg9k36B2s0c9G/P1j3WJGZYvQMwm8oSND2Dceyikr0iV9Xuv99H4qlw2LxE2MxPlyHhoi7adeZQ
	rwj7pihQ5uLTEA3E8fglWJtRQIu4Pv7ZV/MyFY38LMiqBfZhWo59FzLhZVRWY+eBe25WidrM+SgCJ
	XR+YoePg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWa9E-00000005K4B-1CmB;
	Tue, 01 Jul 2025 12:31:40 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZT4-00000004uml-1wtM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:48:07 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5561c20e2d5so1770195e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370485; x=1751975285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27vCRapRpRoLV9KzfQODt7M6d2jewQo10FyC4pKnCE0=;
        b=PRYvRv7LikWmnVl6yTy7ft0cvBZOg8AawMYKuzYvMWIVw9XLq+qOJca+/u8CBAcCAm
         R0/NuFCIe83mrsyPS4ZTdkNEBWQbxYWeRfi/plupxuVYOgxXTXaEsHzAazgUpFjM0Jwi
         8Jb4rPTGd5aKQzY+Muj7fXnEhKpSIyxUjXatFrBGxQMAEkWpoADl/f5w/7vD1/Tlm9MI
         lslqsctYhlBODTFI8jdFRi6zSmABJKoRwmtIIK01TsTT5GpxYJzBha6BdaaCO9gyL/TK
         LDoLP8YgAOlCjDiF9eScZA+8Q7A8+YB7Ty8pzVOIYyx1S87NdGy1kXCBBmRa5I4FdlhU
         LQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370485; x=1751975285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27vCRapRpRoLV9KzfQODt7M6d2jewQo10FyC4pKnCE0=;
        b=EmKf5xtSfyF4YFQfDHbBH6WwR2SSwXMbKreXrqioll5ZviGN+UnmhlxwDwMUzONGM8
         U2j+96G/5WQhznlufyxrKyJj57bZBzgr3YJVKd4+3q4RlzS5pY8X8TiQJyd8VY//jsSs
         43JemkAUQ6MG8o9gFPDYhhVV5hn0UKaZFjPYqQjh+416ZI/1tShQt9lyFzKnUzoHra7A
         lRoLUtH3x2Sk3ggUFThhx1fFQGstmQH1i4DM9ETVVr683PMZQ33jWbbcML72vfyGugmc
         knsUpwOyYhgc23Uq7KWBMCp/vVv4ayBlbIJHCI9F2bLe/5D/1DqT/DUyqh4bAOXfjsK7
         7CXA==
X-Forwarded-Encrypted: i=1; AJvYcCW2OJWjSWVO+ZCNd91bEkFOcXgtLE2KeM1Qgy42DENGbDe7r39WyU663QZChAT7dIRNLWY/JWY0m2JT9sadXEd+@lists.infradead.org
X-Gm-Message-State: AOJu0YwGpEOYTuY0CuuEzyDnNLcTAmyWWWOWsNRcnwRdaIdfCofOIoHr
	qrHJnpPvNtPYYdNdYW4kPV8B5JEmVkvhND1XSSSwd7AHzwPzEdNTV7RESIMSWwaVq186IFfy6FM
	HJ9KA
X-Gm-Gg: ASbGncuBvPVTlRf6rx33OQ/7a4bEOEzqpja7N4KgJS8Uij9p9fTztuM+KvSI/qBbfhj
	AsvqOmo/If2qcj54M2n0nHDSxawnJ99q70SfIN1kLrquVJsczb0Fls8IOwmzHLSfa0AttZJlhWn
	hNxpW3+zsHqq3huhsv4FxylLg+zCK3yLOC6Wdsg/Y1LXPxrTj9uIm2nIONTpmv2pxGsTG6hnpL+
	BLDZxNDDvtUBeXDrBCw6xKYw/Q+1gYtyHEijvapgD96/mmCHYLjTmmwWR77e3I4anYBpqhzWikM
	fJN9ElmFugB1yXD/btQXFWA8SMp7tkg3bIm0mUWnTzGcMsKMjKLhCYnGT6CEbANZE6Sqx6InBvH
	P5w96iqEmLjRH2DUP+klAaELyg7h87pOQDDPhhNSEmBxyI1o=
X-Google-Smtp-Source: AGHT+IHua/UEt3b45/LuxxWp2SUanS88KDLpgikwHH5MvPxATRT7Z0U/3UXMo1sRCEzCo4OszKGTSA==
X-Received: by 2002:a05:6512:31d0:b0:553:277b:17c8 with SMTP id 2adb3069b0e04-5550b89f65emr5591872e87.35.1751370484839;
        Tue, 01 Jul 2025 04:48:04 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:48:04 -0700 (PDT)
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
Subject: [PATCH v3 15/24] firmware: xilinx: Don't share zynqmp_pm_init_finalize()
Date: Tue,  1 Jul 2025 13:47:17 +0200
Message-ID: <20250701114733.636510-16-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044806_503497_C8656BB7 
X-CRM114-Status: GOOD (  13.13  )
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
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
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


