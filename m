Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8A8E7544B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 12:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azY5C4oBdnP1B1v82RYPMBeCpPnrWdWx0XpbhbORP4E=; b=dJFyrw6TLzdZ8LGIudyja10ngo
	O0KYaOOVSeI7LaAw8wTlc+dFy5s8XEiTjLMbRWAT//Sd8WZGVTzhzw2y7dzGQPDwMfZJ7yw74W7eD
	bC8dSfyd3fjJHs7PNuYJG0h2sz85J6AoP3JeIVmaz3o1i0GF2IIgol9sGw5Y4L8NoSuRrgxfpmMED
	80sP/TNLOVoib/sUpEml3ODzIGala91SDN0Dyp13jSacpGp1UWbjLKp7kZGvv4iLvE7ygzfjLehTk
	HbhgUdXSXwxIyQbBBZHFp38Eqo9G7A8qTG9V0XpxgwRURLZbDu0hBvDRioDTALlN6MD1fxmjPRT+5
	XtvAkjtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYOE7-0000000Gnjh-3MsZ;
	Wed, 24 Dec 2025 12:44:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYOE1-0000000GnfF-2GpY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 12:44:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO6AIpi1018504
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 12:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=azY5C4oBdnP
	1B1v82RYPMBeCpPnrWdWx0XpbhbORP4E=; b=eFQ7FXKN8gOwxG+pKIgb4O/tVCS
	1B3QTti3COyknGSdoiPYrUEzTIetsdWH1yFaTavOnFELOTarbubR2+fNs0giEIKK
	zxI6yioyjC3wJ2GhaIIu50QTGtsfX6qPAFIR1kll7HMhFMujMWYMpzUBB790htEI
	6j/TBwOZmOoIFXGm1LbMZN9r2zTJKtY5unmmpbq/cgQalT7fOEzFKqqZxA0HRSVt
	eMGBq+m0AcYSByK6kYCdGyRyaMoTRt7UPwABk5rKR1d5K+cN+j24oLJLL8JXWzcT
	dh/aLhyekkGIrKtlBvd6wnxW6TG1T1o1irR3U4muor65SGsmPqRZNekctaA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjsavg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 12:44:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso201113281cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 04:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766580260; x=1767185060; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azY5C4oBdnP1B1v82RYPMBeCpPnrWdWx0XpbhbORP4E=;
        b=PPmYZ392aD6RmH6DDoLv+sIqQ2tY0QCxRtkdW+9JbOSxfqJGw1vMZ9ew01ZxHP0KYa
         voNt6dor0yxkUP535jSPbV0WRfVi/pXpM2sfNS3db5Y95UBpkfwZVAurnbkbD4s0h1k1
         02Q9dKoV2tV/GnI0c8CLeJdAvHfORUR39Uk5/WJ3Epc9XZob3l+Z3UMqATJmaY/zYe/B
         D91VlLKkMIlEAHyhQFGKysP++b4cIs1+pTi43CS5nyRy57Ovr5oXftIS5oTzyCKhAUls
         MHofRaMG8LIkkMGafB9ds+Nyjw0bZ3tq8b54sGwBVvKi3DGfrAjV/QDVnL2U5Yy6hVGo
         xjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766580260; x=1767185060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=azY5C4oBdnP1B1v82RYPMBeCpPnrWdWx0XpbhbORP4E=;
        b=OarQCiOCXmsiL6Ez2WD2EREgUn4ek3CixwztspQQ1vhFPJeAdkPLEzl/LWkziSA8JX
         rqQGB7/pAA8MFG7A9GgORRGFixUUXzwsCjSGQZKcWLMFY+c34UV6V1A3rn3qk2Yw6HDY
         SNKXdGSZfVVrBpIazpQjgtIIo+qFH73B5KlPvAIF1D8EZ8K3n+HejEGlRfzxm/SbSVdY
         VWPJESaMIShGJf+MLE8D9ZOu1JqQGhVAS1B0YG6L3MSGNtPUON730lmFYzWRfxyW7uM8
         0NeAL5AEIvbKK6SczcS0MIGn05euWwJ+0TPOB1xKNoUZlix9rxdF8gdfrjcTxfGUeK69
         3Sng==
X-Forwarded-Encrypted: i=1; AJvYcCXPshaaYrLMXQHHo0Msu63d5sxdxwRi8c/hDGLTA76wmdwy8u1KxiFVD9LHY/Pps1ivq2RAXuVX7HkcClUyQz+V@lists.infradead.org
X-Gm-Message-State: AOJu0YywhrfxgH3iO7W+/pj58MDQEZNr4Q4JLbwMVPER2BJlJq3T3G6n
	NObazvmFcmOqpHuJVlrjZZ4EefEg8OM14JfOr3pVKVzPUNnZcN8NDme1Wi5w8U9y3+PPJsW9dlO
	5Fg2O86zVF0D4k7aNFGlMP+5iR50lQ6LzIyx/GBlv3dJgQQS3FPVz69ghxtWyLhVCGlffovJ03T
	VYJg==
X-Gm-Gg: AY/fxX4qime7S8y1FN86MDA0uy8hCBHfWdkSol/mWn71os0cHMLRRU3B7p2NuAscbP4
	zYACOy+7Ff6rZrPajweOPEFOBVHiSkm5fSSWAWqk8E/bv9BaiRE1D9GpZqFEtnNx1dZVuDXRJ2x
	v0ES7ShqLM8Yd7ZF9hCE0AKZZvm4x7/BZS8nHMJKZpprxEPFhihSuqWtD/KWQyBNyrK9tp4wQjX
	hvpVGvkb95Jz38tUmPm3MwqANwXPDctG83cXH9gRwjnTyXqioO8HNB5xmIAmjqiRGKZHf2SO6WK
	JQwIz4PN+nPOwO7bzGNtxEOUeLpjQBqy/RL+My8BLtwzONa9Y3zOP1ZTaMRyC0tCNh15/cQQDcN
	pMP7woieQ11+8c6nt60cmqx28jwSAls1OcTRxoFBuCN5YDGriWJWEuqAUwO+fChxrmRC1HQ==
X-Received: by 2002:a05:622a:1b9f:b0:4ed:b441:d866 with SMTP id d75a77b69052e-4f4abd9e674mr262006351cf.65.1766580259858;
        Wed, 24 Dec 2025 04:44:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLezKdfVehEinuiLItKphYasBvJ0uhf05rwxwHyj1QbiVPaJ5DMuafVZF4czaet64zEyCUqQ==
X-Received: by 2002:a05:622a:1b9f:b0:4ed:b441:d866 with SMTP id d75a77b69052e-4f4abd9e674mr262005621cf.65.1766580258864;
        Wed, 24 Dec 2025 04:44:18 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916b66e2sm17049203a12.34.2025.12.24.04.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:44:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] phy: renesas: rcar-gen2: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 13:44:10 +0100
Message-ID: <20251224124407.208354-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224124407.208354-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224124407.208354-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1466; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=pDAiDD6QCU8V5xqDxrCJ7LAU7tCZMZYYdnGT2r07mRs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS+AZ297uPNgzd6jPPGJtD+Lw2vcBh/MOmOaju
 7pE0l3/1z6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvgGQAKCRDBN2bmhouD
 11QXD/4pnYhtNHZrR2mRmfMCm8dcj2ocX7T6hAPvs/C+2xZXRl/JiUg/R72awTn+Ifoz0YNZs6F
 Ocu4CUaW3DDrOUGCoWdkgZupfrDNTogTOeo6/2B9kpNGNTPtDW12pgblPJIDPYrxoGv9liUw+Y7
 5hYM6el4dyotsKdgDmGfMRx2L5bRwfVaSCEfb+pLyQbaVGf7Sf8uJtK9MUcJbB8InKFAQ/cjiWb
 bZFhDPW9Uj6N3cQUIKk9gpEitmh/d4DW9+6uxVzg04SzmBYoYb0BI+6nwRP2APOwu83SkSPql5M
 Ms5kpg8aw/E6/WSYi2tmBsTBrH+Xuhy3xOhmO5shHPJiwLEXLW5cQ629+oq5xGWXFCtjlyKZhdO
 Xg3K+1NQrNjrsXCQ3K+0HW+x+wiT3D4g9q6HRZIfWzhnqrP5pruhuBiV6EB9k7rW7lhqeb/Be+X
 l1cfY9RBstT9AZyMIkeuS77NBC4ZM6NBeS0ByMrUf3CYO1Z662jFP4YWOdaim/AXcwgkjqw7Tj9
 CVtjapZH6qTMDRKJDtiAxujkSH/TiPn5wHcjRqV0oUuG0BoPKzqHL6Z9/zsoEBxEj06xxWo26CH
 z9cR9GorgCCKygQc4ffhtNvDwSEfB9/b2WIAe+Y+ppXU1E4/uZL5wWsnBQqnho0GrlTv3rKvHwD E3VFXoXwdE47UHg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfXxAJV3B+V9gmL
 2metaRHmHIXgAqB/PKssM8M5q6vr3yuWtRK1/IPI89sQDh8MiJY+cGzQ3LQwuZ9+EwPgscNoQuD
 3MVNaA9OElh1EBthsBfynQzkieksskcTno93IohY2/bXRcaokm4Z5nOLJ4mUJGCjSqXIva1LTuZ
 vEDLOcAwQJPRzzwMRFrTlBYaqWw6kuqbjEipH8swiClLTtP0IrOrMBQtaBvXwLR690TQVJh1YXe
 qepvAdrDXz9vKiOogcnChyYS3yyfYemOyI8PhRfL2GpT+VJREXzpQZdda/+VPy6n9UqRBs2AkbM
 5OQ05SUb8ZSEyh/Ss+YitjnKEpFrW2GvQBZw3TbryRQH1RRZdWUijeiqBaE4G/vks9LXrPvjoZm
 56DeCp7/4RA3jT28RatNvtNo5G5tsJQdCYRvDdKyBJxeKYPZgo1DoLx0Wve2/iDF8SWMcWfazT1
 m0eUwDCyOSaO9wkZX6g==
X-Proofpoint-ORIG-GUID: GGHIs7nQpQwjqi1sa2_9-0qbFPFfuAoe
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694be024 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IfAgvU64P-rbEeZQN3QA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: GGHIs7nQpQwjqi1sa2_9-0qbFPFfuAoe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_044421_690532_3B103BCB 
X-CRM114-Status: GOOD (  16.25  )
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
 drivers/phy/renesas/phy-rcar-gen2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen2.c b/drivers/phy/renesas/phy-rcar-gen2.c
index c0221e7258c0..89454ea270d3 100644
--- a/drivers/phy/renesas/phy-rcar-gen2.c
+++ b/drivers/phy/renesas/phy-rcar-gen2.c
@@ -337,7 +337,6 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rcar_gen2_phy_driver *drv;
 	struct phy_provider *provider;
-	struct device_node *np;
 	void __iomem *base;
 	struct clk *clk;
 	const struct rcar_gen2_phy_data *data;
@@ -379,7 +378,7 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
 	if (!drv->channels)
 		return -ENOMEM;
 
-	for_each_child_of_node(dev->of_node, np) {
+	for_each_child_of_node_scoped(dev->of_node, np) {
 		struct rcar_gen2_channel *channel = drv->channels + i;
 		u32 channel_num;
 		int error, n;
@@ -391,7 +390,6 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
 		error = of_property_read_u32(np, "reg", &channel_num);
 		if (error || channel_num >= data->num_channels) {
 			dev_err(dev, "Invalid \"reg\" property\n");
-			of_node_put(np);
 			return error;
 		}
 		channel->select_mask = select_mask[channel_num];
-- 
2.51.0


