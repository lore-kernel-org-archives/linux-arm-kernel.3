Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EFCFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 13:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wClwdHi//EKovApGGp/o1/cMKxisBXL2sxG8w7zO7Fo=; b=AIpOfSGRjZHIcUfXFIPOIY8dpq
	PsKB66qWAhGl2FhpavlJmxcwmddnjTob6uyGiYjARrI31cLMg6NE8/0m/9Ml74RcBtq6Nt2fKsmTb
	eQH3pEMMlEqawrnsrOCjVH94zFQdVitZzPCdB2SwVRTq0f0WFOszxyq4c7kI3MQCFoMc9X9U4BLy8
	Us4XJVRkjV96ZIXWAo1Q8RqGKTfciqxTIdYeLfB/7ux3EX8yX26pTBpS7AtnSW092Lkj/cpsygQEQ
	UWJ5a3P0o/ATR5Y1tKn0biAjpDLivdIuUFd4dW1FDcHKlmrUDXlVEOmVr3Vpmn3TWMZOSPmrctJvH
	p+hkH5cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiTI-00000001XRm-3yEO;
	Tue, 28 Apr 2026 13:27:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiTF-00000001XQU-072W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 13:27:26 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SC0TQX1625044
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 13:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wClwdHi//EK
	ovApGGp/o1/cMKxisBXL2sxG8w7zO7Fo=; b=dW/1JQe9cBtpzMr3eMM/+Eqt4vo
	0ZSC+iHG5TPw/xMg2XFg6GwVycdDVghqjMmcwUHoFoBBTu2k02Iqux4l9Dy+ugQp
	2MWnmuqNsGUVl5O2w+Hv4sP6jOYwTa4qpSmVi6q1qXmJZk4OLaeTrK3xBe35It2T
	R7LsM8nBmLY+f9r73wsgUyRtzBKA64N0TVm0x+rsVYfCtz5OiudxL5hTo8ARKWA/
	SVpbvFedwKEVGJFLqP+I7F1YnMcx5QMTrZCLlU0XyBBdB1v4GPWJ43pSDsGclisF
	oMxvcs5QbZ0UUO/1sYYucyM3ew42wqnPo6IKYPNXMVfj1h8abVpZK4KqA5Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtgmsb65y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 13:27:24 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-610169771d7so13154589137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 06:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777382843; x=1777987643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wClwdHi//EKovApGGp/o1/cMKxisBXL2sxG8w7zO7Fo=;
        b=jSv+5OQJEBdzOo4cPU0MRItia3oydwKfIqdNZV//ECoTSdqrq4EfmhMUQhNN3jZCKa
         DmbLE2EgS14RdPtnwn31Jxl6oGlVUFgOqwGH3db4k19mWrRIIRRsZIYIS3a/TtZiPtYW
         fDcZu2gwpNuObJ10xWx3O1aA1kG/NBNhjHCwRwKPGa95kWz8geWcqvb+yDhQXEWd03j+
         GDrMehXTDqvnfg8Io/qcvjJuhm5bttVYY8F50nCFKapfHitVUSCs0F1ZJVBLeicuDHHL
         cBbVsZo5N9yzCgjGfy8uD7PAbxOfVGkIYC1AjkjNV8QGHw1TuvKYG8wRyNTZ5r1RegqC
         aK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777382843; x=1777987643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wClwdHi//EKovApGGp/o1/cMKxisBXL2sxG8w7zO7Fo=;
        b=WbKNjJovg7dEcONfGvLgtR3qI3hAD3JlHyWaoVz+cC2WliqjE3Eh6Kz8Z2MXB1wZfR
         wSgFWxf7NsYWVQGJ279JPlhhy5pawAkwx+frx/CPUiNn3lsbSU/NxywMpj5GQ3pjVlr3
         fS1H9gNJlM8Shk5dF86sctGVIYpm5iOQNtcGcLNEk6jw+FV/DpEHnvAB/aRf9KI62mRG
         LNbn4OB1kBZsLorXQ3XZDaDVHsZxM1G0EKzKBUan3ziagUeAKJJpkBuRVZyXUUvKLuSx
         IAAEN5SN73xNicKM6VcAZ5bZLsyDK4UMR+bMMza7iHQ/Ye4iLkYW4CmaFpSTZDWxt9l6
         M4Zg==
X-Forwarded-Encrypted: i=1; AFNElJ8jt5Wo6oclByF6FcFEmNYay3afgLhAE2AQCgqGglHwaSanrzyHqm1+35XFgvzMH5MlB0ewE567d+gi76tRv7ez@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl397TOPxNVDbd40urSEGSph2HTxG+77L/T9XdgGxRdTVhzTEL
	SGIKWXtktJn5NI0b219d4Kj0lrSVaOl22hOenm7fF+oB4lwo1xPtxbiZuWKwkbDXobsqVk0RMWV
	dNWhLpLeDkx8K/OBT/FN37Ve0NNNTnQnCeU292z4usw+DMGVQqGEFswNqw5PphPX+FsFTEg/G1B
	2k9g==
X-Gm-Gg: AeBDies6KADj9i0scZWmiFiPKMtu/CPnLty0ynufMHDXjQ2zLDAvCRxmpG2wVa1hkK0
	iLKcc9cqOQZEuohAtBaHeeRnOSPi6u0cSWFjFQBParDwj1kzvCji9DxDzWyS3fP+wNJKiaF8+9o
	mSxSBKWb3NNuyaU/Ci4G/Gw9hPZnR1T+IBBfT6tXZYehsLdbescYm1C/ZMeQ0DhYTg0S9w7NcWW
	p5lfdDAu3dP23B9mcmmmJ1Gs03WcciunkVeAe4SIMTl7XqrmAXFULRo0c+aeZQAKQ67hs/3h0Tc
	lN/4yMPQnaohnqKXOU19o/crr1guVWeJi/nwGovHVRONqtb93NAx4bnvhv1U1zZh0GRwjWnbgof
	fnqKpokjPhJZotw9aQs2Ckv4p4ym35CGeInHCCaUkC0m7ygA=
X-Received: by 2002:a05:6102:54a7:b0:610:56a:4bdd with SMTP id ada2fe7eead31-6280bde472fmr1278328137.28.1777382841859;
        Tue, 28 Apr 2026 06:27:21 -0700 (PDT)
X-Received: by 2002:a05:6102:54a7:b0:610:56a:4bdd with SMTP id ada2fe7eead31-6280bde472fmr1278233137.28.1777382840066;
        Tue, 28 Apr 2026 06:27:20 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463d5ee9ecsm7232213f8f.16.2026.04.28.06.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:27:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [RESEND PATCH v2 2/2] PCI: mvebu: Keep child node refcnt for probe duration
Date: Tue, 28 Apr 2026 15:27:10 +0200
Message-ID: <20260428132708.95998-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260428132708.95998-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260428132708.95998-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1813; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ov8hIF8M1z6R9wDtFRkRAkC1i3judy0L71MjXuy8SHg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8LWvxjL35h3b9GCXehstfFtvOosrOCx8JxD2V
 bgJIU/Bh3aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafC1rwAKCRDBN2bmhouD
 16WlD/9v1FyqjVeDIKt9vW6cdG/antel/dqTkWtauYAQHcCKwfJF/GUZ7e5Ze/UthhvEqtUjfNW
 qZ/SJxUyDrHJFuFruqiSughQx1TfTQw6NpicAiWE6hLuGADO/tBlh1WO4FEqmSq6/onJPPh1eyK
 IM5GewioAdS3wz7EE0DOVoncynQBibxpTkhhKaRg6sE54NQJ9YDNHOya4xtiY7rAitvZmQsYBnJ
 eajJULQzgNDHPXvaa6XGiQ+YB3TuW+2d8gBKWywb9RjfrTfvPT3Wr9tjk3jZOlXf0BYqF8EwMY8
 p8f+69RByv/MAkZzG5yeLjLU+dCQJkH20OzLi+Y4nFu+g/pSwCYc3z34JBAVYtQ68cH2jaCpKvI
 voA7mxbSB769nrhf2neiMDLMVvZxY+ndor98M+G1p4lrgjo3e6nYtW0GNSxKkrqGCqJth68mibs
 +FRu106p7ZkPS0Fc1/pRSz1u5xoTxQGizvKPWkjNjJDzYenIot2+/F/r5pYio5Q3FYZHiV6AXfS
 4hHkeKMgqe5tV6O3bInL4xOmnh6ZFt6+UUUzYpdxhFL/Dvbg/no+ZoxiAlOq03mUU1f0r4Gch7x
 7PkoM4XZNene8Vm2AcQUTxlesu1YkVtRLteTwGEklVDXm0NtEu5KBmnqO8YLFGu0QzplzXxKb5x KqbBl83c5g0ouSw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1NL_IW_h9OSGt6K4bhc6p5RA8hArk_uu
X-Authority-Analysis: v=2.4 cv=R4gz39RX c=1 sm=1 tr=0 ts=69f0b5bc cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=pABr9VbpVV2WwmlfmZwA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEyNiBTYWx0ZWRfX9mQ0b4fLNeno
 yQW0dmrHXOQOeUHmRrjyreoQQm5pU0jXAB5IplTliJJTnHy1PyIHLHappRVzLJhacFBFxjozXsi
 1HbZ205icb59huvX8LcZAjzSb7t5/fmoFdZQOQ5gpCz/sttWLwH7RP53cev0GRdpWtTGQnxwrng
 f0DfHA22IdMWvJ06GOEdOCuWgzhkYUSuyc/LR0mYpn/23q4SH9vP4rqX2/0STrQORxbbagV8f2z
 NS1n4SUBf/grQ/Hz621R6d5kbNzwvtCTRQHJVf/5mKmYWwtEd2lX1MpyIC6BJWuTA3ycozTuUCw
 L3l047leWYXVHhVZ33PnOunBKfmK8Gt0JN9X1D6JHq5G82homSFYfs299I2Gx+59hCj4h6ESo6k
 GfYJQM9DESV/jVA//7P1cjF0eGPNm3NDJ1dmeRP3i6gB3/JukUNiRkoP4zoltzDm/vJ4gwir23R
 AN0fJV+/awrXceNnfxg==
X-Proofpoint-ORIG-GUID: 1NL_IW_h9OSGt6K4bhc6p5RA8hArk_uu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_062725_067401_B0D34CEF 
X-CRM114-Status: GOOD (  18.03  )
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

Driver in probe() first iterates over child device nodes, storing the OF
node pointer but does not take the reference to it for the remaining
part of the probe where it is used.

The pointer thus could become invalid if children OF nodes are being
removed from the Devicetree, e.g. by removing OF overlay, while the
probe is being executed.  That's is highly theoretical issue, thus it
does not look like bug with any effect.

Nevertheless, make the code logically correct, so acquire the OF node
refcnt for entire lifetime of the device, since the pointer is stored in
each port state container structure.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch

Note: Not a fix, because practical impact is absolutely zero since
of_node_get is a noop.
---
 drivers/pci/controller/pci-mvebu.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
index 4d3c97b62fe0..7fb9c7393588 100644
--- a/drivers/pci/controller/pci-mvebu.c
+++ b/drivers/pci/controller/pci-mvebu.c
@@ -1236,6 +1236,11 @@ static void mvebu_pcie_port_clk_put(void *data)
 	clk_put(port->clk);
 }
 
+static void mvebu_pcie_port_of_node_put(void *data)
+{
+	of_node_put(data);
+}
+
 static int mvebu_pcie_parse_port(struct mvebu_pcie *pcie,
 	struct mvebu_pcie_port *port, struct device_node *child)
 {
@@ -1482,7 +1487,11 @@ static int mvebu_pcie_probe(struct platform_device *pdev)
 		else if (ret == 0)
 			continue;
 
-		port->dn = child;
+		port->dn = of_node_get(child);
+		ret = devm_add_action_or_reset(dev, mvebu_pcie_port_of_node_put,
+					       child);
+		if (ret)
+			return ret;
 		i++;
 	}
 	pcie->nports = i;
-- 
2.51.0


