Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93CFEEF30A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 06:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgaCGe2HP5UpbVXKB+EsAI8njddCU+iXqu2dkviOtjA=; b=rsvY2MTimnJTlHZvoXN5sKOLnD
	xEanhNg3H4R7CxPJaDhU7zpu7sq/Y52BUwKLPhqMjHxY+pzmK2oOoOjMepDDuJ9DrsQI6iyAvA5z7
	wJKYMQFeFULn/RkzP2CNDS+UexUm8H2fn2488BC6lNHfg0hascxNU7aKgPaHFl26Vu3bQLtZ1TMDk
	Y2JW3n1vFw3o87WV0AyGuFpLqwtT9uxA6ZasUYq1xZh8sZw6yJsoiLsUb+lgWS82idxmuId0oQPfI
	6hgDnprSqm0FKyfM2bIJCr+7XodBJtu84dwcq6FsLnOqOciCeEHiOPHe4DDHB+JXipJH/uaqzthsO
	lDTGvRDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy255-00000000zrj-0TkZ;
	Thu, 05 Mar 2026 06:21:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy252-00000000zqJ-21Vd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 06:21:05 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251BbOa2665215
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 06:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rgaCGe2HP5UpbVXKB+EsAI8njddCU+iXqu2dkviOtjA=; b=ju9HgQ8QDLzph2X2
	xcDGeWw8SDOnOkvNNbt49XN4ZK+XhDud5SLcq0Ghl1tvktnW2BjVxoexEvKd3IQg
	QDZZ8u0G2DkHpJ5Uck7sp2jum/GBWLKHCaigUwZ003HZm1LismPGqN1kyiGdphzd
	cQxtKl3qS39B+ozKyzA+57WMI4NcvDONPwoguFukPRUOEHrsuBaC8BHxGSXaOWY+
	E+Y3H/bDoKGtm/uPPpMmUw9NIox+WUwghBOxxcLzwOoSPeZeuQFD5nN2daV3jl6q
	nM8T2ttith7sadvyGNney6CIhS3wwj2SoMler+1/clVjqTX8YwYWXqEXmnlGHfxP
	G41tfQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuhb1gft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 06:21:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358f058973fso7324683a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 22:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772691663; x=1773296463; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgaCGe2HP5UpbVXKB+EsAI8njddCU+iXqu2dkviOtjA=;
        b=MTwXBHF63cyQEZ3ldv7g4PpsD7HQIR2tQZYPupCb0Z9cBkVrxLr3vbq2u4X2xTAqOp
         luaj1uIIuapGHPfn4dV6XKT3VpcOgSYIMn9lEiTyr67ZrVABvsb86qQsk4PmjeFh2bAH
         73jXjRwcpvI9Ka8lB310tvsJgjsZ7KQk0uTDAeU+mMF3qpCinw7QG1giERY0qelshLI2
         OF4uO5XZbdsCrloVp64YhdonB7JL4oQuekyFVsbDKgwfxqwu31Eikjwx1Q3zGji8P+H8
         J65Sj2i7EB4cOSRICewAXuJ+QWRy7fNYnFBXekRSVlVEPdvnb/28sRstK9VdajHCwjaw
         9HyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691663; x=1773296463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rgaCGe2HP5UpbVXKB+EsAI8njddCU+iXqu2dkviOtjA=;
        b=xM7Sgg1ZwatkVZWLvCW6J/omi0r1bMy+NINwc1YBRv8lFQTg7tgNuUOw3qvmIXjwkE
         Ot/yw4a/+Inngga1DpLrYMgJeyxYjwtvlH0EniGFwZKpG5qri77xc5DtBZ2+jRyRg7IN
         UCwkF5dUOyf/eDB2De5ABkBZ3DVim1UwVDQlMjdStS8WTkVgE4A8LffUC0Li+CBfaoVK
         lI7KLfhylOoSWpUtFjFbiviiLiG+lSAMeJpRwNp82nblDNVNPAwnjrIZXAMJafLJxlDW
         bdQs25NXNu02qgUTYIIfTZ7rwYnDzXEaIHqRgDkz2g0PU+HqMQh9d6pmxFO3uNcsiNsq
         dPlA==
X-Forwarded-Encrypted: i=1; AJvYcCWiO75BWUCBlicOcZ+u8EThVgxXGPT4vyyFbmgzFKNwAtwxAPCr0xO4afctzF74EyHRBcvwB4uXcZsAarZz9OEm@lists.infradead.org
X-Gm-Message-State: AOJu0YzMjm27do6+IkDKM2iB9nnxLmmYJFDoR6FwbYu/Xl6/ope7r4I1
	6SytbcZisK2T8jNkrs2ECP2v0Z4knwvzGugsCFh2H+gh+DlBKeGVqeu9WHEgQZEpR9Z2kk46zeB
	Omk8jELjAPgpqBX3eCv/lJ+FAHYNEMwWJRpxdjUji3MWseelAGRfjqjlQS6NQMoDzTzTr2xgknY
	2+Ew==
X-Gm-Gg: ATEYQzzqfWt3bEJwaDKm2isBbiWX2AmaOntYSQXNfeBg9OTwF5gkfFUVB8RS8PJgNtJ
	hL+KOSwdAStVfKMbNBu+AT0pH4VDHwJ7QK4dDJl1/CXIa7Vf1L0BR97+augvS+FMj8/ZUOcknUI
	uZ/Dr9UNTcPu0rQy+I1c1ACVWglNjfHSCw/ZFntxKn0Dmbz7aOa312PuQr7HbtTOl8yClJQVQMx
	pcocl05Hf+t5lm1Q8bcaxghrH2g+F96zJQQHfwW7SnHrEJOG2Scoxjr6mJ2giOeSdrnxfCygonu
	clxI2hErfCxGOR1Vqk+vqw9rtYqi3bqoL8YewiLL0ln0rVtgVKLuq2nFPW8+xt8DJJOK+jdNf1T
	eS+fU6ecJDHThRSFsXoaH831uGvo3aJ3I2cGXllHmmVEL/58=
X-Received: by 2002:a17:90b:5386:b0:354:bfb7:db13 with SMTP id 98e67ed59e1d1-359a6a922b5mr4188018a91.35.1772691663117;
        Wed, 04 Mar 2026 22:21:03 -0800 (PST)
X-Received: by 2002:a17:90b:5386:b0:354:bfb7:db13 with SMTP id 98e67ed59e1d1-359a6a922b5mr4187982a91.35.1772691662515;
        Wed, 04 Mar 2026 22:21:02 -0800 (PST)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d38ab8sm843378a91.1.2026.03.04.22.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:21:02 -0800 (PST)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 11:50:36 +0530
Subject: [PATCH v2 1/2] PCI: API changes for multi-port controller support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-dt-parser-v2-1-85836db8dc06@oss.qualcomm.com>
References: <20260305-dt-parser-v2-0-85836db8dc06@oss.qualcomm.com>
In-Reply-To: <20260305-dt-parser-v2-0-85836db8dc06@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@Amlogic.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Greentime Hu <greentime.hu@sifive.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Chuanhua Lei <lchuanhua@maxlinear.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Pratyush Anand <pratyush.anand@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772691640; l=3103;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=+S/OPWfD8jiRnySHXDwKPl0Gx38XUkXnA2tMQyqcytY=;
 b=TK72jjuJyknXwVLrSUwewEGuy6eruyMEMLoyVD7ZdXByX5WQ08ffPNtXIK0+Zxd2Jj9MJeA9E
 OHWFPph2BbeAOAPQu90/A9/51gkVzesqs0Q6tFz6anwYgEZlA0RRnh3
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA0NyBTYWx0ZWRfX9nmNgqkFYs/y
 C/xhHA0v8YggfPXpuxgectucLGtJFb7bCya//bjDUoEFoXg0ptaek6MyasQuxYj6OJC8UjhR5Iw
 Tk2VYkK/TKFnpv9Nb1XSxt376RCHXPM8CcHxBcypoQU9o+tBNoNyVswEvQKvLFc14rnM/TZfsSg
 9IE3LKHM88pbjnuJp/3PTQYXGs+rAl7Ny70H/tKsiLLtaXPERkH09aca9jJdvp4W/z4phzffESI
 BHBH9gP70dTxRicpi0Y8NrWjCF24LsZi63+VYKpdkyWuSchUyU3fgq37BUFfpLmV0UbTArjIgb1
 7h0mdDX5Pp0CfcGpiL3oSBrQEOTKdQCzxl0ynNSSVuVxP0h6ZAT/PsCMq6QeUU/u0btSz8iOsgl
 M6UNZuV7P0R3iMWggKXpp59M3WRMMSd1VWNTpC7gQCW8ZRmtwqzgWJV8b3x2ZvQ4fnC+Jdtl3Qj
 +5Umxj6jln+0S3+suIA==
X-Proofpoint-GUID: CIHtdDY7mGEx_92-fxdMfRtzOzmJatN1
X-Authority-Analysis: v=2.4 cv=SqydKfO0 c=1 sm=1 tr=0 ts=69a920cf cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ujblt7VnwxmsJrSXvRcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: CIHtdDY7mGEx_92-fxdMfRtzOzmJatN1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_222104_520692_9242A120 
X-CRM114-Status: GOOD (  18.68  )
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

For multi-port controllers, equalization preset properties should be
specified in individual Root Port nodes rather than the controller node,
allowing each port to have its own configuration.

Change of_pci_get_equalization_presets() to accept a device_node pointer.
This allows parsing equalization presets from any device tree node,
which is needed for multi-port PCIe controllers.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/pci/of.c  | 6 ++++--
 drivers/pci/pci.h | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 3579265f119845637e163d9051437c89662762f8..d09eff40b523c920c9ca3eaa64f784765b3c5bf8 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -971,6 +971,7 @@ EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
  * of_pci_get_equalization_presets - Parses the "eq-presets-Ngts" property.
  *
  * @dev: Device containing the properties.
+ * @node: Device tree node containing the properties.
  * @presets: Pointer to store the parsed data.
  * @num_lanes: Maximum number of lanes supported.
  *
@@ -981,6 +982,7 @@ EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
  * errno otherwise.
  */
 int of_pci_get_equalization_presets(struct device *dev,
+				    struct device_node *node,
 				    struct pci_eq_presets *presets,
 				    int num_lanes)
 {
@@ -988,7 +990,7 @@ int of_pci_get_equalization_presets(struct device *dev,
 	int ret;
 
 	presets->eq_presets_8gts[0] = PCI_EQ_RESV;
-	ret = of_property_read_u16_array(dev->of_node, "eq-presets-8gts",
+	ret = of_property_read_u16_array(node, "eq-presets-8gts",
 					 presets->eq_presets_8gts, num_lanes);
 	if (ret && ret != -EINVAL) {
 		dev_err(dev, "Error reading eq-presets-8gts: %d\n", ret);
@@ -998,7 +1000,7 @@ int of_pci_get_equalization_presets(struct device *dev,
 	for (int i = 0; i < EQ_PRESET_TYPE_MAX - 1; i++) {
 		presets->eq_presets_Ngts[i][0] = PCI_EQ_RESV;
 		snprintf(name, sizeof(name), "eq-presets-%dgts", 8 << (i + 1));
-		ret = of_property_read_u8_array(dev->of_node, name,
+		ret = of_property_read_u8_array(node, name,
 						presets->eq_presets_Ngts[i],
 						num_lanes);
 		if (ret && ret != -EINVAL) {
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 34f65d69662e9f61f0c489ec58de2ce17d21c0c6..72fa6db95b8a75f6e69b8019d1eb2262b6a46c13 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -965,6 +965,7 @@ void pci_release_bus_of_node(struct pci_bus *bus);
 int devm_of_pci_bridge_init(struct device *dev, struct pci_host_bridge *bridge);
 bool of_pci_supply_present(struct device_node *np);
 int of_pci_get_equalization_presets(struct device *dev,
+				    struct device_node *node,
 				    struct pci_eq_presets *presets,
 				    int num_lanes);
 #else
@@ -1013,6 +1014,7 @@ static inline bool of_pci_supply_present(struct device_node *np)
 }
 
 static inline int of_pci_get_equalization_presets(struct device *dev,
+						  struct device_node *node,
 						  struct pci_eq_presets *presets,
 						  int num_lanes)
 {

-- 
2.34.1


