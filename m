Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C207CC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FatHGE4VIxz/uHqMMNdNrLoSBEdfAr4ZgsRcgU3Gsk=; b=j6Dc9pKAP+I3lph02Yf8m4YKok
	YA2jkvds+fA/N/wVgNVzrkINMd/JJn4UHFX0IyZoEgUgydPc3SMqUzcv8U9Oanbp9kuDLWVxqrp/i
	i94MH8cS2RQPIP1PqA1JbqtOVoRkcjkPZMSNfdQUiT8FRjfnjukqD/9SFIViI0lJBnYrTOXLE5mTO
	VD8Gc0GPh7WfYqAy+ra8mT3eEL0Y+exgn4dHOU503Dk9ZIc6jiZhshnct+dRq0Ch8tG7WlmHdwEPj
	3Z3sqCQIxMU03gje3tv3kedsGNJhCMD5k/Yzw3lvYogen1HzQRfF8kt0WGmSqsPoXUEaIfW5DS5G2
	5qm005fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiWu-0000000GITp-28px;
	Wed, 07 May 2025 17:26:00 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChDW-0000000G4vM-0sJ7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 16:01:55 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-af523f4511fso6274803a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 09:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746633713; x=1747238513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FatHGE4VIxz/uHqMMNdNrLoSBEdfAr4ZgsRcgU3Gsk=;
        b=kwa0vBBh/MeurFaIRzTIJ36Bb4dSolJLeBYgOujTVkbNVy4qqHhFkpgpqFRGncZpSx
         M68CriV0id8Y2P+VjIdC7ju2HhIhd44FM3EXGQRv0zhY/ZDfrpNl2n+KPF5s6UzVZWWM
         qWGM9OqOGA7mngAh4qDOUZnB/4BgM9LTnnHyzha6ZoSN/64KsnTvg4FQpbD9h/ElZ8K3
         Gdz3VTS13dcsYQFp0qzn6b4+mXMJfTWw2avsDzTXeqDrplbD3/qeUPs+pwrT2dSP3bXE
         iMTKZ4QY/nZB/Q37pBteqOg5hld19eUIASBJSM2bmLPVg+t41UzK0EI4JloRXVErQuCB
         XiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746633713; x=1747238513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6FatHGE4VIxz/uHqMMNdNrLoSBEdfAr4ZgsRcgU3Gsk=;
        b=Ox+mtsjnArhAAiuGnTvTktIprUyjEVPPb0pQKIhH8Ex8U+1GLVcHe99BeIl+m7/SjQ
         EIK4p/wuOriIU5LtATS5CLvXAvrEf8L5kNDOOnQn3zFQ68i7b07H3Qh6dWmFMkhN5XfL
         eWTvj2NF1+BDGcsnoeJDkhhCp2xxKYL5szRxG8cgJXhA+GP2SBJHJpYDJlgC4u/uZNcU
         36QsHBDGZIhBtiJaSCL0xjUhX/rPdAOpL6N8uoCnYeggge8pt44IL5pAO/Zus8QpZc+G
         ka1R4L2Ml5rbzkS4u8D5j6srkhZr691wwRwG7bKWaqmp3DWw0L4tXpR4vVZexa1Gq4Ls
         n4fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmVbEBcHy70pt0BzsOkz85BiDAjfUMCUt5kq/iOYbxQozEbWfqONT592UlzUWwFz5axbVh06A4aWF7CqWyxBct@lists.infradead.org
X-Gm-Message-State: AOJu0YzswFgVj01oRQ2v5LTBZ3F1P+1qbCSEVCUpZwcCmh0gY5j+5MbO
	mEJH9O+qStLGLcqPhGaa+FZ4XJIDJb0/GFOckTHZcvY4dwXW3IOG
X-Gm-Gg: ASbGnctKTNCUyyupu2j3OyXEXeQp066teKjkvoDoehIT7sxPjUmmS1GMLiTtbS/KYx1
	mOIS9pYIvuFdUE9Vk00/h2o0b+h62/JuIFDfI4AYjmmaaPhpbFz5njQF/D6TT+SgMw9YYMJh+DL
	QnlYfgXb+SxcB8/Wv9frrtBZbTy7Unf/SUyBUzofGB3NkNAJEblT4/185v2cPfU45oLLNwZGu9Z
	71mmAoUN4hX0v9yZgKQpu5zjDNgBcu6Qty3PamsZTiXqKvlcvs3fV85SjxpTyhB3j/7OLNlrd4u
	OliDfEY5JHgkSp2C08z+l+IS/Y6l7FZfn3dKX1kbheOoMw7dmdO6HoJwwzYQUKo=
X-Google-Smtp-Source: AGHT+IElN0mEQWXnntlpRZoPMaa3u2Zy25YDRR9cYt9Rbr4v3uf0PKx7X6rpO9MYHkvEDDFPthmmXQ==
X-Received: by 2002:a17:90a:d2c8:b0:2f4:432d:250d with SMTP id 98e67ed59e1d1-30aac19d0c4mr5773367a91.21.1746633712887;
        Wed, 07 May 2025 09:01:52 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4f82b86sm327242a91.44.2025.05.07.09.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 09:01:52 -0700 (PDT)
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
Subject: [PATCH v2 1/3] firmware: imx: move get power mode function from scu-pd.c to misc.c
Date: Wed,  7 May 2025 13:00:54 -0300
Message-Id: <20250507160056.11876-2-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250507160056.11876-1-hiagofranco@gmail.com>
References: <20250507160056.11876-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_090154_248552_D38F52D5 
X-CRM114-Status: GOOD (  20.93  )
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
v2: moved this patch to be the first one
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


