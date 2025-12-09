Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4F7D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 08:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnBkhViP9JcsqnpBhlR8aFlnSdkU2+Vnifh5i7RexeY=; b=bNMSMBu2eKXcw9nkNNqvJO1gmX
	Y7xUoGOziFVJ8FbQxv3BPVauHD90N3f0yg7MXdY2dW4Iq44/UU5ylKokz4PioJxBOuGelvfntZ9Qn
	a6f7MzW6X7tjp3ueMNn47GjO5HMn4ftyof+M8k1w5opZ9yHf4bUiY6wQCEJiaqptINPW/THvaWl/e
	Yi77Ytr8LCjI99ibZ/M7DGyzTZWWwxADOXEy7GuS2EKbPSipUORGRHeeP4vAcdrTe8zG+fdfqnTd5
	9A3EeXKznSKZ83EYN8jjLGL73339gdT7nRsaZefjojuUi6gl1X6YkjBUaBqWK8KKMNFpgmlZ6qN8V
	WI5S9MGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSsuN-0000000Dz1L-2byy;
	Tue, 09 Dec 2025 08:17:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSsuK-0000000Dz0u-0wuy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 08:17:17 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B96jMp02216225
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Dec 2025 08:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dnBkhViP9JcsqnpBhlR8aFlnSdkU2+Vnifh5i7RexeY=; b=KH0w+g7WrACfFhZw
	eDKSQjQWVEyaT27iXdFDc22kwXPWJ4KjyBuQuy1fv/mWawV098gR1HkgexHqpDa6
	QlvUwhPxvBb+7lGkhafdoy7V9ysHO75V2lrmPQNdbu/lUPCpScMIKAVaWPc8rAV4
	/6WosgK4dHhRJPdZ52g9tJThG75f2DDrzWg7W/WKgWw7WjfmuncG0bJanQ/ZvH4E
	CnquqRehNRI4uYsZj8w+VeZtVqi06c581+QuSAMfHee7Mp6wxriI8rOLCATyt+so
	+FEI8gmoQCDxTGB1n2OE23XI1Jt95unRVmF+FZYOjZkHQGa3oC8v/u1wiUfP6T39
	U/CHRg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axesf07vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 08:17:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-295592eb5dbso98682875ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 00:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765268233; x=1765873033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnBkhViP9JcsqnpBhlR8aFlnSdkU2+Vnifh5i7RexeY=;
        b=BM3EUUTpXAVeib6KCKgHmiA8lLpdzMgPM4YYSSocDH+RyMBpixsIT1jeDbB8qUww17
         l5oCCgfqTxVD1gEqtMEwUwIhw7330nq42xykNxpzz8ZEwZOD0EQG0OPYf4Np+B7zG/5s
         JlgEHs5mCqvwVAbL3TXgpLw5qAhJ7x6nYjrwkfF2n++bBF60myt81v7RRUxGP5K2DuD6
         upQ77Rua5KenxIlkfp+usqiTfR+iBlhedvLRvI/7JWTbGmVYicRClyuyq4Guq2zHBD+W
         MCWNuCiHDTlcYiBYO2jgz9rl/41KXsRZNOXBgzk0FUkMgcZs+853bKaUTdj5nKObI06o
         QuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765268233; x=1765873033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dnBkhViP9JcsqnpBhlR8aFlnSdkU2+Vnifh5i7RexeY=;
        b=M6sfz1nMiQ0Akygr6UjojdHZMXGH8b8UBU5Oi5hoyBLO4BJW93L8jNE3GHXjmVW9Jd
         v7TFhvz6e/b72lpI40umy4uYCkly578vh3S8Ee/Bf0K4qNk/YjXBdP0LyewMxEcV+Tr+
         aha1Ta0NxB3mhVljFM/RFHwaqG6xdOee9r8DuSnsXgJO6Yn0mg9XxSdkqBwGj0s6iZmO
         R4+T9gUq5vo4jRUc77y1ZNXLaxc8ABfqT6TIc+kpnipMFj4B7NBpFacSNT4n0EKEUL3v
         CxGDP7LkqwgknvuBQ3RYjlnXnTWodd2BRvdWVcPTJ+iFg+9k62VmmLKBTahNKIxGRe1b
         3u6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVG89ooiVuR08v3EtB10k3i/XIwyV+g1jNXrRDrPm4TvGgN8zRVkKkvWGMXnW44XeGAfj2lWaXUpJAp54w3H7Ac@lists.infradead.org
X-Gm-Message-State: AOJu0YyZpLwf8PhMGaUj+sAvEz+H+jRxN8sgEQohrSCADmQcLcyxGipG
	5WIc+k+i6IkqV8vAc4DQgrIFBeQLiL2YmUCe0AWxkdwzFkr/TK+ImwdfgQ6FZ8juPcM04UIZwrs
	PR1jbZt3orMnwZ3FQae7rn5GeM0BNkOO1GrTqHZXM0ZCdim+p27IHPtYsnpEoTtfm7bsLDIKHPG
	6lLA==
X-Gm-Gg: AY/fxX4sdLAP5eTsth0Y0413WrI3Uh4xbYMcDwRzczxo1zC88Fym8RU1YuBC4Dy2ZZ2
	SsQRUUckD1lTxZre20Js03ozAREFPoL4F7ynrJ8w4MA4IJYx/j1x8jb3DolSr/YWn2mDG2/loVW
	jsQzIoHtbAhfYqI8yDIcxTPFLl6eWZ3kHvv/phrNforL+FIw2uRISwC2mxNR4drgiPWyU+2yBBS
	tmymv6XbBPefjM1kV8LZ+oVfTvQIm3D2nSF/3v3G9P6WPIavUM4CC2Al2kmha+kpdx2Dk7zHtye
	S9O06/dOrCTtKaWgU4KUpGNbRt1i8hocEde7WIglZy6M6ATmZlB4wWdJe9pdvW84JiGBuHQKQnU
	C9RajgrF4bIo1692O2jM8E7A53dClsFxsvKcRzcKH6Y9KUInwqPCseFOrAx4ggCOm6fv7ZYvMQM
	qOMA==
X-Received: by 2002:a17:903:2408:b0:295:7423:4be2 with SMTP id d9443c01a7336-29df5571cb5mr95062155ad.3.1765268232854;
        Tue, 09 Dec 2025 00:17:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeHlQci0xsgpJVZnVbKJmzmyLj8Xllyl6cxoB4wm7sKOToGEAtie5BqtIOihKQJJNRx6J2fw==
X-Received: by 2002:a17:903:2408:b0:295:7423:4be2 with SMTP id d9443c01a7336-29df5571cb5mr95061935ad.3.1765268232243;
        Tue, 09 Dec 2025 00:17:12 -0800 (PST)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99eaa9sm148609045ad.53.2025.12.09.00.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 00:17:11 -0800 (PST)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
To: mike.leach@linaro.org
Cc: alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
        james.clark@linaro.org, jinlong.mao@oss.qualcomm.com, leo.yan@arm.com,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_jinlmao@quicinc.com,
        quic_yingdeng@quicinc.com, suzuki.poulose@arm.com,
        tingwei.zhang@oss.qualcomm.com, yingchao.deng@oss.qualcomm.com
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
Date: Tue,  9 Dec 2025 16:16:28 +0800
Message-ID: <20251209081649.105623-1-yingchao.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJ9a7Vg9Efi-5eecfiUF82_Qq8Jg9imN5q1-VKYZoPVUxNpjhA@mail.gmail.com>
References: <CAJ9a7Vg9Efi-5eecfiUF82_Qq8Jg9imN5q1-VKYZoPVUxNpjhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _dAL4FuayubReR7tXCkN0p92kqWUsec9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA1OSBTYWx0ZWRfXzVBgVH8kkCYK
 Z1EQ0ZSUIfwW3PE6jCfuFl8YpVhIhXKuj/8MB4avUqVdB3hsfs9QJ6DA5mFzwfIwJoztkJR/X1w
 xagYQ5t1/qdNAnJKptuu5ikNVT12oUQTJPCgE+FXqjWFZPC7u9b022IHZFX9h1JxLErGyvIuyEk
 jHsEjOHdNQQIVjbRsGF4L8Sh7DcZBRJertPK/cMkMtiCOmcbhIpIIn1NjJllGMrDwIaTaY0ixzJ
 QQpc9mld0fwJMjLXsynu1Zbi5Ri2sbzDtC4KecCPXoM3adLGwPmmDGBZZSF/W4kP48qT4xPvHv4
 Rk/SQYTUw5whyW9xmaja12sbyROwvol7qt8t9hp+/NCaurZ1aK1jM4CHSEdf5JUPXHZdfOM2JW9
 6JyQlDKQlFsGlwW8bHY9L5B1/1YYGg==
X-Authority-Analysis: v=2.4 cv=fMc0HJae c=1 sm=1 tr=0 ts=6937db09 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=qf4gfuq51q0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wy-NGkMKq-cUuQxquDoA:9
 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: _dAL4FuayubReR7tXCkN0p92kqWUsec9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_01,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_001716_307734_851072F8 
X-CRM114-Status: GOOD (  24.95  )
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

Hi Leo & Mike

Based on Leo’s suggestions, I created a new patch, but there are three points that do not fully align with his recommendations:

    1. The helper function for returning the register address now returns only the offset, because returning the full address would conflict with cti_write_single_reg.
    2. For registers such as triginstatus1...3, I defined additional macros CTITRIGINSTATUS1...3. This is because CTITRIGINSTATUS + 0x4 equals CTITRIGOUTSTATUS, and to avoid conflicts with existing macros, I chose numbers starting from 0x1000 for the new definitions.
    3. Regarding the visibility of attributes for triginstatus1...3, since coresight_cti_reg produces an anonymous variable that cannot be directly referenced, I used coresight_cti_regs_attrs[i] to obtain the attribute corresponding to triginstatus1.

I appreciate both suggestions. After reviewing them, I lean toward Mike's approach.

Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-cti-core.c  |  52 +++++--
 .../hwtracing/coresight/coresight-cti-sysfs.c |  72 ++++++++--
 drivers/hwtracing/coresight/coresight-cti.h   |   3 +-
 drivers/hwtracing/coresight/qcom-cti.h        | 136 ++++++++++++++++++
 4 files changed, 238 insertions(+), 25 deletions(-)
 create mode 100644 drivers/hwtracing/coresight/qcom-cti.h

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index f9970e40dd59..d2b0b46f2846 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -21,7 +21,7 @@

 #include "coresight-priv.h"
 #include "coresight-cti.h"
-
+#include "qcom-cti.h"
 /*
  * CTI devices can be associated with a PE, or be connected to CoreSight
  * hardware. We have a list of all CTIs irrespective of CPU bound or
@@ -70,15 +70,16 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)

     /* write the CTI trigger registers */
     for (i = 0; i < config->nr_trig_max; i++) {
-        writel_relaxed(config->ctiinen[i], drvdata->base + CTIINEN(i));
+        writel_relaxed(config->ctiinen[i],
+                drvdata->base + cti_reg_addr_with_nr(drvdata, CTIINEN(0), i));
         writel_relaxed(config->ctiouten[i],
-                   drvdata->base + CTIOUTEN(i));
+                drvdata->base + cti_reg_addr_with_nr(drvdata, CTIOUTEN(0), i));
     }

     /* other regs */
-    writel_relaxed(config->ctigate, drvdata->base + CTIGATE);
-    writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
-    writel_relaxed(config->ctiappset, drvdata->base + CTIAPPSET);
+    writel_relaxed(config->ctigate, drvdata->base + cti_reg_addr(drvdata, CTIGATE));
+    writel_relaxed(config->asicctl, drvdata->base + cti_reg_addr(drvdata, ASICCTL));
+    writel_relaxed(config->ctiappset, drvdata->base + cti_reg_addr(drvdata, CTIAPPSET));

     /* re-enable CTI */
     writel_relaxed(1, drvdata->base + CTICONTROL);
@@ -201,7 +202,7 @@ void cti_write_intack(struct device *dev, u32 ackval)
     raw_spin_lock(&drvdata->spinlock);
     /* write if enabled */
     if (cti_active(config))
-        cti_write_single_reg(drvdata, CTIINTACK, ackval);
+        cti_write_single_reg(drvdata, cti_reg_addr(drvdata, CTIINTACK), ackval);
     raw_spin_unlock(&drvdata->spinlock);
 }

@@ -214,6 +215,9 @@ void cti_write_intack(struct device *dev, u32 ackval)
 /* DEVID[19:16] - number of CTM channels */
 #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))

+/* DEVARCH[31:21] - ARCHITECT */
+#define CTI_DEVARCH_ARCHITECT(devarch_val) ((int)BMVAL(devarch_val, 21, 31))
+
 static int cti_set_default_config(struct device *dev,
                   struct cti_drvdata *drvdata)
 {
@@ -394,9 +398,8 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,

     /* update the local register values */
     chan_bitmask = BIT(channel_idx);
-    reg_offset = (direction == CTI_TRIG_IN ? CTIINEN(trigger_idx) :
-              CTIOUTEN(trigger_idx));
-
+    reg_offset = (direction == CTI_TRIG_IN ? cti_reg_addr_with_nr(drvdata, CTIINEN(0), trigger_idx):
+                         cti_reg_addr_with_nr(drvdata, CTIOUTEN(0), trigger_idx));
     raw_spin_lock(&drvdata->spinlock);

     /* read - modify write - the trigger / channel enable value */
@@ -452,7 +455,7 @@ int cti_channel_gate_op(struct device *dev, enum cti_chan_gate_op op,
     if (err == 0) {
         config->ctigate = reg_value;
         if (cti_active(config))
-            cti_write_single_reg(drvdata, CTIGATE, reg_value);
+            cti_write_single_reg(drvdata, cti_reg_addr(drvdata, CTIGATE), reg_value);
     }
     raw_spin_unlock(&drvdata->spinlock);
     return err;
@@ -479,19 +482,19 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
     case CTI_CHAN_SET:
         config->ctiappset |= chan_bitmask;
         reg_value  = config->ctiappset;
-        reg_offset = CTIAPPSET;
+        reg_offset = cti_reg_addr(drvdata, CTIAPPSET);
         break;

     case CTI_CHAN_CLR:
         config->ctiappset &= ~chan_bitmask;
         reg_value = chan_bitmask;
-        reg_offset = CTIAPPCLEAR;
+        reg_offset = cti_reg_addr(drvdata, CTIAPPCLEAR);
         break;

     case CTI_CHAN_PULSE:
         config->ctiappset &= ~chan_bitmask;
         reg_value = chan_bitmask;
-        reg_offset = CTIAPPPULSE;
+        reg_offset = cti_reg_addr(drvdata, CTIAPPPULSE);
         break;

     default:
@@ -895,6 +898,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
     struct coresight_desc cti_desc;
     struct coresight_platform_data *pdata = NULL;
     struct resource *res = &adev->res;
+    u32 devarch;

     /* driver data*/
     drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -981,9 +985,27 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
     drvdata->csdev_release = drvdata->csdev->dev.release;
     drvdata->csdev->dev.release = cti_device_release;

+    /* check architect value*/
+    devarch = readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
+    if (CTI_DEVARCH_ARCHITECT(devarch) == ARCHITECT_QCOM) {
+        drvdata->is_qcom_cti = 1;
+
+        /*
+         * QCOM CTI does not implement Claimtag functionality as
+         * per CoreSight specification, but its CLAIMSET register
+         * is incorrectly initialized to 0xF. This can mislead
+         * tools or drivers into thinking the component is claimed.
+         *
+         * Reset CLAIMSET to 0 to reflect that no claims are active.
+         */
+        drvdata->csdev->claim_tag_info = CS_CLAIM_TAG_NOT_IMPL;
+        //writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
+    }
+
     /* all done - dec pm refcount */
     pm_runtime_put(&adev->dev);
-    dev_info(&drvdata->csdev->dev, "CTI initialized\n");
+    dev_info(&drvdata->csdev->dev, "%s CTI initialized\n",
+                    drvdata->is_qcom_cti ? "QCOM" : "");
     return 0;

 pm_release:
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index a9df77215141..5d23a138b4a7 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -13,7 +13,7 @@
 #include <linux/sysfs.h>

 #include "coresight-cti.h"
-
+#include "qcom-cti.h"
 /*
  * Declare the number of static declared attribute groups
  * Value includes groups + NULL value at end of table.
@@ -183,7 +183,7 @@ static ssize_t coresight_cti_reg_show(struct device *dev,
     pm_runtime_get_sync(dev->parent);
     raw_spin_lock(&drvdata->spinlock);
     if (drvdata->config.hw_powered)
-        val = readl_relaxed(drvdata->base + cti_attr->off);
+        val = readl_relaxed(drvdata->base + cti_reg_addr(drvdata, cti_attr->off));
     raw_spin_unlock(&drvdata->spinlock);
     pm_runtime_put_sync(dev->parent);
     return sysfs_emit(buf, "0x%x\n", val);
@@ -204,7 +204,7 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
     pm_runtime_get_sync(dev->parent);
     raw_spin_lock(&drvdata->spinlock);
     if (drvdata->config.hw_powered)
-        cti_write_single_reg(drvdata, cti_attr->off, val);
+        cti_write_single_reg(drvdata,  cti_reg_addr(drvdata, cti_attr->off), val);
     raw_spin_unlock(&drvdata->spinlock);
     pm_runtime_put_sync(dev->parent);
     return size;
@@ -267,7 +267,7 @@ static ssize_t cti_reg32_show(struct device *dev, char *buf,
     raw_spin_lock(&drvdata->spinlock);
     if ((reg_offset >= 0) && cti_active(config)) {
         CS_UNLOCK(drvdata->base);
-        val = readl_relaxed(drvdata->base + reg_offset);
+        val = readl_relaxed(drvdata->base + cti_reg_addr(drvdata, reg_offset));
         if (pcached_val)
             *pcached_val = val;
         CS_LOCK(drvdata->base);
@@ -300,7 +300,7 @@ static ssize_t cti_reg32_store(struct device *dev, const char *buf,

     /* write through if offset and enabled */
     if ((reg_offset >= 0) && cti_active(config))
-        cti_write_single_reg(drvdata, reg_offset, val);
+        cti_write_single_reg(drvdata,  cti_reg_addr(drvdata, reg_offset), val);
     raw_spin_unlock(&drvdata->spinlock);
     return size;
 }
@@ -389,7 +389,7 @@ static ssize_t inen_store(struct device *dev,

     /* write through if enabled */
     if (cti_active(config))
-        cti_write_single_reg(drvdata, CTIINEN(index), val);
+        cti_write_single_reg(drvdata, cti_reg_addr_with_nr(drvdata, CTIINEN(0), index), val);
     raw_spin_unlock(&drvdata->spinlock);
     return size;
 }
@@ -428,7 +428,7 @@ static ssize_t outen_store(struct device *dev,

     /* write through if enabled */
     if (cti_active(config))
-        cti_write_single_reg(drvdata, CTIOUTEN(index), val);
+        cti_write_single_reg(drvdata, cti_reg_addr_with_nr(drvdata, CTIOUTEN(0), index), val);
     raw_spin_unlock(&drvdata->spinlock);
     return size;
 }
@@ -470,7 +470,7 @@ static ssize_t appclear_store(struct device *dev,

     /* write through if enabled */
     if (cti_active(config))
-        cti_write_single_reg(drvdata, CTIAPPCLEAR, val);
+        cti_write_single_reg(drvdata,  cti_reg_addr(drvdata, CTIAPPCLEAR), val);
     raw_spin_unlock(&drvdata->spinlock);
     return size;
 }
@@ -491,7 +491,7 @@ static ssize_t apppulse_store(struct device *dev,

     /* write through if enabled */
     if (cti_active(config))
-        cti_write_single_reg(drvdata, CTIAPPPULSE, val);
+        cti_write_single_reg(drvdata,  cti_reg_addr(drvdata, CTIAPPPULSE), val);
     raw_spin_unlock(&drvdata->spinlock);
     return size;
 }
@@ -513,18 +513,36 @@ static struct attribute *coresight_cti_regs_attrs[] = {
     &dev_attr_appclear.attr,
     &dev_attr_apppulse.attr,
     coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
+    coresight_cti_reg(triginstatus1, CTITRIGINSTATUS1),
+    coresight_cti_reg(triginstatus2, CTITRIGINSTATUS2),
+    coresight_cti_reg(triginstatus3, CTITRIGINSTATUS3),
     coresight_cti_reg(trigoutstatus, CTITRIGOUTSTATUS),
+    coresight_cti_reg(trigoutstatus1, CTITRIGOUTSTATUS1),
+    coresight_cti_reg(trigoutstatus2, CTITRIGOUTSTATUS2),
+    coresight_cti_reg(trigoutstatus3, CTITRIGOUTSTATUS3),
     coresight_cti_reg(chinstatus, CTICHINSTATUS),
     coresight_cti_reg(choutstatus, CTICHOUTSTATUS),
 #ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
     coresight_cti_reg_rw(itctrl, CORESIGHT_ITCTRL),
     coresight_cti_reg(ittrigin, ITTRIGIN),
+    coresight_cti_reg(ittrigin1, ITTRIGIN1),
+    coresight_cti_reg(ittrigin2, ITTRIGIN2),
+    coresight_cti_reg(ittrigin3, ITTRIGIN3),
     coresight_cti_reg(itchin, ITCHIN),
     coresight_cti_reg_rw(ittrigout, ITTRIGOUT),
+    coresight_cti_reg_rw(ittrigout1, ITTRIGOUT1),
+    coresight_cti_reg_rw(ittrigout2, ITTRIGOUT2),
+    coresight_cti_reg_rw(ittrigout3, ITTRIGOUT3),
     coresight_cti_reg_rw(itchout, ITCHOUT),
     coresight_cti_reg(itchoutack, ITCHOUTACK),
     coresight_cti_reg(ittrigoutack, ITTRIGOUTACK),
+    coresight_cti_reg(ittrigoutack1, ITTRIGOUTACK1),
+    coresight_cti_reg(ittrigoutack2, ITTRIGOUTACK2),
+    coresight_cti_reg(ittrigoutack3, ITTRIGOUTACK3),
     coresight_cti_reg_wo(ittriginack, ITTRIGINACK),
+    coresight_cti_reg_wo(ittriginack1, ITTRIGINACK1),
+    coresight_cti_reg_wo(ittriginack2, ITTRIGINACK2),
+    coresight_cti_reg_wo(ittriginack3, ITTRIGINACK3),
     coresight_cti_reg_wo(itchinack, ITCHINACK),
 #endif
     NULL,
@@ -1153,6 +1171,41 @@ int cti_create_cons_sysfs(struct device *dev, struct cti_drvdata *drvdata)
     return err;
 }

+  static umode_t coresight_cti_regs_is_visible(struct kobject *kobj,
+                  struct attribute *attr, int n)
+  {
+    struct device *dev = container_of(kobj, struct device, kobj);
+    struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+    /* Mute QCOM CTI registers for standard CTI module */
+    if (!drvdata->is_qcom_cti) {
+        if (attr == coresight_cti_regs_attrs[10]
+         || attr == coresight_cti_regs_attrs[11]
+         || attr == coresight_cti_regs_attrs[12]
+         || attr == coresight_cti_regs_attrs[14]
+         || attr == coresight_cti_regs_attrs[15]
+         || attr == coresight_cti_regs_attrs[16]
+#ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
+         || attr == coresight_cti_regs_attrs[21]
+         || attr == coresight_cti_regs_attrs[22]
+         || attr == coresight_cti_regs_attrs[23]
+         || attr == coresight_cti_regs_attrs[26]
+         || attr == coresight_cti_regs_attrs[27]
+         || attr == coresight_cti_regs_attrs[28]
+         || attr == coresight_cti_regs_attrs[32]
+         || attr == coresight_cti_regs_attrs[33]
+         || attr == coresight_cti_regs_attrs[34]
+         || attr == coresight_cti_regs_attrs[36]
+         || attr == coresight_cti_regs_attrs[37]
+         || attr == coresight_cti_regs_attrs[38]
+#endif
+         )
+                  return 0;
+          }
+
+          return attr->mode;
+  }
+
 /* attribute and group sysfs tables. */
 static const struct attribute_group coresight_cti_group = {
     .attrs = coresight_cti_attrs,
@@ -1166,6 +1219,7 @@ static const struct attribute_group coresight_cti_mgmt_group = {
 static const struct attribute_group coresight_cti_regs_group = {
     .attrs = coresight_cti_regs_attrs,
     .name = "regs",
+    .is_visible = coresight_cti_regs_is_visible,
 };

 static const struct attribute_group coresight_cti_channels_group = {
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index e7b88b07cffe..413d5ef483e8 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -57,7 +57,7 @@ struct fwnode_handle;
  * Max of in and out defined in the DEVID register.
  * - pick up actual number used from .dts parameters if present.
  */
-#define CTIINOUTEN_MAX        32
+#define CTIINOUTEN_MAX        128

 /**
  * Group of related trigger signals
@@ -181,6 +181,7 @@ struct cti_drvdata {
     struct cti_config config;
     struct list_head node;
     void (*csdev_release)(struct device *dev);
+    bool is_qcom_cti;
 };

 /*
diff --git a/drivers/hwtracing/coresight/qcom-cti.h b/drivers/hwtracing/coresight/qcom-cti.h
new file mode 100644
index 000000000000..aa41f9425b36
--- /dev/null
+++ b/drivers/hwtracing/coresight/qcom-cti.h
@@ -0,0 +1,136 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include "coresight-cti.h"
+
+#define ARCHITECT_QCOM 0x477
+
+#define CTITRIGINSTATUS1 0x1000
+#define CTITRIGINSTATUS2 0x1001
+#define CTITRIGINSTATUS3 0x1002
+
+#define CTITRIGOUTSTATUS1 0x1003
+#define CTITRIGOUTSTATUS2 0x1004
+#define CTITRIGOUTSTATUS3 0x1005
+
+#define ITTRIGIN1 0x1006
+#define ITTRIGIN2 0x1007
+#define ITTRIGIN3 0x1008
+
+#define ITTRIGOUT1 0x1009
+#define ITTRIGOUT2 0x100A
+#define ITTRIGOUT3 0x100B
+
+#define ITTRIGINACK1 0x100C
+#define ITTRIGINACK2 0x100D
+#define ITTRIGINACK3 0x100E
+
+#define ITTRIGOUTACK1 0x100F
+#define ITTRIGOUTACK2 0x1010
+#define ITTRIGOUTACK3 0x1011
+/* CTI programming registers */
+#define    QCOM_CTIINTACK        0x020
+#define    QCOM_CTIAPPSET        0x004
+#define    QCOM_CTIAPPCLEAR    0x008
+#define    QCOM_CTIAPPPULSE    0x00C
+#define    QCOM_CTIINEN        0x400
+#define    QCOM_CTIOUTEN        0x800
+#define    QCOM_CTITRIGINSTATUS    0x040
+#define    QCOM_CTITRIGINSTATUS1    0x044
+#define    QCOM_CTITRIGINSTATUS2    0x048
+#define    QCOM_CTITRIGINSTATUS3    0x04C
+#define    QCOM_CTITRIGOUTSTATUS    0x060
+#define    QCOM_CTITRIGOUTSTATUS1    0x064
+#define    QCOM_CTITRIGOUTSTATUS2    0x068
+#define    QCOM_CTITRIGOUTSTATUS3    0x06C
+#define    QCOM_CTICHINSTATUS    0x080
+#define    QCOM_CTICHOUTSTATUS    0x084
+#define    QCOM_CTIGATE        0x088
+#define    QCOM_ASICCTL        0x08c
+/* Integration test registers */
+#define    QCOM_ITCHINACK        0xE70
+#define    QCOM_ITTRIGINACK    0xE80
+#define    QCOM_ITTRIGINACK1    0xE84
+#define    QCOM_ITTRIGINACK2    0xE88
+#define    QCOM_ITTRIGINACK3    0xE8C
+#define    QCOM_ITCHOUT        0xE74
+#define    QCOM_ITTRIGOUT        0xEA0
+#define    QCOM_ITTRIGOUT1        0xEA4
+#define    QCOM_ITTRIGOUT2        0xEA8
+#define    QCOM_ITTRIGOUT3        0xEAC
+#define    QCOM_ITCHOUTACK        0xE78
+#define    QCOM_ITTRIGOUTACK    0xEC0
+#define    QCOM_ITTRIGOUTACK1    0xEC4
+#define    QCOM_ITTRIGOUTACK2    0xEC8
+#define    QCOM_ITTRIGOUTACK3    0xECC
+#define    QCOM_ITCHIN        0xE7C
+#define    QCOM_ITTRIGIN        0xEE0
+#define    QCOM_ITTRIGIN1        0xEE4
+#define    QCOM_ITTRIGIN2        0xEE8
+#define    QCOM_ITTRIGIN3        0xEEC
+
+static noinline u32 cti_qcom_reg_off(u32 offset)
+{
+    switch (offset) {
+        case CTIINTACK:        return QCOM_CTIINTACK;
+        case CTIAPPSET:        return QCOM_CTIAPPSET;
+        case CTIAPPCLEAR:    return QCOM_CTIAPPCLEAR;
+        case CTIAPPPULSE:    return QCOM_CTIAPPPULSE;
+        case CTIINEN(0):    return QCOM_CTIINEN;
+        case CTIOUTEN(0):    return QCOM_CTIOUTEN;
+        case CTITRIGINSTATUS:    return QCOM_CTITRIGINSTATUS;
+        case CTITRIGINSTATUS1:    return QCOM_CTITRIGINSTATUS1;
+        case CTITRIGINSTATUS2:    return QCOM_CTITRIGINSTATUS2;
+        case CTITRIGINSTATUS3:    return QCOM_CTITRIGINSTATUS3;
+        case CTITRIGOUTSTATUS:    return QCOM_CTITRIGOUTSTATUS;
+        case CTITRIGOUTSTATUS1:    return QCOM_CTITRIGOUTSTATUS1;
+        case CTITRIGOUTSTATUS2:    return QCOM_CTITRIGOUTSTATUS2;
+        case CTITRIGOUTSTATUS3:    return QCOM_CTITRIGOUTSTATUS3;
+        case CTICHINSTATUS:        return QCOM_CTICHINSTATUS;
+        case CTICHOUTSTATUS:    return QCOM_CTICHOUTSTATUS;
+        case CTIGATE:        return QCOM_CTIGATE;
+        case ASICCTL:        return QCOM_ASICCTL;
+        case ITCHINACK:        return QCOM_ITCHINACK;
+        case ITTRIGINACK:    return QCOM_ITTRIGINACK;
+        case ITTRIGINACK1:    return QCOM_ITTRIGINACK1;
+        case ITTRIGINACK2:    return QCOM_ITTRIGINACK2;
+        case ITTRIGINACK3:    return QCOM_ITTRIGINACK3;
+        case ITCHOUT:        return QCOM_ITCHOUT;
+        case ITTRIGOUT:        return QCOM_ITTRIGOUT;
+        case ITTRIGOUT1:    return QCOM_ITTRIGOUT1;
+        case ITTRIGOUT2:    return QCOM_ITTRIGOUT2;
+        case ITTRIGOUT3:    return QCOM_ITTRIGOUT3;
+        case ITCHOUTACK:    return QCOM_ITCHOUTACK;
+        case ITTRIGOUTACK:    return QCOM_ITTRIGOUTACK;
+        case ITTRIGOUTACK1:    return QCOM_ITTRIGOUTACK1;
+        case ITTRIGOUTACK2:    return QCOM_ITTRIGOUTACK2;
+        case ITTRIGOUTACK3:    return QCOM_ITTRIGOUTACK3;
+        case ITCHIN:               return QCOM_ITCHIN;
+        case ITTRIGIN:            return QCOM_ITTRIGIN;
+        case ITTRIGIN1:        return QCOM_ITTRIGIN1;
+        case ITTRIGIN2:        return QCOM_ITTRIGIN2;
+        case ITTRIGIN3:        return QCOM_ITTRIGIN3;
+        default:
+                    WARN(1, "Unknown offset=%u\n", offset);
+                    return 0;
+    }
+
+    return 0;
+}
+
+static u32 cti_reg_addr_with_nr(struct cti_drvdata *drvdata,
+                                          u32 reg, u32 nr)
+{
+    /* convert to qcom specific offset */
+    if (unlikely(drvdata->is_qcom_cti))
+        reg = cti_qcom_reg_off(reg);
+
+    return reg + sizeof(u32) * nr;
+}
+
+static u32 cti_reg_addr(struct cti_drvdata *drvdata, u32 reg)
+{
+        return cti_reg_addr_with_nr(drvdata, reg, 0);
+}
+


