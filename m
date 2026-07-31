Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB2BC5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 17:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jJDQkrGJ2IGcmb+nAQyvEVUSSOFRfBkl2r33zU+RCw=; b=JDLxNhjIG9Uh1+IB8dtpGgqPTM
	vObrLzvifNX6ohSir9HAt+lxOCqN84wjVolAITLdRdt4rt4ScmnZ2Rwy1CfgEHTFU7Qy4Cvmv/azQ
	DIr3bJMLZSHndnTKZ5mOs9SnBUeHBIqiyKTZoKja4Y6FlRkrKGtqwQMornH9TdpBzQqd1UpCFf+kE
	B2+jQqS+yCu7N13PyA4FVnEy9+WRYbQwgMLYt9c30gAELlhKC68qXVuYoxBsC5qm4iYqDBJiTWSEm
	L6V7V6B5pVUgVnfVMZLVU1SdEjpAlIcN0JMkIW54Qu66tluh7GwAWREslfrM5tWhdZC8bQHle64d9
	99jpw1Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprMl-0000000DHpz-3GXf;
	Fri, 31 Jul 2026 17:49:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprMi-0000000DHoV-3y3Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 17:49:50 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFOVSl489328
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 17:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2jJDQkrGJ2IGcmb+nAQyvEVUSSOFRfBkl2r33zU+RCw=; b=Er/f7dqbYVzezM2B
	oPfEZJgvGdinb6XsGB9zKxbqP0jxpchpMeWienOO/vIe3zw/4z6LzhHkk0lDVPfD
	xnuaWgytOpqdrJzsgjF10EtnvP1Lc/BP1aVcefbGos2OYzw8uOUqYkyMwJLVfyeX
	H9elwknoVevqhCsTCXyEXr/CgyIgE9YcWhX3yfiLGtdzaDyIKtie2th05sHBQnR6
	rcl011xhW26aCVMzweIOtHffJBhB9Yq5T7eJ9AeuDTN6qxQDgf3LHHWU2mIq/Afl
	d8N3wZjmhcisv9y2XH6ozcOKg52hkD3fNucLY2c8NSggQi0Bl9cX3ucGLh8YpqP2
	bRIJFA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fruk8skru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 17:49:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-caf5fa127d4so2107886a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 10:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785520185; x=1786124985; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2jJDQkrGJ2IGcmb+nAQyvEVUSSOFRfBkl2r33zU+RCw=;
        b=a390ekcOYzAHdoSpDU/8kKcmVVQ12HthBXDs3rT/hRA/2kuL3eMXkFBpvzsFfkkqQC
         Pe0uNLp7bkspMbtqaTVdqsg3KP1MTBWzxq5PDfKMtZ1NHF11eWnv5N0p+XbJNKNkxeCa
         p/ZTmRCKd92xYmRY87K8ugXI9SejYPejQ6jYN3Sw22W/hExU1iJvGdTpC2uxalRtyDWQ
         B7KUTOehmM9ZEgRshrrFLg8N6xBHewAcowWobdfjRR+jHhuR2rBlW27IKyVPHb6c9ZlD
         TFEnI6aXFxzqudefKPHVaZoXvDR1Sv4u6RKvD9hyD8nEq4DIfEReR4gcvdSUtwg1IdrE
         2a5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785520185; x=1786124985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jJDQkrGJ2IGcmb+nAQyvEVUSSOFRfBkl2r33zU+RCw=;
        b=nFSLH8r7Bb0vUpYMhJXdyczQAmOhkkRQTgsMG9A6yLY8VTjvbxcIzGPJ/4r6j08gcH
         h+iM7719+VIPNB+L53wIX0r25LqkI+Ncm3KI3LOhhv/ke15PNo++pefrL9ZrfJSoX796
         XreCH1gMVLRvbN9tZgJEJobPC4rPYneQPl2QqsyfEoEV4gIeAlWCMPSdgy2CHMOaOwdT
         pxOWhv/fZKb7HM1dZWmw34DLg3OIXGpk3H4Ds8SQrnMP5+CmYfXvmCh9PhPSDVIGbML2
         1VElHO0U7h0Xl9/o6lWKu4etPM+szq6FYWgpWjK9qdEua2niuVVdmaqFbrWtXNRz9yzc
         h8tA==
X-Forwarded-Encrypted: i=1; AHgh+RrhEs7Q8j8+ftWQA91bHbZuU26vohTLS9/KIoVt9/Uk76qdQ8CesMjo7Uj0UOmTsgJ7rHjLiZRjfGv8loNr/o7w@lists.infradead.org
X-Gm-Message-State: AOJu0YztAmtnqsdkwUijIKjWZr10kGWEgFgwSxGH8HFBLlYdvIBMgioQ
	lCOosBb1JXfDpB4jeFOAF6UFB80sW8l3YkUTp8Ok7NC0oHpfNCuDscKflUvDHewPDC6hO1/3LaF
	S5JHN9fDdWW88oRftubp2B15UdE6Ug10rPQYvdyXT98G5oziaGbjpFM5ZyfsN1OI3n4Jy4Nr2dV
	KlFg==
X-Gm-Gg: AR+sD12emZW2aDKfXeyVjpTFg1MaNU0LAjIBdTtRFYndGR+Qv66dTaQlUjlJfVig1GQ
	n5+Pfn6cr57kHChnyuO4Tz8dDKYR0FsPCV5BlG3OoFLuPau/QcUhvhjZnwura5bQ6cBHqCY3CSY
	+ofoR+m989c3jIyo0it1Lyw5BQu5Oy5QL1b6SBV1+rUmrlL3Kk5AESID8120N3hGczyA3vMDxNx
	s50tjaS8SaemTjQ5XWoaYzhJimX6NuiCv2ArdPnL8e3zjv+lO90ztyxjUN/OMyjoKcLiz73F8WW
	5Pyoo8BkbjwlOuEf9q0rYA1sxWgVDRpQvjB74VQeEFheukcrt4TnfwQLGuVtTUAFaWSD+6Ps8Rh
	DERzueAz/yB8L5LHPrxXLI4+uI8941ykcZkFyyoze4hdsSfjSRw==
X-Received: by 2002:a05:6a20:d612:b0:3bf:6c08:2844 with SMTP id adf61e73a8af0-3c92a8af382mr649386637.51.1785520185574;
        Fri, 31 Jul 2026 10:49:45 -0700 (PDT)
X-Received: by 2002:a05:6a20:d612:b0:3bf:6c08:2844 with SMTP id adf61e73a8af0-3c92a8af382mr649360637.51.1785520185197;
        Fri, 31 Jul 2026 10:49:45 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm15115660eec.28.2026.07.31.10.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 10:49:44 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:49:33 -0700
Subject: [PATCH 2/2] pinctrl: scmi: Replace pinctrl ops get group info with
 generics
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-scmi-pinctrl-generics-v1-2-8affd2b79a6b@oss.qualcomm.com>
References: <20260731-scmi-pinctrl-generics-v1-0-8affd2b79a6b@oss.qualcomm.com>
In-Reply-To: <20260731-scmi-pinctrl-generics-v1-0-8affd2b79a6b@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785520175; l=3552;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=iGDWxccwZWmudq1xpenMMfuPvCfVFcWc3QiYS03MwXE=;
 b=ZVwlOkyO7IIa1eFn7j7UkMM2thZNnkjqKQpmlzHvVM5QJP13QMbu1wjFBawKwoRejru3rrIp8
 GqR2Z0pfIk/AyY7UdivrejV7vTPCyjqdlQRNTt941QICosw8IwGxWPF
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Authority-Analysis: v=2.4 cv=W8sIkxWk c=1 sm=1 tr=0 ts=6a6ce03a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=p54jq0OH07X71X_IsjoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEzNiBTYWx0ZWRfX0IKLWp9V3ZAx
 jNWPS0C3QeuDHqrBAktbTCouX2Kr5yk5V61REs2mqAVm3CbHkZhXlurwJmapazPXpBo9Y3V7iGn
 S4Ez28epNiBv//y15a4mfJlFq62T1RA=
X-Proofpoint-ORIG-GUID: d1_BIrFjOgpm9aBAyUqlh2fIWWj5pIJb
X-Proofpoint-GUID: d1_BIrFjOgpm9aBAyUqlh2fIWWj5pIJb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEzNiBTYWx0ZWRfXyBmTFTMnFryG
 v+w6lLI+JCy4X8IBzej/Hxsg4AGHT6lW0VbfhBucRkyEDmqVtSbc2Dk0p3qmA8FF2UZ9VEn8Xhk
 36cX0iWlP2r35WLXj8YxmhOhrhrRBIbPh6WZsJZ3S5G0aVAl3DLjeSV795T6LaW2dHD6ueaAeOG
 M9KaX3yDR+8Hm83G5n4hx2+RfvppG4aFR2IyrxBlvjOBfguv+RHP8rkVFBiXMMkJY9l3VJ+3qbS
 P00LLhElUB5jql1nPQRluYsO35Tc3avu2fEyVFVoeT+foknIHs2sXKSVjwMW1FJGB1PryaPjvA/
 y639n5+g9PExJC8F82oyGA0EKyaFeFYpOuWKxnRrgjPLWUXmk5sxN77Xslx7+O5ulF98fMGvxEt
 xoUgFNwMZD5VtnlJsHuPDMJ3KCB7LBsWOx14lIcs1ThlePVxTY00LuHNUzK577PM+oI+HvvGIDN
 pPoyvmKp3/KgXJLmP8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_104949_111203_E2153A94 
X-CRM114-Status: GOOD (  18.22  )
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
 drivers/pinctrl/pinctrl-scmi.c | 78 +++++++++++++++++++++++-------------------
 1 file changed, 42 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 3461c5712613..032b23fa17e0 100644
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
@@ -454,6 +421,41 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx,
 	return 0;
 }
 
+static int pinctrl_scmi_get_groups(struct scmi_pinctrl *pmx,
+				   struct pinctrl_dev *pctldev)
+{
+	unsigned int nr_groups, nr_pins, i;
+	const unsigned int *pins;
+	unsigned int *pins_cpy;
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
+		pins_cpy = devm_kmemdup(pmx->dev, pins,
+						 nr_pins * sizeof(*pins), GFP_KERNEL);
+		if (!pins_cpy)
+			return -ENOMEM;
+
+		ret = pinctrl_generic_add_group(pctldev, gname, pins_cpy,
+						nr_pins, NULL);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int pinctrl_scmi_get_pins(struct scmi_pinctrl *pmx,
 				 struct pinctrl_desc *desc)
 {
@@ -538,6 +540,10 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register pinctrl\n");
 
+	ret = pinctrl_scmi_get_groups(pmx, pmx->pctldev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register groups\n");
+
 	ret = pinctrl_scmi_get_functions(pmx, pmx->pctldev);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register functions\n");

-- 
2.43.0


