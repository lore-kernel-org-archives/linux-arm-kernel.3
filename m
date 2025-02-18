Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DCAC021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 19:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ae5CUAqvFWLqCxBuF5XhzMM5neQb6Ke5yTuZdxcdHBI=; b=tUvbVpjJk4gzK9xVP1obJBC5xr
	36YDVLaP4G6DjTrJZs0su77CfkHP9ABJUczStjuJn9VoeaHFcoOnjaE3NVmjNb/ck7BHUeAXKhdMe
	qBKGlcSGWrANrwT7UOKfadJqasD0pbjBQ2j5rBxIpePPApcq8dtHDJM0bzoErCzBL6QlLZwA2LTl7
	op20whCbmrrigYghmQmaeTjpmQiYd/nP2A9XLHEm+1OjQ0zqqhZFi9kNLOis5Hy/T20sByxqJrhVd
	T1+36pdjsrHL+G5v/aL8GdYTq5ekA1q21cM2yN8eWqSG7WrMdtR8QPz0QbrBzHMbcz1d3gHHOmOJG
	6PzfMrqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTUY-00000009chb-1M08;
	Tue, 18 Feb 2025 19:42:50 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSnN-00000009T2S-1BPk;
	Tue, 18 Feb 2025 18:58:14 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-471eb0e3536so46684431cf.3;
        Tue, 18 Feb 2025 10:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739905092; x=1740509892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ae5CUAqvFWLqCxBuF5XhzMM5neQb6Ke5yTuZdxcdHBI=;
        b=g9bmTcK9o+0aMcRjy8klpobB03KzNgnil87dsQRb9O0bVGnubHdb2/IRkLZJnpJhJJ
         DoXFZwi+/6nle/VJ2EcZdGbdsxkIhbijcsz2D5yvjwkrdC1QwTiGTtyTZwE4Tiay/zYX
         ycA/yBMGjoKfy+fQSmp+JjPmJjpvgFgBVpXynNiZwV2cia6l+/Gbb7pEs0UVk+tv2dj2
         iP6OTEWycnhnKReLaHICGJCUi+FbgJtER85m17VFjRcnxbBOItuF1ipbY/Qs6ey5fslc
         zRLAIaZctU9nBJGdJpeOokN0hXKcvUialL/jWwW0xPPI22JR3i09LB/LNRZpEdejPnpS
         cbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739905092; x=1740509892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ae5CUAqvFWLqCxBuF5XhzMM5neQb6Ke5yTuZdxcdHBI=;
        b=uDzgAx7LUZbwQ83zxc72im2T4dMEiT9+hLbPRTrdf3+qM5nqqDRG/Oah2e2BxovsWN
         dEAmYISO/2pjNHtQH8wJt60svqeGysOfopEQXfEMdE3nbG5u4/77XgH3V/sy8wYLZL/L
         4J/S5YshfU9pDp2FsmVdOeKnbasR3ye6uRqSBmWoybTyrXtw24jb/UOsb/UUGbTuOPez
         Q3WzKdOnEVCTgaSiNmtKz1hN5cg551LxQEsGNXiHWVoRuKmT4FzE/HYEzVr7ZrBn+uWv
         GIk3c+lNyz1B3kq8HBDZ/+WkDybtyvByYYfZrcHK9MvMzQJHWm5hi98hyRnicx/4Vvym
         4/YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr7ETuSxVC8e8GYgIPEXbyrdsbUedivG97JNx7IgmJAQ5WaAXzEdHXm65uAxCN4+wDuP3yI6eGJT4t+DSpRD7R@lists.infradead.org, AJvYcCXd97OfDi9uLpBJULfoiW3IBKRxELPmBLoGEwFnKIMlypeyLBnkAAUGgtu9zjDQnzChBqWmUgiPLgFaUEarYXQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyrfBziIpW6HsNo7lphVYPtd7seOcjoFum//ftHmsHl/jSzFBSp
	asLUp+XAAHRgjnCgRqJkO3+RDNVnMsMBzyM6UG8ITqjBXcr5dTi8
X-Gm-Gg: ASbGncvbpQOeCpng60n4yO5lo/t8ntiOZdIsF4dl5l0FKpvLyt2JrFA2yyhPJN3Ft/J
	WSRIqUp1/xyOYhtsWF9vvkZZJu8HSrXXbUXW0gS9v3ksn2DO+xFV/ViaJwpib1utYaXotvyHEt1
	4nMek3JOff7EP/U+bO8CZb8zLo6+Q/jEeGhjeSFuffmQ2kT6WUgrMz5JYhyFtgwa6AMgwy4npYF
	VDa5xvqXr1/+FV7n0MJ+6hfrWVUr/gAILG4Yqxby9w73vmw9Nmmkn5OrGWs5JTk4B4oH3Xy7hK9
	Qquv4Oar7JHFix5CeBft1ZcM1pkiNP87Cq+xMw==
X-Google-Smtp-Source: AGHT+IEBUpcPJIeS91rT5iM8/z85eHzjoA42gXRp32LDonh/AwlEudjIz2MzjR25aealFM9CLGUITw==
X-Received: by 2002:ad4:4eed:0:b0:6d4:e0a:230e with SMTP id 6a1803df08f44-6e66ccc114cmr224422306d6.16.1739905092130;
        Tue, 18 Feb 2025 10:58:12 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65d7a40bdsm66803016d6.59.2025.02.18.10.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 10:58:11 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: sebastian.fricke@collabora.com
Cc: andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	fullwaywang@outlook.com,
	jiashengjiangcool@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	mchehab@kernel.org,
	tiffany.lin@mediatek.com,
	yunfei.dong@mediatek.com
Subject: [PATCH v2] media: mediatek: vcodec: Fix a resource leak related to the scp device in FW initialization
Date: Tue, 18 Feb 2025 18:58:09 +0000
Message-Id: <20250218185809.37130-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <195061eaa10.dcfe0edc1589793.425795569509706466@collabora.com>
References: <195061eaa10.dcfe0edc1589793.425795569509706466@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_105813_319993_989119B3 
X-CRM114-Status: GOOD (  13.86  )
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

On Mediatek devices with a system companion processor (SCP) the mtk_scp
structure has to be removed explicitly to avoid a resource leak.
Free the structure in case the allocation of the firmware structure fails
during the firmware initialization.

Fixes: 53dbe0850444 ("media: mtk-vcodec: potential null pointer deference in SCP")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v1 -> v2:

1. Reword the commit message to give more context.
---
 .../platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c      | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
index ff23b225db70..1b0bc47355c0 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
@@ -79,8 +79,11 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *priv, enum mtk_vcodec_fw_use
 	}
 
 	fw = devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
-	if (!fw)
+	if (!fw) {
+		scp_put(scp);
 		return ERR_PTR(-ENOMEM);
+	}
+
 	fw->type = SCP;
 	fw->ops = &mtk_vcodec_rproc_msg;
 	fw->scp = scp;
-- 
2.25.1


