Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7671FCA1017
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 02:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmrEmFTMxg84eXRvylgPXjTGj2u1nEfxmypzMMZc/rM=; b=MkTKwM010E96V6vTaqjjQZRibo
	d0JsDW5YyEjkOvXXMqUE81YuhfdjSWpiqwa/Fw6p8ICou9jTADFDJuMSieGI8cmiR+tDyT3yuXstr
	gGdRd5mBJoFIBjjWKg3XTqBpt4v9UMazTH/NfW3QpF78NXYjnRQrM0fFYtmeqoc0SMSNAA72vPvqh
	2Ies9RoMehcU0ROS74uyEQ+kJRbsbOv+OO+JuXtHC5DKQioWIeN6kBx1jKx3858iBxsS5PILdmyEI
	mO5pTDkjm5oDeUJZHMFn/bkATJRpH8KW08mF23DcpmmkIKgaBJ7TI7qyxFky1EAUCRv7Gi0sZLa8+
	6UNivyBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvRLe-0000000Dwzj-0lgR;
	Mon, 08 Sep 2025 02:11:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvRDK-0000000DuiS-3Lwm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 02:02:40 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587LtDOw016168
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Sep 2025 02:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mmrEmFTMxg84eXRvylgPXjTGj2u1nEfxmypzMMZc/rM=; b=SAbt/Bc2JoIaPY45
	59j0UsyvnCnYOylZEbH2gVACRNpOPn+Tj0yk8AuBs9qpG/tgFtNpjQhTFvIdte2b
	OFuME9rCEkfqQp3bRQiR1cpy/4Rw5I4bee29vRnMm11R7YdwBceeR2DQ6aKm/n78
	BJWDW/XS72Gz1xG7ofwGyT4sj3FceVqPV8Bao0F7SOyCK+lbY5r0HJjJ2hL7Fox7
	Y7GylWa2V+3O7W9kvxUrAmOORulAB3EBskwYknoB07jfE4CJA/Hy0c2UwDIVGfnB
	2/zXAUGasCYRnEoZfyTp4A9H/6MiruSYRKNWTYKVS94ZKkreuoOJuKy9WSvwNoLq
	1oz67A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490d1vaxsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 02:02:37 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-772248bb841so6997967b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 19:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757296956; x=1757901756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmrEmFTMxg84eXRvylgPXjTGj2u1nEfxmypzMMZc/rM=;
        b=gRCHlNDMt76ZMjB4WfopMufwLOrAAdlcohu17G0w9ljtsy9iWtaAwGL/myF5XPj4sk
         T7Qkyx2MrrQXa8nXErQ4eSqTp2u8sgABv1WVeHKbvpKHGn4+COKQOhpCB26HRKxWsR0f
         I/2kR3JeWKUzueL6QVanBcURMdJsc89Hnp1hIig8wGycsLDo7GeqsRSe71ol7YStd2uQ
         ojNlK2vjsdoa1CMUCGJLBiYV4+n7e6XxepGEjVtaNGKvPPNQN51xYqevA+DG1MOhdt49
         EjpJbja8Tjq7b2Yf0mVHGDIgxoeyYpDO9vdXHAmL8/Pfd9zQ1id+iGIeEbbL+hXBTNI2
         jEIg==
X-Forwarded-Encrypted: i=1; AJvYcCVs8hzviM6d2jiJwt2wtAwiZcSajQN+cpVFX9Hn0DxfAtLi7vPNL7rElkubwULmiVt5Js3ighmzgViVUl3w2iaa@lists.infradead.org
X-Gm-Message-State: AOJu0YxfixDEqq4IH0cgDjSuvlroY/xoncIoCA/kuwGQLhHKT2myv4I5
	+AtUdMTy3HYGHSE3Iva+CtuC33z3X+mz6uS2SHiNsEPr7+qASWTAEbMYMzLSyTh70ciu6wsvzbQ
	1okkWsbgO6cOU4Tf2dXj9jNu1BZKhe3CKnPcCNie0NL6YtTacCMKL5tfrxdbXM8/l2ukK0DG9T2
	fG4v3tdGkLb/nl
X-Gm-Gg: ASbGncsABG4HQiHK2NU7CRd/WZZt61HUcNGckGbpfVpJOY96k2uwuxXg7T63igSqqPl
	8SIJL74hKuvaMmxK5wbIVG9HGsz9NLUyDYzTMHZ386G28OVERVnctCv9RPXd7VQrQWNwkRiUyo/
	K4NS1A5Cc4qTgRCg/mDU+FA6N4YElnsGQqJ2Kwl6VMn/ky6BOK9zUpKaYVQcpowW0HRBkGYSyM2
	tdC0a3TSFrBzbjW41SLz9mOqIXfvsryNvHYR0SsAScqzTkPEc9euv8ywL07DkUkGI3NiDqDapnh
	vKyBid8zguI9+jUxX0dmENlimcR/xNaPNl0S8OynbdVFyFcF7ctysXLpmIvhBse1439z1OmyW7z
	Z9MbC0v3YIs9caAbfOQpgQxsKo48=
X-Received: by 2002:a05:6a20:939e:b0:243:78a:82a7 with SMTP id adf61e73a8af0-25345579b43mr7587410637.47.1757296956469;
        Sun, 07 Sep 2025 19:02:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpz91qpajdyoSqIcc47npMEE1FkO9LwTqg9ZWKouQV8RyNp0nC1V+LGbeoE3r4URiIgPkNgw==
X-Received: by 2002:a05:6a20:939e:b0:243:78a:82a7 with SMTP id adf61e73a8af0-25345579b43mr7587375637.47.1757296955935;
        Sun, 07 Sep 2025 19:02:35 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723f4858e6sm24285076b3a.4.2025.09.07.19.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 19:02:35 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 10:01:54 +0800
Subject: [PATCH v6 2/9] coresight: core: add a new API to retrieve the
 helper device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-enable-byte-cntr-for-tmc-v6-2-1db9e621441a@oss.qualcomm.com>
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
In-Reply-To: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757296940; l=2649;
 i=jie.gan@oss.qualcomm.com; s=20240927; h=from:subject:message-id;
 bh=QFpFMOUZf/2SBDLxhrsEj1Eto2xysYNZ7RxKlu5EyYo=;
 b=bi+tUi3A8/0GEEoeIWtWZ7na0uNDvTr9BROFOck5sTnvMXnTbiYnJxMCb3pPyOarEUn1dR8Kj
 rl4N7CvjIGgDyH59hczXqMiQtklb4wJquhOR2XH0lTt3flB7xAbZl2K
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=OZh7JyRifqJh4xmrcGgmwa8/LCS8O11Q+mtx4aZGmi4=
X-Proofpoint-ORIG-GUID: rBWlI3BcfG0q2BcjITYF4pYQYgvT1S7a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNyBTYWx0ZWRfX/OAE3LdRtV+0
 qJaNFcUn2YdwjRzU2w8CMOTD2aplB5sdKEjiPd7mBTN73WrQTgNWsoMQPVFJIiYTEbga9R5wMXF
 pdl1qSmX3hBvmptbQGbBqWmsdzl5MZJe+6MTlw8K6iZKn+C/XkRC4Gjn2vTyWzSZfiPJDStiqSo
 iz2amJ5Ud52ZdjJzAg2wqW+WsZdWF8y3jxZNODfr1rmwlGtY6dhbzpXAEi0W44ODoX15R7TwHFC
 M3oxlHNy/P1ZjgtCrSEQpWaTJ72M0ICVq8l1Uab2zdMvM37qxp5ha2nBE4mPwp6vKSkGUcq2w7b
 3c9rjIDTh04NeaqHV4pDciH/BpDy5G4zOgEbCxckQncG+tT3m7KUptJyAT4WFHuIbi7XbvREK3+
 a71Zd43/
X-Authority-Analysis: v=2.4 cv=cYXSrmDM c=1 sm=1 tr=0 ts=68be393e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=WErVAGsNQcrMbPXGsVkA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: rBWlI3BcfG0q2BcjITYF4pYQYgvT1S7a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_190238_965977_947894AE 
X-CRM114-Status: GOOD (  19.21  )
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

Retrieving the helper device of the specific coresight device based on
its helper_subtype because a single coresight device may has multiple types
of the helper devices.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 35 ++++++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-priv.h |  2 ++
 2 files changed, 37 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 042c4fa39e55..018b1119c48a 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -580,6 +580,41 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_helper: find the helper device of the assigned csdev.
+ *
+ * @csdev: The csdev the helper device is conntected to.
+ * @type:  helper_subtype of the expected helper device.
+ *
+ * Retrieve the helper device for the specific csdev based on its
+ * helper_subtype.
+ *
+ * Return: the helper's csdev upon success or NULL for fail.
+ */
+struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
+					      int type)
+{
+	int i;
+	struct coresight_device *helper;
+
+	/* protect the connections */
+	mutex_lock(&coresight_mutex);
+	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
+		helper = csdev->pdata->out_conns[i]->dest_dev;
+		if (!helper || !coresight_is_helper(helper))
+			continue;
+
+		if (helper->subtype.helper_subtype == type) {
+			mutex_unlock(&coresight_mutex);
+			return helper;
+		}
+	}
+	mutex_unlock(&coresight_mutex);
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_helper);
+
 /**
  * coresight_get_in_port_dest: get the in-port number of the dest device
  * that is connected to the src device.
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index e51b22b8ebde..f80122827934 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -158,6 +158,8 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
 int coresight_get_in_port_dest(struct coresight_device *src,
 			       struct coresight_device *dest);
+struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
+					      int type);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1


