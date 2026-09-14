Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8311C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 15:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKDK43ay9zYtKdxpkhmpR5tzBLdv8wVtA8UrvJmZbMs=; b=k1UVvHnQD3rq2fpqTYdrayKopz
	KkGPbYJ011WQouxRFM1m3riiGVXnc4UwvbhrGzRsDASxpDlFET7O05JsmJWoi6rTzyM/xhybGH3Pu
	T/THesjPTo2PCQP7aqkQowD32PsrPlzmY4K1GwrGMyqbr5qHCR5l0NDWEZ6FFgQBlDoo8MVueekY/
	d7jZbHSksRWP2jO8NYLQutFtFgsz2zpuZQDg2Afzj/PiN4DdVoyLVZ3cXfrDZaEAH+uy5NfW9ANSo
	o2KUWLrALvSbZH/aFISbcd//IJt0EsfBrFnOhQXrkoV7B3Ibggk5liW4BQaB204WmhA7kuo3FIqYm
	ThQ2pDjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68CF-000000045Dd-2FMf;
	Mon, 14 Sep 2026 15:02:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68C7-0000000457o-2nGC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 15:02:09 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0bqf3588221
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HKDK43ay9zY
	tKdxpkhmpR5tzBLdv8wVtA8UrvJmZbMs=; b=PNNrgj2xk1EVdX4xt1Bn2RFQdPV
	ZNGqJ/gLtlYrw2aAyZoshur384XYsKMYZI4sopxxebhppb2J6ILJDyG0CRKzGbg1
	NbBxFWFs9ivdli9ZMrqm2WTuX0qayLTIQYBZhN/kCRC7clqpogcQ1L7JsAmNeg8U
	5+syTQqoiQhhwHfuRCyOs20S2AUGq0Z9hCXJEO2ZP9kRoOA+sYNgWhpOR4iLayUS
	bz0q3Y81tGiWtfVVVmi9fCIUIrHFWBL/fQQo3xvbjoax4p+k5BgK/c/sK2uZuqpI
	xGCSP+wwwriu2zzTsTVIeESb+foFYkHAZ2JTm75BVfH03C3sHalj060/wow==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg97k1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:02:07 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c07dcbe60eso3918934eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 08:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398126; x=1790002926; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HKDK43ay9zYtKdxpkhmpR5tzBLdv8wVtA8UrvJmZbMs=;
        b=Kp/V9cL3kadZjSxACLGHAcpsZTV9lDtrtGEJHSBFnTDcEFUMf+i8Vtmy+s4qQ34tr6
         LrUxqSvMUM6GAdtIlrLH+yia5EupEqCHnizssXTxteKlCZ7kjt6+DHYs0/tIP4ts1x4Z
         v10UStsPj8h2gFJrbWJFTSptIK0GLqTb7bC0jIJfpXnwgkACK37zJhLQDCHImdnQ+l3w
         1oD533BNLyfoJCuAOZe/OeUsG3rpFryhTp055CxDoByg0cSZTYsga4UPmJllOab3zD3u
         pFU0IuweSmcR0cuaG6kaYwGur0ifP4lXOw5MPVIskBpF5L7AGzn5G7FBqD8CHPKvjmQx
         g+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398126; x=1790002926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HKDK43ay9zYtKdxpkhmpR5tzBLdv8wVtA8UrvJmZbMs=;
        b=OC+6iN8Rx6T18IHSATTQ8PPuWun1ZjvnE1iav8gWFiS6XWaL0d3t7K6B1VRQoGMd7I
         DjrWi3p5KoTfa94beHEkVxxu1ezSIj9M7osJQCMOVH1g5wcTHRY0xeSMjlMCdgpcRJZJ
         IfPVw2+HT8M+4ocqRnLOb/9atG9Hng4J9ZNFUQ3dKJ/ggvS4rqgL/nca+PDBzMgU0cPO
         LBeOw6kY+tTYUcgzeEvTjZtMORYeLusd1ajXKLqshD13PyKjKqsEquVocyHD4foKsReW
         ojs7dEkQdqxpOlPobDikQ5nweLaEzagiCjkGvgv5HSS9BJFgYS+oT7mSLZ+hCi3O857q
         y+cg==
X-Forwarded-Encrypted: i=1; AKwUvBzvlX9/SI0uO1QkUMizdqdd2sgfaHerxyw6Mo3F2iX4QWyGkXoXNcw3FTmaYP+IU4b4bFLju7BoWvydlRQJgkHv@lists.infradead.org
X-Gm-Message-State: AFuF++kHACqVRoBLACTDDAZriHkUWv87b/kkmrOJdsydGiu4ZNLwhGe2
	e8d9kaH/h7ajIEJkXYE3KkRCNlAqxcDRBArZgqbMxfFRQG7C4G95HGs93+xJ3HCLQAQyQcXukVA
	ARoKPIeHDnAYyf88pIjJX+kQht5yO/YBNu8GQXEJTdlrBK9GAdqjrLEY9cXO0KPdkVyOBmDdnye
	7YNg==
X-Gm-Gg: AYBFou3SX9KAnDoFkk/2uaiywSEQ2lfpYv1ageZNfKidZbmYB7p3d4oPkth6rFGdcNi
	v5nnCVlKBXtVQOBhfZmAHThRUwhXfeEZz5GU39ROmrj9BaQ/b5+KmMyHvxwYlQ/VSApHPUp1fzB
	HY4mOqWzFwjODFtE9OHKrCjzBFhRtr5abBc0K32Rl/mzjEwISPgrArKfSSNFQYCsyP1G+cX9Pq0
	l3y33Cu7Nhcj2mIPc5/n2fD1qqjscMlnmhulmh92Yl7+eqo5vejaU/dFDb66MsNzM27GHhZUIUG
	QEVEAvDuzl5nyzWIsYHxJmsDHBvMk1RPIAB9IDe68NeZhziInX06jWzVQm3uwx05MHzLxKqKsfq
	1uLl8Mlbdr/WEk+AMUqXJHqPVbG5yL3SrR5ISgLvv+yMgNIZDMeYaZ8tLXQ==
X-Received: by 2002:a05:6820:6ad0:b0:6be:dc4:13f0 with SMTP id 006d021491bc7-6c542926f3emr1546475eaf.49.1789398124786;
        Mon, 14 Sep 2026 08:02:04 -0700 (PDT)
X-Received: by 2002:a05:6820:6ad0:b0:6be:dc4:13f0 with SMTP id 006d021491bc7-6c542926f3emr1546403eaf.49.1789398124319;
        Mon, 14 Sep 2026 08:02:04 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608480esm468632666b.36.2026.09.14.08.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:02:03 -0700 (PDT)
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
Subject: [PATCH v4 4/5] cpuidle: psci: Initialize the PM domains in powered off state for OSI
Date: Mon, 14 Sep 2026 17:01:40 +0200
Message-ID: <20260914150146.187622-5-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
References: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa80c6f cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GddhhVl5-a8N4MGu71oA:9 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: Fz8wRU_ui3eVw9w57BK_oNaKnI4ydiP7
X-Proofpoint-ORIG-GUID: Fz8wRU_ui3eVw9w57BK_oNaKnI4ydiP7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfXwgs/jwZBeQeH
 BE2lkKg3iYODjE8i4XoXfLZd1FeDs414XkyP3I2CxfkHtyP2gSnNx8b66ciq/3DcK8gamBUthqM
 /LbNiDyW/4ywqfjMjMZu3IB5fR6UTdIzeUBh3s6/Kl2UD0hz3nEHxAPQq4sPbgbkRPy8v0ovQT4
 22jDtkj+D5TMIBG554NiTCR7rCFpI7NxIJBoNB5IKMyacqE8Uy8tALtFvGlwsx5ewO5y67jD4mw
 2agLe7NUuKiPw4Lvo5KqEndsdp8Mx9ZwoFbihupNisZTth4cfGUWq503OpPK7XpGERGKiXSrBTL
 M0D3SlMtuxXSBE4926NBJDwXR4yB6vyCUMLifFISprpg1SDFKmRP0o5SlnRIeAbKyElnHHi1iIK
 AqTCCSlo3vHqkfmvFWrMO8wV9dPo0pYClK5C7ily4tMz855p7eEo8qRXNSjTMTe5/Py9Aa4K4UU
 wdcNDAQ2Iy9W1k/QIwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX3vTBCN07b5Et
 IdrW/L7Zx77XkIQM3c7jaj1BW1GIzxWlPlM7q6F/X7PZFAqhWi0jjbPTZQsp5PT61qinyJND4XA
 uW+K83RTO7TflMnJ0ppI1lk/XeFxdl0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_080207_718317_66A4B0A1 
X-CRM114-Status: GOOD (  21.79  )
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

At the point when the PM domain and the topology are registered through the
genpd subsystem, it's not really known whether corresponding CPUs are
online and thus if the PM domain should be initialized as powered on or
not. Instead this information becomes available when the CPU devices gets
attached to their respective PM domain through dt_idle_attach_cpu().

This is a problem when using PSCI OS-initiated mode, as we may end up with
a PM domain that has the genpd's status indicating it to be powered on,
while it in fact may not be the case. In the less severe scenario, this
leads to selecting a shallower domain idle state for the PM domain than
necessary. A more critical problem is when a non-CPU device shares the PM
domain, leading to their corresponding drivers not being able to trust the
status of it.

Let's fix these problems by initializing the state for the genpd's to be
powered off and in the deepest possible domain idle state, when using
OS-initiated mode. The support for ->sync_state() is maintained by setting
the GENPD_FLAG_POWER_UNKNOWN for the genpds in question.

Reported-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Link: https://lore.kernel.org/all/20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com/
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v4:
	- Drop GENPD_FLAG_RPM_ALWAYS_ON.
Changes in v3:
	- None.
Changes in v2:
	- Fix a bug in the call to pm_genpd_init().

---
 drivers/cpuidle/cpuidle-psci-domain.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index b9e4ad7d43a3..5722365b943e 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -68,9 +68,8 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
 	 */
 	if (use_osi) {
 		pd->power_off = psci_pd_power_off;
-		pd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
-		if (IS_ENABLED(CONFIG_PREEMPT_RT))
-			pd->flags |= GENPD_FLAG_RPM_ALWAYS_ON;
+		pd->flags |= GENPD_FLAG_ACTIVE_WAKEUP | GENPD_FLAG_POWER_UNKNOWN;
+		pd->state_idx = pd->state_count ? pd->state_count - 1 : 0;
 	} else {
 		pd->flags |= GENPD_FLAG_ALWAYS_ON;
 	}
@@ -78,7 +77,7 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
 	/* Use governor for CPU PM domains if it has some states to manage. */
 	pd_gov = pd->states ? &pm_domain_cpu_gov : NULL;
 
-	ret = pm_genpd_init(pd, pd_gov, false);
+	ret = pm_genpd_init(pd, pd_gov, use_osi);
 	if (ret)
 		goto free_pd_prov;
 
-- 
2.43.0


