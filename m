Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36317CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 06:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DP7hy6R/ajCWGii9N1NQ8UzWBIex0rIJ0tD9YQPKZFA=; b=iz8OIXugvfR2kGx+CAGr8HcGTb
	RespkL/jf0gGRY7ld84D0X4UnNu1KtxxhqmcKTisl6NAJJTEFO+KayjY5aosjR8FrPUHoWafYOIQX
	7HmRIQbBdgV2oWCnZAtzkTh6zyaw4/pyjP2t/eh5cVz2jRO8pSQZfmrsBs692REx7o441d/xOVnYX
	qqkT9wf7+nHxkQ35wzbtTjc0wmK7xoOpSZUrT6lxjCd25KRV4eJ5b5jXuxaymwmbjkyMuWK8330nf
	G0VRsXFFHpeXyl2Yb0yhSTBrvvl2FBTfb5Le/96Fstw3R6SAobfN87yWSc8LkYlN1auo5WZ+tK+pQ
	lFod6BhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Bmi-0000000CLPC-0EjG;
	Mon, 13 Oct 2025 06:11:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Bmf-0000000CLN7-32uc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 06:11:51 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2oQfk012872
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 06:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DP7hy6R/ajCWGii9N1NQ8UzWBIex0rIJ0tD9YQPKZFA=; b=GskPnNZctdjaf7O6
	CU7yKrlDhK4t8qe9JsL08HYWeQDTrKu6kiK18Cn21sNVz0hpcq01Yk02lGksA1cS
	621TwTl8hdqXxsZ2uSgP4qvR39zRrDJG1SQF4P8KjCj1dbaewZ47mROfXf0qve1D
	u0N2wiPdtDwOL813+U24ME/v5gEjA/29TzeGD4UkUJ4Xnh+ejpmLWRWBQcejyfMP
	AXXJYWtQmYV5Z1ijY0B5z4DyWrKR/geEyf9aqz/IjvD8zMiGbZXE963IwjxzNsx+
	2AyEpcVI+3eFVsMPksQSVs4xGGWsY8eskIkjU+cI+2XlsVoCf6AWQq4jQqaYZ+oA
	OIdqrw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0buck3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 06:11:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-272b7bdf41fso92152915ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 23:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760335908; x=1760940708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DP7hy6R/ajCWGii9N1NQ8UzWBIex0rIJ0tD9YQPKZFA=;
        b=PAotaivv50GjOKkrtAKEcIck1TC9ZgGPuhXNqIlxIMmPtFgRJk1TEqJaXtUfafMpy4
         vmjd3IzV8HyFBq/qwLrB7RZytuAiNJzlVIG/u2KhAtxGmXk5JuW5BOW7dNCC08CaxUqh
         kqzUdLfNFTi0OAQBcHEAZydqSOOrpEg8IyYrlK6vlMCmUZy4wfow01DtT2Y7V4RHi54d
         nzNaTWS6oBqD+Ndt5ug4tIgcI5HMy27Oikyuo5r+55Y5ds3aewTWeSEcvDHP89GRrCR3
         0uB6EMjOdlRl3n02uejzSUxXo+G7V5IN8Lc+kcb3/ZStHQ//K6ZI1JdwSMCoRqQjwgCX
         SPsg==
X-Forwarded-Encrypted: i=1; AJvYcCUwY2VfMgvwzRkzvnDdeNweiH5KZObYFaHtF13vbtDKpUlqa2m0juFTbqvQ+UdEfNjldqS7Xr9rQ5OKPSHaGSpV@lists.infradead.org
X-Gm-Message-State: AOJu0YyepJsqERDCEdvG5pGMOWyCFlk9xOgij/JWQCpVuC3DhQZL58Th
	DTOconfalTs8yXK6n1nMr0AXsAxzwWEBQ2B0oIoiPNPmb5t6wCBxLkc2JEp/orHW6JsfLpCfdNk
	MFjAkHf9A/MH4DrFosNg8a47eAravByoH5glSNCAnS241RNY5ZQB5LorPpODhG455PYXXfflu4K
	IaUQ==
X-Gm-Gg: ASbGncsEbZM+IOnSW1iDdTM1/bNBFcjQR0mZdsRAW6Ep2Jm6EmX8X353fTF3i9mO/Bs
	cdYlHgAKtOQRvctqXPrG/BIJ9+DsqwkVh5OQsDwN8j7iaOB0gjW8k6B7QwO26iZiDy8E5nHtrmU
	Iai0Z0qxOGWtQ106uoWI47k7RSrv3Uq/VuzFgY0ytaR4OGaFqEOnndMKKL95NrwZRkrcXFyQkWy
	RwMDFFw9x4+R9WZ1zT2QP9BLmqzOnb7bdNItepB7Z+8PtCakhv0YYWpYh8GqWoPPskLjgFAv8v/
	bGmhen/4kukmaTqZC7SVrVJO6b9SaDTAo1opWc4DZ9cpNKqRWRPatZVoXwz7zAWWFog53XjUeEj
	eyntDmzqIDSRNzvTU6nUOQ/8xEFU=
X-Received: by 2002:a17:903:2c03:b0:24c:d6c6:c656 with SMTP id d9443c01a7336-290272135a1mr212187165ad.4.1760335908076;
        Sun, 12 Oct 2025 23:11:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY6acNW15tVg29tgNuFQ2MXt4pYANG2HEWYSImxUA3M6Pr6uqlTS+XBatwLXw062GF+q0KPQ==
X-Received: by 2002:a17:903:2c03:b0:24c:d6c6:c656 with SMTP id d9443c01a7336-290272135a1mr212186945ad.4.1760335907608;
        Sun, 12 Oct 2025 23:11:47 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2904f61a1desm64388675ad.82.2025.10.12.23.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 23:11:47 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 14:11:17 +0800
Subject: [PATCH v3 2/3] coresight: tpdm: add static tpdm support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-add-static-tpdm-support-v3-2-a720b73e83db@oss.qualcomm.com>
References: <20251013-add-static-tpdm-support-v3-0-a720b73e83db@oss.qualcomm.com>
In-Reply-To: <20251013-add-static-tpdm-support-v3-0-a720b73e83db@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760335892; l=8786;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=v23xmem2Bt+Tgm+51X3S8Idk7oSeK94L/FuNsCG9NiI=;
 b=yfr4C8+me/BPW2PCtcSD7ksxh4HEiJxv1Pr2Gx7Lpmn0NzjOA8LDrDmj/vCnXmzJQLxD6dBLc
 Xqf+4eHZSf4DlOf+BrdHhJ9bpgJbdnbMdCmRsj9tcQ03IRoj1BaUTqn
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: FRDqXmt8f0VhZbPPk4jlqqjVAZ3H8_he
X-Proofpoint-ORIG-GUID: FRDqXmt8f0VhZbPPk4jlqqjVAZ3H8_he
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ec9825 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=_wMi7B_O7ukW3LTXVV0A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfXyyzEsiroaB/W
 aIJs6m9uZ1A1+yp6/Hf+5HokURIDrjkSwidW4QJ3rfujaf4PfuXl+PDb5jtKH0FeOZHrSZh4jB6
 nJYtCsw9avVbbnlFjcNz9h8v/0r2BUApwUswgr6DOGzbbjNUp10AZLf+oUNJjjLZVpCY81/h8Iv
 sEVJnmRa5THZRx4AW9Qlivd4nMp3/76roX0kau+TSrVtzXb29vIdlu37P8NLWpdNTs3ssg263V4
 HxaivhfiSFraO/suT0t88dgWjhOAjC14TrkTBp1R6hXynSGJl2bZIp9M8Jxg+uMpAx59VDOg5a3
 Q4iu//6ok3ZHCO74aVfuoaUeF6cpUtB7kMwAwz0Tz2S6eSy5oGU/hz7FDsCczCUeMjyVhQQtJab
 /IpVmDljgh5MvBSZOjAON5fqWCL0Kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_231149_805297_0DF05B26 
X-CRM114-Status: GOOD (  28.20  )
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

The static TPDM function as a dummy source, however, it is essential
to enable the port connected to the TPDA and configure the element size.
Without this, the TPDA cannot correctly receive trace data from the
static TPDM. Since the static TPDM does not require MMIO mapping to
access its registers, a clock controller is not mandatory for its
operation.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tpda.c |   9 ++
 drivers/hwtracing/coresight/coresight-tpdm.c | 148 +++++++++++++++++++++------
 drivers/hwtracing/coresight/coresight-tpdm.h |   8 ++
 3 files changed, 131 insertions(+), 34 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 333b3cb23685..4e93fa5bace4 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -68,6 +68,15 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
 	int rc = -EINVAL;
 	struct tpdm_drvdata *tpdm_data = dev_get_drvdata(csdev->dev.parent);
 
+	if (coresight_is_static_tpdm(csdev)) {
+		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
+					      "qcom,dsb-element-bits", &drvdata->dsb_esize);
+		rc &= fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
+					       "qcom,cmb-element-bits", &drvdata->cmb_esize);
+
+		goto out;
+	}
+
 	if (tpdm_data->dsb) {
 		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
 				"qcom,dsb-element-bits", &drvdata->dsb_esize);
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 7214e65097ec..1766b0182819 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -495,7 +495,9 @@ static int tpdm_enable(struct coresight_device *csdev, struct perf_event *event,
 		return -EBUSY;
 	}
 
-	__tpdm_enable(drvdata);
+	if (!coresight_is_static_tpdm(csdev))
+		__tpdm_enable(drvdata);
+
 	drvdata->enable = true;
 	spin_unlock(&drvdata->spinlock);
 
@@ -551,7 +553,9 @@ static void tpdm_disable(struct coresight_device *csdev,
 		return;
 	}
 
-	__tpdm_disable(drvdata);
+	if (!coresight_is_static_tpdm(csdev))
+		__tpdm_disable(drvdata);
+
 	coresight_set_mode(csdev, CS_MODE_DISABLED);
 	drvdata->enable = false;
 	spin_unlock(&drvdata->spinlock);
@@ -1342,10 +1346,9 @@ static const struct attribute_group *tpdm_attr_grps[] = {
 	NULL,
 };
 
-static int tpdm_probe(struct amba_device *adev, const struct amba_id *id)
+static int tpdm_probe(struct device *dev, struct resource *res)
 {
 	void __iomem *base;
-	struct device *dev = &adev->dev;
 	struct coresight_platform_data *pdata;
 	struct tpdm_drvdata *drvdata;
 	struct coresight_desc desc = { 0 };
@@ -1354,32 +1357,33 @@ static int tpdm_probe(struct amba_device *adev, const struct amba_id *id)
 	pdata = coresight_get_platform_data(dev);
 	if (IS_ERR(pdata))
 		return PTR_ERR(pdata);
-	adev->dev.platform_data = pdata;
+	dev->platform_data = pdata;
 
 	/* driver data*/
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
-	drvdata->dev = &adev->dev;
+	drvdata->dev = dev;
 	dev_set_drvdata(dev, drvdata);
 
-	base = devm_ioremap_resource(dev, &adev->res);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	if (res) {
+		base = devm_ioremap_resource(dev, res);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
 
-	drvdata->base = base;
+		drvdata->base = base;
+		ret = tpdm_datasets_setup(drvdata);
+		if (ret)
+			return ret;
 
-	ret = tpdm_datasets_setup(drvdata);
-	if (ret)
-		return ret;
+		if (drvdata && tpdm_has_dsb_dataset(drvdata))
+			of_property_read_u32(drvdata->dev->of_node,
+					     "qcom,dsb-msrs-num", &drvdata->dsb_msr_num);
 
-	if (drvdata && tpdm_has_dsb_dataset(drvdata))
-		of_property_read_u32(drvdata->dev->of_node,
-			   "qcom,dsb-msrs-num", &drvdata->dsb_msr_num);
-
-	if (drvdata && tpdm_has_cmb_dataset(drvdata))
-		of_property_read_u32(drvdata->dev->of_node,
-			   "qcom,cmb-msrs-num", &drvdata->cmb_msr_num);
+		if (drvdata && tpdm_has_cmb_dataset(drvdata))
+			of_property_read_u32(drvdata->dev->of_node,
+					     "qcom,cmb-msrs-num", &drvdata->cmb_msr_num);
+	}
 
 	/* Set up coresight component description */
 	desc.name = coresight_alloc_device_name(&tpdm_devs, dev);
@@ -1388,34 +1392,51 @@ static int tpdm_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.type = CORESIGHT_DEV_TYPE_SOURCE;
 	desc.subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_TPDM;
 	desc.ops = &tpdm_cs_ops;
-	desc.pdata = adev->dev.platform_data;
-	desc.dev = &adev->dev;
+	desc.pdata = dev->platform_data;
+	desc.dev = dev;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
-	desc.groups = tpdm_attr_grps;
+	if (res)
+		desc.groups = tpdm_attr_grps;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
 
 	spin_lock_init(&drvdata->spinlock);
 
-	/* Decrease pm refcount when probe is done.*/
-	pm_runtime_put(&adev->dev);
-
 	return 0;
 }
 
-static void tpdm_remove(struct amba_device *adev)
+static int tpdm_remove(struct device *dev)
 {
-	struct tpdm_drvdata *drvdata = dev_get_drvdata(&adev->dev);
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev);
 
 	coresight_unregister(drvdata->csdev);
+
+	return 0;
+}
+
+static int dynamic_tpdm_probe(struct amba_device *adev,
+			      const struct amba_id *id)
+{
+	int ret;
+
+	ret = tpdm_probe(&adev->dev, &adev->res);
+	if (!ret)
+		pm_runtime_put(&adev->dev);
+
+	return ret;
+}
+
+static void dynamic_tpdm_remove(struct amba_device *adev)
+{
+	tpdm_remove(&adev->dev);
 }
 
 /*
  * Different TPDM has different periph id.
  * The difference is 0-7 bits' value. So ignore 0-7 bits.
  */
-static const struct amba_id tpdm_ids[] = {
+static const struct amba_id dynamic_tpdm_ids[] = {
 	{
 		.id	= 0x001f0e00,
 		.mask	= 0x00ffff00,
@@ -1423,17 +1444,76 @@ static const struct amba_id tpdm_ids[] = {
 	{ 0, 0, NULL },
 };
 
-static struct amba_driver tpdm_driver = {
+MODULE_DEVICE_TABLE(amba, dynamic_tpdm_ids);
+
+static struct amba_driver dynamic_tpdm_driver = {
 	.drv = {
 		.name   = "coresight-tpdm",
 		.suppress_bind_attrs = true,
 	},
-	.probe          = tpdm_probe,
-	.id_table	= tpdm_ids,
-	.remove		= tpdm_remove,
+	.probe          = dynamic_tpdm_probe,
+	.id_table	= dynamic_tpdm_ids,
+	.remove		= dynamic_tpdm_remove,
 };
 
-module_amba_driver(tpdm_driver);
+static int tpdm_platform_probe(struct platform_device *pdev)
+{
+	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	int ret;
+
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
+	ret = tpdm_probe(&pdev->dev, res);
+	pm_runtime_put(&pdev->dev);
+	if (ret)
+		pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static void tpdm_platform_remove(struct platform_device *pdev)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
+
+	if (WARN_ON(!drvdata))
+		return;
+
+	tpdm_remove(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+}
+
+static const struct of_device_id static_tpdm_match[] = {
+	{.compatible = "qcom,coresight-static-tpdm"},
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, static_tpdm_match);
+
+static struct platform_driver static_tpdm_driver = {
+	.probe		= tpdm_platform_probe,
+	.remove		= tpdm_platform_remove,
+	.driver		= {
+		.name	= "coresight-static-tpdm",
+		.of_match_table = static_tpdm_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+static int __init tpdm_init(void)
+{
+	return coresight_init_driver("tpdm", &dynamic_tpdm_driver, &static_tpdm_driver,
+				     THIS_MODULE);
+}
+
+static void __exit tpdm_exit(void)
+{
+	coresight_remove_driver(&dynamic_tpdm_driver, &static_tpdm_driver);
+}
+
+module_init(tpdm_init);
+module_exit(tpdm_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Trace, Profiling & Diagnostic Monitor driver");
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
index b11754389734..9f52c88ce5c1 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.h
+++ b/drivers/hwtracing/coresight/coresight-tpdm.h
@@ -343,4 +343,12 @@ struct tpdm_dataset_attribute {
 	enum dataset_mem mem;
 	u32 idx;
 };
+
+static inline bool coresight_is_static_tpdm(struct coresight_device *csdev)
+{
+	struct device_node *node = csdev->dev.parent->of_node;
+
+	return (csdev &&
+		of_device_is_compatible(node, "qcom,coresight-static-tpdm"));
+}
 #endif  /* _CORESIGHT_CORESIGHT_TPDM_H */

-- 
2.34.1


