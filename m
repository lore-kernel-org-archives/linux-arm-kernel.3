Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385AFC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 05:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koBYLSdR313PhDwt5MfsU4zfM6HkL0IaObNIbdT0org=; b=wPz9s86Uc62yytqBTorI/yTdl6
	Sj8zCrc77/FE+aRokiXoS13t+T/ovKIuFljrlx5lB0xtcLFd2pIkwJyqZLeFEqrRxlrRKq9+lxUIH
	gru2WHQ2bSOuSaCZcmUuU0vLsrviqLemkZKOYArAQd4YpPNasUMgvr9zg1ZDaKYdzM9F2MBw4qOOW
	DIBvgY/PjjBI9Qwb5hwBrMNcNEE+y1amIJ+S9oSFQEDxKOMseF3YethFh45cnSFbaeaA0ptezTml0
	VV/KWFKJFIw6gwpU6LjICE55sObGb0A1SUPKN6/qsbTGi6+l9EclOF/9/ved6Mh3UavmWQRnQqD6s
	s9tm7ueA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfNh-0000000DLG4-3R6Y;
	Tue, 11 Aug 2026 05:50:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfNZ-0000000DLEQ-3fDa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 05:50:27 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMpti32705359
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 05:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	koBYLSdR313PhDwt5MfsU4zfM6HkL0IaObNIbdT0org=; b=XtB4JrBo2XD0SHa3
	+Kk/TxytdY7ZFEVyyc4+TfwHpqpHWjnl/tvSWiybuZaDhKzXp2IT7eCcOBorrA5C
	qkSyTutzdI8U4FYZ2Iumro+mnHDktR0RqhdKM9RRfjx8PsZaSpU3ug4Fl+TAQte9
	rQWUf+k3lbIpw4a6od6NmlNphvD8U7/duu5+QyhBU38QWjqwoi2aQuENuM8LYQeA
	A0tAyUt5qDAWg0q47PqqINmc3zmsnHNieaG1LllgcApl49h3rcg0cWv4YQgn7v4x
	C6FONU8wa1+N9NXoiA4i+Goq++azwJ0QwswAbEADy4xJ2kislqNycJSPhYZa/tYc
	nxBlRQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk62hw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 05:50:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-385d2703b64so646020a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 22:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786427424; x=1787032224; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=koBYLSdR313PhDwt5MfsU4zfM6HkL0IaObNIbdT0org=;
        b=Pd04cEhKuQXwtlywkAQLIRGVhTN82mjBbNZvMO2nJN4YINag1CY0QhDV3qpB0syA+x
         50HPx6V9ed4i7WATm33yQgyPFQtACTNSH7FG4yims2Au0OIspqkqj5CwuPUjfN6n6Oih
         xt3UCWT1fcwD44OZ9jXAKjh2eHny11oQX47aWNBEzuZ+hZVPnRU9DFJnNQ9nFvdrUfI3
         x2r1tBguubb82+j2TO4A1dcuEYQLRmZgU0khNCz4yusuWnjrpw1TEIDpsDGFodNZnlH8
         azz0IkXmU2IsiVrxi5X2HRFikIms7smLA/39tKe+a/8Q8GD9KeKwZzAplPBFW/sWdnr1
         GFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786427424; x=1787032224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=koBYLSdR313PhDwt5MfsU4zfM6HkL0IaObNIbdT0org=;
        b=OluuAa8DwtfHeWRfg6c59GFIlKfNmo3GkSugEJRWjW01HSGcx/v9kKwZpPv97l3EIA
         LRBMqV/H/eOD852Vz1lBGN6WrO4hhiBAjhb/regBz5PJaKezeUhTpW9O68ZUfpzFU0yO
         cANU1R9AgEUJal5biPXj/MU88zPENRI5+KfTl1KMnPomSIuqsFxqfFYE359Txnu8VMaM
         ahqqHwCOcrlLYXDDrV0CTOA4/UNh8VdYMr2mZ6hof9l2DJ3CKbmua5f3GZ8dEQn7jBb5
         LSfPGSaMUyKHQmAuFh2wc4F9GfS5r5/wCMR6QC6IPV3HGAKUkoIIIt95YZh8JBXi9Zih
         c6Lw==
X-Forwarded-Encrypted: i=1; AHgh+RrdvTduSN0LMW40ElPWJUJFGYgW7FxuZhVaGNy1C/9X/xtRSa9ctRPpfML0d9QUdq7xTMQd2by+87VOKPnt3VDc@lists.infradead.org
X-Gm-Message-State: AOJu0Yxzn62SYGEEkpO+spvOsSSyxF+25tGoIZ+JxJTYtjLyTeOVSK5b
	3OovM7X1UVREOZiGJkJawIQ+dlRSPd62s/SYuDRJCfG2xvLQ9DWB6/tcR8k0tQVHBtcPDduAQ/8
	K1ZWVDWFxTmCgMMdGB70fXYwAfk/ubnVsw3D444b3LDUcNW5593RgoRcW+fDeEsuSk3j4KI2l9j
	RQiA==
X-Gm-Gg: AR+sD139UyWFdGdDSCihdiSpXla4A+0vtoQU75IRIPB1PWfV5UdeTU99fqRnaXvPkfq
	YfgNO978Xs5AsI3bj+z/h7Juc/SyeG4/S8zYyfiwEtu2hTOvvBQA0AeF5hmor1ubQTk2xy68MI9
	4ezT7snwac9vGzKeALY9aR8QwR/svo3Rq8FwQSxPW2Lh9HldP6InHevtW1MNPT3RYNSlGdAAMIE
	97t9TQCUl11R4A5zh67qugCDoB1VO9TnvlEI7+73DqP3I3reX25FYqqjSsUmrZ4pG0n2fMZ9n8v
	2HWycsO59Iq/fBfUYXcqcHUGp4qbHyJ8UvywVx6XQjM3Y1NspjCFTlo7FwSg2d1ufcMA+oqhg7g
	jMZiWcPMLIdS4kTyO81p0cYAN/hwY
X-Received: by 2002:a17:90b:442f:b0:38e:42f5:d096 with SMTP id 98e67ed59e1d1-392ed2b2696mr174456a91.0.1786427423703;
        Mon, 10 Aug 2026 22:50:23 -0700 (PDT)
X-Received: by 2002:a17:90b:442f:b0:38e:42f5:d096 with SMTP id 98e67ed59e1d1-392ed2b2696mr174449a91.0.1786427423254;
        Mon, 10 Aug 2026 22:50:23 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d534ab78sm2062289a91.12.2026.08.10.22.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 22:50:22 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 11:20:01 +0530
Subject: [PATCH 1/2] cpuidle: psci: Start CPU-cluster pmdomain OFF when OSI
 is used
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-domain_off_ss3-v1-1-6a0a0fc023f5@oss.qualcomm.com>
References: <20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com>
In-Reply-To: <20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Dmitry Osipenko <digetx@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786427415; l=3853;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=n3vG1Ouz3Z5dfG3sO3PGglSgElYx/5po7OR/QX+HXZw=;
 b=hp47SzX2oSIQQDth+AiGTQrZv0cU9EsBKhRwhlX8jToxrRKHixorXMnct9hWJVur1NdokWpa4
 oPSV85nibLFCpBmWqKbcVkB8G0dsd9tujf0ueoPWX8fdo6vvEH5wG+u
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=Nb3WEWD4 c=1 sm=1 tr=0 ts=6a7ab820 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Ub2yIDUOchdfQrooBeMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: oUU20Q_kYEyhQPWpo-7Sy-_8u5x9805q
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA0NiBTYWx0ZWRfXzAKERl2k9FCV
 VzQcb98/64TBZb12j9OAz0V1rLlmUw3KyW9IIe3P8NnTzK5Eb3Z0ilRB761eBFD+Rf/VqKsZwn7
 WnIVrouZfaBarl0js6fQTRX41BrkvGs=
X-Proofpoint-GUID: oUU20Q_kYEyhQPWpo-7Sy-_8u5x9805q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA0NiBTYWx0ZWRfXwgVbfLofeS0m
 FhwASeDsaQmNzrcGeLxLUtZbYIMfaueEE27zeGB8kZ7ZgHqcgHWx+2J2ftZBPzPH4vQQAxxr6+g
 8r0llUHocrMhM3j61m2SFZbImbXi+gRGwiCIr/BzpnCgvEYoKSSGQ2M2wIwsVAkosBiL8KwEUUV
 7b2MY2ZXamDe4NiO6eyCemNANPihNR2dNonz2Zr6dcWFbHx/3hBrcPrXQHYW6X7LslY6k9oPEwL
 NcafHpJw9H2X7N6g8mFXvnRQGygBDAsq87+4cUSkzHxOlk9HptqLU4RjL0jWX30aFI6F4Y3++20
 nJQYaqHGYRC0RMi4n7myahOGGctPi52AfEXBHXC4ebP+aDq86I/S5cRBOGJEUFobXc8lTL4Y9df
 3ZxsOurAJt/vPybZSptreYZbBZs5vH/MJzvCWa7l0DIy4Z0H3idsXHLaFxxiIG50a1uHTcPD6gO
 uKivL00sijAJqzI5WYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_225026_042306_C84B5F2E 
X-CRM114-Status: GOOD (  22.50  )
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

psci_pd_init() always calls pm_genpd_init() with is_off=false, so a
CPU-cluster pmdomain is marked ON at creation regardless of whether any
CPU has actually powered it on yet. The pmdomain's own status tracking
(and the power-on notifier chain fired from _genpd_power_on()) is
therefore wrong from the outset for OSI mode.

A concrete example: hamoa has 3 CPU clusters, each with 4 CPUs, under a
single parent system-level pmdomain. Passing "maxcpus=4" on the kernel
command line limits boot to the first 4 CPUs, so only cluster0 is ever
actually powered on. Without this fix, cluster1 and cluster2 are still
marked ON at creation regardless, since is_off is always false. Because
none of their CPUs ever come online, neither dt_idle_attach_cpu() nor
psci_idle_cpuhp_up() ever fires for them, so nothing subsequently
drives those two domains to OFF - they stay marked ON for as long as
the system runs. When cluster0's CPUs go idle and its pmdomain is
powered off, the parent system-level pmdomain still sees cluster1 and
cluster2 as ON and therefore never selects a system-level idle state,
even though no CPU in those two clusters ever executed.

Starting the domain OFF is safe under OSI:

 - For CPUs already online by the time this driver probes,
   dt_idle_attach_cpu() explicitly checks cpu_online() and calls
   pm_runtime_get_sync() on the CPU's attach device, which resolves to
   this same pmdomain and drives a real power-on immediately. This runs
   from psci_cpuidle_probe(), a device_initcall, strictly after
   psci_idle_init_domains()'s core_initcall has already created and
   marked off every pmdomain, so there is no window where an online
   CPU's domain is left off with nothing left to turn it on.

 - For CPUs that come online later, psci_idle_cpuhp_up() (registered
   via cpuhp_setup_state_nocalls(), which never invokes the callback
   for already-online CPUs at registration time) powers the domain on
   through the normal cpuhp AP_ONLINE path.

Gate this on use_osi rather than applying it unconditionally: in
non-OSI mode psci_pd_init() sets GENPD_FLAG_ALWAYS_ON, which
independently blocks genpd_power_off() regardless of is_off, so the
domain can never really be off there and marking it is_off=true would
be misleading noise with no effect.

Fixes: a65a397f2451 ("cpuidle: psci: Add support for PM domains by using genpd")
Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/cpuidle/cpuidle-psci-domain.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index b9e4ad7d43a3..fab9de648b17 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -78,7 +78,19 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
 	/* Use governor for CPU PM domains if it has some states to manage. */
 	pd_gov = pd->states ? &pm_domain_cpu_gov : NULL;
 
-	ret = pm_genpd_init(pd, pd_gov, false);
+	/*
+	 * Start the domain in the OFF state when OSI is in use, so that
+	 * genpd's own status tracking (and its power-on notifier chain)
+	 * reflects reality from the outset instead of reporting ON before
+	 * any CPU in the domain has actually requested it. This is safe:
+	 * dt_idle_attach_cpu() runtime-resumes the domain for every CPU
+	 * that is already online by the time this driver probes, and the
+	 * PSCI cpuidle cpuhp callbacks power it on/off for CPUs that come
+	 * online/offline afterwards. When OSI isn't in use, GENPD_FLAG_ALWAYS_ON
+	 * above keeps the domain powered regardless of is_off, so this has
+	 * no effect there.
+	 */
+	ret = pm_genpd_init(pd, pd_gov, use_osi);
 	if (ret)
 		goto free_pd_prov;
 

-- 
2.43.0


