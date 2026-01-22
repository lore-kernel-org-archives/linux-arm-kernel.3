Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0194DD2ED14
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 02:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjPxjq1G/MyM9wZuLe71IZ2aZxQ93j8UibxFtFmopSw=; b=k0vxRRVOd6jLqnowjpXymkMJIM
	GuGEEHL5bWcVHq1SuWbyAKYwbOFTcr+a2Gpz+g/K153qKyLwFlg2uwL1kBMrokw5hK+tkpy0rZK4x
	jAkNi6Cb1FLf748cA0xUV/FxMcxrRrblFA8y4WY71oiFomTpFsqGSvZn8spytCddksXJ/MtXOE1pS
	1ET8bqwkyBMbQGht5Cm2vBe0ffykVbnahFu+DUZTr9FxI2I7t3HIpONRzbqRl324j3nQXkZqjN247
	xWfss6+avnTGVajnWZOHITzwMfxSOajHchXMAe5jzLJbTIZI5JJa2IbfnibU62PrFCgJzHHiOjfbf
	AXpFSPxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vik7y-00000006Ikn-1Zo6;
	Thu, 22 Jan 2026 02:08:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vik7s-00000006IjO-3r9I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 02:08:50 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LLOb2g107391
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TjPxjq1G/MyM9wZuLe71IZ2aZxQ93j8UibxFtFmopSw=; b=Y3e+qvmOABrmij41
	JOMJ1xcI+z1A3PEf7mUNHEKZWXIPEe4/IiERPan8DWauvLF2k1MoWg+njmRNjGgb
	jQsFTGM70UEKDihd6rJP5arUYXQR7ChJMf+VR94CgDg4XYMhMInwSKJD3XbVwIb7
	gXdGmQt0J7Uvu3UmkrZFa/pyNp3gqsTfWvW+nMaNybfSvTawpKuGDLL7W59xGkRw
	ddSyJlnMLvD21mSuH8RhHbzEt3Eg3khAYdZY/vSY/4c1ZPXLy8PW8n07ybGns/8L
	NQB0ABAbLzb8+8NlwQqlDBgxJf5Uxuhe9vg3KKBZzWHr3zb29nO9xo8JITwioqe3
	sypJtw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6pgrn9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:08:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a78c094ad6so3928265ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 18:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769047727; x=1769652527; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TjPxjq1G/MyM9wZuLe71IZ2aZxQ93j8UibxFtFmopSw=;
        b=DAcvNaOFHmX5KalLE7qk9onFgech7LIdJN/vKTSX5y9YwJluyiTyAJs/dWJ+oCqcSP
         refNWxnF9ut3Dcg7ZBQt0tl5+d582vYmLZK7QaB8nd1To+yo0xlNQIgPgrYgGuMoAr3X
         5Sl1h6BqdnAjXBK2DaSyx+Juh/2yV4NFaf08nSyKKDE0WgFY2Leur2a1Jd+I9err/xn7
         vTEgU2nUmG7hU3YKvudvj/fJDzAIF78NPf7RJ4EaJsWT99Q5Z3xtxp/T2pPM7g+mPgxr
         vIIGM0hKvTudj6S3EnfJNtq3YZpYB5YRJYPXgAJfo4G8zHk+ibtKkc23ryr3Mc+hjOyd
         7zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769047727; x=1769652527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TjPxjq1G/MyM9wZuLe71IZ2aZxQ93j8UibxFtFmopSw=;
        b=UTaK7K1QJbHEa+Kmv/9vhjGIOrSRK+hxssYpSOZMU8t1kG0RjHUJirYGbMnDRU9zEi
         gxXyXBLNABuB0ccq5s4p9mDKeFZAlbawio+kc3FteGRRkMGTIeLXRyf3zUcwixso9nbw
         nW1sHw86Ju6CVzxPLzoxVVEG4EbSGusi/KzQasg9yHk72twhpS8770bbVye3ObpptRUo
         Sl62MbBxEjj2FwgMt46IGbSMWyZgj/81Ph6OkPf9YZhM06bd+DsuYkEHEgPlgYn8dg+a
         NUpyPfvxXVxhtBjXOaaqleAq6EdEeCDJ3JDqvrnTiS19HkMWdS8Wh5k5Kg7GQHEaOdfc
         f7Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXULQOfYWTLkrgmobqk09NaoXQlTeny+UN/2P+O/PQtKFup60tbSTPAUnglR3BSISXOH8DPWF6LE58e6Oj+7CSX@lists.infradead.org
X-Gm-Message-State: AOJu0YyRf2l4GbSCljobEBTp28rm4ys4J23Q93ei2ahA/EckKpHdhxoz
	ygwm3hBGBo8y4Wm/lWZE/Kzaluspv6iHHHlNgxJZJCor+gOu3mkkFX6b+OwvBNCugYBZxQcMcpu
	+RwQr6QKIIOpT5zvKLHE1A9awu7/OVt/EKIfJIRJYtgHeDIS30+fbCaUaTBUGhSn9PWdgtV6Psg
	uhCg==
X-Gm-Gg: AZuq6aKiU6/vV6G+ofT08QpMOT4AiMRhWUgf62U1feSXRH4TFHRFOSznrrqxtWBViy3
	HbL7VFc0TfjXu9qKZMGo5HN+rKPqn/OWCxJZ54MayVgZP7WIQaAxh5ipnfuOLf4gyEsg50lG9Pg
	iwHQ+d798/Ap5ms2OGSYTY7g3T5MRBazrMhHGQ7O8DBT+0+abL8htdv9t1/v8ARRpTvXoiLgQOQ
	KXAPdR//0j1oS/hfLqC4zLaXKomriS4ct8SAaqYDyPyKDr06In4rSI+fqBgCq6pyZFtxaeoLp8N
	Qxil2eRD9nDVFZyq1OkNYomuOwfP8ddvQgzvTAGWoP5PERklkx+dq90mt3ZZLlgI31KIe26+Er9
	QLwGiwDJ7lMvWtZkk1cV5PUVu89c0BBAUHPz3ApybU1iBHUbZZdKvCbu0SxsRzCjru0S0pklc
X-Received: by 2002:a17:903:2b0f:b0:2a0:8966:7c94 with SMTP id d9443c01a7336-2a769336c65mr63150905ad.20.1769047726739;
        Wed, 21 Jan 2026 18:08:46 -0800 (PST)
X-Received: by 2002:a17:903:2b0f:b0:2a0:8966:7c94 with SMTP id d9443c01a7336-2a769336c65mr63150565ad.20.1769047726186;
        Wed, 21 Jan 2026 18:08:46 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a780a4631csm49710305ad.18.2026.01.21.18.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 18:08:45 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 10:08:14 +0800
Subject: [PATCH v10 1/8] coresight: core: Refactoring ctcu_get_active_port
 and make it generic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-enable-byte-cntr-for-ctcu-v10-1-22978e3c169f@oss.qualcomm.com>
References: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
In-Reply-To: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769047715; l=3769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=x79EOx0VHbHe/nWXls6UDtNS83yDuFtih92LzPbC2MY=;
 b=yaflaOS4YWqXOYMcpMUjHpYf2iFkhRxjAfa9CSFqnu4+U3hr1I9kbq3e9zZPFVsc1VebrCeJO
 db5p1pJP5dNDiY+FWpA7zei6q1qBqYzNNcXPMJk/fyYkJ/NmJKZ+lAU
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAxNSBTYWx0ZWRfX1SVa+Cp4O+07
 EYC6WXbLgrfQKWHnaUqy/5FzYLkkQI88JBhuu8inS/v2MRsLh9d1e4nfjzU9KYL+loZttkFUB/s
 Q9pw9chDhjtRzhHcTuqJMndVNqxvL3NmssZbS2vhovn4CmuhF5JnL9v9Imp5NXE00QEgwwgLG6A
 R6wgtKfkcpYRw8foO+YsLI2EC/Bx+Aj9Vyy8Bo23sNaGW3uBHgF/y5wZ/szabvf/ReWamhrJPaX
 mh9Q1HotUi5bQjGPJXVcz5vrhBjRFDYfJWBkknJeTSkbeIHWsVrHm8co65GEAIxW9mdCX4Xh5Oc
 aOsZTJHa/a8xgI0ezBCpzPseHpqWkhW9nckLTjWS16ZO1X9VPjnZSl8RGT8KpAkKVU/NuFBO54y
 F7nFgxZz8tS/bNAS2hcuvZ2V0KTuJzefP4IC/b5ossXTUu/N56Kw1vdJzdsZEUdqqrGIqzlS1Fm
 CdnEhNZv52n8DxhI4tw==
X-Authority-Analysis: v=2.4 cv=OZGVzxTY c=1 sm=1 tr=0 ts=697186af cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=qQZ2XtAyJf2dEkEvaVsA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 8nBaqH8J5d045vfh4XInjb2EAv6IJ7Cu
X-Proofpoint-GUID: 8nBaqH8J5d045vfh4XInjb2EAv6IJ7Cu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_180849_111657_6FEF5533 
X-CRM114-Status: GOOD (  22.36  )
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


