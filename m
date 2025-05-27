Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEA6C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 21:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8gIhfclnLH073VsLY1ttHA/tXRnGUkM9HdwYW3xYCyA=; b=JA2H/4ORoK0E9ryat9GJIJcCoc
	hXtpVKr45OxDXrbV89u33oBY6cR9FfpPmUhdzfnmSlOfTL19xakc8QxYcsMGRPTRpNubH9D8JEgXV
	F9Pks5vXD5AyjQFo3qlZIzJUdbkpM8nDxpl2F684uRALpHbDsRtrw9C1mmNwtKPZbizZtg9/Zjmbl
	KUdDmI7y33usObFf4wNVrYnTxfd5TaTbym0cFVwxfmIt0p6di4yTzs/KIQEH2boG5I59ge6knDJ0d
	T+O+xniWtT4yBXbVecn9Oto3lWJ0G0N7Ag5HOZ6ZCClYpxizq+vzMAgkC3JQ0rMJC+v/9u6W7n7WA
	hYdXujVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK1cL-0000000BaAD-1IGi;
	Tue, 27 May 2025 21:13:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK1To-0000000BYs7-2eNU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 21:05:01 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RKMIjA012389
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 21:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8gIhfclnLH073VsLY1ttHA/tXRnGUkM9HdwYW3xYCyA=; b=FEmTkq5ApBPdiyy7
	fYfR93tebQ/gtSyFOXu9QDIhyhgfbwvc6f4hTt2Wm6kIecV/JYbRXGycx+Eh6suM
	MHaef/GAhoUyd3z7Fy0l09g4yLPwaZeGfU3zp+JLI/vyh+pu27QRoN0ckzPPByNO
	mWw2yZieD6yxPQLqZ72AHmDkq8Si6nEfvWhZnsZSGu4IKJlx80icxvPhkdKJjMmf
	C+P0znTmdcovkywfsnT2Mplic/KYKztLXEcdV2PtITKXgAiZ6t90wZwfftUH1X3I
	1IF0WFfn1k0J+B2ZMR1tBNc+drLGFYDwYLKETg+XwARFFsZnGWMoJ6Dns8LjlR1W
	ttVgmA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u549g7br-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 21:04:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7425efba1a3so218281b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 14:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379898; x=1748984698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gIhfclnLH073VsLY1ttHA/tXRnGUkM9HdwYW3xYCyA=;
        b=HKrnezG0M3TzX277JVEYNyAOz0ltbKc4eGdN7jeFojMkZZAn2NgnRsDMG8M6Pq/6Sc
         aKjqD7yaN5D+3OWq7I4bTSH9V5Q4EEZVhKSJH/zSZnm8S7sTaDZYOfJHyeChh1AB4QKT
         r2FUHPal+acdpxxK+054sUP8wWRpSEahv8z0JcggW4KnVPmv6zhFamJ3avKbNdfzV2HV
         16Pfq7lrNDmVvn63cMjkZ363O6zOKNodm+mlYy6cztZzsbSPO8qdzGNZU9Qj7yfhgO+m
         r6jH1fQ8kUFm8HrJvQFZZN3TdVM80jCy/uuHHYDp4rZp1bprrswxxCUkrBb9eMfAZf4j
         BWWw==
X-Forwarded-Encrypted: i=1; AJvYcCV2Jca4BOlNGQANqshwO8hj4bMNglE2796xZOUCu8tLqFscx3xsQyEBtKV6cqfV4WlwoNq5J1Jpbb1XVw/9AsII@lists.infradead.org
X-Gm-Message-State: AOJu0YyMhbGD2OLP156P50p2py5hUcuy5//letqF8SnVgCG4ekCHjbs1
	9Ip5JOiO9yEH/AlGZ6d4wRqSVs0abI7uqMEB0NUWhbvikgXnsSwLDLvaxZh3au031da6z/RXn/0
	aK9fP/yPdUZRqTDoZ2cNGXGMu6LzkFENvErZcsXjWeZmM3MTTM1YkHfsnnA866EXnT4D9C7Yj10
	sx3/AqvMPzDQ==
X-Gm-Gg: ASbGncvfVjvRA0UjN1EO365ilEDtaPCyyZlSW08libb+6VdP4QRM2WfYu+YeAfiVHQH
	wopaeao3yNRM3GjuAnyuqmUPX8Y0jWqDa1zFv2n0abc3zWja9kCYB9MHN8XQLnMMtdl1jS4hppn
	XgLhHs0AzyrKosQl2hPokz8p2paQX4+LkBkHq9/2s6d7+i1RZSaZ4CeQCsMZJJZ5S/JOzZRgGlX
	z69aUOZPy5+zP/vEa7TJdqM/Qu+OmPc8hMAdJQhXtwd7UeA2iqur7bx28/5bCyAhIYL9owzebVS
	agkMwGV3TLDyrLiNpbFHMFTbKysFYfaTfIzVsJcGkZQhM29kr8v5qtram25/RNZ/J7c=
X-Received: by 2002:a05:6a00:3ccd:b0:736:4d05:2e35 with SMTP id d2e1a72fcca58-7462eae8737mr2671745b3a.3.1748379898177;
        Tue, 27 May 2025 14:04:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErVuSX8VnhDC5c80QonelHr5ry9GAhDcphlE+t5DRrIAcd4JLsqfnIcR34CNcLszXepePuHg==
X-Received: by 2002:a05:6a00:3ccd:b0:736:4d05:2e35 with SMTP id d2e1a72fcca58-7462eae8737mr2671698b3a.3.1748379897734;
        Tue, 27 May 2025 14:04:57 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e64836fsm29167b3a.26.2025.05.27.14.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:04:57 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Tue, 27 May 2025 14:04:39 -0700
Subject: [PATCH v6 03/10] dt-bindings: usb: qcom,dwc3: Correct the SM8750
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-sm8750_usb_master-v6-3-d58de3b41d34@oss.qualcomm.com>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
In-Reply-To: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748379891; l=1199;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=NhOsYBi6tADTMUAiHJ0Qk3HAGnZPId0WGmI4bIdXuV8=;
 b=lobSYcFGVwh8sfpUcLjkgbtPofAxzVDKJAfkDY2FUYjTHx3YXT1XBfydR+LmUIt7NbMLEs17M
 4Jec41PnZl5CSCqn6HniNcEqQYvBtscZOhyooMC3wXeStWPigeWIgmT
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-GUID: C5eszCYPcUcv6_jCZ8hF4c_f8ucsB3JD
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=683628fb cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=qiVRAF7mJj4RLuWAUSQA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3OCBTYWx0ZWRfX1bEmXq5qgY/B
 gwsEiFAOpMBL7IfyVuyGu31r+96GELhBKIom9CPGXMOKBKSCb3AN5rRknSS4S6SN6Pn4Mo6l96F
 y0qIHjI41DaatQRiRw0CLaiR0ouSi88CQHIt5Zy+6EzEGBfaU/e6fe5Q6vLLj+Ll6dZZjRanRco
 xbllyEn6BTFsLTQmQUdU1I76JPgyFL7BM92UMNOw45LMV/ECWoEa+I1PA+HlAdLNaQLEfiECc/S
 Z07rfe/16BVeJK/313NE2j7acp+gggzMtKz+nKQlQJ0I56rfvldMLJFxdD4Wf/m0x9X+D95n+/X
 wLV7BJ4VlXpuM8BRI4uQvbj1QR2W8wIylexM/9an4UFE48p6XbpQBgfuvTzKC+RAJUseqQkYLxn
 Y4mmg6tv7Z4z3jh0EUVJCMiP0Ts1QNzuxZbTNcAqMuch0QQk5MC7eaSNRStzSSEGTeNI3kzX
X-Proofpoint-ORIG-GUID: C5eszCYPcUcv6_jCZ8hF4c_f8ucsB3JD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=548 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_140500_813181_30FC81F1 
X-CRM114-Status: GOOD (  14.67  )
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

SM8750 does not require an XO clock in the dt as it is the
parent of the TCSR refclk_src, so move the compatible to a section
where the XO clock is not required.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index a792434c59db2e6ba2b9b3b8498ca43f0f8d1ec4..298b1472ccbc4cfeb04927da29ea40b9883d03eb 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -227,6 +227,7 @@ allOf:
               - qcom,sdx65-dwc3
               - qcom,sdx75-dwc3
               - qcom,sm6350-dwc3
+              - qcom,sm8750-dwc3
     then:
       properties:
         clocks:
@@ -366,7 +367,6 @@ allOf:
               - qcom,sm8450-dwc3
               - qcom,sm8550-dwc3
               - qcom,sm8650-dwc3
-              - qcom,sm8750-dwc3
     then:
       properties:
         clocks:

-- 
2.48.1


