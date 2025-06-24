Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1146CC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 06:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEd0bdzHNq+BYGf2pvWM9XNZngsnetWAYruQNmk3PFE=; b=PHJJrKnnFHesfSwZ5nlVYe0uel
	hWAcFcfe8ZSg4NQnDdLKAySZ4hjAgPV40w5K8B7hYIM3ygxGczN13MWIwXg9CI3S2TkYaeJAUf3+a
	wjapKpkcNpr5iVuMlDjSQP0xgCl+7Cxbkj7wMx2DM2oIzW2+K77I/DG2a8pB98ew5rEu75lzw04+6
	tmKdKDNCrDU9Tb4EHHk/cNwldSmY9p9VJ1IxKiGkYbFMSiQJ4oEJsnEeBIlml9bGc/Q8EmQkaVS0L
	6VS+/jU77zvL1xowNf9ppfv3cKO3/QHTFyZaTCYZwCOGlk0IFf6WUH7T36X4CG/eQRRi7FBGY/X7F
	gwGYPW3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTwtK-00000004kEb-2vxp;
	Tue, 24 Jun 2025 06:12:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTwm7-00000004j7R-2XsB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 06:04:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKlpA5022985
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NEd0bdzHNq+
	BYGf2pvWM9XNZngsnetWAYruQNmk3PFE=; b=iiNcGhzMZ8TS0FOfsVcLD+w+QEb
	bYnUIlEVPMnkQer7sJIXA/g4O3nAMq+vRVN2LfghQvBn0D+V0Zj3E7t+jsD5L3Pw
	Mv5mgFPXD2sGGEYcySuu1SIo+WIk6O5FyOftob7y+yc3XIoIV/wtGWETsrbF+iH9
	+fQOKeRD03d8SAngv2gMGTikDy92vbeX9NCe+oSRtNLTI+DXgdKPRVk7UppuKmuQ
	7/u9PFP2g9Qs6gkrw9JKlvS4fWiDKIC0l6JlyRZHjXwZhQQN/yhtGv8cshH7zQGP
	CAYMjFSfK4Fxh7Q0ILpchN5fcp/L0YqnQU+ckd0afAfRKS/Mk47OLq0PsWw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgb0c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:04:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b1ffc678adfso46021a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 23:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745093; x=1751349893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEd0bdzHNq+BYGf2pvWM9XNZngsnetWAYruQNmk3PFE=;
        b=jUeW2DR9UcQRiGTS/fKE5o9FbcQcKusBRx61GJqribfr8JAEXbYVFQifjb0ZdjzWZt
         tJgtilcuVI4fT5xES/l2BAkay++ghNZAMHiS1YShA08o6zoJFDg0R57dWgSnJoEZtmP6
         Easl0QT4sSz9Q3Xr8F+0X/ZtDVazfpUA95/VQGtT2BDnMXGftweuOzA7m8njrKPx7pCw
         JoibK0z4jJObVbWxAoXuZaGdHjV5qELHOx+LOKu80PY++3/cUBA33AHI0SqiNG35dUXc
         WKYTQ5FANc/E2TmBNozTW4AtF+wIL5ot7jyR8U6dkhzii6/sg1sdQlP9tgJVkDilo+Kh
         1REw==
X-Forwarded-Encrypted: i=1; AJvYcCUa3ZBOn8CfM9Ti6PxJ7GyMmy1W05o500JhDjpxU732ni0xtfzeuyvx83+NmCpf3LSGRBoYAWzrZqK2xnnm4viZ@lists.infradead.org
X-Gm-Message-State: AOJu0YylRYAosP7TyannYKr1E6aqY6LyPyYrx0QE8vtPK0vZw3faVBmZ
	jv4ufZcPDCJCWkrjCqQH/Sg0CabYrbgienThK0ejInduVOZgrjNI/ZQ4EArxAa9msHSEsPQO2fZ
	GyhEtPE1bfpvuzq7aZHql3Y6SmafkVC80b+UFZGZ3+2oWdvqHIGwb5foqDhyKEENvY4YFMSIuw2
	CgKA==
X-Gm-Gg: ASbGnctmZzj4tUbi8vc1CM4oFVH/HmjpeNf5hLjmxXQm1jM7wCgDpiJJNyrmZy/H81l
	yXMXGk6Pz6XiFJk3czAkYwhyLWiPEUsbBMNgdFsT66puPOkHFxjcjVNHZn9RKAcbhP90uq38vbB
	cFYIKpbx9/YMTyjkbgLnIkB8ykWbbOsqlMmD+Sd90A0jmA7DFaUpJTEMz0H9omsU7Cf7qcitAi7
	6NYYG3bkLzXr64cmGLX2ZqYeGvOuQHQE/JZ28o0QHwi1Ceuc3Q9RYXXiyGcOa7uKhvJuxNBp/fn
	autWvZQbk/hd857J5zN1VzA+PWEu8RR9GvzMiujOOOqwqwlaGEYSETexUnuSKR/RqKMZHugcGkF
	yrw==
X-Received: by 2002:a17:903:2a85:b0:235:eb8d:7fff with SMTP id d9443c01a7336-237d986d5f7mr223070755ad.28.1750745093286;
        Mon, 23 Jun 2025 23:04:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoXzDNPCywsWid/86csyo6/oaM8zIDmOlMe4ad7FzFQmavchj+MmL8XVQyf1Oz3B2TnpP03w==
X-Received: by 2002:a17:903:2a85:b0:235:eb8d:7fff with SMTP id d9443c01a7336-237d986d5f7mr223070365ad.28.1750745092828;
        Mon, 23 Jun 2025 23:04:52 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:04:52 -0700 (PDT)
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
Subject: [PATCH v3 02/10] coresight: core: add a new API to retrieve the helper device
Date: Tue, 24 Jun 2025 14:04:30 +0800
Message-Id: <20250624060438.7469-3-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
References: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -hR_qhzAwDx3vnob3st6ArkvjORBBV69
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MCBTYWx0ZWRfX78qZGGvryrAH
 E8kt5juDvNa7MxBRcCXpYqcKz57RvKQA/kdUu757eQF9xLQzSZ/Ajg8297I0CpVbKBXbYbImlgb
 Mbn74SaBG1OhqFK2OKf7CEuAuw1o52tWJ+HHVCtKwD4Zzm7+pc7XWH88G+N5C5UbJfaKS8HKpqK
 4UmYpVY1EmNrjF2mf/wY0+hkRPfYZrHZTexJPaVFLWTxCpENkZuNS8dG+DouCbDMYYoJ02l+wNK
 F8XkUmCwbXfEHGKXOkWPcxthlSlcLyTMcyH/JY4g4vwVz0Rjnnn8bM7jDr88EUHwdkdv6iJYK3D
 8TGxzqks7NYH7EpFr7CJgI7aF5uzVMjUr+OjJDIBxHJYvNhTtYLODYZ6WmTd9w42efLVs5FYqSX
 Paj7BYx5WlOXIae4pkvY59SfD6k1Fo5Hp6X+4CoMwUUWhsppfsyrPXzDrE/lSzXg4gcZqaUg
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685a4006 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Bv2r1u00ER1ubdDhqu4A:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: -hR_qhzAwDx3vnob3st6ArkvjORBBV69
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_230455_765043_D2EE9897 
X-CRM114-Status: GOOD (  18.39  )
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

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 30 ++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-priv.h |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 8aad2823e28a..c785f8e86777 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -579,6 +579,36 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
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
+	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
+		helper = csdev->pdata->out_conns[i]->dest_dev;
+		if (!helper || !coresight_is_helper(helper))
+			continue;
+
+		if (helper->subtype.helper_subtype == type)
+			return helper;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_helper);
+
 /**
  * coresight_get_port_helper: get the in-port number of the helper device
  * that is connected to the csdev.
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 07a5f03de81d..5b912eb60401 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -158,6 +158,8 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
 int coresight_get_port_helper(struct coresight_device *csdev,
 			      struct coresight_device *helper);
+struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
+					      int type);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);
-- 
2.34.1


