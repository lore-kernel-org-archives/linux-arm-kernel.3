Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD09CC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 07:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+cn3qFiodANuon2nIvIKSnIrm4LrxKQ/PH84MmjCzM=; b=hm3jRWrjwi+Qoz+AOsf31Za8VY
	iF5JSr153S6X0Xzogct+QiPmvMLzO5LV0X1VIPVTm7Ut6uiePsVgvGe6FZImhKpVGcVJ8JsxH4bui
	v1DkAP60I17wC2kYEX0PM+s4joRw1lsou6qB7piU+s2o++70ys3dvMWVIarE+gULtrEN7hwOEjr67
	YJBSI3kLcu60UcXGgov12W8o3UAPHU9vdfiBfi84W1IwX4Y9qvYAnwFTz4X4QwvCIw4LL9CZ9LIwr
	/jeqgjfIk6QAzm4qqfdtVrKvFFGWpp7QQ4XATs+NW5779W1QXfV/q0/tVkXAiALp0mlEmM9a1loYn
	DWAdMvZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnABl-0000000FgLY-30X5;
	Fri, 24 Jul 2026 07:19:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnABf-0000000FgHq-2Smp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 07:19:16 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lLxd3139589
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 07:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o+cn3qFiodANuon2nIvIKSnIrm4LrxKQ/PH84MmjCzM=; b=enChIPtp/j5fth2d
	abWNbz0T7ekPNvwODwOVFrhDaNFaD41JtFgod2KyVyo7b6hlyO3z1NZNTNHZHKlS
	OgirzJ+3DgAHA9zlJIW/hYERuJ13aX3d6oB/k8DrvTEoPCn6ehsEvnagnkuDT9l2
	ODtxAIumC12a1U3C7K3b2J9+Lb7x8Y7x7nxus5cAURI3cHdn/RjosXBy1lIUfoIR
	2cAZOmZPFqedKdUDVDXAJYxDmsgOT38XwOl07i1ULtXjUMm7YLR5PuFY4EqK2G0z
	VE+r3D/1GdCrj2sTReZ42dCsfv6J7p3vWo6cL2M2DNoQwcwCflu1SVtDW42VqynH
	OvilAg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkn9a3axu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 07:19:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cacf17c7e0so2474865ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 00:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784877554; x=1785482354; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+cn3qFiodANuon2nIvIKSnIrm4LrxKQ/PH84MmjCzM=;
        b=Nw9c+NE1jEWmpGSex8Gs3OPD0a+b62PQqNDi70AKxKHFZCo2g7Fq/bNUHvXvpkgUWl
         oINoWGGT+myakWXM/SlqQUKykGGHXasIwbPEx1uzc2JIRuulJx+er/zBwTfgH0yFXqah
         eGtXpY8Dp+jhdjehwGToCawF3JgjJV3blwDyThm3NDVlMom1MzDIfXdiwH+/4WqHdBVH
         RfbL7SwVqE0STQiV475XVwOOgzV8JQ6QDF2Za8PItnWwlj5oZziwueMBaH0FbXAdT/pW
         8dSktOTsCn6+J0PCtVTulBzkEOQPUHE1IxPT1MA9z/DewqhY5Esty+16CUxTnunzHxXX
         9g8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877554; x=1785482354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+cn3qFiodANuon2nIvIKSnIrm4LrxKQ/PH84MmjCzM=;
        b=jmVXFqLlZQp0suLK5ZH2Ahn6cs5tI4xZxmDyW8Hp8mj0473pf5t1Ufk2hnILKwpvfv
         xAmQ7BGN8cH2OaiHNqOYKefWJMqwifzVdEq5S0+kvTuvreP+B9DbCtlA0kF90I1dSM9h
         4ca6G8OeQ93g+7H6XbQaFlfDbbAFCZi3UZbx+bvR6ioHZyMtYLVdUm9wiNIF/Vs/bnMU
         iOzbeVOgHEidjus0FuvaLQTBNasEhK6bZwT5Vc7MI4TxBaph1srVKGIoAUWYLqJ+JLxH
         3d4smiJK+xFDVQovFZsV0V0/Hx9tVaTlsXedl0avpyjU9VpbNh+9MWLh8rKpOvPNcLoC
         Xv1Q==
X-Forwarded-Encrypted: i=1; AHgh+RrdsmIQDqZLvekkjaYzrMaYzwK58r5uwIpRDvKePrS225B4ygKeFJuxEhnG5lMcHW9rTa8vnQhUC9068Wgll07n@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo64u51x4Fx3e8mkbfdtAsk0+gizYXnsyoe6lWnu7/A8vV+nIE
	72iKJytA7ZYX19jc2m7Sbn5CY3EdvMbFucLd1RobUIPsRWbPrMk/osHWgvg9ymM2ZHlBTxocV2o
	Isu3YQrHLqrNiCXZo14ZDKZkIiX1QKlaRpXP8q5LotydufM+g6v7nao8ddFI4IlbGcpE+/0BPxA
	7DpA==
X-Gm-Gg: AR+sD12oGjgO+jNjS7pLsgkRUuG1UEu3mX+oo9563bN7xB0rpJtzF+opV4lDw2E7p0Q
	3TnBC8jmZzbfQGfkotyaJH2wd744rwQalOgFa9zOVfzkyMOwm1r42No07U/P+xKxwJpE1SMPDE4
	01leDfk4zxtw3tKcl8kT6AZIMFMs1twNoy+Zef/jbCKEHqzS3afjJk5JqD3Jy2/bqyzXgYsM9GR
	7ESEw1c6IscCRj24ph3PhZDHtV1WHnFi9moXAwjmrv9erhsCPv9zqqEcmbzs/QRnV5rebCwVqnt
	0ZxiarcrUy5yftY0HpUa+cBJclYx91yhUjluN03S89sberdC73uLNdGpg1OByV8yD9F2x48cTux
	5nG84uJV9cxB/vwx3YjhDQ5xiJVCEE+XvI8TOFo4B0ZlMGHnP75EmB5nMFSQXsuacA5sHNGCSpL
	OczGxG4RpEI0bxCDgPm2LMa+Ae4ao=
X-Received: by 2002:a17:902:e801:b0:2c9:8f4a:90b with SMTP id d9443c01a7336-2cfa6a54e47mr73353605ad.3.1784877552257;
        Fri, 24 Jul 2026 00:19:12 -0700 (PDT)
X-Received: by 2002:a17:902:e801:b0:2c9:8f4a:90b with SMTP id d9443c01a7336-2cfa6a54e47mr73352855ad.3.1784877550917;
        Fri, 24 Jul 2026 00:19:10 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efe3afbsm45993805ad.33.2026.07.24.00.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:19:10 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:48:09 +0530
Subject: [PATCH RFC 04/10] PM / devfreq: Add new target_freq attribute flag
 for governors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rfc_v8_scmi_memlat-v1-4-cb732bcff1f4@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784877514; l=7716;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=9zK8epQvNbuVk1OIit8CUMNNYQlt7Ism/my5pJtwFUk=;
 b=nOAw4COlo3kTot+tWkInoVAG4WMWOoJMrZMVGgHNvYlBa1wuSNNnr7Bt15tb0fp2L8/rUxg/o
 dcNHgIULXzuAkC6FA9umZi+IFucLk0uDWz6TFs4cvfmPfaNyoi36lFN
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX/2LItF7Y4BHB
 kuH95s+jfC7x8FOlcdHWtTRER8sC7cfCBb7AzncOXefr1o76RVSqNprcbW+Vv0nToaqSllClmSJ
 JA5p6xrrxsRsVFm/bdiRRXPCHUxNmA7kEPOhDrz1xEM/lKYTjt3YP6qBj0oSadnZAQud5vO4VIo
 QejNVFzjrH6/DddmUVjneHwwC/8EKlvMjKfPH1n2mf4eckit4xMmis32dkgxPP+TzQR+HVMOcAd
 edHQ6dLW5KdYjH8EPhn2pZgzAT73AbGrJqH/E7xyTvj0gXdJXv8KEoeZvIpcKLnL9uQpiwhBJAl
 clYZXP0K9T0DM2d+mVrwZy/wSxv5T98GFGJNoAF6FwVfliOf3SeFLuQUD491fKTlqocufxIZH6D
 tXP20MoviI0YjOXrhqb1oeRf5sGLzF/zo7hjM7EN9RE+EVXAgIv3ySWhTPBx+ZQjZMZXYsfbk8Q
 AoeC9rjsCW66SNerEVQ==
X-Proofpoint-ORIG-GUID: 2OhwtliKiBdX6cntRjsWFQl_ogiaAMzF
X-Proofpoint-GUID: 2OhwtliKiBdX6cntRjsWFQl_ogiaAMzF
X-Authority-Analysis: v=2.4 cv=WOdPmHsR c=1 sm=1 tr=0 ts=6a6311f3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hD80L64hAAAA:8 a=WcTcrbn6WVXM4q_icv8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX85iklpjJqKdw
 wfLaUYF71ZxRsAHthFIvKLqhZjro4QoSxgrsov9EWHXfMHQUuLtR7OBNQ6PO0negQFrOK4LcaKN
 jpxvMCx+W1yCDzYzKP542VaitN81a5k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_001915_648591_7EC18CA6 
X-CRM114-Status: GOOD (  20.97  )
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

The target_freq sysfs attribute exposes a governor's predicted next
target frequency. Not every devfreq governor has a meaningful value
to report there; some merely observe an externally-driven device.

Add a DEVFREQ_GOV_ATTR_TARGET_FREQ attribute flag that governors with
a meaningful target frequency must opt in to. Gate the existing
target_freq sysfs read on the flag and return -EINVAL when the active
governor does not advertise it.

Tag all in-tree governors so visible behaviour stays unchanged for
in-tree users. Out-of-tree governors that drive frequency updates
and want to keep target_freq readable need to set the new flag.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Co-developed-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 Documentation/ABI/testing/sysfs-class-devfreq | 8 ++++++++
 drivers/devfreq/devfreq.c                     | 6 ++++++
 drivers/devfreq/governor_passive.c            | 1 +
 drivers/devfreq/governor_performance.c        | 1 +
 drivers/devfreq/governor_powersave.c          | 1 +
 drivers/devfreq/governor_simpleondemand.c     | 1 +
 drivers/devfreq/governor_userspace.c          | 1 +
 drivers/devfreq/hisi_uncore_freq.c            | 1 +
 drivers/devfreq/tegra30-devfreq.c             | 3 ++-
 include/linux/devfreq-governor.h              | 3 +++
 10 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-devfreq b/Documentation/ABI/testing/sysfs-class-devfreq
index df8ba88b9f6a..5be9940a5853 100644
--- a/Documentation/ABI/testing/sysfs-class-devfreq
+++ b/Documentation/ABI/testing/sysfs-class-devfreq
@@ -37,6 +37,14 @@ Description:
 		The /sys/class/devfreq/.../target_freq shows the next governor
 		predicted target frequency of the corresponding devfreq object.
 
+		Reading this attribute returns -EINVAL when the active
+		governor does not advertise DEVFREQ_GOV_ATTR_TARGET_FREQ.
+		All in-tree governors that drive frequency transitions tag
+		this attribute, so existing in-tree behaviour is unchanged.
+		Out-of-tree governors that previously relied on the
+		unconditional read of df->previous_freq must opt in by
+		setting DEVFREQ_GOV_ATTR_TARGET_FREQ in their attrs field.
+
 What:		/sys/class/devfreq/.../trans_stat
 Date:		October 2012
 Contact:	MyungJoo Ham <myungjoo.ham@samsung.com>
diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index f08fc6966eae..2f27a239e34a 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -1530,6 +1530,12 @@ static ssize_t target_freq_show(struct device *dev,
 {
 	struct devfreq *df = to_devfreq(dev);
 
+	guard(mutex)(&devfreq_list_lock);
+
+	if (!df->profile || !df->governor ||
+	    !IS_SUPPORTED_ATTR(df->governor->attrs, TARGET_FREQ))
+		return -EINVAL;
+
 	return sprintf(buf, "%lu\n", df->previous_freq);
 }
 static DEVICE_ATTR_RO(target_freq);
diff --git a/drivers/devfreq/governor_passive.c b/drivers/devfreq/governor_passive.c
index d7feecd900f1..b75e4bbee4b1 100644
--- a/drivers/devfreq/governor_passive.c
+++ b/drivers/devfreq/governor_passive.c
@@ -448,6 +448,7 @@ static int devfreq_passive_event_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor devfreq_passive = {
 	.name = DEVFREQ_GOV_PASSIVE,
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.flags = DEVFREQ_GOV_FLAG_IMMUTABLE,
 	.get_target_freq = devfreq_passive_get_target_freq,
 	.event_handler = devfreq_passive_event_handler,
diff --git a/drivers/devfreq/governor_performance.c b/drivers/devfreq/governor_performance.c
index fdb22bf512cf..b9ec587f582c 100644
--- a/drivers/devfreq/governor_performance.c
+++ b/drivers/devfreq/governor_performance.c
@@ -37,6 +37,7 @@ static int devfreq_performance_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor devfreq_performance = {
 	.name = DEVFREQ_GOV_PERFORMANCE,
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.get_target_freq = devfreq_performance_func,
 	.event_handler = devfreq_performance_handler,
 };
diff --git a/drivers/devfreq/governor_powersave.c b/drivers/devfreq/governor_powersave.c
index ee2d6ec8a512..69eab1d0a7fc 100644
--- a/drivers/devfreq/governor_powersave.c
+++ b/drivers/devfreq/governor_powersave.c
@@ -37,6 +37,7 @@ static int devfreq_powersave_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor devfreq_powersave = {
 	.name = DEVFREQ_GOV_POWERSAVE,
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.get_target_freq = devfreq_powersave_func,
 	.event_handler = devfreq_powersave_handler,
 };
diff --git a/drivers/devfreq/governor_simpleondemand.c b/drivers/devfreq/governor_simpleondemand.c
index ac9c5e9e51a4..65ff9d912ef9 100644
--- a/drivers/devfreq/governor_simpleondemand.c
+++ b/drivers/devfreq/governor_simpleondemand.c
@@ -118,6 +118,7 @@ static int devfreq_simple_ondemand_handler(struct devfreq *devfreq,
 static struct devfreq_governor devfreq_simple_ondemand = {
 	.name = DEVFREQ_GOV_SIMPLE_ONDEMAND,
 	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL
+		| DEVFREQ_GOV_ATTR_TARGET_FREQ
 		| DEVFREQ_GOV_ATTR_TIMER,
 	.get_target_freq = devfreq_simple_ondemand_func,
 	.event_handler = devfreq_simple_ondemand_handler,
diff --git a/drivers/devfreq/governor_userspace.c b/drivers/devfreq/governor_userspace.c
index 3906ebedbae8..d1b765a7b8e5 100644
--- a/drivers/devfreq/governor_userspace.c
+++ b/drivers/devfreq/governor_userspace.c
@@ -135,6 +135,7 @@ static int devfreq_userspace_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor devfreq_userspace = {
 	.name = DEVFREQ_GOV_USERSPACE,
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.get_target_freq = devfreq_userspace_func,
 	.event_handler = devfreq_userspace_handler,
 };
diff --git a/drivers/devfreq/hisi_uncore_freq.c b/drivers/devfreq/hisi_uncore_freq.c
index e1f64b723082..5a2d7e011ad1 100644
--- a/drivers/devfreq/hisi_uncore_freq.c
+++ b/drivers/devfreq/hisi_uncore_freq.c
@@ -398,6 +398,7 @@ static struct devfreq_governor hisi_platform_governor = {
 	 * Set interrupt_driven to skip the devfreq monitor mechanism, though
 	 * this governor is not interrupt-driven.
 	 */
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.flags = DEVFREQ_GOV_FLAG_IRQ_DRIVEN,
 	.get_target_freq = hisi_platform_gov_func,
 	.event_handler = hisi_platform_gov_handler,
diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 401aac6a9f07..fcb278c4a74c 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -776,7 +776,8 @@ static int tegra_governor_event_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor tegra_devfreq_governor = {
 	.name = "tegra_actmon",
-	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL,
+	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL
+		| DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.flags = DEVFREQ_GOV_FLAG_IMMUTABLE
 		| DEVFREQ_GOV_FLAG_IRQ_DRIVEN,
 	.get_target_freq = tegra_governor_get_target,
diff --git a/include/linux/devfreq-governor.h b/include/linux/devfreq-governor.h
index dfdd0160a29f..2853f571dfdf 100644
--- a/include/linux/devfreq-governor.h
+++ b/include/linux/devfreq-governor.h
@@ -43,9 +43,12 @@
  *   : Indicate polling_interval sysfs attribute
  * - DEVFREQ_GOV_ATTR_TIMER
  *   : Indicate timer sysfs attribute
+ * - DEVFREQ_GOV_ATTR_TARGET_FREQ
+ *   : Indicate the target freq sysfs attribute
  */
 #define DEVFREQ_GOV_ATTR_POLLING_INTERVAL		BIT(0)
 #define DEVFREQ_GOV_ATTR_TIMER				BIT(1)
+#define DEVFREQ_GOV_ATTR_TARGET_FREQ			BIT(2)
 
 /**
  * struct devfreq_governor - Devfreq policy governor

-- 
2.34.1


