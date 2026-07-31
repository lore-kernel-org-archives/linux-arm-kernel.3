Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD9CC5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 17:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSAAlowZ86yqSXeWEh90qTyf5MHp+UJ1MM9Zn1kuXew=; b=zr/hq68KGkeqTs0ue0WzPVX1Kf
	EFS2n4KmuxJ1Wqd9GZ5CsELImgcotuFA6fz9LexB8X7W3oUXdGkkoen4SHC5xzeO6BouZX73ApKVY
	rEM2b1eULDxwlLfOVmdQsU70Nk/epiZj7H/zN7V+s4bCrIqgoU+Zu5wB27W1/YsYkGTveqQRYrHuh
	uynAoomtoIPoN7963hp9kOQ/TLoUa0OU7THAX/luhTIyK8FLusZ8VypCRpv4OLuzNYQaxfpj+gWeU
	dScLuGjE3lUOy5j0JJ702+04g3t6srsnr8i6B4CxXa+8MUuV/BShrtMnGw90EHiShphd/CdaumUAD
	j35Zff+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprN1-0000000DHwV-2D86;
	Fri, 31 Jul 2026 17:50:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprMl-0000000DHpc-0QHv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 17:49:52 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFODpe353526
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 17:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tSAAlowZ86yqSXeWEh90qTyf5MHp+UJ1MM9Zn1kuXew=; b=SCCgDtbPn/0pvI7X
	7oZHuDNnHEWedh/1xdjLZRXBQ3QKjoMVoRw/z367aP4DyrZIT9AddK/FiIY5bQs0
	4nVYy47dIOxXY20zPuy6+0twgl8SAdgZ9d7JuOJonPHfaicAmo3crG6L1tdQNF66
	QminziSJfvT3jfIDuBOcREEx+9Hbt0UT8ZBuO5SPVpCQ+iQmfAAePeNZ57B1S3h7
	rB4QyfggSNILQvfDvAIuEbjd4zpMV7/Ao1eINvXzdrk51OynIo3rn8mKBZteeh/w
	xNkgV043OqrAAs5Piay7CwuQjRpcd8XxLT2CWANxyedrbF+ya3vdkKrgDj1/XjDd
	QNVbag==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru481dkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 17:49:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cab041eced3so1843530a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 10:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785520184; x=1786124984; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSAAlowZ86yqSXeWEh90qTyf5MHp+UJ1MM9Zn1kuXew=;
        b=Tw6H3LF/Ftl56ctPbaNP86+v2SunegARgIOB2dnjzGwcQn9EMJCNGWPPgBLl+NqU6Y
         bOqa0trPz0X6tC1AhOoSbopxMvILjrjJecpGmNOa+BIr0WsiFT3Z1zQbanMaIJX3WiCc
         qoEdydjQ013m0ax20lVWsQKlPnKz14UmTWQ4BkYSpdQOOrVPRjYXk+BrLbcrOnJhUnQh
         Jif07/tVAcUA0zf2K6Wh5YjKPYS6U1ksD/nhgavmQrXgV/zsFJC/zUnjITD2MRN17cgf
         IDqrL8dFXy9mgBaGPqwEC2dS18kHWP+Jh5ealvKtzF13n4eI0dWrTer/eShl+wvXWQUp
         LWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785520184; x=1786124984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSAAlowZ86yqSXeWEh90qTyf5MHp+UJ1MM9Zn1kuXew=;
        b=LZTqoxgquf2BQ6w2cfm9Mlm42jnyVe23kwuvGX2JZ8r0OuBMXaAobMmXoNAGWUvSHj
         795qwk7Z8BGMkT0kNiJt2+Jy/6xTD7PY+UQ7tKsnE0YEX5dzrLI//mI9HwdjoWRr6O9a
         9qqVR1t2nIU4CL/kBoK67h8QHBRvQlNSQfWbVXLEI7MkmNo49aAujTNVj0zQThqnRnls
         2QFfJ9ZnG8v6FJwKytJrm8eZoDGs7y8o6mrYNnzX3MeMLRwFi6ufSSiuikUNYWXHg6I+
         tAMoWh5j59HvSHddQUTXV5gUJXfbbO0jgfMt2Br7WG2jemfExI0wDNcDIx4tPmmCm4RM
         AGEg==
X-Forwarded-Encrypted: i=1; AHgh+RrdKQYiA6LlJZE0NEBaU6pQwksIVt2m7BXkIWgv6xvM97WL7nMRRtoITlj40jiAw1AQHEl1yfDXw/BR2Vy2qKmx@lists.infradead.org
X-Gm-Message-State: AOJu0YwGUkMxbsGJLaGzRUv6syz4UOiQV3dUPGSvfnfUvGKxAJsHkbgf
	p6RWYDClhpYgyqFsMKzGwHK9V7xIINKS0o9R6OcFtFSPKnNaep8TLZG0kGsEk+Rf/kZaOC+Az5s
	IEv9UVO9jpH+BNt9xMQmpG8dT/ENYXzd3q8oj+jSAGUKDFFnAeIP9hrnRNFfkcOyBPTbYn6tu9w
	G2cw==
X-Gm-Gg: AR+sD13ywlTexYVfu97Fn2QwIpkWGzbHKl3vjE8AxGLvfoHf4iV5mnwPiLIeCUm93YW
	g3mxBAFX8ia1ovizhNE0zIgAsEWIAW2xtjIhZE0PIZoDJNd6O7+5WxVvKQuDVVQfj+0jEe/j69+
	Nu4V1Lu1l4iQ0CMlvSq0ahsorLiK3e7pKM9pHqxYPWo5XVk8TKiaYAe74FDQFU1RFfEXdNKSpej
	2vkeaGEgqzapHdTX3M+LpMX/XXPhPIYtCoHnG3F526kq7dtwocyZFcWBSr/C9bl9YeVGUyXiuof
	1K3cAUoJ0QeNJlPCekF/OZ1UDfsrYpPpCyTdYYNSui/5YVE/BPrNJMjVSxz3rjJ02tXRAlrI0qJ
	Wf2gTKMGA3LVBucIhfBKIEC19pfgM6pdHqEimaLXErFJ/zFmlXg==
X-Received: by 2002:a05:6a21:6cc4:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3c92a4c4549mr644106637.2.1785520183919;
        Fri, 31 Jul 2026 10:49:43 -0700 (PDT)
X-Received: by 2002:a05:6a21:6cc4:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3c92a4c4549mr644078637.2.1785520183476;
        Fri, 31 Jul 2026 10:49:43 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm15115660eec.28.2026.07.31.10.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 10:49:41 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:49:32 -0700
Subject: [PATCH 1/2] pinctrl: scmi: Replace pinmux ops get function info
 with generics
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-scmi-pinctrl-generics-v1-1-8affd2b79a6b@oss.qualcomm.com>
References: <20260731-scmi-pinctrl-generics-v1-0-8affd2b79a6b@oss.qualcomm.com>
In-Reply-To: <20260731-scmi-pinctrl-generics-v1-0-8affd2b79a6b@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785520175; l=5835;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=hFOq1CDEAsqbExwdsyEP1OMcEWRCkKK59IVp1eM9m4k=;
 b=YW37xt59ApjrJzArsi3FRwyV8uJOJ34f2F/W7M1mwo+f7JB3cR6tY4+EAAT7aVkxiMGX8/K46
 i/iJj0IRqkwCgg/hNmdfXQ5R7yI2p2yqGVmgkDiegCwgeUsuB4bL6DE
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Authority-Analysis: v=2.4 cv=IJsyzAvG c=1 sm=1 tr=0 ts=6a6ce03d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7RNIVtV6K-S_ttmQ72cA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEzNiBTYWx0ZWRfXzNS8QpG85NaH
 nsQC7TnLj7UK0yC1xmVeTV6r1kOO9CnHlPrBNfkvPly/rZDwe62wQSjLI0NkXFj5HC9tgrt0QV8
 zVdrm/3CcG0ByPMj6mOIi6GK9BZjZQs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEzNiBTYWx0ZWRfX8KuQZzFESd88
 BpC7e0ARMfK2HNPU6ch/XtbV9bb7zLRp3PVWfK4aqX9AoWIc5mqXAzPhW4FbQjqsobqhln5A+g0
 4KW8aLWyezf+sQ7ZbCaM3+8pDVRvtUWE44dFOcMqoS/HIdVDjOymkvDJbgT0w0qns9NYcqtbtFc
 SLvQ8XNWIBFQyR1dfcI/TMmtXx7+wGMONYWGXQv6RcjUwiWUzGHm6pCiE5LQyjkUj4V9yZCKcQy
 oBvHWJ1SIZEsbiEVn9sUq3oE6uK4C8dCATNF8WFfaiQG3SaoxaWpnaQnl/aFTKrLxOLf04Orl2P
 xtfKvbCGK+nt7hzwtEw1fb1jij/bw6Si+PZ5H8R+MvV/0G5rx2qKy+7VTzQdgDqfrVQnJ9krhcV
 LFLGicGvNLQ/sDPSDogZoKv2kmwbfut2JlSIu+C7nhvU6Y/oCSTLTr3bHHiYQW1c7747QPXRU8W
 9xx6eFuYvr1fF2nMR4w==
X-Proofpoint-GUID: Wv9GTxVaKS_ePE3geAVitIAy9pOvCbjk
X-Proofpoint-ORIG-GUID: Wv9GTxVaKS_ePE3geAVitIAy9pOvCbjk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_104951_262301_3D1C8E55 
X-CRM114-Status: GOOD (  20.51  )
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
 drivers/pinctrl/pinctrl-scmi.c | 145 ++++++++++++++++-------------------------
 1 file changed, 55 insertions(+), 90 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 1bb36ca477b7..3461c5712613 100644
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
 
@@ -487,6 +406,54 @@ static const struct pinconf_ops pinctrl_scmi_pinconf_ops = {
 	.pin_config_config_dbg_show = pinconf_generic_dump_config,
 };
 
+static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx,
+				      struct pinctrl_dev *pctldev)
+{
+	const unsigned int *group_ids;
+	unsigned int nr_funcs, nr_groups;
+	const char **gnames;
+	const char *fname;
+	unsigned int i, j;
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
+			return -EINVAL;
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
+		ret = pinmux_generic_add_function(pctldev, fname, gnames,
+						  nr_groups, NULL);
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
@@ -571,11 +538,9 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register pinctrl\n");
 
-	pmx->nr_functions = pinctrl_scmi_get_functions_count(pmx->pctldev);
-	pmx->functions = devm_kcalloc(dev, pmx->nr_functions,
-				      sizeof(*pmx->functions), GFP_KERNEL);
-	if (!pmx->functions)
-		return -ENOMEM;
+	ret = pinctrl_scmi_get_functions(pmx, pmx->pctldev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register functions\n");
 
 	return pinctrl_enable(pmx->pctldev);
 }

-- 
2.43.0


