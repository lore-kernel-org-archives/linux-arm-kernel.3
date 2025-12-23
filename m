Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9F6E6F072
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 08:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XbT9xyXyruRq8NxDTnRCNgOlGIrgZHVkf8eAY8IXwks=; b=oaMgY09zYPmk3QLbGgX2AguNWC
	Pfdd1qTU4s0qnIS6Auob8RFZJW2hKJQLnHu9gfvDUNeCeoVvwU+pD5+4vDogttQjSJduXFDrka0T3
	Na46b/fikHPDOSvOEC/X4DWPeWOgL9MqPGupm5PcMPsJE+3ryih+1N/c+n93BdetsbrjrBVjdK7fL
	PGGN3JlBAn0h9KgFBau6eQX8V6aCSN2sz5iNMLU78+4eud4l7M2p0e5nzrm51jUyejb4+w/8T/2Jr
	0OLiUyvriP/v3clOYuyVk3aLUz2HXp69fYbS189+7UVNbLZPgm6lZeOOqN+aRccQfDBumH/2VVXuv
	Rh4i3FkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXxyM-0000000Eh4R-1DVC;
	Tue, 23 Dec 2025 08:42:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXxyJ-0000000Eh2N-0U9Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 08:42:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2dlKk1896911
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 08:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XbT9xyXyruRq8NxDTnRCNgOlGIrgZHVkf8eAY8IXwks=; b=Dsx25iSAWnKoyvIY
	9bNzumT8ptl01PMSBU75fNclnx4vcE4U2w9Q3OlT3CuklopQjRadu1dYmqjmW5VP
	j3199nVZ1BFV9jy+bSKxux/3wfwQL34hGDyg5hd/auPgbe4L+MnQZ3UmML0pXQM5
	b514UAx4wZKmakjYrKMxEMiYy97iqEonSQyKnjlAGMQ88+pIADl0OaLJx854TOVt
	HlwXWSEeOjJLvZARttR/l5m/Ppyc6QSjun3AdgM/R4Lpk/TC+05ruKHy6j/V32rW
	9Uxw5uJrdBujdTfhHRigGy+a8/foAl7PDqQol3yREnldnITa4coKILYGGRVlpOQn
	UQ6wDA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b74tak5e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 08:42:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a13cd9a784so51239755ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 00:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766479340; x=1767084140; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XbT9xyXyruRq8NxDTnRCNgOlGIrgZHVkf8eAY8IXwks=;
        b=cRiDDR0J589fRbbRzTv/IQ8aNqTMzq5CdOrXqKfwQQX4Zw9lfVrOEbUaeuQEw0AkgZ
         QhU8ep5WL0jI5HUsdR4jA9CIoDJVquVyg9tcAhZ4Wu1YBxZTxs3UwSlPXZwoM1/snjk/
         dVGr15SrKkAm7GyJ/sdAYOhGqxEZV81KfVqtWqS/iFqWEwvfdjKx8tWyZOcztfY1GPkv
         crnbZrSqg1p13hYA1AeeUHNavZhzfTs9SLC7KPSDeZ28TbDx7vcEGhg912p9sOvl2X0+
         cO7b22GAVqHAVU+/1JIiTHshnSHPS+YEiOq6Ake6mnyRjkRhM9notJBcJJ7BlfjNgjgW
         7qlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766479340; x=1767084140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XbT9xyXyruRq8NxDTnRCNgOlGIrgZHVkf8eAY8IXwks=;
        b=deGOw28bq0LbA01Ye6AgrWi2YvKfF+KTKAHe1dUiPK7SsOtfed+PmX4LhJ0eKTCpVs
         H4D071v3HmW/oYXOM66c7GGujqIadNT1pVkPNACjz2tyEuLBI3ltXhwCC7bx6uXELzBU
         z+u9vfNeFwRj+8Tlcqw6+ZlgljYTt5E3NsG8f6YIzMtxOWHR4QiI5UVBKh7Phw5JBn3a
         0HcInIbUigtGBh8+qsdICLiNEjvEkpTkWvTJZiLpYu3FYjLHzzbEyEMEzT44AeBi9+zZ
         YuyjicyCjN6rLFrL+kjufdg7HR0AmyUNgTEpODJqdz1l/NEEd1xDMvMKbTOmtkMA2bGw
         3I9A==
X-Forwarded-Encrypted: i=1; AJvYcCWRoHh3AhYvucjgvi4p3n2pZAwNoNMqUtmLd/dGcJ45L68N6iBKdu8tyIXdlY6k2abTeW6ouaySW8nkMLPHxOPA@lists.infradead.org
X-Gm-Message-State: AOJu0YzM1BxxnwYa5EopbZBW51wHtzC1Mw+t+w7W94uPpNz59sLxC+tZ
	JBV87EWyDRJliuGRIm/ulEd50lxV7J8d+uDu48n5CQBQ1pGsm2/f6En2VwfOv4Ujpzd4YO2p8JP
	WszKLFGtOQtJx4MXVUDGhXG4owLyeE8lVHzWFW62/8//1Uqowf+tI9d3ZumNUT3bUVvN/UzuJM3
	MSDncUamjDI2zc
X-Gm-Gg: AY/fxX6o/enKyIrtVAeu1nU/bm5Ath/xErkIAXzXDHf9mEhJrr6tftvy6mJ0iczX08e
	1wDkt3eBfP7A20+1CLV6hSygPX6WpnN3N51ERB9l1NIVFEgZBCCjLsb2Uy2VTWnRPRLBhXSWGjI
	IuqUV+YgkQmbwCg5PSUQPhrzPtqaY9jJMytT0ItfUK4FiqoOjRzZJ2xEKYK9H9LFDpUoWqaP8UF
	999OZV9CJagc3LyqH5lFedEGAEWHhg48AqFkezNr3DcQNoqPdWZtxl8iC2pOArZxem1BbDk/z5H
	BOG2ZTvpIkv9FBayfR4N4CV4d+s2Uix6LnlAVthHCn5h8mEDYr9XwtOT1VQ0WXDRlCWyhYlys+p
	T82cpRDf4/4khrBJavmhzQvXclSWKyQozYebpm/5espASOUW3xatXkMgW9TC5nlEpTJNZWK4m
X-Received: by 2002:a05:6a21:3086:b0:366:187c:55 with SMTP id adf61e73a8af0-376a4c66ccamr13041786637.0.1766479340439;
        Tue, 23 Dec 2025 00:42:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHD6CzOLa5wneEXcA3s+ngZ5mFLKYVl5eBSaO2lQZNdK9/Nl+gbvsicxBFPYQ0WsMnlcVIr5A==
X-Received: by 2002:a05:6a21:3086:b0:366:187c:55 with SMTP id adf61e73a8af0-376a4c66ccamr13041763637.0.1766479339944;
        Tue, 23 Dec 2025 00:42:19 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961e045sm11163561a12.1.2025.12.23.00.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 00:42:19 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 16:41:47 +0800
Subject: [PATCH v7 3/4] coresight: tpda: add logic to configure TPDA_SYNCR
 register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-add_sysfs_nodes_to_configure_tpda-v7-3-db4e6810047c@oss.qualcomm.com>
References: <20251223-add_sysfs_nodes_to_configure_tpda-v7-0-db4e6810047c@oss.qualcomm.com>
In-Reply-To: <20251223-add_sysfs_nodes_to_configure_tpda-v7-0-db4e6810047c@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766479326; l=6788;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=bQUEQYYJfc4DZQi22Ooa/Gz1xbjQemDJoaQ5DyMhovY=;
 b=bbrdC8w4BVwEFahc73WE1RmNYXL2UPWajyML5dk4AsUuu3wKaCik9Zp5VWEAXeKJ8fgh9C55p
 rNOzeeVkRysBpTwGKfEr4WOza4JdWmhC3Ti3g9j5lzfwVS+graQcf8z
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=DPiCIiNb c=1 sm=1 tr=0 ts=694a55ed cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=gRM4NHGxar3dF8ctfloA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cOlpsrHafN09JVLwKePrgX8DykHErwLW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3MiBTYWx0ZWRfXxzd82FKdYm2q
 PreG7qb8c5wlehelkyU6esRcYbRs9uhWW3SBXrqiniw8OEoTAs1QVK21RBgWyS+0hmOoGxYPUYj
 VxIQ1Br8UMAedCAzd3p8bsBquJMgP13xzkLkyLZQFYm42xFbeBzNQ8Vt8utkuw7vFNUYAtRzIMn
 JoXrgwcw0oTWSneu5K69n7nsoYkCQJJctexcbH+CGKELwRroRYaKDG280KTgegc+Kd1mHIdXckv
 alMqnfFSAq3jV9Q1sWcueCTRsTEVKmvRZwnmlplwwAUYoaNqUiBAKylTPtgZ+jqmsRp2j0oaX3n
 TEJNP58Vzrp/yvKm7QztVq4d6rzQkuaNCWKFuJIdLQwoNSlGGs2oSe4/7J8kBvjT0A6nK89tgas
 3ofLK4eVJc27oPUWaanJzR7jhFaZVkzU8KgaLZAZt/3Mtat+lqGTOUSgCLrgf98WNu7IJO3/tzq
 IIDvSyk2BGTcN7uffeg==
X-Proofpoint-ORIG-GUID: cOlpsrHafN09JVLwKePrgX8DykHErwLW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_004223_293452_3D46671E 
X-CRM114-Status: GOOD (  22.53  )
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

The TPDA_SYNC counter tracks the number of bytes transferred from the
aggregator. When this count reaches the value programmed in the
TPDA_SYNCR register, an ASYNC request is triggered, allowing userspace
tools to accurately parse each valid packet.

Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-tpda   | 18 +++++
 drivers/hwtracing/coresight/coresight-tpda.c       | 90 ++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h       | 10 +++
 3 files changed, 118 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
index c8bc7b19ab25..c989eea1ef59 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
@@ -41,3 +41,21 @@ Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
 Description:
 		(RW) Set global (all ports) flush request bit. The bit remains set until a
 		global flush request sequence completes.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/syncr_mode
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Set mode the of the syncr counter.
+		mode 0 - COUNT[11:0] value represents the approximate number of bytes moved between two ASYNC packet requests
+		mode 1 - the bits COUNT[11:7] are used as a power of 2. for example, we could insert an async packet every 8K
+		         data by writing a value 13 to the COUNT[11:7] field.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/syncr_count
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Set value the of the syncr counter.
+		Range: 0-4095
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index d24a9098f1b1..8283e16ec400 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -163,6 +163,20 @@ static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
 	 */
 	if (drvdata->trig_flag_ts)
 		writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
+
+	/* Initialize with a value of 0 */
+	val = 0;
+	if (drvdata->syncr_mode)
+		val |= TPDA_SYNCR_MODE_CTRL_MASK;
+
+	if (drvdata->syncr_count > 0 &&
+	    drvdata->syncr_count < TPDA_SYNCR_COUNT_MASK)
+		val |= drvdata->syncr_count;
+	else
+		/* Program the count to its MAX value by default */
+		val |= TPDA_SYNCR_COUNT_MASK;
+
+	writel_relaxed(val, drvdata->base + TPDA_SYNCR);
 }
 
 static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
@@ -385,8 +399,84 @@ static ssize_t global_flush_req_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(global_flush_req);
 
+static ssize_t syncr_mode_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val, syncr_val;
+
+	if (!drvdata->csdev->refcnt)
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	syncr_val = readl_relaxed(drvdata->base + TPDA_SYNCR);
+	val = FIELD_GET(TPDA_SYNCR_MODE_CTRL_MASK, syncr_val);
+
+	return sysfs_emit(buf, "%lu\n", val);
+}
+
+static ssize_t syncr_mode_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf,
+				size_t size)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	/* set the mode when first enabling the device */
+	drvdata->syncr_mode = !!val;
+
+	return size;
+}
+static DEVICE_ATTR_RW(syncr_mode);
+
+static ssize_t syncr_count_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (!drvdata->csdev->refcnt)
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	val = readl_relaxed(drvdata->base + TPDA_SYNCR);
+	val &= TPDA_SYNCR_COUNT_MASK;
+
+	return sysfs_emit(buf, "%lu\n", val);
+}
+
+static ssize_t syncr_count_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf,
+				 size_t size)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	if (val < 0 || val > TPDA_SYNCR_COUNT_MASK)
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	drvdata->syncr_count = val;
+
+	return size;
+}
+static DEVICE_ATTR_RW(syncr_count);
+
 static struct attribute *tpda_attrs[] = {
 	&dev_attr_global_flush_req.attr,
+	&dev_attr_syncr_mode.attr,
+	&dev_attr_syncr_count.attr,
 	tpda_trig_sysfs_rw(freq_ts_enable, FREQTS),
 	tpda_trig_sysfs_rw(trig_freq_enable, FRIE),
 	tpda_trig_sysfs_rw(trig_flag_ts_enable, FLRIE),
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index 1cc9253293ec..56d35697303a 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -9,6 +9,7 @@
 #define TPDA_CR			(0x000)
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
 #define TPDA_FPID_CR		(0x084)
+#define TPDA_SYNCR		(0x08C)
 
 /* Cross trigger global (all ports) flush request bit */
 #define TPDA_CR_FLREQ		BIT(0)
@@ -36,6 +37,11 @@
 /* Aggregator port DSB data set element size bit */
 #define TPDA_Pn_CR_DSBSIZE		BIT(8)
 
+/* TPDA_SYNCR count mask */
+#define TPDA_SYNCR_COUNT_MASK		GENMASK(11, 0)
+/* TPDA_SYNCR mode control bit */
+#define TPDA_SYNCR_MODE_CTRL_MASK	GENMASK(12, 12)
+
 #define TPDA_MAX_INPORTS	32
 
 /**
@@ -52,6 +58,8 @@
  * @trig_freq:	Enable/disable cross trigger FREQ packet request interface.
  * @freq_ts:	Enable/disable the timestamp for all FREQ packets.
  * @cmbchan_mode: Configure the CMB/MCMB channel mode.
+ * @syncr_mode:	Setting the mode for counting packets.
+ * @syncr_count: Setting the value of the count.
  */
 struct tpda_drvdata {
 	void __iomem		*base;
@@ -66,6 +74,8 @@ struct tpda_drvdata {
 	bool			trig_freq;
 	bool			freq_ts;
 	bool			cmbchan_mode;
+	bool			syncr_mode;
+	u32			syncr_count;
 };
 
 /* Enumerate members of global control register(cr) */

-- 
2.34.1


