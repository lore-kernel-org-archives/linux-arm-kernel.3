Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E34C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 18:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/6R5LUyWsUdJmgkPC8R28H+x4JiDbGyxUBi1wvYWmg=; b=GYP1my6fVH22tEcZtv8jqadPKc
	kDAmxcwqrD0//OSaeu5aapY2COpeMV0kmksGe5K8bj3BULz7mh5tQ5dNO0dbyxmYsSY7N8JYQKuRl
	OtwRLztZKedIo/ezo1JxKUqFTDQ0tGFKiIV9xwME3rWx8QgpJyRAv5QHmqBYAJfgptExhVU11h1KV
	2ZalFkeoGgIg+YVghLTtdUBJdcYwGC2O/O6tfgdC+ud/s3A3xyL+sSYfGxhy24u6DmZ3gpWTkO5DK
	N24VFjytNp8m7pAG6UxNYLF02RnqAV5U+qysngtg29VRZJQJNnlaKJAbQYCFSRNSfDhefF+4qxopm
	y0f/MFhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1pOM-0000000FY61-2WkX;
	Wed, 02 Sep 2026 18:08:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1pOK-0000000FY4f-3zkE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 18:08:58 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqwLD1586171
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 18:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8/6R5LUyWsU
	dJmgkPC8R28H+x4JiDbGyxUBi1wvYWmg=; b=llUct4c580shIcDg73MLmvRVJL3
	rYZ5pZ9DZzYgOKGXpvVH51WqQKdKZGK0PGjK9aV8Hr1J3M2iqjaQLjf2LDMvlBPL
	hGv4+zlqEgaLeoNRQZNR7JIwSs9oQY5MuTyqhkp/X4yGCaDWUxWBssoBt9vrMFl2
	oqayeEXnypFPbNivWamumxlt7OdkxXSXtATWmzYewVhTVTXHt+A25SKtlpDQbpcf
	Ym7HOMI6Hyyef9p04dBmlKhMLPacd8l6gHKILQZWe4yWuE9Mai44qxXUUg1A4UYG
	7YqV04PHb9ztuflJhayzP1qtYP19J4Lyx9oGNlqz4sapzGCUBxi2DPgp+Gw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemb01c7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 18:08:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ef13b61bcso326978285a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 11:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788372535; x=1788977335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/6R5LUyWsUdJmgkPC8R28H+x4JiDbGyxUBi1wvYWmg=;
        b=bzBE9mPGODEJ/SrmZs/yZC0PxYc+35G2nm0RsRCemjypyIobM48wo3x7IJMIJLRi8M
         nfkqJ1kP0DSD9KbYc3gHNpJYWTstsrWoebKlhhpl/KjJNONvGDbO/OKxwk8Y6E760pnS
         ZzgMpA/rec/Uee1IvEWJC2rlss34J/LLkQ/SmhqVrW8VZnAj6M9sBYGkOmUKSJ1WnsCy
         fJSC83VMjIyM6kJHu59tkWQR96o/2dfI3xycDN1K2IW+rw8ofbm/kpKkrHmJp8vJsXEX
         pSx/DFxf7a3kCVD1xag4ZkXsUXPwti3rPv+EEm0IvLuj+YWsGc0QchwPfS5FusU9svlx
         rcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788372535; x=1788977335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8/6R5LUyWsUdJmgkPC8R28H+x4JiDbGyxUBi1wvYWmg=;
        b=htBAWd3uxWb286RS1rftZqsslm66WKvkx8WvXh8zgQARw61W9Es10KL2Iz6P4lLszw
         qfPFpEVR+OTfWRVmKA04cVzmMGQS/9Ov44LmcW+F45Mj9VSv0eBPGWxaS67YH6kYOGRB
         XY0xrXvF/c5pb7zavL1F1/Ia/sxg9ZXHDqy6L2dCeRQtziSKfD9D8MhuX9FpZXq/XGQV
         gfBfijUIz6AscTW9UAnvabqoMj56wf4Yn55L28L+0KrVBmk1TRy7zcHTmoX4kC8fF9/d
         zJzfGh4PoRMoJd+c9tQo53n5Y9JJA8GQmOI1GvYQjhz+XLrP6VpkrM+28l/QLAi/31Uo
         2KdA==
X-Forwarded-Encrypted: i=1; AKwUvBwuNLz36l2SXe2u/s6fg2h1P66l+lxr4n12+pFBdzptD/rOkmEVZqkYn2uqQZwyfEjKcdEBGUtc0zzxNX2mLTWj@lists.infradead.org
X-Gm-Message-State: AFuF++l9o5uEhj70uWwqJOukYtKtv5vPfHzWk1SVn+vL3bRpvkamxMW/
	aHgbCVidox+4JLxUPbpvsm/wwbJAVFOmCAh/RPErf1Isq1ck8GryZnFTCUzgqjGH5kmFzMb+qKN
	5fLYTCUqN6nFzjCeyiG+MpA0pqnvtN8rktHY3TCwQsdqeoYIdFvzZFtkK/jzw0x0fQzXAhlSnYw
	JlhA==
X-Gm-Gg: AYBFou2bsjukq2VPezDSMHhC6+OfRbOEEY7tzxAVBJOSPVaTXnhq6n+ZawFk9wH6Wsj
	F4O5VPK9YyWkF5bmAhXBVj00r7KzQ08aRnVR/mARHm0ZmIYOby2FQ6KgYzDGqHGvxke/El26wLP
	vffzxgmAywNOuTP5ElVh3YHpgQENpDUKjWGXircTMJX0DalXmYhtotyYIn6s16ygDkONb6GZNDS
	XKZd8/LGgEtI9NQN2/Qa4Y4k1msp1piCM2c1Bsra1/27VUiholvnaEGQ12obOOQ6NnlRqeXR+7d
	QQUjesFbz8/IPYwER2qLFTkateyffaRFg+MxXswSdv5if+2KBd5qCca58poHYhblO0bpJc1iWcc
	V1YfZFoPqeSRjy8IdLP+AHoEcVwt8KiN8+z3Eyr2R47btncWTMiaNJ+R6jGgrLulraW+ZFhmu8p
	8I7Z318ZZrDqBGofc=
X-Received: by 2002:a05:620a:711b:b0:937:27fb:96f8 with SMTP id af79cd13be357-93960fe4a2bmr717700785a.41.1788372534421;
        Wed, 02 Sep 2026 11:08:54 -0700 (PDT)
X-Received: by 2002:a05:620a:711b:b0:937:27fb:96f8 with SMTP id af79cd13be357-93960fe4a2bmr717694085a.41.1788372533835;
        Wed, 02 Sep 2026 11:08:53 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895d68sm1444041a12.4.2026.09.02.11.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:08:52 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/3] firmware: arm_scmi: Fix scmi_protocol_table_register() error handling
Date: Wed,  2 Sep 2026 20:08:43 +0200
Message-ID: <20260902180844.41230-3-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902180844.41230-1-johannes.goede@oss.qualcomm.com>
References: <20260902180844.41230-1-johannes.goede@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: z0_-TT7j0rECiV1SM42oiZ5dIb7e9FDY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE2MCBTYWx0ZWRfXzGLKpZuANL+i
 shrEOVQPB1L2xXtguYVTqsoprxXMBdFLqLnNBfr1TCGD7SYlXsI9oD+VCUPcjJPJ383SsglFgr/
 kj+gj/n1nocsB70ZSEqacaPBCKkjtGzIappZyknRpCvOXbuAirohrV1V/1rNPy263Nu/n2W5Q7f
 vwydbG1BR8jLsfyjvr5ss1zcZQTsn4W+ZR/4j3Wlc2P1IgsjAPw6JCXtJKDdO3+oBq1x/CS0Gia
 s2V5HDlQf6dAcCScUwiH6MukgXANT2ix8WHNqP6N/PgpJS0QlYiaC7SKUlKQepADLR2KyJzMuHK
 9rz7jdxqvynYTNOaLcljpA4fWzcQYIJJQPG7DFuEUza1YTNo0NHwduMAPS+TM5ipltuIyferC2Q
 ulcfuqo4jpTwrxgOpQ9mN2E9gBOshBvNbTYSOkH1LpYqpqqu+100TSA5bkYN/+ro/555CZaVGO3
 X0/PaBrUHCyaKf5zs0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE2MCBTYWx0ZWRfX/wP/MGF1InKM
 19/oxmSERoohtAg0R65piMFxPg8Es7MWDAq+9qupKF2wDivWaCNHzWePRLfS6Bwa2NAuK0WRDuN
 7wkhafJ9wApgl5MUoC4ElLpGtZJuQrU=
X-Authority-Analysis: v=2.4 cv=EuPiaycA c=1 sm=1 tr=0 ts=6a986638 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=mtY6ubt43vOedHXxatAA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: z0_-TT7j0rECiV1SM42oiZ5dIb7e9FDY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_110857_002664_D439C3C1 
X-CRM114-Status: GOOD (  20.26  )
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

scmi_protocol_table_register() stops at the first failure to request
one of the scmi_device_id-s into scmi_requested_devices, but it leaves any
previously successfully requested device-ids in place.

Unrequest any successfully requested device-ids on error to fix this.

The code manually unrequests these rather then calling
scmi_protocol_table_unregister() because one way this can fail is because
of duplicate device-ids and in that case the original device-id must not
be unrequested.

This also moves scmi_protocol_table_register() to below
scmi_protocol_device_unrequest() since it now calls that local function.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v5:
- New patch in v5 of this series
---
 drivers/firmware/arm_scmi/bus.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index d12d5de15a1a..6f667e4ffeed 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -137,17 +137,6 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 	return ret;
 }
 
-static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
-{
-	int ret = 0;
-	const struct scmi_device_id *entry;
-
-	for (entry = id_table; entry->name[0] && ret == 0; entry++)
-		ret = scmi_protocol_device_request(entry);
-
-	return ret;
-}
-
 /**
  * scmi_protocol_device_unrequest  - Helper to unrequest a device
  *
@@ -193,6 +182,25 @@ static void scmi_protocol_device_unrequest(const struct scmi_device_id *id_table
 	mutex_unlock(&scmi_requested_devices_mtx);
 }
 
+static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
+{
+	int i, ret;
+
+	for (i = 0; id_table[i].name[0]; i++) {
+		ret = scmi_protocol_device_request(&id_table[i]);
+		if (ret)
+			goto error;
+	}
+
+	return 0;
+
+error:
+	while (--i >= 0)
+		scmi_protocol_device_unrequest(&id_table[i]);
+
+	return ret;
+}
+
 static void
 scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 {
-- 
2.55.0


