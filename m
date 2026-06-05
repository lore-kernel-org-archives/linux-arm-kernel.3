Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F210BCD6E74
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 11:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6daWXnyshURFrvLbUnWsTDQNHdO5cag/yMoMIvHA3zY=; b=n5SlyjimcCzHxLAuYqTbV4oipU
	HUq+ppXDFYuMnb1OFDmekdTLBrc4Ysb0Z+Hz9BCopQo+4KOsTQRMC3YCgAxX9+PD/hWSvKE2OZptP
	nhKw9fSMTg074SybUlr7FmzgykyBA7w0J2/o3ExjqXjfQ430CiAf0cNSHw5OFLh1kx8QBolleHR7W
	/q3wZlblle1XSys462JH9T2F+AOImSKfafpjOhFaYH+Bm2ldf1Qf/eWiXW5KK9gH/9S0K0tYAdIFm
	veaNM3fmfLWYBisBBB01nMHz6D5bV3HFllr/TbxPo8dUjpJgoQYPmvOaosEerC2NHNUJ6EjJZk9+B
	X2FkgiMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSsJ-00000000YcI-1OSh;
	Fri, 05 Jun 2026 11:38:07 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSsF-00000000Yac-23AX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 11:38:06 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-490be03d47bso14886035e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 04:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659482; x=1781264282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6daWXnyshURFrvLbUnWsTDQNHdO5cag/yMoMIvHA3zY=;
        b=qiNuSnyhKjjCcqVa0GC+jot/6gwi/jMpXlha3mFe0ZXLQ5oRuC31aax6S8b7cAn5nT
         BO75AmJfYbbXit/NBxl/hUGrIcdU2i00eOBCzhdcMfc0V1XW/PFWmQ6OLEyWlx/XAmLf
         PARsqbctTgdicxJgKfbNNMXcKCL//fxOmofGxEsYiR7uK6beZmHorfrPuMDFK7k59MM1
         bERqPs6MmDgCHyj4HPZnwQAvfbbG45m9vPnRNVuwOh3g/Hp9KlVAMgjr65ZAAh+W0YHC
         2Hq4qH7xHJCKRBnpV9SH1ysTJyK82Gs1Udgj2e4Xqpk767k1S/4kAQmWCOWFxzLRbLaT
         BgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659482; x=1781264282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6daWXnyshURFrvLbUnWsTDQNHdO5cag/yMoMIvHA3zY=;
        b=deatf+UGam1/T8c0vwdSDFaCRYzKp77xG0lv5xuh4DRs+HpBCZ+/1foejZ7rZ/NUIv
         16MfbXNZTWGs0l8/kIR3IhONxZ6odCIsD993fYAea2Zl0B55iw+lkZOwoPc4Uc+tEKOg
         j75xV/SvCSizUd3XFbbtntmA9f1EsPLLyNj/4jdtqNaHTIToU/Dw91hbiRqmvJNyIQEQ
         gR+RFmKcSdy0582SzOi7krE+pPiMWuv6QzpSLbI8pHmY8H0UjgXGRNFlbDT+UKfX+iBR
         XtzQWAI0L/4nV+eK39pVbNx3YLS8ORzvPd3VCHlodKwiBNEgjjQpOtAYPHwf2enHISqG
         1esQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZpGHPVZaXjt7lBjCV8hK2+ji8Jp+8PJ4R7+ivqG5CJi3leglcMYvtcdhGRTFxkEg9UoAI2TQe82gO/SXPCwrF@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5H13/KTpymqaMg9x+Ci0lG9kK0JneepmpNbOWTzb3sW41/3BZ
	1sG+C9TKG3kPMPfUPmAmzmcwtT9+tIq9qeaubRHftY7UE37UrxSudaHJ
X-Gm-Gg: Acq92OH4/IEyOCyrJuLrQ7sPThAUeSakLuvEhPyxQwYWLcMsLcVzkL8Ui7rjk0psSE0
	Js9KIICR3LYuXLBwT92WPXHOU9QjKSvpZPnOAj52Xer4sTOuc603V8MOr/oyIAiE9+vewXhJOG1
	FjQvFFINtp9JhRImAZ8eHaXxS/BWGCrFOhsyo9EdgVawuDKLivgnugSzlTV3256OaDOxhklbBtS
	faH5fMRRwhVRCWctMR+bsuDSrSLLV00iuHSEWn0jHKdVpcdP+5oFyo6RXE12Nsa0hhEvIEfCkOu
	X+9E6yAHvQuauRut+53hw207xv7KHxu3pIomKf5F0jQuSRr1wE5xsaggaKjTGgDMVhUMbxvG5WF
	nRC7O2Tdxos8QizUxtBRAhAb+ItQQdV5yASRdj2oQkbzJzf+yas6yoAEEmDQOzytY9Mz63k4bxG
	XXkq0fEtGCzSGokNnYLMGfmFYMdBsdAQcHMuhU3YUamctYbVTqEEu/H/plkSEr
X-Received: by 2002:a05:600c:c0d3:b0:48e:6db3:ff33 with SMTP id 5b1f17b1804b1-490c265c091mr36372165e9.14.1780659481627;
        Fri, 05 Jun 2026 04:38:01 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dcbdsm15262439f8f.7.2026.06.05.04.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:38:01 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] remoteproc: imx_rpoc: fix carveout name parsing
Date: Fri,  5 Jun 2026 04:36:19 -0700
Message-ID: <20260605113621.1479-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_043805_139707_BFF541C6 
X-CRM114-Status: GOOD (  18.67  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The imx remoteproc driver assumes that the names of the reserved memory
regions reflect their usage (e.g. "vdevbuffer", "vdev0vring0", etc.). This
conflicts with the devicetree specification's recommendation, which states
that the names of the devicetree nodes should be generic.

Therefore, instead of relying on the node names, use the names passed via
the "memory-region-names" property if present. Otherwise, keep the old
behavior.

The definition of imx_rproc_rmem_to_resource() is added to a common place
as imx_dsp_rproc.c can also use it given that it suffers from the same
aforementioned problem.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 13 +++++++++++--
 drivers/remoteproc/imx_rproc.h | 21 +++++++++++++++++++++
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 7662ebd9d2f4..74719066905d 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -672,7 +672,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		int err;
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, i++, &res);
+		err = imx_rproc_rmem_to_resource(np, i++, &res);
 		if (err)
 			break;
 
@@ -850,11 +850,20 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 	if (nph <= 0)
 		return 0;
 
+	if (!of_property_present(np, "memory-region-names")) {
+		dev_warn(dev, "using node names for carveouts should be avoided\n");
+	} else {
+		if (nph != of_property_count_strings(np, "memory-region-names")) {
+			dev_err(dev, "invalid reserved memory name count\n");
+			return -EINVAL;
+		}
+	}
+
 	/* remap optional addresses */
 	for (a = 0; a < nph; a++) {
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, a, &res);
+		err = imx_rproc_rmem_to_resource(np, a, &res);
 		if (err) {
 			dev_err(dev, "unable to resolve memory region\n");
 			return err;
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 0d7d48352a10..3632bc375c71 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -7,6 +7,8 @@
 #ifndef _IMX_RPROC_H
 #define _IMX_RPROC_H
 
+#include <linux/of_reserved_mem.h>
+
 /* address translation table */
 struct imx_rproc_att {
 	u32 da;	/* device address (From Cortex M4 view)*/
@@ -45,4 +47,23 @@ struct imx_rproc_dcfg {
 	u32				reset_vector_mask;
 };
 
+static inline int imx_rproc_rmem_to_resource(struct device_node *np,
+					     int index,
+					     struct resource *res)
+{
+	int ret;
+
+	ret = of_reserved_mem_region_to_resource(np, index, res);
+	if (ret)
+		return ret;
+
+	/* "memory-region-names" is optional */
+	ret = of_property_read_string_index(np, "memory-region-names",
+					    index, &res->name);
+	if (ret == -EINVAL)
+		return 0;
+
+	return ret;
+}
+
 #endif /* _IMX_RPROC_H */
-- 
2.43.0


