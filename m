Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9ABC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 18:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7omkwwv22LywzPK9OnluDC1evnMI2mYZ/bT9rkSvGw8=; b=QE0IsbW57vkxvHzkk+uOxEVTxu
	j6kxz2pn+jTgQetcjAS2fOqB6hy9SD5rjGmZKswSBzP0PYTzjCrB+SRiYG395YMzvulCtVrIBEJmC
	dLiCwd9UuW/9X7z/qvpTmVJdmhATrJloD4O+lkxuqJj+NEq90vmsYe/J+OMUpHKo1ozESgJf6V19U
	EbHYHcjVuGOYf9w9STrjqS52vT/74DQIN1mjtumKrlKMA+VK7kfWy/4h1NuxuxUYXmrEegrk0F2+c
	A9ENHAxnvLEPcoviJl4i+KtZL5k0TI4HSM6IPCVGVrAuMhrvphL5/Rvn8Z4oSJNknrf3RJacBjlNs
	FYlBHtig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4oL-0000000A4AS-2xl3;
	Mon, 19 May 2025 18:02:01 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH46F-00000009wF7-0Lu6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 17:16:28 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-527b70bd90dso1696300e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 10:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747674986; x=1748279786; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7omkwwv22LywzPK9OnluDC1evnMI2mYZ/bT9rkSvGw8=;
        b=Db/2PwQnQvSAIMAOYQeOebfbeMKXVag84sqjK6fQr2lHfSaFKvpp/KYokbNIrvL0L2
         yJeGR2j9ajR3YPPaqXVO4i7908Hni8WVtXUxWITH/2eYjBH+VGq/NpCA1fc8pg0yLzg8
         uEo8ZXs96nc8fBpUqudWm5CAft3t1je4Zb1A8JbMqD6JRT9R21VgwOApPGLmj3AjZqx/
         KYXXQfZfDxSqcFp0noL1JWbuhooYYkr6pXZzHn3efvvS3+IC/+i/iQvv/jKmkPuUTsEl
         6UYTDI6B22aQJVlWqLNQUXfiSH7eB+4J2CTt4dtRE5Vh2iQ4nCyqhdJVQW2m2SyUiDMN
         WzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747674986; x=1748279786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7omkwwv22LywzPK9OnluDC1evnMI2mYZ/bT9rkSvGw8=;
        b=bZ6nx3oNXjn45XUKHh87CIC53AfBeBdAfC93C0msA8D46NtHrUbT7lo85OWJ/e8xM3
         AsFd6C7u2TkPwad0JJoo5tWdfkQxKCpHXEhd5nkmsuxNXd6bTa4yVPXjINmv9xFOeajn
         AYFogBoKZhPrcKn6dzBkMTaw9xNUgYfk3+KDNZrO8Ts69vD/B7qbZDZQyTYqJZ4hl3Fu
         iLJuWaWQzuT2dpQrfyFgXKpwEMQJvrdcgF1q58sG2gStdzvjzL8d9kZ3WR4MAax9g59V
         YJp9aTz/OU+iFc2qZ/0TPQPTNGlXU05wFqeI146Qu/KQklufMAd8U96tMBhH6mr5+44Q
         +XHg==
X-Forwarded-Encrypted: i=1; AJvYcCUHhqVkp7rPMm8wlXzeVWsrt3YEELIsnbjJDNMqSSP6dDIeEacp4Ze6ZJG7yrbaEJEMlplEexXuGlswyoKkaRUj@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6CSdJiZ1pA1jASHsJfltAMNhCK1xjqMFicH9RezKj1AP7E3Qq
	Yg3wnPfBg8l3q5VhKMuBf+eOM1H7eEMMQBUEubQosgt/KFM+NeP7R1iR
X-Gm-Gg: ASbGnctUug4qDTkr94kJX7i1PrncwUQs+7dmq/2Val41VfGIMefbojpennQpIcQw2MD
	N+XldT/HghxPO6EVPJ2cbaE69Qbx8T6pdncI1amkQAjvop6PTgtb8QeLhPaFBxaRaKKole0C3z2
	8+TjOzg1nbeUyu7hZdOyUcEsc0sssU2spXh6y1l2jcqwRp40sfieox6DEOq5x8V4oKm9K4nIlD+
	RNDkhJ7rev0W5Eq/v9avqJJ7xImRaoAASYjRfyn/dRUynszoqusJ5IRAsRAKv5VOroc2Wjr5kfy
	9cv9Okn7Q4VmqP8IaWwcZjgmrVTTKpGzXbgIYKA2hN6jaGkC004HHPa9OqESXu6uEH3NmKjXMOE
	xwVDU3qwk
X-Google-Smtp-Source: AGHT+IE6q6gZqSe9Ip0nuMzYQBfcuFkViraMC2BkT8AsUnpaWIwgC9BeYahAGarm+vPPXTf/z60teQ==
X-Received: by 2002:a05:6122:8c0f:b0:520:3536:feb5 with SMTP id 71dfb90a1353d-52dba97c622mr12664280e0c.11.1747674985608;
        Mon, 19 May 2025 10:16:25 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab4e983sm7003647e0c.31.2025.05.19.10.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:16:25 -0700 (PDT)
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
Subject: [PATCH v3 3/3] remoteproc: imx_rproc: add power mode check for remote core attachment
Date: Mon, 19 May 2025 14:15:14 -0300
Message-Id: <20250519171514.61974-4-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250519171514.61974-1-hiagofranco@gmail.com>
References: <20250519171514.61974-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_101627_123626_55B9C961 
X-CRM114-Status: GOOD (  15.69  )
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
Suggested-by: Peng Fan <peng.fan@nxp.com>
---
v3: Unchanged.
v2: Dropped unecessary include. Removed the imx_rproc_is_on function, as
suggested.
v1: https://lore.kernel.org/lkml/20250505154849.64889-4-hiagofranco@gmail.com/
---
 drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 627e57a88db2..9b6e9e41b7fc 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -949,6 +949,19 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 			if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
 				return -EINVAL;
 
+			/*
+			 * If remote core is already running (e.g. kicked by
+			 * the bootloader), attach to it.
+			 */
+			ret = imx_sc_pm_get_resource_power_mode(priv->ipc_handle,
+								priv->rsrc_id);
+			if (ret < 0)
+				dev_err(dev, "failed to get power resource %d mode, ret %d\n",
+					priv->rsrc_id, ret);
+
+			if (ret == IMX_SC_PM_PW_MODE_ON)
+				priv->rproc->state = RPROC_DETACHED;
+
 			return imx_rproc_attach_pd(priv);
 		}
 
-- 
2.39.5


