Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206E8C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 15:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bF/eU9zOanUVVZXeOgSfSnbo986yXdUGTIPTl3NGixQ=; b=lpwwrw6onVJPL4NRucUC5rcZRP
	NpwGC4hjCc1snzEd5RFWYAtk2BO3ErtqvlR89mZgnFumbc9I+A++g2kDZ/UjFqG/dQDBjgIU1rZh3
	zVxr+AonAhp/IWd+s2vpuzGuzYS+vOVMySAT4Dd9GW6LjedMYbIE6x/2oqm4qoibR/3uwMA5KWZ7F
	2R9K2zSm9pPWccJMLwYH/TRdsl8HSADcS7lEGUs2kOZr/XqLtSgnCQvsASlX3WSF7RiJ++JWGh4Eb
	QoEY6yWVeLpiO+tgkffUF16J2o71SpLHSBW92OT+p7OtpIxQHVo/9tiQx90CcL7i6o2JylN9/p5GS
	0JfKNQNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uByAd-00000007teR-1SqS;
	Mon, 05 May 2025 15:55:55 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBy4t-00000007sW3-2RKT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 15:50:00 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-605f7d3216bso1047639eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 08:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746460198; x=1747064998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bF/eU9zOanUVVZXeOgSfSnbo986yXdUGTIPTl3NGixQ=;
        b=YRHdUVg1vntLsBZ0I8XdRCvpWVp+9LqViP9d2LeE5+SIBt/mI9NfWmsx/FecmBU3z/
         sCAznCneA0T5jPX01DeHhUgkaiV6JcGh1VdDtDjlhFjixa9XQDXs/S45WMreE/jabIjs
         3hf7qJo/NIDYhbUHC2qyV47Gau2EEAqM6lg8lK6HOKb9F6q4uuB1HUU2D3ZxOJZvBl3q
         iXcO8B/Q20il50KsVXaBEza9ws+3dWpld5OL11r3SSYJu2a6lbzB6Y5vgRsE8XXOKWNq
         1IDQSS8N0GAKHMwB/baIhtW57orPyBpvIZvtBy8gKZCnWus33JIvx2hIjW3vPxi9fEnF
         ZL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746460198; x=1747064998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bF/eU9zOanUVVZXeOgSfSnbo986yXdUGTIPTl3NGixQ=;
        b=OXnmWK5A1meUXSUUWjIhCC2RmP/ras31fbUtYdkUuCjTIoQtlD8eddfYRHolFqRj/q
         h9gTQLQbyVazWu/KAI8Gsl6pLQmA8at2Wau/QTft9aB4bHz/q8titnZ3KUiXStXk7Gbx
         b8pA9MPhdbBzRxxAAFPdPbGv1Ka3dI7xKWMVyPgsX7LSuqpOGCe/p1e+7isZpM9XbZuU
         HeyI3UGPS1fQ27dMLG6ihYlUzVp4H1fdc1ZAsFqnAPoc8zuQcMXZalkzI92GCR94V/GD
         /ntEJcz6Dwo7ZMgfZJA3Y4ps6riguEIir/XlYUaMbYY+qyK6U2uD5MsBlvS0EE1ZSl2O
         yvGA==
X-Forwarded-Encrypted: i=1; AJvYcCXACjsNZEoe7C2rfwQVpe7FFz1Thui43sXiPH3Yee2NASOxzTL3Fw7hrYU7Cb2JJQG3k1Uwa9HyHG6KZKPneA/+@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfcp+n99c6/sGviCkFTbbsHqvf4CugF6QkIzub3vfv+KA82UD6
	dvoxasogT3eu16BoylT0VOJHPK+KvEqvSJiNg9WD4FNIgk67JnKFhSmLPCqnxzI=
X-Gm-Gg: ASbGnctxfRqeo5ELN5uzyECz6jMhgDHUCcsS2/4y/JMxyrJqo4/aREEbpQeAOxjbj1G
	ivTeHSDdFatFZuT1AX8PrfV2iqM5iwbAw62+RWgWQJOl8xMNsrl1B9tr4wMiPUa0gNfcXJUJn+I
	jVCRMt2YcUybqRzQqftDcNbHV82WLyaNFAVO+33rd6rLDMcIYFfg4Wyu/T+SPhLunXQzvxchc3n
	IFqD5013UpuJZhLfc+HKloNuhudZjjcU5uLk0rCg0hS0qL9VRSDYD1RSWUd0jhuRumVVaPBVOfg
	Azabq3poA1RBNAbnt3j6FvXQ9GyHyjmMQAdPW4Sg1ek/CHQ1UO3LOWHmICyhnyY=
X-Google-Smtp-Source: AGHT+IFxOKSARBqkkegTT/BsbuPFrrDgx1ik3eNh9a8qIMK8qDnzx+rY6GvlMdOoHHyHuHjMiQD4vQ==
X-Received: by 2002:a05:6820:208:b0:603:f973:1b3 with SMTP id 006d021491bc7-607fa81c1f3mr5567422eaf.0.1746460198572;
        Mon, 05 May 2025 08:49:58 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-607e7fe84a8sm1606217eaf.36.2025.05.05.08.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 08:49:57 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>,
	daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 2/3] firmware: imx: move get power mode function from scu-pd.c to misc.c
Date: Mon,  5 May 2025 12:48:48 -0300
Message-Id: <20250505154849.64889-3-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505154849.64889-1-hiagofranco@gmail.com>
References: <20250505154849.64889-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_084959_620794_44D1706F 
X-CRM114-Status: GOOD (  19.68  )
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

From: Hiago De Franco <hiago.franco@toradex.com>

Move imx_sc_get_pd_power() from pmdomain/imx/scu-pd.c to
firmware/imx/misc.c and rename it to imx_sc_pm_get_resource_power_mode()
to maintain the same naming logic with other functions in misc.c.

This makes the API available for other use cases. For example,
remoteproc/imx_rproc.c can now use this function to check the power mode
of the remote core.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 drivers/firmware/imx/misc.c           | 47 +++++++++++++++++++++++++++
 drivers/pmdomain/imx/scu-pd.c         | 29 ++++-------------
 include/linux/firmware/imx/svc/misc.h |  8 +++++
 3 files changed, 62 insertions(+), 22 deletions(-)

diff --git a/drivers/firmware/imx/misc.c b/drivers/firmware/imx/misc.c
index d073cb3ce699..61fcb0066ec9 100644
--- a/drivers/firmware/imx/misc.c
+++ b/drivers/firmware/imx/misc.c
@@ -37,6 +37,18 @@ struct imx_sc_msg_resp_misc_get_ctrl {
 	u32 val;
 } __packed __aligned(4);
 
+struct imx_sc_msg_req_get_resource_power_mode {
+	struct imx_sc_rpc_msg hdr;
+	union {
+		struct {
+			u16 resource;
+		} req;
+		struct {
+			u8 mode;
+		} resp;
+	} data;
+} __packed __aligned(4);
+
 /*
  * This function sets a miscellaneous control value.
  *
@@ -135,3 +147,38 @@ int imx_sc_pm_cpu_start(struct imx_sc_ipc *ipc, u32 resource,
 	return imx_scu_call_rpc(ipc, &msg, true);
 }
 EXPORT_SYMBOL(imx_sc_pm_cpu_start);
+
+/*
+ * This function gets the power mode from a given @resource
+ *
+ * @param[in]     ipc         IPC handle
+ * @param[in]     resource    resource to check the power mode
+ *
+ * @return Returns < 0 for errors or the following for success:
+ * IMX_SC_PM_PW_MODE_OFF  0	Power off
+ * IMX_SC_PM_PW_MODE_STBY 1	Power in standby
+ * IMX_SC_PM_PW_MODE_LP   2	Power in low-power
+ * IMX_SC_PM_PW_MODE_ON   3	Power on
+ *
+ * These are defined under firmware/imx/svc/pm.h
+ */
+int imx_sc_pm_get_resource_power_mode(struct imx_sc_ipc *ipc, u32 resource)
+{
+	struct imx_sc_msg_req_get_resource_power_mode msg;
+	struct imx_sc_rpc_msg *hdr = &msg.hdr;
+	int ret;
+
+	hdr->ver = IMX_SC_RPC_VERSION;
+	hdr->svc = IMX_SC_RPC_SVC_PM;
+	hdr->func = IMX_SC_PM_FUNC_GET_RESOURCE_POWER_MODE;
+	hdr->size = 2;
+
+	msg.data.req.resource = resource;
+
+	ret = imx_scu_call_rpc(ipc, &msg, true);
+	if (ret)
+		return ret;
+
+	return msg.data.resp.mode;
+}
+EXPORT_SYMBOL(imx_sc_pm_get_resource_power_mode);
diff --git a/drivers/pmdomain/imx/scu-pd.c b/drivers/pmdomain/imx/scu-pd.c
index 01d465d88f60..945f972e636f 100644
--- a/drivers/pmdomain/imx/scu-pd.c
+++ b/drivers/pmdomain/imx/scu-pd.c
@@ -54,6 +54,7 @@
 #include <dt-bindings/firmware/imx/rsrc.h>
 #include <linux/console.h>
 #include <linux/firmware/imx/sci.h>
+#include <linux/firmware/imx/svc/misc.h>
 #include <linux/firmware/imx/svc/rm.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -328,27 +329,6 @@ static void imx_sc_pd_get_console_rsrc(void)
 	imx_con_rsrc = specs.args[0];
 }
 
-static int imx_sc_get_pd_power(struct device *dev, u32 rsrc)
-{
-	struct imx_sc_msg_req_get_resource_power_mode msg;
-	struct imx_sc_rpc_msg *hdr = &msg.hdr;
-	int ret;
-
-	hdr->ver = IMX_SC_RPC_VERSION;
-	hdr->svc = IMX_SC_RPC_SVC_PM;
-	hdr->func = IMX_SC_PM_FUNC_GET_RESOURCE_POWER_MODE;
-	hdr->size = 2;
-
-	msg.data.req.resource = rsrc;
-
-	ret = imx_scu_call_rpc(pm_ipc_handle, &msg, true);
-	if (ret)
-		dev_err(dev, "failed to get power resource %d mode, ret %d\n",
-			rsrc, ret);
-
-	return msg.data.resp.mode;
-}
-
 static int imx_sc_pd_power(struct generic_pm_domain *domain, bool power_on)
 {
 	struct imx_sc_msg_req_set_resource_power_mode msg;
@@ -438,7 +418,12 @@ imx_scu_add_pm_domain(struct device *dev, int idx,
 	if (imx_con_rsrc == sc_pd->rsrc)
 		sc_pd->pd.flags = GENPD_FLAG_RPM_ALWAYS_ON;
 
-	mode = imx_sc_get_pd_power(dev, pd_ranges->rsrc + idx);
+	mode = imx_sc_pm_get_resource_power_mode(pm_ipc_handle,
+						 pd_ranges->rsrc + idx);
+	if (mode < 0)
+		dev_err(dev, "failed to get power resource %d mode, ret %d\n",
+			pd_ranges->rsrc + idx, mode);
+
 	if (mode == IMX_SC_PM_PW_MODE_ON)
 		is_off = false;
 	else
diff --git a/include/linux/firmware/imx/svc/misc.h b/include/linux/firmware/imx/svc/misc.h
index 760db08a67fc..376c800a88d0 100644
--- a/include/linux/firmware/imx/svc/misc.h
+++ b/include/linux/firmware/imx/svc/misc.h
@@ -55,6 +55,8 @@ int imx_sc_misc_get_control(struct imx_sc_ipc *ipc, u32 resource,
 
 int imx_sc_pm_cpu_start(struct imx_sc_ipc *ipc, u32 resource,
 			bool enable, u64 phys_addr);
+
+int imx_sc_pm_get_resource_power_mode(struct imx_sc_ipc *ipc, u32 resource);
 #else
 static inline int imx_sc_misc_set_control(struct imx_sc_ipc *ipc,
 					  u32 resource, u8 ctrl, u32 val)
@@ -73,5 +75,11 @@ static inline int imx_sc_pm_cpu_start(struct imx_sc_ipc *ipc, u32 resource,
 {
 	return -ENOTSUPP;
 }
+
+static inline int imx_sc_pm_get_resource_power_mode(struct imx_sc_ipc *ipc,
+						    u32 resource)
+{
+	return -ENOTSUPP;
+}
 #endif
 #endif /* _SC_MISC_API_H */
-- 
2.39.5


