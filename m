Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3743FCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 02:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wNhB652mnMYlogksGyeHgsrdx+7RWlwaFzG6ELHGc8=; b=pAWZ2yY/LMjJpNO/x0UdurQx1E
	83EXH/lDyPmmSmJp+XGwh85noG/6zJ6+DiV7Uj6nHWO6hH1SwljSEDXHRO/sh0/XJmVDe/6qhg8kH
	NvQcM8NmKoqNL3tYnQ2SNff5deWY9p8gWMzljEvgTBg/5lwEijZZuGM0hA4r3GbtD2YytNoJGRoAk
	t7SnYScqhuD79v/5q/3zRBrUKlBCB09l7H/eyU6kc+ANmrqbUbGS2TP4TnKAW3iwAX9ZkWsToiAUi
	HKBTWU3ocqBi5noWRnwou+zCraWsZYlG9sIyVPRKEqr3a0jk2Ck/noJCkTm99u20O+Fx3oLcKdkZC
	nX6thZ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDZ30-0000000F6Gx-3pGK;
	Tue, 28 Oct 2025 02:02:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDZ2x-0000000F6FP-2EVJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 02:02:52 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S0u9822881686
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 02:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+wNhB652mnMYlogksGyeHgsrdx+7RWlwaFzG6ELHGc8=; b=dbz9zrsqWYQlSu0P
	fR7DV2lWKcUJzJAUjXPws3C7B0cqHeoEAq8wGZOVP4r2JXNO4uXGhOLnHYFdQpp2
	vmMU93DYhfIk8ypgQd2vzwKg/drsPV8ynUdUXRsf2sRq/x14/Ku9xrT/l2wY+nj9
	PhyFQaag956rIyCvsGF6Z/JF963ES3H9WAIhdkgMqfVVsZB0CbIqiB93+1NtHx8o
	lGhu1a/onQrl7iBmbKR3QyiD73yMgK3PHWRmMu9HWTDrg/IbXKx6TLgIRVwFG0d9
	J8wxUb2vIuLaeV//WqrYEELdTxR/QLDYf3SLNJiO02s5OMszHkqg1Wwu30RP3+1Y
	9yjD7Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a29uha084-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 02:02:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-27ee41e062cso59792005ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 19:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761616970; x=1762221770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wNhB652mnMYlogksGyeHgsrdx+7RWlwaFzG6ELHGc8=;
        b=u/3cBToA+aiO/dKlNjh9JM6JMobWSYWo53sg/pyVWM/Bs1KUFZGjApLH9mCzan8S+/
         XKMIu7h73eDMdlktM4UBV8jm2gNGCDmyNWNfBPFrTpnUKYNk2DmZc25ORLpVx9AR6WZV
         DkmB9/sXqX+bUuErSu662cUGbIYWtyowACSiGennh1qJotpAnuOwFxp6XboomGkcmDxP
         K3fKwOYd8ZMSmV1zgBy6PegSdaNYKm5wGEAyQWu2exyB7k+8hf7AuFJ1s5Cq7JY325Y9
         h5kpXCTl6T9oSLBBEAliNGvHCM60gJeLQocgU/ouamLXc587AjPsxZR5H6Mc+WR+SmUO
         1hdg==
X-Forwarded-Encrypted: i=1; AJvYcCWKwCubIAR7W3vjS6w1OGhX7wH1EFBKs9ikza5W28vmn4U6QSGILxf0bZ9bawqiSaMAU5dprZJjIJWRI/IAURSi@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0bSz8b9bbSfREfRWKktYkv2puw0ZVROXtpk/HIA/aydiqZv/W
	x41ISd0F6gIu6dSolcfRYRL0mpOSfIH5og05u+APzUM138xWbZy74ByYOSYzVQQb+Ydh4JurLc9
	pgHn/Z4s69AG5b1LE8oSGJ1wAWKbUcLxJ/1MZBuZg21/PgsT0ctzoU1jdf5Anzqv/xdMGjOh0Cv
	tSfg==
X-Gm-Gg: ASbGncuYZ9kBrnXv2MVL3fegRwj7ykY4H3pEU/79J+NainSYkdgcTaPUlYXZjNoh0zB
	587quu9ySqjfKmnwLEt92x7g+vnuCgcc+dVrVJ9ynMoI3Gx2rt5Fj8z4rxipwVJcE1npeFgjOvH
	wCtOpAny4FE/ByTM/vCuvzIMiXJzolmrVPOD/zUQxfOoqyK57U5ZvHOO/KC1e0zwyUjj/hu/g3X
	j3HqVkTReesET5uK6+qnBrefFCFDyFyeNpmeDRf185LKMqMv6/b6SDONCz3T/XQF7C4NTlHNDHT
	usuYEwsFHeqyQUw7pneG7+rd0wgGrDjh2S1MjE3Jpn8m9kbdqlnQ35kvH/JQ3z5SAFShh251Fes
	R6cXGr36CEL8fF96TTM8KmWF+XqCBwVUdgdOrpIAPt9xGBJ2lmfDsmr5xpkI3Q8MKLg==
X-Received: by 2002:a17:903:41c2:b0:28e:80d7:663e with SMTP id d9443c01a7336-294cb4ffffdmr21884155ad.40.1761616970350;
        Mon, 27 Oct 2025 19:02:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUxghaYNmQqPK2saAE7r7SCzRdyzrULOVS/CNtBQxvDlc6kr4GGOx6zKHHzmW/336KTEw8nA==
X-Received: by 2002:a17:903:41c2:b0:28e:80d7:663e with SMTP id d9443c01a7336-294cb4ffffdmr21883685ad.40.1761616969873;
        Mon, 27 Oct 2025 19:02:49 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d2789bsm95861895ad.62.2025.10.27.19.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 19:02:49 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 10:02:17 +0800
Subject: [PATCH v4 3/3] coresight: tpda: add sysfs node to flush specific
 port
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-configure_tpda_reg-v4-3-23000805d21d@oss.qualcomm.com>
References: <20251028-configure_tpda_reg-v4-0-23000805d21d@oss.qualcomm.com>
In-Reply-To: <20251028-configure_tpda_reg-v4-0-23000805d21d@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761616955; l=3779;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=jDq21b1Z8mMMtc7DmhlI9qf036ZjY6vmqb55m6leOnQ=;
 b=TykYWRh4kXkeVJ0qVldcJsYhpROcPoeLyg/QusfUnnRl3p+TkGNRszmNpzWTK64rMcJ9EwJRa
 PpZJQhq55aYCnGajpS4jseWWlXV6gIeSqWMP/Kgs4GAsGH39iGDjaz6
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: CQdS5ywcJIu919qEA2-pUOXGb1lGj6Ba
X-Proofpoint-GUID: CQdS5ywcJIu919qEA2-pUOXGb1lGj6Ba
X-Authority-Analysis: v=2.4 cv=QuFTHFyd c=1 sm=1 tr=0 ts=6900244b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=oM8RmAA2zgEEgW_MHrIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDAxNyBTYWx0ZWRfX7L8z9Cpurk1N
 jMJiCVGTW4nPGK47O68LN83VMOtKCdNDAz6d9vI9KdINut1hV32TiLkoM3immkZCZGYl5YBjNpg
 HiqUXSiYpA8pt4mksg/gcxjqf50bkqJkjwqDutMg/EOy4piI/ETf2VSpyl78buYvZbJTWy/EaOl
 U/kgjSys2leMNyltU19uFEqvpXGqMPZOxRkwLIUbdV3Vf3CnXTd8dRP0jp+hvLd/PVbraWUHPcN
 TS4Y+VuZ5EAsqMf1OixjINkPHeMDWkNpupufGe05Keuq0+fRUto/HYXnOmCnaan6E1jNmFi20mt
 k927BEQ4PB9WxNFFEJP0KV2qOBj7MTGeXM4SNDND+fnxFG+1cqqg4HCMKDn6AmCXBzQ0qC0m1TB
 rjharQe2F7C8QMiC5gtuR5R9ICPYlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_190251_582148_94231AD4 
X-CRM114-Status: GOOD (  16.25  )
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

From: Tao Zhang <tao.zhang@oss.qualcomm.com>

Setting bit i in the TPDA_FLUSH_CR register initiates a flush request
for port i, forcing the data to synchronize and be transmitted to the
sink device.

Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  7 ++++
 drivers/hwtracing/coresight/coresight-tpda.c       | 41 ++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h       |  1 +
 3 files changed, 49 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
index 80e4b05a1ab4..e047f69fd5cc 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
@@ -41,3 +41,10 @@ Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
 Description:
 		(RW) Configure the CMB/MCMB channel mode for all enabled ports.
 		Value 0 means raw channel mapping mode. Value 1 means channel pair marking mode.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/port_flush_req
+Date:		October 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Configure the bit i to requests a flush operation of port i on the TPDA.
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index f079861da279..3121c4c527fa 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -481,6 +481,46 @@ static ssize_t cmbchan_mode_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(cmbchan_mode);
 
+static ssize_t port_flush_req_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (!drvdata->csdev->refcnt)
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	CS_UNLOCK(drvdata->base);
+	val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
+	CS_LOCK(drvdata->base);
+	return sysfs_emit(buf, "0x%lx\n", val);
+}
+
+static ssize_t port_flush_req_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf,
+				    size_t size)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u32 val;
+
+	if (kstrtou32(buf, 0, &val))
+		return -EINVAL;
+
+	if (!drvdata->csdev->refcnt || !val)
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	CS_UNLOCK(drvdata->base);
+	writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
+	CS_LOCK(drvdata->base);
+
+	return size;
+}
+static DEVICE_ATTR_RW(port_flush_req);
+
 static struct attribute *tpda_attrs[] = {
 	&dev_attr_trig_async_enable.attr,
 	&dev_attr_trig_flag_ts_enable.attr,
@@ -488,6 +528,7 @@ static struct attribute *tpda_attrs[] = {
 	&dev_attr_freq_ts_enable.attr,
 	&dev_attr_global_flush_req.attr,
 	&dev_attr_cmbchan_mode.attr,
+	&dev_attr_port_flush_req.attr,
 	NULL,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index 0c9bf2fade56..284ac63699ad 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -10,6 +10,7 @@
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
 #define TPDA_FPID_CR		(0x084)
 #define TPDA_SYNCR		(0x08C)
+#define TPDA_FLUSH_CR		(0x090)
 
 /* Cross trigger FREQ packets timestamp bit */
 #define TPDA_CR_FREQTS		BIT(2)

-- 
2.34.1


