Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8A8CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 08:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MIqti19n1VONATeE4Q2IHcwhA7oL1fLAIS7StBspRDo=; b=2w1p435QDTFHjY7kNRaUiAk3+4
	jY3+mgS657Y/UjTcJuPItgx4C3D/B6UXyzxLm3h+3+aEwTyr6pd181XAznW2xYRJjlvQkPA0fxtVF
	hkHlwkQ4c+PZMD1PCvX2+Aa4bwHK7PDbLhect4bTzMQR75JNNFjSyH1q8j26PmJZ+KjWvmVdOBIjq
	dilkBsVAP3/j8JEYGhZ2yqSnoeRDEcywHnjo/afNMwuxFqiuHWNhJ1SUgcYI9rkG5DRFBKLDq0uA/
	VxfVjiJLRjo09R8WjKyViKSTbHW7q2R0A9B3VapoDzryfQrDVoaqwfvvzqq1LToEOOzrWznQoOYoi
	V2XMmX4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMM7z-0000000Cm0o-3vhv;
	Mon, 11 May 2026 08:36:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMM7w-0000000Clzh-3l8S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 08:36:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B8PdgR1257392
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 08:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MIqti19n1VONATeE4Q2IHc
	whA7oL1fLAIS7StBspRDo=; b=P+zY65AUwRzuir1LeqXmkR9aX/9AkhFqqe96rn
	U2Qocj8JkTmWQF2uWSiyHA5X6fUatDZ9ekMKk/+sT1NfoNuooMUA3v/D5OAsuZ2w
	CCNy44Go2EV965190kRuSR9KLdHddDcwPH85ieSdnoumPIGPPt4jd2OaafyIh/iQ
	9PwOku08z1WEzUjzz4spZ4nrI7iWQ0TaU3obN5cbdZjLxJcarCrLv1JfbKytv7Ep
	/XiysujhsuZSEA+bSqGbhKen1dAufgCCGMP313FHIYB4iw4F3mK5jYW5OV2QUpn3
	il0Qoh8mYQ74EC6F/msBrz4flnh01C78kTCrrUNpOM+FyYkA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e2dkskcxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 08:36:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2babbeff9e4so47658705ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 01:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778488595; x=1779093395; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MIqti19n1VONATeE4Q2IHcwhA7oL1fLAIS7StBspRDo=;
        b=YnOaV7//sTzFcoDXYrILW+bD62mrjr2/KvzA+FE+inV0lnizVogHNRaKBQjZTq0OVh
         Cz+42f+1H0HMBIZH/AKBjpdEKi9uHYiiKUQyILJe3e2s8AbSXYmbW4/c+19on6RVYIB4
         tmg78A6YB6UC3dSOKkW0+oTD/Gxt4JwIo6E7jLPQ8BKi0HdwpOMJ8NZHIKgPwKNkmIj/
         W+j8HdXZWzG2ubH+p372vxO6jZkaxlhhxrtgAZ7s+KAqBOXvTaYxgp8lyU9LjUX8IrJG
         55g47vdfIoMsJ0EWg/ceWM8HS5phVQedwq8RfdGpJY0vn4R1hDrbwKlw5rZfrLjS87dG
         gMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778488595; x=1779093395;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIqti19n1VONATeE4Q2IHcwhA7oL1fLAIS7StBspRDo=;
        b=hvHiv+c8YcArRq3ikVPgatrwrFLEo2LRSzj/Djh3Pr6KgcSVim3XdlrasUFxF7kmcB
         417lXhjytOilm2ddEe5u0Bryby7ZyzaSUUI+t0mBbiDxkz49Dvlz01lhJ8b43yj4/l/W
         Xyu4TqMXai/K0mocvDYApZy3KvWS7XUqRUeufZ4leMFKoBhXgrOe50XPKUSDYyI5kbEt
         4CybuOi3/d1RZEJUX6PrRdOtzFDVUgYU4391TKuLwSTpDum+CrN80fyG7sgzMqM5hEw1
         wCTO9am5n2A941F7WM97SrPLFH1WA6HZkDOeIZlJZNnTmexdLTtHBEy84BIhvMTNPzSg
         tr5A==
X-Forwarded-Encrypted: i=1; AFNElJ8aV9+hsYumB3ELHMaoZXwvQ/aiaZBvNbjfWTk6XKn4Q9KetqYowHdix4Gr9JnF0llM00DqBZd62weof0inLTRp@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc8QlGB3QxFzHR7rzDKiaJWqss7tf7iVnwdk5jXZKClu1E20yM
	ITrTdQdwhmA4J2W+UibeeSuCXWLWQJyilnp5qaUK9tygDqdV5YA0cgIZhEU8AC7dsWXL/UVBYZd
	G5jkVfBJxlHUGxGatx1ulmS4mCvQOFncgvDPNv/wDQBw5He2bT5klCrQ+fCunEAvQR0scjK1NqF
	VlXQ==
X-Gm-Gg: Acq92OHXJ9PAfgGgre2h1njpLWjKDBvCQ4QneBxTm9ZsE5WKC0gucBvJabiphoECnOl
	GfGUTcjaWysrEZN84TCga2NP0xSGP2glqt1CfK+gwnO4VMTjcD7k+Mwmde+CNKdpQRxE0sDriJu
	cq29vYZ9Y9j1oyuzqi5f0e3OjgkzHCjrsFV/nt1pN/CVqGFGyz0YgAW1VRCJ+qeyp1ru2TNC5Rk
	hqr+0mxuMp1GEXGl+FOt5yFyA+HXVmFZ81iGZpAhKase9u6S+0bGaXyniulOp5gBqSu5Bdy2t3O
	oox2eHrJyCkYHaz8pcXc9me2IiDvr9dKRDu507HzK5qaivhXfslaVBFMfQiX9/MmD/c6maRfRAX
	XXUzIQYdbPPE1IqDtlpAdckJS4lcwxhUrL++XsEBtTYRvBp3fQsLX53inzjXuzuKUMK/zg2+hkg
	nVdvXm1kbC
X-Received: by 2002:a17:903:986:b0:2ba:7617:a755 with SMTP id d9443c01a7336-2babd607529mr153306275ad.25.1778488595441;
        Mon, 11 May 2026 01:36:35 -0700 (PDT)
X-Received: by 2002:a17:903:986:b0:2ba:7617:a755 with SMTP id d9443c01a7336-2babd607529mr153306015ad.25.1778488594866;
        Mon, 11 May 2026 01:36:34 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e90854sm95222635ad.66.2026.05.11.01.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:36:34 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 11 May 2026 16:36:18 +0800
Subject: [PATCH v3] coresight: fix missing error code when trace ID is
 invalid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-fix-trace-id-error-v3-1-ac4c8356efff@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAKVAWoC/33NSw6DIBAG4KsY1sUAitGueo+mC2CgklSxgyVtj
 HcvuurCdDPJP49vFhItehvJuVgI2uSjD2MO1akgplfj3VIPORPBRMMka6nzbzqjMtuAWsSAFLQ
 DqKF1AjjJhxPavLWj11vOvY9zwM/+I/Gt+5dLnHIqHedK1rJx4C4hxvL5Ug8ThqHMhWxqEr9Sd
 yiJLJmOMW200pXtDqR1Xb9HbZgrBQEAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778488591; l=4232;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=1qREOORBec6aKxoD0kZVon7OO74wBl3+y+vsp9bVJpg=;
 b=T033yAKGzJhosO2jG7wqWH7I7jDC+p3wEDh89i/KFyYCEJF7I1DKf3UfdIds4O8PsGoIR5rAj
 YKuroOSgrF3ANvDbigJpCgnrr8xlZQ4g1TqpiO45UXgtLmVG44U/8gh
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA5NCBTYWx0ZWRfXz4kW8acqNIGz
 J8sYakh1nIK5zKENRB8NUUxdsURXxYZgu0GOjlLTXTqzBHJBZUQ/NTFoGwY2Y100VK3Cd8RFgS2
 pLHZD84dw0PGlglfGfDeQHY6qLGzrLhQZC6f+94HwoVWO7ADqUvumX5vq3NzpU/SoIRJ4kQsTez
 HAJQwxXs+E5FYOpZ4Sx4pNKEdFyGxmggavtTS/8kNd7VK0rovAxEoBhboiAU43ZQSBg/edVLsZV
 Zo2qX0k5VmUnboBT6Vo7Ojbvs84lHlhyZQKpVJdAThoZKLzFm7Vv8G9F7XkFeJgJlhj/Zu2hd3S
 rAiSp12eyXPvVDauqvGYrt7z4raqBuN1EkD018RI3vgrPkzfshYAOrxE5Lb15z6QPPxx1khI3u8
 AyYA/x6vw0e+Vetiwyc/NvkNYVm1ZOABQUEeS/slARqs43vXn/FNX37dnTK4id/XwMBXWs5wASy
 hUtCeZF8MBe42+76hCw==
X-Proofpoint-ORIG-GUID: uumUkKU0JSGfEsTsS168IvF28wyAc3SX
X-Proofpoint-GUID: uumUkKU0JSGfEsTsS168IvF28wyAc3SX
X-Authority-Analysis: v=2.4 cv=cKjQdFeN c=1 sm=1 tr=0 ts=6a019514 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=A6yeH-j-nhIuWHlR0BAA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_013636_943675_50E04F49 
X-CRM114-Status: GOOD (  20.70  )
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
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v3:
- directly return the value for clear expression.
- Link to v2: https://lore.kernel.org/r/20260509-fix-trace-id-error-v2-1-c900bcbab3e9@oss.qualcomm.com

Changes in v2:
- Refactor the coresight_path_assign_trace_id function.
- Link to v1: https://lore.kernel.org/r/20260508-fix-trace-id-error-v1-1-5f11a5456fdf@oss.qualcomm.com
---
 drivers/hwtracing/coresight/coresight-core.c  | 14 ++++++++++----
 drivers/hwtracing/coresight/coresight-priv.h  |  2 +-
 drivers/hwtracing/coresight/coresight-sysfs.c |  4 ++--
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 46f247f73cf6..254db91a8ac9 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -739,8 +739,8 @@ static int coresight_get_trace_id(struct coresight_device *csdev,
  * Call this after creating the path and before enabling it. This leaves
  * the trace ID set on the path, or it remains 0 if it couldn't be assigned.
  */
-void coresight_path_assign_trace_id(struct coresight_path *path,
-				    enum cs_mode mode)
+int coresight_path_assign_trace_id(struct coresight_path *path,
+				   enum cs_mode mode)
 {
 	struct coresight_device *sink = coresight_get_sink(path);
 	struct coresight_node *nd;
@@ -755,10 +755,16 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
 		 * Non 0 is either success or fail.
 		 */
 		if (trace_id != 0) {
-			path->trace_id = trace_id;
-			return;
+			if (IS_VALID_CS_TRACE_ID(trace_id)) {
+				path->trace_id = trace_id;
+				return 0;
+			}
+
+			return -EINVAL;
 		}
 	}
+
+	return -EINVAL;
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


