Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C009FA3744
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xgm2AP4vgmTYsv4aRX1OSL+r1z4YHLOddud0aXq4pOU=; b=SRaU0k59fvbFrDV5xTzMXjsZsx
	fDRMldyoTTC28712k4JJD0pIkXJkWL7zQUPNuQiGVGZND4DwC2YSQGn56dw4a3WgT5h2ghXqY9BgC
	UgyN6GrrdzetNaxDU6pP+ZgWOqyBgqrwL3SCCPlH0gOanYS2KmC9Zkdxrt6DEWRE+oz3KioztAQ3t
	w9tMsNV/0J2yNamdqodGuM3/ef9V9jKJNe0x3kF8qm7z/MNyMa3Q/PuwB4J4mbe2+U24apbeh1TV0
	l16kXIGu763MLKAfeCk7ygXmnhf5+P0Niy42vcSpXTCqidMlhpqXuZyzozjdhPcQEtEsiCq7RIODj
	iFEh0D9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeaR-00000008DpY-2L0S;
	Fri, 02 Jan 2026 12:48:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbeaN-00000008DmZ-24lD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 12:48:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029Vx3Q824311
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Jan 2026 12:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Xgm2AP4vgmTYsv4aRX1OSL+r1z4YHLOddud
	0aXq4pOU=; b=clMmV/bZXWsnQ5eoNle29tagaqRGohdRKKxKPROAXCJUNuV+QZT
	F9Fh1qEslLwty5OoK3NiwS7q7pXbTo+YrVzx5Wa7j4Hr2Kg/5jyhBd8eMmThdluJ
	pDQUrnx5VWuO2uCNog3PGO+s9uqIWKVS6ZX4G8r1y7Xgv2CLpvNFo5u1SQj8JQr8
	w2FVegM8IEOlqTOrAAdGuumEKChXHjLyI+6E2OqCrW2tOYC7sOH/KxZXISxqmZXr
	IRo9YJs3hctdZTr54ik/6N02RxciUQXXsz0PK959ttFBVj+3CjHf8xhxWVqDwWF+
	Fx+PoA7yBMfk6datIvPgQKkZ4XGSb1hIJyw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd8533bvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 12:48:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0488e746so266104011cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 04:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358134; x=1767962934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xgm2AP4vgmTYsv4aRX1OSL+r1z4YHLOddud0aXq4pOU=;
        b=hWjPeUTJoR7cfezxCUceExejByWuUjo6nhPRbjuR5pQh1NztEBv8za1KpmX+bRyl9Q
         UjDusmyddmv18zkqsrVR7Hr0c828de0mSumOqdsmcqYdeascuAzzuiNkkz1EXBxbTE4H
         aDFcr9iLjXvRU0i6lEx1iv+/5bneXgofonqvmjzq14FcOyygLsIRtyjLLbS+2IRxGV/7
         +ock4LLGEntQKcCexWKGMPCzoeFbWhFaNi44FPKXH5leOFqwXVqy2R+4Rpah7PS8I/Nq
         1MPu+fY6j3gNlsmKDgnUiJhcRf/bznrIyG5LPhn4lB+zidisOGgQXIune+yQ+MIQWcwk
         OSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358134; x=1767962934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xgm2AP4vgmTYsv4aRX1OSL+r1z4YHLOddud0aXq4pOU=;
        b=g0F6r9nMUJys+7c0PO8HrpDJM6sTaPUj0HSF5ZLr+q/W9o6UcscbP8mSejtCIpAPhj
         /3M1kmBH0T2wBLird+87dWCeR/6AuTJOz4ZcamfCGb3MptQH/mSNK59HPDRFUXhHg42T
         FhQcLTRAlCfeG+ecUOf79GOZ744ZpVb+84a5v1T6qfAP8KsQqYDoNLo8mQ427Gis1iqI
         rN+eY+CqCILsNJQC6Fi1qO8MseFR8CGksmNGfQAiNBkZxc1lFvsH5zFX+getiBOLucDV
         nlc/baZ/EmCiXsGXxoVjerCfa5XLKyiBiJQmcCXSFxygYhdnvFNWx1GQewKHZMLYdOQJ
         bJIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5EW4hXKZzWGUihVq1EnPiC05cT0KB96NNI0OecC/hT43zbx/dPMTxs5BtNadnqnnDqV29DcYIAzFh39BcZg7K@lists.infradead.org
X-Gm-Message-State: AOJu0YwqzNRlhnMPvmiUlRalRbPwTdiCNBdB3dINyk33HuUrxFzZaDeF
	BzDHJG49ZTT2Lr9dngslQAK3/nTkvrHk86usuKJK3NDUA1zGqrDgaz0U2fqd9jw0Ofcy+Zk5gRg
	z593N90MgUq20SDc+nRDccnF/e65/Cm92F3GwgOJvjmdkRFFXwenz6CFxVkz9YgO8vvtRkF7usj
	M1+Q==
X-Gm-Gg: AY/fxX4wXpztXxCJb10p47c8K7g8Fs925JFLn9HleG2OYAUToUEQN6D21cVF1Ko+Umt
	PY8E8MEnAPuVmb9Md9gfLSfZW0q+hQfJJppjnZcsF+Tk3sxWmDxdA7Gus+6UJNE22HWTU6lE9F9
	x2cJ0x5Lp1dubh1ISis2a85UEZyO1V1Olc8H3RSA/FjeIsJ4nZiiOpckp6MW/YE4KNMIo1WtN+w
	tHbN/UZ0XlSMH50HYCXkkN2haDlW3NfNl0duWWkzukBLEu6W2cb+RUegjc8YhhRNVCMnczxmkXX
	TXwUbSg2GNHH4nOM2o2R3zbWfL+rUkS7SBxqegekSDuyu9IxkeuFGlBhfB+uyFhXL7mvQ8zIYrM
	c58Rq9xK2LcYfemI9kADgvai6JA==
X-Received: by 2002:ac8:7fd6:0:b0:4ed:a6b0:5c14 with SMTP id d75a77b69052e-4f35f43aaacmr649488711cf.23.1767358133924;
        Fri, 02 Jan 2026 04:48:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9lzJSbr57E+UeRW2oJCNK0mPboU52nQHVzE0PmuhD9prUEOymF4yHJXijw7/81WAH7eXrcw==
X-Received: by 2002:ac8:7fd6:0:b0:4ed:a6b0:5c14 with SMTP id d75a77b69052e-4f35f43aaacmr649488501cf.23.1767358133483;
        Fri, 02 Jan 2026 04:48:53 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d5372sm767135185e9.14.2026.01.02.04.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:48:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] phy: socionext: usb2: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:48:49 +0100
Message-ID: <20260102124848.64474-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2449; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=MGJHIfZm/ZSovOzFuDJPmTHZ9rvV5qLwwkrNIcbV0ec=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV76x6RPnyCz1ZXcH9iipQhqZbpkWAdtCRlIT3
 Os/LlocJD2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+sQAKCRDBN2bmhouD
 147WD/9Pi8XM9s0P+ZCcmIyS22LS9QmnLCHb8krpSRow7SeKYpCEgb42zGoyfXk/B3KDFWv8eAm
 vYHBTW3jd7FxcNcoC9XfNvZyslvcYeqxhGltA14KeZxa6roWn5oVMv1M6Z7yxdvx1v+UaSs0a9A
 5VfJfWpJaRDgJpDlTkKw7xzIfZZVaBa5KQ0w2oMzPqeqhlVjsxAX/22n0w1Lyhr4eLLD+VU1cVe
 L128Ovys41Ay35thB6BIyvCUitg9azfmIIAvT9WXzIDOQORFne9h25GMF33UECuN4Ia/haB9pC7
 ZSNxItRXC4xDAZVKYZ/S43QjgeubweDkqd8I/5pfq+3rN6giR9XULdBiStbaAf2bfaGgAJYVvZ5
 d9UaA0Ph5LGX4P+2QN/yLjlf2vu0vl0Afb3rxJVE1ZWmutYabLV7VdzaNTd8pSCasPrxJ4WVN1p
 iGmzldFBqDeDaNztixdwi4RoFg8YhjZ4bQoKGkbPh483PCiRnq7tgRL1YOpa2EElZ24pUi/caWw
 VHNL/xqIvY7NjS6ywq56OIVUHEoazOkBxU6NVnQ3N+r/mJvwQLUlFXg70hoWZDKyoM84FjEWlhS
 rMvcbIMd0h/QY7Asc+ILNJinmmF2/gvSLOoNd1vuDcbxeX2JQkm1nWj50ryY9ERT4d/AZG6RNBp CiuswbRMew02DTg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Bhri94h5HMVHymDoZE7cMfPkFJXSSOXO
X-Authority-Analysis: v=2.4 cv=fL80HJae c=1 sm=1 tr=0 ts=6957beb6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=uI6G-Or-YwyI0Z_CgVEA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Bhri94h5HMVHymDoZE7cMfPkFJXSSOXO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX+8zn/eEwirUT
 Q1rREqqHX2R+oc3iSjZxYdjKTdUjzk9nWY91ar8bA447THIe4yHmYMVF34UuUmzm5yuYt+x//h1
 VoGlr2eqn2fdDoA/Ae++KPcNob9Cbz8e1RIqiWyxvRB/2uIxnerzUQtnF+NCVp9t/d2CQHHoCl+
 BTWGjAY8gXTNHhHNATRG2rknIUbwXr2jLyYkMgRhEm21Nc93iTK+uvBEKoVhLJteZOBi0hULBHB
 nacsQl33Lf4uZ6MlQL0FK5ACph+HQdDJ+kqvGOS9lXkN2EFB8ldvqRCt1wtrL1Fk9qL6yhn1nkD
 WKyR5d96dMMR7B79NIYRkQ/6oSs5LIwqUFmw4K2GwyGmC0fLDDP0SBL27sNIWbd9GV/V7xGPtb0
 rkMXtXGevWLCs0ZvRME+anyFn/GC3BWGlvHN4yM+u6S+tzjL/dtLe1rWIn8+LjhmH+GsPGXFFJK
 QTem9IRGe/diP8IHe3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_044855_562714_A6A7D53C 
X-CRM114-Status: GOOD (  18.86  )
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/phy/socionext/phy-uniphier-usb2.c | 28 ++++++++---------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/phy/socionext/phy-uniphier-usb2.c b/drivers/phy/socionext/phy-uniphier-usb2.c
index 21c201717d95..c49d432e526b 100644
--- a/drivers/phy/socionext/phy-uniphier-usb2.c
+++ b/drivers/phy/socionext/phy-uniphier-usb2.c
@@ -106,7 +106,7 @@ static const struct phy_ops uniphier_u2phy_ops = {
 static int uniphier_u2phy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *parent, *child;
+	struct device_node *parent;
 	struct uniphier_u2phy_priv *priv = NULL, *next = NULL;
 	struct phy_provider *phy_provider;
 	struct regmap *regmap;
@@ -129,34 +129,31 @@ static int uniphier_u2phy_probe(struct platform_device *pdev)
 		return PTR_ERR(regmap);
 	}
 
-	for_each_child_of_node(dev->of_node, child) {
+	for_each_child_of_node_scoped(dev->of_node, child) {
 		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-		if (!priv) {
-			ret = -ENOMEM;
-			goto out_put_child;
-		}
+		if (!priv)
+			return -ENOMEM;
+
 		priv->regmap = regmap;
 
 		priv->vbus = devm_regulator_get_optional(dev, "vbus");
 		if (IS_ERR(priv->vbus)) {
-			if (PTR_ERR(priv->vbus) == -EPROBE_DEFER) {
-				ret = PTR_ERR(priv->vbus);
-				goto out_put_child;
-			}
+			if (PTR_ERR(priv->vbus) == -EPROBE_DEFER)
+				return PTR_ERR(priv->vbus);
+
 			priv->vbus = NULL;
 		}
 
 		priv->phy = devm_phy_create(dev, child, &uniphier_u2phy_ops);
 		if (IS_ERR(priv->phy)) {
 			dev_err(dev, "Failed to create phy\n");
-			ret = PTR_ERR(priv->phy);
-			goto out_put_child;
+			return PTR_ERR(priv->phy);
 		}
 
 		ret = of_property_read_u32(child, "reg", &data_idx);
 		if (ret) {
 			dev_err(dev, "Failed to get reg property\n");
-			goto out_put_child;
+			return ret;
 		}
 
 		if (data_idx < ndatas)
@@ -174,11 +171,6 @@ static int uniphier_u2phy_probe(struct platform_device *pdev)
 	phy_provider = devm_of_phy_provider_register(dev,
 						     uniphier_u2phy_xlate);
 	return PTR_ERR_OR_ZERO(phy_provider);
-
-out_put_child:
-	of_node_put(child);
-
-	return ret;
 }
 
 static const struct uniphier_u2phy_soc_data uniphier_pro4_data[] = {
-- 
2.51.0


