Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25CCC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 06:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AXLNn+wjGkgSdDfX67QxF5l/RNz39oJDxLQvREZpRME=; b=ObgD/rzOV3geIDvS9Xd+vI7Ps9
	VhfpyN5fxWJEBbch+m7kq+l+M1NGqXUUhqGT7AoPMQkvw8t/phyJhn7s6MHR7ILY2lI7Q3i/ddEMX
	vm9lC23VKVUPATVJQupSt3mYV2gdlXxFhCJbvyYIkBm2/3y/ftRn+E8tJ7FRvyRVqHSIGbPUYsTL2
	YOlWY5DoAA/eZ2gh/h8AC0UNwi1g/626S7cf7ZvAusE7zdosKMClYwW2+TdJ7Y7zA4dxmuhjubLVz
	NdZKHW8l4kjn6GKrFlzsU0f1lr0Wroia6SSoSrUWMubijEus8ycXjNlIp7lSBLVH581wT4j+4+tgx
	RjxYry3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubD4b-00000001P4l-20mn;
	Mon, 14 Jul 2025 06:54:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCin-00000001M6R-1yAZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 06:31:30 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DNNVjY024162
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 06:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AXLNn+wjGkg
	SdDfX67QxF5l/RNz39oJDxLQvREZpRME=; b=HfS+iyOEMqpMEBJv0AV3xStaduT
	YXA1i+SJdLVUuV14+/JitLchm+N2q9ujnayRhe77pye5mmQ/FvvMomfTGKCUyyQU
	5A+jBSG0EDpwpDVWLunZ1iv5UPsZzIYY+t+Z1+9HyTEV+Q+t11sekxG7s/IyhL/H
	dxCUA7tLA49Lgd15cvf80ifat5mhYnQgph2wAuWFtBIaUq3JIQ3ITcHzkfa1jCAx
	q7xevMOvM8O3NCJk093NwAuTMeF7IMwrR+ULKXTyPrcv28k+vR1WAWtwnmdp1K9C
	uhspC7et9g7/uviuUvkBZfcD47tCBxE4a8THkjEWhQ9TlEAbYw9O03qLuIQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufvbbf84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 06:31:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-237e6963f70so62460325ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 23:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752474687; x=1753079487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXLNn+wjGkgSdDfX67QxF5l/RNz39oJDxLQvREZpRME=;
        b=jtvSJacoVofUCBDKpG93lVmh3gmTs6J5xNnecc7TCZmjp2BYxDHciabRHNoiLTC4K3
         9e2D4EhbAdBtzI/HTRH7Xp20AdRPzEHNiO4Vt+R4fFS/8CRKodSylRj0AOnVVMUrbBYx
         zjnZNT72OJFNqZWypDpcyRrhOwsFp21vNlMFsTxjxAOvWXz2Lpn7Ekl9kn89ccG85VkK
         bGN/ZWEjzOKMRStgwP0FWLGfLJkCqgUGaczEgctKpXqEpuy0oKjXMiD1sZroueFnNX4P
         7wxdusvsaahVqj0wmz441eioIWiWcOwPbfUxRpOp1lQfi/BQdW0yeZgcat7hwfJLADpW
         sEfg==
X-Forwarded-Encrypted: i=1; AJvYcCV0gJQjSmxlboQo0CwhF10WLajWLjKwYK/bGmJdVPmhlbI9/n32WddKhP2qXd/6EFx4bdjq4N9euir4NE81ke0j@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs+irXtV+yk9xK1Gk6UI4xkHWxo06mNXveKKDasFL8iz5Nxhby
	0LvFQni5WR4Yh1/p+hACjZApw2vC7CpMZsDQNVnNKsJmVEnWe7AoTZaZSeoQudq91pQXkf09oEk
	h4802hQXU+pOZy9oDVISgBtzZyS2WZROHFLKFhGJxkMg1XggW+kJUjlm8F1hYnJrMlGaVKh+9ey
	y97g==
X-Gm-Gg: ASbGncvlMjSCoBH+aSVpOn+4YNFfQwIqA7Ba9+IumDA6OTBMSXJLrRYCcv2JuOSXGmm
	XXCyTPUIN61BcN/FBUS5Yd6grUj0Ljh41A+f04+JbeNzdxrDHx7SiuF3RqC8NjNvtWmTu4LM1fG
	AW6rJsAi8ngfQ88fYMjqv0PO5XktP1R+2nSycVGkpyJvTKRmJCNJc/tA2e53rPDeMpOJX1lqspd
	F1CV1u8PItVO/16I1EZJQKsiCe/CJT/RFsv2FdZQgZI+Sqdi2EyatTNraFkn0Caz0eXTWj+c2Dt
	H8sRTh2hX5sJrXHVcxFV2no08w4LCROHcM6XfXxdXFliSJ9p5eI6H65AVubrsH8ilvyhK11BuTa
	N9fwxVgq7VuyYGwV0X+be
X-Received: by 2002:a17:902:f990:b0:234:c8f6:1b17 with SMTP id d9443c01a7336-23dede8c3femr140606885ad.38.1752474687316;
        Sun, 13 Jul 2025 23:31:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhuRWB8qDraxlgUCSzGpQ7hJwWY5emhcB3nOzVNA1nN8Z3RmdDgtgMiAQImDA3RGWg7WXXIw==
X-Received: by 2002:a17:902:f990:b0:234:c8f6:1b17 with SMTP id d9443c01a7336-23dede8c3femr140606595ad.38.1752474686921;
        Sun, 13 Jul 2025 23:31:26 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4334005sm86138255ad.158.2025.07.13.23.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 23:31:26 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 RESEND 02/10] coresight: core: add a new API to retrieve the helper device
Date: Mon, 14 Jul 2025 14:31:01 +0800
Message-Id: <20250714063109.591-3-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAzNyBTYWx0ZWRfX497VXqNW19cO
 q7oG+1WFhEIQSnG1kZcisN3z6gUVbQy0IVsmbvz3sMAwKABdtOUiDz9UwhS/ubHKiIOOMyKZ9JN
 6pShD+9PifeFrva2/XGc/j4fJ9V3PWLyajWnxgw1m98US93Os9G8iZLZ5zrtPve6Dsup1Ns+HZ+
 E2MDEoCJJbG1odxHhmf3JA35bsLSzswB/H+Sj7MTx4EZuF8Jp4rEGPVSBeCIVAlkoRRWS3JaBjN
 7DR/LwIIgV+GtnUA7z+H8TD25gT8UGRpWgLcPOXCzvp5/OK2Jsv5SxNKmnrgA7KbIUWbPInlAL6
 V+hdK2P8Jlj+GZbGINbCKIORPSBBVSiVh1b7/0uJcYejQ5JWqBvVXfE0/ugOJYrcQi2qOSQo5aR
 +4nQDDOzUdrZ8ltq1HkZRDv8lfIvtMbJkN8ckxMR7S+j6bK6YJ5XbW4lemmderFlFq6L+rhH
X-Proofpoint-GUID: MJy7xxMruuXUK-Weuf00S-gJovKYX-Cw
X-Authority-Analysis: v=2.4 cv=RPSzH5i+ c=1 sm=1 tr=0 ts=6874a440 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Bv2r1u00ER1ubdDhqu4A:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: MJy7xxMruuXUK-Weuf00S-gJovKYX-Cw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_233129_643549_412B43E0 
X-CRM114-Status: GOOD (  18.88  )
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
 drivers/hwtracing/coresight/coresight-core.c | 30 ++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-priv.h |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 5297a5ff7921..76e10c36a8a1 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -580,6 +580,36 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
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
+	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
+		helper = csdev->pdata->out_conns[i]->dest_dev;
+		if (!helper || !coresight_is_helper(helper))
+			continue;
+
+		if (helper->subtype.helper_subtype == type)
+			return helper;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_helper);
+
 /**
  * coresight_get_port_helper: get the in-port number of the helper device
  * that is connected to the csdev.
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 07a5f03de81d..5b912eb60401 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -158,6 +158,8 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
 int coresight_get_port_helper(struct coresight_device *csdev,
 			      struct coresight_device *helper);
+struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
+					      int type);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);
-- 
2.34.1


