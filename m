Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E88C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 17:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zBUsExIYKuDXmKfSyZ4/x52vF/DMlL74oBtWZxSet6s=; b=JF6jlcgp+WCekw
	Tfqd9vtniEyWys0cCZC9hHu8qtYLXF0JIniK4hs8c8s5fhmK9ab6+ekE5WUs9u2IUW2ipoQPVwJ6L
	gfNP/RHABiZ/Jn+qpHg3lNEvJ4Elm0ZpU93e8OVMTzvujrdXSsnSXCeUaQBJgxZ+lAf5Bn0tsGxxH
	UER3lDlrEo4qmY7xqRlzUGg2og689iRLEGMq+tVsOy7nONk7qob1bjwuMaRZv5Gpt2lhUm6hBRKFQ
	DqcjnJAykwceGdj5l/9MlpsveCL20uY2hhXVGsluf+ExrztyjYqdMrw+zK/sfWrRqk8H7z4CgYTsG
	2e472tPRyfc0Y1sOHgZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEXp-00000003ahq-1sdC;
	Mon, 17 Mar 2025 17:46:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEW7-00000003aNm-1GUl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 17:44:48 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52H9G871012140
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 17:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zBUsExIYKuDXmKfSyZ4/x5
	2vF/DMlL74oBtWZxSet6s=; b=ib+nkGDXhDhWrobH8BbDmoviUA3JDACnfQOOhZ
	/ePw/HhpiLikp8nH/uge02lZoZP6jYe57jXQiZItgLvRugfteG0baVtbbVFfd9JC
	w9N6awNVkyUz+QSm8FjtlX+raILx9C9h3KFYAMqmD5k+z2F98X5bBum8sLdUlErZ
	4StwKS6aZmsKzLbBSrRE3hzkgoiMbinP2Sez+rZtdBtTBHbE3kGMWeRqwFoaQwTQ
	KWfzcEHls427Ha13cmUP2fkdRf/gLGQ00lvVMWn4pzH+1bDhc8vcIT2/DadEESYC
	fg7y7NF4S+GagRqqNak6avWkteLOiTJjiKuE8Y24Z78VcYCA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1t4nhrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 17:44:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54e9f6e00so1023771885a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 10:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742233484; x=1742838284;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBUsExIYKuDXmKfSyZ4/x52vF/DMlL74oBtWZxSet6s=;
        b=RM/QrzQ57YjvSV3j9IHHT5yXCt20qTarYDb4GQiyruntFPz9cdcAOr7xVTZPeiYpG4
         4yp+F8GCPE6/KOuhurVPbnp2iEtikSu1/ktHiqstDo9uPprkN6PUEhbT5P3yap5ViHLc
         CPDmFmW/5P356OhnmJnyAty+x1ejrh/Vxx0CIgRrwYCkPXlCH5cEwPNd5gbP3YpxOpsW
         WQXORV3EfiZheIeGl2CRdwi3CmDvawjUXMab2Y77AhQXikLb0DaCk+O7cgG/GwpYj4fq
         FCjj60M62KbSYGtSTVtOVp1UjDFu/MUzm0pQy0fImxZb+Ga1fFoH4YlWK8mKJ942bQBn
         E3mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl9Q0jyq6zHcNsx0NxNO4p2Vtn83vua5R6Rq1F9nRgpjkiqs3GyWO7gWdYQBePt7vpyAneU/i0YTGyxZYpnCXG@lists.infradead.org
X-Gm-Message-State: AOJu0YyQJnT5s4RGHyI49BiqovBH+QU0aTTVMukpm+2CKbIQGYpebQRo
	Q42IVdOhMFuKoJqPVu5ZUdU0fOcPp4ERID9fvOj4SvDQysLtXOuipbYTH6lRTvIb6uWegpmn9/v
	udGj0k5Q2iJ8utFPQOA/DInW3gFfNLUaJdjfagY4byvu03iE/EsbGkV8WnwwLItzOwUqytUq3mg
	==
X-Gm-Gg: ASbGncuw0xsWRZu9V2PC6lSBEGbcaO3JZ6jI0QjleYDw7Wi6GDcgS3JXVBOlXXzSojU
	0bUuSzM/aXkqkEus0Zpq1iYMrzZ0+VNDzrjDcGqBwJYt4zvhMFQT5ny3QjCjf3RzXl7cyDAPfTq
	TfqmHIT70uwG5YBL8bL4zUW6vQlOkdGvAImptKRTWrHEf1cAUXnaBEqAdfV3Hh762Kk/mFfgrC7
	RHYaJKApKWho1LC5u4tL9c9Jt+FYJhKHDxLT+RwxfkcAYejWVs4cDeLFBmupcX4Plu7/jZI7spn
	p9pX/HcnBqc/Llb8V4Ipq9sHjI2XIOud9x9WGUEVc1N7TFMpFGxWDmlzQlxuiDSy9Gjps/U41CA
	8fjhqKM0GfWWGUIqhjTD8IQ04vyhC
X-Received: by 2002:a05:620a:248f:b0:7be:73f6:9e86 with SMTP id af79cd13be357-7c59b8aaa1cmr52555085a.20.1742233483597;
        Mon, 17 Mar 2025 10:44:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhfiwtI1vGLjeE5IzqOgUZWulx8wY4QyIkbO2lD/DD4nMJ83CYnPPjC1rh3t6m36OU8cMz5g==
X-Received: by 2002:a05:620a:248f:b0:7be:73f6:9e86 with SMTP id af79cd13be357-7c59b8aaa1cmr52549885a.20.1742233483171;
        Mon, 17 Mar 2025 10:44:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e9985sm16687121fa.29.2025.03.17.10.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:44:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/9] ARM: qcom: fix APQ8064 schema warnings
Date: Mon, 17 Mar 2025 19:44:35 +0200
Message-Id: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAINf2GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0Nz3bTMCt281IrSYl0T3ZQUg7RU46TkREsLcyWgjoKiVKA02LTo2Np
 aAAds/vRdAAAA
X-Change-ID: 20250317-fix-nexus-4-dd0fe3bca987
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
        Andy Gross <agross@codeaurora.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WXxJVR7u/eEtq0VSMR7e9vL+o9y/vFO1lbnUevsiJCM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2F+GxcQJgJPjISwSlnyJbUcpp+Z/ZtkHrXc+i
 O+VklGUppyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9hfhgAKCRCLPIo+Aiko
 1dhVB/9g6cVCpjmDg/J9cGILVCTRjkxcPbPm8giIi6XatiuGR56vsEsIU5fB1ko9soln8IvtOUW
 hvgRPcnX9nEblDDmkVgd2oEMoBbCe5Lnt01zbQfEBxaz9pbvF4WWM1/JSPEfwwuXWUS9H74b13H
 s3Yy9+fSI1T3s2xptLOYackhkkS9r4AdQ6yZpzFk+EJYIi0phcak/5+w8g8U2Jduh3DJsyVBu3S
 9otEv2EiIOabC/zYtEHlKY+iaxwJE6jTLfWMIUdB2qagGZiEhyKFX38LZrGtmAe9B9juuxj9er1
 pc7jED0X7+aHUn7Z4pWgEiSrF/GrWumv3k/pANwWAPIOY1vA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=VLPdn8PX c=1 sm=1 tr=0 ts=67d85f8c cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Xd_227E7yWZRqRJlnwUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: I4KJjQ50i0oc1dbJyTfxZsaRK4ksVtTO
X-Proofpoint-GUID: I4KJjQ50i0oc1dbJyTfxZsaRK4ksVtTO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=656 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_104447_476348_A123460B 
X-CRM114-Status: GOOD (  11.98  )
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

Rob's bot has reported [1] several warnings for Nexus 4 submisson,
however none of those warnings are specific to that device. Fix all
those warnings for all APQ8064 platforms by extending existing schemas,
adding missing schemas and making APQ8064 DT follow all the schema
files.

[1]: https://lore.kernel.org/linux-arm-msm/174221818190.3957236.3364090534153729086.robh@kernel.org/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (9):
      dt-bindings: soc: qcom,rpm: add missing clock-controller node
      dt-bindings: display/msm: describe SFPB device
      dt-bindings: soc: qcom: add Smart Peripheral System Interrupt Controller
      dt-bindings: arm: qcom,coresight-static-replicator: add optional clocks
      ARM: dts: qcom-apq8064: add missing clocks to the timer node
      ARM: dts: qcom: apq8064 merge hw splinlock into corresponding syscon device
      ARM: dts: qcom: apq8064: use new compatible for SFPB device
      ARM: dts: qcom: apq8064: use new compatible for SPS SIC device
      ARM: dts: qcom: apq8064: move replicator out of soc node

 .../arm/arm,coresight-static-replicator.yaml       | 10 +++
 .../devicetree/bindings/display/msm/qcom,sfpb.yaml | 39 ++++++++++
 .../devicetree/bindings/soc/qcom/qcom,rpm.yaml     |  8 ++
 .../devicetree/bindings/soc/qcom/qcom,sps-sic.yaml | 38 ++++++++++
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           | 85 +++++++++++-----------
 5 files changed, 136 insertions(+), 44 deletions(-)
---
base-commit: 2bb3cf7805af73af62ebfcbb55e350549b6a0912
change-id: 20250317-fix-nexus-4-dd0fe3bca987

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


