Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B04EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 07:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gbtexVl8cn7s6dLp3Pk/zhJx463eI0itM2/mzeX7Ixo=; b=Rce2LLy+ITV6XsBqLJNeScnGZB
	lX4Q5LKQ6bJPRsDXYAYyjsxjjUzLFU0fHRg0mizwQS5qFenIfepm21XyH4swvSduRLpcipmorRkVb
	OTcfegbmOdVPMWIvA/JLkr14ijGFyJAxFmVsTOpSH/Dav0NScWEFOMJDJuqUak4cdmcEtrDQzcEtq
	m2TlMuIotmJbxPmDskaHDzPApAgVTVNCSoaKQ6/3rqob/ks1svvkZWPsRDHxDMeY++jjdfRqLWnp9
	HQs6qvWJx/vKEq9iYGgiUpliZiZAOHCnMazJH/ANdMQAHk41KGA/nYHpfJrgORgVJ2ptW35Zrd4qq
	iJkUyJCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDEA-00000001Pxp-1o3C;
	Mon, 14 Jul 2025 07:03:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCj7-00000001MGo-3Zfn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 06:31:51 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DMDrd2002934
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 06:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gbtexVl8cn7
	s6dLp3Pk/zhJx463eI0itM2/mzeX7Ixo=; b=YI696kbsIJuZX+Dyf4Y4ffihnwd
	85P4spZnLOkx0480WJIsrVbwll0QaFrEa9q2G3OYF8kBU1UxYmc5ojUj/zQcR3Iv
	sWnE6t7Ua3ihnPDTX3WeUnZtzBLmQhSxsyWzI5n15/vFrhCxe+laJNoWEBbQmadM
	9E1ugX/6ZzWIoZmOJwT1YWfXUjNQSCsfxbtdNEK4s+F4n5uALRhgmz/jLK4H4xxr
	OgOv6hHi+hevH1JAdDG17Js7eXVxhChkBm1Ne2LDtI+Pjc06laFQIR4oSsvGEnC3
	p2MbjhWhHjDtB2ExaIwK6JagNRAxNNj276PpAPvIbwXERFlwwPxImf8Ym1A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut3ew6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 06:31:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2369dd58602so38151885ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 23:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752474708; x=1753079508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbtexVl8cn7s6dLp3Pk/zhJx463eI0itM2/mzeX7Ixo=;
        b=wPBO5mt5wIrQXeYs4LseENKVSovHQcNTpCgOwRJXhTqEUmlj5QoGaMD/Yebneq3MUf
         K3/+mp46s3uzkKFxQZ3ih0ECox7Hl3P7AZZaZPMlFuSHF4nBxgOqRDQgMykE+OpNAcDV
         HgXvbrzt2wRQuv1t0Ch2/BPAd59AkjMYa1XIUGVJeZTZ5wr1Nbst7SRZ+lEtzy7ptw5m
         3ESrlZxZhAh6Rh+DXf64x4f2im4aAyyVrG7zjqwe7ydJ1LiVJuuUipIGiRQUmwU7JY77
         cyFN1h+ttm9xcZuMc8wJdAjJgC7/6ZmU9vZPqwZYNZAm0WZ/BKklXIldar6umelLF62E
         1JEA==
X-Forwarded-Encrypted: i=1; AJvYcCWLON6HP9CgH5cJeH8wQqaXWOD0NkmWNpfWT67VeSngQXZrWvbmPPfFjZtMFrOFS++Te3Q/lvvOwz7TNDKqi987@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxp5d6dHLNgZBt1OaCheO1wNsDnQUMMsC4mDdIa9LO/N/ilzxF
	t2ezp1yFWq6iwv1GX82lKljh0BNBeReWugHfBmOhGtcY0IdIcLU2naIzi/vuRfjq/+eL5UQdpd7
	tAT0oyoSQdS4eBJsGeyBzIgN78rSyEyVxIbszXyHymkRWp90/6HBrLm/nhHLW4L+xheoPhgs6DN
	8ghw==
X-Gm-Gg: ASbGnctmYPB33zZWL6Ncm3A6SJ9uYsUWPIrJes9ge+fRUt3bzw3PXZby+RYV6SzqZbi
	1mCN8C+zOSYQZho7oVKmyLtYuHUoYJGMcqWfVGiYWSsblHv7ia0q7Wek7Sri7yusQv/3ZjJbPFC
	Yn41GB5n6JUs2+v6F3nbdxmhT2/Ep0XiTH1QhdK4VPOIVCwSkk23/G+YTds5JFivtKj9zZpzyKP
	7ZsiGRGH0bbItAbpYsjtOJJv+gXHfrlhQzt3TMV24KMA8hvaVipJCfdHCE3TaUEJfQa0K835gnW
	GjNljfw/zeCb2yUmH2MyBbWagtqNo3NafXgg7vxdD+gLD5FKdfjoXTEs0a1OxcZ+mk9vM8Yro8Y
	Wu3EMirZR8j7Ky5A+m/M6
X-Received: by 2002:a17:903:1a2c:b0:235:1962:1bf4 with SMTP id d9443c01a7336-23dee1a9a28mr154868455ad.14.1752474707456;
        Sun, 13 Jul 2025 23:31:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj4rbvGnNx+fx3MCBznDJ6E+aV9dfiQvxQXSpTlh5YwlHL8v33E80+qeMS7LmY2WziB5yZ8g==
X-Received: by 2002:a17:903:1a2c:b0:235:1962:1bf4 with SMTP id d9443c01a7336-23dee1a9a28mr154867985ad.14.1752474707024;
        Sun, 13 Jul 2025 23:31:47 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4334005sm86138255ad.158.2025.07.13.23.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 23:31:46 -0700 (PDT)
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
Subject: [PATCH v3 RESEND 06/10] coresight: tmc: add create/delete functions for etr_buf_node
Date: Mon, 14 Jul 2025 14:31:05 +0800
Message-Id: <20250714063109.591-7-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=6874a454 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=k3jFKW3szlTOC2bxmxAA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: icF5hJLieLvvJhfcXlxr2OGojqYktSMp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAzNyBTYWx0ZWRfX8CqrDUsTjH0p
 eSEIFP81FIqTcEQe8lTKyO2Jx4LB9ZZUlOrpkQ/Ywr/QgGLGd97u9cdUqYHizfya/t/AQSjHocd
 8hDgkELqfJtpAYeYBP1Np83Sco7JBgTdhbblLDY1L6amWdM/4Q+g7O5nNltAKWlAt5R1CrPKyq+
 YCyp4VeuDLgtZXp1TBjxiPE6hhbb+1xdiDaG2q+yv7kfxEkcls42x6NNtVLMGJRVEnj0D0ad7Db
 /wPAts+tFv+ETrrCURPzUUNn8XSe+givYYMwujv4KpUGcHTg8SD5YcUiCaZox4PgODaSE6stjRV
 lYIPwTs7RNNIHfQyNvkjagf/2ilKPjUrYXE5Hz9ZNnK8SldP4yfsQiZr0KRO5N5NoYS9GVEuDVb
 yv2OzHka2Cp/CamPO177w1sBG40KiRvctFYZ8cenTX23piWri1p6LorFZkht7ledA/OGLOnK
X-Proofpoint-ORIG-GUID: icF5hJLieLvvJhfcXlxr2OGojqYktSMp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_233150_022344_331BBE22 
X-CRM114-Status: GOOD (  17.04  )
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

Create and insert or remove the etr_buf_node to/from the etr_buf_list.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b07fcdb3fe1a..4609df80ae38 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1909,6 +1909,55 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+static void tmc_delete_etr_buf_node(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *next;
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf) {
+			list_del(&nd->node);
+			kfree(nd);
+		} else {
+			/* Free allocated buffers which are not utilized by ETR */
+			list_del(&nd->node);
+			tmc_free_etr_buf(nd->sysfs_buf);
+			nd->sysfs_buf = NULL;
+			kfree(nd);
+		}
+	}
+}
+
+static int tmc_create_etr_buf_node(struct tmc_drvdata *drvdata, struct etr_buf *alloc_buf)
+{
+	struct etr_buf_node *sysfs_buf_node;
+	struct etr_buf *sysfs_buf;
+
+	if (!alloc_buf) {
+		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
+		if (IS_ERR(sysfs_buf))
+			return PTR_ERR(sysfs_buf);
+	} else {
+		sysfs_buf = alloc_buf;
+	}
+
+	sysfs_buf_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
+	if (IS_ERR(sysfs_buf_node)) {
+		if (!alloc_buf)
+			tmc_free_etr_buf(sysfs_buf);
+		return PTR_ERR(sysfs_buf_node);
+	}
+
+	sysfs_buf_node->sysfs_buf = sysfs_buf;
+	sysfs_buf_node->reading = false;
+	if (!alloc_buf)
+		sysfs_buf_node->is_free = true;
+	else
+		sysfs_buf_node->is_free = false;
+	list_add(&sysfs_buf_node->node, &drvdata->etr_buf_list);
+
+	return 0;
+}
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
-- 
2.34.1


