Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DE3D3E797
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 06:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjPxjq1G/MyM9wZuLe71IZ2aZxQ93j8UibxFtFmopSw=; b=r0f4Y9y060zSLckjLRKo6yWtUq
	KZJoBl49ZI+FP+qm7FUX4TVHTnx73rFjd12e4YLGEnvAAKw/CYQYArwxG8Wua4cmP9Dk2fIHgmEf/
	pS2B8ZIg7CwF5KGmGzTZMGQ1wXz3I04e5RM8K9PKZPtu3YhKbH4rPovvFz5/TsYkmrjqgK+PHIY7t
	WobbWNAEloVJsG9TzlFcaRgqQ9gQQXxde56CCxQsWdBvNgQJGBi/SI1cZlbYuKWjEYd9j1lrKAQSk
	0Xr/gdSZHdLluC9z+sZXrRTXgP6C8W/OeDz6SaZgwHLfQBIGA6T1ErI5dHqQeCeiF84EKBXZSUXqa
	ymYnkV5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTZtr-0000000GGVA-0zCj;
	Thu, 11 Dec 2025 06:11:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTZtp-0000000GGUM-1jtd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 06:11:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALP9wh3544375
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TjPxjq1G/MyM9wZuLe71IZ2aZxQ93j8UibxFtFmopSw=; b=ElMS7GCH9V2NN20v
	UjfaBr6dwotk2cyymZgw6NjUcYo2cM8nlRKfmX/k3WNYZQuDmqedoB5d/WLmwxtv
	pMoOIvn4ULR6xU/DzBz+ntckwWzx5pAlPevjRMmFjvElWyeGs0Dfls33ExFOvRKo
	cLfed7IV4skiBnkbhpgglHc1kRcZyYLa4+Kix5fTqVqz0xHRTPTOsnfcDzo0czYZ
	g/QS81oHoND02CNnpZWznLN+d3YEI7Ji26Eweq20svagQg90vVbvco4l0peFphrg
	v7hyPJSEs3cF05gM9TmrhWgfkSn5UfzO2gNJNSMLyVDcBJT0Nur/vJnFyvmyuifS
	vKnBEA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay1xp4cbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:11:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b80de683efso1058934b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 22:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765433496; x=1766038296; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TjPxjq1G/MyM9wZuLe71IZ2aZxQ93j8UibxFtFmopSw=;
        b=CZvlth/Gc7uRO8pOY9dI0xXYoPgdYlMovXTNgDOa68f+NPEi/6Wh63l3TCr2vaCx2b
         8ceB/M6naEiIyaGcWbGBCdwkzWr0LCyHV75Eq0qaOiGguqKC6NDk9v3nEPDajEMaKat3
         PLCSubnD3I6nuy2ssJsnf6qpbS4G5QRan3eWnvYrlRsgduHC3xWLbmrVF/OppXA5yxSF
         qMx7C8khHjC+f5Ab7nZkYOVgF5dH6dtNa/HlHGpHVXBvjmGWMJePGV8XMITz3ZIxtqmR
         Ev0C3BMjkt5ptM3A3cRTc8cLD1AzoJBmGc0HbgHX2Ph751uGXkcX3Tjtn/vExlBioFuI
         SDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765433496; x=1766038296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TjPxjq1G/MyM9wZuLe71IZ2aZxQ93j8UibxFtFmopSw=;
        b=QUfZUI9voJoZQIKX6lubsiitEE5e6LKQSl5TWG3wLGFt06h4x3+YZ6Y3vdb24tKMvJ
         64FZSJt1oA3mLnDu6DLIG1zqBFnjpZIyjhpgEH27Z0TaEAxWpzvDMHzFEBIibcixOgHw
         9gd4Xi6l62vdYhfKIlzcOeAZjYkjh/ZO4VUmDjw6A8xM28prQ87e0QqOsPaCVC2FgDs2
         4PcqiYuea4bwfuI7iGmC156+gPrR/mfENUzcFY4djjLCUoIht4Tw3rfdwsbefkDLpAV+
         F9/Pxzg++CQl74ns1vmAKXG/CAz2s0FOWgx+p7PLQYROzzUsj7qj+LzffhalCNq5YYYz
         hCTw==
X-Forwarded-Encrypted: i=1; AJvYcCWnkbquezqloO66t03+AGXCfSir6dEuxIIo7qJQ+xbgFRUjNV6VwJmPmrXDUOXQ7HneHZjxYUGm7ngbHmhW5vEh@lists.infradead.org
X-Gm-Message-State: AOJu0YzQQea/P/gfP8cFldXNKyMDyNbUs51TVIXMXqh68QOtO4G4rcAB
	lWJEBX42ZNfxoHU7eYLQ/cGo+CcgMlfQYBNR/wPreZ4Cc2l6U0iLxXi0QPOHznC7CL1UlrpMTr/
	4aeFeGPXrZqnkbKyk0tSeg4oW3ob7UuaM6qrUPPss2AgqNvY80Rk5ZMHNDlv1HB1hI5IQPnRc6U
	4W/Q==
X-Gm-Gg: AY/fxX7zrxkzE9SlMidDHgcAyHbNdXU6ooDklAQNozfCLiVpEYhvggJH2n/n/OMdBSV
	SoT4o+WdL/Ksy/972xgNy0Nb8QDXXhRbLvwa45b3XGzu1cUtW/BexWHXCc70XfazpcyCNVMbncL
	dujbU5md87d2YgO+Gn+V9Vcay9DPqXfxyE4Aro8ZNcBO3Ybl1RPc//4l0Yjf8W7kjLaKuJa7gsM
	mfx48oOVepOr4qr++R+QNJ6UYQ4xQ4SkIjNw0NYrqxkGfa2ceV0u2tG+qQa17KvBNdY9PX5hjES
	x2wRUx1klH9DPI3aNiCAiFmCEbeDWqdFX5rxaUTAulRozuplIHQAd7tK73Q/uVHFEfdJkmzY8Q9
	eQp5zjoCvAXa9lWnobB5wV9Y9ueT5V/HrbZk4q2kx214TDUkpi7Wdw2MFeW79/rOZ80Bl/qmW
X-Received: by 2002:a05:6a20:2453:b0:35f:6e12:1862 with SMTP id adf61e73a8af0-366e0de828dmr5308164637.19.1765433496087;
        Wed, 10 Dec 2025 22:11:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRbnY2BMcR/og395k0ubhGGjQJkENmpxSKjCoZ3XqllWWOS9akD1cLgbfkWaMN6h6ZrKAbmA==
X-Received: by 2002:a05:6a20:2453:b0:35f:6e12:1862 with SMTP id adf61e73a8af0-366e0de828dmr5308138637.19.1765433495590;
        Wed, 10 Dec 2025 22:11:35 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea065186sm11725945ad.89.2025.12.10.22.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 22:11:35 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 14:10:40 +0800
Subject: [PATCH v8 1/8] coresight: core: Refactoring ctcu_get_active_port
 and make it generic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-enable-byte-cntr-for-ctcu-v8-1-3e12ff313191@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765433484; l=3769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=x79EOx0VHbHe/nWXls6UDtNS83yDuFtih92LzPbC2MY=;
 b=sagTWu5bEdNT35gpTyGdfKMRuJGqVH+fwNnNQgi3O6oNgG0bn+Zs93u6Acp8YFmnH/6Zcn2wW
 n77eva9bZwOCl4qhBVRZCRPUTa0lqxGR8cmgO3CQj+HsxQgciqmsfUj
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA0MiBTYWx0ZWRfX2NuZBeKWOgxW
 GbDt4yy7XsUGzMd8gYvAix62Y4pOhXFkmpqgqx17W7rQ5rzO/2paxklJV6mVk/EPgJLGVxUmJsd
 MiJ9rPU9j5Xdr/7CkaBa0X3vSWYOul3GsKKsOyd6rzoyBhRASVV1SYAf4BgdPhdeNGQWhWXa3ps
 26T1j8WOGa1Qm36FwAMmKxFRowBy48bljzRGwTp+5WoXR50JqZ5jBszMqDi5vsw83Cx682jiYeO
 6CAz1sIHg9+cgoXK7Or7ygDi1RV60CsK42cVMS+lsACk3pgaM7X2p4jnfa1lfoMS3AVPdWiCNsE
 gPsHRRZ9vxsF4Rjpcp6zcNOs4XXrdZmTZMgNEfTDlh9HhQi30AQ9tBkNfQeKPYtsAGVoKiBYvqk
 0WDAiCgIH8QlrT/USqcUuhJ2Fs+z1w==
X-Proofpoint-ORIG-GUID: 63bfjxNospdRGpGiDja7ZQLysUk4210D
X-Proofpoint-GUID: 63bfjxNospdRGpGiDja7ZQLysUk4210D
X-Authority-Analysis: v=2.4 cv=A/Zh/qWG c=1 sm=1 tr=0 ts=693a6098 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=qQZ2XtAyJf2dEkEvaVsA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_221137_467862_C4FF5B3C 
X-CRM114-Status: GOOD (  22.27  )
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

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c      | 24 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 19 +-----------------
 drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
 3 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index c660cf8adb1c..0e8448784c62 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -585,6 +585,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port: Find the input port number at @csdev where a @remote
+ * device is connected to.
+ *
+ * @csdev: csdev of the device.
+ * @remote: csdev of the remote device which is connected to @csdev.
+ *
+ * Return: port number upon success or -EINVAL for fail.
+ */
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote)
+{
+	struct coresight_platform_data *pdata = remote->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (pdata->in_conns[i]->src_dev == csdev)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_in_port);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index abed15eb72b4..78be783b3cb2 100644
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
+	port_num = coresight_get_in_port(sink, csdev);
 	if (port_num < 0)
 		return -EINVAL;
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index fd896ac07942..cbf80b83e5ce 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -155,6 +155,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1


