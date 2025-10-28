Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7986CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 10:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vsKdCIMSvSASYDlfsgGuMsHssqt5eihbBU78IN6eNQ=; b=RHXSEgYZGZvvo12j/uB9htSXFA
	hulTWrfy/sA1kOHznyRt+msY0rO3Pe07yL3oWFQqWbaX5Bm9nC+Lm89GAQ5JGgrPTv+B1IFiZb8qY
	KfIPoUHteLabdMpkK8KaLUh9dLAq0jAK6h8UpXquk77VQ25hmkfmY5/klzH91dSVa2RqxcmxjLy33
	797u7cXN/Hmc4Up5Vg7ac6neoxhMRi2q0fz7V7nymeK4szLKHTQ1LhohkulBp3ByVxlis1yPQREnM
	Ayrki1xjXFpjjOPLHJGUmzIRo5N+6N8i+SEDMR26D/B6hR12ns5kheyFpCaW1XN2+sGTg16jArjFB
	Ljw1Auhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDggi-0000000FivQ-0c8C;
	Tue, 28 Oct 2025 10:12:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDggb-0000000Fisn-2Z1B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 10:12:19 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S4A0X2552425
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 10:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7vsKdCIMSvSASYDlfsgGuMsHssqt5eihbBU78IN6eNQ=; b=LmOQuYM8CHkI7Sla
	/IYBUPd/E+1k+rG6zAEjt+hUOp/LTsWIweERHac2QczzdJ+ubsK+bIuvmpl2M8Yz
	MInu/dWDSpUVccD7NTzcX8s22X1cK+4wF2L1wk4c6HPLqxy/Vb/5T3GX6Qvqfwuy
	04Q/3P7rKb2hzZCmpHCXTwzTnR7HsuroR34gdVBd6vz/s2Zx9MIHFqPR1BxX/QHF
	D860Lt9EN6DbPCxfjZg2QHqJzgl7eZNojaYnTV63QOe+gVLCy3yf5m7AoseGnJm6
	XdXR9X9UAb1C40Ur6HPKYodWAfAIJWOpV+XmBlRvGvez+MOHRqCzzOpxcNmK4zoa
	wtjtnA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2pjf90qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 10:12:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-290bd7c835dso55252935ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 03:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761646336; x=1762251136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vsKdCIMSvSASYDlfsgGuMsHssqt5eihbBU78IN6eNQ=;
        b=CmTYGekwmPWgpxJOXi6BGBvBAUKk5AgbOgfmNTDV/V97ZOZXN3QhWTjcOJ5AKOEpRE
         WLY2KF4ibiaShV5fCLEFtMnQ/JcfLVFGdBvjFoZ7dKuko2zITTWwcIHAjGsgG54MgjEn
         19GyfEDzJj74jxPzD5IO8DcVmtMZQsXPIVOQUk+dbhvyW2GTWaIrHpEOxSK4XN4H1R3U
         6W9jdvERdUkgg7y2ILA+m83hCk3SmJ08tUeb2eSfiIjaBev5a+TL9OpFb6vWVlJkHodh
         XGVKPbSR/nA6FhuyHFrBF7OHEj0LLVoZi7UQQNcJXt4GwesDDJN6AWRWkRqIzc/qq9Xp
         NybQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtMD9nd4R7k4rD1WPKYi2GDzf2D4ERX8QHWoFBO57EHpGw9fmmPaLS3G2R7/HNEwyLaIyCqGIS5YKJM/lND7wf@lists.infradead.org
X-Gm-Message-State: AOJu0YyKDu1IJ+jK46YU5C/sDxroi/I5SClcmt8PCUeesJMBEgM5FHQ8
	fC4ceLkaWJ/QJ6kb5BIeUIeSKS4dFDTV67SrWGWh2qklP/e+88Ac92jPE3yF+Ntun8wh07rFMXC
	Y1ynx1K1QAcdcSLuuPSr3xARc/Ni64KeFnCf38vr5RJ1fz5w5vuU4nTpzWzIPrfyACS4gxKhi3r
	RWBA==
X-Gm-Gg: ASbGnctPad5ln2bBlJkRsy0gcYvhxbICvaYoZ2yZzez1bfsJoxR8ohsezFCC1ofLn7T
	N9nGjDfC8tKXks63o21ji9cWA8sid5TRmxJPhugtcIR59/WdDtVZ2M+Y2KK39DMj6Ftcvhgr2fu
	j5+NmXNyIPXw/m++NfUMPmyqQWdOWiyFFVF9tehX2TH4mHOww+lK8luYgGu67bslaI9WXnZEf19
	C1PRW7712r5VwP+mxWS0gWOOeuDjUJlWVRCqCiEc0zlpk8j+1E2ph9nRbw5xzxE/AOCDEgxZF0U
	zzBQ4Hv40UYqK7fKjJ2yYhJLnVfSpjOyKEMhOMT2nZGJQpWihfits0uPftnKdDEHHyNNvEpyRdk
	svgKP7UC3LPZBurepHclrwTFdUq5HRM2k2VP6qNAcHNNRqOHICTi0hJZ/TC+n3w==
X-Received: by 2002:a17:902:c943:b0:293:623:3241 with SMTP id d9443c01a7336-294cb67555cmr36725335ad.58.1761646335755;
        Tue, 28 Oct 2025 03:12:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IET+G1GfBh6CkXZDTYNyw4YCgQx2Uee56q9DVneQ5cq6QXlimc4Ow0VbC7Lp0VS2Zg/MoZqYQ==
X-Received: by 2002:a17:902:c943:b0:293:623:3241 with SMTP id d9443c01a7336-294cb67555cmr36724585ad.58.1761646334820;
        Tue, 28 Oct 2025 03:12:14 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf423esm110408755ad.19.2025.10.28.03.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 03:12:14 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 18:11:41 +0800
Subject: [PATCH v4 2/3] coresight: tpdm: add static tpdm support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-add_static_tpdm_support-v4-2-84e21b98e727@oss.qualcomm.com>
References: <20251028-add_static_tpdm_support-v4-0-84e21b98e727@oss.qualcomm.com>
In-Reply-To: <20251028-add_static_tpdm_support-v4-0-84e21b98e727@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761646319; l=9643;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=d+wut6PeZQyP4Xb5PTssNu4tUmWnBmuxgzqkWyLc/Hg=;
 b=4Uf/kdbo3Zkq6teckwE9ghcUj3/WynJQ0si39kQbA2u6lI9uGm3xmV4N1NIybwXr5vCxtw0vg
 CzCv2qdPlH6ANJjJsXAEijnVXzA2+K8THleM/rqmjO12uHh1mCfj3CQ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=Ut9u9uwB c=1 sm=1 tr=0 ts=69009701 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0reUtR2WQOxYMfigi4QA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA4NSBTYWx0ZWRfX+P2uStC14iyu
 tpKH2E9ikTBg785XskBLYRDgFMA2J/80sKceyG0RPRp4wH8XEls7nhDZLUg/00hyl+wQn3O3anA
 okBf1Ce7Jrh06DNYwi3sQZ5BxQ09NQ+RujJIjaJVrrrBGrOtjYf3vc/bYSB6+swLGSPD12l2WS5
 L7MUFgB6dbSZv90zdaN8rLuqC0otvBddIyAmOP1K32us0WiRGeJsyf/aR/Y++3z2Rl88WRbgli2
 qHgwKDQCUkNapTH2ArM5SQOb0TW4ToUcHyhX+fWFsqkI9N6tJk+QEAG49JnonEabn0UhLjzv9sN
 Xc9pSyhbgkneRknTFhmQ/fJP0i9CgldOuJ4Q0hHkCLQ1W9WCjiZsQnVGsTbl/qJpr3zvpAsriBA
 snRAPtuwnzHvLlnCJe1WJOClmpK3Ww==
X-Proofpoint-GUID: XdawvdAGCqsXaMYanC7myxZsavJajFhZ
X-Proofpoint-ORIG-GUID: XdawvdAGCqsXaMYanC7myxZsavJajFhZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_031217_679336_1AF05047 
X-CRM114-Status: GOOD (  27.03  )
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
 drivers/hwtracing/coresight/coresight-tpda.c |   7 --
 drivers/hwtracing/coresight/coresight-tpdm.c | 174 ++++++++++++++++++++++-----
 drivers/hwtracing/coresight/coresight-tpdm.h |  12 ++
 3 files changed, 154 insertions(+), 39 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 333b3cb23685..3a3825d27f86 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -22,13 +22,6 @@
 
 DEFINE_CORESIGHT_DEVLIST(tpda_devs, "tpda");
 
-static bool coresight_device_is_tpdm(struct coresight_device *csdev)
-{
-	return (coresight_is_device_source(csdev)) &&
-	       (csdev->subtype.source_subtype ==
-			CORESIGHT_DEV_SUBTYPE_SOURCE_TPDM);
-}
-
 static void tpda_clear_element_size(struct coresight_device *csdev)
 {
 	struct tpda_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 7214e65097ec..0e3896c12f07 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -470,6 +470,9 @@ static void tpdm_enable_cmb(struct tpdm_drvdata *drvdata)
  */
 static void __tpdm_enable(struct tpdm_drvdata *drvdata)
 {
+	if (coresight_is_static_tpdm(drvdata->csdev))
+		return;
+
 	CS_UNLOCK(drvdata->base);
 
 	tpdm_enable_dsb(drvdata);
@@ -532,6 +535,9 @@ static void tpdm_disable_cmb(struct tpdm_drvdata *drvdata)
 /* TPDM disable operations */
 static void __tpdm_disable(struct tpdm_drvdata *drvdata)
 {
+	if (coresight_is_static_tpdm(drvdata->csdev))
+		return;
+
 	CS_UNLOCK(drvdata->base);
 
 	tpdm_disable_dsb(drvdata);
@@ -595,6 +601,30 @@ static int tpdm_datasets_setup(struct tpdm_drvdata *drvdata)
 	return 0;
 }
 
+static int static_tpdm_datasets_setup(struct tpdm_drvdata *drvdata, struct device *dev)
+{
+	/* setup datasets for static TPDM */
+	if (fwnode_property_present(dev->fwnode, "qcom,dsb-element-bits") &&
+	    (!drvdata->dsb)) {
+		drvdata->dsb = devm_kzalloc(drvdata->dev,
+						sizeof(*drvdata->dsb), GFP_KERNEL);
+
+		if (!drvdata->dsb)
+			return -ENOMEM;
+	}
+
+	if (fwnode_property_present(dev->fwnode, "qcom,cmb-element-bits") &&
+	    (!drvdata->cmb)) {
+		drvdata->cmb = devm_kzalloc(drvdata->dev,
+						sizeof(*drvdata->cmb), GFP_KERNEL);
+
+		if (!drvdata->cmb)
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
 static ssize_t reset_dataset_store(struct device *dev,
 				   struct device_attribute *attr,
 				   const char *buf,
@@ -1342,10 +1372,9 @@ static const struct attribute_group *tpdm_attr_grps[] = {
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
@@ -1354,32 +1383,37 @@ static int tpdm_probe(struct amba_device *adev, const struct amba_id *id)
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
-
-	if (drvdata && tpdm_has_dsb_dataset(drvdata))
-		of_property_read_u32(drvdata->dev->of_node,
-			   "qcom,dsb-msrs-num", &drvdata->dsb_msr_num);
+		if (drvdata && tpdm_has_dsb_dataset(drvdata))
+			of_property_read_u32(drvdata->dev->of_node,
+					     "qcom,dsb-msrs-num", &drvdata->dsb_msr_num);
 
-	if (drvdata && tpdm_has_cmb_dataset(drvdata))
-		of_property_read_u32(drvdata->dev->of_node,
-			   "qcom,cmb-msrs-num", &drvdata->cmb_msr_num);
+		if (drvdata && tpdm_has_cmb_dataset(drvdata))
+			of_property_read_u32(drvdata->dev->of_node,
+					     "qcom,cmb-msrs-num", &drvdata->cmb_msr_num);
+	} else {
+		ret = static_tpdm_datasets_setup(drvdata, dev);
+		if (ret)
+			return ret;
+	}
 
 	/* Set up coresight component description */
 	desc.name = coresight_alloc_device_name(&tpdm_devs, dev);
@@ -1388,34 +1422,51 @@ static int tpdm_probe(struct amba_device *adev, const struct amba_id *id)
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
@@ -1423,17 +1474,76 @@ static const struct amba_id tpdm_ids[] = {
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
index b11754389734..2867f3ab8186 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.h
+++ b/drivers/hwtracing/coresight/coresight-tpdm.h
@@ -343,4 +343,16 @@ struct tpdm_dataset_attribute {
 	enum dataset_mem mem;
 	u32 idx;
 };
+
+static inline bool coresight_device_is_tpdm(struct coresight_device *csdev)
+{
+	return (coresight_is_device_source(csdev)) &&
+		(csdev->subtype.source_subtype ==
+			CORESIGHT_DEV_SUBTYPE_SOURCE_TPDM);
+}
+
+static inline bool coresight_is_static_tpdm(struct coresight_device *csdev)
+{
+	return (coresight_device_is_tpdm(csdev) && !csdev->access.base);
+}
 #endif  /* _CORESIGHT_CORESIGHT_TPDM_H */

-- 
2.34.1


