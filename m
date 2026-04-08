Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF8A1073CB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 13:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=seV0jNRW43BQy38HSt7co1dbaDYjW5QgU3tBgjyLzOw=; b=RX2lKQC+7KVi5c1mZOqRNs+XNG
	D0SqltkH5COKa2ZmGlGC+lXJfFpkMEJ8SG29jMrQQRN4mr/1L8SEEhFAK+202CyJC6sJZZcEgsvCX
	U4o7aUfgJ22pSD05UY19ygAvhVpQ5xL50mT/su3rYSx/eLDFFF5dfLBD5hp0cqIg5VNFG9EYE2B+q
	uIboHD1ub/QwLpV/8ogPCLyeCYb1TWdZeslvz9FgGkbi4RByYxRnXJYz+eNALk40Pj8N0RusSlE+T
	aaaG02ec9C+SNPb2eWMFIUoYkahYmJAd7u+mT6PeqfWV/ZrCLvfLtDdcp3gqNyd0OBD8ZdMnfsOGM
	+UBSIOyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wASt2-00000008uFx-1vPq;
	Wed, 08 Apr 2026 13:24:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wASsz-00000008uFQ-2g3W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 13:24:03 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638AUCJJ262912
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Apr 2026 13:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=seV0jNRW43BQy38HSt7co1
	dbaDYjW5QgU3tBgjyLzOw=; b=GMbwE1Km9mHupd7kr6auukNY7wBhi2MMY/z+Zw
	kVu016DP8kYvBQvMaGm3pZPv8FFiHa4DnVoprync9Qi++cOYYvFXXobdwfGt9g1T
	0/Meu7gKl8R5P4FbVdYSki2jiG6UqAqGO/o7DsdNsN3zMs9kbTjqOJ8jcqvAXc+n
	oH4/fXe4aEGXOswQ8qXuO8xM4vdOklEZo+egNDwclL78cXfP74RkRE/3W79YwjvK
	UYZYYbt9i2R6GSWCiPFyUjJVyXIlutJlZe2OVJVTSw3EZ/qLOqyc7gBPfCEiy23a
	1j8V1O67/nnjBpnDBPRVx8NkNDcy0oiravg0HmJNM0sfNclA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7t23gm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 13:23:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35449510446so6552266a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 06:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775654639; x=1776259439; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=seV0jNRW43BQy38HSt7co1dbaDYjW5QgU3tBgjyLzOw=;
        b=YNvij/QNBKEbfs2qYKBY0maMPbjRvhIVUahIrTMmCTH5WmYo+j7RAUfG9BoVAabV1b
         GuqsXmrA6lxNWhbiuhFGDsOEdMzEm7uLET2ACFWGs96euSLG8D5fnEfNb3LZuwtVRehq
         +AwvrgIi2RfSTwehK5vEIwRRqfFRxDK9o7nTocQLi0MxWF13G3HAOaM23E0zyU4EMZYe
         mjpKwdP09zGKa0QuznNH3M7IJZiOdGHb+eWbQhNd77jtYpKrgzsaWqu4yDOAfXD+DBkw
         tGTQmXTC5HqDdciUTzUF68fkDzy6VviOxw36Nku0W19WWe0AYsbp+vzHNctErZDaku3w
         iAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775654639; x=1776259439;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=seV0jNRW43BQy38HSt7co1dbaDYjW5QgU3tBgjyLzOw=;
        b=Yza1QXOJ9dCcQ7fS2ju416am76ej6elJYUoGvnQNTn0r6BqWfCltO5kZTQVK4/rqQg
         DDYjCSqpQmhzMtEVgif7fHbIHVCsgCdhek12cvLJRruDRK8p+6f5xkE+Kaz8dnJ0xzuX
         06loZZdp4mIk1QgIzS1N1H9j1bMwmaiIMeOCP0I9oztsp7AOh5+5hoowUIvG25N8onTV
         SBclf2sJCOakyWepiK97w+/ZEeBgKwI7UbB/D/Jd9DV7jnWNItMt1aWDnjrC9/HwPmq8
         yB3vgw4EGxl7/ptAxbXE/XNHMf27FRcgTqPzwq2iTxa0uSYGBgCa6OUVL+J2NirckmOF
         +5WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSc/oN0CW86DwqR8GX6ZtOpghsLYBAfa+sT8Uf80tTMtj55FQZpAEOW6oNlLyG67GEVZzseg+V7jkWyO/c/+nh@lists.infradead.org
X-Gm-Message-State: AOJu0YxXkCBksaT3e+cs2rSH1KTfgEPCsOb6mH6/OZZwJK2qb26rGOMy
	Xs42AZd1ceCvivzYefTjH3iO15U30fbNFD7Nh02xu3JKDgH1Cy/xZKZvueOWLenHVunStdkuCRS
	fu+c0X8pzsTi/xzOe7+8pNPHRSd0JDbtlIbZq/+J4Vkhq49Y4g+2Q0ajbpi1RFEIjR3k4U5GIwR
	p/wA==
X-Gm-Gg: AeBDieuH0/Zfqv0KhwUaq7FweNAh+8pjL0DYXdGyCZldM0P6YX/Tr75aktUjF2ln7yq
	1P+8kLq8smD5kpekDp6pMm01hIuDCyIRwBGf+Xva/OV6NkT/NEOmSp1zOsTvBRnRmVxg3NWR2MA
	xu5LUc4vb4uE1ypNi2TOUOQqVZrLR1HJjFIMNisOPWCF23bKVPNcjHjquGc/vsRU421YCAxqFqB
	jpZT+RxBl0jZqZsAe0Vj0W8fIShv7y4KZ4ibX8izSk3esPZdD0ZHeRt5EGeTL+hdYKiANKrRX5f
	98AvHC0J8bgZ5a92AqnrX7LNE4/jiwDvbLkB5csEftBR8IF2KkCGViSFXZzbjWO2RVhVORJcs6b
	L/ZIqqoKPmhjOkAgtY4LC7y238QXyWEDiCPj2OnAnSJR7yVH4YmF1C7DaBtg5i3RkPLQKOjslH6
	na+WShKW3M
X-Received: by 2002:a17:90b:4fc9:b0:35d:ac4d:3cb7 with SMTP id 98e67ed59e1d1-35de68417f5mr18906542a91.6.1775654638596;
        Wed, 08 Apr 2026 06:23:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc9:b0:35d:ac4d:3cb7 with SMTP id 98e67ed59e1d1-35de68417f5mr18906521a91.6.1775654638109;
        Wed, 08 Apr 2026 06:23:58 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e289cb813sm1046347a91.14.2026.04.08.06.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 06:23:57 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 08 Apr 2026 21:23:44 +0800
Subject: [PATCH] coresight: tpda: fix race between refcnt check and
 register access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260408-fix-race-condition-issue-v1-1-9a148d07e08f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOBW1mkC/x2MSQqAMAwAvyI5G6i1LvgV8aBt1FyqNCqC+HeDx
 4GZeUAoMQl02QOJLhbeokKRZ+DXMS6EHJTBGlsbZ1qc+cY0ekK/xcCH6sgiJ2FwzprSVm5qG9B
 8T6Tuv+6H9/0ATGpbKWoAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775654634; l=4282;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=KiQ/IrzzL3ANrzaJSdZoqPviRgQu2S3d/exNOFGp/DI=;
 b=jJ3QF/2Pjbwdo1DzYdwjHeSxd1oBs+phCjtMPF9PtPX4/IAvw4zeHE76qLpRReSv7qs7Mdefa
 0l58cJcNP23Cq5hDrulgYCp/4luyMAQu7gafZyo6mAN2UHcRd5+3tOd
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=De0nbPtW c=1 sm=1 tr=0 ts=69d656ef cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_RqGKq5OiZDgAwGmis0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEyMyBTYWx0ZWRfX1LHgB7NMjwtZ
 qkone8dbCXPPw5DoNZ+bc9CD8PsLbVDmIe87K/E9uL9y2F27k84FpAVWd1wEYTZsJdU5Xpb9C2P
 5WYxGehLvYrciDfUoR7uVIEh5dCqyOFQzN8UFisW4Eca91ZHEHMc9WwqOVwQMCmj1BHoqu+Fijk
 ZWCUNmBedC1CSuw86/TmS5hdI4l0Q6cPUSXDwsslxMZ0IePm0roAEjS/bD7VfxHY8xcA3lcJuuY
 cPQRgWie8lwjMG2OqpnIaeUYE2Cx2jwv3N17Sl2IsBO7FWqKud8c9c6YmnztfLHUvTdKdLd/BC8
 PC7Yk/u1dAa/Pi/Ji0I6jifBO5QGzB7wBwPKHEuXIdf5bphrwCbfMbRb0IVyVKHye9Ti8Pa1VxA
 nfy44RzHcrSB3OaAuW+tv+neWjlQ7KK2NnNf5wk8zWnm9L8ktXagKrjaHvS7meyU/Bak5FlmoY6
 3yRuCSlPpS7wtebhR6Q==
X-Proofpoint-ORIG-GUID: VMDPfNksktlpxH1Wt2ny0u_yA2AKLDkD
X-Proofpoint-GUID: VMDPfNksktlpxH1Wt2ny0u_yA2AKLDkD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_04,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_062401_686878_7E2E1E96 
X-CRM114-Status: GOOD (  14.61  )
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

Several sysfs show/store handlers check csdev->refcnt before acquiring
the spinlock, then access hardware registers inside the lock.  This is
a race: between the check and the lock acquisition, the following can
occur on another CPU:

  CPU 0 (sysfs reader)              CPU 1 (disable path)
  ─────────────────────────────     ──────────────────────────────────
  refcnt == 1, check passes
  [waiting for spinlock]            tpda_disable(): refcnt → 0
                                    debug clock disabled
  spinlock acquired
  readl_relaxed()  ← FAULT/hang

tpda_disable() decrements csdev->refcnt under the same spinlock, so
moving the refcnt check inside the lock closes the race.

Fix all six affected sysfs handlers: global_flush_req_show/store,
syncr_mode_show, syncr_count_show, and port_flush_req_show/store.

Fixes: 8e1c358a3b0e ("coresight: tpda: add global_flush_req sysfs node")
Fixes: 33f04ead7c49 ("coresight: tpda: add logic to configure TPDA_SYNCR register")
Fixes: a089d585a7f4 ("coresight: tpda: add sysfs node to flush specific port")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tpda.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 89c8f71f0aff..63a979312463 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -360,10 +360,10 @@ static ssize_t global_flush_req_show(struct device *dev,
 	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	unsigned long val;
 
+	guard(spinlock)(&drvdata->spinlock);
 	if (!drvdata->csdev->refcnt)
 		return -EINVAL;
 
-	guard(spinlock)(&drvdata->spinlock);
 	val = readl_relaxed(drvdata->base + TPDA_CR);
 	/* read global_flush_req bit */
 	val &= TPDA_CR_FLREQ;
@@ -382,10 +382,13 @@ static ssize_t global_flush_req_store(struct device *dev,
 	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
 
-	if (!drvdata->csdev->refcnt || !val)
+	if (!val)
 		return -EINVAL;
 
 	guard(spinlock)(&drvdata->spinlock);
+	if (!drvdata->csdev->refcnt)
+		return -EINVAL;
+
 	val = readl_relaxed(drvdata->base + TPDA_CR);
 	/* set global_flush_req bit */
 	val |= TPDA_CR_FLREQ;
@@ -404,10 +407,10 @@ static ssize_t syncr_mode_show(struct device *dev,
 	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	unsigned long val, syncr_val;
 
+	guard(spinlock)(&drvdata->spinlock);
 	if (!drvdata->csdev->refcnt)
 		return -EINVAL;
 
-	guard(spinlock)(&drvdata->spinlock);
 	syncr_val = readl_relaxed(drvdata->base + TPDA_SYNCR);
 	val = FIELD_GET(TPDA_SYNCR_MODE_CTRL_MASK, syncr_val);
 
@@ -440,10 +443,10 @@ static ssize_t syncr_count_show(struct device *dev,
 	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	unsigned long val;
 
+	guard(spinlock)(&drvdata->spinlock);
 	if (!drvdata->csdev->refcnt)
 		return -EINVAL;
 
-	guard(spinlock)(&drvdata->spinlock);
 	val = readl_relaxed(drvdata->base + TPDA_SYNCR);
 	val &= TPDA_SYNCR_COUNT_MASK;
 
@@ -478,10 +481,10 @@ static ssize_t port_flush_req_show(struct device *dev,
 	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	unsigned long val;
 
+	guard(spinlock)(&drvdata->spinlock);
 	if (!drvdata->csdev->refcnt)
 		return -EINVAL;
 
-	guard(spinlock)(&drvdata->spinlock);
 	val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
 
 	return sysfs_emit(buf, "0x%lx\n", val);
@@ -498,10 +501,13 @@ static ssize_t port_flush_req_store(struct device *dev,
 	if (kstrtou32(buf, 0, &val))
 		return -EINVAL;
 
-	if (!drvdata->csdev->refcnt || !val)
+	if (!val)
 		return -EINVAL;
 
 	guard(spinlock)(&drvdata->spinlock);
+	if (!drvdata->csdev->refcnt)
+		return -EINVAL;
+
 	CS_UNLOCK(drvdata->base);
 	writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
 	CS_LOCK(drvdata->base);

---
base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
change-id: 20260408-fix-race-condition-issue-d44203254b87

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


