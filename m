Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1345CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 10:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h55UH12lvi5qvyEigfzQK2YfBNXbPcu1QXY1N2+KKxs=; b=bHtFCGJoQXhhSNoRQqtIJfIQew
	YznkLy04+VMOSt1G491gESYkatSKQM7ldSHpJbXcp0ThmifUvuhxrdQf5AEPJqL0NRhqzj9zWsoOb
	bNrSDHVp7m/KlY5RQE7ws59kck5ciIu2IRj+oKF5cStLXzVvfLadvgB5BtOO4Tpt9Bf91KVDG2EDR
	tcnMUfIu52e0uVCor3U3y3pnGv5VEC8m614eAtwQAuIj4BvcK0QOnDm8opslJcdhzYEfZ3Jb3HI7C
	A1xn9ChW+aFR6XR3Ti6op1s0rjeKPkj9gRsdhIBRY7/Qv8u/zfE5lKrP4xtkcmimTpl9sRPXmQPjK
	csF/SmJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtbz-00000005LNU-2NlO;
	Tue, 09 Jun 2026 10:23:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtbw-00000005LKl-2JEQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 10:23:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vHZi1869322
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 10:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h55UH12lvi5
	qvyEigfzQK2YfBNXbPcu1QXY1N2+KKxs=; b=jFT8E2cO0n5l+K+kyNE9tMAtkO+
	VJGvA9nZnxZoyZfOdJGFtLAfBqiYwmhAHrtJNfXOiCl3hHbg/zO5B2xt5MJFuGtG
	tAmp8W5ojoszhWGOcBIqDmh1U5SgK1rbEdFddP3NkxsbGv6TbtpuMgFH6fZdbax3
	sKF12ckZ9P2OKXr5VLGvtkP8Xqkozy2BAV1tFcZlJlN3FN2eoymskJxnwSCXgLEu
	sRuo7BdrOEXFTGdxlzQq9z435xh8TU1YbFviag5kf9CBkWLmRiW06058Blj/RbqY
	CftS5gyqFsm8vdtZX7H5kxZlT6Ilwp7xEoDJC39eyv6xkPdAPH/Ub2KfXVA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqggn1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 10:23:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf335549b8so82745165ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 03:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000587; x=1781605387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h55UH12lvi5qvyEigfzQK2YfBNXbPcu1QXY1N2+KKxs=;
        b=NJ3wxuP6Sh/BX/n362U8D6yGCuwDg+3rX3kV1dKdmaXaWCpJylSRV0ZkoRukyKmCNb
         f1TlENleh3g82aEmn/bY9LM70hA1WGMiQkgF2Jb/yPio3Z59M29FaECRLD3uDMg5E7Fx
         Yh1VY01CbC8PM2GZ9rxS25fxK/9Q6FZGdhMuGP+QBvMNy2MmK1bc8qNSuZWiNBEHSwsa
         vpjemjYQxpyoHVu1nf7d1MND6dEI/CQn2EF2OFcjM7tPT1g6bWsq0k7zXbGvDJEglOM7
         Q7JdGHoJ2DO/Qx2pcXEYNPvH630a6YUx5iIHkNXM40qng7zJZCxsgOoMeGWPfndPvyRI
         3mYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000587; x=1781605387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h55UH12lvi5qvyEigfzQK2YfBNXbPcu1QXY1N2+KKxs=;
        b=SPS8s0h2lZ8rYwbu0tOsDZ5i/aNvnyR4ayYwPBT44X8R+zVu6hwnOHptzBTCgeJduL
         utJkNTlSF2fmzvCZA4J/TlHCTOFcn7yMdf0OcARnCeW/VGn4W8m3H19vthR6hzxDUg74
         0wGxWGhEH3m4No1cvumtom9qbokUg81FjZdwDNyR+afRQOazXHHCi15KEJfmcJHr6A6r
         9O2H1F1aEiAcojB7OboMadQcn53Do+hI7zED4NCqYEi6l2VNWhARDcl5wHOMggbhyUlb
         eXq/Ok2mIGKUsfuYs632GQXgBsgML3lGsTkfkPCFnywgDVnveA3KEG3y/jhi+qR7Rlac
         paFA==
X-Forwarded-Encrypted: i=1; AFNElJ8XXoLP8WlXKKCWbM9yddQKqQjrmGQKbCbsji5Is5XRz0wIjkNAvXJIiLRlmYiaczPZrzwMnL0A/pr6BRbcDdaa@lists.infradead.org
X-Gm-Message-State: AOJu0YxAj9v1qAFGa7Bm3qliB+vplqn5YU7XFA5wvqlBjCz2wnnakNxX
	Ogej7+pmhpUgsDqwBZAX6dze0IuZhAPkuiZLymouAbBgc9pkzEeTXPU4uwXRgfUERAaUZ7eVxqq
	AzYN3/owTWT8KX5ZnFePUEMlSiQLDW9kHcJY6anljYt9Cq8xPZnZcoqmmn6NDaxqJyE94z18H1H
	08IA==
X-Gm-Gg: Acq92OH8GHQJKXNvp+2bKRoO2XXuKIUhrOYYOoYqisACvQAG6pcBudf+zyMYyYq6tqf
	gIiTRrWiRSOJ/Et2i2RbOgPZqCDtD7bgK13nTI8eH4Pgu8yF+seEEZJJwdVBEAgf8BeJOs9hG8q
	9gPcbkzpRzNFDkkrSDBrx/N/0AI8pmK1CTnfKnNlAwq8jHWByZShSYZ0wdVhS+daN74Pp7URlu+
	fH2ILBWRtVz8TnPPYIjTICUvcjutR9ESqXJUHburNm0p+oQIJ1q9geVdncMnZsk4bg31aWr3A2l
	HwRDU4wAOIwk+Q23jHCPYrnVeCuSKbWcn33C/rNkgJ3cWejaYELWdXwGAafePxdXZfEhS9A2pYP
	HbCbSwKdpQEfB0ghj6X7+v1VODc0hU4snneGVQ0cspszarFPO+Ab5zInd7cE=
X-Received: by 2002:a17:903:8ce:b0:2c0:b4f5:41ea with SMTP id d9443c01a7336-2c1e7e93bf0mr204077495ad.17.1781000587142;
        Tue, 09 Jun 2026 03:23:07 -0700 (PDT)
X-Received: by 2002:a17:903:8ce:b0:2c0:b4f5:41ea with SMTP id d9443c01a7336-2c1e7e93bf0mr204077095ad.17.1781000586575;
        Tue, 09 Jun 2026 03:23:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e86dsm213121685ad.8.2026.06.09.03.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:05 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/3] remoteproc: check return value of subdev stop and unprepare callbacks
Date: Tue,  9 Jun 2026 15:52:51 +0530
Message-ID: <20260609102254.2671238-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
References: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NyBTYWx0ZWRfXxRaNmbqS1yLP
 BR/fOGXSkjVx9zYpCGA4sCnahDbXnY4eZfe+7K6YxshQ8uWqHTgn8Art+PgLohMtMumO+rCWSOE
 be2VQQp+xqHOQINPEeDGEV/vxZG9tRUI8RHmwMWuYHDkww5S1dURbPcHczmd4K4J296lXbQ/Csn
 f+1TTAPkYYP3nW8rbgoSKmeXhRX0eS/W0886CayKNq5tcCDwuEY8NxE9EyTbazOOlhynxuV/u0a
 Y8kTElV0Z4b8ekisYqI+nMOpxyQzlYERe1dz6fVwhk5O0XFB2BB5ymFYX5xq9ByIWJTw6fAJyMc
 eWdn2b+N93K85qtBaXVnUy60vAYh13l8UGRwspK7WEswzPo2lBklyRnkl0ON1KFIv79l1xzFsu9
 KsbgeQusCG40+sMzhjcJENbuxRAfQR+EgsJXki9auCDzsD0qkyrKGEBgGioHgYlOoG3NaiEfE0F
 xZtOYsIbt/5ulP1BXqA==
X-Proofpoint-ORIG-GUID: I6CAqyxUQSlemZ7gmRT8fqBaDrwvAIwh
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a27e98b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=KgjLDdhTq4KzWEx1KCkA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: I6CAqyxUQSlemZ7gmRT8fqBaDrwvAIwh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_032308_623551_F2B74009 
X-CRM114-Status: GOOD (  21.07  )
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

The stop() and unprepare() callbacks in struct rproc_subdev were void,
making it impossible for implementations to report failures.  Unlike
prepare() and start() which already return int and have their errors
checked, errors during teardown were silently discarded.

Change the callback signatures to return int.  Update
rproc_stop_subdevices() and rproc_unprepare_subdevices() to check each
return value and emit a warning on failure while continuing to visit all
remaining subdevices (best-effort teardown).

rproc_vdev_do_stop() propagates the error from device_for_each_child()
which it was already computing but had no way to surface. All other
implementations (glink, smd, ssr, pdm, sysmon) gain a return 0 as they
have no failure paths.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_common.c       | 26 +++++++++++++++++++-------
 drivers/remoteproc/qcom_sysmon.c       | 10 +++++++---
 drivers/remoteproc/remoteproc_core.c   | 16 ++++++++++++----
 drivers/remoteproc/remoteproc_virtio.c |  4 +++-
 drivers/rpmsg/mtk_rpmsg.c              |  8 ++++++--
 include/linux/remoteproc.h             |  4 ++--
 6 files changed, 49 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index fd2b6824ad26..05a599318763 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -216,19 +216,23 @@ static int glink_subdev_start(struct rproc_subdev *subdev)
 	return PTR_ERR_OR_ZERO(glink->edge);
 }
 
-static void glink_subdev_stop(struct rproc_subdev *subdev, bool crashed)
+static int glink_subdev_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
 
 	qcom_glink_smem_unregister(glink->edge);
 	glink->edge = NULL;
+
+	return 0;
 }
 
-static void glink_subdev_unprepare(struct rproc_subdev *subdev)
+static int glink_subdev_unprepare(struct rproc_subdev *subdev)
 {
 	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
 
 	qcom_glink_ssr_notify(glink->ssr_name);
+
+	return 0;
 }
 
 /**
@@ -327,12 +331,14 @@ static int smd_subdev_start(struct rproc_subdev *subdev)
 	return PTR_ERR_OR_ZERO(smd->edge);
 }
 
-static void smd_subdev_stop(struct rproc_subdev *subdev, bool crashed)
+static int smd_subdev_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct qcom_rproc_subdev *smd = to_smd_subdev(subdev);
 
 	qcom_smd_unregister_edge(smd->edge);
 	smd->edge = NULL;
+
+	return 0;
 }
 
 /**
@@ -465,7 +471,7 @@ static int ssr_notify_start(struct rproc_subdev *subdev)
 	return 0;
 }
 
-static void ssr_notify_stop(struct rproc_subdev *subdev, bool crashed)
+static int ssr_notify_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
 	struct qcom_ssr_notify_data data = {
@@ -475,9 +481,11 @@ static void ssr_notify_stop(struct rproc_subdev *subdev, bool crashed)
 
 	srcu_notifier_call_chain(&ssr->info->notifier_list,
 				 QCOM_SSR_BEFORE_SHUTDOWN, &data);
+
+	return 0;
 }
 
-static void ssr_notify_unprepare(struct rproc_subdev *subdev)
+static int ssr_notify_unprepare(struct rproc_subdev *subdev)
 {
 	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
 	struct qcom_ssr_notify_data data = {
@@ -487,6 +495,8 @@ static void ssr_notify_unprepare(struct rproc_subdev *subdev)
 
 	srcu_notifier_call_chain(&ssr->info->notifier_list,
 				 QCOM_SSR_AFTER_SHUTDOWN, &data);
+
+	return 0;
 }
 
 /**
@@ -572,16 +582,18 @@ static int pdm_notify_prepare(struct rproc_subdev *subdev)
 }
 
 
-static void pdm_notify_unprepare(struct rproc_subdev *subdev)
+static int pdm_notify_unprepare(struct rproc_subdev *subdev)
 {
 	struct qcom_rproc_pdm *pdm = to_pdm_subdev(subdev);
 
 	if (!pdm->adev)
-		return;
+		return 0;
 
 	auxiliary_device_delete(pdm->adev);
 	auxiliary_device_uninit(pdm->adev);
 	pdm->adev = NULL;
+
+	return 0;
 }
 
 /**
diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 913e3b750a86..44b905a7e129 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -531,7 +531,7 @@ static int sysmon_start(struct rproc_subdev *subdev)
 	return 0;
 }
 
-static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
+static int sysmon_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon, subdev);
 	struct sysmon_event event = {
@@ -548,7 +548,7 @@ static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
 
 	/* Don't request graceful shutdown if we've crashed */
 	if (crashed)
-		return;
+		return 0;
 
 	if (sysmon->ssctl_instance) {
 		if (!wait_for_completion_timeout(&sysmon->ssctl_comp, HZ / 2))
@@ -559,9 +559,11 @@ static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
 		sysmon->shutdown_acked = ssctl_request_shutdown(sysmon);
 	else if (sysmon->ept)
 		sysmon->shutdown_acked = sysmon_request_shutdown(sysmon);
+
+	return 0;
 }
 
-static void sysmon_unprepare(struct rproc_subdev *subdev)
+static int sysmon_unprepare(struct rproc_subdev *subdev)
 {
 	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon,
 						  subdev);
@@ -574,6 +576,8 @@ static void sysmon_unprepare(struct rproc_subdev *subdev)
 	sysmon->state = SSCTL_SSR_EVENT_AFTER_SHUTDOWN;
 	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
 	mutex_unlock(&sysmon->state_lock);
+
+	return 0;
 }
 
 /**
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f003be006b1b..21127d972bff 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1113,20 +1113,28 @@ static int rproc_start_subdevices(struct rproc *rproc)
 static void rproc_stop_subdevices(struct rproc *rproc, bool crashed)
 {
 	struct rproc_subdev *subdev;
+	int ret;
 
 	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
-		if (subdev->stop)
-			subdev->stop(subdev, crashed);
+		if (subdev->stop) {
+			ret = subdev->stop(subdev, crashed);
+			if (ret)
+				dev_warn(&rproc->dev, "subdev stop failed: %d\n", ret);
+		}
 	}
 }
 
 static void rproc_unprepare_subdevices(struct rproc *rproc)
 {
 	struct rproc_subdev *subdev;
+	int ret;
 
 	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
-		if (subdev->unprepare)
-			subdev->unprepare(subdev);
+		if (subdev->unprepare) {
+			ret = subdev->unprepare(subdev);
+			if (ret)
+				dev_warn(&rproc->dev, "subdev unprepare failed: %d\n", ret);
+		}
 	}
 }
 
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index d5e9ff045a28..128d3088a959 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -480,7 +480,7 @@ static int rproc_vdev_do_start(struct rproc_subdev *subdev)
 	return rproc_add_virtio_dev(rvdev, rvdev->id);
 }
 
-static void rproc_vdev_do_stop(struct rproc_subdev *subdev, bool crashed)
+static int rproc_vdev_do_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct rproc_vdev *rvdev = container_of(subdev, struct rproc_vdev, subdev);
 	struct device *dev = &rvdev->pdev->dev;
@@ -489,6 +489,8 @@ static void rproc_vdev_do_stop(struct rproc_subdev *subdev, bool crashed)
 	ret = device_for_each_child(dev, NULL, rproc_remove_virtio_dev);
 	if (ret)
 		dev_warn(dev, "can't remove vdev child device: %d\n", ret);
+
+	return ret;
 }
 
 static int rproc_virtio_probe(struct platform_device *pdev)
diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
index 1b670ed54cfa..d8ea77055f31 100644
--- a/drivers/rpmsg/mtk_rpmsg.c
+++ b/drivers/rpmsg/mtk_rpmsg.c
@@ -326,7 +326,7 @@ static int mtk_rpmsg_prepare(struct rproc_subdev *subdev)
 	return 0;
 }
 
-static void mtk_rpmsg_unprepare(struct rproc_subdev *subdev)
+static int mtk_rpmsg_unprepare(struct rproc_subdev *subdev)
 {
 	struct mtk_rpmsg_rproc_subdev *mtk_subdev = to_mtk_subdev(subdev);
 
@@ -334,9 +334,11 @@ static void mtk_rpmsg_unprepare(struct rproc_subdev *subdev)
 		mtk_rpmsg_destroy_ept(mtk_subdev->ns_ept);
 		mtk_subdev->ns_ept = NULL;
 	}
+
+	return 0;
 }
 
-static void mtk_rpmsg_stop(struct rproc_subdev *subdev, bool crashed)
+static int mtk_rpmsg_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct mtk_rpmsg_channel_info *info, *next;
 	struct mtk_rpmsg_rproc_subdev *mtk_subdev = to_mtk_subdev(subdev);
@@ -372,6 +374,8 @@ static void mtk_rpmsg_stop(struct rproc_subdev *subdev, bool crashed)
 		kfree(info);
 	}
 	mutex_unlock(&mtk_subdev->channels_lock);
+
+	return 0;
 }
 
 struct rproc_subdev *
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 7c1546d48008..315c479d163a 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -335,8 +335,8 @@ struct rproc_subdev {
 
 	int (*prepare)(struct rproc_subdev *subdev);
 	int (*start)(struct rproc_subdev *subdev);
-	void (*stop)(struct rproc_subdev *subdev, bool crashed);
-	void (*unprepare)(struct rproc_subdev *subdev);
+	int (*stop)(struct rproc_subdev *subdev, bool crashed);
+	int (*unprepare)(struct rproc_subdev *subdev);
 };
 
 /* we currently support only two vrings per rvdev */
-- 
2.53.0


