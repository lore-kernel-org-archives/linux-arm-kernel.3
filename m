Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D97EC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 11:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uMpBv2fRBJds8dHrhYUMdWkn5lQ9prASbg0GWZNOMRc=; b=JuO3F8vrxt8OxFyc58FufqpFph
	Q3cT0W7aIOIarahsjcvuvpo67k9ruOn5o/+Ph0Yyo4qBoQAMGd5O3A5qhdplR7N6Ai/25RYZhKSH6
	AM6ud9c+QBGQKvISTxdFSF7PzcrKutT1GTvpEYFOaFrCEm5y9FTxa6bv5tPhpm3tJSokQcO0kfWJf
	O6ED3H1PE73SnnMJv071MGWlZmKUrZigmYMA+lzbY5zy92P0kd8Pj2o3X7bK08yqna4CsMSYXl0jQ
	4D56nEtb1/uBq49YVtd+DUHlJcxaLryp+hFVDFQbosTPPuuJOIKoCwVBXZZFteSBKbAWVHf50P8bh
	9KSrJE1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XLg-00000006cUr-3hUF;
	Mon, 07 Sep 2026 11:17:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XLe-00000006cUO-1WFC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 11:17:15 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An3mU3873334
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 11:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uMpBv2fRBJd
	s8dHrhYUMdWkn5lQ9prASbg0GWZNOMRc=; b=e9E0eb5fQtChLbGgluVBn5yBJzG
	X0C/+XM2EPfeutvph+M/8GNqEgAIICjC0QGqwezaFPuT4bVwDncPRHhQGliD/znA
	SnjZjPxrs+suLrWdz+2KhEPbE1i37VCJ0HTCy7U4kk8yEYq2Wc/gUkD8Lj3WxflA
	Fnl/EZXHQYoL2eiKAzohK9GaC4axH0rqzpjrdRtKE6+iQSFEMh76cxxYQ2DhFHM6
	96kLjObHC4lOkSWlznpnC7xF9dxDdN7+LNUgnIc7b4LFg/+h2wkZhl/pfEiNvlqr
	Cv706Vrz3XDtb15sUSqdX/Oa0BQh7FaufilNr835ZoHeJKRmac0811ZTZ9w==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj1rj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 11:17:13 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97e9e1dd7fbso2711297241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 04:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788779833; x=1789384633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uMpBv2fRBJds8dHrhYUMdWkn5lQ9prASbg0GWZNOMRc=;
        b=ZDwAmjErjuaVIj/K0aR+xN007lozVAXvUzXRsag2ZPQ+TAHpQikaR7Gd4xVQCLFmnQ
         Oec2Xo1w0Po9JjwaXq7gC2WzW135zWDisvQtGWG2ohetF18JgXm1HMzYff/L8oHvPmZF
         XlWywGUuNbLjG0DK8trTbymSAJrwsTXg2+iCWt8iydUfYrFvN0PzWGSIWTJSbGP7ypl1
         NCSDF496Cr4Nl/Mo7qe5dFD0XomBQ24qykxWc5QEJLy21yTagrTlAAdmKFcp9sSBThde
         bQbwtAh4fyhINHDfoX2ZVF/2bjeKhz3/fokxjmevlc3P6xuo5xx+GfPUFDO8Wgh5pEe6
         uuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779833; x=1789384633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uMpBv2fRBJds8dHrhYUMdWkn5lQ9prASbg0GWZNOMRc=;
        b=Lh/ayt/qKzlvT+bdV0HA0kyw42GMIwPDJuvGB5xxIqQZuX4dce3ct9rKA4Lzi1mcLl
         9oln7IuaRtk0LT3d72c6i3DY72Q6rRKXlIiuPrwWlE4gdU1J/mEukB3mt36yzVxLCbKf
         d19lpuFj/wrwzF28+DWqoA13YZXTQwuQMNRtkPCMfyHaOEn8HqGqrFY/cTIR8sbsEuqv
         OyQsUAFQgmXMQKP+CiFRFGyz49FRbJA831D6bY3DBxfzzqtgYnDls+xDNB5d9EiCHXZx
         qqBaotSbM2BMskUpyFS/Mvo1Ws3jYLWXE+RsJ2llAg/bn6efDBu5Rw7ixK9sudAnn7GG
         262g==
X-Forwarded-Encrypted: i=1; AKwUvBxpZJ18nw/0y5ETgTWQlWoLep9WiCICW4CK4xOL7DgK315C4dxm5tuOacsZVLrAJ7pe4S8YnKse55Aw5eiJLmtA@lists.infradead.org
X-Gm-Message-State: AFuF++n/+2Jm1o6On4xo99W/eweN2XVvpQfMmDYZHP0Y6xyTchhLgVO4
	wvrKPsuIX932gYhzO20GROA3tMVuFpesosHHOO5+8aRp2rihGDkEvmLBnUrp2w86rzCBNWR6VSV
	4n8/DwZ1xjdrmNQVEL0ntfaILyi2XYc1sBN22OFeft14VLTqNnzdQ/mfK5T4Go/nOKpRZPQDIfI
	exww==
X-Gm-Gg: AYBFou2Reyt//c8CrcPQ3GU8QXwnq+2rgONtmEIz4pKtj5r5p9z4WsJJiL4bit1QVCf
	63iw9OZIXrJ3DOkt7EfZvH/M1DN1J1vFurwspx0WVJCTdDQiHJJK1bRpuY/amaOmgGh4u0nARsT
	1CsznTnZdELDHqwTEXd0ihtfyYTuyOu4GKfBq2X6hZF/UsWhUQHEsF8vO78mDUHJio/taHfZJ66
	4SrRVwOrBkFSa1K7peYJTK+13ukdTCFMy34JxkRUWax5y/Vmj0dkLZrZonthcbrskUcMtXcuYOw
	DB0jJBiJYuxKlJd2Wu0gdm1kykttfeWdIq/Ya7AlWgcbEtc1LrzahnLlmRau0tW57wM0Z9HI3Wf
	J7WVzXMiXd5a9YXDotd1lO6xOWFgA93HmQ4AFc003h+k5hkTrHdTQx1DdHg==
X-Received: by 2002:a05:6102:2c8e:b0:785:b0ac:54bb with SMTP id ada2fe7eead31-78a4a9eebcbmr7883339137.7.1788779832755;
        Mon, 07 Sep 2026 04:17:12 -0700 (PDT)
X-Received: by 2002:a05:6102:2c8e:b0:785:b0ac:54bb with SMTP id ada2fe7eead31-78a4a9eebcbmr7883320137.7.1788779832329;
        Mon, 07 Sep 2026 04:17:12 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cfaa2sm456120066b.59.2026.09.07.04.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:17:11 -0700 (PDT)
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
Subject: [PATCH v3 1/5] pmdomain: core: Rename genpd_status_on()
Date: Mon,  7 Sep 2026 13:16:51 +0200
Message-ID: <20260907111659.263324-2-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
References: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyNCBTYWx0ZWRfX0qmqC1VArHWJ
 YcDSwhOxYog1bAFS8yCLJv1F/T2a8jJmELbkhSz5EyTIZzTdP5DWmjmr+MNbhB8vkTQz1yMwn0I
 3Y+bL4Ky1TDAXo1iUt23/ct+kWbPUUaJXNYlxr2JX1M23zvF2ILxK/jmX4eAMMIlwU+AtCWCbaF
 7mz7cIsXvbGnlMNBz2RPoz7VLXy7DiSCmUEM8nxEf7u/Z/Sggd+NqN8qEihspKyEdQee1MEqNqi
 NWcRYiHTu6rTfa5YaMP6jW/bJtQP81qLFkmvIwo5/gArjK2Mi85ZZFiD9qgFNUGDbAxbKi6Lsej
 Y1mqj1DpF7MXqr9Tjgw3rnQTuXLVvn9lW7iB4+FVb6Ch60yZBxhFGlkzg2e+mm9RxqW8L3iET+t
 xttIETO0+WjfKDgB4TZSil+sCwatwU5uex73gc8uJPcCoz1KXQaxT0Irk1hfgrjo9296y4W/lc6
 Nis1lDSmzldty3Cv7qw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyNCBTYWx0ZWRfX6mvMy+3OtE49
 60MJ13sQJOOwf4dhWxpz19HigEHbL0HFsdzEwDM84dNrsjHQdPY8vGhXeLK0uQgfmGIMvLIVLH2
 aNW6NjcL8nqmzckRx3bikUAs9nO435k=
X-Proofpoint-ORIG-GUID: A-aQsO4hU8YmHQxavWtvJN5sKCogX7yJ
X-Proofpoint-GUID: A-aQsO4hU8YmHQxavWtvJN5sKCogX7yJ
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e9d39 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=zIFADOUqQBSm_Ft5s84A:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_041714_403629_D328EB42 
X-CRM114-Status: GOOD (  23.52  )
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

Rename the genpd_status_on() to genpd_status_on_unlocked() to make the name
available for a lock taking wrapper introduced by a subsequent change.

Suggested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Reviewed-by: Dhruva Gole <goledhruva@gmail.com>
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v3:
	- Updated a comment in the code and the commit message.

Changes in v2:
	- New patch.
---
 drivers/pmdomain/core.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 052ec478dfcc..6abe8b198949 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -173,7 +173,7 @@ static const struct genpd_lock_ops genpd_raw_spin_ops = {
 #define genpd_lock_interruptible(p)	p->lock_ops->lock_interruptible(p)
 #define genpd_unlock(p)			p->lock_ops->unlock(p)
 
-#define genpd_status_on(genpd)		(genpd->status == GENPD_STATE_ON)
+#define genpd_status_on_unlocked(genpd)	(genpd->status == GENPD_STATE_ON)
 #define genpd_is_irq_safe(genpd)	(genpd->flags & GENPD_FLAG_IRQ_SAFE)
 #define genpd_is_always_on(genpd)	(genpd->flags & GENPD_FLAG_ALWAYS_ON)
 #define genpd_is_active_wakeup(genpd)	(genpd->flags & GENPD_FLAG_ACTIVE_WAKEUP)
@@ -771,8 +771,7 @@ EXPORT_SYMBOL_GPL(dev_pm_genpd_rpm_always_on);
  * @dev: Device to get the current power status
  *
  * This function checks whether the generic power domain associated with the
- * given device is on or not by verifying if genpd_status_on equals
- * GENPD_STATE_ON.
+ * given device is on or not by checking if genpd->status equals GENPD_STATE_ON.
  *
  * Note: this function returns the power status of the genpd at the time of the
  * call. The power status may change after due to activity from other devices
@@ -791,7 +790,7 @@ bool dev_pm_genpd_is_on(struct device *dev)
 		return false;
 
 	genpd_lock(genpd);
-	is_on = genpd_status_on(genpd);
+	is_on = genpd_status_on_unlocked(genpd);
 	genpd_unlock(genpd);
 
 	return is_on;
@@ -963,7 +962,7 @@ static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
 	 * The domain was on at boot and still need to stay on.
 	 * The domain has a subdomain being powered on.
 	 */
-	if (!genpd_status_on(genpd) || genpd->prepared_count > 0 ||
+	if (!genpd_status_on_unlocked(genpd) || genpd->prepared_count > 0 ||
 	    genpd_is_always_on(genpd) || genpd_is_rpm_always_on(genpd) ||
 	    genpd->stay_on || atomic_read(&genpd->sd_count) > 0)
 		return;
@@ -1040,7 +1039,7 @@ static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
 	struct gpd_link *link;
 	int ret = 0;
 
-	if (genpd_status_on(genpd))
+	if (genpd_status_on_unlocked(genpd))
 		return 0;
 
 	/* Reflect over the entered idle-states residency for debugfs. */
@@ -1406,7 +1405,7 @@ static void genpd_sync_power_off(struct generic_pm_domain *genpd, bool use_lock,
 {
 	struct gpd_link *link;
 
-	if (!genpd_status_on(genpd) || genpd_is_always_on(genpd))
+	if (!genpd_status_on_unlocked(genpd) || genpd_is_always_on(genpd))
 		return;
 
 	if (genpd->suspended_count != genpd->device_count
@@ -1472,7 +1471,7 @@ static void genpd_sync_power_on(struct generic_pm_domain *genpd, bool use_lock,
 {
 	struct gpd_link *link;
 
-	if (genpd_status_on(genpd))
+	if (genpd_status_on_unlocked(genpd))
 		return;
 
 	list_for_each_entry(link, &genpd->child_links, child_node) {
@@ -2170,7 +2169,8 @@ static int genpd_add_subdomain(struct generic_pm_domain *genpd,
 	genpd_lock(subdomain);
 	genpd_lock_nested(genpd, SINGLE_DEPTH_NESTING);
 
-	if (!genpd_status_on(genpd) && genpd_status_on(subdomain)) {
+	if (!genpd_status_on_unlocked(genpd) &&
+	    genpd_status_on_unlocked(subdomain)) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -2186,7 +2186,7 @@ static int genpd_add_subdomain(struct generic_pm_domain *genpd,
 	list_add_tail(&link->parent_node, &genpd->parent_links);
 	link->child = subdomain;
 	list_add_tail(&link->child_node, &subdomain->child_links);
-	if (genpd_status_on(subdomain))
+	if (genpd_status_on_unlocked(subdomain))
 		genpd_sd_counter_inc(genpd);
 
  out:
@@ -2246,7 +2246,7 @@ int pm_genpd_remove_subdomain(struct generic_pm_domain *genpd,
 		list_del(&link->parent_node);
 		list_del(&link->child_node);
 		kfree(link);
-		if (genpd_status_on(subdomain))
+		if (genpd_status_on_unlocked(subdomain))
 			genpd_sd_counter_dec(genpd);
 
 		ret = 0;
@@ -2441,7 +2441,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
 
 	/* Always-on domains must be powered on at initialization. */
 	if ((genpd_is_always_on(genpd) || genpd_is_rpm_always_on(genpd)) &&
-			!genpd_status_on(genpd)) {
+			!genpd_status_on_unlocked(genpd)) {
 		pr_err("always-on PM domain %s is not on\n", genpd->name);
 		return -EINVAL;
 	}
@@ -3839,7 +3839,7 @@ static int genpd_summary_one(struct seq_file *s,
 
 	if (WARN_ON(genpd->status >= ARRAY_SIZE(status_lookup)))
 		goto exit;
-	if (!genpd_status_on(genpd))
+	if (!genpd_status_on_unlocked(genpd))
 		snprintf(state, sizeof(state), "%s-%u",
 			 status_lookup[genpd->status], genpd->state_idx);
 	else
-- 
2.43.0


