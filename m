Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDC1C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 06:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pon7MrhUMFaeGhGyVgauqCCEFXCkk5I04yNnyLGhKTc=; b=xXSAsBbBoPc7e8I7qwLFphEegV
	0BrxzDmnEgSejk37JnnuOrbPGVXHhxZCH1XXmkHSj3IZ4NMp9ZkfRIaDJSaUJDGcEuGzELuzuQQzc
	gFFvm2aAmQwWcsMWeRbIvvyw/jpTSvrfPSVClW7vVBSqQEyLTgIfHridnuYyvsPylZ6e/q2c+iRjI
	RsguEZIrK7lr7AP9+BJpVx1L3JHsZF2Zk3ytilaSsPDkHrn1ih4XMQUXqY5QOphe4OmpfdSonjOFS
	VRGEAzBnGYct9LfouxcajVzMMe5hTSG9RYcsQg5/JGEzB3G5dso4KeuZfyFBjmvB0KKstrrHhLGri
	iY9CimIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTx30-00000004kza-130p;
	Tue, 24 Jun 2025 06:22:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTwmb-00000004jFu-0ASJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 06:05:26 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NHf2Ua026798
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pon7MrhUMFa
	eGhGyVgauqCCEFXCkk5I04yNnyLGhKTc=; b=A1Bqo/Tqq9UBD9AlarPJzaoD2Ne
	KU/qTD72PJzjaINh1EPSAlkXyd0OF+rUqA3Sw8/2qHpbVOuz78ZjNobRnXR5RtMc
	bJ0v/Jb4NaJ2jLzCM4ixTLyFe3E8XyRM6Wje0b5U83B6hJSERDt6xRdwRTVY6yTB
	C3Ip8CgEw3NNaVd+1Cd/GzVreZdFFK1Oj2PPbvIOrfasK9WuBY7GGVc1votFZj4E
	nyYaPI7BPSrRSGYkTzb5ITseMz4WL2520mB/bkntpfEu+icGMAMBk3dZ7qkrPq4R
	p+GBsiI6h60gG6QVfFAEDZMZUxRsuf1vi9UqeW3fBJSy4vDJ06xchJEwATA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqhedm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:05:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23692793178so691845ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 23:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745107; x=1751349907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pon7MrhUMFaeGhGyVgauqCCEFXCkk5I04yNnyLGhKTc=;
        b=JrQoefJ38Re8S+ShZpEOxL6IBH3A1a0XNqwvjjxEy09x/OBTeJD9IL4yGu4WCW8iZf
         f87RhUg2H4xsZCseicjP4d6A1AINumScwjjvIk60GxuJ2vkmEVh1pPXoPoznrubYsmIS
         cV2Qoqkrq68fVgdE++6RuC4ASFJmwBZfQrNv0M+2iNfLf533AmkvtnqIaYnkh41y4SkB
         yXD7fHPBgu7BiGi4U3Dmsxy6m2w/Kv/nSPvfS0WJUlJpXyzHbBYzFbhT2M1+bfUmvci8
         oQB9qyqtOcfcBpzrLa2SbXSGLrPNy9MF7nr/VIP2fzKB3s0Bb/xtXtyP0jOZz4Yzu6hJ
         StTA==
X-Forwarded-Encrypted: i=1; AJvYcCW9w7gfbcIx2bNhq4jTZkVaL/Lom/zFG+7fjdp2NIXtS7/V3y4tFH+HpfCvP0bph3MP5GXR3xLn8PKkVYtnKlwz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw09CdiQiIZmP8FvKNjT1BCQhPav4xHG50rloIEQjzhc8k+1UVU
	idt9K6Zy8R+0Puj4AGm2E0jIjWvA4P4m4PGeUTmarYPZiAtW1n6fYBfZvuzWlv3lIb2U7E76h2h
	rZ2QzabYxHuvBS9uHX7lDRxlVDlAfVYN4J+nVoYqGRrcLWOVopnu62/+P5f+agnIZm66CDPWOJj
	ojMA==
X-Gm-Gg: ASbGnctbX0aI50jWlOgozx/plqsWxX9JwCimwPaaiWLK8SHkdgwVpl0XLVwEA4O/QKP
	scBYz1MecXA1Xf5ZNdPb8DNN8q60MA+IC/qAfOw5DgEjGOGIbrMDNsjoH+JVQj0ZZQUURw/uhCd
	6sOPtSp3rQHSRIH7D6jqQtG41MFuZCoA6tVtLLGyccT91SiMuMf7R9jxY+uuOwd2oTi4YpljGTT
	iXmGca5ggrI8jxehkEsVrjfd7RMRgubuKFCpXI4sY+LPJBcWkvVNoYi1HIuDFhkAvGZJLhTBdpd
	5ivTcw0We7Q60yYlnWuTcUJbE8bKvbyWtYjIouC706eu6XtrHzcQ29d2BAEuP4enzRQKxCZIIsk
	5qg==
X-Received: by 2002:a17:902:da8c:b0:234:986c:66f9 with SMTP id d9443c01a7336-237d983d37fmr250600145ad.22.1750745106930;
        Mon, 23 Jun 2025 23:05:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyxi/2L5RpxT7jQrCkp0XQD4t5nbonOAsYnD3NIf9AfeQ4K63zfMYh1t30n1bwNRgtIh/QhQ==
X-Received: by 2002:a17:902:da8c:b0:234:986c:66f9 with SMTP id d9443c01a7336-237d983d37fmr250599855ad.22.1750745106562;
        Mon, 23 Jun 2025 23:05:06 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:05:05 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jie.gan@oss.qualcomm.com
Subject: [PATCH v3 05/10] coresight: tmc: add etr_buf_list to store allocated etr_buf
Date: Tue, 24 Jun 2025 14:04:33 +0800
Message-Id: <20250624060438.7469-6-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
References: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RGqOhkhNBnCEMcewUMIa7kpbOm9hB-_0
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685a4024 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=ORm1qb0EFYpRwVLUulEA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: RGqOhkhNBnCEMcewUMIa7kpbOm9hB-_0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MSBTYWx0ZWRfX6Bfz5gPRphsc
 64bWRvKRSFcmJLmYifD8Aktn6KlrqPJusRbvYFUcscRWAWbWPwST5qoc0n7frccPpkGV6lCgpZU
 5K+Sv+tuDzrtOtOGQJwfdaxVqKLsDxPorJM7CV58bjDUookQ5uz6oxh4wKu4cKGfxy60gWrvBB7
 SyDRR5/Aj3B+TAxY/6vYjHqOGZxOfWj78BRbUbS+IDjqOANNrVWVLE6hTBXF+WX2rfxts9onXl3
 5dphKUwb2Er413T7Vd7CEfQAZxZ2h8rp4ay7EDyjV3vrMi2PbyhSCrEaV2JXtSH/Q2XL9j75uyV
 xsAv4/WVxcqTaB8gNJ2wYki7VLO6bMXCCNV70mGmFeG2UOTcXEQGQY7/DGMe3pKVbPiaGlPYr06
 KW8CKF7U6CZ4s5oKjz3etb+Xj74QAZTrcKj+ufm8cTP4L3w3U7Ik6efwzauyG1BdLJ3/wHQ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_230525_212755_1E40EB4C 
X-CRM114-Status: GOOD (  18.24  )
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

Add a list to store allocated etr_buf.

The byte-cntr functionality requires two etr_buf to receive trace data.
The active etr_buf collects the trace data from source device, while the
byte-cntr reading function accesses the deactivated etr_buf after is
has been filled and synced, transferring data to the userspace.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-core.c  |  1 +
 drivers/hwtracing/coresight/coresight-tmc.h   | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 88afb16bb6be..8531bac79211 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -840,6 +840,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = &etr_devs;
+		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 6541a27a018e..f6b05639aeca 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -208,6 +208,21 @@ struct tmc_resrv_buf {
 	s64		len;
 };
 
+/**
+ * @sysfs_buf:	Allocated sysfs_buf.
+ * @is_free:	Indicates whether the buffer is free to choose.
+ * @reading:	Indicates whether the buffer is reading.
+ * @pos:	Position of the buffer.
+ * @node:	Node in etr_buf_list.
+ */
+struct etr_buf_node {
+	struct etr_buf		*sysfs_buf;
+	bool			is_free;
+	bool			reading;
+	loff_t			pos;
+	struct list_head	node;
+};
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @pclk:	APB clock if present, otherwise NULL
@@ -242,6 +257,8 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @reading_node:  Available buffer for byte-cntr reading.
  */
 struct tmc_drvdata {
 	struct clk		*pclk;
@@ -271,6 +288,8 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct list_head        etr_buf_list;
+	struct etr_buf_node     *reading_node;
 };
 
 struct etr_buf_operations {
-- 
2.34.1


