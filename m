Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56556C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 08:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2/kVY45kFFvmt4/OmFH3Sfmb2hAQIhCwou1/OEh8Zyo=; b=pn7IDhOPwwmGyVrqSZaDDRhSDa
	JwA5U+sag27LMrvTD7lplwjkxOTs8EKlFwEpeKW1pqxPF5tE/+i6GrALFi+X5SbQpGycsUdejb6Sn
	fif+tOJhG7IoL9O2wntLFEUNWdeJ77pqXkD5kLadzhaEQFNBIhub8NcVa0C+4+I9en0yIPjtDnKi7
	+JuzfSMVB8ZqB+sTW020zZV4DNaf+bBi3wj2wX/f8gwiIHul7t9uaiAczLCE/vGfjsCF/1siHgLiB
	FAvPYgL9UZFLCCVg9F4EDHXoglDqM9xYZHB+guW4c6dcyhRNKxe+wvaSlZmQoUNxSyz/iSV9RQNSd
	gFJlQJTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9GT-000000027CM-0WpT;
	Wed, 26 Aug 2026 08:45:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9GR-000000027C1-017i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 08:45:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6RmGd106169
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 08:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2/kVY45kFFvmt4/OmFH3Sfmb2hAQIhCwou1
	/OEh8Zyo=; b=B63peQqVOKA2eGEINh8+3hjQIscOzshtXKATM60vvo7L3RrqtMI
	iA0NgXUy43PjA+0LBMCjsXPX5MqY5wjt9tBTptD9OPRIOZlEc4R6AuV4DuivQ0/g
	43WYhf58/OYd5YnotHVTXChGgJACW25XgWLAklVcR0VaETzd7JIt0TbeAgwsfPQf
	SxhAhoPG2+WmYyGYNKDHMI0uwHcuyX/q+srSJG6fHmg2q1bYHLwYGrRaxXr1Uahh
	jm80rJDN+BLFBG5NUy9QvYM+VQNk4giJUkCjLI7eS1OMwNcC5aci7qRAb1k+ms+X
	qQ0p1cZUhpnAo4am43+wPUGaXZlZoYccjcA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r0k17yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 08:45:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52e7a49452aso1483181cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 01:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787733941; x=1788338741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2/kVY45kFFvmt4/OmFH3Sfmb2hAQIhCwou1/OEh8Zyo=;
        b=eJfhAvfCKvPYL0QDdsRFCVmfUwJF1LyaPHcBvpVeefsuplQpF0ldHbfU1s6vp4hHyB
         ndQoDwMJ82qmpq6Ifur/w2M6Ct3LvM9gcAcU0LbEk3wlq0y8UymMQjalgr7IsY15JUvX
         8mcGoMlkuHU/aXcV0JOLGGbhAYf+PannwxqkWiktfGqtbJxwAXF1pYESaCEEueUWVuDf
         iA6cXDIhOvoG5VGa1YfQi/qrsDEbWf+/YriRmaW6EqbWLhULRwu8M744t2tJdJOpV+sq
         SGeIh9JXEGVFMqHusl1UlOvmncxJgI1BwZTOaxUicC3V4V6l32u8ZfkMoBL7sUMNDMnU
         oqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787733941; x=1788338741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/kVY45kFFvmt4/OmFH3Sfmb2hAQIhCwou1/OEh8Zyo=;
        b=BPoaqCN/jMCjCSLN/ZZjU0aMCmhao7h5xOIlECxRLErW0i8xF1dcjdAxmUBxYO9DoG
         vKXtwJFCcx6SRIyv9sMYXqh/7aB7lmHmoqyC+ueN/98lDbIbQDDMa9BS0/9gDHL1TlgR
         RW6B+OawaA1kFHN/cWCJWBHDyTLnLR9Rv1X0am5U+cBWskR7mwNL7vrmWAjOz9/UuV/C
         3dV2a2k4aiNqUlgg0knhLkAYuU/Dulvqm8+iuPgE2KBt7FPkRHj9DCZLgBoBUeYYx1p6
         IxELrVtuiBxmmhHGC8+B2lolaEhsfGuHvG9A54G/ZB3JYqizaVJC162q0n3xavynOFS9
         3gDg==
X-Forwarded-Encrypted: i=1; AHgh+Rqpp/vM9WOCDpUje6tYf3lown4JLJkPRTXVVBr4YjxyyfN3xZj2cEJ6N/NoXfn+11PUFdJGT9xw73s7yD8UHBnm@lists.infradead.org
X-Gm-Message-State: AFuF++nmuRuCt5N46PuBvBHkAuzKq2COjENCGFwf6UaaA9Jpu7DK1sqy
	yYI89Scg/t89HI1m079gl4o3XNZqCyYyCLVqK3jr6DuA1dPWtcPL5yLdT5iEm0cVzn0fAjS7VOl
	fdIcF1yTA8de/24JmpMQCyZdMJcfo9/skJ49RQKPQIO6tLwcFVtidMjXYGH9mzbW2JVFSWhRY6u
	p9VQ==
X-Gm-Gg: AR+sD11tyr6gfp9iUGc4dK6u1FOOQzgAG+Mbf+dC82kJfQQ0IwVat4EJBGMOrRJGYtZ
	90TJT9ReyojmSJ71m3si+x/qLRIh0a5jkW9Kin4WAUCBmkVlzYXFuxM7GlAUiTSkcPA4EIlEBbQ
	nRDVRspb8pGXl/tDYHLLuzYcI+3gCqLXx8n8pSY/qvx3F+H4FL/MaorIpM6W1qQh/OiDN8Dnf6f
	dWlkWb8pMnoHEexIkqAd7sBE09XmkR2qXP7/0gSRkqwZZJrFbVshnPbWe/o9JphQm2r6M1myYeZ
	Xbu+0dc/5OR3jTEx9gXI3i3z5tu1forj5aaoNNUAN9GBtCYoGRi9q+k+oJNnD8R3QynIei+wgpD
	Rd6ugezY+9XQX6l3WHsA=
X-Received: by 2002:ac8:6107:0:b0:517:6550:2a0 with SMTP id d75a77b69052e-52e422f3887mr49750241cf.19.1787733940497;
        Wed, 26 Aug 2026 01:45:40 -0700 (PDT)
X-Received: by 2002:ac8:6107:0:b0:517:6550:2a0 with SMTP id d75a77b69052e-52e422f3887mr49749741cf.19.1787733940055;
        Wed, 26 Aug 2026 01:45:40 -0700 (PDT)
Received: from uffe-tuxpro14.. ([2a02:1406:25a:ca5e:abe3:6901:a5de:f02d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9ef996sm459088866b.62.2026.08.26.01.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:45:39 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        stable@vger.kernel.org
Subject: [PATCH] cpuidle: psci: Fix support for probe deferral by dropping the faux device
Date: Wed, 26 Aug 2026 10:45:32 +0200
Message-ID: <20260826084533.38960-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fPEJG5ae c=1 sm=1 tr=0 ts=6a8ea7b5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=mNtU--nUWWSV7jGK8nsA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3MSBTYWx0ZWRfX5YZFg0EybQhq
 T6XgvZ8t/F62A1SKeV3KWzP2w6I9eMUyTXM64PoC5KcLUsBkwY/+ZevoYje7L/sXbq1pTpr080x
 40D18fxWm68vE8K+GOMBt5KPFCQJP4E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3MSBTYWx0ZWRfX68R/OQt10jcw
 fYCfQk+YZ5+b8mwRASznptZu/CLGEtRljOWFPwbYpifcrQpt2i8GOMZQPEWBM3Uq7C6/OfmBI0D
 q0oHHCkm17BAX/2lsbQbnvA2B0Uy9H/EikCX4OdmgVGUkVbU/pbZJgsB0ID0XftQj8AUKshSkll
 Xqy8h025gpkiCOXc52f2+X79Ro6KRsY600cwmqBg6oGzgelWlVa4l1oQyZYB/oqCJ3pzbVTOmPs
 qxM3QGDp5W8pdvRF5fn3dAWvUooddtcHoOFiNMGQmNWoSJGZ46y6QHdGXRMRLp52Q2ncwEefGbX
 Xy1Vsmn2yDc3AbFL7gPbUDWQesSlfbOz1HxQ54SRo/seB9qCle+s/Nc65+VGyz9wA7JywJ2F43m
 IaBMGU4dnRtsprZgbE2/PmnIH1GpcAz0xEQKanNu1Yv6Jm+MjucCTDnS4nyfcn4zMVUdZ9MeEo2
 yvA++j1qj8wolkNVqBQ==
X-Proofpoint-ORIG-GUID: n4uAW8dgJjNdHEoLNo3wH-cpg0aKdV1u
X-Proofpoint-GUID: n4uAW8dgJjNdHEoLNo3wH-cpg0aKdV1u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_014543_055581_1332F3A3 
X-CRM114-Status: GOOD (  20.33  )
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

At the conversion to the faux driver/device we broke the support for probe
deferral. In hindsight, the move to the faux device seems questionable, as
it simply makes the code more complicated and for no good reason.

To fix the support for the probe deferral let's therefore restore the old
code and drop the faux device.

Fixes: af5376a77e87 ("cpuidle: psci: Transition to the faux device interface")
Fixes: 5836ebeb4a2b ("cpuidle: psci: Avoid initializing faux device if no DT idle states are present")
Fixes: 39cdf87a97fd ("cpuidle: psci: Fix uninitialized variable in dt_idle_state_present()")
Cc: stable@vger.kernel.org
Signed-off-by: Ulf Hansson <ulfh@kernel.org>
---
 drivers/cpuidle/cpuidle-psci.c | 42 +++++++++++++---------------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index dcf20ea5ef5e..b250d0dde760 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -16,7 +16,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/device/faux.h>
+#include <linux/platform_device.h>
 #include <linux/psci.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
@@ -428,14 +428,14 @@ static int psci_idle_init_cpu(struct device *dev, int cpu)
  * to register cpuidle driver then rollback to cancel all CPUs
  * registration.
  */
-static int psci_cpuidle_probe(struct faux_device *fdev)
+static int psci_cpuidle_probe(struct platform_device *pdev)
 {
 	int cpu, ret;
 	struct cpuidle_driver *drv;
 	struct cpuidle_device *dev;
 
 	for_each_present_cpu(cpu) {
-		ret = psci_idle_init_cpu(&fdev->dev, cpu);
+		ret = psci_idle_init_cpu(&pdev->dev, cpu);
 		if (ret)
 			goto out_fail;
 	}
@@ -455,36 +455,26 @@ static int psci_cpuidle_probe(struct faux_device *fdev)
 	return ret;
 }
 
-static struct faux_device_ops psci_cpuidle_ops = {
+static struct platform_driver psci_cpuidle_driver = {
 	.probe = psci_cpuidle_probe,
+	.driver = {
+		.name = "psci-cpuidle",
+	},
 };
 
-static bool __init dt_idle_state_present(void)
-{
-	struct device_node *cpu_node __free(device_node) =
-			of_cpu_device_node_get(cpumask_first(cpu_possible_mask));
-	if (!cpu_node)
-		return false;
-
-	struct device_node *state_node __free(device_node) =
-			of_get_cpu_state_node(cpu_node, 0);
-	if (!state_node)
-		return false;
-
-	return !!of_match_node(psci_idle_state_match, state_node);
-}
-
 static int __init psci_idle_init(void)
 {
-	struct faux_device *fdev;
+	struct platform_device *pdev;
+	int ret;
 
-	if (!dt_idle_state_present())
-		return 0;
+	ret = platform_driver_register(&psci_cpuidle_driver);
+	if (ret)
+		return ret;
 
-	fdev = faux_device_create("psci-cpuidle", NULL, &psci_cpuidle_ops);
-	if (!fdev) {
-		pr_err("Failed to create psci-cpuidle device\n");
-		return -ENODEV;
+	pdev = platform_device_register_simple("psci-cpuidle", -1, NULL, 0);
+	if (IS_ERR(pdev)) {
+		platform_driver_unregister(&psci_cpuidle_driver);
+		return PTR_ERR(pdev);
 	}
 
 	return 0;
-- 
2.43.0


