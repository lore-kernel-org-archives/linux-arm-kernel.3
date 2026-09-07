Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AFEC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 11:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=If4KmujJICE2NXAFfEbDRw+d56OpcwRKDELWSYebh9w=; b=cCZaEpcI2MQakKw32MNZJb+HAD
	ZhD09gK5eXZsueyz+gSgo1XuE6FKDvW2fyGMrssmtQNwfIzMwVP2X3qnjxXNGb4E04mEcK9PXAgQb
	Hl08XQuh/bfPOQW+DZsZGMX3cil7y+XBptQtyG3ASzD8dTCGa0wYTE0abzUER2XgkNivhgdBwOlfe
	+6BO0f4Rhl9/F0hUuAU/jShZIBRHOR29BHF7Lfz5fYRhbT8TOyRb4GAPKWbWrzfINBzbv57w66iNa
	7M33qdJXhatr3B0Ukq9zd076iyBNMwG+uc5/Oj+G8HH16P6mRS/NQTxMDNec6PVqT7RX+JKauKSNT
	u6qbje1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XLt-00000006cad-1VQT;
	Mon, 07 Sep 2026 11:17:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XLm-00000006cXR-0Mq7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 11:17:25 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Amr4R3872680
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 11:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=If4KmujJICE
	2NXAFfEbDRw+d56OpcwRKDELWSYebh9w=; b=KnzZioYA94fARoHLzS0nDuRDl1p
	7mYHCgrsxYB+pnvwjMCgn1DLfIKLb2bzB7GgFdDKURkslOrDyrtwXDYoTO9+O8QW
	xur2qtmoxBz7wIUIP4n3XWjcmVnehFWYYFOvzlxdDeHQBxZF4X+s6LfzGxeJ3mAn
	T7eUGGUmG2fOehnsGRBYXyyUXNxFZzgAMrjS5zNELXcNuS6akrJUAegQuQTFB1Yl
	IA5k9wewNj2wWfpyfSPIsx94NI0LiO8vTOoUG9x5K2qKYfPrzgdaQVBo/un6OqMv
	ihJPhTUVJ8vn64K5U6nWR26aPQSBFouJett9DPLSojdQMjPb4EvYDCRYgcA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj1rjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 11:17:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so552982985a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 04:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788779841; x=1789384641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=If4KmujJICE2NXAFfEbDRw+d56OpcwRKDELWSYebh9w=;
        b=ZQrnaiIzE8SYlxEqS0OOkL3PtTtpH1tr7x20KLQR1a1u20yOQLNHwbamrhlBZM3Kih
         NseMAHDAwOwOV3PRrEzlB3gQ14URqUrCPZ6/Wjja8hvZOBKqOeA7gnLsOxhIC7CgcyeH
         RkFfzPGDh7fozYNkl88EVJa5Nvbj9vnq/IJksTr/LxmmbJAVHYrg9rMDb7QEXysU/FJS
         +qmPhafMMcLuKbYXljinPSI5vE9KzluiMKSiBdPWq1LENYN7zmrRmevq5dMyNcriOcJc
         TyhPZu4QZg7PNGchHVqtVRSvvdtvFiGOMGWXdEHqH7CPDnsmFRoKv1VGTgLxmhmeSrPJ
         IP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779841; x=1789384641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=If4KmujJICE2NXAFfEbDRw+d56OpcwRKDELWSYebh9w=;
        b=RW75ttDO6/LXkrv1JUzRaoMVZL3qcqBOq/CPfUcoYGofZnZPCH/gv5ZurLj/aYB37N
         rRoenvZISoNFWbCB9H9W2rroWorbh8lg9gvEK1jUJcG+n7hXoFvasK9H1lqSjmM14ukP
         /wKvyPdqll/+wJOQTeGLZ6GwSZ1FLIVYxx/GUsPq+S4xJ/+hpV4FMXoV4mbTskx08vnh
         z04ToQYwsLUionQGd0cRxk54xKTTxbqvAUXED+ATWEWtFx5Bd7j1OT4cWHcgphJ3FbH6
         RMZkZv4cp7vzkM2szAaOuXBJuGW9u8Q0nJId8dyK6YGa0QDUWylpN5cEf02i4zsKpK3L
         tnjg==
X-Forwarded-Encrypted: i=1; AKwUvBxqavXkmzOqlG2/DSTIbEz++ScW28JPcPLOTHPZaoDb+WhD0csxCuqWt+lq4Bb/T5PCJJY1XcSeHJssQ+OggjwZ@lists.infradead.org
X-Gm-Message-State: AFuF++lN1JiJPjkjnXMf7SHP8lPGb1jrvbt4WywsXuLa/pzC3XskSaaT
	AxEGgBprOP4l/7h3j3SN7U2ATbhxvPf3w6DpqwnzGheQVCV40jNFZ97WWen/KWzL2Ye8+J+W9aj
	bz2imbZbAgTahjGvYOP4WZDnoacOGLEbq3631r9LjiUNUOpIc73hUa709RJvHT+3xTfV9ezapwK
	wqBQ==
X-Gm-Gg: AYBFou38dsfmjEHdLKK9aHrSJsI02ZCzbMJH6rYSBeTk5ua5jfPuNgdRDDtFG1j1eGG
	sYPuykv38euQDTNb8cSmjGXvtQKyPLmm1w+9TyDtCiU5+hv3UuRtLnClzApMH+S3LDZ77F7Lq4M
	UjrUMCQVWkUinub9zfbKvh4XxktN2GcNL3yDwraKHV7kCz4+oS2H9o23HV1d1pCFBAlBMiqMgHC
	46ZLTPqQmWh2wyGHfmQMWJrw2rtJquS8Ph65uYREbWtxZUoyhvpa58+rftAF9poaRPt2xsQImhG
	uzkhCJE5ILOcE+GgAJvsSWiIvfWrElGUBzCPDnr3yjQPaHmfMquxFanyqoPzVcx4Zm2RVilgb49
	YrY/pv1tsaUGvofYk/WT6/klDCzLzEzevz0qDZqiZ3oIr2Qne2DJWJNU3+A==
X-Received: by 2002:a05:620a:a90b:b0:939:319f:d6e3 with SMTP id af79cd13be357-9396deadfa0mr1869563985a.5.1788779840492;
        Mon, 07 Sep 2026 04:17:20 -0700 (PDT)
X-Received: by 2002:a05:620a:a90b:b0:939:319f:d6e3 with SMTP id af79cd13be357-9396deadfa0mr1869560885a.5.1788779839979;
        Mon, 07 Sep 2026 04:17:19 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cfaa2sm456120066b.59.2026.09.07.04.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:17:19 -0700 (PDT)
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
Subject: [PATCH v3 4/5] cpuidle: psci: Initialize the PM domains in powered off state for OSI
Date: Mon,  7 Sep 2026 13:16:54 +0200
Message-ID: <20260907111659.263324-5-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
References: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyNCBTYWx0ZWRfX95bgXaksMz9w
 YlcTACc1NoGTmJB2mPtITQVL1gDCFZiR46dS14ChYCaLTX+d/fGtZ44XYfCNJLqUHb0Noh9rCw5
 AYY2h3rz1J4QJIbCpFMOwMZXySdKuhe2DbmRXBBfrNY0OuHdLwCBnApwJYgVdab1wkAoeXmsybn
 pWqs5wzPN7VuhNR3x4acPpcU9u4hz+uUCS11PvPQSA0A3/kU+DujGU0TfmxtMSEopfQiLbW0v6A
 13lL5/o+tWg0Zu28fC+0V3g/SJ+I3grbnVUoE74EZU7LyCn42oF5gJ613x8o07rQzpponI6XOLK
 A/1cpA72TmTJSIKBRenSHatd31BCQBeALix5D0o8ianXGoW4FC2lDpjzePwviDWPiDADQlFFEMc
 SHX0ZcLefIlw9axxt+/KKpD5zFEvD+OUCCAtZZNmWum7Fmt9WgicqSrwqbk1yS+5L35wHCu6QUp
 KaTq9i/gbmf9/wor0EA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyNCBTYWx0ZWRfXxbDWV6Vl2Q2e
 R7H4So3X1i4DfC/SOLXseOQ8248xCBBgglgMeTGDCeZdbz5DTSNUTpgh2lxP+X9ucqZ/TG1Rofg
 +sZZJ2+X8ieMm+7Pr6QWsE8xdV4urv4=
X-Proofpoint-ORIG-GUID: vGTI-BEQEsNEnKHvPxr4kMSgVLEdpX1p
X-Proofpoint-GUID: vGTI-BEQEsNEnKHvPxr4kMSgVLEdpX1p
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e9d41 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GddhhVl5-a8N4MGu71oA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_041723_867616_C956BC47 
X-CRM114-Status: GOOD (  22.07  )
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

Changes in v3:
	- None.
Changes in v2:
	- Fix a bug in the call to pm_genpd_init().

---
 drivers/cpuidle/cpuidle-psci-domain.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index b9e4ad7d43a3..4d8c63d329c2 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -68,7 +68,8 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
 	 */
 	if (use_osi) {
 		pd->power_off = psci_pd_power_off;
-		pd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
+		pd->flags |= GENPD_FLAG_ACTIVE_WAKEUP | GENPD_FLAG_POWER_UNKNOWN;
+		pd->state_idx = pd->state_count ? pd->state_count - 1 : 0;
 		if (IS_ENABLED(CONFIG_PREEMPT_RT))
 			pd->flags |= GENPD_FLAG_RPM_ALWAYS_ON;
 	} else {
@@ -78,7 +79,7 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
 	/* Use governor for CPU PM domains if it has some states to manage. */
 	pd_gov = pd->states ? &pm_domain_cpu_gov : NULL;
 
-	ret = pm_genpd_init(pd, pd_gov, false);
+	ret = pm_genpd_init(pd, pd_gov, use_osi);
 	if (ret)
 		goto free_pd_prov;
 
-- 
2.43.0


