Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C620CA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QrIK6tX2IWKGLbKUtBQLQ4aPT6fPCczMhEz00/Q0PUw=; b=PJ6/BpP1pQ39N7Yzn6RYSDdUbj
	y/EjWjxVDAbv6ITviD1s29KFZtdQgVVYDKkDnUG8TYVHkwW59qvbFsbyANRp1xdmmdEiiRfkjTIaB
	CNcoX0ulpVq7fLfMyUPaGLNijfK6SSgnXfwVTy3jkAwoo5yaL6XscEq1sdYHalmKJb6S1LTL9J5/+
	daIOCW+BS61rohrmsbzfwV3otZUj0ZEVFFDD07icAbKd4RCEnLdIhxWzTzxViJMleaYTl2DtVJhv6
	Mcu0CgAox4e695enVtDDXXyCOZ8kwjeXgIA7uO7Zm8phQHrD/HIrQ+gtWBJSQR3Dwa8W2RhRyqC1U
	Ch35jCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEeC-0000000FKy7-1kit;
	Wed, 27 Aug 2025 11:49:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDos-0000000F80u-3Cg7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 10:55:59 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kgtv003981
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 10:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QrIK6tX2IWK
	GLbKUtBQLQ4aPT6fPCczMhEz00/Q0PUw=; b=k/fQwBnyW9PjS0ma6JrGdD3HiC3
	/Oo34XL1IZJWz3FP68nVd8oRghlU8w8+rRi/DxDOmcYKgfHIv4yc1YwP2PL/gWeL
	baOD7rBbumE4Tqaamwlh3g8hobuwZSlwgCApRj8T4fQlI0GxycGCl3Z4q8ZhR4B/
	JlqI0kQw1/nNit5XZYHKsxpHwRHzZs4wlBjcHg2elko/RwajKTm+RSPucxfgpHw3
	gmPFGxxi3EPKl/Ar15kVCdGaIRHM1nHHQGbAM86PLU9bS5XxCb+alHsJfWC/T82x
	UFwDGdl9/zusH2u/H7opQV1Lg8AGRjHG1SxQDe6gU52HnLqpK37i7HomL6A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x8cf2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 10:55:58 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7704769dbb0so3948567b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 03:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756292157; x=1756896957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QrIK6tX2IWKGLbKUtBQLQ4aPT6fPCczMhEz00/Q0PUw=;
        b=LzvtXys65pY7SQTrrqKmnuI3v/HIgkCwh4ByfrbMN7LH3bxn5HLCFU2nc2uSu3i4p5
         GRz5DKdF3MRJAPqSf0Bi5K2O9FtuUw0AUv2fcgtaC3xvofZoMrwsHwLojvgMUCCCgpc8
         OsCZ7aJRzPEyiSc7e8RVZ9GbPfH8Sv67MGLbaCOuvAW5LkozT6sjt3nfiYCRamfkLdZz
         O5d646S8QMW6+T3rcwj+TxOZN17P0YbirYe/6Ces3wRIWpal12piA1ghvFiSs0ElAWHF
         fOuuThvhcOHQBPiYOwItBFREVRygIrVLkdQIsV1tyAOe9sFgDB+ypo0emlBsh+MxvHcR
         jUFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVafJv5XhpjCZQml3q5xKpJL8aw39AS3HkZeCgY3Wdc2mUEE6zpzQUEHEuiOVfWQQm48s/c91f37nIYsjN6Mnsw@lists.infradead.org
X-Gm-Message-State: AOJu0YxYvq8ZAi07MjRWOZ0FT2u3sClqD5VJFqYGMpfkdM6bcfSnvNiJ
	4ehicr8zPjSgpdIgpsNA9Xf+G6eK2NrgQxKGAvixux7GZ3AqQl1RAksh84tX2sdd/Rgx0Jtpt5b
	2a53tNpfrjgQPYt85RwiymDo8DtWU5ALYUv9hcz+PCtkv++H/58qg3QIuayeX3d7ouA7MS0aBmg
	z4tw==
X-Gm-Gg: ASbGncthSOsa5Z3YRD5HIhtOPS2Gx/1woIVSmHXvleCeGD2W1s7Ls5rAd1tmjzXIcB5
	ns3txvTp/tu5ZE0c0A6j2YfIxMlorj3okqeRUT3yD+S2vRfDE/zbqlzTJo8amKPuAnsrB8ZoWpn
	9ynysRzfJEMrVIm3rEMMBBZ6RcZqzjGqy3aYVA/COgY8Um5SAQVulvJespd2Zx2gENWuEEIqCS2
	JAMfO/0zve+cMY8YR4wqUpTpEAf0+AgR5Fpr/nNhnVmMGzA6FBI0kaFeujv0WnqFRKeqJuGuzOI
	QiV9fmxe4P7M2EnJw1d9i3S/tfZ+GlZ0FVH0aPxTqophgI20SwBgIQyJQRT4N8bYqCHvOlo0p8V
	PvTABkRcvNTvSaq2+OJIA
X-Received: by 2002:a05:6a20:7345:b0:240:195a:8333 with SMTP id adf61e73a8af0-24340bff9bfmr31909508637.14.1756292157444;
        Wed, 27 Aug 2025 03:55:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyCThp3Fh3qi/ShzD68kw87pJ8DTWN/foHp2PaSMbiSxKV4gSMLtSUTOVTg8XBGz//N7OcSA==
X-Received: by 2002:a05:6a20:7345:b0:240:195a:8333 with SMTP id adf61e73a8af0-24340bff9bfmr31909480637.14.1756292156944;
        Wed, 27 Aug 2025 03:55:56 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771f2f2ac7dsm5573035b3a.43.2025.08.27.03.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 03:55:56 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 2/3] coresight: tpda: add logic to configure TPDA_SYNCR register
Date: Wed, 27 Aug 2025 18:55:44 +0800
Message-Id: <20250827105545.7140-3-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
References: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8XAAn1vCV9aJzgG3cHitr86-BFdTvFoM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX0nde/3KIErAn
 HF5vCq0SDJ0XevbzMc//RKOFsErBy6InNe+isTcuXC614ks4OK4l89CmH7mgWAdwSgxmVu8OMhP
 D05R2wPjJLQ34WmqCwqROsEzraEPdo1EFnBqbZqeTbQ2c90fkdY2PYuVYoy37KhRgqjLcbiGRcW
 lHY8cVk1kiLzmNCpUjd5rdYuZQJDIbjGfVIuu9XQXDj8QXObaJc14S7Pjuo0r30cxhednhYs/96
 KoZXEr5RynBk4Y30HllhalC79FKarynTNqL+9G90etApp5HgOleSHpLO8OMgb4Xd1Te1YjI0Kle
 xocbwBWH1AoXr1WLSuI8ErNsOhU+GhI86+FGiyskZNta1V1yk+1K5VP2YboWDmlrtUHAkgCLGxu
 +DREv90u
X-Proofpoint-GUID: 8XAAn1vCV9aJzgG3cHitr86-BFdTvFoM
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68aee43e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=6Dbyrv6SX_ztr3m6kfUA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_035558_809102_4A581189 
X-CRM114-Status: GOOD (  14.39  )
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

From: Tao Zhang <tao.zhang@oss.qualcomm.com>

The TPDA_SYNCR register defines the frequency at which TPDA generates
ASYNC packets, enabling userspace tools to accurately parse each valid
packet.

Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tpda.c | 7 +++++++
 drivers/hwtracing/coresight/coresight-tpda.h | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index d4d1def5ec15..a1393962b04d 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -187,6 +187,13 @@ static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
 	 */
 	if (drvdata->trig_flag_ts)
 		writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
+
+	/* Program the counter value for TPDA_SYNCR */
+	val = readl_relaxed(drvdata->base + TPDA_SYNCR);
+	/* Clear the mode */
+	val &= ~TPDA_SYNCR_MODE_CTRL;
+	val |= TPDA_SYNCR_COUNTER_MASK;
+	writel_relaxed(val, drvdata->base + TPDA_SYNCR);
 }
 
 static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index 0be625fb52fd..0c9bf2fade56 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -9,6 +9,7 @@
 #define TPDA_CR			(0x000)
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
 #define TPDA_FPID_CR		(0x084)
+#define TPDA_SYNCR		(0x08C)
 
 /* Cross trigger FREQ packets timestamp bit */
 #define TPDA_CR_FREQTS		BIT(2)
@@ -27,6 +28,10 @@
 #define TPDA_Pn_CR_CMBSIZE		GENMASK(7, 6)
 /* Aggregator port DSB data set element size bit */
 #define TPDA_Pn_CR_DSBSIZE		BIT(8)
+/* TPDA_SYNCR mode control bit */
+#define TPDA_SYNCR_MODE_CTRL		BIT(12)
+/* TPDA_SYNCR counter mask */
+#define TPDA_SYNCR_COUNTER_MASK		GENMASK(11, 0)
 
 #define TPDA_MAX_INPORTS	32
 
-- 
2.34.1


