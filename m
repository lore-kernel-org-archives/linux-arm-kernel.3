Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07AFC53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 10:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZ6CrNt1h3fSjGPvsb+y6S3SjB/kGZ3lPPdIV0Hb5tc=; b=fuA6uwfPqXEa4TgJLMVxK5n6Z3
	hSOf+3TvZZgGCbmns1ZKYKYmU9dFO/fmYIWob2wc8Xn9R6WlOLO2fSRL1Pb64YuAm2InLAMC/dlHy
	ZjEqCzJk2ft74fjBKewxgWyhUReIOxVzZG52JzVtUNtA2tc3aKYlK6DDXqbmIpcW8ZhSlMFDlNNEn
	c0EYYEUhj8EI1gqvYF8KQuGaM4/IXXISBAnBQuNA2VBkAMT9N9zy30duHjPELQYCY7WJsccCDL7t7
	rFpUTK8LZV3PGSOPhWQuzNb5+Up4I7phL/SzgYKNnnowbjPNfZ7+XNUWUxRCs6jsgDf9W9FdqebuN
	7UknpNbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woI8E-00000002PaA-1NqP;
	Mon, 27 Jul 2026 10:00:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woI8C-00000002PYt-2H7k;
	Mon, 27 Jul 2026 10:00:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F218F601ED;
	Mon, 27 Jul 2026 10:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04F51F00A3A;
	Mon, 27 Jul 2026 10:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785146419;
	bh=bZ6CrNt1h3fSjGPvsb+y6S3SjB/kGZ3lPPdIV0Hb5tc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hyZlBvQQxrFTEEcBnkYjGrMHV2oEKCcqj17nzQ3w9rEytyTd/4Uuh/7U94dFZ8NOv
	 mMETzoGTLbT33h7oKR4aOouoRqssgyT/j5gWMsGooHrkqtReHXjdZihJ4zY+ZxEadU
	 QY+hGzc1eCgAfLe+6pl+ZTtkpCLvBUj5R1NAkWNB1LOufLDBcAHoQYbb/eY7sHl4nw
	 68bLl5zeM1RqOZOpTB9PnFFapW9X9HU+NO9TMLLSpb5ivt8Q/hg3tML4h8UzG+W0DG
	 8itu+NKH4d/dDyNxq4M8U2DJHhV9q5b+66wFmXimLYDWJlFpmeGUbOU7FebPbo1oWN
	 pl2ArAlVh89rw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 27 Jul 2026 11:59:29 +0200
Subject: [PATCH v5 3/3] soc: qcom: ubwc: Get HBB from SMEM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-topic-smem_dramc-v5-3-66188b3e338d@oss.qualcomm.com>
References: <20260727-topic-smem_dramc-v5-0-66188b3e338d@oss.qualcomm.com>
In-Reply-To: <20260727-topic-smem_dramc-v5-0-66188b3e338d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>, 
 Mao Jinlong <jinlong.mao@oss.qualcomm.com>, 
 Jie Gan <jie.gan@oss.qualcomm.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-scsi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 coresight@lists.linaro.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785146373; l=2414;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=3LNXtkpagxbE+R6g/oNsy+x+7/74GUn/00p/SQ/cYlM=;
 b=yYCXvrrf7qggR4qk6JjiS9Z2+iFrl+PooPtV0kAczRrNWh/Q57LN8vjkIassppHjv6qeScn0S
 WfN0WoTwFTuAEmJmP7Szvpl9QNL+0n/rjYpzMvDuovur7WRGHLePIHO
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

To make sure the correct settings for a given DRAM configuration get
applied, attempt to retrieve that data from SMEM (which happens to be
what the BSP kernel does, albeit with through convoluted means of the
bootloader altering the DT with this data).

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 40 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 0209a02c390f..23901a4c51f7 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 
 #include <linux/soc/qcom/ubwc.h>
+#include <linux/soc/qcom/smem.h>
 
 static const struct qcom_ubwc_cfg_data no_ubwc_data = {
 	/* no UBWC, no HBB */
@@ -168,9 +169,25 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ }
 };
 
+static struct qcom_ubwc_cfg_data *cfg;
+static DEFINE_MUTEX(cfg_mutex);
+/**
+ * qcom_ubwc_config_get_data() - Retrieve UBWC data for the platform.
+ *
+ * Return: Pointer to valid struct qcom_ubwc_cfg_data on success, negative
+ * errno on failure. Note that this may return EPROBE_DEFER.
+ */
 const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
 {
 	const struct qcom_ubwc_cfg_data *data;
+	int hbb;
+
+	guard(mutex)(&cfg_mutex);
+	if (cfg)
+		return cfg;
+
+	if (!qcom_smem_is_available())
+		return ERR_PTR(-EPROBE_DEFER);
 
 	data = of_machine_get_match_data(qcom_ubwc_configs);
 	if (!data) {
@@ -178,9 +195,30 @@ const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
 		return ERR_PTR(-EINVAL);
 	}
 
-	return data;
+	hbb = qcom_smem_dram_get_hbb();
+	if (hbb == -ENODATA) {
+		/* Lack of HBB data is OK - it was only introduced later */
+		return data;
+	} else if (hbb < 0) {
+		pr_err("Couldn't get HBB data from SMEM: %d\n", hbb);
+		return ERR_PTR(hbb);
+	}
+
+	cfg = kmemdup(data, sizeof(*data), GFP_KERNEL);
+	if (!cfg)
+		return ERR_PTR(-ENOMEM);
+
+	cfg->highest_bank_bit = hbb;
+
+	return cfg;
 }
 EXPORT_SYMBOL_GPL(qcom_ubwc_config_get_data);
 
+static void __exit ubwc_config_exit(void)
+{
+	kfree(cfg);
+}
+module_exit(ubwc_config_exit);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("UBWC config database for QTI SoCs");

-- 
2.55.0


