Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5FFC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 08:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=knUnYiygC/glMirhYnFsBNISXjfP0z20npG9dhmwKMM=; b=wG/yh2tLjskMZeIFv8SJBp51S0
	4ePZpRlLeZ0Jy9wEFw3kH4JNXwnE2GI656NfDyaiTEFH5Kd++XLnEkEVPmaMrEeHEUAFYrn2Xe0GN
	54nSmvaVCk4cVOg7i7i6D5Zl1lnweot/opzMqMv801ScejDds0ys3JpK/0uAAnh043bE2SGDVOHHH
	3utIHp3VrOAlSt3v9dWBFhb/AxCpxj+JaWS/3F94DDsFlJHBakopxXaM2uXhu0/nt91vAe24ZDSry
	H5JNjeZcuf4HDtUuco1XbJh/j6PR3zWEjWvJjz5jN9uk15iFM8aZ3NvutwA62Zef8GiV2igfF2MSW
	2mhb/Kmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZHS-0000000Ebgg-0u9w;
	Wed, 06 Aug 2025 08:13:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZDN-0000000EbAW-3ukH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 08:09:39 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5766P57U030765
	for <linux-arm-kernel@lists.infradead.org>; Wed, 6 Aug 2025 08:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=knUnYiygC/glMirhYnFsBNISXjfP0z20npG
	9dhmwKMM=; b=Hewp2yjevG0elzb/Zof7MlkZNhDoXAm7hnHiZ7Gw7jsWIr3JNZT
	bCZeKtAieTgWvpX8hEv7esFEPQYb+U4kMc0EeQ8sea2hMqA1TXD1xL28t1de+xZ5
	Njk5lMf6djDj5qAnB4rwHIVHDFjLCkMvJYKLBqk+y2fuYjwuxLtHnwDX/QT6g4Wa
	ZSeenNdAcRYDV3qyWs44UR2CGfT/cQjIvf6ejiqPsI0TOPpwmvizFop4T+DCud/N
	CdieQgtUs5rt73x2dgGmOLY2JF8w9430lyJJFn9pdaPpA3nusVN+Uub5B25YEbVy
	j/pBkbj0sD2Yjc8X0r6FAusfLM3MRBiUiNg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpycsvjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 08:09:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b42218e4a59so4400176a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 01:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754467776; x=1755072576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knUnYiygC/glMirhYnFsBNISXjfP0z20npG9dhmwKMM=;
        b=jR6tnCHVKN0mfYIXeYGH978M4qObmXtL7rs1s4fA5AdOpRGxbmG8TbEWanoPDmvZa+
         ek7DJSU3x5xaZohZhBGdS2M3pwqGIqQ6der8uUMMRiQ7ihi5hIbEMUfFo22QTT2xhqe6
         8PZ9r5ymFz+reewgn5m7TpNvoI2eHVoJ5Z8m8oU5Glv8zOFINPw4akDoawuWKcSkyXap
         /TB0qQ8SxRqD7AIlmYoe2QzTwb939gUMZKEyaRE2jQNJawJbkXOZxrxC7DVQNFCeBt3/
         +eMN0RbCueAz1Q771ojdVnqe7bFLRuJLWG9w9mwYyPyG+d875KK4YV89aHhrHTEhdCUV
         Hx8g==
X-Forwarded-Encrypted: i=1; AJvYcCUF+uoYUMsBy5kdjKPzjG0PruG+ywYqybWLQodxEUibFUS42UMmI6p2jmyZPQCgQojt9VykZC8INhZuAUcos6dd@lists.infradead.org
X-Gm-Message-State: AOJu0YwC6YLE21TuDWXk2Vnzjez2KHUHlEVvtuku8Ho0WF4C2cWG4INM
	jspnQibfZcNPQlVlL/esQW8EdCcwt/PP9dCGm8qDtn5RrtT55eAJbYF7eG4/Ri91zLKULnieK+Q
	SGAfuKFJpnsaP96sqyz/bkbrEQbx50h52kSk3OA3jz0V9gzOwDkBBI2ZEsCcijac4FeEcQ9oeV9
	SfPA==
X-Gm-Gg: ASbGncvxPDjJ490fqO1AAZVqTAbu1ItUsqRE6SV4E6DL+dJc6CAjTmZZHznC3QhkoB+
	iQ4wbyF+svPuirHe1MQFXIxJxhulmLoUn36YxcZbIeIEEOi79ck094/SR0mglXrlq2M2IVvL6mH
	zMg0dV9s5DxS1ojWa+YHqRNxO2qOy4HyVMkgqIjzLJeFxfGVM/un5HjD/QU9WCA3NeNM+3Eu1mz
	g2WDw1BPbnq0zx0k10Fui1H7axwQROkbXhUIVuUZZy5qtdSsqcN6OG3dzGKEK4Sl271t6cTQSWw
	plI3DDi830T5zc1vi8B/nqE18qm92VDxkEx4qowJ7J9bTAHMqoq2/m0cEOrIT5yQYr8M4YlpQEQ
	PuosoW7+Y+sj8sGpmtBc=
X-Received: by 2002:a05:6a20:1584:b0:240:1e63:2dfd with SMTP id adf61e73a8af0-240314b5221mr3282863637.29.1754467776491;
        Wed, 06 Aug 2025 01:09:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO/5kf0TugUCngV86DUYMPF7cCHvVqLqvFAR0R+lx9ixwaYadjeYK63pbWIUa3NO/Pp3Vw4g==
X-Received: by 2002:a05:6a20:1584:b0:240:1e63:2dfd with SMTP id adf61e73a8af0-240314b5221mr3282829637.29.1754467776090;
        Wed, 06 Aug 2025 01:09:36 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce6f319sm14856195b3a.18.2025.08.06.01.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 01:09:35 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: tingwei.zhang@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v1] coresight: tpda: fix the logic to setup the element size
Date: Wed,  6 Aug 2025 16:09:31 +0800
Message-Id: <20250806080931.14322-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _kQ6k43xTl7dCAJHthkC4EBvvd9nBWta
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX7+fTDV8sd5lW
 pLGgfKZOvVJHTugyqc75UAHvzL+86CX7aCCyv3kmo67n/iru+c05hQ2a3avKa5zA5EFDuglui9q
 l9rd4cD25Ng4vTk+dvGzJ5BB/tVFXid4Duh2PD4TqPHN0daXVjOd08Xzun080ly5QdEIcgw++7k
 OaD9Ldemi1oWvgH60fRtX1TWF6zbIQj+WJRPWCJA0bqXvmzsqP+RE5s2nx0soPU5qnZl/5BN35g
 s7r0BrySgXOe4wSq/yNOwntisP22YXXRzKt5jrI4ePORsz1Wl/Oq6OLOQ8p5z4zt0d5Rs/QvS+e
 vWn5ixpAO2meZ4daSAoyUxWlweGvjkCTosUsCW4mDpKsIlFAsKbP5e3UbG6b5Jd9+5dyIeQP0ti
 95dScjiJ
X-Authority-Analysis: v=2.4 cv=JIo7s9Kb c=1 sm=1 tr=0 ts=68930dc1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=eYArMgjR2MFx1z2CNlUA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: _kQ6k43xTl7dCAJHthkC4EBvvd9nBWta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_010937_971393_CCDB4B58 
X-CRM114-Status: GOOD (  15.74  )
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

Some TPDM devices support both CMB and DSB datasets, requiring
the system to enable the port with both corresponding element sizes.

Currently, the logic treats tpdm_read_element_size as successful if
the CMB element size is retrieved correctly, regardless of whether
the DSB element size is obtained. This behavior causes issues
when parsing data from TPDM devices that depend on both element sizes.

To address this, the function should explicitly fail if the DSB
element size cannot be read correctly.

Fixes: e6d7f5252f73 ("coresight-tpda: Add support to configure CMB element")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tpda.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 0633f04beb24..333b3cb23685 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -71,6 +71,8 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
 	if (tpdm_data->dsb) {
 		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
 				"qcom,dsb-element-bits", &drvdata->dsb_esize);
+		if (rc)
+			goto out;
 	}
 
 	if (tpdm_data->cmb) {
@@ -78,6 +80,7 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
 				"qcom,cmb-element-bits", &drvdata->cmb_esize);
 	}
 
+out:
 	if (rc)
 		dev_warn_once(&csdev->dev,
 			"Failed to read TPDM Element size: %d\n", rc);
-- 
2.34.1


