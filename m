Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D42CC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 15:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URETtrpK8wuvrqfyx7NJrivdefwUx3tTphYnqoPD05M=; b=YRfRexo7xBqUZR6j2OYn+y3Qga
	Dp7L0nN3HN94IlKesVyBd851/BSSwuzkJB/wPYr7E3k1KQtWwvbH7L7Twl77Mt1IKDTczeEC3b9v0
	B8FpNDsryHO0/IB8+hO7f2RvagD9Mmiy5HwhSldc7lxJaLydLBisZqnx6kC7k9XGZWyK5SgyrFR3y
	dVypQ0PowKnBd2ktxFoFYp0v6eQkBB7MlY8w370Ph2jRIGe+uOzW8VaAHyugVaXz+VS7GWu6unHmK
	1RKgDf5kaobRgEBWE1ZP5R/iem92Gel8fMbBsmnqc4s3CGRpA3gqyQ5T+iLoyUb3bO6iFlc9YzR/s
	cmqaDClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68CF-000000045DK-1lOI;
	Mon, 14 Sep 2026 15:02:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68C5-0000000455Q-270q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 15:02:06 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0RQS1761295
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=URETtrpK8wu
	vrqfyx7NJrivdefwUx3tTphYnqoPD05M=; b=TGM2mxMilAx7vd3fRxJbN0wvoHc
	QX1cwbvlMV4uEdNfYpqJfLnAcSSVBHfRlveU/jqBWhW7q1cy8O8aMBihyywOBMMh
	3x4smFRgifFppnJXY78YJkt7v8MiAo6VCKpLe/ySZ16IhSVeEP9DIGH/QCJUiBFz
	0T/pm9w2guxrf8wvaz3b1qpyE9e7xm8FJb+mwctPVmzGUtzIyYtjL+pgrZ/R0KHh
	qHzuioJlhSqFEamDDK0WpC3t+9AkS10xKuVViNYzHpcCuAeCTYNTCUYhFEi4GYkR
	5cv+DQ/CD50L2Y6Z/G/KVIlQp1PTOVZd6bfWkQYBlmmZnwNll/Xz5/WmTXA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex98my-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:02:04 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6c07dcbe60eso3918787eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 08:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398124; x=1790002924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=URETtrpK8wuvrqfyx7NJrivdefwUx3tTphYnqoPD05M=;
        b=W796Ky2aIaYCFSbbA7mAy2P8Z3ws3FICu+OmouP3aKpz0dbdK04G6QGp3wO4MEpyt1
         UuPBFYO77cZialu76pzcg/pW1UoS1PbxNoVG4gBUbiFYdtH9nWMu2gPD+ahkSVhM/kok
         yQhs9A6/v6v6xlXsg7yeZj48UsBv/FeXHO+24qj+AxUoO/y3Gp+/6B8896hWkx5UFIkj
         tHrFzuTo5eF41cKjpGpdjUR0kW3IDRsT5Uj7bYgQPKSY06xykOF/s1Kv9Rmnx3b0khNV
         3NuzdSmWgAsQWtmMgDq4WIz5OMABYTQtbrn/5Co/wGYJcHPeVw3soKlN7Ijx4y4/NQnp
         Ij2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398124; x=1790002924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=URETtrpK8wuvrqfyx7NJrivdefwUx3tTphYnqoPD05M=;
        b=HY8gavRWQ02fwR4Mni0SiPC2u428DdlPl2MH5+Of58tRfrvYqTAmWdLnaRcHF/CnWO
         6eUgUlcMBagWlnYIzzGp1rtwYdhQH+PGQ+23NkWlwIlV7cq6uEPBFj7bgZruBJIx69JT
         emIZ+GiJTNjGK0h9dpvCMhTUTubhThVAS8OuWz8pm570gSQy2lIFzFwrKcak5ywEkxgJ
         ieaZIjXZbkeAYQYd1JsSgUFw3tP8ZD1QgVtwaoG7HyOW0WwmkeArao77pfY0yZbCGwqw
         aQ4/vuLyxqbVbvq+R3T2Qmr+RgtTprz1CRM75SQ4lTvrTCIvLZycLLzo1gREG6k4sAAC
         39ag==
X-Forwarded-Encrypted: i=1; AKwUvBygx5kJe2dx2UwTke3ZsUka4tId6D1m6e/d2kHqDAcfPYbrXtIm10Gn7lXWMBMuKrdCSZIZmPNVMZEivnvPjPBg@lists.infradead.org
X-Gm-Message-State: AFuF++ngzdExZJoXbKbCRPXtfKTBDNyiFtC7CnciWqXeiI+o5b4cA3tH
	c4heEVj2gzfEzEkhRjMc0ksJ9tmyJ+r+VWnFTv/SxtwBJ6B61k2cBx/nxf5u8qxsxZ7XPCNPmuD
	hZ7FIg3m0JtCOF+N0909XAivtDvKbKxKmuElNus7Sn8j67cy0r6j5AvTDJ10zvfcFi3s2nR2kcC
	gHOw==
X-Gm-Gg: AYBFou22FzYoRWVC+eQAqKJugWPvAWXPY8Iz61TwPQHHKZ4rUnDTBh9l5TB5vcxDCEb
	GD4D7pQdg5tA/IqvVTKSmNQ0ewE5V9NCi26xj1D5FnuDS14z/tb+Ohjf1sbCiasLiAHKD4yL6HK
	cTgeziBVMZnJabIOwbPbvZQslJHx2t1iiTpPhQFhF7owMNRm8Whbn0CfX0AKLqf+gPCndG7n8dv
	UXC2TYp8NRnYSVnx72UXb9HLPXbDfuT0ET5uNuAaoHvwll4Z1DDjHwyvX8OyMwoki+tLdjzII2M
	0bQOF8mvCidixgwc0aXgPrqCosSnWktnhnRFDzFx+On1R+oez1zTeNR5kvk9beo6lgAU+79Hf45
	3Nlv8p4TVxH1fvqlkyGiLXXHKL0ABxyndpdb/PMaPRrcXqz1dpl/9xltiGg==
X-Received: by 2002:a05:6820:f008:b0:6be:68eb:e0a2 with SMTP id 006d021491bc7-6c540087048mr1536986eaf.9.1789398123588;
        Mon, 14 Sep 2026 08:02:03 -0700 (PDT)
X-Received: by 2002:a05:6820:f008:b0:6be:68eb:e0a2 with SMTP id 006d021491bc7-6c540087048mr1536758eaf.9.1789398121612;
        Mon, 14 Sep 2026 08:02:01 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608480esm468632666b.36.2026.09.14.08.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:02:00 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Dhruva Gole <goledhruva@gmail.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/5] pmdomain: core: Add a genpd config to support unknown initial status
Date: Mon, 14 Sep 2026 17:01:39 +0200
Message-ID: <20260914150146.187622-4-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
References: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX2VkVzJC6sMSH
 CPN8eTsa9XMqzIjJcS+sYwzyG6FpQHDd0X0yYUGRuYeArjrBOEKJQRL9O8W8b+qgyTaJMNjSaLE
 95gYZsO+VYide/hvqrgxAK9KicKS2ZOmBh4BZGasZQ6YnihBrLKw3lArc8Md5ETsGFJBzQ5J1ab
 CDGfVuZqyon0lmm0mazavjtbtm73agjn135eKgFzkWmj0RP2DcRZeEZn0QxBNSzebBcC3Dig8ke
 1GTCVoMOa2Hz0Eom8nHrotmnFSmMcn5CMYJ7lf8GJUxn+eoyaiVSla/qYcSzl+NYWkfFvimPoad
 IwR9VzIn9zaVIBL31KPrfx/UIN8t4DYGfT0AYocxbdWcH4M7XRrkKJPrOpotdHyMbqR5SGtUdmv
 ZIlVJ/q0fijejABuCsikB55Hp0PLJKaqsSs1uX5EcSuCvfRWKVk87BppP195fyWMedndocl6NmR
 gzs6RzD/un85vgrfh7w==
X-Proofpoint-GUID: 9HMspNiHB68n_-pEpgteriBYf2x6JanS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX9DuctQf8MDLV
 EskVilU/dt09NgwFfMzVQa62HNgPq1hcxwsXpNXP0XOMtq+Kj46Wsp82ZK5/lCZtZUKouuv0cC7
 r38aOqF6bbWX/1H2OIinH+DI/GjjDsw=
X-Proofpoint-ORIG-GUID: 9HMspNiHB68n_-pEpgteriBYf2x6JanS
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa80c6c cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=EPyTabgPSFAr6pNicGcA:9
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_080205_566856_A2432D1D 
X-CRM114-Status: GOOD (  22.49  )
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
Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Reviewed-by: Dhruva Gole <goledhruva@gmail.com>
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v4:
	- None.
Changes in v3:
	- None.
Changes in v2:
	- Rename the config to GENPD_FLAG_POWER_UNKNOWN.

---
 drivers/pmdomain/core.c   | 6 +++++-
 include/linux/pm_domain.h | 9 +++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index c593a3479ad0..e8473f5339e5 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -189,6 +189,7 @@ static const struct genpd_lock_ops genpd_raw_spin_ops = {
 #define genpd_is_dev_name_fw(genpd)	(genpd->flags & GENPD_FLAG_DEV_NAME_FW)
 #define genpd_is_no_sync_state(genpd)	(genpd->flags & GENPD_FLAG_NO_SYNC_STATE)
 #define genpd_is_no_stay_on(genpd)	(genpd->flags & GENPD_FLAG_NO_STAY_ON)
+#define genpd_is_power_unknown(genpd)	(genpd->flags & GENPD_FLAG_POWER_UNKNOWN)
 
 static inline bool irq_safe_dev_in_sleep_domain(struct device *dev,
 		const struct generic_pm_domain *genpd)
@@ -2445,7 +2446,10 @@ static void genpd_lock_init(struct generic_pm_domain *genpd)
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


