Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D9DC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 10:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eE22PGjBKFzGyDFVc/1k5HN/ro/sK3VY71pEjKRjj5g=; b=ILcJV9StUcXoAMEl+lHjMDL3rr
	aO2DDUFAuUkGboQfZKt8ebzvq/Z+I/I/D3WiqpP//Qp5oDK+qG9KCR9LTGoBgNzjqnzyvmKZa4/O/
	TfcbzXevUeorINf+MmoC6U51GbEnOinkzYBMzXTgbVwXCJYdLzLZ7c2j12tiJu5lv4wzhmBKFqWSv
	iHUNqIwcTZUzepYBk7CBOasYAdHCjMOkST9S78NDklqFMMgLGZsRrQzv8fvl4r6GfzqrdtSqmFhFM
	30dHClEvBb5KD1oXMT8adJ88V2HXbTnr2PsrEFvoe6kPUV9cFrT5DHwLJLLllWiqHkchqTdCRSlzO
	xtD/ySQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU0TM-00000005FZT-3PGe;
	Tue, 24 Jun 2025 10:01:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU0Qs-00000005FGk-06HN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 09:59:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O8xQbr022985
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 09:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eE22PGjBKFzGyDFVc/1k5HN/ro/sK3VY71p
	EjKRjj5g=; b=GqT359pfX7b7whMgZwF/L9obKTwK7y6qBY/6WkZPNHrSGrFZe/9
	E0F82c5Ljd48IO1e4VtYF9yJjo5jRO7JHetqXehhNh2+HhjWKXkMSNBcMDqc5Qch
	QSl7XBppGg8Zpn5g4RA6srb2eqaYloDhxeO8UWd9HSC5pXC/jDvoTz9XyFE44jiO
	JXVI94LWRGtdFPKuhwBtYlf3UXL7TpolOL/+BRwkzQVuS1ea7TZZc/GrZ4bGs9mT
	OH6tYrKbaXT2KbZbgzDEqe4MX0jowFkKVKzhdGCKy2jMJt5/5pIb6fPHR+D4Kfjd
	vl9NeCCSeib3X3fW+cyc1c6R0m6TtcHPfHQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgbn5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 09:59:12 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-748f3d4c7e7so4165148b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 02:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750759151; x=1751363951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eE22PGjBKFzGyDFVc/1k5HN/ro/sK3VY71pEjKRjj5g=;
        b=dDrrYfGYmZYgtpotpA+Rr1UiQAvEi5e9YnsjJylJd3EqFOq8Mbu/cugguQBEtvYDpf
         FaNrZM4NVwZ90eepWKeEc2/VyAey/UhZ9oIJgtlM7HLHW0xrnNTTngQJr469Kstvv5qP
         EVlvM10v6nHCfoPmiz6iaM+LnQ01Jv0frSOg00GYoEvvwmD8DSpGGAsf0RrIcIcjCIYO
         T4hErwbM9wOOPeridprEK7ru1GpDYDgtzTFdP5Wc+ayW39WzYc8R8QKuy3RdMaqP/bI+
         91LsPW9LjCyBiRlti8Pd1rzxAJVQWsuLctpvgc5/y4OUjE913GkHjPzFxthuCGXX4Qtd
         KsaA==
X-Forwarded-Encrypted: i=1; AJvYcCWwGdhSw8xjyI/AnICjwZY6UqHo2PcwZfDMwC/3W7MmBS626QLhonukwJnwVFzv0NpvgaJ7F9KBIHPekeoxMHkW@lists.infradead.org
X-Gm-Message-State: AOJu0YwW9Pa83cr86r06ikQlw+XN9u8aJM4CrdVrLfrbrqGQ0ZvFvVcW
	UbnfNPfG5pRgh4Gvs1Jcc5snqV+4AckGufGw637UKhopaC5uz5mJHaxZG+J5D5XX6JDizXQBdA8
	oTMZTCO5Ra8bD92/I8SFSOdxdjk9fervcWZyDne0DtTTZKcK5MilA1Xgfp5C1pda0O3VFKt1cw1
	VRnQ==
X-Gm-Gg: ASbGncuHRqVEA9hm/LnM4bXf1lLoHyucyKi+DtntluM5dRCqFfBsXQhuLnQrOVD8hTU
	mZ/lc5nlHanpnHm7t9Sx2IY9htIiHQeus1qb9J/beoWM9BMcNT1omKjpLULcc8tlhw5WcTSNfpv
	aTAcT4JQo+EXzoOWBH/KPX6fTHFTfMJNwyLjsYBgiTK1OeXJY4tQKK/6FmDl7UqpiZr/U+no5iJ
	Bi8cm02vnOWT0nv5JM6D3ijlo1vqIjbTz4sZaGopKllKxq3+TZnBglHuD0JXyREUsIw+fBH3s7L
	/VmX8L7WfhVWnOfmoKd3JHLiIF9IPhLDaxpn1qG4I1h3JpRu9F/wTqqASar1DdWCNon6nEWr2EG
	1tw==
X-Received: by 2002:a05:6a00:1804:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-7490d6636a8mr25041532b3a.4.1750759151617;
        Tue, 24 Jun 2025 02:59:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOm9pE/XE0KCyZahincUuLaxeNo/FZ4J8obLA+YEkBc1thYs8fF2DXtsxLOS2iwxdoEPqTmw==
X-Received: by 2002:a05:6a00:1804:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-7490d6636a8mr25041505b3a.4.1750759151248;
        Tue, 24 Jun 2025 02:59:11 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e08ccfsm1456443b3a.6.2025.06.24.02.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 02:59:10 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, jie.gan@oss.qualcomm.com
Subject: [PATCH v2 0/2] Enable CTCU device for QCS8300
Date: Tue, 24 Jun 2025 17:59:03 +0800
Message-Id: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UZ_XQQm0vHqNlOn6XpuejFKm42oIc4Aq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA4NCBTYWx0ZWRfX0k1tuuCtDIcp
 3sgx67+vAsXcrmc4maFCyeXajKSa/bfRpACY7CelOUh9yldV3hR+7ZoeWsucsi4wXg70V2IIZMM
 wIh0gnwTfNpHbczt3ds1bgoMEUKF+kL7/3IIS4ra4J48SQT98j+WtFZCVWuQtxUPALxiP2huht2
 ljLTx0fp7yzl4tmHo6ZMeC7C4fPynDSe4KZ81nAu5/O8XrpAPZxytmRvXYiSZ0dHEz8hlKUBpPV
 +1Qcq/l1ZZJRjHhBA2y0YoZ6hqhXrOLePai134UqgBlND9QbxUcVK5R2CEh4+Fbl6ZSt0AT3kjD
 kE/1vvWj4FY71eY1je2bbjl8RuZ/Jc3dYA1OG8swKaWoRMhqZ77FVYZoWn/S+JaSZL2dGd9O0+v
 rMPML4cK8OwAzVGuYPEfmatyoqajWZtEgnl6CFCRWWtRc+VzI5B9xbyNP5iyDIYBRfehpdcu
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685a76f0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pe-aGEEqWberZWJlMgsA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: UZ_XQQm0vHqNlOn6XpuejFKm42oIc4Aq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=895 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_025914_178913_045FB924 
X-CRM114-Status: GOOD (  11.65  )
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

Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in binding to utilize
the compitable of the SA8775p platform becuase the CTCU for QCS8300 shares same
configurations as SA8775p platform.

Changes in V2:
1. Add Krzysztof's R-B tag for dt-binding patch.
2. Add Konrad's Acked-by tag for dt patch.
3. Rebased on tag next-20250623.
4. Missed email addresses for coresight's maintainers in V1, loop them.
Link to V1 - https://lore.kernel.org/all/20250327024943.3502313-1-jie.gan@oss.qualcomm.com/

Jie Gan (2):
  dt-bindings: arm: add CTCU device for QCS8300
  arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml     |   9 +-
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 153 ++++++++++++++++++
 2 files changed, 160 insertions(+), 2 deletions(-)

-- 
2.34.1


