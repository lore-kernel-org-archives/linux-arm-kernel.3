Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C41D3E797
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 06:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H37x9ua3ePA/7qaC/cjVE28usIUyXzLi30yOiv+YEFA=; b=o7CYKuPZ3banQGgr/H0SObeFuY
	ScZxu1x39hWIyaWiOAMOpynVbyI+ZRjTsG3EPL5CHEb0acSTyhlwmvhPrqWzG91KlqJgRmEtcw2ln
	10Q/h4eVOJ25HsH1D2CjEhH6t5IVz/29yanhxU8ZMLjdyzD7GVn+ytBXjncyZecm7a2pSqqqFwBgt
	YT2eELRGeEPPsqnqADjTgjKw8oHt4u8RBvMWOUUCdBv+WMGGnpJ1MSfZ5wubLl8xisvSFZnRM6Y22
	zzKodMsd2+UHjx6hOOtwd07XcF6ApJGz/Mxfn1+QMzLRllT073JpbkWPLmTNAjQ4lBsbhSPiG1+yq
	y5Q1cNsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTZtw-0000000GGXE-2Hyb;
	Thu, 11 Dec 2025 06:11:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTZtu-0000000GGWV-0cyp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 06:11:43 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALPbHY3193811
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H37x9ua3ePA/7qaC/cjVE28usIUyXzLi30yOiv+YEFA=; b=BAHuHfztQk7DX8Vo
	+WTpDE6Q5vy1zofvvcra0c/15iJijCSGpOsJAmNeOs97IBaY1wMg8ZtgnVoObgtV
	wHaucBwFBmKI5O3ew3+Xj0exx6gqziM5zCsUtLWFUncqb4soIG7tzxOSY8nCy5w8
	Mrfu1k7Rh/bjr1r3Y3d3bGSPPFzv3kRwxFNeMSEMOQ84hIfZBLZIgwHUewb1RBcU
	kHdCutVvIkuJoj4pR5oxp5XC3eP1sRHYHK3owEsSPlIID1YIWy57QaUslWBQel/d
	zC9WcpZn38WrCH5peH4sz87HlgbYH9dAWOholV6BhgBeIKImPQpe+quHb6fNj4Bs
	dhwyHw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygrx17y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:11:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297f48e81b8so9297075ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 22:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765433501; x=1766038301; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H37x9ua3ePA/7qaC/cjVE28usIUyXzLi30yOiv+YEFA=;
        b=McyLzvKvVap/Aj21z5htMmSuFg3qNhF92gXaL2fDE+rRYUzBwmoze7NiXHoWe1Udli
         KfLBVkydikDOtvAyYPeyxYlrr174kGQmsCJXfaapKSu2M2F/KosJ0+wADFXlWDQfCpCP
         Xyyh9dyodXk4Clf2aN5HyvvUQQRC22eIWkMkMyCr9d7qGR3qofdLZbChwg6kx8QfClPY
         JHK2FPDlQMytH6Vzv3t/lEEEXgSHPHkqUtTPxcfvEZShxTkhpCkafoAwiHm/B6UD4qhM
         ldmYTuMp2RxKfN0msVqApFwzEf2ge3Z3Ungt6ghhpCWEObRUe7zqB6DPKhBOVpTISEy1
         xOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765433501; x=1766038301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H37x9ua3ePA/7qaC/cjVE28usIUyXzLi30yOiv+YEFA=;
        b=ODEO+4OAj6scS4i2zOVLFDHRVzqOy4582f+r71iaGA9Zjcs+QXsYBgODis3Zjro6LH
         V7BbgvbPNOYAnC8wGzvM7nESmm1CXgycwNobH39AzlkmHBhzMUOYK9iZeGhELk5vmdoJ
         iHUt0tRSNm6nFOVG73Jjq6rDCeCOVekUDn2XqstcD2cnDLYJD8mhCsX2zzSmU7YasRzf
         8is/gMhzt11u9FTCL75RmEzOnbMGxorXMNklmSKJtWahF2QFpNHF9y2yugLem5DSGk0x
         FQVkqnT0KnXSpDIq7p7b48jNae3rtW2jS+1DazFFBKkrN0LedAWr78hQxFZ0i+Zr+vr7
         COWg==
X-Forwarded-Encrypted: i=1; AJvYcCWmqTNXmu/OJsRz4GZzypKWF1DUlgwVnHlWN9k7pArMSp2N54rBmasDTMn0LjEhRauNcjU7h05C8OFVi8KBTv8g@lists.infradead.org
X-Gm-Message-State: AOJu0YxybYNfjLt5vWa3RJktrkDAkUmumwZY7Au6aAIqR5YmJ88nJye8
	L56uqhC9o/WIEy/FpH+gfL0oBoY1c+8Fhgofa61RwWiLHfi5ApFPQKQHKPn5nidkgzPp6Y3IOXr
	i5cCbeZxzci03BFPrjebyjML1lQOycZEk/sLboAg6/BG7ozob94RlXhVR3Q5aPXa7ZrH/VYnefG
	Y+TA==
X-Gm-Gg: AY/fxX4XlX7ntV8nMEHDjFoERPRRELNEYwUo6tjnCMN71yp4GO5SRMfXftOPXslBufP
	5pAsl7pdkqfOaxjUxzXNDRPkysVNbFfLkFQiePX37eHi+cIK/kYJhJA3OVMNdVOmhGmZmMMFNLX
	vHQALyIoADcV7hPEBARPRORE1yjQmnAner7CJN7ViVgIktEngGQe8TrXu9bVPQ2ocXNcEEKajis
	n0W07Uo/tdFoZbS/M91gpRtfHBqfcSWhNrg29RmwAkJJRxUvIZu2Th1sDd/xMtSOSlfHSAq+0qW
	AuzNxo/qceu9ozjNyZZkg2+9HhEpou0nHsBzGk0c4xE6ZEopEGuUjUCATqcllOtebzdCF3hB77R
	IHG1R0v610GIAacyG7Haob2UjHC2fe2+XYE4evjsRYBLSZElFK46JIG07h4XpwE7BYOO9hu5v
X-Received: by 2002:a17:903:1547:b0:299:dc97:a6c9 with SMTP id d9443c01a7336-29eeebfe83dmr12700395ad.20.1765433500948;
        Wed, 10 Dec 2025 22:11:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwYgKqzGeqU7toBB3FXsS20/zU0kWSROq2OAeA21VHW7Aj231W3vxDpdsEaA0jyBj4HPae/Q==
X-Received: by 2002:a17:903:1547:b0:299:dc97:a6c9 with SMTP id d9443c01a7336-29eeebfe83dmr12700075ad.20.1765433500442;
        Wed, 10 Dec 2025 22:11:40 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea065186sm11725945ad.89.2025.12.10.22.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 22:11:40 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 14:10:41 +0800
Subject: [PATCH v8 2/8] coresight: core: add a new API to retrieve the
 helper device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-enable-byte-cntr-for-ctcu-v8-2-3e12ff313191@oss.qualcomm.com>
References: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
In-Reply-To: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765433484; l=2705;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=V1yqLgVyRYM0PUluEeNsvfvMV9kESqLqhRAs3x4U+UY=;
 b=8bi2aJgwsd3U0FCI77yLrfMBwxWS5FP25X0Ek9isQ9rjD9FpLTnLlZ+eJ5y7aHJ2RNUNOBFFk
 6rOoVUCe+mICa+ydcW1naz7MEek9HQMlbNOYZ4gaZV32mTlwUl4sMTy
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=Hc0ZjyE8 c=1 sm=1 tr=0 ts=693a609d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=AzIya3-Hz0U1LB2V40wA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Jp_FMjVzMAaQmbw-j08d9CvoEGQ7T3KR
X-Proofpoint-ORIG-GUID: Jp_FMjVzMAaQmbw-j08d9CvoEGQ7T3KR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA0MiBTYWx0ZWRfX9LmjokHHzwWO
 QXYwcSGSKrS5VByfw89JUoUqiUC29FNgW+syHIf55q+EfzbeM3vvumOop2YCd+QfUDkKIC6UJM2
 M0Rp+FKcF20/VLP8j0m3csHHUoGFQtUKFwF1+P6CNZh/o7YKuBki2WkJa5BkaPyHwqA4MeXwqGI
 qTTH7eDRQINcLVkGfSnYWAhxqEvIr7RTHCPUCzm5kCJnEOtwGrIJn6BuZXr6YtjNBE9XekFRf8r
 6V6rOd+rWRQzb9Z/LW3SQcN6XW5Gq4JIlMZC0pNSBgmW7OCXu2tzOrZ+hxlhtEKJRH59wspfMsM
 hzvuV5QqMq2pm2mFNiqvd+VcYDT9rGX7MV1tq6571TVqI7TmUh2FI+Ix8wgvBtxsn3toZcHzuLq
 bH4kR5tRyYde+9yyjMM7w3GZD1kGvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_221142_199464_C3ED318A 
X-CRM114-Status: GOOD (  17.91  )
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
index 0e8448784c62..667883ccb4b7 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -585,6 +585,41 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
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
+					      enum coresight_dev_subtype_helper subtype)
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
+		if (helper->subtype.helper_subtype == subtype) {
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
  * coresight_get_in_port: Find the input port number at @csdev where a @remote
  * device is connected to.
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index cbf80b83e5ce..8e39a4dc7256 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -157,6 +157,8 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
 int coresight_get_in_port(struct coresight_device *csdev,
 			  struct coresight_device *remote);
+struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
+					      enum coresight_dev_subtype_helper subtype);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1


