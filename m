Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A282C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 15:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R64vMYngif0QtgmjSIX7fHGd4GXjWW4gNyDbeqBJOZ4=; b=PYK0N23vcPmAHXcmYMJMwWSNcC
	t+6yAc+XejX1+JFIfTfK5zJ6Igocv9LMFNGBX7CL7r17CbVleiPR403yi6Xb2gJ18MytG2reRzISs
	Tik6T2m3lyx8qMJBOZzluyzkQfp+U3S4TyvExNkQUOmRKni6BsFIR+KDkBSBiojvZB4fIbIzkB+hu
	Rsdo9kKIuC9j64Dy+dsZhROQgnjziIGZ5jYKp3jCTOzIEILRl9Zc50X7W17Dsb4Rryw2fRoH+/44e
	bsImdTgfFC5bHz7gb41TIgPu07gbEnJKc4kN3vFjHvr2VvkTVVtm9h1ywB68Opz/UJnvfc1mtQ1ef
	ihHwZLtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68C2-0000000453P-4Ajo;
	Mon, 14 Sep 2026 15:02:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68C0-0000000451Y-0S2B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 15:02:02 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Yf2674516
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=R64vMYngif0
	QtgmjSIX7fHGd4GXjWW4gNyDbeqBJOZ4=; b=dQog9WZlzb0RmAq9fQAraBH78/g
	RimytGPnHD+yZHilPqLX6vMDTymV5ztHPrBuQb5PHISlkbBPTdZeSuDiTGwq7Dme
	lvuv9GN+lE69IHCYi/cmfLmy5REzEM5YrIs7WuxsxThM075iMTofkM6t4rN133nT
	8N8O2pX+VW4x2V1MuL0mbcL/sb0C8HIpcBAmuXDYyLgzf+GfFdJYL8+lAL7DTSft
	uGz9V+TywjxK7XwxeEr1q1eC8mHlYd/8tC1Yb/UYbKP1NzOssDj+xxUq2Td0l1Sq
	SbZ6tpdIgGBx9chlyH0XjloeEVbTOjFXHOztRAxnqOCJcHEwdGRGAlFuCqw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs9a6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:01:59 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78fb9f59781so2955542137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 08:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398118; x=1790002918; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R64vMYngif0QtgmjSIX7fHGd4GXjWW4gNyDbeqBJOZ4=;
        b=iLGGbcUrZrycNcWwUoFP/1tC+6n5rVo7VxqKdU9ncLra8daYPTawkzqQG+tlKOpffI
         z1SC5Nb1ttJ/bK8hSSxVTizWqWLsA4bIdjcrtHHFxLh026K9yHDxqdryVgRLOPUyPo3f
         SJstUEpFXL0garAbpzH/Fid3Jv3DgNmt64YJDhydHywZKP8dicZYJHevPIN4/RlZKjPO
         ggK54EhaU+6c9CDH0JFaoszLw9mpfsCB6ht2wqIeN7zqMDF3szCy7iS+51u1CzyiyC6T
         U3QQVdsfCVG+v/a6k7b6qR7qvyMfedl6SNJoEGJisspaI1U9ABplfw10VDkJaliQHReY
         ZTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398118; x=1790002918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R64vMYngif0QtgmjSIX7fHGd4GXjWW4gNyDbeqBJOZ4=;
        b=UsPoPvbb6Lc8awUaQlG1QXDbmRjarMTf20E/QGUwIeLU29IScwl6JZhfMScDNTVOtR
         vUyHKRQE7JH5qWG0l+z8kDjnLURJ19QRGpOHcw9XK9vpH6KLB2G35hpNvnQmeC7wOTU6
         SngMQ5KWiCblVSAZlmoinyjlpFzygNHbCaId9tLIzprRyIOHdfySChx0H9WPNPcffDj9
         kayEuaYjdTrdEC7QMOh9/n4o7zJyjFEhED0qUOlkEyRbeR3yoCzFR3ly1RBYPNA63nA6
         C8Gw5tlug12qUuzjm7G1VTJl7c8UGym2KOJeyWGjp2qsxbOzg2GzIc4EybVkdJXrFjw9
         G62g==
X-Forwarded-Encrypted: i=1; AKwUvBzwTQV+2QkejzVLXEEwDym6Br1JUjL60i1XAC+PIzHeGcAefBnttrGIvKVWj4OUUYj/zrlpi02RZeY3y/P+wh8n@lists.infradead.org
X-Gm-Message-State: AFuF++mZ+0Lz4bMZ1+dylkaVu4fMnqJ+jGfsY2+mRW0M/ADaMAk/kP+H
	EAxb7JqDyKdOZvKZs1qS7nRbayl7FtI6aNVe86RT17Zx8CGoqV8GTKzua+dOw+RlPUuYr+s1olP
	UuXkeQIa4s16CDCeBSCOqinvuHa4pGhNFwdWbJLCpW3amPJXkTjpQ4PKPsB9Roe51ikB8LLvyB5
	U24g==
X-Gm-Gg: AYBFou1+gZ/XUabHUsthoP8yoPj2IK9jqBsbJeX4Xx7eN/NqUi2hbLVIEk8rAYm6mVl
	a1e51iDGPguaBBaA5rC6kmLr4X/b9i0D/X0iYZgykOIL5lu0B0Cq//e1ny0NkxEcqv9CKeq6EHM
	l1RzwoBNMd4/RCVA1epzhoRHhdTybS63mxnd38M9KsWjGd4rHf9l2YQ9zYRJtTgKCPu1njJ9R2a
	MXzVpgp+4Psd8MVI4yx94Bl8PGLWYYHg8d17U6+cKpoKyx7JPrcMQ9SkJQ0EM1hZif/VVytNu8E
	luUzhxs2cFBi9hxoGtwxeVHbf+G60xXvhLH6Oobow8Fl2qYvYy1FTmLkWGrOF07+cGYeKs2DlW3
	5zQKE6cmskWr7ITmJ71idSYILNhBEdD1Ybc6p4gqPOa9231DKFRgP/cvXoA==
X-Received: by 2002:a05:6102:149c:b0:790:cba0:960 with SMTP id ada2fe7eead31-79b5acb355emr1721378137.10.1789398117000;
        Mon, 14 Sep 2026 08:01:57 -0700 (PDT)
X-Received: by 2002:a05:6102:149c:b0:790:cba0:960 with SMTP id ada2fe7eead31-79b5acb355emr1721166137.10.1789398116168;
        Mon, 14 Sep 2026 08:01:56 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608480esm468632666b.36.2026.09.14.08.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:01:55 -0700 (PDT)
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
Subject: [PATCH v4 1/5] pmdomain: core: Rename genpd_status_on()
Date: Mon, 14 Sep 2026 17:01:37 +0200
Message-ID: <20260914150146.187622-2-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
References: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX9iIvUQxOgtiN
 98DdClFdx9eLhha3f/GOAnZ2lUpVPv542S7S+akbCR8X0ACyoq9OXqxkIL2E+JdWc7P07jbu3uA
 PiNRL7AbVM1sWSIXdRXQAg1DqHSV6Lw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX857BPFh4/AxG
 gORG9vtgVpHLdDBAc1cKl/g0//cwm8Y+87Qet7s5VUSr1ddOGjVUcK9lr72Fgc593XHvOpQrGGz
 +IoqwRFYHxLfG/6Y419SiGilLQNAiyoueErrNqux8IAUry/XLi1vOxZTid236EmO++9RplRfiVd
 J6xdMKGC+G13PyUfbB182PoHYUUKgSjSYrFGUC3K2LA5bILbf8uPy3JUGHTtf/ej64LaBckBeiM
 FxXEja3mm28LQonCgryQcU6kVnHpo34nZnXVXeSVKGq5isMqSy51D3loFvRC80hpS0I+h8nXvYf
 BkcdrBn5WYsc29tWM1xqQGTJ1ZIodIawqnuTpZ5X43TH4OBOvdxzoSsRoc7WWpK4e2BE4gK4eHw
 6PKLCJLA+Brl4iFK+YTn/abCHGBSpdJcDI4GWBt5Mb7s8FRO+aLcctalYca1bR43ic+C0BI1m5U
 TLQi7piPrZNDRkL574w==
X-Proofpoint-GUID: tANwbF_vVzkfPqd-nEye-ENqLouRQngD
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa80c67 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=zIFADOUqQBSm_Ft5s84A:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: tANwbF_vVzkfPqd-nEye-ENqLouRQngD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_080200_160836_4A066EFC 
X-CRM114-Status: GOOD (  23.95  )
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

Changes in v4:
	- None.

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


