Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783DBC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 15:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNB08OhPcvOdZDBtMLi9pQZN5MeRm7mGZFlCO0ycw6Y=; b=jSKOUOCAqweuHVmAK6RUKnzIWi
	/FW8Hwm9Y8P3ybRltAH7ZbkeXO3E2rvUPm8v3TY3LdPikRXCGlh4QB9PjgfLNEmEID8hlrK2jBnhN
	rS+eCmPecHBGd30pu3I23gd7hIH9sIk4XORr2o8ArM9evYdMTx46x8yvS4rA+wkr2XAjqnMYTXdTm
	lXuUdCdZN5jfpSR3uB/YGU9VAAdz/hpOYjBLV5avHVurkbsGed37id+1YFBwSq4gvgBD8Wy8XCAp3
	DAteniiLJqeQ++tyXXnILJeSYazRdObFipl7x9awXoxNCNsQYxsaJ068TXE6Ie8HPttUVrv25KdE0
	+C3L9l8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwi0m-0000000A3cJ-030z;
	Wed, 19 Aug 2026 15:15:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwi0i-0000000A3aH-2qQd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 15:15:26 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF1viw537930
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 15:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bNB08OhPcvO
	dZDBtMLi9pQZN5MeRm7mGZFlCO0ycw6Y=; b=l4YS5b0upWHmz3bitOLRZsxZVt2
	N+jadfMhE52oSSq6PPJjAN90EIa8zNEmMnS5eCE1o5+s1AzuMX66A1t9EXQEMl0W
	huWgW7tWUGmZqXS+QMPF25X3mDrWB9jDk33cb4jCJf9PeF9XEdB9iSj0ji9Q9sq1
	Xdw/nwFNnY4VPNphMuxuPRLf7PD4p+DaxfrLOQkHQbnYa3BmOvDbmFdPAGjVst3N
	YMY4TY/+J/0PGWjlMDpM6s/IQs8jeYOOyxEM1TkURgkr2M5wAKI9R3XhLqEaGZaD
	dSmMYKqfagwm5wclwrSp0JMDqxG6Ncbgm54UDHFCmSCMP+zKSAwemVE3NqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es5824s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 15:15:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936a796a23aso105536785a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 08:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787152523; x=1787757323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bNB08OhPcvOdZDBtMLi9pQZN5MeRm7mGZFlCO0ycw6Y=;
        b=AUX1dPNCV+XnuycfQYT+g+szec7mG5qHoeDep5yEB1vBUnqLhu8lpvMNnBLkwrZjqy
         hrPMN5x3J4QLWwhYDVHzpBBGWPj//5ZR123yNhMKx7ut5ThTnQ5CxkVWF2xcUkEgHpC5
         rYKyR+a3mi8z4ZOLiGxXNld/D+xnqvkJzrpRqWrjn1P4yzh07aHaCVqThQ55z5f4ybaB
         LBa1Dt4SYPktVM9/PIDr7TUCa27n6Vsa7q7NiF6xWdWTDn+w7P4eBec7tBuf3Bt5BKL2
         5DXkOzU2ckqLFYQugYStLkEbskrKaFVEqkCLFscK6xGUSgh7demPGghgkU90FUF752Mv
         9CRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152523; x=1787757323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bNB08OhPcvOdZDBtMLi9pQZN5MeRm7mGZFlCO0ycw6Y=;
        b=iTyydve6iGEc06vvDGQQJHVulsJj9dh0bmU3kqganSoTPFRuXHIatRH+osVD0/GAC4
         8PFzuPqgdu9DCOp43208bGvcJuhX0JN9q55IWEBpJHHOgdaOgFMsm8+1SMngKWKzmrRb
         VDO/f3weJknDjN+mAkrMNbnOU+Lus9chPLKQW6wuCeNXmRnJp4GeTo8VxyJyeEDgyu17
         bdf48ilUr/JsfP4/sOBQ7DIu2Xhzu8C7FgRpqRMNXlIFGfccJ2SqmpM+/wvsSkG1dcm2
         2CJu4ORMeiphox8Ob9f9QyLCu3BPvaHNsQk76FJ6v+LIUow12rDvwkfi2SS0dCToZcF8
         6r4A==
X-Forwarded-Encrypted: i=1; AHgh+RoId8gITolLv0PiXDdKLMb0IreJeZ+pV37YxrWV/TTHhRBXu+9db0JkflWowNx3fk6xRnbzR0tUfECHlpO2ozvP@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm6H0Xh+EZRaGj9KKLPtXOnbnEJRqEFBh59OUBTCveze5aCa83
	TegdfcxxWAOyZqq8RYNhQrC54O+1iiiGoMrM3h14bi1+1f2Z8l+PJt9etnj+ecDfbgX5WzzX1g/
	hgBYU6BMWz+Xx3IvqY9fnz57aV7cFhorlydxnEqD0yNsp41aCJVQ4qDBW/7RiTUuEw45jKIpcTM
	GrKg==
X-Gm-Gg: AR+sD10Jz/lxOshN7u163sRpdMDesu7frSdINpuebg2VBmx/3ZkkOi7vaEiqBtPR0Oj
	mmDRzkzP1JSltc/Q/6Lp4KIFAibmiXiTAnFEhTbcvbDOVpVc/TmKLlPtM30S1oV1lJ+jsu+0HxJ
	Nq17Kb27LvnBiMq4QEkH5EluKwLQcuV7h/mGxwXpUib0UPKXr7fNuOWuEULoMzanmmTdA38PCyw
	8SgBsqh4eO2JIlkCuWZCQhF+JYydIkAUuqfSFvXcEZhCV4907L/dPQgudTmcnfxPKFDdrW8YGmD
	16R+gObfTzcSjqbBIYPuJW2JL5Xc0ltg75Hl7dScsgNp/Pu7JnlMsy1oxOpAeRTCTyMStX2m65A
	6PALusI3M4E/EgBQGJr1mGI5Th60D79N9aGnk4svCAxmLDHHXdKXSTfJj+g==
X-Received: by 2002:a05:620a:46a9:b0:936:befe:42a4 with SMTP id af79cd13be357-9371e6b710bmr500316385a.42.1787152522938;
        Wed, 19 Aug 2026 08:15:22 -0700 (PDT)
X-Received: by 2002:a05:620a:46a9:b0:936:befe:42a4 with SMTP id af79cd13be357-9371e6b710bmr500301685a.42.1787152522169;
        Wed, 19 Aug 2026 08:15:22 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c4ac06asm94124666b.33.2026.08.19.08.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:15:20 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ulf Hansson <ulfh@kernel.org>
Subject: [RFC PATCH 2/3] pmdomain: core: Add a genpd config to support unknown initial status
Date: Wed, 19 Aug 2026 17:14:52 +0200
Message-ID: <20260819151457.256959-3-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819151457.256959-1-ulf.hansson@oss.qualcomm.com>
References: <20260819151457.256959-1-ulf.hansson@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7mVK2hyYNRH6WXrP48U_NsCOwd2nlLV9
X-Proofpoint-GUID: 7mVK2hyYNRH6WXrP48U_NsCOwd2nlLV9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfX7wYBiic9APut
 2BlurhGaUdVZsVs66pKtrj6m35uEmnajD0Zwtn+VvtrNBXq6MTsKJB1L0TU440MgM6oL99NXo6E
 yJq8n+vZBJrFcCQj3dHNzhDJxYwHWbQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfX/bSVJyK2Ihyh
 sIKkSJpFMXlywxNMaIl3dE7GhB3nvECYUsh8X/2ACXheW/mnsHytftmbHta5dSM5yfr5aC8TcyZ
 tCjC4IIP4TRujEIBLbslYopidIpjL6PjuxuU/Xw88T/MBC1AmmKLWu4fDARIDkGJgcIazgqJqNc
 hqevEeDqLPd7/9x9z5D9h+bbPdUPJ0okSJBBVy5iP1lXZEg9txYLwhbbK6sAmd3GIeKAfcHsZfu
 f8d5NIBubCKvOOKOjs+8xTZjZ/8+sQuG/0SkZ1KeDE7jDZ6LZEYYZtdB3p5V8TyPXvZAvfbvqtX
 MUtnCz51QxGOFThzuliYb/p2xTKZE4+bZXNxzmGOBFhN11Os36bZRJcEaK7etQu02mF1xBjR/7s
 eDl3Xu0bZnare9ALKY8aBEpw6fg0ru3lFA+uoDwiV/WMzE6zHtixCzyGauinZEEf6c+x5vfWe1q
 VuyPvJKhAk4UuXT3Czg==
X-Authority-Analysis: v=2.4 cv=Oc+oyBTY c=1 sm=1 tr=0 ts=6a85c88b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=EPyTabgPSFAr6pNicGcA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_081524_843012_F4A2446F 
X-CRM114-Status: GOOD (  21.43  )
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

From: Ulf Hansson <ulfh@kernel.org>

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
configuration, GENPD_FLAG_OFF_STAY_ON.

Reported-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Link: https://lore.kernel.org/all/20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com/
Signed-off-by: Ulf Hansson <ulfh@kernel.org>
---
 drivers/pmdomain/core.c   | 6 +++++-
 include/linux/pm_domain.h | 9 +++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 7345c06f1d55..be4fff2f4664 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -189,6 +189,7 @@ static const struct genpd_lock_ops genpd_raw_spin_ops = {
 #define genpd_is_dev_name_fw(genpd)	(genpd->flags & GENPD_FLAG_DEV_NAME_FW)
 #define genpd_is_no_sync_state(genpd)	(genpd->flags & GENPD_FLAG_NO_SYNC_STATE)
 #define genpd_is_no_stay_on(genpd)	(genpd->flags & GENPD_FLAG_NO_STAY_ON)
+#define genpd_is_off_stay_on(genpd)	(genpd->flags & GENPD_FLAG_OFF_STAY_ON)
 
 static inline bool irq_safe_dev_in_sleep_domain(struct device *dev,
 		const struct generic_pm_domain *genpd)
@@ -2445,7 +2446,10 @@ static void genpd_lock_init(struct generic_pm_domain *genpd)
 #ifdef CONFIG_PM_GENERIC_DOMAINS_OF
 static void genpd_set_stay_on(struct generic_pm_domain *genpd, bool is_off)
 {
-	genpd->stay_on = !genpd_is_no_stay_on(genpd) && !is_off;
+	if (genpd_is_off_stay_on(genpd))
+		genpd->stay_on = is_off;
+	else
+		genpd->stay_on = !genpd_is_no_stay_on(genpd) && !is_off;
 }
 #else
 static void genpd_set_stay_on(struct generic_pm_domain *genpd, bool is_off)
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index f925614aebdb..9929347e1d7f 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -121,6 +121,14 @@ struct dev_pm_domain_list {
  *				powered-off until the ->sync_state() callback is
  *				invoked. This flag informs genpd to allow a
  *				power-off without waiting for ->sync_state().
+ *
+ * GENPD_FLAG_OFF_STAY_ON:	Use this flag to inform	genpd that its initial
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
+#define GENPD_FLAG_OFF_STAY_ON	 (1U << 11)
 
 enum gpd_status {
 	GENPD_STATE_ON = 0,	/* PM domain is on */
-- 
2.43.0


