Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF2ECA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ed6L8eMIvW0AbHtn3XR+t7FYjsouaycVZOPUWpXRCik=; b=uPFO3NtwQIDhQbwaRGt24HXMh2
	D37XnIcj35sZFFYJl9vizcGv9CpFAt66mlgk3scIYg6ljGLsRCdYlUxCwl/IgOXM+LYeX6bqHKlQm
	ZiL3LKP5hV++0ppk+3ERUyJ4IKXx1Vg6caaypSB1SfAAlpuDbL598S+My0Q3js5xG2kHMwhxc+o6a
	WYTN9GtQn+23zqGKxe1cnFhl1hZww+URrRPxPl+sSvAH6iT92dE5+putV5WUiuL9z3l9293/VSTjp
	pVkoDX8OQ08kufQtW8jkG+2bopJ1uLeKNshWGOj9VMSMufCg7bHlCfX6smBcOWFRiIdyGF6Eg/XgR
	RVrAeJWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgM4-00000002QZS-1oVu;
	Thu, 28 Aug 2025 17:24:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbSZ-00000001T2c-3Tou
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 12:10:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SAE6Wx007255
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 12:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ed6L8eMIvW0AbHtn3XR+t7FYjsouaycVZOPUWpXRCik=; b=X6SlWyIht6MY+2gP
	qkxTu5ixJm3zsW11mJocaFzzjYBQdC+f/n27GVbArjDiLhkqOKQdYSO4a/Jmjdfw
	OODYV/YUs2rVylt1xpCErJEtfCa0pjBtsGlxh0QQ+Q448Une9VaKo2zaUW2r8ZM/
	cR4aOZyuv6NJXhGSBQ7ZOW3tPpcnTfrTP2VZDjv9HSFnCsZtQ38ZUp9FSGGUyqXv
	EYQvKLvK+MZTET2y6J+cC7ImGdCHCHCOMlvpawYyol/FJvcrmMY7tRS+ZjrpszBe
	eVptmnBLGpTj9i7XlQJIj5YcxOaCf5uILR2aZCwXz4lqKWTYXM78ikmMqy+0OwS+
	olqXTQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tn67ga3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 12:10:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b49de40e845so720214a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 05:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756383030; x=1756987830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ed6L8eMIvW0AbHtn3XR+t7FYjsouaycVZOPUWpXRCik=;
        b=MP1RxSG6OZDNzIjdp7P1AIkC6yyur3qXRgxRWVxJqOX45temq0xogJ3D80p/o+UCT3
         dCLwQwp8uhNj3uVIroLYqS/mWdF+BPQdE7nXMxD+jviIududKhzQgrh3tI8QfJ0QYvhW
         SBqxvagiT3bClA4E+OSnoZqChgZICpyPIRJkUL/rbk+gerhyXJEGHhAEtyigtckM9mb3
         7/ofqrvM8r9H2WxWbH/u5F5jrso2mB5CmRMuCetjwbHScL9/6DAs/9cp81hDZU9jb5Fy
         61oEw3ItlAgwbc0YPfUJjlfiq/1+ZgwZtruljWai8qGjcDCN9KNTvywUjkLjwJ1FJz9T
         RozQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw9Ku0pvoifmKznL9XPO0KJ+IrbZjrqQ/mN0eAQWfTK1SmrshQSa3vYT/8rBdpdBpSUfeUhxs8iQ7aLxy/PoAl@lists.infradead.org
X-Gm-Message-State: AOJu0YyLp85kg526iVrCM8guf913r28HQfnx42fF+Y9g44tkjE0b/PMB
	kaA6DpCrSHo46Hex6BI4sAII15hmTL9wQBJOsUoUfV+kic7hhot7/zUu14gLPsLqDF4RyKmXv0L
	7Oa8EwC2072Ag0ijhxbm8YTezSxuiHhKF1GALx0VotBjm+n1p9RcqJbZp/dbooEk4xX6SZ7OOTU
	fXKg==
X-Gm-Gg: ASbGncuA6tnkxc+aihfWBktdjB2sJEKD6ewFKeZdkQ7QkfccGqbgCmHEYM8L/pa+5of
	rldDFkHFfRquOEwg4Yqlv2UX9DG2tMNY0QGY1WKRGNGd0NeuZI50NDvrIw+QDiUaXDD5/ll/2kQ
	k6avMm7D+jIJgg07SR8JNzcJmQy3wtAkzpbaI8ts5qaBieHXJlj/x/l/IBLjkhz7H9MmvAPiJse
	HE0z7WFGOwlHICscPM2MwJfGh2iiFO5pg006DSJsWPNhlNyyNS8poIM5gshw0nLPOR3zUX8Gt2Q
	78E7EjZlIbs+pAs0fj72VnCtEh13EJ/ZTjm8XvOpqyYCJECI2cUor7BY4pWR250rNzYlPWRQvQ0
	=
X-Received: by 2002:a17:90b:1f85:b0:327:c0c6:8829 with SMTP id 98e67ed59e1d1-327c0c68a2emr1602898a91.24.1756383030483;
        Thu, 28 Aug 2025 05:10:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLqn7GbKDipnvW7wO7xyl/z3nxMSZZtjcarpD2Fv56UXUJZ4TTQws5DQWp7lRiXQXSlA/Unw==
X-Received: by 2002:a17:90b:1f85:b0:327:c0c6:8829 with SMTP id 98e67ed59e1d1-327c0c68a2emr1602844a91.24.1756383029911;
        Thu, 28 Aug 2025 05:10:29 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32741503367sm4019070a91.0.2025.08.28.05.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:10:29 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 17:39:01 +0530
Subject: [PATCH v6 4/9] PCI: dwc: Add host_start_link() & host_start_link()
 hooks for dwc glue drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-qps615_v4_1-v6-4-985f90a7dd03@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756382994; l=1587;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=gJyZo4+y70cAtQtM0l94BcRRIWPsTYGyCPIEqvg0Um4=;
 b=m3Z83ZVY0UwHl+oGtMxjjvp8Cwj8Qi1oKlZ+0jAtkA1r8ZOAULJQJy/HJIbx09SyD/w0CwAm2
 oQLd0oEZ6nmACuGRfvCySXEqKHoqu3pc4HcgTAkcz87/6u3scmYEyk8
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDA4NSBTYWx0ZWRfX+pcEIGcKJOe8
 74kSMXUQfwEFGNz7uvEmxH+4yoA+uH7qd/y+eFqDZ2EXmOdJPjPYsqgxx1ytnOs0J6lT0+9/lLB
 ajIT2iWmdUjBvVxi2IfQpgKpgY3MX/rnETC7NbJjZjRZKeMumNq8hxkwn6UYfAAGbCE8CHQuzwU
 FWdAbv/d6SRD/d+Q7Iq3txUpaFWMTc2lBY0rYdOK6P54rlNjGpN+rF16FgxtEpSpJaDenqE/OJ7
 crEXP5rgUvPi4uWFQ3/WMET1t4ppRICIAFU/0TbsslTQszwkfCGCEHU27Wtk/Iu0M2czeIqrNTH
 Auceg4TxHgYVx+k9lAWT853q0602hkPuiT498ywcYkUtt4+ZW4TTRsPWzG6dRNQFG8Hqyh+7hg5
 AQLxtsbq
X-Proofpoint-GUID: iH1lf-GD9Jj0kbLpRk4D4IhwKSiTTYq7
X-Proofpoint-ORIG-GUID: iH1lf-GD9Jj0kbLpRk4D4IhwKSiTTYq7
X-Authority-Analysis: v=2.4 cv=P7c6hjAu c=1 sm=1 tr=0 ts=68b04737 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508280085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_051031_881366_506BC9EA 
X-CRM114-Status: GOOD (  13.38  )
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

Add host_start_link() and host_stop_link() functions to dwc glue drivers to
register with start_link() and stop_link() of pci ops, allowing for better
control over the link initialization and shutdown process.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 00f52d472dcdd794013a865ad6c4c7cc251edb48..1ed7a75501bd516ef704035a63e5edd35bd7e0bd 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -479,6 +479,8 @@ struct dw_pcie_ops {
 	enum dw_pcie_ltssm (*get_ltssm)(struct dw_pcie *pcie);
 	int	(*start_link)(struct dw_pcie *pcie);
 	void	(*stop_link)(struct dw_pcie *pcie);
+	int	(*host_start_link)(struct dw_pcie *pcie);
+	void	(*host_stop_link)(struct dw_pcie *pcie);
 };
 
 struct debugfs_info {
@@ -738,6 +740,20 @@ static inline void dw_pcie_stop_link(struct dw_pcie *pci)
 		pci->ops->stop_link(pci);
 }
 
+static inline int dw_pcie_host_start_link(struct dw_pcie *pci)
+{
+	if (pci->ops && pci->ops->host_start_link)
+		return pci->ops->host_start_link(pci);
+
+	return 0;
+}
+
+static inline void dw_pcie_host_stop_link(struct dw_pcie *pci)
+{
+	if (pci->ops && pci->ops->host_stop_link)
+		pci->ops->host_stop_link(pci);
+}
+
 static inline enum dw_pcie_ltssm dw_pcie_get_ltssm(struct dw_pcie *pci)
 {
 	u32 val;

-- 
2.34.1


