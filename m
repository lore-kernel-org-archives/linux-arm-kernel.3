Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A77DE6F07C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XdOVcIcuDLUCqeTtx9Xz49VBdyYG7vFvks0bntyge/4=; b=MRYbB0XiVgWKzxxwuuK7UCpHCF
	aXVcOHf8LorpjLB8nUjeqUlBhwWxEOi/UwHaDM3LwthFdQkKosya27DZCeUtT1lkSoMRn9zq8PG9Z
	XK8Qj2fkz18R3R2tdrB4+SBrwWgyG+b7wmgvH+zFJiHN5X3wvsRBvZOa+L606Nrb2GSjJZEmJNCS6
	DQp/KwBtzrdx2nhGbEjMkVmVz49/+mMcp4abwaq7TaF/2l16yJjO3biqSJDOWN+LM9UISPd1tQoCK
	zmSfuxTmr2YMy+IJUwvRx4PEUbWuLTTwOS9RJLZO22/IXdLz99LcsuSRNJEEUOLAgaQ68GDQCIKhd
	R8gK23Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzLR-0000000ErZv-3TRt;
	Tue, 23 Dec 2025 10:10:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzLO-0000000ErYC-04Wz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:10:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN92OhX2747233
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XdOVcIcuDLUCqeTtx9Xz49VBdyYG7vFvks0bntyge/4=; b=f6hhugAUpC/srSb8
	6Muums8tj+ddseubT43GTKLhuyt57stFzCvaPAglSafp2XAMoReHxjNGyaOn9P79
	HPHYiWE6aMTrI91JNwWOYFjoWurg5wXO6DNr2PSZWhKAN7lVDeEwlKWS3Q9EbSB8
	ksl2/T5DBxCwGAcoLasGB4k/ryK17rqnA8DOyNGMb26imHzmHYGhrDnaLypxN6wc
	p4dl/ES+z67qAjm5gVwXDyufHKT66D4LWQyI/8RMB3bWgxyg10y0nmSzVuWn0k9V
	uRDzlSHDCj0B88niEcadQWmKRvZdBJCSjZYrk1G7CY/wzFWHDmXRWmoUkB1UwAmL
	mcdU7w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7h5csp0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:10:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f177f4d02so109356025ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484617; x=1767089417; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdOVcIcuDLUCqeTtx9Xz49VBdyYG7vFvks0bntyge/4=;
        b=HI8QmwGxyKJZY3n+LrcwTQ4oysfLO0QoFIeN4Pt/SN76BcQVhz60UuXSNW3IYAdI0c
         cyONbb9fea30rYL5Ahgx0TfeS9F5Hnawyd1x1xf+iCxEzwBgLMjByXEaAYdk37chqMsl
         TnIJD4RBllcGewHH3bSD/qQRCcnBfyEGPqYmgKvnkmykGpVDTjT7/JVXTZ/j7ShF/H0G
         Xqfr0R+vH6BpSA6hW2QJ4nCKGA38EkNrAkGfwCGlhy4DvYwzQkqAePA+YhNOt5gnf1zO
         zaDWQHnyqQd27B/TL3r/Q3Ar6BjjNEVEToL8Z6gbIuljLvlMJSqVdB2mAjbFbiKP9LAE
         HL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484617; x=1767089417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XdOVcIcuDLUCqeTtx9Xz49VBdyYG7vFvks0bntyge/4=;
        b=MbU6NRuqy0seaYDQ4Uu5jravLqQ5vlbw4Ng+e9l2ULMC8tyLJ4MG5hR9lfgovoBGGP
         wqy9XT2YOgbrnmfbxzXRCiTVk5BnmKwxm4Pi/sr3yRSz6NKhyeig5UksEpAyUNQ5PeVx
         FAzg8iYLsBzJzY67rqBrq2kHEV4iZLh0XjObb1cKuRnCUCLE5k47uiumTIHv6V/s+Hea
         HdZNTRoHbT/TWB4FoBcARf5Hd3Lvu2vI9GhRBORF01Jz9BEwkAbU6SXa22d65DVjopKI
         hISDXHyMQ4BV4wIp7IfSK1d0L3M3VINhhKB409dRQQgFu6+cSKBAwFZWyYpeWtW65gV9
         4BMA==
X-Forwarded-Encrypted: i=1; AJvYcCUOQwImJWDH64Y5s9KJk2AAz9lRAYdS6+ysc1lKXkMDuXM3H4eOt22oKBkyUydjeRlj33hlGgRO09Sss6EIRAji@lists.infradead.org
X-Gm-Message-State: AOJu0YwgzLg571sp9u786Uhwe6pOsHz8UIKIzFDIHxpdL1MCFOLAPlCc
	drW81jT2z1O/tT2acLneRL1cT/PkvZtqSXAT+5NMXecomnuNdyeQZO7ueQP69vly53qwPxEp6O7
	1EygkljjrgiA26LDBTfI9Y2BsjwQg4lMMo61RhDHeZaMCgIqBU0w2hUc/S3olCGByY5NiyJZz1u
	ZIJA==
X-Gm-Gg: AY/fxX73aWmh7Y2nK+ypMYSdRMb5RfhJF6AFxtmV9cDyfx3y18ZQzWDzO0jMrvAgY91
	ZAXGRMw8oZFmQGvXyhblhcZe9GnEU8YK5KLVkPeSCHuglnbx980pwUu4Q2RzOjhMYZ0b8ykywHL
	fz4RQ3USxMYInO21bjXIdNHvVJOPVzlKRF7Mg6Ntq0VHsxGHtCbaZNwl0nvy7F5RHKKTMqdIiK2
	CzWjTRglQsgla0gXbgHkqgCIk3rA4WhfNxpr9+SIX2pHSHN1Yanpeu9qvq1nKZ6ZbXfgIH2B6eq
	Fnx1qd0ekK6l/XdrUboaqsrFILxsB+o8+JZB5VcV5V4ytp/4nmJ8SSJu1JkSmh51BgH2/LAXFgt
	hokbi1S259QM3GIlXhge4enwtX+diFI15pjR91PPqB0RGkXfPmAFmycngcZOkjqB2wjJIZFFW
X-Received: by 2002:a17:902:f685:b0:29e:97a1:76bc with SMTP id d9443c01a7336-2a2f222993amr156566285ad.21.1766484616859;
        Tue, 23 Dec 2025 02:10:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJPoLvcpdei9pbzqeMjHIxsQl0q+Y8kp+g2fmaHd3ALy1TGefirP7ajk/TLwMsjwmoS6sXHA==
X-Received: by 2002:a17:902:f685:b0:29e:97a1:76bc with SMTP id d9443c01a7336-2a2f222993amr156566015ad.21.1766484616349;
        Tue, 23 Dec 2025 02:10:16 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6661esm120824625ad.2.2025.12.23.02.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:10:16 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 18:09:51 +0800
Subject: [PATCH v8 2/4] coresight: tpda: add global_flush_req sysfs node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-add_sysfs_nodes_to_configure_tpda-v8-2-4c95db608b62@oss.qualcomm.com>
References: <20251223-add_sysfs_nodes_to_configure_tpda-v8-0-4c95db608b62@oss.qualcomm.com>
In-Reply-To: <20251223-add_sysfs_nodes_to_configure_tpda-v8-0-4c95db608b62@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766484606; l=3748;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=BRgMyJQu9Kzy/G9nmhSYpMl8s8NAvtzMpAI0JLWtcFU=;
 b=kFEug5Yy6zqEyXsncSCDYl5R93e6pOh7tyo7kPO5R6ViIygXbLK08/9I7/EWAMBCu6bYrYEt4
 D04mT3dD0ZKDPQvQr16SSXVZtDaUwdoPYXagWLjRkJdTCizEUICKidd
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX2Ds36h/EBCOo
 QPH0RYtx2qNXFTz9VmFpyOatIea/h5x2vEZlH0c1mNcfBuDTyNmX8d57JK5ECJ+Lnz250OYiXtZ
 MYYTVc0Lh8Hnn6UKldcx9KMO6kUdlCn9CO9pGCVQMqBdJfgqFTUO4rz6D0CNNyWitqcm5X0LGZV
 ox2Z5COeD3GDkpHBWQwlPkN90tuZrjsNAxAMUFpnLHPyAJOC1YJXDjudO792ytmsA8BaULdWJzT
 r4sAiUyr+TyZEzD0fIPe2p+Ls1v0GWjLe/TWbhUhfVuBglICXSJN71VsdO/Sn1ZW73QdVfK/DFB
 tzYLiHo5QeN/GXWwDq1ezQwUhdKm4+7bTC+pHMnLm+RVLvtv1ZknJdmOOZyS7KGeMYvPurFAhaa
 JAYSzx29HBPxAfYGNpTDvxJce+1NFeZQtyhOKf76fNHSXC0w1HurE5SSTtvLy7Izfa575K2VWE2
 CYKe9CT+48Bg5CbaJkA==
X-Proofpoint-ORIG-GUID: RS7lUt5fIDr5q1IJzHKKHicm5TSZHtjA
X-Authority-Analysis: v=2.4 cv=LeUxKzfi c=1 sm=1 tr=0 ts=694a6a89 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-PhlUL0ANfhXhD-FZUEA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: RS7lUt5fIDr5q1IJzHKKHicm5TSZHtjA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_021018_058005_7D153717 
X-CRM114-Status: GOOD (  16.03  )
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

Setting the global_flush_req register to 1 initiates a flush request for
all enabled TPDA input ports. The register remains set until the flush
operation is complete.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  8 ++++
 drivers/hwtracing/coresight/coresight-tpda.c       | 45 ++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h       |  2 +
 3 files changed, 55 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
index 735ce0e494da..c8bc7b19ab25 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
@@ -33,3 +33,11 @@ Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
 Description:
 		(RW) Configure the CMB/MCMB channel mode for all enabled ports.
 		Value 0 means raw channel mapping mode. Value 1 means channel pair marking mode.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/global_flush_req
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Set global (all ports) flush request bit. The bit remains set until a
+		global flush request sequence completes.
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 2186223ad33e..d24a9098f1b1 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -341,7 +341,52 @@ static ssize_t tpda_trig_sysfs_store(struct device *dev,
 	return size;
 }
 
+static ssize_t global_flush_req_show(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (!drvdata->csdev->refcnt)
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	val = readl_relaxed(drvdata->base + TPDA_CR);
+	/* read global_flush_req bit */
+	val &= TPDA_CR_FLREQ;
+
+	return sysfs_emit(buf, "%lu\n", val);
+}
+
+static ssize_t global_flush_req_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf,
+				      size_t size)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	if (!drvdata->csdev->refcnt || !val)
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	val = readl_relaxed(drvdata->base + TPDA_CR);
+	/* set global_flush_req bit */
+	val |= TPDA_CR_FLREQ;
+	CS_UNLOCK(drvdata->base);
+	writel_relaxed(val, drvdata->base + TPDA_CR);
+	CS_LOCK(drvdata->base);
+
+	return size;
+}
+static DEVICE_ATTR_RW(global_flush_req);
+
 static struct attribute *tpda_attrs[] = {
+	&dev_attr_global_flush_req.attr,
 	tpda_trig_sysfs_rw(freq_ts_enable, FREQTS),
 	tpda_trig_sysfs_rw(trig_freq_enable, FRIE),
 	tpda_trig_sysfs_rw(trig_flag_ts_enable, FLRIE),
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index c93732e04af2..1cc9253293ec 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -10,6 +10,8 @@
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
 #define TPDA_FPID_CR		(0x084)
 
+/* Cross trigger global (all ports) flush request bit */
+#define TPDA_CR_FLREQ		BIT(0)
 /* Cross trigger FREQ packets timestamp bit */
 #define TPDA_CR_FREQTS		BIT(2)
 /* Cross trigger FREQ packet request bit */

-- 
2.34.1


