Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F433C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 11:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0M1/i8At8MRHYTLPNKxinaL7xQ5Kl0z3c2DGIUIcW8=; b=PrUPYR3bQdhbPiVt6xaY5a7ObU
	JKJ661AZWziqQe7+/64hfzJrx/VZoSgp8GwPUPjIcO2FPEVIkDZ36NSsnty9e++6T8UXTGYQk+JBu
	sQ34nO694x18IOi7NkSpdA6KVYenbVQvwFMQaZEVnGKxorQDyy7ib4D8LSpTDihi9a+HL/XY0y9b2
	eByhuGiu+9dvUxPJxx67bLkgZsf44AaZaasGBYjLVQ62uwuAASRbxOJs8y8b5rA3iJdmWl4owtr87
	G43izU/DU0O3U4Vb92zAPKHMnN9S/4jDKK2C2PCUEutKUV7EYjjHzGZkZaMpeyrw3uIVxvXF6lUhF
	Jx0h+k4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1MSD-0000000BfSv-1CIc;
	Tue, 01 Sep 2026 11:15:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1MSA-0000000BfQA-0K7d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 11:14:59 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJb4d2406399
	for <linux-arm-kernel@lists.infradead.org>; Tue, 1 Sep 2026 11:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=q0M1/i8At8M
	RHYTLPNKxinaL7xQ5Kl0z3c2DGIUIcW8=; b=IuaJlwfipDJoonpbRW/ok/pUvvr
	5WMO6PumCPnzFqgT3+7otQ16uevtO8GYBDpyedqFeQd67drLybPjWzPYJIIgM3v4
	SxAxcCc7ysuZyWdbRertcd9z9jAqyd4RzhzPj/Lbfa3+VeMWALCnzbB2ogPDKzyl
	e0McRxVfGWI16M61RLySFH2h2n+OeHiQ7kEBSWdWsTWieckf5rvCBQfg+PHjQFbN
	Ipw/9TeOOyALk+Ks0TxKculoG9GY5xzPMg0CuXGPE8NsMc3O9ApIGW3QxrN2StEq
	4iW5j7H9wAIpA36G4DqqgdGUGD71yLl9Hc82VzECjOwzXbpUVQ5VGRX7rMA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r2077-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 11:14:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so156062985a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 04:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788261296; x=1788866096; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0M1/i8At8MRHYTLPNKxinaL7xQ5Kl0z3c2DGIUIcW8=;
        b=FHBxrOErfgwIOwz5vJp0B5uRC4PfiOatVCo4zUfCJEAO87lQcyLiECeCCf7gqXDOED
         TSp3RiGii0pKJlAT/qUgR+5Ga+ijD581i9ONw4f4SmesMSrql1TlU7O/vf5mY53zX5D7
         ZA2Zq0wfaDKUNiJ6DMKIgfPxxjQc2kgIu1cegG/fXMI5SE2Ze96V3JWcav+5VVCubol/
         zzdz0B3vxtZIrk3yyeM72BfXAnN+tmqNM2AwLFSxzEqFyBDw2s9VKEagAt7u6hlnX/fe
         UI+XcXRXJaAvXDp+r93wuRpisaLLfMqr6SQ/Jxc2M90zI18mEgr9ti5lzwNlVR9PoOTo
         KChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261296; x=1788866096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q0M1/i8At8MRHYTLPNKxinaL7xQ5Kl0z3c2DGIUIcW8=;
        b=GGSJsSy6qgBQWpnf2QOfh9kTX43af75YFqcE8AFneZRWX9B8WGRTbmzSX8WT2tGT0S
         711D1dT2iW5KykTnW9K0W/sk3ZRMwYOKbR/qmrsaa+kZ0TkuHGsAJpj0cC8qIKAtBTPx
         apGOjnDahDKq6SepCDEcjqreFKyDoyI3C4hlmuWE6n6RE1ZVJKqXPgcWg0YRz1owOOsK
         y0ROmeoLnN2boRHkqV6KN07yHY9pSwtt0WT8NGQW/4i6Wp81IFBpUBA2VQ2OESSRjVAU
         nfwpJQPiiLCqGEjYUihW25RjysusI5hFo1uZo+cU3GQFa4IKMz/VEMp/+dTZzQ4GhVG2
         92Zg==
X-Forwarded-Encrypted: i=1; AHgh+RpivtfLhHG1YhGCLMLHPHWvaYVv12+nOWvt0VsN+JJ4oOv964dcMr+KMqMvSKvDxVFWl4jd/MpnCKkQemMZQIHB@lists.infradead.org
X-Gm-Message-State: AFuF++nhNDDL51rAgTctneGC/ECa9Pw1X9i7SHFCAyj5wphFHqtqod/1
	9vM2xpAGOJuh504Sfei7tLw7Xur+tTu3ccxyHasiU08wsn2hwA1IXlD816Wt9rZpkonjviCJ5Da
	uwf+DxNIR8cxeIyyAkogbO/GG0YjQ0gwy9jAgqVLemQExzPbon4KIk0vuj3vIi4ip17GA7o/i2U
	kVNw==
X-Gm-Gg: AR+sD12iJf2wvLrKVRFj5gh0cCPASEerjUjjAOgeCCR7JOtaojq/wYLU8tM3hyzpLr4
	7y5V6UsSaaGGAccku6ifN1DyrdPvRPDMGLCyUsB/9thHyWn9789Hb6PFkveHAUBrkuQD+bWhMCH
	AbxTxD3m4DxK6wf/NC9d0IAkqyNE5B6gH+LBGKqVw4CAvTvCYyjiFMo+DcTDVeWJfehIQ49UQW6
	dOxKAr4PWqQJHEL0GPFrrR4p30hDV4BsQJYob3b4RLL+0ELMg5YnwxvVSi7fuB8X1fAOfSncnLN
	F5gU7QckLV7tMaDXR0+4WZFREmLWzUBVscOWbBAdbqZ3OFP2gjnri8IkI9AGOwmG2TrTTU8G8a4
	Ycpusd8Pg7LZJGdhtnBaPn7/t2S0WARIZIxhw/1QtUGdDcrg6NJ3uKeXzyQ==
X-Received: by 2002:a05:620a:84c7:b0:939:4bee:f84b with SMTP id af79cd13be357-9394beeff4dmr560894085a.9.1788261296346;
        Tue, 01 Sep 2026 04:14:56 -0700 (PDT)
X-Received: by 2002:a05:620a:84c7:b0:939:4bee:f84b with SMTP id af79cd13be357-9394beeff4dmr560885885a.9.1788261295699;
        Tue, 01 Sep 2026 04:14:55 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25878ba94csm380686366b.47.2026.09.01.04.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:14:54 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] pmdomain: core: Add a genpd config to support unknown initial status
Date: Tue,  1 Sep 2026 13:14:06 +0200
Message-ID: <20260901111441.122436-4-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
References: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a96b3b1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=EPyTabgPSFAr6pNicGcA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfX3euyKd/Vkjbz
 FlVvsMDP/ntP0bQird8WvMxt9+9fD17aUA4Ptc1M6b6DyCKmZEjkL/c2TElOHKu5Vj4sWqKnGFe
 ZXkK4CHTma0m3KWahLYl0qCB3xXyvaFLi2GgNpvs0kKbJlFo9L/UjVByRHBJJglp7jzfngJmkFI
 yfcp94M0thya52pxZUJffRQQc95Sa7qGQPAZv+iRLqoqJHxEGeadD6MEEn8R1QFOY5tZd8j8H+E
 rmLfVwAshSC1wXI/QT682+CqvwiqArypXNeXQ2GrESPkCYMSy2yUJsR7u+h5o1EXUVl2gJ759vx
 esBbxWAuJ3tiKYIKLO1t/lg+ItJhkUgWYWT/cN6sB40FMki4y15HzkJ4QBnWa7WIAiDJTRALXu6
 zoSB30ALc6dS55jY4K68SHAxFlfqP4aw2N09vOBRv9N3aorBoKB/LcG5iVqo1z4zzhDoelJ/6a/
 reLv6/xnBzJhBoN+JLA==
X-Proofpoint-GUID: K3PmrfTCELFj0cWqxFgxmSzxj6yq56bi
X-Proofpoint-ORIG-GUID: K3PmrfTCELFj0cWqxFgxmSzxj6yq56bi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfX2knnQzrOSu+P
 lgkEIwPcPYak27vn/e452kpPXocRZHJKasOzRuAZ9zny8+ngS98oXLq0rZxC5ZlkW8ZgYrIrdPH
 gben4buWtDglD81KV/kGAblbvnuZUeI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_041458_240585_B34FB225 
X-CRM114-Status: GOOD (  23.26  )
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

It's not always possible for a genpd provider to know the initial status
for its corresponding PM domain(s). To register the PM domain in a safe
state, the genpd provider driver may therefore have to initialize the
genpd's status to be powered off, as a way to prevent the PM domain from
being used when it actually could be powered off.

In these cases we may end up to power on a PM domain through the genpd
subsystem, while from the HW point of view it may already be powered on.
Under these circumstances, it may also be required to keep the PM domain
powered on until all the consumer devices have been probed. In other words,
until the ->sync_state() callback for the genpd provider in question have
been called.

To support this behaviour for a genpd provider, let's introduce a new genpd
configuration, GENPD_FLAG_POWER_UNKNOWN.

Reported-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Link: https://lore.kernel.org/all/20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com/
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v2:
	- Rename the config to GENPD_FLAG_POWER_UNKNOWN.

---
 drivers/pmdomain/core.c   | 6 +++++-
 include/linux/pm_domain.h | 9 +++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 97273ed2f825..ab6110885175 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -189,6 +189,7 @@ static const struct genpd_lock_ops genpd_raw_spin_ops = {
 #define genpd_is_dev_name_fw(genpd)	(genpd->flags & GENPD_FLAG_DEV_NAME_FW)
 #define genpd_is_no_sync_state(genpd)	(genpd->flags & GENPD_FLAG_NO_SYNC_STATE)
 #define genpd_is_no_stay_on(genpd)	(genpd->flags & GENPD_FLAG_NO_STAY_ON)
+#define genpd_is_power_unknown(genpd)	(genpd->flags & GENPD_FLAG_POWER_UNKNOWN)
 
 static inline bool irq_safe_dev_in_sleep_domain(struct device *dev,
 		const struct generic_pm_domain *genpd)
@@ -2446,7 +2447,10 @@ static void genpd_lock_init(struct generic_pm_domain *genpd)
 #ifdef CONFIG_PM_GENERIC_DOMAINS_OF
 static void genpd_set_stay_on(struct generic_pm_domain *genpd, bool is_off)
 {
-	genpd->stay_on = !genpd_is_no_stay_on(genpd) && !is_off;
+	if (genpd_is_power_unknown(genpd))
+		genpd->stay_on = is_off;
+	else
+		genpd->stay_on = !genpd_is_no_stay_on(genpd) && !is_off;
 }
 #else
 static void genpd_set_stay_on(struct generic_pm_domain *genpd, bool is_off)
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index f925614aebdb..14e0e346c610 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -121,6 +121,14 @@ struct dev_pm_domain_list {
  *				powered-off until the ->sync_state() callback is
  *				invoked. This flag informs genpd to allow a
  *				power-off without waiting for ->sync_state().
+ *
+ * GENPD_FLAG_POWER_UNKNOWN:	Use this flag to inform	genpd that its initial
+ *				status for the PM domain is set to powered off,
+ *				which may not correctly reflect the state of the
+ *				HW, as it's unknown. If the PM domain becomes
+ *				powered on during boot, genpd will prevent it
+ *				from being powered off until the ->sync_state
+ *				callback is invoked for it.
  */
 #define GENPD_FLAG_PM_CLK	 (1U << 0)
 #define GENPD_FLAG_IRQ_SAFE	 (1U << 1)
@@ -133,6 +141,7 @@ struct dev_pm_domain_list {
 #define GENPD_FLAG_DEV_NAME_FW	 (1U << 8)
 #define GENPD_FLAG_NO_SYNC_STATE (1U << 9)
 #define GENPD_FLAG_NO_STAY_ON	 (1U << 10)
+#define GENPD_FLAG_POWER_UNKNOWN (1U << 11)
 
 enum gpd_status {
 	GENPD_STATE_ON = 0,	/* PM domain is on */
-- 
2.43.0


