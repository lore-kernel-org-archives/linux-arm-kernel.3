Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76ADECA101F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 02:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOGihsR+2JZnyd1bIX/cqtdxz8sWBUYderONs+SBjZg=; b=ERf1jLCEwVGMmuAqQLrX6I+FM8
	qm/cGiKEwLh490qqd935H6C5rKF9Y6pNR4miSpV7T6/Io532W/JOWUEmvaBWWoV196ce+VzLkTYft
	s5HgnjJ7sapUS6Z07UjG5bdgG/IBKlUux8Iloi80OcN1A5PA9EnVwdva2h60CU07FUAKnzgUEF07n
	t/QZ+3O30vgaBT3JG6A2pFLrCiFWtLZ5OBopnTyKAEta6xwKNh5mZhg7ziIuZQzLNzfB9n8AwcIQ7
	vR/PxIqEDKpekLb6SSjJRjoqtZZcyzMKgn++lHM0JXldVX2RpJ2tVM478kxzLnuYdIvWDV9hhIVE7
	Qbn6JE/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvRIs-0000000DwY9-1F8L;
	Mon, 08 Sep 2025 02:08:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvRDG-0000000DuhK-0Pa8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 02:02:35 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5880TsU8004353
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Sep 2025 02:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fOGihsR+2JZnyd1bIX/cqtdxz8sWBUYderONs+SBjZg=; b=HsBIkjfba6BrFK9M
	f5PrcVXbEMYws3OZNAZ87xm3/12htmJF0CGZRkMWVLzvL7nzYxIpjOh/PQr6WnDQ
	QsMbsb135aTucZQs0E/+MxyaH2n12aksuZOOBlFv3SPRvGMusLOK39MLgUpcQ3Sz
	e5T386OWYWh1Yl70qr9lTXkcSOUaejPaFcpG9RS13wljN35uLA4IpZUUBLk8f23l
	Y3IU396HfTLLlAqKeUstybDF4jZcgV3/xQmm5opt2TmqX8YLPex3g2mTvS3T8zvv
	0xF9y3z3+6iqq3prb/Ne0yhlek2RR4b1iqePOjYXF2276a5OKRELxSK3Uwnwau8W
	W9M5tw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4ktu5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 02:02:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24cc4458e89so86362535ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 19:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757296952; x=1757901752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOGihsR+2JZnyd1bIX/cqtdxz8sWBUYderONs+SBjZg=;
        b=AUlE+DuoglM4dySZ77LmHNkHCtGCo+mtCD82LYsY9KhfYzmt2qNH+kscVBHWByh5PE
         hExTf33TJoEHFMhlXgOEXN0CHfPWDOL7n7oq+8PZ58J2NkOyccfn73+eIsZN8IxY4Kdc
         koLz3bBMnyEGd1bpC2ujfN38pR5icU1/y8OC86dKO7j4ovZlT5AgnjQWgZsH6tcgTL2k
         ph+8VppXJEFNSW0N7R/wUqR2JaYXnR2hoPlagabx3+Cd1H6QRkboFAD7pwuYaIYMm5Dv
         BeZxUXW0ZIegbHTdPH4lHfk9W5eKbodIE1qtiVdolBMf9azISqpKEQxz+9lTo8MqUZK/
         mHuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIlRrXrqZ98qqEq7YRMQkZVVuQu6wUFO5XDXd+sPhInvS4t7bhNoiGnczd0LzwywsXkLpT9vxMSYt3LPpXYEFt@lists.infradead.org
X-Gm-Message-State: AOJu0YxsinUri7KD4BcrF8Wu5Lci/v5RLfRq2lILtZKrHKf4jMba/XxD
	rCSvpbjck2qjKrj+qpCQVDAY9+/p0DiYAnzzqdrFlF/MhDJDXDKXMVuUveIFayldO+TijDXUum4
	PiL3rjrHPJukVUaYAfD5lWgfCt5TZs+vm0B+eDVmAk6OBBW44zuFFyyAHXKAgDd/3HvKPD1g+3t
	X4vdP+5Lp+iUFD
X-Gm-Gg: ASbGncsnSXdlDubX8JugA86ok1t7g3su4inoWjyj/I2Qt4eGygbhthIiO3/5MBAutul
	Fb3Y40G9fhvwv+hCvvQvw3x/fBHEdb7a/CWY/NLZtdKzRWDrws93Kcy4YJWcwvEDJ/y+wOPvRwn
	USoCyOe/YokqQsgVZpK6HcaDCM+q6ecX81dSBmQs+/FKurgOix7UuruOLQdpKrkX+/PkWV88JbV
	6IDjRKxTy+cew+WnocFQwYp1a+xmWFOwoU3TiBiv5qa1VZlyBLdD4SLNfIghiIusGFH9ybw/Bmu
	EcX9uM1YfYTWPavPnRaWIf/VOeX3n+oFiPTkDha+9BCEEGhGU/+ag/A506JaUaXOz7Xk+WHDEEy
	I70Kzu1iVI30wgaM7RYHUAj5/BDo=
X-Received: by 2002:a17:902:f549:b0:24e:e5c9:ecfd with SMTP id d9443c01a7336-251728629c4mr80558955ad.42.1757296952422;
        Sun, 07 Sep 2025 19:02:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEPMBDMwU4ZeTYAGNAbVmG2Eswoq+QPv2lxOCPjVREgO/b1eKZg4RlBnYo9ANXpCxNn+uZ6Q==
X-Received: by 2002:a17:902:f549:b0:24e:e5c9:ecfd with SMTP id d9443c01a7336-251728629c4mr80557685ad.42.1757296951163;
        Sun, 07 Sep 2025 19:02:31 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723f4858e6sm24285076b3a.4.2025.09.07.19.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 19:02:30 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 10:01:53 +0800
Subject: [PATCH v6 1/9] coresight: core: Refactoring ctcu_get_active_port
 and make it generic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-enable-byte-cntr-for-tmc-v6-1-1db9e621441a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757296940; l=3773;
 i=jie.gan@oss.qualcomm.com; s=20240927; h=from:subject:message-id;
 bh=qzd5gVviJkuX4BcigfW/YZdkjwAG5WVRtPg9BE+cAXU=;
 b=D0xPJj+TDYxZODNsXVWs49Rwgvy06gQZ21co8dTaDv+o6EHqbig8HL8glyKgk99jan8igO+zi
 8TViphBaah7BKBeEaTX3CM8ekMKd1bM/McOqMljiaqCMiW5jrdeW3PM
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=OZh7JyRifqJh4xmrcGgmwa8/LCS8O11Q+mtx4aZGmi4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX3hdK8lvEMKH2
 UnUhsGeX9ti3D4QIf/lI3suNqWLNdzfgNpCjgHFC4SN/3ecFtz4aYgiP3vO/ocwRUoXAcr9hgqq
 1wLJcN7G8Bk0dK70gamOl2t9CT4noEsx2TpsxEN/PMWD2tMxz65rNOkP4s2KgPzwQ0y+xMNjDFr
 Szp7u75yLK9N4HBKS4JweWKTtQTlLn6SpvXFcFdgyEUR9pMFLdL2nGk5FPP8FiUGPcy0LVtK9h8
 tRrm3FCzKIt4ueUGAKp8QZ0F6w6F3vVy52KeANWoa9N4EaoMx4fyz94NPNYY8NH6v5p8bwFnjsW
 BLVhFbj1gxfg3ZjLOtvVlX66DtjP5hfc7HtW3fH83B/1zSnrHVl5JetCCO2Lah23Fet+YS55XvF
 cSm9XKI7
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68be3939 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=qQZ2XtAyJf2dEkEvaVsA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: K6XZgr-CndLhG0tiszKQU9SNGn9gw3lV
X-Proofpoint-ORIG-GUID: K6XZgr-CndLhG0tiszKQU9SNGn9gw3lV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_190234_146303_37228BC6 
X-CRM114-Status: GOOD (  23.44  )
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


