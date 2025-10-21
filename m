Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F278CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 07:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+RgsM21u4Yb9qsC3dMkzO2W/Hn8w58jn3yO6Xy5aEpE=; b=uvd/yTtL5hyXEsxs9STLzgRMT0
	1not911lSH/Pdjbi06pl3mAXqgcCSUYC4yE32Q5SlXVC0lCYEgcvD72UvzDKimqIqYzGXsa1W3pqm
	LvNUxe0Xo5XwW22YYsgS27YqfFgFVmMoGVEA26yZnGw0izrpcKdVCxOTsWraS9Ea8x69eovrei6ai
	bkRbxAcKv1dECKXzHagV5ECGx0UWOW3itYdnl0vEziOcTm2Pyoy3s+mlP7hCh6CS5m6U+/Nr/GEhz
	6cbh0oB97YJcjPmGwJ8DqVFDtnWe0ZylU7wt8hL4aSnFolsjm6V+Cd4xQAXju4G6vnxFAk5bp5gW0
	xh7CMGYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB6um-0000000G60Q-3hJS;
	Tue, 21 Oct 2025 07:36:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB6uj-0000000G5zE-3ipq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 07:36:15 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KL0rms031065
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 07:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+RgsM21u4Yb9qsC3dMkzO2
	W/Hn8w58jn3yO6Xy5aEpE=; b=NBRo6Aml5Pjfk2fnMZiFUz4KUX9Sb3M+WuMP9w
	kQ0FRRpmx14akRn8SNN56nit8NToP4Tv+Z7TKootuJ2f2ABt1GdtYYDBl9rIEtWx
	2hyrlITycch2jWJw8iM6x76QQ0xFb55FKTD0GgS4Y8gUZ2+UJe0ByPAGscQf39Lg
	T3kXckH8IHSTaGfEzJPex+eg2W8YiwDr+2yMNQix/3XBiNiwrGSsIDXg+IL7fDEu
	xtt9I1n6xgCQIpFfLwc04zgOHc6GNZdDcLTTlYp8CrHE6+XimH0Zxu71j3bP9cgg
	X3RX1JIdIWFG7qSVFt0S0qwdJGCGr8TRt4ETc+b7BLxz1qXw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42k7eyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 07:36:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2909a67aed4so46080465ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 00:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761032172; x=1761636972;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+RgsM21u4Yb9qsC3dMkzO2W/Hn8w58jn3yO6Xy5aEpE=;
        b=HoHtoKG/xRZM1BjwSKnm+7hHxUJCqVDIwDvfZ2g+R3y54hxKqKWiyvTaordHJse4s7
         sJdxUHKCdSSwcFdvSO6/ug1lryMdRbXvjKCMbktSLDwxAXbS4kxivn4P8kpuE0jWZhrc
         vK7oI1Yuq7I+feg0v3o1ctqivovKFWVrADAW1yN/2s67ROihCLp4WSdOK8DPYzWsGz6Y
         Ug5xx+IRBQ0bYwsvf/ZkHCfm0MthDcNYqVPAyles9NwlAbfPzKhB+9H9ismCeTlJRLHC
         rbyxNotr2pUoYMv5YIrK4YeYxeBJTwQcPq1N4ETwMFU8rW6sIYeW3TqF8XDjchUghUAQ
         7b9g==
X-Forwarded-Encrypted: i=1; AJvYcCWKYhHqdG0Qr8KEmbzEFRSNnbWfiHG6A01RRfbvdY4DbGpCqJUcwd7LjnPr6Lfo7CrP9P8WgXImycSxcHWtsFi3@lists.infradead.org
X-Gm-Message-State: AOJu0YynxzdGhNgO8cdJVGdVDBTq+WEZ+Nhb68sPni0Ga8tc504W9l1E
	2hKeVBIDvsacklZKz+0cLDVYHgIVi46q7ed7Unpjp6UrKbDgr6pdg9ANYN3aquN3JHLJyPLNzER
	htykMMRQwElqK4/Vy9KT87qvVKnpZ2OKpK1rByJh8XIOaAUJrP4rgbhvL25AYVNvulKD01AaQQi
	ApsA==
X-Gm-Gg: ASbGnctoURmji7Fm0p1O2iwskoSDw4uC9Jq8pdVeq8FWDnOP84LdMzKeDufATesrgp5
	SwweTBM5xOo02y0Mws/mix7x2jAVae43xL4WbCwr6KDz8Gb8Xdte+p5Dbt2QDPWEq3vTS2YqRPt
	PVxkU1Wr1hg4syUqxEXzBD0ksQuMczFfT7/JdeWdBIYqVL6DlGan3QIOItcI4gPQx4/7aIS/0qI
	WkB2hQ4Echrnkb0uB6FmGxYIW8TK1fpqdjgx1X1Qbx5Wx74l6nmvk14UaZ0KypnS98PVzGfgleM
	wxb5SeRK1bBMl+OdfQXX2WEaSDLUMUyr6N0NR+Kt17672sz83c143kDDf8AP60fhwMi/zFI1Mze
	np/WOOFbuz1TFggNyPrmGp/aG0pA6gT2SBCfX6EoBnWgV7M5gTVbFNus6NvHPNRRXYTESMPjC
X-Received: by 2002:a17:902:f687:b0:283:f19a:bffe with SMTP id d9443c01a7336-290c67e9f75mr194051495ad.7.1761032172348;
        Tue, 21 Oct 2025 00:36:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8Jd3Fwhj+0wgMIpqBH9gZpoDWshHJV452Fhw9BKS/fFPQoNGM3uAe2MakD4MiwPTdvVpr5A==
X-Received: by 2002:a17:902:f687:b0:283:f19a:bffe with SMTP id d9443c01a7336-290c67e9f75mr194051275ad.7.1761032171919;
        Tue, 21 Oct 2025 00:36:11 -0700 (PDT)
Received: from xiaozhua-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471feb99sm101000285ad.87.2025.10.21.00.36.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Oct 2025 00:36:11 -0700 (PDT)
From: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 15:35:48 +0800
Subject: [PATCH v2] coresight: ETR: Fix ETR buffer use-after-free issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-fix_etr_issue-v2-1-80c40c9cac8c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANQ392gC/3WMwQ6CMBBEf4Xs2ZJtI1Y8+R+GECirbCIUu0A0p
 P9u5e5lkjeZeRsIBSaBS7ZBoJWF/ZjAHDJwfTM+SHGXGAyaQqNBded3TXOoWWQhhcZZPHWtO5c
 lpM8UKA12361K3LPMPnx2/ap/7T/TqpVWJZqmLbS12B6vXiR/Lc3T+WHIU0AVY/wCO1FPUbEAA
 AA=
X-Change-ID: 20251020-fix_etr_issue-02c706dbc899
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761032168; l=1803;
 i=xiaoqi.zhuang@oss.qualcomm.com; s=20251020; h=from:subject:message-id;
 bh=vsKxbQW8zM4ci47zcvHfnvo686SJJwJBywX94n5Zr94=;
 b=tuXOXoZoKs5M/Tf7VVaAmQja/s+Lt+rCK6BhRdp2KfH843mUZ+mtol/D9/0deHAw6sCBdZLfh
 WHmWEsPdYctB5mRTCCoOIOkNe4Kh7qVtJ/uMviKm+0sYysQ0VaZSbrZ
X-Developer-Key: i=xiaoqi.zhuang@oss.qualcomm.com; a=ed25519;
 pk=zuq+lkjngHYEDk6qmD41kiqDaQuURxgU/sjQuARnCrs=
X-Proofpoint-GUID: -zzEyzoNTfqpesbmjHi3GUS5J50y-Hel
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX59reydsXEoMA
 llQYjtTdyEMJzGwJUlZmJ6OUa8/2IrTS5CuK6XDUj7Dm7OjRRt8aoy6rubqcXgeRYHB3VVIdM24
 g62LdCxRw4CleL/KxHG9MoueqtXlHQDt0A9I8KCsXMCEx517fq6UIYKlD2fhyVIjZH8ltrO6IAX
 icF4W2kC4/vVA09Enqxy6wn1edSq4jLmf+EpHNoXoxL9vWvAsagAJIx/54MHW0vG4vMm0TaA6Br
 8fzi4JRpCGUIST4HaJ4eBb9Co4Lgc96n3dFHjb6Alx6rj5azkYqvr8Ggctpy/HpSfWm1R+nU0Az
 04nAGxO/dg7VyqCYM5mWMbe2pog8cNaGa9ET8O9RK7zDnJ6/JN6VLTf4WmSqtfPiioQGi5Sy9bQ
 0W/C004TRpXsZeuZRG0kE8oykaOR/g==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f737ed cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oKJ9ntOD2-YCvPZDK-EA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: -zzEyzoNTfqpesbmjHi3GUS5J50y-Hel
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_003613_952873_BF583BD1 
X-CRM114-Status: GOOD (  17.92  )
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

When ETR is enabled as CS_MODE_SYSFS, if the buffer size is changed
and enabled again, currently sysfs_buf will point to the newly
allocated memory(buf_new) and free the old memory(buf_old). But the
etr_buf that is being used by the ETR remains pointed to buf_old, not
updated to buf_new. In this case, it will result in a memory
use-after-free issue.

Fix this by checking ETR's mode before updating and releasing buf_old,
if the mode is CS_MODE_SYSFS, then skip updating and releasing it.

Signed-off-by: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
---
Changes in v2:
- Exit earlier to avoid allocating memory unnecessarily.
- Link to v1: https://lore.kernel.org/r/20251020-fix_etr_issue-v1-1-902ab51770b4@oss.qualcomm.com
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b07fcdb3fe1a..800be06598c1 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1250,6 +1250,13 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 	 * with the lock released.
 	 */
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+
+	/*
+	 * If the ETR is already enabled, continue with the existing buffer.
+	 */
+	if (coresight_get_mode(csdev) == CS_MODE_SYSFS)
+		goto out;
+
 	sysfs_buf = READ_ONCE(drvdata->sysfs_buf);
 	if (!sysfs_buf || (sysfs_buf->size != drvdata->size)) {
 		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);

---
base-commit: 98ac9cc4b4452ed7e714eddc8c90ac4ae5da1a09
change-id: 20251020-fix_etr_issue-02c706dbc899

Best regards,
-- 
Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>


