Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4964EC55160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KN9fvuyUrAB/AWwJUn50v4AmnDRRKrkHVX/t4wvTSMI=; b=VOpVqBurpF9pEwR2dmwYhGgMQ9
	RCm25zE9q9w1vsrkbF2VtaXoLCdEV8eSrFKsSdE6ijf92nqcrtQxn8Jo4m+Fmsk2P7CTwLRyMUPrH
	iC41cyyRE5k2zbUXoTygDya7Bz1b+IDj8FxgkgtZGA/qbmyTyJRrA7H2mXuZvPOwVQfN/BcvRy/VL
	VltcQQoBh2yqfrRJA1vgDQLAVFr6kWnQoQYi0kJUz493zUUpGF1hw3Sj2c7QHL8walnddxXGvnPYn
	cTP3lJ1JHTz+OE19XguQR87WG+a1xG4LnPcvAzakBycBhdDCU1G4/7OigTXtGZUM2s++iQt5vHBUR
	5mkEL/pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTjQ-0000000B0dg-0bRG;
	Thu, 30 Jul 2026 16:35:40 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTjC-0000000B0Yu-0sDX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 16:35:27 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47f7027ca11so1564382f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 09:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785429324; x=1786034124; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KN9fvuyUrAB/AWwJUn50v4AmnDRRKrkHVX/t4wvTSMI=;
        b=ZA+kWUt2DWxNlTPUBViJCnS/0msDgAuaHb9KBwmHnN7ZdjkCRgZ/tmAChDqzVD8aQT
         haYJgO05ZdoGf/eQZRzBwUPTz6V1JNW5j0igAxnEK+5HDxlaYeatlnLMcoIv8zLWegql
         Ibw+zlCoJ8OKzFgu3X3jKj0Bc/kE3fH7tdX2GLdp34YSGw7cA79Kv/4YqQEBl5itXB6t
         gZJuMuXiruqNvZR2+ilg19LHEdeR8krnTOFHVPV8O1t7Ct4jOnGm6r7ET22hxQt33Ji5
         zHxb49vNrHk80MjXXJlshF241xAgcSEcWDYQf2WDjgnIgGFmEwP/oeupm3vqG5kTIyv2
         KIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429324; x=1786034124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KN9fvuyUrAB/AWwJUn50v4AmnDRRKrkHVX/t4wvTSMI=;
        b=PFsAejaVt9bJyXQrvrhE8sR2ALJm49UBz3sJAWVNH2XfAbPO5/CGM27/BR8hQK4VqI
         wft8OWjG/3sc6qD9eAXZbmk/VKoDRSrDGCtSaIzlJ+NIIAPsGNhfws/B9+d2V2XRr7Lr
         IXS+8KUn2Sa3JFikdCW0THkgLrcapbjIqGhBSJTfGObfdny7F/UusDEoRtoedHIhj3mK
         Nbkg6Z/T/brOLP0LeQecH3ugXOH2HMeG8qi3ZuaIKN2x91ROxmRmz5KZCKlj2FCftUXq
         NkKCZtSD3AlVwu7VtngI/ufU5YN5nGioY8KVdVzNitkoFycGxgkQ8Ug5X0awut3OhV7Y
         Ufnw==
X-Forwarded-Encrypted: i=1; AHgh+RrRS+cFciscfqAWi9/Ztp5laYrxdiotJKcjN3F2Tj5OuYdFRuDgObaeHNKs1lP/l4f97UfP/2FT2+YBzfBHNe+r@lists.infradead.org
X-Gm-Message-State: AOJu0YzgNIWAHs0Yo7xW3J4jpt1XWprKV1yHFh83wcneTE/pbbSkwG9B
	aa9oVm8SjaA7NyHmmZ6IbupWS1sn2MvpsgxSj4Bmyy4B9zLfIpk4npCv
X-Gm-Gg: AR+sD10U535R3FNBdUcp7targt8xoj+DotAcx1gqsxWczSoGSMojwLMZYEaijfPmK+2
	XNNaZrblnicn+GujPOVsJ4gA2ActM7YjwHstuBGImzQvJmdCRKLSHN54cPAk3rnoe1z9clNaL1q
	B+LLl2olzzORuWExQCxvq6LLbAMMjAMp8Hp1UMX9Q005V9eTw8DgtSyz9Jn3YE6fTAz/3NaPLmU
	WnZNzeyAUXlVpXbNc26sE4oR7eKbzXhYhcBf+HDu09u/bd6vG2+9CQ42sDdKWDfvCMLXCJ4LkIw
	HOW1GkIovWr10D6FioE2q+W6Cd0HsGQNDtCdubDp7mCsK6eP/gwNPdZqXJPz72R2Ud1kZBdhuMj
	Awc0OPuFQ5NkAMf8r/W2VNMFaXSa+PfpLFBMyYdvDG3vZDg1jHFBJmxi2pICLMjbaVvHVZ0fNFE
	gH/HhZZhjlMnJsD9rKh9Y/3g00n6kyRR2PQ6FGReTyWUChDrxY/pqMNdL0ZP419WKFvclQ5J9Mp
	86ucGzFj9GKgQ==
X-Received: by 2002:a5d:588a:0:b0:47f:9751:cb3d with SMTP id ffacd0b85a97d-47fc822e715mr4862784f8f.8.1785429324205;
        Thu, 30 Jul 2026 09:35:24 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc892cdeasm7758445f8f.22.2026.07.30.09.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:35:23 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] remoteproc: imx_rpoc: fix carveout name parsing
Date: Thu, 30 Jul 2026 09:34:10 -0700
Message-ID: <20260730163412.1145-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_093526_265733_52F6088E 
X-CRM114-Status: GOOD (  18.80  )
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
index 745ce52cd822..ce9bdfc1fa98 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -643,7 +643,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		int err;
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, i++, &res);
+		err = imx_rproc_rmem_to_resource(np, i++, &res);
 		if (err)
 			break;
 
@@ -818,11 +818,20 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
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
2.53.0


