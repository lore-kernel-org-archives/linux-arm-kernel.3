Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CB8E83052
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 05:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNtaBtXRyxbHQmjNKTqpgrs01dpaRUqnQPmUDzf1zhY=; b=aBreK4jxufxjwcoh500OSnQF7J
	WnYf0BRnJin8KwfqGdZMKoIDw9BXgUCY8aN4CqhWvIT3GpTahAlmAU/aTL2YkhhLfPjkd/pORWO8v
	UTh+dcJtpBFuLNMpYvsUFRyR8iHClIDi85opPpLbi40ANkZfejX5MG3D9vS3wa8LmZxTyiJtV/Pk6
	wBFHnff1E+fG81ANAzrShKMmp3oit9IAt1Ynv1NsRUJbGU89pQtG+4REKMG7Au+Cv7Mr1hxJPEwzA
	i99Hcp+7E2+ASQ/GostVa8WdysWQe+aLFAat7P46s+AH+6kGEyc/DF28IbgeOGghgvIj6g1tt9Jdg
	c2PjPxTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9Kg-000000068X5-3Bpw;
	Tue, 03 Feb 2026 05:52:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9Ke-000000068Ur-38qC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 05:52:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612JwcOk2899840
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 05:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JNtaBtXRyxbHQmjNKTqpgrs01dpaRUqnQPmUDzf1zhY=; b=fJP611Ij23SMmBPP
	+wL2u1ISSs8pZ4YQLVnBUNHnn+eW9XBJUaS8I2a6Q7lLHSaoPprdd00py3ujPUbG
	nyT6+W6RWmkilnmMqHrf+4SapUFyDDdIPFV8hWxp7lzklvTbrbSfrth4HtHpJpYM
	zbCer+GVkS64FWEdnjar6qZ8dyXj61eZZaNfw3cfa7tOaUquMiCIa7KQUjaTOBW8
	AorlmhWALpumAZHcTP9Zo9JJPNZjbEjNGbP3fv9aXMttMnnzUaraBDzR5EebiaAx
	WXyUA6wCFlggXUm9Auamk1acnQxxHeKQmBlT/0A/3iQ5W0puRFxrPID4bwj02aYV
	E1T+5w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tp0u1m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 05:52:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a75ed2f89dso46171045ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 21:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770097931; x=1770702731; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JNtaBtXRyxbHQmjNKTqpgrs01dpaRUqnQPmUDzf1zhY=;
        b=L6uY+YNefS//GbUOx6pkQynYIIM8pSyuffh6f0KxOjN1nUsw81KEthGZ+33Ieom+T0
         //DdVJuLs3U8hsd10q32DRBXk8C4Yqicl4utOMiwAZSwc66gqqoBj79w/o7IPoJrnlOh
         QKVUBWnCJR8dNff+7QDkcXZjIgoqH2fmESyofUjXa9t4futMRPSVM3u9eJTr+65rM/zp
         BaMpayiPcSL9Y/9qzkzG3SgXL749/taM4NUEF0l73B+5AmRgSfJ+KHY9UzRJ+n1EO2eO
         rxyQo7To6FG+ak8oLDnBmjUfKQ9gpfQF6gjv7PVNAFKkWSD5uvgnI5Lc1n1Qq+ZpIPLh
         lw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770097931; x=1770702731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JNtaBtXRyxbHQmjNKTqpgrs01dpaRUqnQPmUDzf1zhY=;
        b=daS7IMXEfDpXGvFXOtMsR6HCiW6nvUWeJg5FHfm8AN2OIciD7RtDgFwnjZdKGwF7zU
         VoYNS4iXzjkiMUQBAwqlqzrS8roxVx8SpQjgyAozmnCrTEsXEx90dkgZQXBamR4NUOZU
         /AAnS3bcWziJ8qxxhNjNAZQDH/1Pmz7x5ucNLEwrMnJC5PMkjHPP9gZOJPaSPInB0+GB
         /rZb4xu6m8XtU3v/1u0L3SOGDVqJ8mElxtEw3EQpHZOYuhk1nGXpIIFlh0rsMOGbKD5V
         kOFh50GP4ipezmoz7zVXaLMDgRvucohFMe9Df8isXNTlLZnw33z5hBsdE7BNN/8JLY/d
         gX7g==
X-Forwarded-Encrypted: i=1; AJvYcCW5cui61HcG5GO2xuBFXIJsGipspU8KvLTTnr+jAdz6DvpDpxwWnYiMKZ58QCHkmmV2UVQtsNERNf6vk9Rd3dW1@lists.infradead.org
X-Gm-Message-State: AOJu0YyOl27XuvQ7btxtl72P+IU+akZoiEOdyFrPec6WUR7CrJS6ej6k
	EXaIi97AAbOZ0IaueRtNDVU517CIoDztykmJmpYrcTY2BLW6zmvvXPaEpe+ouQJGLQoBDA+nbDg
	OJzonFFwGNdi5tYp60HOY9RWuTGCwE1IYyh4yP28nzHEJeX4U1Yb6EEvTawppsCmCDGt8Vu9QwI
	BPkQ==
X-Gm-Gg: AZuq6aIpTZMO3MG46TXCibZ+0fw05JhtpW/i14wvAnZzGp0DTMo94Ba+nQmGf1WjlMW
	OxfMvFUmPV38p1kq2XgVLanugmWOJNNN85HfduXdujW2Br6HbsowUq84wGbV/NNRk/ld7qVuy2Q
	2QYJF0uUHTzNVAxXe6BJ/ihcE43p09JMGpMwCLfiJVQRKiu67qtLUctywQV5Cvs3Q9YGKpgNDfR
	Sl6U4pKpUIQ+4plmeK0xvzxz1bokt5jITNe6cflI/Bd9iWUxPH5DpWPw+58T6epqSK/rGP+Kkfo
	wJUD9ikqhOTlGzlj7b/W6fJ+d6F+msx0OLc8ZyQBQKo/KOcdzZLBii4EfmkRw3/s3Ry9T9Xtnh3
	7AmRrKgzlldxkNeqNgFLE9/OA6JIWOB3rMFp0ss7ihsH22x7bAiX2NnhTrvryg8sIwRsAcBSq
X-Received: by 2002:a17:903:1b67:b0:2a8:dc02:8939 with SMTP id d9443c01a7336-2a8dc028b56mr145595325ad.0.1770097930801;
        Mon, 02 Feb 2026 21:52:10 -0800 (PST)
X-Received: by 2002:a17:903:1b67:b0:2a8:dc02:8939 with SMTP id d9443c01a7336-2a8dc028b56mr145594975ad.0.1770097930170;
        Mon, 02 Feb 2026 21:52:10 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e4189sm157424735ad.83.2026.02.02.21.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 21:52:09 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 13:51:20 +0800
Subject: [PATCH v12 4/8] coresight: etr: add a new function to retrieve the
 CTCU device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-enable-byte-cntr-for-ctcu-v12-4-7bf81b86b70e@oss.qualcomm.com>
References: <20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com>
In-Reply-To: <20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770097896; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=U4/sKRr7M4WW+QFUhNUawaF5P5iRNlfK2LYJRhPxGVU=;
 b=G2P/JwHdNHZQyowWhQ1wY2ctXlPUXOxK/PH0GtLc9G99wszt2WdtAuEyE5bWv4ckTmAaNB2TN
 EviVDs51LH1DYJ1cKrgi6QUUn2CTECwwf/QIXC/OiYNejdM7tqYaoLH
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: SwXlwMJKo9ObdRYYpRbUHHPgzLiRwG1H
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=69818d0b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA0NCBTYWx0ZWRfX9HH60mlagbcQ
 XThFw6as5QTNSst+QgpsBHvJ1OOl//KzeZDfkdRTFnaDrqgymlmLL0yMrq0qCtzbclVuDzcpdUd
 fHRKktBHtczOQkArKO9dzJa4Ko9FVV0Dy6SANg8nFKe4Udlqt7afH0w7JEkkBLYoU/guuiSfV+y
 vtRiAVpS8SJkwOxwPyahR4Z77LkWKxCXDRo5ncdwa7IQ4aE6dcf1bbkSrHcJKT+VaBXMl4ndn6s
 4z04Nbb/F374FVjAc17rlbF5RqTguU6vHQFBiIzKYFzrRuJFTJLgnNO+m08Z8r9edlFtspHmGrA
 z4aZE7Y4CpF6EdGCP2YxLzCR283Uyn5J2yKBLg+YstLNWDWop+8vK89m6nAK7gH+g77LyteIL1w
 /mXA4/tENl2KWRxAngJ+Ct2A8E/LJgYIrAz+EacJUAQLEhEXEJPWsuE5XVPlo7s7w+yCfUj1Q9f
 39ESOi9VdjP2fphPpiw==
X-Proofpoint-GUID: SwXlwMJKo9ObdRYYpRbUHHPgzLiRwG1H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_215212_924477_187CB224 
X-CRM114-Status: GOOD (  17.44  )
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

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index cbbb15648fb7..2ece3985e2bc 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -867,6 +867,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Retruns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index c780f6d5dede..8ea2de08ffd0 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -470,6 +470,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1


