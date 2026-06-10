Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BF4CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBVvbqlw+1NOFx2/e/goeBGUj7Yh97eXwaqTR4dNxy8=; b=G7+REq93t10EO4celMf1tmLmz0
	8cxj3cqdfxb0nGqm3Npj96+zG+l9ZFkaZyqAN6o9WzRmGS0AHwX6ZqztiIXBENXUkqfAreS1oCM5a
	MhPPDJhowsEup8UebX9rW2D0QauP4YDnMHSEIYnSvWZTTabCcqm3U59rh3yq0/41TyaHmU0teszOg
	d5QDScwYVaDHsZbkgv5+7NGCTX5JE4MoiIz5mQ+44EaxkntNqjkLyg9eCndBuY5z8jQ2vmH9zKzpm
	/b52MDFIktxICyVcHs/3cIF7qU3ngMrj+P6JWQmS7FDxOGuIK3L5teFmL0Qz65hJz1djwps9rqUsF
	XzbpcnFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEfz-000000078QP-0rfn;
	Wed, 10 Jun 2026 08:52:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEfn-000000078K9-3r9S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:52:41 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7j2O4947971
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 08:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MBVvbqlw+1NOFx2/e/goeBGUj7Yh97eXwaqTR4dNxy8=; b=HE5y9W2nDO3tuHbH
	jq/cMrHyhdghrYiGW8i9yilPHf/YHs1MjNi3rEqmXjqEn1YzAwazfG8fezKQCEKs
	OFveIOZeGBG21A+I7NfnrlwJvKUehJTFf/dxFJOT769ym4CoFnJl3Wo8L8eIi8uK
	jCtrKwLWnePuP3ivIiuxA9JFlMldURb+aoAWehuSy//kD8sIBtjcWoLZPtCJWEPx
	Ym9G6EnKHGjxZI7jG3LiceDNtrZ4/fL375qCHFIJVIiyxFw44EQPaEPf2MHnoYYe
	BVWo1yIblsLrrkBgE7hslCe0xxNnutwGXEy2Qpu84xfW0MlhqMwlSYS5rnwVC6xS
	dTim1A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnnsm1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 08:52:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0532a6588so61059275ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081550; x=1781686350; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MBVvbqlw+1NOFx2/e/goeBGUj7Yh97eXwaqTR4dNxy8=;
        b=GqHEqJTkejiiJoq46X3dtPsD7vV6SV7YaNoQ4YTf3u+V2nuiwGcP3q2mtE+u1goIVp
         OvQNE31l7Ch0jt/ZCxDT7bw0HLwpcVa1L288g6xlEW6m0j9pkw8FxeaKY3NFWlqm10qn
         ojlYTXohQPLNreRpT4mWiF089ATcmxjBxnsUo+RJfVFZmbZ8gYMtJlgx+HnOczQaWnA9
         Tk/Pah8s2e0Wgkd+NLinyniqQG/7EJHAr8teeHNB3bQQrt4xF2nwWHguk+emidvkcoBq
         sLWyECbLhErrhvtORppo0T6AawiA3+x7Q4FKJ54AWs8Ih2+J2XkUP5B8vagRg2OYrS5X
         FyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081550; x=1781686350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MBVvbqlw+1NOFx2/e/goeBGUj7Yh97eXwaqTR4dNxy8=;
        b=Ql7wn/HIe3ft6+TAApgEJSLxldpTJZMJEBugmzo76zt4z52ZAQHNBtcf1XjhhUV4Nu
         z3IlwVcOs8vYCiGIK8zKPq21ex4d1eB4jsMYmnnGctncnp+wg+iHO9NqYyBMjq8F8oi8
         rdJVmi+HU2fX+N5ubq8ZV1qGwBBG0qsdGrHL6lB0eio7vv+ePu/cwkOp8BJ7eXfu/+Ur
         m4q6c8HN+c1gAtVkBSz629ZNQcU77cCNuJMLV+vs+SyHlTFyo9ZXIr2G+gESaE0rFXl2
         cNL8OOTfEJLqODCZrl900IYXrhbZaqRwgGbukyhcWC2wjxQ/z45zCGBngHhKPgr3HX2t
         RIfA==
X-Forwarded-Encrypted: i=1; AFNElJ//kPiIPRJ7NCz1DrvqbLK/1ANBnADAIgfj69au3jK8pJ7nEJAL7TgQa3i9UcjVltdE3Iz77fD8p7x/VLtpU+Qo@lists.infradead.org
X-Gm-Message-State: AOJu0YxhaBK+2WM4aWh3nAkgFz0keQCjGCsbbx9HJssBFwu0FTJLMFHg
	aY6JSZ8GEEbcZAkMo7V27ophw/xLed9YwVSMUp/Df4wg/7mFVr5lJ4ljhbp7Ce/4I/lVcJfK3hX
	Voi6YiNLAam3spsNdYHACh2CTMlHyG2/QXXFpAX2Vk6caV3IDHgjIibqxjdB77QO8cBqX0siy0i
	9ZQA==
X-Gm-Gg: Acq92OGI8QBSOr8vDnzhii2giJTKRRNyQ98sStHrwpuETk9Zljf6xw2iaVc787glH4z
	XOLm2pp2hvBNutxYquLKrmo75nCshO7MjkARfNpanuVjpBSnITRipiCcxEXSKDNXVmCKyPhNAt5
	0o0SZKOJQYRxB9bZvysjXRknrIqqO64gQV1hCgKXUugPIB6eBs5EHPLr7HBSLesDHKTfIuDrT9q
	Z7c5prAqn4FGIfQhgBAsA1ykSifqJMNieeJElh3EErgLsZC/Se+yfgJ8RBEtgWBBjU7/NB6v77J
	++qVhRIhDjwZpH9YzveFMiUPGzP+Cw206xWYWOVnMCBFm8NSJhqA10fmmi3dFz/OJfh0ZtIDDOs
	EjcZwsb2+mA2t7vLY4KHYNs3JQuc1hY90QyxmuCLFsL9h6l2m7qQmQSgkQU0pr6Y0aNmsjOk6yN
	EN4XMtUkAgIW/3Ae8N2P8baAMslB1DwaDgZdAb0oYJ91d3DSxGRA4cvzN3sVY=
X-Received: by 2002:a17:903:fa7:b0:2c0:dd75:e824 with SMTP id d9443c01a7336-2c1e80f98cfmr263574155ad.4.1781081549598;
        Wed, 10 Jun 2026 01:52:29 -0700 (PDT)
X-Received: by 2002:a17:903:fa7:b0:2c0:dd75:e824 with SMTP id d9443c01a7336-2c1e80f98cfmr263573845ad.4.1781081549156;
        Wed, 10 Jun 2026 01:52:29 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm114618175ad.45.2026.06.10.01.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:52:28 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:21:32 +0530
Subject: [PATCH RFC v7 5/9] PM / devfreq: Add new track_remote flag for
 governors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-rfc_v7_scmi_memlat-v7-5-f3f68c608f25@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781081505; l=3562;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=i8JmP8t0IIDx2YuhJ586pU9J0+L8gn09QqoMvPwEzvk=;
 b=SjTlP3ljJexiSuNiz3k1DP81x2Nsjn02FN9iDLP4o7nw/yM9wDBLOmgzsNAF1zQPVffbuYZwV
 fiaFkBpgVjuBwr4NTgxGOi3wvNISInadO5xNeaHkiIXZp5iXDIa9ywS
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-GUID: dGiZqJJBM4GqPQ8fL15GTeUJjHUJzSOM
X-Proofpoint-ORIG-GUID: dGiZqJJBM4GqPQ8fL15GTeUJjHUJzSOM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX5qhamweYhbdI
 I5ci1Te+HV3k02y6KqSsmqD7+AHHnilCWBmr+AsF37O9YB1SncYLBS8aDapPKHC0ZXK26enrMef
 YjnO+Vr2S9YQXnDbgOQBtmJnXajA0p6T3QZBfFVoSWZFZjNEoxMPQbdhCSsDw4DYvcDdiffL6Mr
 H7ZduKdA7Z/+gi8h+BddxGqgdMQWlBUMfI7++GXidBeIdHprChmvd0NdjC+AUt/+giF3cKcwOSh
 cnroLBNZbhm6IU7L/AE+XU7FezfTf9mgDd7YbUKiBEgU2vBvtjU7Qe9Z4fIaTbyG2EGtLyZBl0v
 pHS+iss7AswpdveXlPOU9883ExOk9ieYVuKUuOkMsq2QaAvRiBMs81yU67R70YYtdODv5sN2Gu9
 Y9+032viPxT7QNVJ2fmDZhZrgzZvgzQGUSre5ytGNspcgnt8Pci6g6sOWPhPGgdV0bNfZIdxFGe
 ZXHbGzByAaTmguI+7sg==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a2925ce cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_Sn8c3TY04LLovrI2V0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_015232_086129_827B8ADD 
X-CRM114-Status: GOOD (  19.29  )
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

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Some devfreq governors need to track frequency changes performed on remote
devices rather than driving the frequency updates themselves. In such
cases, the device's frequency is already updated by an external entity and
devfreq only needs to keep its transition statistics and notifier
subscribers in sync.

Add a new DEVFREQ_GOV_FLAG_TRACK_REMOTE governor flag. When set,
devfreq_set_target() skips the profile->target() update sequence but still
emits the DEVFREQ_PRECHANGE/DEVFREQ_POSTCHANGE notification pair and the
devfreq_frequency trace event, so transition-notifier subscribers (passive
governor, devfreq cooling, etc.) and tracing observe the remote frequency
change exactly as they would on the normal path, and the transition
statistics are refreshed.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 drivers/devfreq/devfreq.c        | 21 +++++++++++++++++++++
 include/linux/devfreq-governor.h |  5 +++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index 2f27a239e34a..71c6ced9e4e1 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -348,6 +348,26 @@ static int devfreq_set_target(struct devfreq *devfreq, unsigned long new_freq,
 	unsigned long cur_freq;
 	int err = 0;
 
+	/*
+	 * When a remote agent (e.g. firmware) owns the frequency, skip the
+	 * local profile->target() call. Still emit the PRECHANGE/POSTCHANGE
+	 * pair and the trace event so that transition-notifier subscribers
+	 * (passive governor, devfreq cooling, etc.) and tracing observe the
+	 * frequency change exactly as they would on the normal path.
+	 */
+	if (devfreq->governor &&
+	    IS_SUPPORTED_FLAG(devfreq->governor->flags, TRACK_REMOTE)) {
+		freqs.old = devfreq->previous_freq;
+		freqs.new = new_freq;
+		devfreq_notify_transition(devfreq, &freqs, DEVFREQ_PRECHANGE);
+
+		if (trace_devfreq_frequency_enabled() && new_freq != freqs.old)
+			trace_devfreq_frequency(devfreq, new_freq, freqs.old);
+
+		devfreq_notify_transition(devfreq, &freqs, DEVFREQ_POSTCHANGE);
+		goto update_status;
+	}
+
 	if (devfreq->profile->get_cur_freq)
 		devfreq->profile->get_cur_freq(devfreq->dev.parent, &cur_freq);
 	else
@@ -375,6 +395,7 @@ static int devfreq_set_target(struct devfreq *devfreq, unsigned long new_freq,
 	freqs.new = new_freq;
 	devfreq_notify_transition(devfreq, &freqs, DEVFREQ_POSTCHANGE);
 
+update_status:
 	if (devfreq_update_status(devfreq, new_freq))
 		dev_warn(&devfreq->dev,
 			 "Couldn't update frequency transition information.\n");
diff --git a/include/linux/devfreq-governor.h b/include/linux/devfreq-governor.h
index 2853f571dfdf..e4f7b6cb07bc 100644
--- a/include/linux/devfreq-governor.h
+++ b/include/linux/devfreq-governor.h
@@ -33,9 +33,14 @@
  *   : This governor is never changeable to other governors.
  * - DEVFREQ_GOV_FLAG_IRQ_DRIVEN
  *   : The devfreq won't schedule the work for this governor.
+ * - DEVFREQ_GOV_FLAG_TRACK_REMOTE
+ *   : The governor only tracks frequency changes performed by a remote
+ *     agent (e.g. firmware); devfreq skips the local profile->target()
+ *     call and just keeps its statistics and notifiers in sync.
  */
 #define DEVFREQ_GOV_FLAG_IMMUTABLE			BIT(0)
 #define DEVFREQ_GOV_FLAG_IRQ_DRIVEN			BIT(1)
+#define DEVFREQ_GOV_FLAG_TRACK_REMOTE			BIT(2)
 
 /*
  * Definition of governor attribute flags except for common sysfs attributes

-- 
2.34.1


