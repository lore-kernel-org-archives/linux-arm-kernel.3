Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45CEC79F9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uHEQAWSamf6mSgVcU48rQFJXFmJhwrjLABUraXAPotc=; b=cOvHxtYkPf/ylAX68BhANCk8oa
	zgmYwjBpMowfChVuTvPOOT9bhINbJGrLhStHp/L/xSompS5zQw9DWThj4t7GeR/BPQmXQC/ezLDOn
	iG5I8hnPfEGDIoGzwbaWjr9glTos+25QgG/tTG89xWbM1pj14bDI5kaKK6pe3XB1LBiN/gIv2KNNN
	qApHDmjqj01lyhaBX2H//nIojAA7jzeSx+NP0FEFxMTXcuhaFl8VfqzMU8TjJXkcZhIDVS2+2tqZB
	sbit4hmH7Geq+2TPY9DTztyl/omETYHHDumjIs9PZmTzf61fEcDCELjCnDnatEzY7wxr3q9gSQ4sx
	jVGENFEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclam-0000000BXCL-0LYj;
	Mon, 05 Jan 2026 14:29:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclaj-0000000BXBO-2FP2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 14:29:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6059me8J3541662
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Jan 2026 14:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uHEQAWSamf6mSgVcU48rQFJXFmJhwrjLABU
	raXAPotc=; b=NE43sUYGtyV+BvCZMBQIlJdT1wm1XiOf0OTrOVxUk6y94X1MIZ9
	ZKDSaZmmPrDjoKgy3AsWeKkhGI/uOMJGiViqpAccR4l8KvKTeGMQeldaRmiaB4w+
	2BJdykkqdO9+fR0CmXfpYsSf9fEF4XaA5cVJpknsKXoKIK8pjG9ODV45uqlEDKBP
	fQBBuyFaNu2TeJexcXxH9gQzKh/XZum8C6E7f1BQN4/5SVNh8l7tDHVgCP7rQKjH
	QHekhAyPev/dTFuNwA9z5D6pAhTVVAHRPDmQQkdMQ7cipVi2kQQaOrwSIUbkR0r6
	ZpV9fk+ZA/PERJSiIG6vDs6AVqL8jUEheCA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg57shs9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 14:29:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f35f31000cso194713981cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 06:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767623391; x=1768228191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uHEQAWSamf6mSgVcU48rQFJXFmJhwrjLABUraXAPotc=;
        b=ix376gp+3rWBYIqQTls52OSYd12GzFkvqQ0sVUCL25kR/MHq+H2ywKKuWzHsPsHuni
         u48jcjjjMP2okx33uMrVen15GKcJdJauqPQUaQDhAirKtwynsG6f9cZf8DBgEcsNEfa0
         3GXIloXEkUgJfnoiugf1OyJqOc+ynzd207L08PxcsCJ5WnH4dvWQhMJSNE5KtwvHEhds
         LPIEAaM/c66IKoGS+zTh+6k1kV1iDkZIfuT9QAOKw+AHZKlyW1lhkuCF9HZ6EefL7FSA
         5iLIGBc56ho5fuc7/8MPHx2TGD6In2y85bSvjvw/b1AZoqUeBH0VQYsHh1gwdf9AnYcK
         b2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767623391; x=1768228191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHEQAWSamf6mSgVcU48rQFJXFmJhwrjLABUraXAPotc=;
        b=Z5727+C8Y23RmcB6O8RcfNj24U6f4taw/hJ7PzSYSEeYAtQfHZtMkZqnnL/dBpaQ4D
         EqI6kIg4sGA9Fc7YM6ISMZIrWTHc5GRQFRzuGYHOBG/rT6C6Vmq1Z4LmnYO6XVtysq4w
         0nJRBCK9aqWruPLU/rd5kAeCcnsHUUsxdNji1nNM8JSDgCNYutYux5+NTtpKUQs5dlRq
         n+Miv42fmxhLaDAoQz8tE9/iNZ43ae6fqOOf8JEWbZLA1lQMIzfIpsHzefz6JibegZoK
         bjDVF3DUYqGFW/GcOt0yf6Xfi0kLlJhRgm3c3Ed/l/CYXksN9Lf72WcBtYgRG4/Zo6Fb
         cGjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn2BmuBKZ9zPP+56dXvDGoZeq7iOou4Y8Ml8TfGzmhrXxT79Ja7+9P904YxI9wFHdVEGNxI8IH1nQE3ROvRLsY@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ+Yuk/H62yE226ihfxEFgcs8OkeZXHEIXe63ZzgxMG1/oMmKR
	NkfLbbcbTAROqmDNdEFRGiF5cJYZbh7/ynYCvsIPvUFpDvGvLPJk9Vgzi9vwBM7/OakT+qbNimr
	YPS2agAwqzoqh0NgnLU6AbRO5Cl4MT0IbmsbgotPGz9bvo3kRR8mHTADMp/BYX9AWA/5eCQzcT3
	SuOg==
X-Gm-Gg: AY/fxX62bFpMUFDIzM/st5D+6N6H/0ER7qHYh1XzpRmcKwRHwcqjPN36dbUufKyajog
	4YQJ2CE/HLwRykVLoDCmakRVTo3oonCUdmMb6/CtGqtMU2h1ul8lbQfd4a8xoyZ4Pw1NrmVkTnQ
	c/leUaJ6p3Lw0LAxNFiwwsmcz3go0+eEJwBSxS8UPVb4Z37PdbdWaD/Jbv9XiCi3WdrtcvVn1Ry
	flXSEwEklyL2b/TpPSlsJvrmlefQQ5Wj025adO9EFkKf/4hdSTyxDig2zQy0Ntu7h7Vm/LKHMf7
	R2X5f+dehaHbxrLgyC8duSjEm3f2O1FFRGa1Jddyhovs3rc3sX1qS783f54NOVsOmSUnTJMB5j/
	AToaCFDf0m86DwA9qrt1+WrwF3A==
X-Received: by 2002:a05:622a:230a:b0:4ee:1365:ba71 with SMTP id d75a77b69052e-4f4abca88f1mr652021551cf.9.1767623391202;
        Mon, 05 Jan 2026 06:29:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlvRg+aO8t+zE5vVQx9pWdSJVFNfjvds9sCsVNmPwgMaoM5zPq5KHvwNtUo5Xk2hR51+Kd6Q==
X-Received: by 2002:a05:622a:230a:b0:4ee:1365:ba71 with SMTP id d75a77b69052e-4f4abca88f1mr652021031cf.9.1767623390710;
        Mon, 05 Jan 2026 06:29:50 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842673b560sm2074066b.33.2026.01.05.06.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:29:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/3] ata: ahci-dwc: Simplify with scoped for each OF child loop
Date: Mon,  5 Jan 2026 15:29:45 +0100
Message-ID: <20260105142944.372959-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1510; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=fAegm32bM9RyJz+Nl9EGlr82cAT+Hy4WuMkpCZJ7rro=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW8rY87hRh0OzcNY6V/K6ooLENyRt+Cgnakquq
 iXDKU8drGGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVvK2AAKCRDBN2bmhouD
 12dTD/9Suk2plByjENwiUinWakQ+DPzMnIChhWLkeXgvvr1J3oRE1Ex4KAifn26iU5s0x7BtN68
 GNE+GefUqjIbOHPNiY3BIL0tfcgLjPne+kieuwmTzXonwITY6qodvNg7og57nnlqSV0P57Pi56G
 1PFQyuBOYzqCblfnmTcufc56svhZhH+R3RrCXS1h+xwtD2G3V6bfUUHakvyzAOfjiPhQuhRVKl9
 6EuGeCyEV9A/kvwxohhZsxD2PTZbJ2jk/NBZhxvuf3TLcQU/q2vdnxX9/w7H15XJrMXrMh2FlWQ
 NxLOvtnE9psQpCArJ8Cuvz2R1m+mUHX/MkPuqE6jDe4LjHdQhDPiMpiwVKRv//OrtbNPj1qMIPu
 Vk7BkgehA2WM6IjGm2/Q5lU1zSugg5St8RtFX5LBLcgY0qdC/BFna82n/a9hjV7YIB/V3kKOUOX
 mpTIDU1kw3VlmMvQvx9tk0e3KgAOkb5LxYHhHKtB3wfHxmdrGDLnzaMLilt+R7liU5LvAylVzF4
 26n7JbQVd4OPhs4Ac3Ze7mRUSZ91Cgi139zuyeQm8a+O1TjJLsQoatDVrRb1AKTGeES1pnKz8+H
 FydzfDgQdLIOiNlCdJPHoCrmQE7yCcM5ceup7eonMHEkdZ80viAMSNFdNO0gD0UKK6YKALuJDbL QmtPHJSK6N1c2dw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UJ/Q3Sfy c=1 sm=1 tr=0 ts=695bcae0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6c6E2J2u3FmSKLr74-YA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEyNiBTYWx0ZWRfX9AZfjQuClSGs
 /BfzleFV0JtgwMzvOB3wE3Atrtj4/luHGIiuQbl4C9N7yAm1IISBXW0WiObvw+iyy7zUuVv0RDS
 aP1ne+N1EVeBcfurA/kMA7kU3VttJcU1wz1cBVAKYxsXmNF7uSsXEUTtrxZ3Nxn1LRBW4LsxuNR
 HH9Ff2E6H1SI5JLaoE3E7jekWufbt9GwRAJd2V1Fyl2qExxqCc2ytpOKFmecXZhYlHN8QeHbxRC
 eRfc+IwBUK0O/ac0xn9uODe69jmJC784LkXnQQjCsEuSrfU/BZX7zUMjzOvsifY037Vt8c8iy+Q
 sSFovV0+9NPPN9kMnAkhY6T9i5Xs9vhs3AVMMVfbKcqo7Ri+Ln9C33FkDVHfkjwVMaqHgxsAcuM
 UAt7nNJAfIg+TqYYeqeakA97IjcVkDrT/jreyFzHW3RPvKlpGGlBq9wT1JNnp9dAH7mBMqrAUke
 VxYSyyS3VzTzZzI2INg==
X-Proofpoint-ORIG-GUID: zu_bzYYawsUr7aAk06xFZss8ChjPAIIj
X-Proofpoint-GUID: zu_bzYYawsUr7aAk06xFZss8ChjPAIIj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_062953_583516_536EE261 
X-CRM114-Status: GOOD (  16.44  )
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

Use scoped for-each loop when iterating over device nodes and switch to
iterating already over available nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Use for_each_available_child_of_node_scoped (Jonathan)
---
 drivers/ata/ahci_dwc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/ata/ahci_dwc.c b/drivers/ata/ahci_dwc.c
index aec6d793f51a..64abf865bb67 100644
--- a/drivers/ata/ahci_dwc.c
+++ b/drivers/ata/ahci_dwc.c
@@ -260,7 +260,6 @@ static void ahci_dwc_init_timer(struct ahci_host_priv *hpriv)
 static int ahci_dwc_init_dmacr(struct ahci_host_priv *hpriv)
 {
 	struct ahci_dwc_host_priv *dpriv = hpriv->plat_data;
-	struct device_node *child;
 	void __iomem *port_mmio;
 	u32 port, dmacr, ts;
 
@@ -271,14 +270,9 @@ static int ahci_dwc_init_dmacr(struct ahci_host_priv *hpriv)
 	 * the HBA global reset so we can freely initialize it once until the
 	 * next system reset.
 	 */
-	for_each_child_of_node(dpriv->pdev->dev.of_node, child) {
-		if (!of_device_is_available(child))
-			continue;
-
-		if (of_property_read_u32(child, "reg", &port)) {
-			of_node_put(child);
+	for_each_available_child_of_node_scoped(dpriv->pdev->dev.of_node, child) {
+		if (of_property_read_u32(child, "reg", &port))
 			return -EINVAL;
-		}
 
 		port_mmio = __ahci_port_base(hpriv, port);
 		dmacr = readl(port_mmio + AHCI_DWC_PORT_DMACR);
-- 
2.51.0


