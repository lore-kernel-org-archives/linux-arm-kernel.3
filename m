Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AE0C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RO45tkjbLYjYtv/CvK6w8KfE5OYOXfvwguuZ43NCctQ=; b=kAYFejsUX0poh3Xr73vNjNqxpD
	QoI76DxeZQhr3VjYq+iyAtS+TkcuzgIYhrDoNwlQoSX4KtmHHJfT4NJxf2Yg1Jt607ot5Vk17TchJ
	o7wFD2Fi+/bStwAgDaXw19+2BMUcLPjw5mYHSmm4hR0lX5j+XxGUfPbjI6DEk/+Zm6CDhOATyjJ59
	r9+O1+dz1YGpzlfwm9yreGjzK3TSYtourQSx3+NEqInhawEG9KDvoBBlLAYHUMDYK+yo0kgLaiH07
	VyX0ECyu2FgrrnHLlsMhAyDPvcf5Mq8Sp3GWUksSm5ASUe1jPRC1C+51ICch9uhxntj13Ks6fGJtW
	LL41QJxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiWx-0000000GIZI-2iBl;
	Wed, 07 May 2025 17:26:03 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChDe-0000000G4xs-37gP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 16:02:04 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-30ac55f595fso84172a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 09:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746633722; x=1747238522; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RO45tkjbLYjYtv/CvK6w8KfE5OYOXfvwguuZ43NCctQ=;
        b=OgmAONnGAizZ7toI2wMV7FVn+yRFpcb7BoH2cOvcm1lxHWDGAcosmgNEiqKZyOje9e
         dOGf30TLmebNSOsKDi3iLObsLRfqqcs/ASiMc7VcStno8lrqxtTii8fxg//p1ZHns5Lt
         vFtUA7aFsR4KjklEeEqDhuSxSKIPlHbUhmO2bkiCifdsmwULsjqCBck+EMwo7IsRT3ed
         kaRSkYP5F1hCcnVBS1KQcc/mUHg5PTbCy+KOvXqYWK0qKjjZfXucaidZG7vawOkIevPg
         N2Ak+xSHjK/JYYS0fwtDOrEQC99JOQa/owPFwzEJ9YiA4/FYYoG3tc3aD07jKOcVtOp6
         C6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746633722; x=1747238522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RO45tkjbLYjYtv/CvK6w8KfE5OYOXfvwguuZ43NCctQ=;
        b=pT6HlB1WwUIktLm09tl4viCeCX6G2GyQniYNLFXeVVWxDUSsOJpnSqgfB+RtGxkMVU
         NuDdVMyOm15dE6nUWfKJAr8ykKPZXMQP/P1v8tgjrLs8vMI/E2FLOdaZNzAIl3WFNGWJ
         3mHHA7IJ65qagSJS9zhZuwBXUhHKz4SBdCc9Xy1g7CXNyn+BG0y3lEBCxwX5tdtjXXDH
         FsrmSes+V7bFdU/rVwRS1EKClpKYOxUXwy/rOKAeXevqhpHtC4w0Gp63M7UpkpzBc+0L
         nnXoA72xxxChEKfpvlebgnJwsbq8GDAyHWc9DQlv2XjXcC020iswfYQkAhlqLN4Y80de
         P7lA==
X-Forwarded-Encrypted: i=1; AJvYcCVIQyQBEYuYOlsUik2HQXvBRN+9kDFG4zdXd5qfJ7aXQYW0VNl78w7t9dA4R/jZOxrKXzdyLaOy9BN9MqCSaWHC@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3y1QYBbqyxGrIxQO2a4H2j655KKIEbqj1LUPK0cQwA/0a+j9j
	75e9QqOv9xVsNJNNuLQw/OcXlbcq4Gc7Ru0yDZw3Ufv/VQY5anq/
X-Gm-Gg: ASbGncuk+0JoSL6dS/bcqaIvAAWSgPpxQI8DRvB22OxYToLd+MJoaT3FwA9TqY2BMk/
	eXyVtUCw7UoC8DtFc0mEZSSwVEpuwmRW5DfG+WyjkE3EBHep6vURxDYCdhdppbGDRM3v4QZP+Gu
	VEIxGDd9aRXSBM/Ucs4sz+fgH989r952B3yOILpu1+5G4plnKjZpbS4+6htDtT2VVyTQkv2gH/3
	mEclfZv72FuwAjKQKjParIv6TOPNq775y/biyfJyb47Q8P6GGS3v9BTAwFDNucRN9lZSG+a8rDS
	iwZ6kEtZZilvQUrEfdrho7iKQneVHU7+gEdXFGUwsXWR78IuJfwO8TJD/3BbRv8=
X-Google-Smtp-Source: AGHT+IEmJOhnycByNLVKMR/CtrELFdJfDJP1ErBRH92r56MtV1Kyb3oVdVNaoaxWV8fLKFKyiXWbdQ==
X-Received: by 2002:a17:90b:554e:b0:2ff:6e72:b8e9 with SMTP id 98e67ed59e1d1-30aac2837bcmr6500291a91.25.1746633721722;
        Wed, 07 May 2025 09:02:01 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4f82b86sm327242a91.44.2025.05.07.09.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 09:02:01 -0700 (PDT)
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
Subject: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for remote core attachment
Date: Wed,  7 May 2025 13:00:56 -0300
Message-Id: <20250507160056.11876-4-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250507160056.11876-1-hiagofranco@gmail.com>
References: <20250507160056.11876-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_090202_799336_7564C573 
X-CRM114-Status: GOOD (  15.29  )
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
v2: Dropped unecessary include. Removed the imx_rproc_is_on function, as
suggested.
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


