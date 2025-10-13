Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8B9CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 05:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DeeXfQmF8BPY/Rrm9uGgR/SHD9DlxJ2y7BO/a91fj7Y=; b=PJdyHrc4O3iFEiDv/FxDSLXhWO
	/R2WXcf/kRzbJoIw2jIp5GBJZOfXpsHgPdM4GcBv1+E5TUEtAMRDZwqf6CLuDfZDSVBpdYc869qR0
	aWwjbn5eSkch/qdWLyrEm6wA8m8gofjXFSNgj6L7XiwG8NasCue63qajQQT09usOkrnvR+BtlI8Du
	Lgq/mmQZp3NkyhopY/GLPUdjFDtZ7AB78nblr4XEzg+k/jXduRL76i/1HBJ2kA7l7X3N78NemgnLa
	qW6yRY2yXhzBzPHlzH1oD49t/gwbZstJE/PTH8/WZ/YumQSyAUJ0xjXUP9NNVC1rwJfyFLu/jr3wg
	juAzfZSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8BRN-0000000CI3g-3NId;
	Mon, 13 Oct 2025 05:49:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8BRL-0000000CI1n-2j50
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 05:49:48 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nB34029365
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 05:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DeeXfQmF8BPY/Rrm9uGgR/SHD9DlxJ2y7BO/a91fj7Y=; b=QdWPfY6WJ1hpiq5o
	wogpTE47+bgJE3v3KXHoaOO0lKnzQmTlmpHwX79mcPVuVGYr2DN511iaifwM0eXc
	Qfoj2MaNjTAc9GmdEtAw7s9XYgMY6pTbIp8ydMW0DDmK2P+2cHBf9XerSHNGiwVZ
	tn2u+36CyYH4ymcF+EEN69rSwUo9AOPRDzUfq7oHOv7+nXeRWrcROKpltML31G1o
	NtRenOdIpuOQJHbVLkkKN+bwOCtQcnVKy1kdE2Glnc7s93tG82NHE/QmYCCflZ0l
	cfJg/a99jGVmmyAyX6O7pazwPNNthy8DlsN/+eehgn/9rKMelYca/6OUPaAvrH+n
	3AR3ng==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5bd0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 05:49:46 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b630753cc38so12254030a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 22:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760334585; x=1760939385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DeeXfQmF8BPY/Rrm9uGgR/SHD9DlxJ2y7BO/a91fj7Y=;
        b=fNLntJOeVyl9MGubEIC7B5QzP74Vu/46L5oL+oMynY10eJBBeJPqqxhuDkdCcb7tcQ
         bVqjBMBWyFbmzHgTAvY9tISPYIqvHX886gZ/dJ7AaZX5waQ8e3yVIKsLzOswYnSLRbap
         SjG5lwnM6gELvK4dRWL/FK4hJxMI4Afeq1A1ssWUHI2V4VaHb55vaDvmfBLPa9hvPGRC
         lNutM+R4iFMEUEPaArOtDo6bMVpOMQeSDYOblCBW8ealwj4eRUrqTOxw8eXlfa6Jaw4B
         gTukroyeyM5s808U4k6v8KduDwnvCLTAZH3fIcQSMgEcXLYC8jxUkOdMlhbe8efQyOsr
         of7A==
X-Forwarded-Encrypted: i=1; AJvYcCWHfQzFTC/9AemUkTe7LkOOvbio8o1Qwq2HhcVKPAz4ePIHLN9IFmMiXe0oO8Q+TEh32ZakyUpA4quf87etdzBJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzKT0M0ZlBv6KNvYihW23suXK1AKuFJwFo7d/6l0Ycsb4wYBL4u
	Kosb2jueuj/IoaVaXuShFR7usc0v565eu/yVKc8ULogUzDErVfWJlZdD/ra/4cTU3CEauqY61tZ
	ER5U+t52IHx8JmkiYWXkC5lxs3CD8W2LmUsEl8nH87SDeXQjYMCXiPto4Js6M0FVoboMp16iirU
	CJpg==
X-Gm-Gg: ASbGncszFSv6Csn1S2evKB75dxzXCIXUgGfOt7MaDsnuttbuVr/UFvz1S9tOqZYBMV7
	tacFATSWspdUXhcOuzIRSM96KEfgXQNf57RmjXVx1d6cLeoX5lPxUDzi5QK6zQOjbsOx+/UlJSC
	nVgHK0vGNgmILe48N5lEgl74DojdI7Xq1ZVjFqL7Qq0vgwqTBcv9l74bxw8P+5MLEEKWY7DuVHh
	pktIx+b2WQY/AZL2vfTKlZIlnzlObws+VyfjKeWqMzFWdsaTCMklHppCsurC3/7H/Fa4P8geX/F
	PJ6lcrFwCltvRFiYe5k2Qk7+7LuP/HlHcSuuLp3MEhelNVvblf8WBgAK7k1LqMasi9qVPSyT11T
	k5hOrdsPQB2DefOFBGk13L20UOH0=
X-Received: by 2002:a05:6a20:72a0:b0:308:60dc:921b with SMTP id adf61e73a8af0-32da845e6d1mr29695079637.40.1760334585333;
        Sun, 12 Oct 2025 22:49:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVkjFqXs8bvUpUlp8Y+og5WHqeIfUqxH8cxjvddLFNSJXsysOI+7Y6qqFqb0ax99cu7rPxfg==
X-Received: by 2002:a05:6a20:72a0:b0:308:60dc:921b with SMTP id adf61e73a8af0-32da845e6d1mr29695057637.40.1760334584857;
        Sun, 12 Oct 2025 22:49:44 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e1336sm10129898b3a.59.2025.10.12.22.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 22:49:44 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 13:49:11 +0800
Subject: [PATCH v7 2/9] coresight: core: add a new API to retrieve the
 helper device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-enable-byte-cntr-for-ctcu-v7-2-e1e8f41e15dd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760334567; l=2649;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=TNF6l0ahOzbwrs5of0KBvmnTCNoj347m7R5JdZkuHQo=;
 b=PHSldDPpoF/wpmvV2sLnTsJX+MgzplFa6X/gwHk2llThVTACGdXyUFYe+8TWszelXY/cUPzgc
 9cthysiLb/+B9DfJ5rLuaaPKY10Q01WdXFkMX8moHxvcqRGw72C+A5s
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: gKzUKGJBWB_wfqbok2KKWWIUUsYr1-jr
X-Proofpoint-ORIG-GUID: gKzUKGJBWB_wfqbok2KKWWIUUsYr1-jr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX3tH0MYBsGoVu
 ZJlxqJfQDoiIxFV9MDB+HDe16PkSjekqrJXa3wo89Pk6mONcsoabz3rcPyD9KFfinoVe6RHSoIM
 d2WZJTIASuOHCJMWQ4DyvvJEb6cY7oGlsXCmL7tSP0agACsMuqS0DQqKKn0gpO6tMTKAGPo22eE
 n9trJwjkyQePvtn/R/UnheOc+g+Woi59xQm3+kfZODDMlnI5QtKPJJDOm9UyymL6D15FWS1V1Sm
 Cl8W+R/iJITYBjuKJpgzWs/lmPSnrZnnlsr47BZqaYU+iHUMiiUV7gnck2iGeXOrsUGYBRY8Uh6
 JBloiSkxvBWgozwQPmXkDiKq1hXYbMedhq8QFTNbP4Ff5BN8WovTOg+/sn5RMLet9MEXm6qDZYt
 yiM2I3CyFnFjungXcAy0VinR5m/mEg==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ec92fa cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=WErVAGsNQcrMbPXGsVkA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_224947_811240_3C083006 
X-CRM114-Status: GOOD (  19.04  )
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

Retrieving the helper device of the specific coresight device based on
its helper_subtype because a single coresight device may has multiple types
of the helper devices.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 35 ++++++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-priv.h |  2 ++
 2 files changed, 37 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index eb6870425abc..27d306b23260 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -581,6 +581,41 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_helper: find the helper device of the assigned csdev.
+ *
+ * @csdev: The csdev the helper device is conntected to.
+ * @type:  helper_subtype of the expected helper device.
+ *
+ * Retrieve the helper device for the specific csdev based on its
+ * helper_subtype.
+ *
+ * Return: the helper's csdev upon success or NULL for fail.
+ */
+struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
+					      int type)
+{
+	int i;
+	struct coresight_device *helper;
+
+	/* protect the connections */
+	mutex_lock(&coresight_mutex);
+	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
+		helper = csdev->pdata->out_conns[i]->dest_dev;
+		if (!helper || !coresight_is_helper(helper))
+			continue;
+
+		if (helper->subtype.helper_subtype == type) {
+			mutex_unlock(&coresight_mutex);
+			return helper;
+		}
+	}
+	mutex_unlock(&coresight_mutex);
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_helper);
+
 /**
  * coresight_get_in_port_dest: get the in-port number of the dest device
  * that is connected to the src device.
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index e51b22b8ebde..f80122827934 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -158,6 +158,8 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
 int coresight_get_in_port_dest(struct coresight_device *src,
 			       struct coresight_device *dest);
+struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
+					      int type);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1


