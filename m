Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC78C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 11:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rKQIdRf0x1m9XiJr/mtJMCpV7S0ghyR6HfmB0sQ4tyA=; b=4u3dA/UwhHOOySCdOiuvG5Fp9x
	XFVoAqzlV3xSj3NcJJAR8PZlJGsHX52xTSLxXlnXii+O+H0yxR6XU0bIVFRm1nf6PRaeFXMgTabfY
	47a6/Nq3fG0Vk/28bVzjA27c4Fv/cyTgZHnOpbZ240WIRj0FnKoS3H2AyoUmbJXNh1gMM7if/rbb0
	ieiutZwlGJu8akKC5DbIehcQHVx2tps+m4w/efDiU6PMLg5DBtxBciIBZc4jzI3IG9jTXFr55JQqI
	/2fZ7KeYlwrQNF6yl1Usz3DGn/IMJo+REP7yvmBCxJvvZ6XaXKY+mdakGtmESYll0OUlYopfubD4m
	ZbPzJYxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1MSE-0000000BfTl-3K1k;
	Tue, 01 Sep 2026 11:15:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1MSC-0000000BfRi-1bJj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 11:15:01 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJctj2141623
	for <linux-arm-kernel@lists.infradead.org>; Tue, 1 Sep 2026 11:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rKQIdRf0x1m
	9XiJr/mtJMCpV7S0ghyR6HfmB0sQ4tyA=; b=hQWeNZEoayrCfa//QNEezARTFOn
	vwX/dlRWTSftRMLJMPQufjxr6nIccwl4dxUf6m87K2+3TCETs5sNFVi1EA2A1scL
	5sla7q3BGFtPwI0e8U0KEojXE31LrXxBK2jvjCy++ZNA4ikqdXgEtcPNJ4sd2QYx
	RSLfYxmGHV8jZmxAXgl/KZS3jJ0v15+xew1Qs/fXWtPIWPwHWdaheiILiii0Lhci
	pMonreXTnYqbaf+rP7zZrZW+ob/aFImkU/dbc5FImBghV7NzIEYSwkQvDGklEK6W
	oattx9BDsdEaOZ2sfEQgubJo/eax4p8vD8aUN3+9OAqXV200dEnjodJKrOA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fsy1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 11:14:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93918756165so1049738585a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 04:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788261299; x=1788866099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rKQIdRf0x1m9XiJr/mtJMCpV7S0ghyR6HfmB0sQ4tyA=;
        b=LUw9zHcKzVsXkeagtJNxA1VFFFAQnvArwg9w8A/f8SY1wWTTk/IokGIYodz9g5LKnN
         f1muotQ1H2bjlmoNf1Yw274PWR1GeyemEVgDBkQIYo7FKbx2gx0D4ndRHjkTTvIcoZXF
         qx3qU0Mk3gUyDFSF0lN7AJrSjat8toIVxNtdetfaHKGEWrvwwVoFXQWjfQIWNiy2TWFL
         1QcaWaugF6Hh623zY9vkiYHFbxEuhYhWFr1n1qF4Jq30rCtl2970eGmFuEJKBylpfqhs
         NAGUarZSLFZ5xSeCl1xrFcQho4CJwM5BNpE6f2tjcqUdOBQSfVE4vzQWK+lO/Fh1POW+
         RjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261299; x=1788866099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rKQIdRf0x1m9XiJr/mtJMCpV7S0ghyR6HfmB0sQ4tyA=;
        b=PHz6iQGEUYInxSYgg/rSSevutDDwwjl2WDu9cWatdczaaMJw6KAyySeYPQTkkqYMNB
         tO4k0IbXdF75p7W1Tcg5s/Pby5IAyVTH2yKau3bkfs+mRpWQyv4vs89qU+jrE8pHdWK0
         tSg+zZWGuTc84PHIBtSqABGNHpJrWPLcmWxj9nrcsJo0N1+5TkDjkhYUlNA0MEmwv1mu
         ed2qZhhIfPoDYKb1dcyFZJbziony1Ts3dDI9I0uSxGG/j/1+WZlrTvVN8lKwXON9llKG
         VTN0gpvgpU7LuJndgyMdLCUpWo9ex9vZB3nAq1UxMECG6qitVLnPx4yiUkTJ9+jvBfeQ
         +Iug==
X-Forwarded-Encrypted: i=1; AHgh+Rqm3mjDzEtx48GbkkgmEVMl58l0bQt2QE1HiCw/87R7ypREcbkOTiWo6qvJCj2miT6grVN8rH94kTxKNmJKZCmS@lists.infradead.org
X-Gm-Message-State: AFuF++nGLZJDnt9e0JOi/6U0Roeo5iGnk1KDM/3h7aM8t+pjlT3H4R3b
	xVc8n9ETOZGkEGW3JFfGndh8nq2qpMmwPr8qn1giCKqWOUAB9y3ouuUxAS+HZLONfBtm8uel8p2
	Kfv6Sc5XA3QGAK3rxVBgJ+90pqp5UA83GBGFJEsG1n2arDNjj427z7JA7lLVZRG+FO5TRmMakbF
	NC/hWuDHc41A==
X-Gm-Gg: AR+sD10Ag1vr970FLXM4UixbG0Qsekjl+DiiM02iYhusfWMxbOAN5J0d9zpaJert9q2
	UXlFLz8ite0U2lMPkyTfVgejAq7p5B4xWkL7o5RE4TmLnMFVLPj2etYXHv/dyHJRDPn+Knx886G
	YSxlLjSQoolpxUt2MJCOyERw7X2NuA3qNs+4w3cZ5CUVDGMhLFxDbECXg3wdhdaKjAZVHhL+SCq
	riQplvaFItpbCctuUG4/iiOXd6RNj3CojCBxLhVVNuJlPWZ89D35zNqc3WY5Pb8ACDpsDiH2PsL
	jeDTHX038qVvUd4+fQqIjO6h8470czcQFVGhgmfPWF9xtjrhPqylxlVrhclXoNc8E94q000wQ9S
	mNLYv8dHUr6e0CUfpUm0vBXbqTeCut1EVYwHOjMp5Zk1jVfx0OIc6cb4M5w==
X-Received: by 2002:a05:620a:4086:b0:936:d360:2eb7 with SMTP id af79cd13be357-939480e7077mr922192085a.20.1788261298658;
        Tue, 01 Sep 2026 04:14:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4086:b0:936:d360:2eb7 with SMTP id af79cd13be357-939480e7077mr922183985a.20.1788261298122;
        Tue, 01 Sep 2026 04:14:58 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25878ba94csm380686366b.47.2026.09.01.04.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:14:57 -0700 (PDT)
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
Subject: [PATCH v2 4/5] cpuidle: psci: Initialize the PM domains in powered off state for OSI
Date: Tue,  1 Sep 2026 13:14:07 +0200
Message-ID: <20260901111441.122436-5-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
References: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4Cjki0AM9S2EjtDhyQND1Yl6hX7JWhvF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfX2hbJx0EmtMpu
 0O32jcCR/XyHfsMIgg3csdg/d6XxY+41jIJwuz33E31YJ31nGdPiVfgOlQ/zQR5g7JKEelbG6gw
 xSOaRHhfa67EFeW8Q1rdFCbG38WLX7o=
X-Proofpoint-ORIG-GUID: 4Cjki0AM9S2EjtDhyQND1Yl6hX7JWhvF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfX2Zw046TsLqBL
 HHqAaAraH1SUCvp1vPTGYW23lXfTzQGE419ltYFOv6P/ZSDFh2NYpZkDGZGbNLikNVpR6hg5qad
 OTvuSExvhci5rkZ+oEI7ufEie4Cxz1ZRV+u1p1zd1l3Q4w6NESzv4FhsIrKPFgguB9TLyasQaVx
 KTDcRwPZSwtXqVnWN9Z/cuaeZzYlM8VglmIq8JtEX2rMgND6PrXIwaETdnHMatjpB6MylRISXSc
 fvaglSWG8VCbHrr3x6AtlWNg9AM+ya/jqiHs7VOWWxDcdtCqBs/KBTuJm3b2qQeWmHvbtlXRPKY
 G5Z0tZDLQawaDtXIlUoG33H7v6SDM3mhiEUdqOaO3eFo6g1f2dzW9TeifCfD9cQvrM8nVSbFAXa
 euc2wsLHOXIwK+xwxGKdptcC5uBL27asf3eZC9xvHLRqRa8lfcsSHbJonKHpfJIUe9RcPGWmYo7
 gHhC1PGOpzPXhTHdutw==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a96b3b3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GddhhVl5-a8N4MGu71oA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_041500_540736_257F6EF8 
X-CRM114-Status: GOOD (  23.75  )
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
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

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


