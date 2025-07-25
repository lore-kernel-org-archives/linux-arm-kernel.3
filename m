Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B6EC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 10:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQSm3zvoXYxxsOZ9zUxxblStkpQCRCtAS9aiINsQKeM=; b=WNe9nA6p5dl2dOm55b9yqzEGC+
	NE2TT+rrfbv5UpAL6zetWxEQPDM70a/IjWXi6HPB44mwXrbdbShMbKipvkiV6ft8sgTsQLTUIQB/W
	kXhxEZCRitIkPHre19EDRQ/f5wysfHSO7F5l4E9IS8pCxfvQN7JkEzT0h3HpPZdNV9YNqm/4MX1Mi
	9fZQHAv9n2miVfboLryPXXXD+4COQr3HaJ1ryouu1inNIP+kAXiuLR1lvokuj0oGwOKYWFozhzOpY
	Al1M5PZX3+3k52eu5yIVJavhNje8FqNUyM+zx+iATYxLwOaiGbXi6iHxRJCbS869rPlPlna4X0jNd
	qW5yDroQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufFvC-00000009d2v-2jTj;
	Fri, 25 Jul 2025 10:45:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufFLf-00000009X9T-1UkO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 10:08:20 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P90Agd015315
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 10:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JQSm3zvoXYx
	xsOZ9zUxxblStkpQCRCtAS9aiINsQKeM=; b=YNJKMEb34iL64fQ1J0XRQRZP3lV
	P+cuxrHw8wkky7k2ghef9lrh5qd2HR6RqzvhEsoCodZQxM+6iORpReT3gl3LHPWx
	KXDbulYZQBLP+EHrQh88u9g4NznCKjN/2jTT/mtdQ6Lsg0NNh4cyHUjbDTUFlp6+
	p/hK2mDfRjgGmEO39xc6CU+YQBYP5YdL+FuN8WGosBK/F0KePv/+1fAyMhsMI3BP
	uMUYW0SMOheZ0CQNTpvzyfNLKzHNGMAw2v8AOtYcCUMfsQKL9nqBhfyRhOhB//XR
	qg2+vo5+yH4z0yQv0MsaZFD89NvTjG+LVXbm4TWPXCuYLh5kEXleLoZhJmA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2qhpj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 10:08:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2363bb41664so18136405ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 03:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438098; x=1754042898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQSm3zvoXYxxsOZ9zUxxblStkpQCRCtAS9aiINsQKeM=;
        b=gJjJWsMrBepB2splSETiZXV2Oa6dIWF0mkB0NkeuFnnUHwr11vyQh3+JU6lEEKBTKo
         eb6Dvu8I1r4aLCCWNDqVU3BJ2/E3ABjr5AJ2DdNCSSizepoSTDqbYCEW71rvGz9boae4
         mnDjxRLlI/clbSaH/RBkfcNGokzxtWQ8NXr5b0CLQMADWFiVBPI2kqVlWEIuocXO6E8c
         d3lei6JrFOUPwMofer/wFNrzBKA5iCJCtmcq72cwyAlNDPMWR7zYmts4W/UJqBrr//Nx
         kOU8C66xL42dEA7EKh+pNoktVuWQaMRxACvVoREBIhh0+8/JJCJp6Nrs3R3oY/yAHHzg
         19bg==
X-Forwarded-Encrypted: i=1; AJvYcCWeT/dKP8gwnDuIVSyyzqRNhlwt5GboZ0bNjNR8mEmNIgjhEkKMJ+aOIP0eV2ovc+PVtgf0J+/7SPB38YoAF57b@lists.infradead.org
X-Gm-Message-State: AOJu0YzbDfRlzTcncKsT+TPX1pA2qSXp4l1gbErMTizH0SRGvBQWf4bD
	xO7drUgvUDvJ/ZD2LNYYpFxeKaGnpvrnwqYm/ePUPwbUCnp/klWHl5bm26wdW35ogPUoVOUp73m
	luC0LE6TOuOrXXVloWlQ5AmTvtycGi2VPYrF6oQacMK6y6wTacZWoeruGkoH+pYJomxUUl8r18A
	+y3w==
X-Gm-Gg: ASbGncuXe+8DTzabQynMZPTUxqA8kJcRPiyAEE4F22UaE95/zuPTInk/ugk3q6JdKmG
	L+FyipFITNB6DdICTYOCiDewIN8WeDi/xlW4PXqTAmjhSqZ1RA2uFZFH+yxqgfEvlb6zKJjyEbJ
	ycoJ5WCPAXKGeSnA1+RwC8LbEgJiiXQ7zUdpNe0QqIKfuKMcZ5dman26dLNTtrcUeiWymQWlcTc
	XcUuXz6M3M73QJU3bQgHS2J13DKrcCauaXpHW6GsYTOXATW7x9jrtcwxRNP3ECyZW+IjyoI1pT3
	3zyYIc7Hxc6UzmmUvkMlugDAm7gmCkgdu4hhcQ5QtV1jR9EewI8s+hx0cBfKJXmqwcGSndB1yjQ
	ewcHy5r6dtA6NUut1KQc=
X-Received: by 2002:a17:902:ef09:b0:215:b1e3:c051 with SMTP id d9443c01a7336-23fb2acfed9mr21632275ad.11.1753438098023;
        Fri, 25 Jul 2025 03:08:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGueJ9+UVphua6IFcLHYOrZC6BjRhw5clhGAM6ie7Z8MXkNXHXuyioPE834TkUegaSIl4MtsA==
X-Received: by 2002:a17:902:ef09:b0:215:b1e3:c051 with SMTP id d9443c01a7336-23fb2acfed9mr21631535ad.11.1753438097427;
        Fri, 25 Jul 2025 03:08:17 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48fd29dsm33641435ad.176.2025.07.25.03.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 03:08:16 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>
Subject: [PATCH v4 01/10] coresight: core: Refactoring ctcu_get_active_port and make it generic
Date: Fri, 25 Jul 2025 18:07:57 +0800
Message-Id: <20250725100806.1157-2-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RbqQC0tv c=1 sm=1 tr=0 ts=68835792 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=UMME_An3wchvczm7DuYA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA4NSBTYWx0ZWRfXwmNZPFiQUxAK
 BZO7UX3WHUj/nZEwMkIj9OvAZP+Q0UKOzWKzBD5OZJMUHv/3LFTBqOACFEp6jXJvDHs+dZyZmHc
 K+rI5jfgrv4XwQeYdNSVycmLBEjYoBzEMMUDJojAMSBfHfrO0kE8QRErgZRdUbzLjzsmic8rjDh
 VdgGp6KnLD3i4qdBX9Smurd6s2xxhhZSh9L09lwi77PH/rpRhI94CyXvBIRWZCA41MV1j4955t8
 8jc918kKzYyI7eFXPAj+hYVLSF3sdPB+1QhWO5bqdZM+noJZ5nvTQXbUYJypufb9R5u69WsEjt3
 A4ykaHBQyf4P9BisC5ZG69u0cZGFUwPKfcdnfassknjnZJqdG2KYIF1BM1mfkpy4lQ30wjY+gwL
 5SQ3CzYtPPpu6NwUvEjU44b0d478rhS3V1LXPaq70GsTH7hZi11fvdIMaCJbv7SjK8f0GvdK
X-Proofpoint-GUID: 0K3FpQz6N8pmHokpuQYbr2I8mM3ZouyT
X-Proofpoint-ORIG-GUID: 0K3FpQz6N8pmHokpuQYbr2I8mM3ZouyT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_030819_405441_5AF679A8 
X-CRM114-Status: GOOD (  22.25  )
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

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c  | 24 +++++++++++++++++++
 .../hwtracing/coresight/coresight-ctcu-core.c | 19 +--------------
 drivers/hwtracing/coresight/coresight-priv.h  |  2 ++
 3 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 1accd7cbd54b..042c4fa39e55 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -580,6 +580,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port_dest: get the in-port number of the dest device
+ * that is connected to the src device.
+ *
+ * @src: csdev of the source device.
+ * @dest: csdev of the destination device.
+ *
+ * Return: port number upon success or -EINVAL for fail.
+ */
+int coresight_get_in_port_dest(struct coresight_device *src,
+			       struct coresight_device *dest)
+{
+	struct coresight_platform_data *pdata = dest->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (pdata->in_conns[i]->src_dev == src)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_in_port_dest);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index c6bafc96db96..3bdedf041390 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -118,23 +118,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
 	return 0;
 }
 
-/*
- * Searching the sink device from helper's view in case there are multiple helper devices
- * connected to the sink device.
- */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
-{
-	struct coresight_platform_data *pdata = helper->pdata;
-	int i;
-
-	for (i = 0; i < pdata->nr_inconns; ++i) {
-		if (pdata->in_conns[i]->src_dev == sink)
-			return pdata->in_conns[i]->dest_port;
-	}
-
-	return -EINVAL;
-}
-
 static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
 				bool enable)
 {
@@ -147,7 +130,7 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
+	port_num = coresight_get_in_port_dest(sink, csdev);
 	if (port_num < 0)
 		return -EINVAL;
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 33e22b1ba043..e51b22b8ebde 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -156,6 +156,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port_dest(struct coresight_device *src,
+			       struct coresight_device *dest);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);
-- 
2.34.1


