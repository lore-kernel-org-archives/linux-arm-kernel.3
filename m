Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D831C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYoFfKuu5GFLrCOXiIOOxFQX14nlPMmQHH5fe4JzCMU=; b=0t6Bna+IxHxzNKD29QdC1XiEVY
	drY4nbZUJMsrM2PxH4bW8aL1p+VwhUuWkh8WnssdCHBmX0qjm/DIdTXotA/w/K2lq850ZLtKR71R5
	uu7hq4XH7pr7eQycqVSJO7yMUJpEjR8CpC31zqY2LQhi8+JCNayRgmhKAtYiCJBNHU/INIXKeY1Sf
	hC1/zkH3UJUB0OF/7QdP3uhtdcW8CqZB7FDo+rp2qg7TEQjzUvJ9e164BJPjJs7PqemNckNQi32Ek
	YdOHftm8BiKchW8ECx74WLu8Z/10I0HJrb8XVhulxI/PrTVVLQTPceLD+DemFXM16Hc6rLI5C79lN
	WguKH+zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgM5-00000002Qan-10Cw;
	Thu, 28 Aug 2025 17:24:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbSg-00000001T4v-38KE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 12:10:39 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SBLcKM029964
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 12:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LYoFfKuu5GFLrCOXiIOOxFQX14nlPMmQHH5fe4JzCMU=; b=lt9sX4dGkNtDFFDt
	bAT2gpDdQNq6TYuLT1r45kOPejvUIoSVzMg7QHW3xNAXnYaww37MCIAWVtehpAjp
	sTRe3JjCwDyRmK5UWLQqmBTRqIdg7/fsYpr3BrKklghJGXWnnYhOFarWW5V63F2/
	hZiPzoYfeS8gZ9e4HYAqyRTh+cG6zfvU5jcFDk7gEFJOt9KqluC+DFxKIMMfvYXB
	jgfUqVX43GlHoFRF99H7ZsBA9o7v6Mn4w2FvAzJwSbgX2wcUAWVfP1zyJ47EIRJ1
	toXt9JaMHM+8Pa1vArSvZhCNPFtOJ1HeurTzNhBesRMg1BHv28mrwtSYuzTEDUuO
	uC6zcQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tp5k03tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 12:10:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-327b289e8easo611681a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 05:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756383037; x=1756987837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYoFfKuu5GFLrCOXiIOOxFQX14nlPMmQHH5fe4JzCMU=;
        b=TUI9TWI5EVoXh93/yrtdKyIovFqeH+IMJ9jtwYwh0A8X5zjHgLb/2Zoqmh171g1+H0
         Jqu8LvTF65aLl/v5cw/w5w9CFjICsoXmPbo7pzOzqf3+UKLNKVG4ByiWNDpKwvE145Q4
         qsEzn0XxxgBwQMH3mVkGI1eyQ7po8RwoRrcNzFkw/hWiOvlGemQhTJ9u/pGjSfbRsnL1
         mYoI1LZVo2umLq/HKe4IKDf8XAU/HLxoBA2SdFyVkEYSGDH/hIBpMs9wZob5bA9OaFh+
         F6hGJzfTIMHbKxakJMiQY0B0u7raDPQyLU1h0eUrPkPTQdHjJys0+AdD3eLkbp5s4eDk
         QV1w==
X-Forwarded-Encrypted: i=1; AJvYcCVHf+MIp9MQOeRG7RZZat/RnPoSgeNjdblqc05LoX4Wz2B6tKmftr+WCeRQqwztUb5DRZ9a5eGUS0tXjYs4njY7@lists.infradead.org
X-Gm-Message-State: AOJu0Yxju0ruMguBKOpVpX8wkFYjiNqXQ7buLNEgpjidrdspxQRwl4d+
	ZmELgYUa+bt8e6cA290i55l2aZIq6SnZXtpWxiMZP3pWxdUibSsa5tg87gHBX61qOzh584mvQAZ
	JlLd7JKbJR03aoA73YIyLRi5kJeEIXw0g3JQJJFJ2zWzRtXSkIHjZuWjHN3M3JaaZLiFSF5+RC3
	/2WA==
X-Gm-Gg: ASbGncuCKP0mXb6cOUaGtz5lvOGBlVBslDqJANSn7v5lgA16RQIbtf/iueF6H1xEzKi
	U0+Fs6MUYMbN7WzOk06RmlJDSuIu1/FM2iJYKARf7b+uV+YrL26JE5alVNg52h0sGdBn/zpwc3W
	FueLi+TR1mFNqrn/t+6Y0RM7NC9ekEGXeLLxbx2jm84MAq8iFWJKPkEsQNjldSzNbbXvEGxd9xZ
	VXp5vqUgBjJNz2VcTpup+BaEeuru87uaLmKf1XzArAirYekjRNrTsicr6zXEgggry9bzrWQReyg
	WuQ2dYvfQr8ueACvZIJSBuNGpRWd4YyMVxrUKYhIVF0uYnFz+iX56pOKAdKq4zOauENoUw2Hnes
	=
X-Received: by 2002:a17:90b:4e87:b0:327:734a:ae8c with SMTP id 98e67ed59e1d1-327734aafacmr7013842a91.10.1756383037391;
        Thu, 28 Aug 2025 05:10:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvAJvJ+Agf+PXn5CDP3LOj/cLF51Uz0w7Smptbs5rUVIF/mhglzzjjGvG7lqCA625p35ue/w==
X-Received: by 2002:a17:90b:4e87:b0:327:734a:ae8c with SMTP id 98e67ed59e1d1-327734aafacmr7013775a91.10.1756383036835;
        Thu, 28 Aug 2025 05:10:36 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32741503367sm4019070a91.0.2025.08.28.05.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:10:36 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 17:39:02 +0530
Subject: [PATCH v6 5/9] PCI: dwc: Implement .start_link(), .stop_link()
 hooks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-qps615_v4_1-v6-5-985f90a7dd03@oss.qualcomm.com>
References: <20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com>
In-Reply-To: <20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756382994; l=1453;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=pMaklKWqapFpWdv+7J9AHF7Bw2YdzTcWihkps7qIAps=;
 b=6REL8f9VVvl4nfDJ8zLlXrHgnb2S/Rf6iqrVR2o5YAG8A93MtB3RAwJqcuaLM93mtbPWR3N0x
 i71jT6xKGP/Dnp9bpetEtz+EkkFCrvEOUi3Mq3IW8O1v/t1TpZjF+OI
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=V9F90fni c=1 sm=1 tr=0 ts=68b0473e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=4bBsNf6MAaYI6lVPmewA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDA5NSBTYWx0ZWRfX13nGmnG3gjyL
 4R1MDy5oJ78wc3s2cjZVr7sBaL18NzabAS/DZA2KqCFprR6Clo4olzKW+Pz0ivsHIxUJUrJtvpU
 xFoONcQg1iYqVaWYv93oKf3vyrZLnaTrnMD/SWb5agdaHOVT1dTLD6S04fiLBuEP1dEpaTrKCS5
 yUuk8qnMV3uYGpnxGiZP3BNXa/Ng97YYk4DJcTO8ntTwe7lXpVd4Z7AKD3Phuy1HmFLfNGmR8yG
 Zx2c/5CtGF6/BpxXWIV4JOK40UubD7xIhFI5ZhYFaYTp0j9L6YNgRJkmaVRC6KWHIkJtDtm6DbZ
 C1xddKFCco1YHttx6HMNsN3z+HBK9ufDD7v7A5ZQPUZ2l1dagSneIgSR0T9pYlPczy48fGyv1qW
 308YyCsY
X-Proofpoint-ORIG-GUID: -GLMJ1YqIieO8ParpgyDErNqFuu8GeEb
X-Proofpoint-GUID: -GLMJ1YqIieO8ParpgyDErNqFuu8GeEb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0
 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508280095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_051038_791911_E74E6883 
X-CRM114-Status: GOOD (  12.99  )
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

Implement stop_link() and  start_link() function op for dwc drivers.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 952f8594b501254d2b2de5d5e056e16d2aa8d4b7..bcdc4a0e4b4747f2d62e1b67bc1aeda16e35acdd 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -722,10 +722,28 @@ void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
 }
 EXPORT_SYMBOL_GPL(dw_pcie_own_conf_map_bus);
 
+static int dw_pcie_op_start_link(struct pci_bus *bus)
+{
+	struct dw_pcie_rp *pp = bus->sysdata;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+
+	return dw_pcie_host_start_link(pci);
+}
+
+static void dw_pcie_op_stop_link(struct pci_bus *bus)
+{
+	struct dw_pcie_rp *pp = bus->sysdata;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+
+	dw_pcie_host_stop_link(pci);
+}
+
 static struct pci_ops dw_pcie_ops = {
 	.map_bus = dw_pcie_own_conf_map_bus,
 	.read = pci_generic_config_read,
 	.write = pci_generic_config_write,
+	.start_link = dw_pcie_op_start_link,
+	.stop_link = dw_pcie_op_stop_link,
 };
 
 static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)

-- 
2.34.1


