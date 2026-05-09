Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D632CCD3445
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 00:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HMc33G9s2MewPCe+opjc6bs9WwJMQweRb7Iko6/i9vU=; b=Q95dJz/Jg3J1khs1lLx7cwaJrk
	G0rRO8vgzoxpQH4mTfGraIb6S02s+9Cp1Wemg5LAWl+Mmck2AEmdUWhBhP+UlVZCGiH9b0rv9lPJx
	5s8jyVtw96novnsjzKH+wqaPV7Hb6AgJb8ouFkLNGSafO+d6HzViP3N0dHu2uOG5XWoCPd4892P7m
	fD9SU48WDrtIk47r34Wl9fYJ3mLV7J9rf9i2A052zYnk5FF/q7d+VwP0rE+HSXfKPQ9Xb9OUnI4Qm
	89aw3wBF2eJKmX6vp14aUqXat4RC56kc1+kwCEVRq/h/Jm8lJTY8u8TcN5Fjp280JBw//oAXINwoL
	tv1FzHXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLW2C-00000007s1k-03Mr;
	Sat, 09 May 2026 00:59:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLW28-00000007s10-2ZVy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 00:59:10 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648M6CMR258107
	for <linux-arm-kernel@lists.infradead.org>; Sat, 9 May 2026 00:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HMc33G9s2MewPCe+opjc6b
	s9WwJMQweRb7Iko6/i9vU=; b=GNAQHDZqMxL0PlMpGfNtr4k4XHLSyo1Ydnsqqg
	N8y7odrO0/tB3aEu0fR/TrkVxRp9FYakCT9Tfvf3T3duBh25tQ6OTZvichvUtv8R
	hRtzbhUfyuAqUDJlwd17cBmpTL7xSjbnxf+3TVjbpG8pO3CZ/htQ9Jd8ur/gHCGo
	gbWcTSV/eZ22gMS0G6ALgAVI+CihMhUv+Zst9HvctRt6maINzWGTV6+2NHFQeHsV
	kOPlgZMUkFobFyihLDaV27njNmV+GpFwyoVuG/DjDhbzK4hEtHv/bsQR7qKsECj+
	F/o9SDDufnAGd3sQ/iR/uJSUXgZriXW/dbSG1vAqQKy2mRNQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1auekkxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 00:59:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b99eb06178so53452425ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 17:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778288345; x=1778893145; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HMc33G9s2MewPCe+opjc6bs9WwJMQweRb7Iko6/i9vU=;
        b=OXd2jWL9Q6BjG6ln8wGmCZLRkUClyNaO05WXTTgMny6R2n3GNqPUdO9mIfuEhVJR+d
         MuhIltDY7JwqOTdPG02l50LdSqOhtApy+6TlrhfgRslWZ0Ol0M/vAYllLOGiNthP+Xuy
         TGK8oHG7BmHK6c+L1VxJiv4+6SYIKI1QXXE8jVAPyy4rVRkpg1IQRbGVfjHRMjNbixyz
         icCtVRCr6oAqHTqoN/SBknzp70pQzINMuBIytu/TRarG513UA7auXQt0tXb1VWkX4mLe
         TR0QhR6xJ0IPNYj2xXFKQrofUtpCRX6u3D9+POa2e+v8PidcN0v8UP0UA6r5RKMX/9/w
         fBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778288345; x=1778893145;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMc33G9s2MewPCe+opjc6bs9WwJMQweRb7Iko6/i9vU=;
        b=kBNqvE8gJkHopxyZl84zafYGS77KtPSS0JSOkFnovMi8At5f2FMg5qRDOLEtwTPE3A
         X6WkBn47QYwYheohAXb3IDkQZqxPMs5/F6LKD849FgCUPXMgaxYNYIae+tIq7Z8jc01h
         XHgu2bxciGnPvKo2Vn42zROB/n75u0gzTswYviEkcXatDb5kyCnpMD5xzDgTxpiI/PRY
         mVCTp5nywCj+seid6vbz66KNRNgeK8lvZD/W/MZIHcuCu0xxNS/aU/5fZsYE7URftuBy
         0bs8yxKAyPJfUfFDY0zj7takYgMeL99GFeRIL0j4YKF0SPP98g/tnhnMLYVx9WKUgOMK
         eWLQ==
X-Forwarded-Encrypted: i=1; AFNElJ9p9S6bYziQpj5c4kwuYvPyTgOikbgXhClBigBsGAVM1I7j9FClgSH3golJPAfRfPWG+pFEm6th+2Q3H25V0ZXH@lists.infradead.org
X-Gm-Message-State: AOJu0YwVGNZrPRoM/SX0YicqZzP7szHh4yBCeQNtRA0/bB0+Sang8KYd
	mKgB5vtPKB5UAwq1ZL+ZAXGCvtuJZKTBOHGcCXY5Mb9ELtKJCgRT6QE+WFygEBPVH9hzRuwZQ06
	zaONgfiLwPpqj98uXtdpa/+BlmTfYej9rGmVwNWPqGesnNtN4NJNF7kNuMkVN+SnkvY+Ee3kQAI
	4VIA==
X-Gm-Gg: Acq92OFqJ3ORUqEoFFkLTWKxIXqO7uxBulUN7RzmnWzpeWZQDp5NACk0+mxncxzfJdn
	EoQqq2WVxvWje3I+Q9bdgw9Uzp/VkVsySOYwynLOUJm74VFUC6gNbQb2AxwpB3m8j1f5S6vfxl9
	ZWFP99Qt/vUbgdqAA7dHd9A6pwqHx9xzjhG+eIJcKd60nTUrMEluHO/2Rw8OqhsHCTan9TnsVo7
	UARofZl4wOPFiGWQReNCltPz2JjNL18gbE4PfvR3lwiWgEOcgxNqIrbri5WILaXcFIqoSEPCj8x
	XPTcEyw+BOkxj7VEbI9+MUIEUzT8VXsN4FnjDLDF+mdjKeUGfy7Uypoj9gYBnp6qcSmBdFWfJZk
	KilhmSHyUjsYJSLyoOCzbMqoiFJTbNuT1LaNLb9kad3xu5iqs5rIj5BImnTkSKEZYPthGdjnaBk
	2Z1LuVnQDUYRYMAn2pXr0=
X-Received: by 2002:a17:903:1cd:b0:2ba:36f4:5844 with SMTP id d9443c01a7336-2ba78f63de4mr154108425ad.7.1778288345266;
        Fri, 08 May 2026 17:59:05 -0700 (PDT)
X-Received: by 2002:a17:903:1cd:b0:2ba:36f4:5844 with SMTP id d9443c01a7336-2ba78f63de4mr154108155ad.7.1778288344757;
        Fri, 08 May 2026 17:59:04 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1c5466bsm35490215ad.0.2026.05.08.17.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 17:59:04 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Sat, 09 May 2026 08:58:46 +0800
Subject: [PATCH v2] coresight: fix missing error code when trace ID is
 invalid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-fix-trace-id-error-v2-1-c900bcbab3e9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMaG/mkC/32NQQ7CIBBFr9LM2mmAlKZx5T1MF8iAJbFFh0o0D
 XeX9gBuJnnz/7zZIDkOLsG52YBdDinEpYI6NWAns9wdBqoMSqheaDGgDx9c2dg9QMccGenmiTo
 avCIJ9fDJrrYO6XWsPIW0Rv4eP7Lct391WaJE7aU0utO9J3+JKbWvt3nYOM9tHTCWUn7PAUCou
 wAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778288341; l=4159;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=94Llc3h4HowpH/cDqgQnvt6Iq5ZLOHjXJzJwNWicjqI=;
 b=+NDtmE2sLVSHFHh/xjQJqTHZ2bHTFkooEPd4XUO5N7EXkVOmv837lLZj0wU1bKE/kdF9H8112
 wwqfje3SqeqC+uC2PcwS0lu95ydQSEczdejK0A/n01Jr2EQXnLULcfe
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDAwNyBTYWx0ZWRfX6zYLOicmmMKU
 xus9qcl2DR1cGSYFHRZsoQz2kGj56+53kyfLIO64q9TURtygzV92GoDQchnwHXufFue0n+VFuhB
 i760VmEXYKxHsHCVeKiUwgg+H9iXaM6+FMXVaN74WaAeNUo6c9GOph1tvm8KGtzNviQM47PH16t
 mtEe7cfafrKD+iayS84Ek4os9yn2IBBl9DAly8wUh2OWo6dABv0RZricEpKSejJQkJzsUV7c8u1
 NA7RKwS1PdhOU6CZWAHcKR5/aXOFJmYdWUCQNIOxBjF5g1BLJ1iADvGcKmAN8YgNwFCEQMpydVa
 xqqlRAjazI2fCmzTieTz/LLRpQ9K2o/WaaM4ArHJYY30g5hGIt/MIA67uCgF6P6Y8xl8/WHvvIt
 zszA+YfiQNvYtSjeu+MEgxYBi5iurj8DtZanj8mICLmvT8JGxqUH6DyN36O/vF9K5yPfwhNNo0z
 FrUxrwrMtjw5Uab1UHQ==
X-Proofpoint-GUID: u-ugTl_Bed3gm_aXynQWZOELn2pmGPh9
X-Proofpoint-ORIG-GUID: u-ugTl_Bed3gm_aXynQWZOELn2pmGPh9
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fe86da cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=A6yeH-j-nhIuWHlR0BAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_175908_795691_807F60AE 
X-CRM114-Status: GOOD (  22.40  )
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

When coresight_path_assign_trace_id() cannot assign a valid trace ID,
coresight_enable_sysfs() takes the err_path goto with ret still 0,
returning success to the caller despite no trace session being started.

Fix this by changing coresight_path_assign_trace_id() to return int.
Move the IS_VALID_CS_TRACE_ID() check inside the function so it returns
-EINVAL on failure and 0 on success. Update coresight_enable_sysfs() to
check the return value directly instead of inspecting path->trace_id
after the call.

The other caller in coresight-etm-perf.c discards the return value and
continues to check path->trace_id via IS_VALID_CS_TRACE_ID() directly.
This is unaffected: on failure path->trace_id is no longer written, so
it remains 0, which IS_VALID_CS_TRACE_ID() rejects the same as before.

Fixes: d87d76d823d1 ("Coresight: Allocate trace ID after building the path")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
- Refactor the coresight_path_assign_trace_id function.
- Link to v1: https://lore.kernel.org/r/20260508-fix-trace-id-error-v1-1-5f11a5456fdf@oss.qualcomm.com
---
 drivers/hwtracing/coresight/coresight-core.c  | 14 ++++++++++----
 drivers/hwtracing/coresight/coresight-priv.h  |  2 +-
 drivers/hwtracing/coresight/coresight-sysfs.c |  4 ++--
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 46f247f73cf6..cabdc0c72f38 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -739,12 +739,12 @@ static int coresight_get_trace_id(struct coresight_device *csdev,
  * Call this after creating the path and before enabling it. This leaves
  * the trace ID set on the path, or it remains 0 if it couldn't be assigned.
  */
-void coresight_path_assign_trace_id(struct coresight_path *path,
+int coresight_path_assign_trace_id(struct coresight_path *path,
 				    enum cs_mode mode)
 {
 	struct coresight_device *sink = coresight_get_sink(path);
 	struct coresight_node *nd;
-	int trace_id;
+	int trace_id, ret = -EINVAL;
 
 	list_for_each_entry(nd, &path->path_list, link) {
 		/* Assign a trace ID to the path for the first device that wants to do it */
@@ -755,10 +755,16 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
 		 * Non 0 is either success or fail.
 		 */
 		if (trace_id != 0) {
-			path->trace_id = trace_id;
-			return;
+			if (IS_VALID_CS_TRACE_ID(trace_id)) {
+				path->trace_id = trace_id;
+				ret = 0;
+			}
+
+			return ret;
 		}
 	}
+
+	return ret;
 }
 
 /**
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 1ea882dffd70..34c7e792adbd 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -153,7 +153,7 @@ int coresight_make_links(struct coresight_device *orig,
 void coresight_remove_links(struct coresight_device *orig,
 			    struct coresight_connection *conn);
 u32 coresight_get_sink_id(struct coresight_device *csdev);
-void coresight_path_assign_trace_id(struct coresight_path *path,
+int coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index d2a6ed8bcc74..b6a870399e83 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -211,8 +211,8 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 		goto out;
 	}
 
-	coresight_path_assign_trace_id(path, CS_MODE_SYSFS);
-	if (!IS_VALID_CS_TRACE_ID(path->trace_id))
+	ret = coresight_path_assign_trace_id(path, CS_MODE_SYSFS);
+	if (ret)
 		goto err_path;
 
 	ret = coresight_enable_path(path, CS_MODE_SYSFS);

---
base-commit: 17c7841d09ee7d33557fd075562d9289b6018c90
change-id: 20260508-fix-trace-id-error-dbfdd4d8f2d1

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


