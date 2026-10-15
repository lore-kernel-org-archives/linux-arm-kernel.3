Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C60FCC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRZooxfKHcxQhHly3wIZOGKjRM12w8Hjl2/Vc8SnRiI=; b=AoNG5ybdsKLS3twkG58T5E26e0
	/mmcFmVJLOSi/Bk84swz8N7CyxnC9Kz+Q8HgxWW2qVWWITEWt+NpUntMPvHWT1ocIUJ0LlIX/TQkL
	f+/2yS+KNSWC9RldYx/IQDv2SRx6sXEfi+MLu6KdPAyWSQcK+Q7LhndbjO3ajAMpCt2wQkqBqAnDV
	yeB5p8MHdTLMi/EVBk6cTzB+mi1mYa1ZR2X2O7K8Dq6Pstlh795PM3Vz58sv5tp+AbJrv09VX3yzf
	19fZ7s3vpThN4MqYMeTnkbbcI8aQUjkouM3sLNht2LXJ/Kjxs8Kb+Zes1sfk5RDUwHMWRC3e8UR2u
	urMuf18Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIBc-0000000HM8W-40ZD;
	Thu, 15 Oct 2026 09:55:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIBa-0000000HM7K-2g6Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:55:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9joG93408871
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 09:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZRZooxfKHcxQhHly3wIZOGKjRM12w8Hjl2/Vc8SnRiI=; b=H82nV/a3ADeO5aLq
	jDspsHWEq90d9lI/NMP3EHNLd6DvjdQKJAlDZ8TNRi/fuQLubcRXddHwR6IJO6DB
	a5YxC9Qe3uSjZPxLqRnB1v5ekOzNNAMr6Nm/LU+bBaVp6KmKSYzBjAvIGu4+yAWH
	FBhXric6NDnsWolh0p7BuKxXYpP/7l8a9DWzILyfxkmA7M6CJdP+qlPH8FFhyo7O
	hdV0gmgI+m53QPgEYwDuooBOQFFv0EN4J8KE0/spqibsqxDhxQvOshUweamQqn3h
	r0D1MPhYVBxPvLTBBKxROTANfldda+u1oyd2/ApjEMyrMwJTlLrfHaM4mr9eCtDs
	POLO4Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn253k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 09:55:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so14389855eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 02:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058140; x=1792662940; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZRZooxfKHcxQhHly3wIZOGKjRM12w8Hjl2/Vc8SnRiI=;
        b=Ofg9sWR5qhZFTLk/8YqFokr8XVUUm+MJIbgrELIsFFysmVkoynWE8W9JlQXNsSGJcC
         hKyNCwIuhKbhEdA7HLsDoZRT8BSIRVCCE2So77I6TLGhkdiDkWR9aUbub+oAcKRGBokZ
         C4BWxHHCUFZgpcpcjifp6/UsJiUMYR+3aZKLIKAR90f3VmGHCOOGZalX/VNu1PCzhlRc
         eIXleRjRMP0Z93ZG2NotSzZP7S6dIXSVe++qIRQApnkj9J3f16/aeZSiHCg5w8YqlK/i
         Qr9VoyqPqgDdNUt+AqmKuxn9j3Mo6cSQcGr8DKqTW7h+MXORrrL8ES8nkrGNXYBgiSer
         hgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058140; x=1792662940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZRZooxfKHcxQhHly3wIZOGKjRM12w8Hjl2/Vc8SnRiI=;
        b=YAWpwDZgf0iGKIH9bOoZGFx4a7jRu7NcZs4QMyHrAACgBVciev0Jo7NxYAQHgvwH7D
         6WCrWGRq4M+Dclukz1L2Zq3Auzw2k00HAGfSDCtizLx0rFK1quBbGDjuGqN7FIhSsRpr
         5UniXUKpsWpy/P+U98j3bcgfmu3bO6F1nlrj9tP9IcF8oFDt3Rad19PjWXwHVpIZWNBH
         b5BHzkM2kLDPDqRVMFDoyUba4fZxOEmyvM1jrgTuJPov+4z4/+20tgGs6F3ao3ZMthUI
         tj38RV/QjcZFR/IULKzHY+vFGKUlrUdM5V/Fk8h+neJOTBDEuTb09BzCw681sUOEo/a1
         kdjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMCZmQ1WSPJD2F4YsQVWiIfnZsPzYjLag0gSgmA6X+js1S0Aw585gABcoI7rkI26ZpE/ZDzg9SDQG3HcXxzGSV@lists.infradead.org
X-Gm-Message-State: AFq9FYJnLTP76Pq4KOlrnbNB+4OoDbbVR/q6QSGoy/8vXvl0TTl/2j4l
	wFBGC6hYeqFv/E5JHBYNqxeF/g5pcum9AB+5S1qrDrCSktopJaYlFWZuczAJDVz4aLREOYDUuRF
	Y5uU2bcLmceaAfO4an7ttKYHtZ/bD+n/ldaOTKv6SgMv+UAs2PJAlJX1y7FPcVvJPm4ReJlIR0c
	7hWQ==
X-Gm-Gg: AYBFou1DqEyUPPlLsMv+nc0r2ysbJAQUqlx3UUgJGR9eXgSvF2RbttQ05lklVWgNnUB
	WNq3ycIZ0G4IIXvOhSQyU/WM7jxMqtqGmOZ0wgPJCnnk4nx+G3JQnY3YAcPeGlYw0jhFNIGjZ37
	f3Njjap2OAw/2wArM+HaHD6FFusG5CCbB2vz/9RQFOB3KyDP5JpypIJ2xsE8ne+Fdp5uTUu5Q8m
	PeD6JNUt4ZznF16YPWlsonAMlwMPb0b8EHdHpl2XxsM0algMXIanRA/e4cWgA+IHh+Zo5qznQh8
	DqmL6HRAJktaGl/nMtPg+OPP5KVMTTsUR+RBrM3noagwzBpIZzKk4kGGhOEd7if4Uv9Pk6BslrU
	suBGwBUQOitXLItrrk/f+9pIu5d2N
X-Received: by 2002:a05:7022:1713:b0:14d:3c0c:79ec with SMTP id a92af1059eb24-16a5dbfddf2mr19682386c88.9.1792058140393;
        Thu, 15 Oct 2026 02:55:40 -0700 (PDT)
X-Received: by 2002:a05:7022:1713:b0:14d:3c0c:79ec with SMTP id a92af1059eb24-16a5dbfddf2mr19682350c88.9.1792058139747;
        Thu, 15 Oct 2026 02:55:39 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:39 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:18 +0530
Subject: [PATCH v2 2/9] irqchip: irq-qcom-mpm: Register MPM with cpu_pm for
 RPM notification
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-2-ac7f1a0d5638@oss.qualcomm.com>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=6029;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=0/Tr0DajWPXUzKUH5d4VC24ba2J0OELVrM1Ea+MEUHM=;
 b=qoUjJMHe5ei1QOlSNefaB4M1Rv204APQrXw+45+0oXnsjt/ofyXOG6J30jbxwiPgRFjHCSiwt
 M+iKbmisAdiChtUZxT26IREOF1qIZZcIQtWL0fs7YNGmixRtgathro4
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX+4X7B6W66QoN
 p6t6oAKjHurwbBV+7nwRocuMCS+8ffgkllnm+sJfX4+CG2zcA6dzL4eKBG8GLbbYqo/p67wmdmM
 5zL1JfcYnVxQ9ns8CAeX6xmac8X+98nm/XOigrn9Dt/sx5Rl77hdK3rIuwjiRkCrbceiJwJuU3n
 GR0YmUM5YmYa5egqPFY58aaT9v4MGa9rY5SkgDuqh4ofQdCCkMABUyfzYBFe9aru/3s1wCmfTLq
 A3vsk/0zSufbTrk4TFOzbHifKTFE1Ar669jD3Wi5ezya983OlFjKHOIIffJWsSxB9ouVM/WGosX
 BXvg2uRoBVmycc5ODS5O8GCLV9OL5EPbuS5flEo1dB70i+dhFiOHf7gv/r3AylJv6f+hWx5VQHn
 gleAEiM0hUZ0Bu0+x1QFpcaSgP2wOBoJ8P03iCIX3Aju9ACAl44futLo8pVNVohYWaOL+/SH10v
 Fg+J1dl2dyxP/m23dZw==
X-Proofpoint-GUID: I1NJmSF58O7jt4IxwSbydoNVDM9AzCoU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX23yhsKgfQVx4
 BIhOPfYbCNIQznXmdBNOhqaoG/ZnZLMhRMSj4aSXKEYQ3Am7T+4gKY2GF9lntaVf5Zb1shEKJLN
 bebLL26fSXe8Io6115rAl5+ZuFD5rcI=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0a31d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=iYttt49xga_xEpih8PgA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: I1NJmSF58O7jt4IxwSbydoNVDM9AzCoU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_025542_805585_D7543ACD 
X-CRM114-Status: GOOD (  31.35  )
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

MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
the latest wake up capable interrupts when the CPU cluster is entering the
deepest idle state. This is done by sending IPC interrupt to RPM and is
implemented as .power_off() callback by registering MPM as parent power
domain to CPU cluster.

Such implementation earlier introduced a hard probe dependency between MPM
irqchip and CPU cluster power domains. That is MPM irqchip needs to finish
probe before PSCI power domains are probed.

The above problem has since been resolved after bd7f488a8e5d ("cpuidle:
psci: Fix support for probe deferral by dropping the faux device") / [1].
However, it makes sense to remodel the RPM notification in MPM irqchip due
to general consistency.

MPM is not really a power domain provider, all it needs is a notification
when CPU cluster is going to power collapse to carry out the RPM
notification. We can register for CPU_PM notifications for that purpose.
This way we can avoid such unrelated dependencies.

We cannot register MPM under CPU cluster power domain and rely on
GENPD notifications here, since that way cluster low power modes will be
blocked whenever some consumer of MPM, and in turn MPM itself, are
runtime active. This will add another unnecessary dependency for CPU
cluster low power modes.

For now as first step, register with cpu_pm as a fallback to manage RPM
notification. Trigger the RPM notification when the last CPU in CPU cluster
goes to power collapse.

[1] https://lore.kernel.org/all/20260909134240.685115374@linuxfoundation.org

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/irqchip/irq-qcom-mpm.c | 90 +++++++++++++++++++++++++++++++++---------
 1 file changed, 71 insertions(+), 19 deletions(-)

diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index 181320528a47ac1bde6cf7d2d0a9f79499990092..a37c20a20bed34d4f55fbcc950ba39ab9799b7b5 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2010-2020, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/cpu_pm.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -85,6 +86,8 @@ struct qcom_mpm_priv {
 	unsigned int reg_stride;
 	struct irq_domain *domain;
 	struct generic_pm_domain genpd;
+	struct notifier_block mpm_pm;
+	atomic_t cpus_in_pm;
 };
 
 static u32 qcom_mpm_read(struct qcom_mpm_priv *priv, unsigned int reg,
@@ -292,10 +295,8 @@ static irqreturn_t qcom_mpm_handler(int irq, void *dev_id)
 	return ret;
 }
 
-static int mpm_pd_power_off(struct generic_pm_domain *genpd)
+static int handle_rpm_notification(struct qcom_mpm_priv *priv)
 {
-	struct qcom_mpm_priv *priv = container_of(genpd, struct qcom_mpm_priv,
-						  genpd);
 	int i, ret;
 
 	for (i = 0; i < priv->reg_stride; i++)
@@ -307,10 +308,52 @@ static int mpm_pd_power_off(struct generic_pm_domain *genpd)
 		return ret;
 
 	mbox_client_txdone(priv->mbox_chan, 0);
-
 	return 0;
 }
 
+static int mpm_pd_power_off(struct generic_pm_domain *genpd)
+{
+	struct qcom_mpm_priv *priv = container_of(genpd, struct qcom_mpm_priv,
+						  genpd);
+
+	return handle_rpm_notification(priv);
+}
+
+static int mpm_cpu_pm_callback(struct notifier_block *nfb, unsigned long action, void *v)
+{
+	struct qcom_mpm_priv *priv = container_of(nfb, struct qcom_mpm_priv, mpm_pm);
+	int cpus_in_pm;
+
+	switch (action) {
+	case CPU_PM_ENTER:
+		cpus_in_pm = atomic_inc_return(&priv->cpus_in_pm);
+		/*
+		 * NOTE: comments for num_online_cpus() point out that it's
+		 * only a snapshot so we need to be careful. It should be OK
+		 * for us to use, though.  It's important for us not to miss
+		 * if we're the last CPU going down so it would only be a
+		 * problem if a CPU went offline right after we did the check
+		 * AND that CPU was not idle AND that CPU was the last non-idle
+		 * CPU. That can't happen. CPUs would have to come out of idle
+		 * before the CPU could go offline.
+		 */
+		if (cpus_in_pm < num_online_cpus())
+			return NOTIFY_OK;
+		break;
+	case CPU_PM_ENTER_FAILED:
+	case CPU_PM_EXIT:
+		atomic_dec(&priv->cpus_in_pm);
+		return NOTIFY_OK;
+	default:
+		return NOTIFY_DONE;
+	}
+
+	if (handle_rpm_notification(priv))
+		return NOTIFY_BAD;
+
+	return NOTIFY_OK;
+}
+
 static bool gic_hwirq_is_mapped(struct mpm_gic_map *maps, int cnt, u32 hwirq)
 {
 	int i;
@@ -415,24 +458,33 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
 	if (irq < 0)
 		return irq;
 
-	genpd = &priv->genpd;
-	genpd->flags = GENPD_FLAG_IRQ_SAFE;
-	genpd->power_off = mpm_pd_power_off;
+	if (of_find_property(np, "#power-domain-cells", NULL)) {
+		genpd = &priv->genpd;
+		genpd->flags = GENPD_FLAG_IRQ_SAFE;
+		genpd->power_off = mpm_pd_power_off;
 
-	genpd->name = devm_kasprintf(dev, GFP_KERNEL, "%s", dev_name(dev));
-	if (!genpd->name)
-		return -ENOMEM;
+		genpd->name = devm_kasprintf(dev, GFP_KERNEL, "%s", dev_name(dev));
+		if (!genpd->name)
+			return -ENOMEM;
 
-	ret = pm_genpd_init(genpd, NULL, false);
-	if (ret) {
-		dev_err(dev, "failed to init genpd: %d\n", ret);
-		return ret;
-	}
+		ret = pm_genpd_init(genpd, NULL, false);
+		if (ret) {
+			dev_err(dev, "failed to init genpd: %d\n", ret);
+			return ret;
+		}
 
-	ret = of_genpd_add_provider_simple(np, genpd);
-	if (ret) {
-		dev_err(dev, "failed to add genpd provider: %d\n", ret);
-		goto remove_genpd;
+		ret = of_genpd_add_provider_simple(np, genpd);
+		if (ret) {
+			dev_err(dev, "failed to add genpd provider: %d\n", ret);
+			goto remove_genpd;
+		}
+	} else {
+		priv->mpm_pm.notifier_call = mpm_cpu_pm_callback;
+		ret = cpu_pm_register_notifier(&priv->mpm_pm);
+		if (ret) {
+			dev_err(dev, "failed to register for CPU_PM notifications: %d\n", ret);
+			return ret;
+		}
 	}
 
 	priv->mbox_client.dev = dev;

-- 
2.34.1


