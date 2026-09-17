Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD73DC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 22:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7nsXF2Z4lia4oXjOVDfCPan6jxoQ/loYfy7cjdmcqM=; b=0VpCazTTHtGYCZ0xFDlXXqekjt
	eK3qLei+8fmvqv2tAt8PDSiugMGF1c7q5nOyGXf4ORFr5XhZgTFYDaR66QPwMwaN2NXqLfo+Hog4z
	rUSBB/gwgGDkEPStL62fL0SAFNxHO0E79qpejf/C5rj7zzG0JdvBileK3wlYTfSUnNsIuerfbZRN0
	XhIffnT0UrlhWKAYpgbs2fg8eOWMXU2lEKU8BFHvWKR45t5jdMUPKi0OzHRfb0dVP7ZvTTeB+Nglr
	dbX7za0uzkLRPfc3+N0tXpVROU1uJ0YMeHV9KO6WkWZOw3cf3RTXnYXcrD7gSiVh/v3P+Rq08kwEk
	IOLBBL3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7L1v-0000000CiZw-2HlW;
	Thu, 17 Sep 2026 22:56:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7L1s-0000000CiYY-2KaP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 22:56:33 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HLG8SY3271962
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 22:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J7nsXF2Z4lia4oXjOVDfCPan6jxoQ/loYfy7cjdmcqM=; b=i6zQYDYNfjHPrl1g
	5vH+ELw+xnpblF/N4iTi2VBhuhSFq1fOVG9rCcenaTtJ98V7G3n4zIKKQyTAEQ70
	Hn32oYtW91QeaQ5ADGJ1o7UJmRa5sw9ZkGNngWalTud8YJZ5OJxY+axkPp0FRYYP
	9bhCA2GTbKJaR/MZve5wO65mb3/IqAJYRiNYekOWeADp739p2npSogB+Xnx8+RqV
	Ckt/sgXgJiovCTlQq8SnJwLP/4USTtIEou4JB6x8UsThUQojqCeEwveyNCCFmHFq
	/+O1vpjiLbFXYVFOASMMtJadztClV2/v4du8iYkeI5TSibYTPXFc4vwSO3/VqQ+e
	2BohCA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfppjxa1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 22:56:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so228046a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 15:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789685790; x=1790290590; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J7nsXF2Z4lia4oXjOVDfCPan6jxoQ/loYfy7cjdmcqM=;
        b=gIuqW2l3OcAdFC0puMgiaUw2N4zNw9ASDYbP5/MyItv+C7gc2FdyYZbQmOWzOCVlL8
         nV07RGP5s+0q6JKcJVkSbKOtHyWuhKNtHLIZaUkYLSXAK/Ff0DIp3nwK68yClL7U4YOa
         ZJQB1iMXhFGls7hVC5Veh8wJKeaCqHoRQWi7RBzV+OVH5VR77oZnQwb2ZLiSsGrdY8gz
         aOr3xme7MKFQdoZsJ06UJ19NaJ13JjShu/3lbTES6DNKCwtQp7vSLBqgfMMEHK0HxynR
         2FZKosIBPtecmwyL2B+1UUphAJKryoFVpGWwUF4nFZktAhTql4xf7eCcV080GlHIv7gX
         dSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789685790; x=1790290590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7nsXF2Z4lia4oXjOVDfCPan6jxoQ/loYfy7cjdmcqM=;
        b=RNP0uZ0XE8k0cBzhawS1C/8jA+WbM5Fdr5TcDISKQ8DEhDQ0G8TI2J2f5KYpHN4874
         /bxZ5hUeW4asdDagDw/B7IVn/NOYOd0dHlyHR6fFCeEDUbB+9F3ZXxiEj2RcNlcPd5Uw
         Zq8zbjxraN2dhwZf9DWue/3+0BeUVlgE94lEiNWlcctl9r0QeH5KLyeP+cDzDxPK8eqt
         Et87mcQs91a3tI4q3GeQXr0Oh995go/ay3GS57/svXpPj0YrKcht+unnSagPAZXGqR9s
         gFeQ8PavoYO0MhWuRLCGmqEweSg+hPkrpAcQiKAi/k4iitQvWc5pcllt7Mshiz5SxErP
         W+RQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWuGgkJGBg6z42X+Sfia6FMx7+kOLhcnsLWCVGXvlgTL1FhY3LCTzsRQaFXh6K8eDUFsYzmfcF3K7rk8NDcIWu@lists.infradead.org
X-Gm-Message-State: AFuF++nHEYESAJCXmW4doxF2sM3Pc2fQIyTzZEgC1BLpH1Ap5G3/a1hP
	vIvrX+B9Mw3i/M/U9HlEiTchxOW+/IuJTH14T5lebNTCTSueosQE9GoPOf9UK5zgLIiEn696yD2
	m0rZxtslou0RkRbBQINxT9KE8Hb3SaQF90TNmx5CqJqDJc+9HqMTo82SpS/giJphmu3nCv/ZPW1
	+v2Q==
X-Gm-Gg: AYBFou1ntG0TW11AETO48jN4azsF7JHE74w2W8BNBrQp9zAToId/ZfmcFanJjxNQI1J
	yHfv7I/oMyvVV+m/ZG0n9h5IGbK2fmN+MxmfXBuGhRppGe+nxIOtzEGmS+UK55Zvt+DoSOdTW+3
	/VIAxt6bpMzfeaFWAgJ7Rk+wNihyCcsVc/zoxjDo9oNv89MHMbDj28B7tB168woInBGuZf8w38r
	nAef22ZWkcJUDcAZ6gFZmgRa6csM3HrtgC3bqzu+3/lZlByD/7iUhpr1W94FrYksxiM69OGCwwe
	kKEclTM9tNT+CD9dXJh/d+pFU75QfVtcGr2RO7koH7/iFDH6MtaCD7mn7g9of9Gh1rlhHPYlpjy
	A82bBk4h/a0ebXo+uDXA2xU4x6XSwcbW38DwND6YfqshZkLL/sA==
X-Received: by 2002:a17:90b:4b86:b0:39e:21a7:5dfe with SMTP id 98e67ed59e1d1-39e54c5a1ecmr1907553a91.3.1789685790449;
        Thu, 17 Sep 2026 15:56:30 -0700 (PDT)
X-Received: by 2002:a17:90b:4b86:b0:39e:21a7:5dfe with SMTP id 98e67ed59e1d1-39e54c5a1ecmr1907494a91.3.1789685790018;
        Thu, 17 Sep 2026 15:56:30 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ad25bbsm15812508eec.19.2026.09.17.15.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:56:29 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 15:55:55 -0700
Subject: [PATCH v2 1/3] pinctrl: scmi: Replace pinmux ops get function info
 with generics
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-scmi-pinctrl-generics-v2-1-3eeee364257f@oss.qualcomm.com>
References: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
In-Reply-To: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789685788; l=5982;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=z5RFOzgzYC5TMMNQ/B5mfSfzp/qgDLgpH4puOuz6SZY=;
 b=z6GlfoSGVm6PAPyRMTs3NzhhJxzNWc7Bio6PS3ZgwyQBgw8We6XbHDFa/j3avlkk4mTqD5BNA
 yZYS043YWskBeLrKMskg46fUfRRunglLlsss29Wg6T50KyNvhDMYfDH
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Proofpoint-GUID: UgpZyfebJam0ovIo9oY4UoHEe9zv6E1m
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aac701f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7RNIVtV6K-S_ttmQ72cA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: UgpZyfebJam0ovIo9oY4UoHEe9zv6E1m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDMzMCBTYWx0ZWRfX0zLIq9eRtkMd
 9+07Cp60iNLTG+khZjqEoTnN2UFdjenKraDTpllpJSP6Ag9IVNZsZ1BFcey+oYh09+1ynBAzUv/
 fUFIZI0ysF0On/9pP+8EIyy8XVA+Xe/SV8URRgb8h8ODow5H+FZfkQ0rMEuAQvVroBdnhl/OFW+
 otMpSyVPNFlYJENKiB5adl+ODfFNmgRsajV/oSlvlNG7eSgg1XOwbJGn94nhWuWtzBdfFZPtwU2
 K1kxTu9CSC/1i+0qJ8Jh7KlHXRCcw9/w8/obBj0V44NOXf0tQVGBUZrVxmDq8X5XOjpWEmmecMr
 VBb7hkSBg2MOQ2e/JE/oA9ctvqFjSEwOWuqsGHlINtNVS4ayxFMgY0AHPI+nSL1okIIJ+qVSkRG
 fhCIthXOYgA+XH2JHuqkgr/jaCSSQHlaPLI7/okRHmoLOjWMyPf1gLeMOeI7BgH2AOYe5c76VQP
 vbb/GraNkj6TzW1ArKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDMzMCBTYWx0ZWRfX+2uAnRACsOc9
 Q8RvbNtgHKb1aEYiVjBtW79jRiTPZWtFB5dWZ2ko2Y2Q0P31ogO9FC/7xmkFb7bbed27tfPbtwZ
 xBqG8pvVm+9yYZunIFFxXnPadAdD8RY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170330
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_155632_715144_A5777022 
X-CRM114-Status: GOOD (  21.32  )
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

During probe, populate the pinctrl device with function info
so that the generic callbacks can be used to fetch function
count, name, and groups. Remove locally stored functions
since caching them in this driver is no longer needed.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 151 +++++++++++++++++------------------------
 1 file changed, 61 insertions(+), 90 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 1bb36ca477b7..1d85a16f300d 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -24,6 +24,7 @@
 #include "pinctrl-utils.h"
 #include "core.h"
 #include "pinconf.h"
+#include "pinmux.h"
 
 #define DRV_NAME "scmi-pinctrl"
 
@@ -37,8 +38,6 @@ struct scmi_pinctrl {
 	struct scmi_protocol_handle *ph;
 	struct pinctrl_dev *pctldev;
 	struct pinctrl_desc pctl_desc;
-	struct pinfunction *functions;
-	unsigned int nr_functions;
 };
 
 static int pinctrl_scmi_get_groups_count(struct pinctrl_dev *pctldev)
@@ -84,86 +83,6 @@ static const struct pinctrl_ops pinctrl_scmi_pinctrl_ops = {
 #endif
 };
 
-static int pinctrl_scmi_get_functions_count(struct pinctrl_dev *pctldev)
-{
-	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
-
-	return pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
-}
-
-static const char *pinctrl_scmi_get_function_name(struct pinctrl_dev *pctldev,
-						  unsigned int selector)
-{
-	int ret;
-	const char *name;
-	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
-
-	ret = pinctrl_ops->name_get(pmx->ph, selector, FUNCTION_TYPE, &name);
-	if (ret) {
-		dev_err(pmx->dev, "get name failed with err %d", ret);
-		return NULL;
-	}
-
-	return name;
-}
-
-static int pinctrl_scmi_get_function_groups(struct pinctrl_dev *pctldev,
-					    unsigned int selector,
-					    const char * const **p_groups,
-					    unsigned int * const p_num_groups)
-{
-	struct pinfunction *func;
-	const unsigned int *group_ids;
-	unsigned int num_groups;
-	const char **groups;
-	int ret, i;
-	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
-
-	if (!p_groups || !p_num_groups)
-		return -EINVAL;
-
-	if (selector >= pmx->nr_functions)
-		return -EINVAL;
-
-	func = &pmx->functions[selector];
-	if (func->ngroups)
-		goto done;
-
-	ret = pinctrl_ops->function_groups_get(pmx->ph, selector, &num_groups,
-					       &group_ids);
-	if (ret) {
-		dev_err(pmx->dev, "Unable to get function groups, err %d", ret);
-		return ret;
-	}
-	if (!num_groups)
-		return -EINVAL;
-
-	groups = kcalloc(num_groups, sizeof(*groups), GFP_KERNEL);
-	if (!groups)
-		return -ENOMEM;
-
-	for (i = 0; i < num_groups; i++) {
-		groups[i] = pinctrl_scmi_get_group_name(pctldev, group_ids[i]);
-		if (!groups[i]) {
-			ret = -EINVAL;
-			goto err_free;
-		}
-	}
-
-	func->ngroups = num_groups;
-	func->groups = groups;
-done:
-	*p_groups = func->groups;
-	*p_num_groups = func->ngroups;
-
-	return 0;
-
-err_free:
-	kfree(groups);
-
-	return ret;
-}
-
 static int pinctrl_scmi_func_set_mux(struct pinctrl_dev *pctldev,
 				     unsigned int selector, unsigned int group)
 {
@@ -190,9 +109,9 @@ static int pinctrl_scmi_free(struct pinctrl_dev *pctldev, unsigned int offset)
 static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.request = pinctrl_scmi_request,
 	.free = pinctrl_scmi_free,
-	.get_functions_count = pinctrl_scmi_get_functions_count,
-	.get_function_name = pinctrl_scmi_get_function_name,
-	.get_function_groups = pinctrl_scmi_get_function_groups,
+	.get_functions_count = pinmux_generic_get_function_count,
+	.get_function_name = pinmux_generic_get_function_name,
+	.get_function_groups = pinmux_generic_get_function_groups,
 	.set_mux = pinctrl_scmi_func_set_mux,
 };
 
@@ -487,6 +406,60 @@ static const struct pinconf_ops pinctrl_scmi_pinconf_ops = {
 	.pin_config_config_dbg_show = pinconf_generic_dump_config,
 };
 
+static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
+{
+	unsigned int nr_funcs, nr_groups, i, j;
+	const unsigned int *group_ids;
+	const char *fname;
+	const char **gnames;
+	int ret;
+
+	nr_funcs = pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
+
+	for (i = 0; i < nr_funcs; i++) {
+		ret = pinctrl_ops->name_get(pmx->ph, i, FUNCTION_TYPE,
+					    &fname);
+		if (ret)
+			return ret;
+
+		ret = pinctrl_ops->function_groups_get(pmx->ph, i,
+						       &nr_groups,
+						       &group_ids);
+		if (ret)
+			return ret;
+
+		if (!nr_groups)
+			dev_warn(pmx->dev,
+				 "Function %s contains no groups\n",
+				 fname);
+
+		gnames = devm_kmalloc_array(pmx->dev, nr_groups,
+					    sizeof(*gnames), GFP_KERNEL);
+		if (!gnames)
+			return -ENOMEM;
+
+		for (j = 0; j < nr_groups; j++) {
+			ret = pinctrl_ops->name_get(pmx->ph, group_ids[j],
+						    GROUP_TYPE, &gnames[j]);
+			if (ret)
+				return ret;
+		}
+
+		ret = pinmux_generic_add_function(pmx->pctldev, fname, gnames,
+				  nr_groups, NULL);
+		if (ret < 0)
+			return ret;
+		if (ret != i) {
+			dev_err(pmx->dev,
+				"Duplicate function name: %s index: %u selector: %d\n",
+				fname, i, ret);
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
@@ -571,11 +544,9 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register pinctrl\n");
 
-	pmx->nr_functions = pinctrl_scmi_get_functions_count(pmx->pctldev);
-	pmx->functions = devm_kcalloc(dev, pmx->nr_functions,
-				      sizeof(*pmx->functions), GFP_KERNEL);
-	if (!pmx->functions)
-		return -ENOMEM;
+	ret = pinctrl_scmi_get_functions(pmx);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register functions\n");
 
 	return pinctrl_enable(pmx->pctldev);
 }

-- 
2.43.0


