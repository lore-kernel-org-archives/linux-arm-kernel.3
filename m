Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936DDCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 06:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpHBCdnSgFY8OByltD72t3aaSdewiYsQALJgMeWf4do=; b=JNfq9wnznlepiVMbwdJNs7daHE
	jXzir4UKFZn/OKbtmGb70/nsw28Kyw+nOs+Sn84+H3O0TI7+bRt9n21SU7bYhlBsWDjkHDwianuav
	MTf8yUDsWAo15dTioroOVmlpFzPSk8rkUTTjmof3s5wl2FGRiMW1mTHS4pBLRUxViW25nK1Df4Msm
	LKOAOaYbLZC+AJjrKiSvw9Ab0HuHVa1dW9DVTsU8lsUMu7m7ECHBKfdFEeb5jrvb0/QSJ9VvDBVOr
	ambuU7PfLneJ/F6t5VaUMNhJkP31P0Kp9kKYdAvT9GCOYu/akuWyuMtHaMACJu29eWlAwdrgaHcMu
	pCqiZ3gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdC9-0000000FL86-2fvb;
	Tue, 28 Oct 2025 06:28:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdBw-0000000FKz1-2NcA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 06:28:25 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S45H7p573507
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OpHBCdnSgFY8OByltD72t3aaSdewiYsQALJgMeWf4do=; b=Dej40s/T4ejdKCM9
	atjVzQatQQfbPzKOIX3fNhPGTrliYcX+bZT8Ki7uAbDa5kvKLjtaUl4q23m4OThz
	kBwcAAL+THzCNe6y0w8f2umsED9JCQpO9nLvN/OB8jgRgUhE2yY9QU1/Spzac0Mo
	fnbyf4bRZ0N0uAP5lbcnh5Vj1JNYJTfQbZN0KdfgF/qnPKG2qpPtWvTXaJAWTEdp
	XbZU5ElKS9iV9yJV6B/FqM/AkoCIQy/8eqCe7u9zseRBKEu8VsanKhIT70oBYT4U
	BUZKUKfjTuWjdmt/BICkN7qzs/6Z8K3/KsX2fAu0+1QVPnr8qxa5dXLCI90aiLMu
	l0XyUg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2pge8amy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-290d860acbcso121430435ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 23:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761632903; x=1762237703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpHBCdnSgFY8OByltD72t3aaSdewiYsQALJgMeWf4do=;
        b=fZUwpx8JiXM71zhT7ueNRXcAIl85bmUJt4EWr20dSQ0hsZMgkTbi6ARFudkshO28AQ
         +3MEDRistD+1yxTPrd/BqEK6R7K1PtoQfGTOmPPCijeZjXIxOlIst6vio48dXyxwrsh/
         x8yheuMEkhQD5EYoBqgIziP2PsbvQ2c6a84O0rdlDYR55sILjR2IunfTQbOqJjhOqoA7
         sxWBGMFQ7qRfcQnLsp6NDErXuxgCVJILJHSIV9Eoy+NWFLMXBaBYuFNzli8qz4WiFq0v
         2kdE9jCGf/NUQ0BxPepJrZiuh4O/RTavcCRN7ZYHPSM9ZM3GDMqgWdnEtneSFpcczpkE
         GtZg==
X-Forwarded-Encrypted: i=1; AJvYcCXWPgu1WOHql4LAFDCCkfdUoNbxUtPoLMBMw2nUcDPxyN2j/icry2HDTn/T89HbabFrXS4Q+d+05U2s2zSxe44l@lists.infradead.org
X-Gm-Message-State: AOJu0YwCN31edxvrS0Dcg/0nV9n9bK1ftnArbfkfN9DOCue94f5BZ7sL
	z+UcSOBl8IRLMuwxq9ZYPOORRX4YnBgLPBAoTaZnylOBPLSVZg+ZoYZJHnCUSzZL9nIMNIjtaVU
	rOTc9Px8LPSG1XNRDgC2OLDxkc2GKW1FussirhYWs0Loj+I8FT8qAp1/ftZLtaUcGmCYVcw7M2v
	VUyg==
X-Gm-Gg: ASbGncvAQseyq8RSahWV+/9av6XWPETVdc03mmuzFI04keErEH0xwl/f+DHY0xRC3tH
	5CHqbiIzwReVrw8W8rscZfvZ1SvGJb4uO6Y3YF7Kk7wb/XsBei3MaaiH579shXzaam1nZthdX17
	yrTz4kdVI216I0eTXqK8uv6z32IPvTQegnmHTkYknNyTYLgNbF47hAFdkypnmZFUgw38W9qrIml
	JQrmPGcCwFBlXogcGH9JWNULStxVbvg1051FpPhiPaZdV5VUOZ4NRDVb8irZtT4fBB1K74R5nCz
	sz4rmvkWEAcUDeAda7uMsztnVH8AwDfDkgGqADNJ0BQ6xHIg5gJ+Dy0CAN2JhAElygdAtG4+a0/
	yGbJ1nz6/6QF7hR2sZHcW78wzX+vdRf0Tuej1KRkTT4qmBib9apm5mjAk
X-Received: by 2002:a17:902:c943:b0:272:a900:c42b with SMTP id d9443c01a7336-294cb5064b2mr34400615ad.31.1761632903377;
        Mon, 27 Oct 2025 23:28:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwpw5M+tATyrDto8FoONGgcMqSPhAZcuLevcTVatT/4cowXARX69BX8IDLgj59x34/zI4gqw==
X-Received: by 2002:a17:902:c943:b0:272:a900:c42b with SMTP id d9443c01a7336-294cb5064b2mr34400235ad.31.1761632902853;
        Mon, 27 Oct 2025 23:28:22 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf359asm102503265ad.12.2025.10.27.23.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 23:28:22 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 23:28:08 -0700
Subject: [PATCH 06/12] coresight-replicator: Update mgmt_attrs for CPU
 cluster replicator compatibility
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-cpu_cluster_component_pm-v1-6-31355ac588c2@oss.qualcomm.com>
References: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
In-Reply-To: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761632890; l=2874;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=wrtq8428nZWzeJ2YM87p20K7H7FcxcHonAVQhsF4btU=;
 b=n1XFP/EYxn0Wrkm/FhLrkJPZ1Y/amwYC2N3lVShkOdDVseUu8Y5JQriQZy2P5STM6yEHYntwF
 /iWXOi7L3MICOcvUcKbift/V4Hvz+PTq/q04qbju4hzYZurophy3iDJ
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-ORIG-GUID: SCI53AyVyrTcl1rWHcM5uXk1FK0QeJFA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA1NCBTYWx0ZWRfX9BDb0pyTI1q/
 daar8O4ycPhTwecPTEH3vA8Bn7LsiNoORHA+QtsVsG6lCnRWp41/Vn0XwlEpsTA6p3KJeGSUDCQ
 Z8sFQoJLyCaN9vj3kqmoVozOOrjq/BMOSeniI5VlUqAjnp92TZNFtHg+qKllmoXTZBpC93Af7y7
 tzcQJ6nxk4AcDegercNfWbNs2LCK8jyhqconCwKyybQt1rCrZ1dPQ5HkBhUIpwpSvc08oxBV2ok
 fX5GolSWz5lLiOWOAqh73tqZAeROecxbE3yvfB/ZOyKm6GSnvV3aA/oR8Mc+SFyTt3oUil9iuuh
 9BOOqWMKohrILFmo6YtaIiRjpu6yl+3jyQHwLioYxEcYBOkCrH/oHXZrrm1hWUUl4/zNrnseJez
 gKU786/TzB8BzEeM8owLa1GvNaOsTg==
X-Proofpoint-GUID: SCI53AyVyrTcl1rWHcM5uXk1FK0QeJFA
X-Authority-Analysis: v=2.4 cv=fLU0HJae c=1 sm=1 tr=0 ts=69006288 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ViDxg2sRvTZTAOTQKJ0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_232824_625046_503DD79C 
X-CRM114-Status: GOOD (  17.79  )
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

This patch refactors the sysfs interfaces to ensure compatibility with
CPU cluster replicators. For CPU cluster replicators, register reads
are performed via smp_call_function_single().

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-replicator.c | 61 +++++++++++++++++++++-
 1 file changed, 59 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 1dfe11940cd6001db3cf17249b0493027b65e19c..22c9bc71817d238c2d4ddffbb42678bf792b29af 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -58,6 +58,7 @@ struct replicator_drvdata {
 struct replicator_smp_arg {
 	struct replicator_drvdata *drvdata;
 	int outport;
+	u32 offset;
 	int rc;
 };
 
@@ -286,9 +287,65 @@ static const struct coresight_ops replicator_cs_ops = {
 	.link_ops	= &replicator_link_ops,
 };
 
+static void replicator_read_register_smp_call(void *info)
+{
+	struct replicator_smp_arg *arg = info;
+
+	arg->rc = readl_relaxed(arg->drvdata->base + arg->offset);
+}
+
+static ssize_t coresight_replicator_reg32_show(struct device *dev,
+					       struct device_attribute *attr,
+					       char *buf)
+{
+	struct replicator_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct cs_off_attribute *cs_attr = container_of(attr, struct cs_off_attribute, attr);
+	unsigned long flags;
+	struct replicator_smp_arg arg = { 0 };
+	u32 val;
+	int ret, cpu;
+
+	pm_runtime_get_sync(dev->parent);
+
+	if (!drvdata->cpumask) {
+		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+		val = readl_relaxed(drvdata->base + cs_attr->off);
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+	} else {
+		arg.drvdata = drvdata;
+		arg.offset = cs_attr->off;
+		for_each_cpu(cpu, drvdata->cpumask) {
+			ret = smp_call_function_single(cpu,
+						       replicator_read_register_smp_call,
+						       &arg, 1);
+			if (!ret)
+				break;
+		}
+		if (!ret) {
+			val = arg.rc;
+		} else {
+			pm_runtime_put_sync(dev->parent);
+			return ret;
+		}
+	}
+
+	pm_runtime_put_sync(dev->parent);
+
+	return sysfs_emit(buf, "0x%x\n", val);
+}
+
+#define coresight_replicator_reg32(name, offset)				\
+	(&((struct cs_off_attribute[]) {				\
+	   {								\
+		__ATTR(name, 0444, coresight_replicator_reg32_show, NULL),	\
+		offset							\
+	   }								\
+	})[0].attr.attr)
+
 static struct attribute *replicator_mgmt_attrs[] = {
-	coresight_simple_reg32(idfilter0, REPLICATOR_IDFILTER0),
-	coresight_simple_reg32(idfilter1, REPLICATOR_IDFILTER1),
+	coresight_replicator_reg32(idfilter0, REPLICATOR_IDFILTER0),
+	coresight_replicator_reg32(idfilter1, REPLICATOR_IDFILTER1),
 	NULL,
 };
 

-- 
2.34.1


