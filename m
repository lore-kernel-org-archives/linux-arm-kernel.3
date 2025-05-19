Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9B5C54756
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 18:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1uDXUypTxPVrOjDkyW8a3QEFjfv2DCfH/Ibxzs5fII=; b=FEowW4SuHALXmvkt4ULyjTwfc4
	9W36QuFOHhbz+70lIQUGNdUkJkLOmZeBKt/5qRaJHPerRCYMaReh4RKuDYXM1M5HFuSihLbXhDRa9
	oA1PYJ2gvsEAd52w192hDhtEmwhpQ9JK4prEdZau7gA/hx54em/0cv+3c49tzhpZ0lRV7x7StVic1
	ppcIZxVzXUrNbhAq+AqCHfNdU5N9VY+SyB3zJ34fANcTuUjXG9dAFKCEk63/CLvr+TWU+BC0+qxzD
	CfF02ZEMBluePOGBcjrig/NkoFRVmg4JNjW3NQksKCBdCno1iQEawt9LWZHDPqOfrKgBRNCh61RX4
	E2wvrzpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4qM-0000000A4ZK-1g4H;
	Mon, 19 May 2025 18:04:06 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH46G-00000009wFl-44dQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 17:16:30 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3dc6dbb3d58so10639825ab.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 10:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747674988; x=1748279788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1uDXUypTxPVrOjDkyW8a3QEFjfv2DCfH/Ibxzs5fII=;
        b=HA0sv960NYPjLLcPLS1cOKdAw7X2eNWeojOoKDUEUPcaG6QJZDiWnfa2zmJ7MxTaKr
         mp1c+lFfBP2+6xW3OP22Enbn/LbzWpBYfR2K01O8+dzxCMYfuspGsXWJCbdB+S0dPjto
         D6tx1qQ5NX3ppWJzq+YYRYnEM5prd7E1Z2J2+i5bX8jcXduUlyjZ7rFuX0XDG/+1U3L4
         ByLk2+4YT6CfIT2SR/QEbChgfmd+4iVKkAtL5of5BI03VXTHv4Z/FpLNfHT2T8jyxkIv
         LS3t4ZJFDOOHSowzVoeLuG1t0ASNTA0otVQQ4t1SAS8WsAscvXdUc0bZovfXduUn+VtI
         Bwxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747674988; x=1748279788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1uDXUypTxPVrOjDkyW8a3QEFjfv2DCfH/Ibxzs5fII=;
        b=JhsTJRPzeUq1KbgTo6wRfMc1zcYqlp9HeJzrCOJPASvI/5SJGYKAIvNqWvOAubKx4y
         CmopeX+Jpx+YgkWHM4grK0xo3GiWw6AnX+dHnnLaV3kmWn5GOyBaENsVsgGVkKqMNrZ+
         bc6bAzlvOHn4ugj24ZGMwmyqkdiS/AcjNIas8qFTjTUJ2hAtzl+pLpWaun3HH0WHlQz8
         Rx6kIPuu17jNz73lL9njUeBblmV0LdRV7W8mv4j52CxBSzkAnZoUFddnqJiStkbWeuWu
         siRZt0nhh2wa42A/VWaGsETD2WdmWy2FPOM8HbKNs0lQIqYzPs2fNbqGRChDl/Yjs3fo
         seiw==
X-Forwarded-Encrypted: i=1; AJvYcCV2XFbxQHwTyVLaQ+NUpuqK3nw03Cnv9vogpS/3e2OT97Qrfps81W0ahci3/swsXFt0XbAoIKF9KP3ayomqvwRL@lists.infradead.org
X-Gm-Message-State: AOJu0YwAlAOZGUkrlBA4nQL8ar4ctBIDdcrojI/t4yVadXcGEB4EscrK
	c8KEkeemw22dl7XVDAUeQnzOjfkmc00hmjq1nKrqkYVp3vres83NlzKFJE3zECj+4QY=
X-Gm-Gg: ASbGnctztb8aR/BnaHC567QRAcoE6yQV0aH/0LdKo37sEYRcVCQlJjz/Xl/E16q1TAu
	cEJan0gSI9UoBlrmIGfByPr/gIgW6pqX0b0R4xtKRfEpfknnbv7u2tSvg44ffFDNFDfHv420r8y
	j/oBCDkXzQU6TR50yibIk6cGJNdVMT4RN38AJAlGDR6ulsb+ji7LA46slHf1c8NONxc5b8det6c
	Mepuhg/nmMVP1UoZoyHhHF+pw4BhaXFpR91Lc/rmizA+A2V8Q/PLkFQBuwFy7U38AllJDWwCfrC
	8OeIrT9sU4d3E4yNS9yUzwP9uA5/t1TkPx+UuGlDSG7kVFe9P1yh6nomiHzdIQTMDjasoHXY7Sh
	6+CiaTI8Q
X-Google-Smtp-Source: AGHT+IGcPhmxLm05zfOvv98rT+S8AoJqTq1ZTmACNFyaA4DcN6+SVqyHcTRF8Wm1vE2yc2bqeR6yjA==
X-Received: by 2002:a05:6122:310f:b0:528:bd71:8932 with SMTP id 71dfb90a1353d-52dba9513ddmr11512958e0c.11.1747674976187;
        Mon, 19 May 2025 10:16:16 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab4e983sm7003647e0c.31.2025.05.19.10.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:16:15 -0700 (PDT)
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
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v3 1/3] firmware: imx: introduce imx_sc_pm_get_resource_power_mode()
Date: Mon, 19 May 2025 14:15:12 -0300
Message-Id: <20250519171514.61974-2-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250519171514.61974-1-hiagofranco@gmail.com>
References: <20250519171514.61974-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_101629_010513_BE265FEC 
X-CRM114-Status: GOOD (  21.12  )
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

This SCU API returns the power mode of a given resource.

As example, remoteproc/imx_rproc.c can now use this function to check
the power mode of the remote core to properly set "attached" or
"offline" modes.

Since there is no proper firmware/imx file to place this function, also
introduce firmware/imx/power.c file to keep all the PM functions inside.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
Suggested-by: Peng Fan <peng.fan@nxp.com>
---
v3: New patch.
---
 drivers/firmware/imx/Makefile       |  2 +-
 drivers/firmware/imx/power.c        | 52 +++++++++++++++++++++++++++++
 include/linux/firmware/imx/svc/pm.h |  9 +++++
 3 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 drivers/firmware/imx/power.c

diff --git a/drivers/firmware/imx/Makefile b/drivers/firmware/imx/Makefile
index 8d046c341be8..5f5548e34459 100644
--- a/drivers/firmware/imx/Makefile
+++ b/drivers/firmware/imx/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_IMX_DSP)		+= imx-dsp.o
-obj-$(CONFIG_IMX_SCU)		+= imx-scu.o misc.o imx-scu-irq.o rm.o imx-scu-soc.o
+obj-$(CONFIG_IMX_SCU)		+= imx-scu.o misc.o imx-scu-irq.o rm.o imx-scu-soc.o power.o
 obj-${CONFIG_IMX_SCMI_MISC_DRV}	+= sm-misc.o
diff --git a/drivers/firmware/imx/power.c b/drivers/firmware/imx/power.c
new file mode 100644
index 000000000000..b982cebba72a
--- /dev/null
+++ b/drivers/firmware/imx/power.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * File containing client-side RPC functions for the PM (Power Management)
+ * service. These function are ported to clients that communicate to the SC.
+ */
+
+#include <linux/firmware/imx/svc/pm.h>
+
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
+/**
+ * imx_sc_pm_get_resource_power_mode - Get power mode from a given resource.
+ * @ipc: IPC handle.
+ * @resource: Resource to check the power mode.
+ *
+ * Return: Returns < 0 for errors or the following for success:
+ * * %IMX_SC_PM_PW_MODE_OFF	- Power off
+ * * %IMX_SC_PM_PW_MODE_STBY	- Power in standby
+ * * %IMX_SC_PM_PW_MODE_LP	- Power in low-power
+ * * %IMX_SC_PM_PW_MODE_ON	- Power on
+ *
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
diff --git a/include/linux/firmware/imx/svc/pm.h b/include/linux/firmware/imx/svc/pm.h
index 1f6975dd37b0..56e93a953295 100644
--- a/include/linux/firmware/imx/svc/pm.h
+++ b/include/linux/firmware/imx/svc/pm.h
@@ -82,4 +82,13 @@ enum imx_sc_pm_func {
 #define IMX_SC_PM_PARENT_PLL2	3	/* Parent in PLL2 or PLL0/4 */
 #define IMX_SC_PM_PARENT_BYPS	4	/* Parent is a bypass clock. */
 
+#if IS_ENABLED(CONFIG_IMX_SCU)
+int imx_sc_pm_get_resource_power_mode(struct imx_sc_ipc *ipc, u32 resource);
+#else
+static inline int imx_sc_pm_get_resource_power_mode(struct imx_sc_ipc *ipc,
+						    u32 resource)
+{
+	return -EOPNOTSUPP;
+}
+#endif
 #endif /* _SC_PM_API_H */
-- 
2.39.5


