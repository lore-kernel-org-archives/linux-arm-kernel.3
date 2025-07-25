Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3B2C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 10:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwVty+8EPpT8rhXCALbF9loLMkW446LKfXLUZrsgr4I=; b=1ONgtkMvTBrQTjNlrr1XbgLrjO
	4qOpOa0ECQzzGBla/T9bW6GWfeMYSsTa4k4fHZiIZM0AaD2taIQWEW3GZQUPv6LGcsELAY9wkApU5
	sUe0BB5Xf4eayDIoptGzk2KQOGL+r67JuIl0xQ3hhHkqiMcPDIOZ4VoWtbk6tde2oSTmYTPo/1bkL
	p2HO6Wr9v3Sib+Ehic4DzYqYZyfA4qRkwWJRZ+1v7aJU9AeIqjheDCC7G9VeTNcVvMduA7vryZWT/
	86M6e9tbFyp7R8BRNVyeSB+k3/aFuQCtThrFSb2/cqO+/FdWmyiSf94cZZrZ36+RVkEA79WiZnJxW
	B1Ym59AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufFxd-00000009dEY-1bpu;
	Fri, 25 Jul 2025 10:47:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufFLk-00000009X9v-07LF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 10:08:25 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P98nCA024080
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 10:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iwVty+8EPpT
	8rhXCALbF9loLMkW446LKfXLUZrsgr4I=; b=CxEHMxWse1WCK9wBxDV9iQM7wTg
	VFNZogTvcgdq/U31WLQ3dyK2D4QIfI5f4hr+u7hewdXFstQgGieekWtU5b+GzGae
	Vu32wjNnI5jEjl2cj4oLoJd9n7gp7/Vtx0sTpvut3bR8seBrMtOM4WmLQoNizGBG
	zF6DZxUzkcqGhkEsM5Uys/xeVCTJUlfW78p6V/Q3DrKDwqVtSXo4jNH6vBdpHp3s
	mZylXggVW7z5Di3FT4Utg/09a1JnNMeXtl7gqnkTBA/pnuQvBJohzi8ZoQ5XeOM8
	yNuIOYbFVs9TH3j2ezsUMbR7WyT7WDSP7m8Sm+ONG8dwrarFvcgeXgS1ZZQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2r9p0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 10:08:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-313c3915345so3117060a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 03:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438102; x=1754042902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwVty+8EPpT8rhXCALbF9loLMkW446LKfXLUZrsgr4I=;
        b=OTO3T+0xqhM1qx/zSCTbBege22Z8KLwx9Uv1p0INHyynzLS9TrSeYW4DkvITMIyLRR
         /k1LiYY9sKEXS5FleELlXcBd88LqRiJK9UyuA5BOjZOdbnRe+W/vCflqESQB4NwiQAjm
         GQBlTMJKXtL8ZC+02KW/BT6ZoUJ4EpDQnFSB6H13+GWrDBfEFVe9YWhiAF9d57zLcn8+
         6uWO5mAjJ69NpBH5qTqxg2gCZpJovxHlIzGn8KhKRE5zM+kmhaUndFFIivpevz8Q9Qkk
         NUQvBB8VOz+RT4bPW7QG/t351ZOujTYBL9ce9eOL+cW12EceQVxSQKrAGUdQsjT5HAUi
         D7pg==
X-Forwarded-Encrypted: i=1; AJvYcCWw1sHQX8Z1Px5r6/X2aRCrRrhBWgQWwUKZsvNhSJNBDmAfqkeQtH+D7TVtJY7uwf1aYMeamPIz0krp08Zmk//u@lists.infradead.org
X-Gm-Message-State: AOJu0YydxlvfmFLmM5p4qL4Nr5ImMAskRF6KZbuw8VrN8hLSdvH9gOz2
	KH/6ffCtGXDL60DvtaNhsHOLDreFNmAitvG35jwVyW2Shc0XI+iXYitWnH34KZHdYg/5CUw4sM1
	3qpy583rqKAGiRxZ3gi68WQN9Ew3BViY1xWZN82BPzetjpH1TVyCwNm7iBLNzwdjcU8/2cBFMTJ
	B7mg==
X-Gm-Gg: ASbGncvz0OB7K3JHaPSCOcNfL16U2nqvIzfbztf7rPzUjoiudzYnrMPSzMmw7Bf7H8h
	+jM7RnFnBW9ygg9ySRnTnntatIQkJ+RLuAVFLYRVjutBSuXpRpGkxL4c2yCtOMdkAARmopoMHip
	8F7SvgniUcTPIbW5Ig/fVteBJk8BHwhK327frPSuN++BOtYnJy329+6TDOdkosTBfncNx0tpPD8
	kL6gnzicm/0N5HmgRSqbvTYobQPXc7HJSEtVxwyHMjGdVV0tmez87Hd39L2WTNPYpqB2gz0vh2b
	oM2P++dgmjQnEECd/v/1X0sijlrjkatj1YOEEr0hpWebFReT7tL0QfjqHdXFjaZxkecI4S8h+NR
	fpPu89f3/4nhIzVi6cdQ=
X-Received: by 2002:a17:903:4405:b0:23d:da20:1685 with SMTP id d9443c01a7336-23fb3065804mr23647065ad.4.1753438102556;
        Fri, 25 Jul 2025 03:08:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGAiBJTC/djKisNS0F0AMBhg//Vc5DrCNPe8BoJTA4OkfqBJrdGCh9t/rTtPqfvIB0yiXT9g==
X-Received: by 2002:a17:903:4405:b0:23d:da20:1685 with SMTP id d9443c01a7336-23fb3065804mr23646345ad.4.1753438101895;
        Fri, 25 Jul 2025 03:08:21 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48fd29dsm33641435ad.176.2025.07.25.03.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 03:08:21 -0700 (PDT)
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
Subject: [PATCH v4 02/10] coresight: core: add a new API to retrieve the helper device
Date: Fri, 25 Jul 2025 18:07:58 +0800
Message-Id: <20250725100806.1157-3-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NfTm13D4 c=1 sm=1 tr=0 ts=68835797 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ViBFXQGRTvhYuEXyb1sA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: tQGzwrL0zRjiEyKKdnc4bMYCO7-uc6Uh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA4NSBTYWx0ZWRfXy18zbX4LVdPW
 aX9IKmaKLI1aybNuRxGE9lFwVzcKw22arlxZsWF7b566+5cPdW1RvDfZSFcDRKik8o8mySKeS8o
 G3jR+5kDg+MgugYxCfWYjm8fDerf44OhV8zYqeT4sRxmOIJAImzdj+V08l7j+gD4ko/UjCbTILe
 76kEvSovX8wa4hKGsTGcKmoclgd7aCPpLcQKglaqNQV+tZBTuA7Im4qfYDLHbt5K1IydmJoXTr0
 o8CeQhXBp1DpswcaoxfrSLl5dlljDVePh+YzQyXsKzx5sgomwL0e00EH5TRgGwbDs7FKwYXXn8a
 IA2jUs+5ameCRy+Kty79mrY6fVNDNwX/wA24xjO/caQ4EPrIuaaC6xpIBPVgW2992fjrEeEz9wP
 RIgWqKXFa3pyRjAdWgGnvNp8Mcf82QUtrP+G+3+pLbmC3vswjgyMd4xkmYfCF4jyJxo1p2Za
X-Proofpoint-GUID: tQGzwrL0zRjiEyKKdnc4bMYCO7-uc6Uh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_030824_079784_3194B52B 
X-CRM114-Status: GOOD (  19.07  )
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

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 35 ++++++++++++++++++++
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


