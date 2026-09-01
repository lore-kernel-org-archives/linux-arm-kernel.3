Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545F0C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 11:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wgxn1wZhT0NrhGkRx1mSbVXgq+sQ60RV9XXpk9+v1FM=; b=F6YihYzgA0hS/mMKImorEbTf1d
	9Pb1/bmjJCSYjcIO9JsoxxdB0sAqko+0HcUL+JfjZaUeimO4XTcWXRqXk+RnFAJtb4GX0D55EUeuU
	voQxzJFAKa8b0hPBpJ+haYY3TTZzf3QR10IfmW7QJ6M13zi+rJE6OPb0A7oaP+2iT/V/mP5X/rP3s
	6+/L9KYHeMWdfln+yHIOfCmVHy4BUgMnZwB8oWXUAzxBG3GH+bF1CLYOsKcU8mLuiBZeWoFQgOJE5
	VuYjt60C14Pq504/bpIAWMcg8re9L6+8rscR1hZl74mxUIIASIWy7sSLjPwftxyAVs8XJ4sO1fGk/
	F0b7XN2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1MS7-0000000BfOt-42Ur;
	Tue, 01 Sep 2026 11:14:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1MS5-0000000BfNY-2FLS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 11:14:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJdxR1713071
	for <linux-arm-kernel@lists.infradead.org>; Tue, 1 Sep 2026 11:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Wgxn1wZhT0N
	rhGkRx1mSbVXgq+sQ60RV9XXpk9+v1FM=; b=ZtjxUl+TZMYLq8Cqrgv7Pc3hAlg
	T5L5/NhQiGa5Alp+8xCacMPuHvkSxsRHBbEr2CRdHT8RAdsGXkgtoiq7yu0F6Wme
	Y00DUGZ3sVLDQf+mG4/Jo1nP6wAGtEQZ8iZkhHjq3KT1P4+/YNBCceyjkkc0ebhU
	1wbboXW5GZzgdOPBlyUk1mr35dWXakRuFrUbD04D/ImDRHyPjaqVUt9H949c6RxV
	nh3SempganQ9T7QgtwnPzEvk1AUxemB8k4hdppVPFLWj6Jb10YcChtSrXok1M2lB
	FZuPRG5zqTA4bcCxSdJs6LUHSdYvJApwNLHdlPs22LYUp5qOVL6AqcVucxw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndxa6us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 11:14:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936708f129aso611754685a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 04:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788261292; x=1788866092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wgxn1wZhT0NrhGkRx1mSbVXgq+sQ60RV9XXpk9+v1FM=;
        b=gfXHeijzbz1yQTCyaKJkRv+Aw46/7Y61RPu2GG8bqp6VgkCAXRoS0VVCE/q8Cpvwnr
         yEeqCWGNkch0ZCj8k/my27e+TLCZoET0DASQcViKPCXOad+xwhUNco1MZrE6BgyiBD8h
         K2eCG+3VOCnQ/rMINWW9puBYA0bluXC1OOHuU9ULklAXRZnNGFdtE2Ifg+PijsUNFRN7
         UiYbHJ2NTwm9LmOpbRC8xcw3L5BFJ/amrRjFAIucETk9pWlxS382vh0SQJlCJzu6YzT9
         X9XmrZocmkiBNvdYq4HhmG9hga4XAghcrLaaWPZAbKf+6LHlRy1zqV0UPhQiYrju09WU
         umhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261292; x=1788866092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wgxn1wZhT0NrhGkRx1mSbVXgq+sQ60RV9XXpk9+v1FM=;
        b=j1Oh+bWqQ9SQ8cB+g/c+UBETryIhGA/gy3KSM07yiT8mcwasPVrZm2Ks+C9yXMxVX0
         ngCYEX4OSAr4AmlSh43+3T7ELVOraZS+EeYtB8dTruwoaH5E9wVTUaMSN5OE9mm9zZfb
         8X6B+OLXNmdjy1l3aienR70BVjy51/YeRQkYonc0ZQnzHA7m2A+ZKvcPv7Y+oPNhAz+I
         f1xSWozdbUOHrlTZDblQfD0mxNs8v1SA/HeXas7lrHiVIm9L+NGWd6OKl6J1pMFV8f5J
         TloPW6CInQ8k5LZHETsup2skFggYk5edvByaSqRMKFOEY/G9ZgLHZ4cpATdqsNe2cxs+
         klGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqd0z9riIN6QQhMg2d4rQsn6irzvt89YeVfSwoitJM//AmEeGWR619SlvMIHDEFKKlt5WKaEhacRj9Jl49SpwgQ@lists.infradead.org
X-Gm-Message-State: AFuF++lUtf2tnYfOfCEdBUOUqXPepXQESMm20rnOuddO/gLhRlvwQXKR
	KDOZpFg3Efy3ZxxWEZ9XNWzL1PD56hGGHau3Z3vpXRtQ9+pcURdCKw+1ky1LqfRDNxAXTEl+qrz
	kCc0DB/79aZUDd9FZdvZS70Q/rsBRddLy6TNyYbjXhEA8Djw1rDAflY9ZQasYxEDWcdrC+FGpt7
	1t7Q==
X-Gm-Gg: AR+sD10wCKTpArPt9tYAs9hy92AUVxsxa49bV5RuNO4MTIFHrziGIL6Uyj7TNAhLb4T
	u+g5OKxRwmbRsr6/zBed8YgeKhlV89/VGDChzqU3LWOJKETYDldtAbO0vsbOuicckpMgyfrsPZC
	Ze12ewPlECCc1f+v7FLbYDqzJG1Sf7FqXBxCkjZ93HpVULkLwGdM3WiZUChQpk2eaU7uTF3VuXF
	tsrRrrjJS8PbOKhn319obVcdFS+w1re4ObkvLKGO0/Zq/Xv4qRhEeYglZBE8XCJOYEHgOzJQO1p
	L2DNQnlUEww7cEVEHym3eW+Jd8IDJA7OUWckGZYynp/NUSt4wlqD3gPTEN9+4Zr/qE8HWO8dWb1
	pREiXtlqe5sT5OlJ8VLzlEr+ICOiN1vzhIFxJ6ZzKdJ7zG5sLfhy5/2Lshw==
X-Received: by 2002:a05:620a:4391:b0:915:c4de:7ac0 with SMTP id af79cd13be357-939481572fcmr979054385a.31.1788261291548;
        Tue, 01 Sep 2026 04:14:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4391:b0:915:c4de:7ac0 with SMTP id af79cd13be357-939481572fcmr979045885a.31.1788261290897;
        Tue, 01 Sep 2026 04:14:50 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25878ba94csm380686366b.47.2026.09.01.04.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:14:49 -0700 (PDT)
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
Subject: [PATCH v2 1/5] pmdomain: core: Rename genpd_status_on()
Date: Tue,  1 Sep 2026 13:14:04 +0200
Message-ID: <20260901111441.122436-2-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
References: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0-2XiAHzivyMHgl3C9pO8MM-tHodNDsL
X-Proofpoint-ORIG-GUID: 0-2XiAHzivyMHgl3C9pO8MM-tHodNDsL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfXxpm7nY3qzdBr
 ZbWvItlcK5BkWlgPLqME/avjsXSb8trVp/bmHPljHeyXFCz9IOC+QRX5yetrUwScVlrN4dCbIIX
 ZpuZiRbOqVypxaGW2wDi817ZJ7E6mcw=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a96b3ac cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=X7f39YHs1J5G0y9puJsA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfX7myNZ24nR/l1
 tMWNsOlb73XDxIfP+vnQtAPhD6TJvmsI9iVbeIHme/f3rLEq+EOTgbFQY5fEjq3dxx1PwWPyjVL
 6c0/TsOgSpAXuDB4nhO1B2lp/1qikTUSDLLde5Racpzp4iiLIzfpVW0gch+mE5Dl5xBR/tlkGZS
 lt1bss6s0T23ldMOIcDUrHhcLmZRgktz28YhXjImV9Osm90gnMuuyeI3i8YKsiDa5kHpcx3DFte
 rj6h6nAOPiVyFCNL5pbvBVybuLKXV01ftbBrP4knODP+ENzO3RblIxnRt54SkniIly0nEy/44pD
 faCFL2Nfm86y7rhEAmEou9H17mrInElmqqSJUELCyRnrbRCY+LOqI1WH3oO98W+PcsscCzI38OL
 RIcAjLKRT1FwmW314WfYDc0h2lsD6be439zdaLXnKSX/5QAFTmwgMbuKzwhrbcF4BoRwgpDjJEU
 ujVWBdx289nvmHh3Lig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_041453_691726_B89D0382 
X-CRM114-Status: GOOD (  22.92  )
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

Let's rename the internal function genpd_status_on() to
genpd_status_on_unlocked() to clarify its use.

Suggested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v2:
	- New patch.

---
 drivers/pmdomain/core.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 842c4169e290..6ac1ce18fda3 100644
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
@@ -771,7 +771,7 @@ EXPORT_SYMBOL_GPL(dev_pm_genpd_rpm_always_on);
  * @dev: Device to get the current power status
  *
  * This function checks whether the generic power domain associated with the
- * given device is on or not by verifying if genpd_status_on equals
+ * given device is on or not by verifying if genpd_status_on_unlocked equals
  * GENPD_STATE_ON.
  *
  * Note: this function returns the power status of the genpd at the time of the
@@ -791,7 +791,7 @@ bool dev_pm_genpd_is_on(struct device *dev)
 		return false;
 
 	genpd_lock(genpd);
-	is_on = genpd_status_on(genpd);
+	is_on = genpd_status_on_unlocked(genpd);
 	genpd_unlock(genpd);
 
 	return is_on;
@@ -963,7 +963,7 @@ static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
 	 * The domain was on at boot and still need to stay on.
 	 * The domain has a subdomain being powered on.
 	 */
-	if (!genpd_status_on(genpd) || genpd->prepared_count > 0 ||
+	if (!genpd_status_on_unlocked(genpd) || genpd->prepared_count > 0 ||
 	    genpd_is_always_on(genpd) || genpd_is_rpm_always_on(genpd) ||
 	    genpd->stay_on || atomic_read(&genpd->sd_count) > 0)
 		return;
@@ -1040,7 +1040,7 @@ static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
 	struct gpd_link *link;
 	int ret = 0;
 
-	if (genpd_status_on(genpd))
+	if (genpd_status_on_unlocked(genpd))
 		return 0;
 
 	/* Reflect over the entered idle-states residency for debugfs. */
@@ -1406,7 +1406,7 @@ static void genpd_sync_power_off(struct generic_pm_domain *genpd, bool use_lock,
 {
 	struct gpd_link *link;
 
-	if (!genpd_status_on(genpd) || genpd_is_always_on(genpd))
+	if (!genpd_status_on_unlocked(genpd) || genpd_is_always_on(genpd))
 		return;
 
 	if (genpd->suspended_count != genpd->device_count
@@ -1472,7 +1472,7 @@ static void genpd_sync_power_on(struct generic_pm_domain *genpd, bool use_lock,
 {
 	struct gpd_link *link;
 
-	if (genpd_status_on(genpd))
+	if (genpd_status_on_unlocked(genpd))
 		return;
 
 	list_for_each_entry(link, &genpd->child_links, child_node) {
@@ -2170,7 +2170,8 @@ static int genpd_add_subdomain(struct generic_pm_domain *genpd,
 	genpd_lock(subdomain);
 	genpd_lock_nested(genpd, SINGLE_DEPTH_NESTING);
 
-	if (!genpd_status_on(genpd) && genpd_status_on(subdomain)) {
+	if (!genpd_status_on_unlocked(genpd) &&
+	    genpd_status_on_unlocked(subdomain)) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -2186,7 +2187,7 @@ static int genpd_add_subdomain(struct generic_pm_domain *genpd,
 	list_add_tail(&link->parent_node, &genpd->parent_links);
 	link->child = subdomain;
 	list_add_tail(&link->child_node, &subdomain->child_links);
-	if (genpd_status_on(subdomain))
+	if (genpd_status_on_unlocked(subdomain))
 		genpd_sd_counter_inc(genpd);
 
  out:
@@ -2246,7 +2247,7 @@ int pm_genpd_remove_subdomain(struct generic_pm_domain *genpd,
 		list_del(&link->parent_node);
 		list_del(&link->child_node);
 		kfree(link);
-		if (genpd_status_on(subdomain))
+		if (genpd_status_on_unlocked(subdomain))
 			genpd_sd_counter_dec(genpd);
 
 		ret = 0;
@@ -2441,7 +2442,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
 
 	/* Always-on domains must be powered on at initialization. */
 	if ((genpd_is_always_on(genpd) || genpd_is_rpm_always_on(genpd)) &&
-			!genpd_status_on(genpd)) {
+			!genpd_status_on_unlocked(genpd)) {
 		pr_err("always-on PM domain %s is not on\n", genpd->name);
 		return -EINVAL;
 	}
@@ -3839,7 +3840,7 @@ static int genpd_summary_one(struct seq_file *s,
 
 	if (WARN_ON(genpd->status >= ARRAY_SIZE(status_lookup)))
 		goto exit;
-	if (!genpd_status_on(genpd))
+	if (!genpd_status_on_unlocked(genpd))
 		snprintf(state, sizeof(state), "%s-%u",
 			 status_lookup[genpd->status], genpd->state_idx);
 	else
-- 
2.43.0


