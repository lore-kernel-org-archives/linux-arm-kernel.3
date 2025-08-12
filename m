Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737E2CA0EDA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1IUpmlclQ09bHbCcAYuy6OSpZ8BPA7QouFBaqx7SR4=; b=2omLviaRiTB0IdijMqrECG4KXq
	UL0oCRr4HI++MnKTAob0jYImyatVoIVpB1wepUfDWRwFpGVLYrOkL5RMdBYQiPjqaO3pNmKNhZK2V
	8V3xfaf6ASoH/s3sBQw3zQClHNyZ/qaYJGrlYGWAJwwxsslJ2dbN//XnVjHEuOWWJ7Q/QHRrfM8UR
	/z4hludJtd5rFwxvSiPc3S48op1QGyuSG+a9oRsYRH2/AXnI3ao9hahOINrK1hziBlkohiNthhG8z
	3HSA+qqg7M1Xc1EuVYtd/ttdmnrQLbQqxI4dVPjzTCpUDmvFGrAlfBa5XsSFZbuSzcFm/WhzW+gMJ
	fqnJ0rAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloGz-0000000Aklx-0W5O;
	Tue, 12 Aug 2025 12:38:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkW4-0000000AGRJ-28FL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:37:57 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C4wt0Y028828
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 08:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x1IUpmlclQ0
	9bHbCcAYuy6OSpZ8BPA7QouFBaqx7SR4=; b=ZT3lTJhAaIKaH4BVqDqRNS0xXEX
	lFUrMOzmBpNorqpYX2q4LRTIkcj6NzzoQ7sOVX+5ivF3sbaqGs38RgNEGw1H3p/+
	B+8WvrCrl92OGiCbcQRtTFf7cYZhz+xep2u7r8np4k8WNgiXgw9S1DA+Jjsgt9fj
	U0OGPBw2NkkcXfCrk/dXpNE9grpf9NMmmNUp5hHpRzRHLHjUXSs+4+yXG0P4W0mv
	YGcGvtzTSRmuibOfd3HSzc3plNTDAtlKB37weNjHMsAoRcqyPs7gWAJrreyTwihh
	3w4BCtOtPKiQwiszSen6ATR7NNIrKLdfSlqHl/o2NCSiRS3jzFYZicuOedQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sqkf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 08:37:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4253124e77so4420884a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 01:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987875; x=1755592675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1IUpmlclQ09bHbCcAYuy6OSpZ8BPA7QouFBaqx7SR4=;
        b=WrZpPNrWnxt8iZmcajeAwQC0XkhJo92N/h+WbWkB+H7Pus0UPuaBbXt0gA8D5/59ah
         8/oCUowhIL/UCBE9lbWWPkdUdLvea69wd/zI7+MExL3MjWoJzmGm2Xz1gpzuU0fwoF70
         GnSbR3v+vAv+xElxROMUunfymQur+oQUBT66n7rhPuwMiMYz3TelTRVjOjCjvc1myyPD
         zAbL/huGw1XYVS7jo6cfktSEa/FsY8yqpc/isMDvlq5WvvKzs4r3kc6iB6oa/pMzqbr9
         GyXaZZ2/HG42zUAKtRIZ8HW84sSMBqfzZ6OptlRLiZ4qMGorfAAtJtSvQzz2edz9Odnc
         sZow==
X-Forwarded-Encrypted: i=1; AJvYcCXPuQ71tNa0BM7hVcjCGg8Yajc1W5UtYfT6tbqxiW9k/vbFT/1f3GStbVOAzXuKUge95HSya4VTJ8oPhglAt9TQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwCLTHc6wHtkm1NmnM51GK8va1nYrDWrXg8gGV1yeZXAmKo0eNq
	7Ixr/Uon500Ckedk7mOZxV4cDjMO3hVfdHBjYLHDlkR5p51RLcBlP8Vj+2CbiXmTTj7AZObfsDI
	FgboECG+GR6uLuF+X3CUzY8LPGQKs+S9sj/7JxhmpfG3fAopXiZPswDFye4/TDHiq8hJilk7AWH
	oRAw==
X-Gm-Gg: ASbGnctENIi0fV9/aDGThe4+zQVkEZDUNVUGBowLvUO/PTw+lOxQm9OjV/+z/XBnz+7
	Uz1yQjuyC0Q6GVNFHlieL3D+JiRStbCahkNOz1g557dhdwn/hOCieDRRJvOY5U0V/kJuK0JTj+b
	E4JfGHk+AyGns1dMVDUz+IIz/c78hJnLTR1GZ2NS6jBT3QSb3uYwaJSYHQMeSov0v9mSXb49iPl
	RonzNCDQfq1/F0hV60tD4hWu0aI4EoUPWnUJLPAQtGQeYFdX+dm1hBYOlU+rOlKdQOqvevttLpI
	WGiIS25yAFVk/Z580UhEp2ll2YA09/Oh0nuvgoVNhAqabXeRuJ5Sdb0Y+GVKEkHRs66AVV/6NFH
	k/RpgWCiT/n7Kddfz2pU=
X-Received: by 2002:a17:903:1a0f:b0:23f:c005:eab0 with SMTP id d9443c01a7336-242c22085e0mr247517515ad.40.1754987875224;
        Tue, 12 Aug 2025 01:37:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSyTwItp4AzURKgkqbIXylqMcchbdJF5mW3fYQFHbXyc1v7LKgkg38a0UoXB11ZfsFFDrQmQ==
X-Received: by 2002:a17:903:1a0f:b0:23f:c005:eab0 with SMTP id d9443c01a7336-242c22085e0mr247517015ad.40.1754987874696;
        Tue, 12 Aug 2025 01:37:54 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-243086849b3sm1915345ad.175.2025.08.12.01.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:37:54 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 3/9] coresight: tmc: add etr_buf_list to store allocated etr_buf
Date: Tue, 12 Aug 2025 16:37:25 +0800
Message-Id: <20250812083731.549-4-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
References: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689afd64 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=JdrPKQqGaJHjzi2MttEA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: gjALCDGpCQDjoa8VpKivzPmQIpXA6SAH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX7tC8ZGKk2Gkm
 BcR+ykLtCYx9+GLxGzu2oo6YPv8jCpwhbpsHpO+UP8GC8jOkpZ2iAGNb9V9RB7y5BsYr51I3Prz
 lWrAmqKvxoAX4L0kwvFp+GRuY7NfXDKGXdB1TUPxAILWxISxsVJLlXD9Pk2qqnjoGJRUsZruz+N
 ljD1bWhQWR3TVq/9PrK3HIfsewtv/84q2qgI9dqiRykpEdJVU13SnyK2z37TFd4EhBHaomWjvIq
 CyvvKqnkkM1FieRbbliAzsb+UcVhLjBlH9kcNJQdR1CV5NJXuCJ1wQuGtNueS3m9eCoqJDXYquJ
 /XdHB3e7O8DklWPiRbTJwDsmEu9Tj6NZz+/fr2ng7lvZee1TPG4g8dqtjDwwxRb5+nHw6V19Wej
 Rz1w7OFK
X-Proofpoint-GUID: gjALCDGpCQDjoa8VpKivzPmQIpXA6SAH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_013756_547927_489C1614 
X-CRM114-Status: GOOD (  19.28  )
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
 .../hwtracing/coresight/coresight-tmc-core.c    |  1 +
 drivers/hwtracing/coresight/coresight-tmc.h     | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

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
index 6541a27a018e..292e25d82b62 100644
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
  * @pclk:	APB clock if present, otherwise NULL
@@ -242,6 +255,8 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @reading_node: Available buffer for byte-cntr reading.
  */
 struct tmc_drvdata {
 	struct clk		*pclk;
@@ -271,6 +286,8 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct list_head        etr_buf_list;
+	struct etr_buf_node     *reading_node;
 };
 
 struct etr_buf_operations {
-- 
2.34.1


