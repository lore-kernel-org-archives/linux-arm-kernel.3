Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B29ED339AF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 17:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Te/9/WdXEHbGw1bV3Tw3mQ9dGEF+E7KMYxRV/chzUCY=; b=i4E0YHvKPEbfpFXFISvzAG5SA2
	lKPvGPil0wEa6rSFWII7CmTV/Ck4sxOilQ8ZX39ARSe5L1qv8e+XLLb7cPRqA8uRgq+iSRwGpCN0X
	mCJSnZAC0lmgbOxLwx4xS5RMUNtBDIMdXFi7OGDO7mdExG1Fijdp/jsWlnYRZmTMZ9bJUQTCGNSer
	EQLzVTaU7ZpyaZ7gi5dfORP/1MQbGZWY/J8bDE1SB3mWz1gZpwVM97zFb95k8nkFCcmKxBvQRhxWz
	dkDCtaOgr3M1heAquA2Tpj3PdvL2+hAullmTLC6IrgY5XD4PTccHg7vfsgQw0BF/mUU66sHEy6Vwu
	PVi+1noA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Tu5-0000000BiHn-45iU;
	Mon, 28 Oct 2024 17:51:45 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TjA-0000000Bg6t-2Qkq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 17:40:29 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-37d50fad249so3437935f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 10:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730137227; x=1730742027; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Te/9/WdXEHbGw1bV3Tw3mQ9dGEF+E7KMYxRV/chzUCY=;
        b=3XafDNCF+p8mDtdux5lfjcTliLPzb8p995R1xdMlvNM42Jh/GV0PwAJXdJF1QO6X+U
         +4X8i2Kk9odJiqSELIHnoLgL4otTxai938qbp4pwWWXucpgr89SISiryPPpwTXy+srrK
         fTgQkQSg4CaA6ITtVrtw7YdaBNYCCMYe+KdKWyGXTHMD6qGIvKd6qUvqCOkm9XezkGH0
         bGbEGolbPAuI0bfYASvdhs3rzZQ4Qr4VRYFQJT3h/PdBjoQgp59PoZR9jfaV1NyHLtLE
         ni6GF7rhbx6XlYYZR0WBRXSFuYtHf0Z+u3n1xm/1P7UTjYPUciZZwcFLTtHf6uwiQO4V
         OEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730137227; x=1730742027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Te/9/WdXEHbGw1bV3Tw3mQ9dGEF+E7KMYxRV/chzUCY=;
        b=wTneR+t1YQgdBfKaI+VqnQWyKKAsQcvXNeWQUTOwgQIWkdd3ERAPls5E6V/ycuyAfE
         nCXL6KW2ZQkfTsrjn8pHgQck1eFCDAAgUOPo/Sx892HYKeC+M0Dp6S3dS83Z7WqvxLOz
         ei7lrN46U1HvAYvCQbcda0VNB8PUz7Eucx/xepY176h29rdabShZagOWU7d3A4U/IeNv
         ZFm4M4H3t3phSB/SJiXVWpRoDvcc7wTcSMgOLeGpXouZFYq4/CBaHnXRHTeWkHVxlO+F
         DLB+nWhtJer4yXrBROuKKm9a/l/lXaEmnubxua95hfbfLtp0QCKsHKlBh37u3QlVWcz8
         UifA==
X-Forwarded-Encrypted: i=1; AJvYcCUObNaJEapE9PNO+CUYZU6gBvkT38WwfY50eGGR/15sCOh1fqyfgDCJ6GE3mHVm1mh2UXoST/K8oUF1NVT4QONW@lists.infradead.org
X-Gm-Message-State: AOJu0YwY9k1Su6EpG1uwrd+CCfab9sIrBnzJp0ZIp4IYEXF7fXNfsBO4
	B7DcTqcET5rx5pKsh9M5Kl4tGBF4OqaudXiZeegUC21fKdPBjDNCzfxko1Ez7xQ=
X-Google-Smtp-Source: AGHT+IFqMPdBogulD24ryHYACs/0/kPy+ME5m39YFDX+/TOrN8GU2WdBOh9BaqWlHQ/G2u6uOhGjww==
X-Received: by 2002:adf:fa07:0:b0:37d:54de:1609 with SMTP id ffacd0b85a97d-380610f3056mr6761435f8f.10.1730137226809;
        Mon, 28 Oct 2024 10:40:26 -0700 (PDT)
Received: from localhost ([2001:4091:a245:81f4:340d:1a9d:1fa6:531f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b714fesm10130545f8f.71.2024.10.28.10.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:40:26 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 28 Oct 2024 18:38:12 +0100
Subject: [PATCH v5 6/9] can: m_can: Add use of optional regulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-topic-mcan-wakeup-source-v6-12-v5-6-33edc0aba629@baylibre.com>
References: <20241028-topic-mcan-wakeup-source-v6-12-v5-0-33edc0aba629@baylibre.com>
In-Reply-To: <20241028-topic-mcan-wakeup-source-v6-12-v5-0-33edc0aba629@baylibre.com>
To: Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-can@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Simon Horman <horms@kernel.org>, 
 Vincent MAILHOL <mailhol.vincent@wanadoo.fr>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1254; i=msp@baylibre.com;
 h=from:subject:message-id; bh=f+4c/xAyZM4ng0MgHl2luM8EJirET+RfnpCZLFWpJ+I=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNLlz2QdE8mMSbp8bbLv+ZxJ8W/43HN2iuR/eBo7KWhiW
 9W35aeMOkpZGMQ4GGTFFFnuflj4rk7u+oKIdY8cYeawMoEMYeDiFICJTIth+Ct75s0SoUmLJiUr
 ha7aLa3Z8zkktDC/YM8J38kCalWLlA0Y/vBvX7j1/Mzma7P+zEq3bLi1nruHSVAv7eGNle9/J1+
 7Us8KAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_104028_658714_9C3FBD3D 
X-CRM114-Status: GOOD (  11.84  )
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

Add support to use a regulator for the core. This is optional and used
to register the dependency on the regulator.

Reviewed-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/net/can/m_can/m_can.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/can/m_can/m_can.c b/drivers/net/can/m_can/m_can.c
index 8c6452d1490c11d365bab598f2abe047f730d24b..56884c49b6f2a36acbcd7ca04be506154f991621 100644
--- a/drivers/net/can/m_can/m_can.c
+++ b/drivers/net/can/m_can/m_can.c
@@ -23,6 +23,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 
 #include "m_can.h"
 
@@ -2421,6 +2422,11 @@ struct m_can_classdev *m_can_class_allocate_dev(struct device *dev,
 	if (dev->of_node && of_property_read_bool(dev->of_node, "wakeup-source"))
 		device_set_wakeup_capable(dev, true);
 
+	ret = devm_regulator_get_enable_optional(dev, "vio");
+	if (ret)
+		return ERR_PTR(
+			dev_err_probe(dev, ret, "Failed to get or enable optional regulator\n"));
+
 	/* Get TX FIFO size
 	 * Defines the total amount of echo buffers for loopback
 	 */

-- 
2.45.2


