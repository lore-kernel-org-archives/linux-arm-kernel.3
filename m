Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0EECD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 12:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fO0o6u0IamVYb8Tlwzhjz6AcRXov7BncWTgpYMq2UVM=; b=XMWSpJvqeNvYpSOLdXlRgAKvTp
	0gdq25Tbg4rxHo+BBIkK6tey8x+8/ZOih0eDKoraExXLdUFStOPUjU8gcY5gynM3bi/O2no65QlNZ
	ythH92rgyhxwPJNs2GSZvYr46iOKV00OFzBpKodSfDchfEmPrwfPJkCq3WaqnoEJ4GpRjHckdVxbZ
	SdJ6G4IohTm0nGuUh7Lljlm7T9j1nK/BR48crJ6ftlRRtmGzUVG+Cktq7TcDWHs0u0D7t4ELp40VI
	91WgV3aVhyLVLG+CI3A2KN5Db49rJL2/CcJbSCGpHbdRkQrSPXTWzaIeB39Qk03FNCrzTwOP0alaR
	4QDtTzfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2Kg-00000007hgu-224G;
	Thu, 21 May 2026 12:16:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2Kc-00000007heG-1gvR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 12:16:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99olF3118973
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 12:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fO0o6u0IamVYb8Tlwzhjz6AcRXov7BncWTgpYMq2UVM=; b=Qk5GNeKe/zZDl9uV
	0OvGSg/Mwt/+chXrAS0BezVkgen+lg25PC76puhIm6Vkdt4G4+WF+ddbv+Q7FDLS
	dt5KChe7+xfNRl4QDT6AwNRU9rXzRE7cnuwpFCsN2pTnK81wCK5e9ouVPPIbJnrE
	F0GYCuaY0/ctyztQIJGq6bL0cWEVk3C6D9x1xzXePU4VLjkCd/IGvAyJrcmrWge9
	5GNMYemBhvHgq7stNlbwgrHSZUVYsIeP3SHatZvao7JolrxGe9vEZRnGQFckDKnc
	AOA/RO+lPnDTbNouN4e5wl+nqheK6pwvWngX9dHaGHgBEAwr3sCBNfghBmvOFhUa
	cWoBnw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9r962c0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 12:16:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba838d3fa4so57842465ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 05:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779365812; x=1779970612; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fO0o6u0IamVYb8Tlwzhjz6AcRXov7BncWTgpYMq2UVM=;
        b=j2tzbCh1P5/oUQP/om+Curv4DvgdA5tCw342PcGcbFaVFGtW77v44+ChBw9i9nl+X5
         nH2z75sdNStu32lQ6e72KaDe5HTIHWWACvP6WC5e7gsLBDXUnF54L78kFFzrzkZW1YVt
         l883wGTv+84ciLiAs5HaFv5U1Ct+o7OctG722dthGgZu1EB0oshvNQ/nq/9Yo+ZWT6c9
         DgdRBbOSvzw32sm6c/ASx9v8fkrJqFEku1h5cgKUkcpWbRba6djCnu+nC/0q/Ny/LffN
         1OwTXKfrWWGR4FokhPJco50l0aKv/qtNgXpaGL3V5ol1t8yf+r7UiKptyVZpqktxMKw7
         OfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365812; x=1779970612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fO0o6u0IamVYb8Tlwzhjz6AcRXov7BncWTgpYMq2UVM=;
        b=Woh8AkQumB4YEH0kcwtp+GlIs4yd4eUC58nnMcDeSp1xQa9Gxy7kknix9RTpoBf8qT
         0mWj0reIqqzC/1LXPwsya0HDAnYKG0kuHrqVx61b9YmxbfdtBBZNuENSB1qfSChMIFRk
         5G6yocY91jMnrDlKfMvbjv3Uqy5QnN0IBTf6OPa0rbe0wnxB4uf8cU2BVWaWZkWgB1kX
         Zq7sRtc0DTUDly9IL884KwVZyMcjtS8+GeD9rjeVU4CAckZgivznjg+AOsIv5L+o0TLe
         S8tC5C2bLbIFAxZ3oB9X6zGSU0hPxHZ+khsjZkwDskhl0cyj/fVFXXl+zHV+TqVjDVRu
         cQvw==
X-Forwarded-Encrypted: i=1; AFNElJ8jooy1RfHouo4Nr2A12xywpqcLOrHfX4sVxymgaocBdSfRiRl9fuFb2qx2JZ7GHnfEfG557Ius7Mz9dsuyilC8@lists.infradead.org
X-Gm-Message-State: AOJu0YzpEGpRIcDmKLIgld9LMfv6a54ek9hpPgznxU8WRRhS2/L4lrxD
	iB/Lp4gr8GBMWELe/lDoqo/B8KaYMx3YVtXG4dDzeTnjomX5Qgfjk18P5gwE7NssV4PBuJUASuO
	6mXmMnfwftt4h9xDAjGd41tQ9xscCtBT6+LIItyVvrKXRRrziaGJoq9Ft+ArPFuN4jmPVS9A/u7
	X/boUw21nyEQ==
X-Gm-Gg: Acq92OEY5g6GUHu/3RohLDr+EmC1vbvhyLJECK2Yv5gXx9gG/FeHMrIc8DLtgNCcdHk
	VHmKr3liYBq5vjpLv1SHoa8AsrEj/v1X6vLIhxbamupcduIn1vEz6e/Tk4nB/Y2woSzyBDzwl5s
	UcSE6qJ0jh+pQudQ4KWEKizMZKR2PLY6oC6scSfrtm7PrTwiCvhTOm/YdaFsStxf2gC5z9eEfA3
	nW7hna4asKGUPloo67hwQ6lK6/KGnULk4VwHEEcOrg9RQ7iGD0hZcIWAIcdhJO0Om/MzGBZNPUL
	clMBUxRoye75b77qDBFyeioT9xBo/Cqzbc5uxDef0wSOhjdpfgmVi8rbcUWkS7hnm/SWAGS1y1Y
	96qGZNT0zP/tCT/O+2r/C6cvqgcZLt+G90ZrrDt9S4e3wu0Dew1jsmwWxzdj3fvc+YCOixYKUJQ
	/VSl1Sjle1tmJQs2EROYCwK3ga
X-Received: by 2002:a17:902:7406:b0:2bc:78ec:54c0 with SMTP id d9443c01a7336-2bea30a646emr22321095ad.31.1779365812069;
        Thu, 21 May 2026 05:16:52 -0700 (PDT)
X-Received: by 2002:a17:902:7406:b0:2bc:78ec:54c0 with SMTP id d9443c01a7336-2bea30a646emr22320705ad.31.1779365811534;
        Thu, 21 May 2026 05:16:51 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea917318esm10435555ad.5.2026.05.21.05.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:16:51 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Thu, 21 May 2026 20:16:29 +0800
Subject: [PATCH v9 3/4] coresight: cti: add Qualcomm extended CTI
 identification and quirks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-extended_cti-v9-3-d21f4f92c51e@oss.qualcomm.com>
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
In-Reply-To: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jinlong.mao@oss.qualcomm.com, quic_yingdeng@quicinc.com,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779365796; l=7584;
 i=yingchao.deng@oss.qualcomm.com; s=20260521; h=from:subject:message-id;
 bh=9c3KkSTH9SNVjrN4djhgLnzm9UPZeM+m23N8Q7Og1Fk=;
 b=/W594KJ7Xc/7Ks61Cx8t6vxrj4Nq9aero4Jl+y3o9rkDDSgmPvVccZDPgqKD1KKcJXlJmz17p
 KeXqG+OCY/JAUw4y0F80ueg2V2inSchEFctQAGJp6mj1Ky0cVHcmiJs
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=YbHeeX0Qzqo7voZLva784lFhVChB9yF3a4sceW95ljA=
X-Proofpoint-ORIG-GUID: s08NNEx1yoJtZzDW5s2dZkTBvIgFHNF-
X-Proofpoint-GUID: s08NNEx1yoJtZzDW5s2dZkTBvIgFHNF-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyMyBTYWx0ZWRfX679vEadxLvPd
 aHbcl4gZAKQ3sxh+5jxEXfpH8FI7DGLapLoifcNRmZJmudAt7I8C6wS7yrcTcGZMZ2LDVEkjUMV
 nxo1uePkSKVgN0n8IAlj/LSieFILJksJ0fzh3EOIoZkjnWZRXsY8EgDxl/IAMOdxomdOjAxOYpK
 Ru9BDd6l39/dHupEcF0rFTJV1lOQ0uN5Tp574eWl8q3dxw/mqw8uEPejKihKm0R4ku5JQSrxWH1
 5boC2ZUzDmDvv4cX3p4vM5mFkyl7EmZv3RLJIwrCl+Ug48euAcl0Jq8PzhS+HU7sNZSBlYVRMck
 WTqrrQTzrsBawQvLghyJaeOpvrLGmqK9uRxVzO+/V8Ro7Q8si1+NRm2aActfUzJMBN6Nl27THHb
 njtZSftX0s3MYdXphEarcv2KdigvTXmMC6QWKTOitQuqNKIyjieGplZDYK91fQNMFPACJJSRqJH
 jI5Gjshw2QVpj9Cdu2w==
X-Authority-Analysis: v=2.4 cv=GqFyPE1C c=1 sm=1 tr=0 ts=6a0ef7b5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=yjDJaKUznl4u3GwUnvUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_051654_575145_47066756 
X-CRM114-Status: GOOD (  27.58  )
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

Qualcomm implements an extended variant of the ARM CoreSight CTI with a
different register layout and vendor-specific behavior. While the
programming model remains largely compatible, the register offsets differ
from the standard ARM CTI and require explicit handling.

Detect Qualcomm CTIs via the DEVARCH register and record this in the CTI
driver data. Introduce a small mapping layer to translate standard CTI
register offsets to Qualcomm-specific offsets, allowing the rest of the
driver to use a common register access path.

Additionally, handle a Qualcomm-specific quirk where the CLAIMSET
register is incorrectly initialized to a non-zero value, which can cause
tools or drivers to assume the component is already claimed. Clear the
register during probe to reflect the actual unclaimed state.

No functional change is intended for standard ARM CTI devices.

Co-developed-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Signed-off-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c | 27 +++++++++-
 drivers/hwtracing/coresight/coresight-cti.h      |  7 ++-
 drivers/hwtracing/coresight/qcom-cti.h           | 65 ++++++++++++++++++++++++
 3 files changed, 97 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index c5cc2706e241..2dac5eb4ecca 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -21,6 +21,7 @@
 
 #include "coresight-priv.h"
 #include "coresight-cti.h"
+#include "qcom-cti.h"
 
 /*
  * CTI devices can be associated with a PE, or be connected to CoreSight
@@ -45,6 +46,9 @@ static DEFINE_MUTEX(ect_mutex);
 static void __iomem *__reg_addr(struct cti_drvdata *drvdata, u32 off,
 				u32 index)
 {
+	if (unlikely(rvdata->is_qcom_cti))
+		off = cti_qcom_reg_off(off);
+
 	return drvdata->base + off + sizeof(u32) * index;
 }
 
@@ -172,6 +176,9 @@ void cti_write_intack(struct device *dev, u32 ackval)
 /* DEVID[19:16] - number of CTM channels */
 #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
 
+/* DEVARCH[31:21] - ARCHITECT */
+#define CTI_DEVARCH_ARCHITECT(devarch_val) ((int)BMVAL(devarch_val, 21, 31))
+
 static int cti_set_default_config(struct device *dev,
 				  struct cti_drvdata *drvdata)
 {
@@ -702,6 +709,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	struct coresight_desc cti_desc;
 	struct coresight_platform_data *pdata = NULL;
 	struct resource *res = &adev->res;
+	u32 devarch;
 
 	/* driver data*/
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -726,6 +734,22 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 
 	raw_spin_lock_init(&drvdata->spinlock);
 
+	devarch = readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
+	if (CTI_DEVARCH_ARCHITECT(devarch) == ARCHITECT_QCOM) {
+		drvdata->is_qcom_cti = true;
+		/*
+		 * QCOM CTI does not implement Claimtag functionality as
+		 * per CoreSight specification, but its CLAIMSET register
+		 * is incorrectly initialized to 0xF. This can mislead
+		 * tools or drivers into thinking the component is claimed.
+		 *
+		 * Reset CLAIMSET to 0 to reflect that no claims are active.
+		 */
+		CS_UNLOCK(drvdata->base);
+		writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
+		CS_LOCK(drvdata->base);
+	}
+
 	/* initialise CTI driver config values */
 	ret = cti_set_default_config(dev, drvdata);
 	if (ret)
@@ -782,7 +806,8 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 
 	/* all done - dec pm refcount */
 	pm_runtime_put(&adev->dev);
-	dev_info(&drvdata->csdev->dev, "CTI initialized\n");
+	dev_info(&drvdata->csdev->dev,
+		 "%sCTI initialized\n", drvdata->is_qcom_cti ? "QCOM " : "");
 	return 0;
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index 98b8de8a3687..08ea6daf5b3c 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -54,10 +54,11 @@ struct fwnode_handle;
 /*
  * CTI CSSoc 600 has a max of 32 trigger signals per direction.
  * CTI CSSoc 400 has 8 IO triggers - other CTIs can be impl def.
+ * QCOM CTI supports up to 128 trigger signals per direction.
  * Max of in and out defined in the DEVID register.
  * - pick up actual number used from .dts parameters if present.
  */
-#define CTIINOUTEN_MAX		32
+#define CTIINOUTEN_MAX		128
 
 /**
  * Group of related trigger signals
@@ -168,6 +169,9 @@ struct cti_config {
  * @spinlock:	Control data access to one at a time.
  * @config:	Configuration data for this CTI device.
  * @node:	List entry of this device in the list of CTI devices.
+ * @is_qcom_cti: True if this CTI is a Qualcomm vendor-specific
+ *		 variant that requires register offset translation
+ *		 via cti_qcom_reg_off().
  */
 struct cti_drvdata {
 	void __iomem *base;
@@ -176,6 +180,7 @@ struct cti_drvdata {
 	raw_spinlock_t spinlock;
 	struct cti_config config;
 	struct list_head node;
+	bool is_qcom_cti;
 };
 
 /*
diff --git a/drivers/hwtracing/coresight/qcom-cti.h b/drivers/hwtracing/coresight/qcom-cti.h
new file mode 100644
index 000000000000..d3846613a0de
--- /dev/null
+++ b/drivers/hwtracing/coresight/qcom-cti.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _CORESIGHT_QCOM_CTI_H
+#define _CORESIGHT_QCOM_CTI_H
+
+#include "coresight-cti.h"
+
+#define ARCHITECT_QCOM 0x477
+
+/* CTI programming registers */
+#define QCOM_CTIINTACK		0x020
+#define QCOM_CTIAPPSET		0x004
+#define QCOM_CTIAPPCLEAR	0x008
+#define QCOM_CTIAPPPULSE	0x00C
+#define QCOM_CTIINEN		0x400
+#define QCOM_CTIOUTEN		0x800
+#define QCOM_CTITRIGINSTATUS	0x040
+#define QCOM_CTITRIGOUTSTATUS	0x060
+#define QCOM_CTICHINSTATUS	0x080
+#define QCOM_CTICHOUTSTATUS	0x084
+#define QCOM_CTIGATE		0x088
+#define QCOM_ASICCTL		0x08C
+/* Integration test registers */
+#define QCOM_ITCHINACK		0xE70
+#define QCOM_ITTRIGINACK	0xE80
+#define QCOM_ITCHOUT		0xE74
+#define QCOM_ITTRIGOUT		0xEA0
+#define QCOM_ITCHOUTACK		0xE78
+#define QCOM_ITTRIGOUTACK	0xEC0
+#define QCOM_ITCHIN		0xE7C
+#define QCOM_ITTRIGIN		0xEE0
+
+static inline u32 cti_qcom_reg_off(u32 offset)
+{
+	switch (offset) {
+	case CTIINTACK:		return QCOM_CTIINTACK;
+	case CTIAPPSET:		return QCOM_CTIAPPSET;
+	case CTIAPPCLEAR:	return QCOM_CTIAPPCLEAR;
+	case CTIAPPPULSE:	return QCOM_CTIAPPPULSE;
+	case CTIINEN:		return QCOM_CTIINEN;
+	case CTIOUTEN:		return QCOM_CTIOUTEN;
+	case CTITRIGINSTATUS:	return QCOM_CTITRIGINSTATUS;
+	case CTITRIGOUTSTATUS:	return QCOM_CTITRIGOUTSTATUS;
+	case CTICHINSTATUS:	return QCOM_CTICHINSTATUS;
+	case CTICHOUTSTATUS:	return QCOM_CTICHOUTSTATUS;
+	case CTIGATE:		return QCOM_CTIGATE;
+	case ASICCTL:		return QCOM_ASICCTL;
+	case ITCHINACK:		return QCOM_ITCHINACK;
+	case ITTRIGINACK:	return QCOM_ITTRIGINACK;
+	case ITCHOUT:		return QCOM_ITCHOUT;
+	case ITTRIGOUT:		return QCOM_ITTRIGOUT;
+	case ITCHOUTACK:	return QCOM_ITCHOUTACK;
+	case ITTRIGOUTACK:	return QCOM_ITTRIGOUTACK;
+	case ITCHIN:		return QCOM_ITCHIN;
+	case ITTRIGIN:		return QCOM_ITTRIGIN;
+
+	default:
+		return offset;
+	}
+}
+
+#endif  /* _CORESIGHT_QCOM_CTI_H */

-- 
2.43.0


