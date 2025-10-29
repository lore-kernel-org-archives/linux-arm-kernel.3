Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6E5CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 11:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCTZOwr2cUSKWpV7LwGZiQjZBqN6lrfiwX+kWZQGXyc=; b=rf6MnJs3dEjoYAy/j8PdvXpIjA
	prZYYjxuQ/4Jz9HJ8obX+43KuakPYgANxIKswJ0DbFSHiv9sI9ujtwUrQBHEFNBtfymvp2hgJ61pa
	DiW8Ntw1S1JsocqRH3nmdze6gFac964TkPW0HeUGalgWGuU0sx/yr401jPtbybxEEzGXgaGK1wG2Y
	byAp0MtD+PMCNqDt21IUINU1h0Gi96/WgyqrVPtqVhi2ADVJwKWN/lc5tUuUXXL+hkcINtfkvzZR4
	9N7iBS4+huNIlrS/vJc+HLWLMSOD2yrHCGV3HdSzn2f9gt/s4XpE4SCrwXjOUhC2o9zwV0cA15EEu
	WKmylq+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4OI-00000000zhw-0ud9;
	Wed, 29 Oct 2025 11:30:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4OF-00000000zfQ-3B9r
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Oct 2025 11:30:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wCTZOwr2cUSKWpV7LwGZiQjZBqN6lrfiwX+kWZQGXyc=; b=nHBS4ymp1VNYtVEgGB+mpNK4zz
	FyfS78LiY06eGovsyh24+m8XfSLjHp8S8FYP1gUGssMJZ2wTQUmMIAT3Y/icjsIFWxdxFsbyNcJOl
	WJJiGwByuTo6QZkEoYxKc+g6UszILYcVHWiDh/rIjPrsMD28ixjf3gbjzlv49to9UGoon/yj6L63P
	lY8Hf8XjVMLSeJe3GdY9hXNLdMwQbWLnZVuouuJxW0FnpGBmpaVxQ7xU2d6/S8QM6i7Y94ZJEw+IN
	stQaEXxMjcfd+uHrcqh3yuYQajRZ8/dLP/JX6F1dy06KhVOFTgoQEvWmVSVbM9IpWrX4Efq9wYx7O
	6HcHPIvw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3WI-00000006a0w-0m4O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 10:35:22 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4v6A93755069
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 11:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wCTZOwr2cUSKWpV7LwGZiQjZBqN6lrfiwX+kWZQGXyc=; b=ColIfwkEu2Q+1Ppd
	FG6fABGdw9Cnbcr1yp5VTedz9cJHeTwjj+mABN+Y0zUEJ0iwQoqfAxjDV3bZ0Q8H
	n07IpwGw+mv/Dy6nwT6vhxw7qa5lkWmUfup5FUxjkR/Ew96DVc6jsm17iitG2ab2
	ZoxE9c1HoeRIZeiH/vTDve3ewFROHSg1twNvQ71ivDuWWmB/u8mwFEwCbmhOfWbm
	yNrT9hPod4sdJQUEN/MHEdfWbsUkqpURJPNrHLQbNxcV1OMoZgWLaOmY4yJrPFen
	46nrMQF/D2q/VrNEnAMcChraolbHd4oiBKkZ6FvbaV0sIC5weFpJokX5C76EtX0e
	jEUp8w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a02bgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 11:30:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-269880a7bd9so73806205ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 04:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761737438; x=1762342238; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wCTZOwr2cUSKWpV7LwGZiQjZBqN6lrfiwX+kWZQGXyc=;
        b=AvtfZ2EwAS+RBqSWIyM3r4+QbUBbFi6t7+dDaCSR5GNb02qq4AXiNBrlUx384zJ8Ez
         jIFyGLtqahSVkyXd5mlcO46MtHQtLN92D/5O94LRNhhKD4byh3PEOukZOGILbcLc/zI7
         PtyG8VefH6R5+LrUdaSPp+yEmpnAXrrOnpiBin322NyTNVNDdZkTVzUE0/X/+1WyqiOK
         Qp9i46aqGbAVgyTaaNmI4wHr06kca8/keBkPmv7SWlrWz093pqSmlm4zD99RuAZTHaVQ
         6saXfVvGI316zsMNHNOGcWucDS1okahHQQ6hFB6bQS8BeVS8F5mhUscNXygOyMvW47Ao
         P39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761737438; x=1762342238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wCTZOwr2cUSKWpV7LwGZiQjZBqN6lrfiwX+kWZQGXyc=;
        b=PFZtEh/dCz+5U9swchfYC5H5ga5wskygYw4PS9sAsr2FwISe0AL5L+9U4WWxdqS19x
         JPB2SttAe4WfLzStc9NKc/FiJe4njUdTW8569DWLb9bmBQLZpBH4n2f1lMAY/ilvslLp
         bv7BOqaI5uWkBLLGlJQRQHpUnORuGGMoKwev9+TD3fLu0IHQl/1KcjxhmHADQ9wTAKnL
         NQVo4zb0tMlLb+gGOTj5+PDEWM/9elPltpIGN9FpJJN8U94iDNTECOt92k4jQWpbxzd/
         olq7vt7/vyzwR2ZjlGvtvVAH0LmaJQ+JMR/ZlAx9gzj4trVytaoEKYhLyYhJWrtwb/pQ
         i2mQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9E9v2OuCWwyuymNXO6EypHHJ6AmQ7DV2GX9FGN0BEFOpbpXbaW+45m1wjI2uJ1Y4j3qUtNpQh9ZjrRT94DK2G@lists.infradead.org
X-Gm-Message-State: AOJu0YzmYEtdGjSp3NKH4XDaOrXDK7DUEP5+8mnehtDeUteuqg4+vKsy
	sBZfPkztdiHh/dJLVGkAJ0CyjzFbqs+xqjunb2lVsYiknvBxfCwQfob9FmvW2ZEKw+Z5lqbg1kG
	+K6r7AFdMe/+M+3C2Uuz34WiGmvp8Eu/wf8Si7QbF2EwB1TA6WJoARb73tUyw33Ux5EOStHlIcy
	qq5Q==
X-Gm-Gg: ASbGncvNfA8MjZ1Whal3Rc9TOxHC4IbangBL2eZX0/mOzEWrpNQmtWvC7+WOjIXvygb
	WoigH0nxUfLJxKd33WGhrK3oX907XeS/7cp/+3ZjfEh3H8sMZO2iFK6bSfh2XpZpNsTKTrOJmPI
	hywufhZgu6vKC+ukzpqftvhokmp5MQaG3VF28VLV9DKgFferWZpBNqYJdFE/62MlVAVst0nybtY
	jkFbEU0ZcBV509Ul4iAx/ouC7H8f8FaAez6tAgra4YlLq1M5/G6CQECV9CeBs0WrDJeXEQqXGr5
	ie2Azss8IRZSAbIA397p6LrtbVbaEEiYdjBNm/LQJjICCDkJJs0r9z7WfkpmU/KjbgRyOcrFOjK
	eAixucSZqb3VhcVXa1BdqkXQdstL+g4N3DA==
X-Received: by 2002:a17:902:f610:b0:24c:965a:f94d with SMTP id d9443c01a7336-294deee4d1cmr30236155ad.46.1761737437755;
        Wed, 29 Oct 2025 04:30:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg2rhwEuCCYf5gyZ7/UlduGCKTgH7m45SVj3izWoOaQv88Us2VqzTA5ZMHvZHROpfGtq7z4g==
X-Received: by 2002:a17:902:f610:b0:24c:965a:f94d with SMTP id d9443c01a7336-294deee4d1cmr30235485ad.46.1761737437104;
        Wed, 29 Oct 2025 04:30:37 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d429c6sm152154935ad.85.2025.10.29.04.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:30:36 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 16:59:58 +0530
Subject: [PATCH v7 5/8] PCI: dwc: Implement .assert_perst() hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-qps615_v4_1-v7-5-68426de5844a@oss.qualcomm.com>
References: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
In-Reply-To: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761737398; l=1708;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=9K/ld67bZDtw+m6f/+xoehEOm9YcU7EXoGsXpXOCEkU=;
 b=uB04FAqsEwXevtvjMHJajgLBMhaKPIHodRX+Jhi5X2SfE/FVlaqw6ySrvVsTLK8jD1Rh0zXwM
 RgGanaEuvGzBBOAzrGtaAdjqhaIFOmK8zscP3MLvhou+4+VPNTNMsy4
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA4NSBTYWx0ZWRfXx/zU05ojSCL1
 FZDfTAKflcfgsJmdgv/3bHIRcOamsn/GS9XRgJ72YUZ3+V8eEUlxuibBSRoLSeZKpvIigddWP9I
 mWKqgbvgDgRYJ/2TL4IiU8GEUUJnALAI11//ijh38Of2BVJKryb5V5GmAie9J0xdKsnbW3i1Mi1
 L7Cs5XN6d3e8GJVAok4Boit5zFHn2eydXxulfkn+ApwRPWcvDWB9DoZlSXBVWTUQkkz4/ltNpAe
 fv5ZXeOjVGye5J4p2ptRZzZRuSt1N0rmx+oRLz0z9MOHsOtZ0HAYQrIJlP8xMs32w0EkEStANEa
 kGzyeQcAPqGlmjQccsiuAgBEMW2FWYQig4Np4UkUvWKxIq8xVjh3iei+/w2ou7K8ppiXEoUugb+
 jdxf0aI+IQxalQ4IZh7zGm7sWUUR9A==
X-Proofpoint-GUID: ZW45z2l4cEFjVzABj2dhGSoqNlN9GRWk
X-Proofpoint-ORIG-GUID: ZW45z2l4cEFjVzABj2dhGSoqNlN9GRWk
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=6901fadf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=dSOQ3hK3KXaY1HoqDbQA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_05,2025-10-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_103517_457481_03779E23 
X-CRM114-Status: GOOD (  12.62  )
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

Implement assert_perst() function op for dwc drivers.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index e92513c5bda51bde3a7157033ddbd73afa370d78..a209701e8037039191fb6c61b83978d8f561f7a7 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -856,16 +856,35 @@ static void __iomem *dw_pcie_ecam_conf_map_bus(struct pci_bus *bus, unsigned int
 	return pci->dbi_base + where;
 }
 
+static int dw_pcie_op_assert_perst(struct pci_bus *bus, bool assert)
+{
+	struct dw_pcie_rp *pp = bus->sysdata;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+
+	return dw_pcie_assert_perst(pci, assert);
+}
+
+static int dw_pcie_ecam_op_assert_perst(struct pci_bus *bus, bool assert)
+{
+	struct pci_config_window *cfg = bus->sysdata;
+	struct dw_pcie_rp *pp = cfg->priv;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+
+	return dw_pcie_assert_perst(pci, assert);
+}
+
 static struct pci_ops dw_pcie_ops = {
 	.map_bus = dw_pcie_own_conf_map_bus,
 	.read = pci_generic_config_read,
 	.write = pci_generic_config_write,
+	.assert_perst = dw_pcie_op_assert_perst,
 };
 
 static struct pci_ops dw_pcie_ecam_ops = {
 	.map_bus = dw_pcie_ecam_conf_map_bus,
 	.read = pci_generic_config_read,
 	.write = pci_generic_config_write,
+	.assert_perst = dw_pcie_ecam_op_assert_perst,
 };
 
 static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)

-- 
2.34.1


