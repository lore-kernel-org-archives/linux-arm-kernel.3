Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF866C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 07:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CaPwqYvTVd6rYAiU/xir9maSYh3Xig6TJw800PT+f8A=; b=G8ZWb/PhJnZwL3NYP+kCdbogG9
	EBc+EnUdMHFH6dEHsa/bpltdhl7ruwuIoqVKPW/az9VBXvEZ80nFDZTb6owM6asj5BpF3rwYpz+K/
	IxyM1jAN9GeIfJwNrLN/UP/9SW+O+J+AhnBZK4kt4N0egeBaB3i+Vq5/mBXk/3/kw72hXuNZTSI7T
	FaqBPu4Sr5aArS0T7uw0jccewDmHqirWS5pBuAb5fFIyP9ahfNCRUVfnMSS8rKKN6hIttP0rFVKvR
	hxrwDGAL+IpuRPpE50L9x7hgEBOsnTleN1nsbBYl8Giab7keIOSEFzcQJOB53oDRodSi7ixieRQqg
	psqXehoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDBl-00000001Peo-2y3V;
	Mon, 14 Jul 2025 07:01:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCj2-00000001MEb-3nwm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 06:31:46 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DN5v8e021183
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 06:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CaPwqYvTVd6
	rYAiU/xir9maSYh3Xig6TJw800PT+f8A=; b=CIAP/AVibwwaQKo/HPypRB6/1v9
	Bcwr0AVerASWL8pYyylS9NYngBOCCqsyfnOiJdHeaHgCHkpKN1fAVHViHTkdhfab
	0Tl96Rxt3rYN+NxBz3P83rTqVNP4kf1uPrOcix/nQ6yXWOTzfSOnsEmO2zgPvvaR
	4Mfa4kF0S7xqb3TUl2txRsld+0E6TMZSWQAgUeOFe8Q+WX15skVXYGWTUVnBk/l9
	XnGuQnUVUFiic4qi3H24Djcibm5xgo0tec0og9EPHyU2Q/hll1aLz1omOUPf/lMX
	GPZYbkSnmp2/Vs/H1E7jbUe50JP6B9CvuGpNccrpaCJteyfAOgMMvtblfMQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxauh66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 06:31:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235089528a0so43657105ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 23:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752474703; x=1753079503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CaPwqYvTVd6rYAiU/xir9maSYh3Xig6TJw800PT+f8A=;
        b=TqgM+DwatRSkoP2aB2uxJUZObCma4cX8hpVBe9okcXPX3KEEBn8m4VLRq5DdmhatDf
         d6r6OsEtavsqnCjGlJCJSvj24dy69CBDM50N6m7xbFT+kfZDI/VfjyXMBh2C9118duPE
         Md6Qq83XZNdi92BVluzA0pKzcxiD/TZSJNacx1A6fcgJMFUM/FwMxP54LNz7Gymwm18Z
         EzGSdEIodHfBQSBAkdSY5YGg/4fXdLOKtRY3mfBQJ+fmiafrrGjn00eJPHiuzOcjayzd
         VJCl+WwZj8Ze0QAolXyo5Dp0eZGPuKReQwodnbF12keTuziBRRI48OJQxCfTEGFAxw4G
         HqdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe2gIOcqrm1YWL5dCwz9cTiIIOyMyeFiVu28RztwFVDNhdE1TVkM/xvAzRnKEno855CNEDL3377R3U5oFNUxmL@lists.infradead.org
X-Gm-Message-State: AOJu0YykowQxCImY9EYSFwmIS6PdAYSrB45fC03K7dDroUTlQOwhzUAS
	2tZ7p/bQtepYGCeFi0M74TZVKdfcn11ezTGpMw4x63MD4yV0XwkvUudam6SRlPAL6MKcZIH9iAs
	aE2WeXLAHUncV2woVJ1zCUDdqrbQ05AIiR9pA3xlh3mpKQOtTqERh2Pe4B+hoEsWmwhQwLcmpX9
	Wdyw==
X-Gm-Gg: ASbGnctZ5kH57+lZEp0/yWfSPHkXOaVnbamii+aKxq5s4tBQaEgHyPW5wzc6YtNRmhv
	RvpyeKMIjh4q3OpF9P31LOhZLYFmzlPAYjEPzyGdFmdKs0xOlxdKa4NiXNO8zcBY5+kzfTrAgfL
	0XjOzLCRZNiSRRF1MdJpTYPi4JgR2YQ3Sx/6pRffB4LCfueuBQ9icqq596YmD/WbaMpAfSI5HlP
	uP/Z2H7gUs1D+z+8hjFU5QwCzH625xkPn8Rwa7qG1jWN7D2BeQas/LYJAx5FsPKI6EbTGMRij2R
	so/rzFcsPIjSkRQ+cLmgrYs8tje+DGBHkQ8EOu5faQfEGj1Z8o/gw2zWTUU7xn2FtgVuLPSroM7
	+kaktI44MvWMddoX7+XjP
X-Received: by 2002:a17:903:5c8:b0:23d:d290:705 with SMTP id d9443c01a7336-23dedd025ddmr105838945ad.3.1752474702540;
        Sun, 13 Jul 2025 23:31:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIkykQ3WqecYjDRbZoeEMeEsOtdC8V/Wbi6Wo9FUj1R+TiKBYdYSUZ6wn5yvJawhfA1R2lWg==
X-Received: by 2002:a17:903:5c8:b0:23d:d290:705 with SMTP id d9443c01a7336-23dedd025ddmr105838615ad.3.1752474702091;
        Sun, 13 Jul 2025 23:31:42 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4334005sm86138255ad.158.2025.07.13.23.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 23:31:41 -0700 (PDT)
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
Subject: [PATCH v3 RESEND 05/10] coresight: tmc: add etr_buf_list to store allocated etr_buf
Date: Mon, 14 Jul 2025 14:31:04 +0800
Message-Id: <20250714063109.591-6-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BQmB7X6teNZE80ecVwttewSkfxO4P6fA
X-Proofpoint-ORIG-GUID: BQmB7X6teNZE80ecVwttewSkfxO4P6fA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAzNyBTYWx0ZWRfX+vVgnprHYHki
 V6PHAB/EOkLBBCQbul40i24IVtTCkq8nqwoquwHW0iIhov6qCTM5Td7PZ1VNl1DdPd2zEbsV/oL
 E1yuRrM7/Cb4YRjATMFssocNh8dw0zJGtyY9poFD23c6XWzYehg45fCnyin6/gtdL63h6E+jRY7
 7n1eBu+YCK6M4dG9kewGGN4aulsRIEpa9KEnbJmBtglDm3Qb+Ycrk5B6xiZjLtmh1cvpJuV9RAy
 Mr9BQgHrI/VWdlNDk0r5SmShTh7Jw2OtAqTzRV0bg+spxIwtAqEir/pscaCvK56RKKpwnQh0pra
 PZdtdoSOsK7nsNknQOgXsNTISxA7AnGwp1RhoHq7AtaRpkixDh3Ulr5TXviD44P6tntSWubSitT
 woLpknSjApI/F7Nz7zEOrYPfg+4YAF6+57LkOsk1Mc+Fen+TCpqooxAjU1apxWek/qDYz+0V
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=6874a44f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ORm1qb0EFYpRwVLUulEA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_233145_064771_44057D5E 
X-CRM114-Status: GOOD (  19.22  )
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
index be964656be93..4d249af93097 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -830,6 +830,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
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


