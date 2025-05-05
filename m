Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317E4C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 15:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzxoNjX13i4eG31sNq5COpLdWdwplkA/ut9vzb6w+YA=; b=u+tsd2G/0E7NCgsOtYXN0OZ+So
	L2HvpYNYnPrjmDvdA3SMNFSdbcZ24SQvt40fyNi0HrNo3xhZ/3u4eVV3MNxbdH4Q3wd2Jva1/ox7k
	/8Ttf5tuL0X6yS/+HeJoV4sDFl6ZITnrhUeH5NNLOGIl1yIxEEQwa1PiNTGFDeabY8KFkIaEGkiMW
	IiiZ+Rm8/Q2rQyCB3sdQJaZZ9CCfebtNJXSMSUl4eNH/tApoX02+49byJtNSzwzy6VW5gWPpztZkD
	amrSNlvY84M+u1d9Skak3cSYf0cQuqTl00bV5oUkyvJ5KqpksNFqWNW81Bcasa7g965ogJbnEabjQ
	hHGMoxjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uByCa-00000007tr8-09FU;
	Mon, 05 May 2025 15:57:56 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBy4y-00000007sYA-1Whb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 15:50:06 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-605f7d3216bso1047671eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 08:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746460203; x=1747065003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzxoNjX13i4eG31sNq5COpLdWdwplkA/ut9vzb6w+YA=;
        b=S39lIKDQePbeCu6B7cf4M3v/6HQR98gx7YO+gX6KPaxDDaHoXI998E0vfSe809204W
         uNMVJ6IhWoPjg9CmoMuXqe4Pl2CajQn+SRYbcCK60tlga1nI3GSErkhuSz9ccntdCsLG
         IrCnGW4EiPbGgNcRuoDwCjHrhheFx4IExsu7wC/YQq6ZnDMm5wqYLnPwA8T6VK8RZaGM
         3GMEVufoFDyMqwoRTMeqeNmNI0f08vJD7aQcucI5NdUOkAcVIN/vY90kqh356EryUnHu
         Ih3CNCzUTPgWmXN8dvAFqoqVFkVgZX6wl3uhS15hXOnDG5d/K7ioJd68A6IL2FQwDEV4
         wMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746460203; x=1747065003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QzxoNjX13i4eG31sNq5COpLdWdwplkA/ut9vzb6w+YA=;
        b=WrLLOXbxIPuogYjnaQSJh7HQ/dwks6938geuJkTHoPEQXFcLhpO2iVyY/5whh+X1Vx
         q24A+m+TkSxFHsY28mYhxppm5c+hCQtbmotYEeOn3s3pxCGe5kAe+OHW0EIMUe/c0XAi
         RfXujhG0zE/k7yytpKvysfJsAYL8ng6t4IezsexlULU/RBzU/Ht3XAtb8shG4ULSrxrn
         zTrhR0DOqrv3vIARJ5RAtP2KQVZ/YKSAJ/isfiRQR34789zKaGKNaeLxKNcdW2K97UgJ
         6LxFk2lSV9WjuMh/z5lYXWYLfWn+VoiF8Ni8M77WY4AVaBtbvrsBkGRJfL03gRMRwTPF
         g1sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLabuWbvZvHhDr44qERd0NrzvJkZ78HyDnO2d8HPjhnjOqu/w1ghyztMIWyhxD7FfbHZBz1rTb96QfYVWnNJkH@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr5HepRhMey2plGxD9MNgu9rHuseCr8QucB+jlIrVbEZ6ZZgRB
	GOFfLvLvUGYYAKzict6vi3zPRkv5g4hrCYVhf8ohMBwFLRTotMK8
X-Gm-Gg: ASbGncvJi0yk2IlzR2qQOO0VMI1d9Uw2w3cQSRwZolFR43ZNrZwC8vB4vTaIDmum79Z
	JBuveaO5VIPJ38RZKbOSPxgWV+T/RYSeyg69O4NIlSLfS9GXSlMXLqTqfOjhp1Xvqe1wV0iaVHM
	UslQ7eAoXtvqbqQOyRZQupAZyKB6EdotTQ/Y4GNEDWckQ9sk8q3i+kalQuIDM+zfZ5lFEZ8akOg
	wax39kVWWnCPDA13tbgvR5amrU47a46ox7uaYQN0y9TaF4iumwiVoynbFEsA/QJD4kKnniTp6lW
	PQDGbtaMl8j6vku3H7wYrVa51swCAm0NXgL+7yiW+XKiKea02xK31LDNwpiIOtM=
X-Google-Smtp-Source: AGHT+IFmXHRAfXFJOCHFZobnyaZvTqkwxSNtmF5ex7yON9mHi0l4M2n37VTw9ZY8eHmQoifZiTSQ/g==
X-Received: by 2002:a4a:ec44:0:b0:607:e293:95b2 with SMTP id 006d021491bc7-607fab26b1emr5755194eaf.8.1746460203351;
        Mon, 05 May 2025 08:50:03 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-607e7fe84a8sm1606217eaf.36.2025.05.05.08.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 08:50:02 -0700 (PDT)
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
Subject: [PATCH 3/3] remoteproc: imx_rproc: add power mode check for remote core attachment
Date: Mon,  5 May 2025 12:48:49 -0300
Message-Id: <20250505154849.64889-4-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505154849.64889-1-hiagofranco@gmail.com>
References: <20250505154849.64889-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_085004_406278_EE35A635 
X-CRM114-Status: GOOD (  16.89  )
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

When the remote core is started before Linux boots (e.g., by the
bootloader), the driver currently is not able to attach because it only
checks for cores running in different partitions. If the core was kicked
by the bootloader, it is in the same partition as Linux and it is
already up and running.

This adds power mode verification through the SCU interface, enabling
the driver to detect when the remote core is already running and
properly attach to it.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
Suggested-by: Peng Fan <peng.fan@oss.nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 627e57a88db2..86541d9d8640 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/firmware/imx/sci.h>
+#include <linux/firmware/imx/svc/misc.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_client.h>
@@ -906,6 +907,21 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
 	return ret < 0 ? ret : 0;
 }
 
+static bool imx_rproc_is_on(struct device *dev, struct imx_sc_ipc *ipc,
+			    u32 resource)
+{
+	int ret;
+
+	ret = imx_sc_pm_get_resource_power_mode(ipc, resource);
+	if (ret < 0) {
+		dev_err(dev, "failed to get power resource %d mode, ret %d\n",
+			resource, ret);
+		return false;
+	}
+
+	return ret == IMX_SC_PM_PW_MODE_ON;
+}
+
 static int imx_rproc_detect_mode(struct imx_rproc *priv)
 {
 	struct regmap_config config = { .name = "imx-rproc" };
@@ -949,6 +965,13 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 			if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
 				return -EINVAL;
 
+			/*
+			 * If remote core is already running (e.g. kicked by
+			 * the bootloader), attach to it.
+			 */
+			if (imx_rproc_is_on(dev, priv->ipc_handle, priv->rsrc_id))
+				priv->rproc->state = RPROC_DETACHED;
+
 			return imx_rproc_attach_pd(priv);
 		}
 
-- 
2.39.5


