Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757EECCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 05:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZkIN+ISyGlutvlt2NEMKQZoAZi5qldb0Whjc6pZ8WQI=; b=obeheOsa/h7z33VlEMbPHb+sVv
	LelNmhjQvWnQMbvCiKesazPvviOipAfDRW87RAsniD332X7E77LqkdmpwVOcvy9t51gRDPr9Eiv4P
	BQoBtob2CZxZeHXBTViE9qb1Y9+GJU8kutTPc8r73k+0k9KhZh7nQrbuIWybgsvXSjwtuHtRhkzIB
	FqSMV2kTD6loD9r1uLZdX3Gr+U89eqQklfMqZbhw7qwTbNfaVEX3FxdbihRRTpCsRqXX04RCxpgbX
	61QAf1FAi7Zj0kdK76QyyF0gYdk6LbdSXhdQEJ7H8ZeM8Dh/adAMdILt47viOj40RUlPTrsh4QJAI
	cKGW4Gmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8BRS-0000000CI70-2k6W;
	Mon, 13 Oct 2025 05:49:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8BRP-0000000CI5L-3xD9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 05:49:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nMuI022192
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 05:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZkIN+ISyGlutvlt2NEMKQZoAZi5qldb0Whjc6pZ8WQI=; b=PBfz9rxQhMARe9AE
	PRXXEVnwj4yGngiyLZl702p6ChexFz/KHXt1Y1R/iY1sT9a70+Xe8DgnAZpmgpxM
	gUhy5JCaMgdY7JU/IQMaO0JMQ1PzBXwjOg8LzvueH9G8eEAX9wVSdkQXEdTjhBCA
	pzcsfwrAcp5J92yt5lf6MxmUu3lyoW56R+sdEdmnHdxUXUyfJdLhM3Ep5hpDVhTt
	3gmQ6B+2IIH27GP0RfSMt31TmLKzDBWN6Hka2Uhkw8swljhWzcU60Ay6cLELKBhe
	sgOOc3c3df7KcRYWP2Tj0JDhhb8Lsi1qq+WUKX7znP/rZgoESqkwZGrcSLOa+7EM
	jo6jLA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgh63a5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 05:49:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-78104c8c8ddso6679966b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 22:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760334590; x=1760939390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZkIN+ISyGlutvlt2NEMKQZoAZi5qldb0Whjc6pZ8WQI=;
        b=aSs5nbRnhTsVpV94S/Cg13XrQrNDYu6T7DpRqw6OjF4MzvISufWHNrvg9SCOEifpEg
         R7dLqkIqkEhhNkUw90MrE1BD3Kt+X3WUYvBf3fOFkemSfmGIwbzfuxccD5uPcIep2QCB
         y3pG5PIZ1sYoZ6P70yOwfucd6HzEl3ZUGUBpbhIl3KStF18fnRh2iCcd4VUSH3J/7En4
         +KC47hOfVBKjX4wchWNThUIt3zF+nC1pJ01FS+drWHVbm+6wFc4ZqahZLasnH2Y8VRCm
         sRLopsM3M2QW067BLiiguibVvakxSI0/VjTXX23ut8GPV/Ifau5X1hb0nTAC7vefTO0K
         tQTg==
X-Forwarded-Encrypted: i=1; AJvYcCWbOWrS6FROOboRxUI7znb6P8KcJLNSC5XQIYtYZxXHoVfm+TJBsAnhZOKnqbxWZOVAGRylPQ6PCQwoRcbSGSyG@lists.infradead.org
X-Gm-Message-State: AOJu0YzCRyLmiNwTOW0+lritd/UKaTeqJbPDT7qJNVPfUFL0DWBdsU6u
	xwuC9Rx8/BxqAXdtb8R8StwkuLew+0jVsXZr7bsbs6wxPcNzgzzTMyhkoGmLJtOQbSOJzhKz6A1
	BYBUJ2NVtqpajBVh28Nk45H4UcVOuV8KMnNI+Yy9EBxbmNyGAPqdapMgqyzDahzFubCiBleLAsK
	2oMQ==
X-Gm-Gg: ASbGnctR4Bqt24SDWz5VlwpUZ7O4VdF3iwqHTF8g+lAhxeQhOrQ8fi/2KUe7qLoJvNW
	9bi/etiDSIJ9vHy1YujM/Xm2Nwa3LfaJHQyaRU/2Flg+/jPIl6e05m1c4PKIs/9QcOpmnOEI+hO
	jaUjWIVYGn/04vf6i43YEriTO9ac9djgYggo4D9kNnKKSs55XcI2gHC5YeD2xjU0QgxdCom5KKn
	HlolKlDsQVLvmm6Pk7ZSSj/h1A/e40d/Ash4z46+B95ilg8IgrlN5nlPbUx6o81cczcCO298RCl
	04/Lv48osbTU7kHGr/dmnkoH0jf8y01XhI+m9w+JhkVf2cxyDuG5YxpwkujL+ZW5FIQHW+h8qgW
	lot4epzvYP5cWbw4DdwwkKRIgv2M=
X-Received: by 2002:a05:6a20:6a22:b0:2cc:acef:95ee with SMTP id adf61e73a8af0-32da8462b6dmr28772873637.52.1760334590557;
        Sun, 12 Oct 2025 22:49:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpP68ZqK4+UvkVBHdSzmeGF1Q2trMe/iCV1+fn9Hztu2xKfyuF9v7sHWahUZiBVWhJ28yWUw==
X-Received: by 2002:a05:6a20:6a22:b0:2cc:acef:95ee with SMTP id adf61e73a8af0-32da8462b6dmr28772837637.52.1760334590084;
        Sun, 12 Oct 2025 22:49:50 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e1336sm10129898b3a.59.2025.10.12.22.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 22:49:49 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 13:49:12 +0800
Subject: [PATCH v7 3/9] coresight: tmc: add etr_buf_list to store allocated
 etr_buf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-enable-byte-cntr-for-ctcu-v7-3-e1e8f41e15dd@oss.qualcomm.com>
References: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
In-Reply-To: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760334567; l=2504;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=10r2p+lUL97SjjNd6VbYPMcgBU6TACiRJ4ZXQMgPz68=;
 b=TcfJD9lvwCRECpc6GFuMsYv32seaGMY2B/UhPBYTmToKLZom7XEaBYDRDh6Oo98VP5iFlZQys
 MAO+62B9l+dDTdIP8xxlRXOFmJccz3DCs+swKYykjJLZHlcVSPwBdzt
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=H/zWAuYi c=1 sm=1 tr=0 ts=68ec92ff cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=KKaT4joegMVsfAxsIjQA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNiBTYWx0ZWRfX923NFoxz5+qO
 oFbHhJC6c0ynqgBzaAYWpHSxnnD2qZzEdfIE9RnakqCy2+0tlQ8wc6AbJGi871Es5qgP4aJz834
 lXFrQ0mkGx+RfEtLBSllYy+5Y6n9Ltqunmvodn2bIhyV6IoTy4X3p0V3n/hYRRJv8JDRWVmqTWu
 Y8g2IQbfuUgPCQf5R44a7SBurgshqF7c2zmcBq4frzPArAuN3hxA3EOad/2nNdEFcYNdcRiLzje
 fFROCNNtyDFXTCrm1mPlq3uu/bGzLPKVgrPvjnXOr5pbY9saiPvnvyeznfK3U/yTEYNqulOxY3U
 1SKZdVOgt/4PCzXzSCPRQAbpnmePQjaH9NDo7c/Wzg6dKzy4koHkw0F0Y9C1QDFJOiiolAfWesP
 1LTWs+CvzmNqcHosqmfT0t4pgytg1w==
X-Proofpoint-ORIG-GUID: hA3frf7SWouA-i2cY8Rl3t1mqCND9seI
X-Proofpoint-GUID: hA3frf7SWouA-i2cY8Rl3t1mqCND9seI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_224951_992800_D06CE61B 
X-CRM114-Status: GOOD (  18.76  )
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
 drivers/hwtracing/coresight/coresight-tmc-core.c |  1 +
 drivers/hwtracing/coresight/coresight-tmc.h      | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 36599c431be6..1ea255ffa67c 100644
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
index cbb4ba439158..3a6484998530 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -208,6 +208,19 @@ struct tmc_resrv_buf {
 	s64		len;
 };
 
+/**
+ * @sysfs_buf:	Allocated sysfs_buf.
+ * @is_free:	Indicates whether the buffer is free to choose.
+ * @pos:	Position of the buffer.
+ * @node:	Node in etr_buf_list.
+ */
+struct etr_buf_node {
+	struct etr_buf		*sysfs_buf;
+	bool			is_free;
+	loff_t			pos;
+	struct list_head	node;
+};
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @atclk:	optional clock for the core parts of the TMC.
@@ -243,6 +256,8 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @reading_node: Available buffer_node for byte-cntr reading.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -273,6 +288,8 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct list_head        etr_buf_list;
+	struct etr_buf_node     *reading_node;
 };
 
 struct etr_buf_operations {

-- 
2.34.1


