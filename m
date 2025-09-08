Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922ADCA1017
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 02:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ge78CRxNCocviT/6Co2pp0hTuCE9iUxm3FJF2+Bl2q0=; b=YGJubsanANaLsbOL1w8jgFwMEW
	uGCrfWgoLJGwVXnpJSBxsSeCZzEX1T+u2xqS5361ZBHsu6d+WvgunXQvaTeXgLWksh0aJ1DCLrbNU
	jHvYhTyCHtCeRV53skNK7eXhT69Ac+w6+AjIkOXo6/u3nsV3WNG6xY8ga2atlAA4xc8ckt3IhGOkM
	PENcHOtpCygYGw/KAQwk0BV0IpJNEoW/I7Ka+VG/C5wmw/KvN0XcY+RVJQCLYBsmMO8jRd5+nVVyY
	QXs1bbxK0Jay0Tipq8blbG9z9TIE7iJGxeMewM/YzsK9H00a+zg+6QEOrZqR5C9BYw3bGOTb41ZmW
	A4w6Z/yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvROR-0000000Dxsc-44JO;
	Mon, 08 Sep 2025 02:14:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvRDP-0000000Dukn-2i3i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 02:02:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587IlfPs015718
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Sep 2025 02:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ge78CRxNCocviT/6Co2pp0hTuCE9iUxm3FJF2+Bl2q0=; b=L+pWz4pJd9z19SHc
	QhZdQRRR/SitNNd1Bq80X7zjU+54Y/LdnCenKR9GmGnIgN638ZU/qyWU6zjjo3ix
	5Hb25F7SbixhEWHOY40xokMsmUl2IcIn/AtljbAogEM93GPxIAsq+ycfQcAPvqmk
	DzMI84D55YAWFmRlBYOEcrR++BJLNPbgKap8W+LuJwC8Ggt7Dm4poxsefz7BKvdV
	NKBOmsi+q3lRJsovq3Y+w4BcBNHmG7QGv99QRAnNoKyeFPfx9VbJ72GKTSo4h9U8
	Xb3vWPHR/YhrtLd3dlXL4DM1phRUI/lqmZwJQLq+GNBysyd2NA623p4dAdhuACLm
	LXfSgQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8awu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 02:02:42 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b471737c5efso2786079a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 19:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757296961; x=1757901761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ge78CRxNCocviT/6Co2pp0hTuCE9iUxm3FJF2+Bl2q0=;
        b=hkqgtX/PwARIhx7/7V/WZWrRFMUg2d25KQ4/hohhxktwC2CKGMjlDzaLlum0dJnHbM
         2gpYYBvsU8qdH3pSol0nxjZSsal3jLLzTaGcZqVZkH7sEot5MBigY0tg52rVEQy1uox6
         0HvDvv/RwLAE1V+uw2NtVsK+G38kT9IOIrNgoPecKY++x8q7ISIhbmcjj1X5mbwiTbOx
         iPpWiJ4puA1/JW39NYpZewTBcOigJgjTeqJL96CZhWAtiWFJ/3k3/HMm/RF4x2RF/Hee
         XWaz+cDV/UBx6lZp49LZyCiXkLemxT7yWQpeI9JyZ/Ph/WlDd7igtdAWXkrt4LUw5xD9
         PRyw==
X-Forwarded-Encrypted: i=1; AJvYcCUPfr/i4J/1DJVcZ2vTNR/LGbMelf+Kc2YKQuxE+Shez8JkJJVx3mBBFdAoJbixpwO43gLK34m9Ubh5Xa61exA8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9U2AupyV7p8+iwdzdDQlfYzh+nPYSbshTnWbOai86G5mgVVQn
	AVgpmpet5NtVZDAOLWVaiyM8SLNrmQnZue6MRLdPfdMET20P0W/selEx+Vlfh8lLW547uCQ1XdC
	lrPK+wI+jKM5Bk22IklTTrq3NfHuR82yiUqDLcJwhjD/4x7p4JqI59uf7uwPBMpvFlzXbV5ahIt
	xuY17c1kxHFBej
X-Gm-Gg: ASbGnct7PvfwcOrYVXEkJqjwOpzibK17zqkV0v6ZWrBbwxP+4GTSm6Nti+/OMTu5gZf
	CYiANihjZojrls0k0S2x+jCWM04sIQumMF6K8PsUYY0pfXn/UkBnP8SC6fSZuh5uMc9T+Shbd5R
	Cs5P+nwmQNbqLHo9CCtzBbptD5o0jNqD/pD0Mw0bKCgrTUqG2CUAhrRbWGKxywGMYzdqQ3X5iGw
	UwbkiJQQiwyCSJ5z6SrPkRRYBVBz9b4iLmJAoOPLO9N7g6wrEYM3YXtcU6NjJOBUjcrwGrIUIV4
	U/WweKzwITsM3Vd7jYkrpca1UFnePI8jTBo/h1eD1LAIU5gXGMyw85/DhnaPWOPyZd9dk3KOsme
	PP806FFPo+gfe0fKARiredfiU5Kc=
X-Received: by 2002:a05:6a20:7f84:b0:246:291:f62f with SMTP id adf61e73a8af0-25345d2ce0fmr8120754637.49.1757296961157;
        Sun, 07 Sep 2025 19:02:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmxlgXwobw+6sYCcX7nSaiEH9SoZom4Tkgi5DROFCRYnQhezoOJA+JdGnUlTuZvEyeQEn/Eg==
X-Received: by 2002:a05:6a20:7f84:b0:246:291:f62f with SMTP id adf61e73a8af0-25345d2ce0fmr8120706637.49.1757296960626;
        Sun, 07 Sep 2025 19:02:40 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723f4858e6sm24285076b3a.4.2025.09.07.19.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 19:02:40 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 10:01:55 +0800
Subject: [PATCH v6 3/9] coresight: tmc: add etr_buf_list to store allocated
 etr_buf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-enable-byte-cntr-for-tmc-v6-3-1db9e621441a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757296940; l=2488;
 i=jie.gan@oss.qualcomm.com; s=20240927; h=from:subject:message-id;
 bh=J8gJ/mYXIto4Pqb6SCiL46R3ybLriqfOejLtEnfdnig=;
 b=7C7yn707Lsimdprw0DZkaDMCHAqIYdRQAOXnK0GeVx7h8jA1BavXgvNmroqj+Ox8oukZ3q3IE
 b4gs6HH1T8nDbUL+jeKB7WQNVjNywsynjftCQ/HYJnMCIIOvMK2M6Wu
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=OZh7JyRifqJh4xmrcGgmwa8/LCS8O11Q+mtx4aZGmi4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX9VPfi7uMcUiY
 qKA96bbDrmmdfuKoiQGsj16K6ltR35dasf3LahYQ+jUMn6c2I7Aza2MHadDkL1iKPlz4uNOOznu
 XGeyXE9P2hMG/cMOu9hfaBzSIiPAJThDS2zOIMhYJn6jK4tF3L3BzHOIgKL3YqWbDLIkCKjj4X8
 AZJxc5yQ1yqaPM8hw4+6ccz1oTLAvHhptFQHExMcWSeu2z4SnghR9Cf875+JQ5xqCT/nDz/F24B
 Fx1FUmjichptRqKlSZvvgSv63ZM4/cskcj6W1yoXDpXOJtQdO8yOpE/OCN9PgXleEUGx073sRTs
 A9d6kRn03Aj64cvPxVn2jmedaf8YDZ0GhqTEbfriAp7V/qqULvHeU8tr3/3ZR1XQp7HpCgQyZS8
 TBhOKQ/8
X-Proofpoint-ORIG-GUID: 7DLyAUrvff0w_wRXtzVisRbprTS2bf9q
X-Proofpoint-GUID: 7DLyAUrvff0w_wRXtzVisRbprTS2bf9q
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68be3942 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKaT4joegMVsfAxsIjQA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_190243_809646_1C7077D8 
X-CRM114-Status: GOOD (  19.79  )
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


