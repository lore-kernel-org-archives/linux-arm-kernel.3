Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C27EC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 22:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8fhB4ShupgmdingQtdsx4ZV7fuE84BA4Ymz0F7Pxoc=; b=WiGtO9NDs1OoTX1zGX8uvcRpFw
	3J2fPhmSApAidpPHkQ41eisuwQIZFI82OiVUbb/PQ57Lw5l7LUbbMX2hYwA4BYa8AEd2hlz1kMOrv
	UEj5YzjmGBJMQkx46gtauUq8a74c/qmctRMMfF/69Ts/U7Mwswglhd3O4u+92p3KwXdJjjkH7pTUd
	r1dSTxBEu079bG6wS4wJt12aBbtCbTta2lRORJsJzrfIrEkQiqHhF1xaiEu2p3WsyBYgJcEWIJHCD
	nJTPBUkgG16jY8p9GMx7uZEsMCLN6teujl3JrANupzx7jiRqqvuYXtr9rrdFfzbnPVsMAnG9fVhKL
	G3ropqVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7L25-0000000CidD-3aDb;
	Thu, 17 Sep 2026 22:56:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7L1t-0000000CiZ5-2QIz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 22:56:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HLFntJ2179457
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 22:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C8fhB4ShupgmdingQtdsx4ZV7fuE84BA4Ymz0F7Pxoc=; b=Svk1/ZM7ul6UUri1
	ilADI/q42HWeWOXDTlhXtMd+epfVhQKv1y5K06BgXfL0VDFWvcs6dohdInxV3hlX
	p93MhU6T5EOjVT2Ipkp7pkFSz263eCTuX5MJv87sQ1yG3odWx6cxQQR0bkvp2ix5
	M2FZxSOBarq6yRe9jzg6hYzWW0YUNKFBCwwBx5cMLS6TJ/TLjdOU5Nf5rQ+yQBxU
	dQXkWvAwximUBqf4PW92VSogCXVnsfKFUIU5/fzVMvH1ilaXr7g24EhkSmjYvy1O
	0L4mAx7RoueN9q8JrJIFJ45NP0uY5M/N+k5ASAm3QaYZuKftPHIfwHgEZk9D/6t8
	efVSBg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2krkhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 22:56:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db8e9fe9c7so2193965ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 15:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789685791; x=1790290591; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C8fhB4ShupgmdingQtdsx4ZV7fuE84BA4Ymz0F7Pxoc=;
        b=d2jKy4YVteZBroxh0oWkhaHO5qpSuk3+3Wf54oC8pLGqhcV72JX3b4bdyfAx+xdebH
         p1GnGZL15NWYg/Cxqlruj2jyFyJnS8LgaAF3xUVjzo3GNALsh32UQb55GBHLXywqe6/O
         8U4oWSYYST+yLo8nbmyC2JqtFI44WVQ0wCIR3lalzQfHYgxyNB0FNnpFEuu5Ob0raaUm
         z/Gczoeu1vyyRVzTeOuufYcCYmbCiSuOOfNvzb5OKgkXvtQ4OlQX1OehANmeRVIxqoFM
         XGzl131/YAcErwlMTBAnCSu8LlHgV/tb+VcbvlqZBwozcPfdzv8xZuoTLXOU25Mvajsd
         CVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789685791; x=1790290591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C8fhB4ShupgmdingQtdsx4ZV7fuE84BA4Ymz0F7Pxoc=;
        b=qowXLjzsBJDjRJ6ooPfvGG9wOLzE4EghwWiVhUzUJbzq2sctk0GvnxRsaJcLjnTCe/
         /hmoT+x3lf/u+1YTl8MKkM+jtUfki8gkwlQsvWuO29H69d6j4lnsInB3n2jlgBYLX6X7
         z/bpSb8s1SDVeDQNZOk09TgTnTK7RQs/kd1KAdHZ/2fFviTdL/oVMLv6Tx5X/5mCVNbL
         H2/3hlSpAUUzMLiEQJhQktTOlhyNpxmyJZgSI+bV4+/kcB3s/RE3Nv1NYRKTxeO/cdaF
         dGIGYK/lqmxZ73s/bxKN09PaGDCxmm0htRX+3YxZG/xtqX7e1QAIj9BP3ryK/W4vAT4V
         d1Vw==
X-Forwarded-Encrypted: i=1; AKwUvBzLe23/j5bIDsGgPxFGJJWSTU+Y6C7TVP3ARG6ZLBSSGHVz2ICJIz9YjvyxQ7OFrzfyCcQNdQ1VLo7USK/5rKDb@lists.infradead.org
X-Gm-Message-State: AFuF++k4HyDq4vSYvs6IsmmFQm5FfBSvPDBIG4yqOa65z0ZURD4dsEXS
	sMQDUvZIqGt/IzttfMXUoxE8qLLvkv8oQkkgGXJ+YNhd2dCXIGHl3qyEpmsM6qlej7UYUHFn0hq
	lbbr7AlNaOGnUXpQHSrDejbNLxPaDkdhmMH9Otdo4x5i83fuveQbPKeH1fSGe5HF52KHS1Go5xd
	8J/w==
X-Gm-Gg: AYBFou036W4De6pRa8U/ttoQCW95M+z7xGT+PKzroEIbWF83suGMt4ZDQ6JhfGZyyiQ
	hzmkCmACmkjjqJY495+FF/bcgElHXAREsCpJhL0EqQ1oBrgNwvz6OLZc+Kxs+u/L4J/4RNuJxMH
	8igsHE28E+AtdsG19Ue6O12vghJmRDbJXOWQGoB6fRt6VC+odCL7lV8OeCcFK3/2JkgEakpZUnj
	2BumAdWCQ387YZvQedLyiOtNFGYxhZ9t1HwjDxMdDmr0CJ7U8ctJpg4uQostMiOwO2Iy5uj0Dj8
	kiYJ3u+bOHO0cLCa1LQ6Derb+NHpaQtJ4hwUGaMVV3/2Z5P1XMHX9qqzHcfXwTyoBGonyUXi81Y
	0UYx4FvEKpEr5UVvMzys6JDs/OALK9ovZS46FEvDTiKm5qouVOg==
X-Received: by 2002:a17:903:2443:b0:2d9:484:861d with SMTP id d9443c01a7336-2ddb1af6da8mr12657685ad.10.1789685791129;
        Thu, 17 Sep 2026 15:56:31 -0700 (PDT)
X-Received: by 2002:a17:903:2443:b0:2d9:484:861d with SMTP id d9443c01a7336-2ddb1af6da8mr12657315ad.10.1789685790662;
        Thu, 17 Sep 2026 15:56:30 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ad25bbsm15812508eec.19.2026.09.17.15.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:56:30 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 15:55:56 -0700
Subject: [PATCH v2 2/3] pinctrl: scmi: Replace pinctrl ops get group info
 with generics
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-scmi-pinctrl-generics-v2-2-3eeee364257f@oss.qualcomm.com>
References: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
In-Reply-To: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789685788; l=3568;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=P8dryjMpnqvpodgWk2ySD7v0wpX4IgHdJJ8YJF0hzFM=;
 b=pMk4JLcfOy5cUTaVghI5ArSIfRa+ErdzPL7JMcBU8CJH4cwE8P9sIpq/IsgA7Z4eRZl8fYtRn
 VM02NxlcSLEAvVhb+ASBBsDGBwxKOIcjs/YVUJ0uyPgFjQkuuKHcfXc
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDMzMCBTYWx0ZWRfX13aZRaVOwovH
 BH/q7NURfUL/NnXXEgkOPRicm85/+s3ImPUNr95UZ1fu75kKSUR2r28v1iG3S6M3w56DQ6gsOAr
 mxuhdNc5bFW2xIH9hOwFxIEqZxHtIJwSpHi9L8cYlKiUmJ+pCUUHn7jIcpRcjIi8Kf39/MSGlCh
 wVHB9iOOq3PlkLi5qxofYFAuFkF+9yE5qHzijIZiuuudwMZznNpKH5/AzfGyvGxs9NQuoBYwNTc
 9q7J97K5ckYXo6WQ2wVL+qBvwehDizSGXnY9WlqPwscXaErsg5NBCXQCSIXPmOONpY1DPs9Rfiq
 cLHgHhBfJ61oGaYxXIz9Npzqp3J92CYcEsOCfiEhWgTD35A18e5q3NBdVI/LlhTpiREW+ENz3z3
 h4YsRF+Y5+Q7q1Qd3a5YJhy8D0+9wgjctyGCE0fnIfCm6HJ+7P6YRXrcXHPiV4/z3ex0465dUtE
 n5SYUv8/ID+2jlP8Wiw==
X-Proofpoint-GUID: 8sWt5fqqSgUZMJxmWWTzpEmA33eJW9sx
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aac7020 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=p54jq0OH07X71X_IsjoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDMzMCBTYWx0ZWRfX/uB9PKCU+WTc
 sBEtgwOBxCiseGyHCx4pyl8DmaXyaKstrp3MuLUnnbr3Fl1ax3QODdfogTNVg5zeCy0a95eqSJa
 a8mh8bRMhnH2PSjCZH6tr0N2huVrGMM=
X-Proofpoint-ORIG-GUID: 8sWt5fqqSgUZMJxmWWTzpEmA33eJW9sx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170330
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_155633_739684_B97BA758 
X-CRM114-Status: GOOD (  18.64  )
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

During probe, populate the pinctrl device with group info
so that the generic callbacks can be used to fetch group
count, name, and pins.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 81 +++++++++++++++++++++++-------------------
 1 file changed, 45 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 1d85a16f300d..c93d61dfa282 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -40,43 +40,10 @@ struct scmi_pinctrl {
 	struct pinctrl_desc pctl_desc;
 };
 
-static int pinctrl_scmi_get_groups_count(struct pinctrl_dev *pctldev)
-{
-	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
-
-	return pinctrl_ops->count_get(pmx->ph, GROUP_TYPE);
-}
-
-static const char *pinctrl_scmi_get_group_name(struct pinctrl_dev *pctldev,
-					       unsigned int selector)
-{
-	int ret;
-	const char *name;
-	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
-
-	ret = pinctrl_ops->name_get(pmx->ph, selector, GROUP_TYPE, &name);
-	if (ret) {
-		dev_err(pmx->dev, "get name failed with err %d", ret);
-		return NULL;
-	}
-
-	return name;
-}
-
-static int pinctrl_scmi_get_group_pins(struct pinctrl_dev *pctldev,
-				       unsigned int selector,
-				       const unsigned int **pins,
-				       unsigned int *num_pins)
-{
-	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
-
-	return pinctrl_ops->group_pins_get(pmx->ph, selector, pins, num_pins);
-}
-
 static const struct pinctrl_ops pinctrl_scmi_pinctrl_ops = {
-	.get_groups_count = pinctrl_scmi_get_groups_count,
-	.get_group_name = pinctrl_scmi_get_group_name,
-	.get_group_pins = pinctrl_scmi_get_group_pins,
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name = pinctrl_generic_get_group_name,
+	.get_group_pins = pinctrl_generic_get_group_pins,
 #ifdef CONFIG_OF
 	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
 	.dt_free_map = pinconf_generic_dt_free_map,
@@ -460,6 +427,44 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 	return 0;
 }
 
+static int pinctrl_scmi_get_groups(struct scmi_pinctrl *pmx)
+{
+	unsigned int nr_groups, nr_pins, i;
+	const unsigned int *pins;
+	const char *gname;
+	int ret;
+
+	nr_groups = pinctrl_ops->count_get(pmx->ph, GROUP_TYPE);
+
+	for (i = 0; i < nr_groups; i++) {
+		ret = pinctrl_ops->name_get(pmx->ph, i, GROUP_TYPE, &gname);
+		if (ret)
+			return ret;
+
+		ret = pinctrl_ops->group_pins_get(pmx->ph, i, &pins,
+						  &nr_pins);
+		if (ret)
+			return ret;
+
+		if (!nr_pins)
+			dev_warn(pmx->dev,
+				 "Group %s contains no pins\n", gname);
+
+		ret = pinctrl_generic_add_group(pmx->pctldev, gname, pins,
+						nr_pins, NULL);
+		if (ret < 0)
+			return ret;
+		if (ret != i) {
+			dev_err(pmx->dev,
+				"Duplicate group name: %s index: %u selector: %d\n",
+				gname, i, ret);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static int pinctrl_scmi_get_pins(struct scmi_pinctrl *pmx,
 				 struct pinctrl_desc *desc)
 {
@@ -544,6 +549,10 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register pinctrl\n");
 
+	ret = pinctrl_scmi_get_groups(pmx);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register groups\n");
+
 	ret = pinctrl_scmi_get_functions(pmx);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register functions\n");

-- 
2.43.0


