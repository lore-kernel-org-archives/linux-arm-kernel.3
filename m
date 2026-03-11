Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755E31125847
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 15:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AEkwQaRLxJA9vvcYTFRA9xeDnZL3eiAJd5xIuCJlDT8=; b=AVABXKLIrJIwHzB8g4KmDCfHBi
	5P3YSHsk5P8nPy1Sk3t1UO9Zlr1+7VOPnLgv25K8MbiXef4uut7K+rwI2d5l1yVTPPHzD9sAMF2fT
	rOh0ZX2tWrBoLacNZPlSBs2Vot0apQw13IYN6I8wAzzqEeDYwQAdlUYcmw55Ws3Nj8b+m8e4ndMHs
	IK0gP7YxvTC/m3L+ObPaQxlyYcZeZO2dHzfMWX5/whjLEeGBUiabpa2Jp6QfNzNdFsMI8l7zXNxIM
	zxKHIvR/vIeOkx3y+pZqpapxZLpClk9cMJkJ9n5SxQEQfOw2mG4jgmF9YdfE15PPu0VAqDApsPh+M
	6nndVXvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Lp1-0000000BrIw-1it9;
	Wed, 11 Mar 2026 15:50:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Loy-0000000BrIN-3bXU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 15:50:06 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BCM5AU1439671
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 15:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=AEkwQaRLxJA9vvcYTFRA9xeDnZL3eiAJd5x
	IuCJlDT8=; b=JL1maBP/kOYChBzp2/3bUeqymrJt8WKTQIENKIr4PcgOVMys1uy
	LqLnS9mrCWEQazEsoQ4uGykKb6m+mH0E7SL82WzGTgINZvsbFd4TfVR6Q2R6EZOo
	GZaF9ztciDkkWMO5+Iklnafr9bdXMn21ZQ6jyqnYTmfx7s5mTSm2bh3LopTJAcAt
	yHVIOcyJlqwMO0a+C4x6t/6X8XPIOrR2vO+gNkQdzFuXRb9n7xX8SLhyFFXAxzIq
	je6biAa5N4FQT3u6+lVHPeyAFDf3It+g7sVV5g1s+RMDBnf8BiHPY69OLNoMKap2
	KqaGR44Lm0hMJ/xzeTi/xoMvr+SvadjULaw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu38yj19b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 15:50:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd827a356aso1983675485a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 08:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773244203; x=1773849003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AEkwQaRLxJA9vvcYTFRA9xeDnZL3eiAJd5xIuCJlDT8=;
        b=PvPuOoHGx0WLhpbeIjIxaNVw5T4AEZmfUwEycnpX9VBqg2nmHnWm4KjA66c+U9P22n
         EbkhuFRVVPwqIxVTR7hqdx2gzDNMwC/Di/ebGj1p/8QHeiBzO6DBEl4RzDAwpYLISqAX
         DSClXwpkbSlXA+a/Uu7EW4X+gf6L4Mcjce5uKmPg811KOCwB2JQiOGRQKLZ/Qtxj7pRm
         CUJoO3/MejfJC8i7B3kIV3q6jVJEOqrZ4VoPx3T1AH36faprjN4upiBXip+5l1ytpc0I
         K3X1NXhi0cYuYREZp4bAsMfIXw51qlLqNOpDKnTPgrLYQs1CMEfM92vXvy8L03FzlkQ3
         20Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773244203; x=1773849003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEkwQaRLxJA9vvcYTFRA9xeDnZL3eiAJd5xIuCJlDT8=;
        b=QZWhKhQAXV/I5fiM+z0iG1I1j0WITeV71oEXlehSPeM5tZjxhSYdw8Y3k37EKFsyN2
         PSjoBweHdcXGWRpiEUXaKkrLEZjnGrkM20MV64KXwgVhT1Q7Fbpyo7ezRAbWcT7BszPT
         Vp+cy5hsGnsIZSmXlWrbfsLmZEmlZe7bUeG10xhuDzZ5aF0UU/m9z5doR5Bmbb/zL2QD
         lDEk+BJ/HYW4HndQGvEFtAsM2XyEYjdoW2gF7KEXeHvgRXtqQnK55gHhbhT58Rk7mRU9
         Jkn6qmwfjAjYmcsACD9rR6FRB/umUnRoDWNJI2OR9q79PhDl8rE7PiQ/1gtwShxN6knC
         zJtA==
X-Forwarded-Encrypted: i=1; AJvYcCWtuW4yK5PxV6R11HVNrvIGrIsEiwZ+nvQXreFndMrc8RHWLkXjzCq4PfZDES5t47z+uvlswUXlu18oA3aRGqQk@lists.infradead.org
X-Gm-Message-State: AOJu0YzSmVfcUHKhRiqE4LU0ZqGXBPnjYzUAXm6QEiL3nCzY3q7ZLBzR
	5BnaI5ywUt+Z8Q9Hf+5GEKSZ0TQoy5aE8DV2fLHm7pTywtbtna1/Vrhko6fWe4qdaPWDlZ+2duq
	cyaoS/jfsFIIn6qK4tB2XqeY0fRuAgNLMOdU3Pm7X/bYUhK07GzPtOOq0HVkamTRTN9VrqY2xXI
	dvZg==
X-Gm-Gg: ATEYQzx/KLJ1W3O8apDJmRHz1QrUTmnYS6tFtzTMOU7PPyocHGP1JHYG797aytwDkE3
	g9j69uZRN6JaJhRkbgjwYZHS77cOYlRoCkMTWAaiu1QvsginKku8LyO0h1DtOwKz9oKLAtQ3Hxv
	9sSCZhYHOfKX6RHDBLil5B357Ac65zgh38MtUiE2owComzOYSQo4EHiwm2zE5txcddNAATdrw6C
	VjmkWZSsXAp6/VP1imlFLY5NRqC23MfIw9LIk1Lv4m5TpWTFwIhAYR42fdSVurCI6Wnv3s79D/K
	9PisMANft3haP2FWjRLKkll1sY1lK1vE+3rs7qFUJEIfXPazDsWk0KJ7bHt41oYbF+WJoY8jpPd
	BHrryvM8HSYgfK5PUq2HmssddssS3HLARCQbD
X-Received: by 2002:a05:620a:4710:b0:8c7:8b8:e0ac with SMTP id af79cd13be357-8cda19e4a09mr392805885a.12.1773244202705;
        Wed, 11 Mar 2026 08:50:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4710:b0:8c7:8b8:e0ac with SMTP id af79cd13be357-8cda19e4a09mr392801885a.12.1773244202236;
        Wed, 11 Mar 2026 08:50:02 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0c678asm25127285e9.13.2026.03.11.08.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 08:50:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: PCI: fsl,imx6q-pcie: Switch to undeprecated reset-gpios
Date: Wed, 11 Mar 2026 16:49:56 +0100
Message-ID: <20260311154955.145120-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1322; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=C2nYk8Q+Ab3eCX4sLeShqQsezv5EmApIAthgh7Ov5No=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsY8j37sEQYNwmd65+VttyEmNwS7bCq2VKR61M
 oCYcZDBMZyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGPIwAKCRDBN2bmhouD
 19nVD/9IUrpN+dEj0fwoVFqS6y2ML9jcKKsWw7J+T0N5997e5aKAf9bXviyJxONAOuJbPW1aub5
 O/QZ07/jMTD/qSoZSkZxw2tupWWTX8hQX4qxvm3+ipKVtB3f+BvrszabFBb9fdkCv0br8BubzJL
 4VD0KU5PXunS0t/vDwGQAABz/SZ4reuF+BnDJ/EhPuHngRJCvkLgqMzP8sQDb7TYHO6JP5Fu5Wj
 eCupammRMm8l4UmHsq6pF92t8kHLDAgetZTe0m6tX1ACwKAzjLxlsii26eZ43tXTfqM+/Devqih
 MjU/JSqVSLF24hVXBmowLTeNDCoefiFNQ+mSBl4U6IRgI1z8neaymNXPCfE1F1xYN3s3/K4C6dd
 w7vydDDoygzl7lzHUVic5qAINPYCmDnrU/kgO7d4eEcN0EmvDuxay5FHZdHVJiONxfDOrtmUXzG
 jZx+r313tKkUX0lgtrSyHja+yfDG94KxKtCYqJZMQ9mBhLbbtVhza1yRZxCv6Ws8NzHOV7XjjJ/
 mjWRvef5IPAroB3vpYid5UXQs6id/J+9xisIBvi9W4xr3zCk2KHMmUtHoVdinoZxP6Mg45S/mMn
 dOZe8FSLTfdQqgQE7wCfCozJs9l7uWerJzCF+m6xJcoDv4wqCrXe9Zwoo71EJQzPm8SSS3MLR81 E4gyne22u+GnGlg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNCBTYWx0ZWRfX6fLtP6NKbMnZ
 hBkfkiAgkNiZrpjTWx5xkZBtuhx4PD4HCr2k9qEl3Owwm8b9FQbQrSrTEKqOOI4PRg3LA0cO4+2
 Wf4gcdRGKyCzcZkPdgGruGzmzCT/fVHWPCW8eKfsC77+CBR+f+MQ5SKnzrnxdunCt81LHwf8IAa
 yx3GLuIMVsWxFpUITQTgFrQzBbtkHiJNE3ATfHGiX2HJ1EPGo54A7AFhMzgtEaOUf4c5tTrjxiB
 A7h9wGRWrX8vdlGEH7v7MDswou4rGrj8m9XeumkIBBG0Yera6DEECVYW5Asw9y3Y8eqoJuWHK8s
 Qf1VqOCrZqnOKpuHpUt2InumucbqNij+NCYgimqPT6KGTH5IfAU7weyXacy9WHh6Z9GtbZtSjE8
 rRxDev5AWZzCbldmWgn0Ag9ZBMaygMXuc3KSjEeDp8MrpnGaNXYpi82tUMv45hyN5pmyetJ64gF
 aNHog2q3+CZ83iBH+uA==
X-Proofpoint-GUID: f76s4GCiw_dXC943DR0B_T4xnMl9K1hA
X-Proofpoint-ORIG-GUID: f76s4GCiw_dXC943DR0B_T4xnMl9K1hA
X-Authority-Analysis: v=2.4 cv=Cq+ys34D c=1 sm=1 tr=0 ts=69b18f2b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=9ZXkLDzuA0wS_hkKTN0A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_085005_036698_9DD42F42 
X-CRM114-Status: GOOD (  12.38  )
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

GPIOs with "gpio" suffix were long time ago deprecated, thus
"reset-gpios" should be used.  Linux kernel supports both, referenced
schema snps,dw-pcie-common.yaml lists both as well and this schema uses
unevaluatedProperties:false, thus change has no impact except code
readability and removing deprecated patterns.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
index 12a01f7a5744..b9ba938c6239 100644
--- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
@@ -58,11 +58,6 @@ properties:
       - const: msi
       - const: dma
 
-  reset-gpio:
-    description: Should specify the GPIO for controlling the PCI bus device
-      reset signal. It's not polarity aware and defaults to active-low reset
-      sequence (L=reset state, H=operation state) (optional required).
-
   reset-gpio-active-high:
     description: If present then the reset sequence using the GPIO
       specified in the "reset-gpio" property is reversed (H=reset state,
-- 
2.51.0


