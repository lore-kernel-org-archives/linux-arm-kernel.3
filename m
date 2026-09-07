Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77E7C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 11:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/gIsitsveU0a1AR6GJ+0ZzNVuCwkMUNDvqqmLHk98k=; b=j7mEAeFndpXqsPNlEm/IbjT3DQ
	4G0tz50rMJhj9nvzdX+UcF4Q3UmKB+BV/TYXUW3lUMMCIamOZTVhMvpUdDiajPRAPdE2LRK+RqoPJ
	5vm5stz2QMXUtqcXropC8Fra3d3Bs9U64+NxhqqJo4C1cz9G/80PwCRz0vNaBN1kMpRys/eyaiHCX
	NQ2Pnnschh7HJwwMwYQ4s84DFS/dqpSEjsp7/GtseVHmXzAdTrkfyhnFaE80fOlKwJTdMj1mNdQoD
	t+F4MPbPLaxBFwNEyF+0aBgIA9QrQg0J4JwuSczOtE8OgZbWGHFZiHp2yVHiZFT+C/pGVzsoog/Qg
	toPcuIOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XLt-00000006caI-16R0;
	Mon, 07 Sep 2026 11:17:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XLj-00000006cVk-1VCR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 11:17:21 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An7Ad810629
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 11:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V/gIsitsveU
	0a1AR6GJ+0ZzNVuCwkMUNDvqqmLHk98k=; b=BzwKXE1rj6fatD+luaFzb1NGkJC
	rUjn1tioQPU4HRl8eyhJhqXWXcsAFvfq+1VG3hbGpaABhG+NaGqvStlNhkgOdstm
	OvMUTIQJSZM0p1Dk29+xBEITPnsN5ebGi4oyT/cWJWDiYJMU6/7djULGMbfijDar
	ALdH2muZyC9JvdoBClIH6vqOs0KAR6o65YWuq/xPlBU3GvLFQF0uoel3cLSxA6XR
	t2nXGGVm+sMEKnHBZj0DAK5pt00eioc0Xuh406B2aFvyzHqdrIXhvVz/hHFiF/Bp
	eurgZu+sH/MQeTpaVUnlvpazenRNchNj/RyhHL85uGaZzWDoKiNCWK2lhoA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua94ck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 11:17:18 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7847917c402so2614730137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 04:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788779838; x=1789384638; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/gIsitsveU0a1AR6GJ+0ZzNVuCwkMUNDvqqmLHk98k=;
        b=LONBfT+ZHPHUZCcxvIF9tjvCci2HJ5/wykirZpIVWNN7yn06gisGRVV0CmAn2LPdr5
         /p+Zj5QrRCtbIBOpl9vNSJFtK7vLGucQZejeXk+5bf5dzgBleGRmbokKXQtz1CBCCinf
         An8Ni8Gk17zXi9uFGZGnhAy+0+Z+Ga25lirjshopHw+E4MWc+6WXvlF1sZl0K3d6eJY5
         ZBRogKJkqju+cOoIPeNutB22bJbbVdyrxXj4w3TzaFA7nSI08dpt/5215QoqZ6Zc3Avq
         XVuQXdL4we9BOUZLeH+rKCuzs/2JMdYL+p66KTKNmNigJuKsEh+Q7ZrisQKk/T0gH48N
         ECMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779838; x=1789384638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V/gIsitsveU0a1AR6GJ+0ZzNVuCwkMUNDvqqmLHk98k=;
        b=UqOlngM2+32y1aJDbJUW/3IPXdkr7E7ywI/tMgr2PcpEVoU177OBea8yUa76X9sNOB
         OT3IVJ+eT5yAAIj3vCk0hZY3sHge2YlKGWL6cBfsyKwGDK8XLIC32T5+QljAQvda9Xml
         CeruFKQbNfKJMEIqQvhNLolDRZf9YIyFmhwtbfMHgBrlQw3NSZr9KuTdDUQuWGm6ZWT/
         Rz/nhxkLd3nbjpl/7SNoTVo6xXjrjebN89SQn37Dtd6zfuUz2kXTVk24iVrwPHRYmNLO
         k9YL9F7PiUeieBeF+OywU2sa3ujSKPMt84V3++zU5SxDq816bx9AFxpFyOIs1wVqNqze
         08yQ==
X-Forwarded-Encrypted: i=1; AKwUvByLmzCjpkzQHCq7ZE66WzD3xM6RASPKbNlpKS7QQ2B0ODut9Mq1SG4fkDSLP1lXoIzNWOAQKkjhM6KBCVGhhIv0@lists.infradead.org
X-Gm-Message-State: AFuF++mQD1Z71bI3VFVbSnFkbzfBSAui/ddQ/drHK5lE+ewyR09lQa+r
	/orD51SVN0HRrhRZW0Ux+KaIhu9Jdlee0Rd6j6iBq3Ubc+b6cbIX247nnmWwXPYjnMCAQ/eSYu8
	ZurHWkTEXalq2sPTYnH9/l9awXAW5Iic/xBj1+6cldqkWSNkco7Hnd54ldab7SDuyWwrdncWihh
	xI2w==
X-Gm-Gg: AYBFou3Vf5XY2ZkrTlKwx0+4/BXeh7YI9i6kEijjJaVg3Xcv9ZseP0HwWIrNb9Xv5U4
	IVkbiKg62p2yfTSO+6rL2p/8vUeQXuYxBhbzuXsq2WaysyupOB5BzVMtHLolUOJjB5pcdBE+1Yu
	0jHtV2leH+rT2frjuhxvb3OJynxE3hzVtnvvoi65xwqWmiGuWB45TDbPFf0z5jpJGB3JtgdIEy7
	RLn7z5BmHhEXA20HSf5zHGqaOaC6K74FdYPTtRa+gWvqpcGSWxq5bDuEUnU9QhptFLkSfYhCiDz
	23qU2zeKNjNc8waTSL8kT18ovWzF7L4eMpETIUfJUhwpESYjB4yw0NRMOBYOASiwo6tp+fILeZ7
	SfASyppiFHXZLaS2UDo9ofPyYugzZvGjM5P6v1qZD53SkzCpiAKiIGNkgIg==
X-Received: by 2002:a05:6102:509f:b0:785:e444:15e4 with SMTP id ada2fe7eead31-78a4a87d391mr9129621137.6.1788779837793;
        Mon, 07 Sep 2026 04:17:17 -0700 (PDT)
X-Received: by 2002:a05:6102:509f:b0:785:e444:15e4 with SMTP id ada2fe7eead31-78a4a87d391mr9129592137.6.1788779837379;
        Mon, 07 Sep 2026 04:17:17 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cfaa2sm456120066b.59.2026.09.07.04.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:17:16 -0700 (PDT)
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
Subject: [PATCH v3 3/5] pmdomain: core: Add a genpd config to support unknown initial status
Date: Mon,  7 Sep 2026 13:16:53 +0200
Message-ID: <20260907111659.263324-4-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
References: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ms-p8VJyAoOOuOXKFirLFPFTEzTt2GAh
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9e9d3e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=EPyTabgPSFAr6pNicGcA:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: ms-p8VJyAoOOuOXKFirLFPFTEzTt2GAh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyNCBTYWx0ZWRfXz0bHFKsrONVx
 D0rDMIwCe9pXp1AA9UBYUuGjmJQEiai8kF9/6q0YcsAhXOSb1uTJmmjrG6VHbFZBFZXYgOdivAa
 oItVV9nSv1YkDFNoJN2Pd8CMq4ymSPc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyNCBTYWx0ZWRfX4qSYkyYffYxB
 F56HymwZpPPLCDBA+VR/X+WJLFdBbsxASmZti6gVpCO3rv3kkgURySJPaHt72dsA1Wsqzdylac1
 uQBVvyUNy2em2dtkHi49NGrFWC8Y3EW2NmaIXIUHFBO9XrrMGVmqP3o6HyBtNBgr2e0ipB5MCV4
 p/zXaiZAIjVoRk0jnz4/z0jBl4epmCSOL6XcDqTqU43mg5bJ8VHDHQR8qNkFbb3Zs655S91eXxm
 EvkpyThSPa4aBf74zLiU0XIXtGa4fo8VxWE4hX5KoCvdASHySvg3fkvQdAgKawmGCWzcRAJQtvr
 UlX9XKgjZyq9hCny++CN3c92VYmcpiFPS36IqEs/W5jjblzx1Q/IPSJjer8UcfeTODjGj7h911H
 bc92G1l51Eup2sKwTy3XJAnIQJJtGuxsOhYhtR5KBbftwPcdP+zFe9z6xuKAYlKa9uI5NRBbHMj
 rJ0itLQYabmLSke/XDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_041720_056141_057EF0B5 
X-CRM114-Status: GOOD (  22.25  )
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
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v3:
	- None.
Changes in v2:
	- Rename the config to GENPD_FLAG_POWER_UNKNOWN.
---
 drivers/pmdomain/core.c   | 6 +++++-
 include/linux/pm_domain.h | 9 +++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index b62d4e544bc5..5b31ed47d3f1 100644
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


