Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2C5D12D4D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 11:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqIysmZjBG+k2kGNM9Upch7DXtuFh63VFVwieboMWD4=; b=CRa/rMan5ZDmut+X/Abee8kqjt
	CQSrPJq5Kz78PMtwHms01FRNPqIjHPUdj/1Q4FkXW6NU3OFEdkAaBqIG5A6TeiYQ6hxULlG2WnSjH
	WxYJERz2UtYl1meOW7Ui7HWsPUtlagf35YcjnZhxwfXBHyhXAmdK8ImHJLCXz8goW0d/v2/JB0G0u
	KYf2+/BAF8jtaBRhW41noE545oF1/RTxfvH4Ew1jUH4eCb/pXlEz+RVGGaFGU9CuTYMQgODcnXhVD
	3orTqXonEl9Mf9Sqc9ds4LhVKE9SQ8FHkw91Wo2GTm+tAlxxtTWPhWsiSb0uws0+d7kapX7jkS1+x
	zjn9h1ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQlIv-00000006W9D-0hqb;
	Wed, 03 Dec 2025 11:45:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQlIr-00000006W6O-1afv;
	Wed, 03 Dec 2025 11:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764762346;
	bh=ahjRyiyy4S968JVuF+EhGfPwRd1ZGT+Km4oxLletDsI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iJn0iSWEQmtFsbubE3gmj/Ic4HB8XEFrxrutItAOSZPJk1hxyLk8YcqaMoX4kafrK
	 EMTV5ahylVkRhWZ15NkNCmx7rMEm224FVu5E9WmdZHym47b+7z/3CW8O9DOmX1753p
	 ppZd62GnfzQGm7PdbED361aJ4letvhbjjiFxMrTaM84SdUQ8r9VqEbFdrB3bZnl3Hi
	 OiJIbDk1W9ACEVfKmjC38jpKzADSbSrfiv54Qp/rOkfHVED0eiKN7Vskp7jmozjoZh
	 ihaf46vl2biX9vUeIuLuCzTGodYN/xHSdiz+/9ADxvAr2kyTfA0O8V9RKZOLqPjBTj
	 IhyJwe2ipYl6g==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B54DA17E13F1;
	Wed,  3 Dec 2025 12:45:45 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 03 Dec 2025 12:45:35 +0100
Subject: [PATCH 2/3] mmc: mtk-sd: add support for SPM resource release
 control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-mt8189-add-mmc-support-v1-2-f5ce43212fe9@collabora.com>
References: <20251203-mt8189-add-mmc-support-v1-0-f5ce43212fe9@collabora.com>
In-Reply-To: <20251203-mt8189-add-mmc-support-v1-0-f5ce43212fe9@collabora.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Wenbin Mei <wenbin.mei@mediatek.com>
Cc: kernel@collabora.com, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764762344; l=1669;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=ahjRyiyy4S968JVuF+EhGfPwRd1ZGT+Km4oxLletDsI=;
 b=I0kjEvvw1OQmZ7oj5gQdhB1Ho/OdyfiGdvfiBs3audUDZdLcvg19Po5Bnc42qT2rlji4W25OE
 izn4aDlrQI/AD+Tv1sC/zgZ4deRXQfM9lktB2rw/Iy/e7RJljjas8lb
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_034549_592920_F834BEC1 
X-CRM114-Status: GOOD (  12.83  )
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

The MT8189 SoC has in the status register an additional bit field to
release all System Power management (SPM) resource requests.
In preparation of MT8189 SoC support, add its use in suspend callback
and a support flag in the platform data.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/mmc/host/mtk-sd.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index daed659f63f6872423edd755478f0ec57e7742b4..4ce596d616409646613748086476c58d8b7b8de9 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -203,9 +203,10 @@
 #define SDC_CFG_DTOC            GENMASK(31, 24)	/* RW */
 
 /* SDC_STS mask */
-#define SDC_STS_SDCBUSY         BIT(0)	/* RW */
-#define SDC_STS_CMDBUSY         BIT(1)	/* RW */
-#define SDC_STS_SWR_COMPL       BIT(31)	/* RW */
+#define SDC_STS_SDCBUSY			BIT(0)  /* RW */
+#define SDC_STS_CMDBUSY			BIT(1)  /* RW */
+#define SDC_STS_SPM_RESOURCE_RELEASE	BIT(3)  /* RW */
+#define SDC_STS_SWR_COMPL		BIT(31) /* RW */
 
 /* SDC_ADV_CFG0 mask */
 #define SDC_DAT1_IRQ_TRIGGER	BIT(19)	/* RW */
@@ -448,6 +449,7 @@ struct mtk_mmc_compatible {
 	bool use_internal_cd;
 	bool support_new_tx;
 	bool support_new_rx;
+	bool support_spm_res_release;
 };
 
 struct msdc_tune_para {
@@ -3296,6 +3298,10 @@ static int msdc_runtime_suspend(struct device *dev)
 
 		__msdc_enable_sdio_irq(host, 0);
 	}
+
+	if (host->dev_comp->support_spm_res_release)
+		sdr_set_bits(host->base + SDC_STS, SDC_STS_SPM_RESOURCE_RELEASE);
+
 	msdc_gate_clock(host);
 	return 0;
 }

-- 
2.52.0


