Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64430CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QVPq+6JkcreslYPvbFLt1vFStJtpeN3cu1CStIhk9yM=; b=w6Ry1LG+9upWXSqKBroWwBQZlj
	wCDg4leYbVI06SN347pc+UftE4kkzADsX+C0EREPkhxWi+bL8MCFOPgzCVy70ITDou9tk4yIwRjlO
	m8PwtwIYqbJALLtGZXYBpobp0+/YAFPp3TnSwLuQM0abGltqo9QfKCkJcUlB0eupfSxMa8KVDTNiy
	TrYljLVAyzCPnLId5uqfjb6M9LBvDPkDvmou1R4z6tm+FoBv6TD6SAiBH2kP47EBp7P1ApftmmSDi
	6bK0egJ67pU6qCj7KFyj+JG8TsuR9gccfC35zTAvq8czegiTkpnlY5/fnMZYnxOc4/U+AJX54yrAw
	9c3r/h9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEgJ-000000078ir-2vEQ;
	Wed, 10 Jun 2026 08:53:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEgG-000000078f5-1iHv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:53:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7i2tc3151943
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 08:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVPq+6JkcreslYPvbFLt1vFStJtpeN3cu1CStIhk9yM=; b=I5zLGlEhNhmMArLo
	xScB9BRdbFxzmPwZiu6nYT4n9EKy8qkBiIl7X2tqvmDQdasx1daFB1a2WsbqIBaz
	E9W6LoJgrWghQoN0uqjzfAKCqSMKGzsh96zMLtNOnOKrmBmjbVv6ry1KjpTVqb+7
	gN8PuVsmcKXrb8LuULVDj0+qB00zK/YJBQMgpmbAlTSytWkf4el4/K1bA2Fmo9Kk
	EXlgZry4ktwTcf4HGpVQcyjBVcG9y7XwO1+ziuYVxA8jen0TECqSjG6AWpM+40RJ
	1ZOZmLNLyHPUqgWQNM5xaMQ/mhRmWi/1F/biFcmJMsFDeNlmqwuWQMvqeSlCgRja
	4ExBbQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwneskv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 08:52:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c32f4b1bso67320645ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081579; x=1781686379; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVPq+6JkcreslYPvbFLt1vFStJtpeN3cu1CStIhk9yM=;
        b=BIcHDUZwPOZk5j8mRRJDznXPm1/nkRD5/ourqSrUwQOrXFgKaOnQci8jGRpo76pQFD
         l6gs2SZGgKUZf8PEsJk6eRdPy9xVpHWFhOaf7uUsJc/kaDe2swb3mV92M/2qgygWVGRh
         bZ1bipKLsum6ytHhBNgiE2blFeP16x57/IBigy6Sgv2u8lU8NSMRpGC4bhMFf9KKJRqL
         CTvIUeIy0rbKRgyOZYsProCXXO5HpcS7LIMhr+X7huvbVPTkJJJIWz/1u44fId4JPqpT
         acVrVRVxmITcO6MWCi2gT1IkQzM6AxAlmKIf/e69uaKTD1rikDQCf9sYca7vXipUt/pM
         d/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081579; x=1781686379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QVPq+6JkcreslYPvbFLt1vFStJtpeN3cu1CStIhk9yM=;
        b=Ige63X1NzJQj6SFTOJYWFTe0fYq2k/a2mLfFMPu6k9/jhWgsl9us1Skgt/7yUtyJpc
         1uVwKGrxPhVCvuIk68gRTijvi6QIuvjLNSm0U6onhzktwcsueKBpmbQG8CesLMmVVOTG
         bI/S4neXng0TzH2P5eSBw/3JRXwA1KfPxyoaZfKeBwEU1eHcEFrn0gDLMGJJGaFyo07Y
         Fq+D5N1+On4VYaDKagvt5dk+8hBKmGHGIBAw3sBU671PvQeVnx84QHHUKQHs3oS56uGP
         YngYnvPgMzHHxFgveQm+ohMDc4twovGKzwNpWEhVi0Y6NgfVlImFHtJTC57vfYqG2dkE
         ObpA==
X-Forwarded-Encrypted: i=1; AFNElJ/gPC8Dr6snC/ssOdo2HUxYK20J5oNJCggcoRqitkjRkg8xNFvDrgBoQs0E2iHTc/sKxiiMMfY0IZpFG/Zxatgu@lists.infradead.org
X-Gm-Message-State: AOJu0Yxse266eMLI5zF5wg20yYCdPwn0ecGOnjU6kS5v096RM3dSJ0ym
	s0t4QCabDdfVH/IqCvd7JZBoBgBa7INecpJm96wwIkN2cF7wOHwfbMbTCak0RlbcOmmT75VwQbT
	eoMFxQ+4B51mUWKRLT4LlTmSb4+HhasAMkWGdR2KlKerJT1eFgP1RI0e3JENJB8rosdS6usL+in
	P4Zg==
X-Gm-Gg: Acq92OFRslXJ/Ev2BqSPFvL5PUblJudoBaBDTcnaf4l77eCLWqfNdT8RMe1c00U7Uyw
	9WD7hd4yXWLZDxY76yoxkTcF4kwiMVwR+AY+hP6DTYNOirStMBIZmVFi/7ITAFC/VMLmzgfaH7X
	/Qg75ftnNzg4XkyTqdHevouemgR+vxa8GB6jaXpVQNrVQEW4GcH3xP+PcPAc7AyWWQQOVzaNjKI
	Fq4d9vx4jWGviib8BJyIyA0wJuVuUrS3WDjD+iOK4l4Fgxnu1UrWMjmwV/9/ZSqkTzYw/L/C7va
	0H1PbhJpyHlOlPnTbdtCPyYc3TY3Vn1DLIn6PMaxAUYk6W5aTVoeDmDXDpbsqIus9KTLPk+jovq
	KhnZl5xTosYiHSyIeHrP/UJWggzcSgg6rEfZcKkR11OyCO5z9NxFlyUDVP2KELwJaByQGMJ8e6r
	EJTQMOtqh6IV6nF0SEOZk+/dD3vLjXfskUz3F8HUS9lPBD6KQKsW7T0JsAOnY=
X-Received: by 2002:a17:903:41d2:b0:2c2:1982:5270 with SMTP id d9443c01a7336-2c219825471mr224351735ad.21.1781081579147;
        Wed, 10 Jun 2026 01:52:59 -0700 (PDT)
X-Received: by 2002:a17:903:41d2:b0:2c2:1982:5270 with SMTP id d9443c01a7336-2c219825471mr224351445ad.21.1781081578690;
        Wed, 10 Jun 2026 01:52:58 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm114618175ad.45.2026.06.10.01.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:52:58 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:21:36 +0530
Subject: [PATCH RFC v7 9/9] arm64: dts: qcom: hamoa: Enable
 LLCC/DDR/DDR_QOS DVFS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-rfc_v7_scmi_memlat-v7-9-f3f68c608f25@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781081505; l=1003;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=pXpBJ2FMnY6lmbenFJPBDk6Hui+mpMlqsnwiYYUFJmo=;
 b=uT4AQ8s4GwpWbVI++rigQjrmSyRqAQMCzp8wBbLKhIUF3mfkUffjvFW1pE/JgbPI1qyccp7MQ
 4sSndpiP+qnBIfJzgN8ufxlztds4HuRMkws/Lip7QRcUDuuys14yYEs
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-GUID: Wx4wFsU52t8XpTMGYImtq3ZJyDwqKnl3
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a2925eb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=8E_iI_7X9U7aA52Mj5gA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Wx4wFsU52t8XpTMGYImtq3ZJyDwqKnl3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX/7Gg9/b8RvxZ
 ZV4SSBBqe1k+NEWdwnIClbZdvZz5lNPirxQP525At0BI3z2ZVwAYMpXRWOVQdFmU8WJHmZsLUii
 c4+v/p6xuW/k5VMUhXCFLvocgjc4jzAYNX8Q+FPOpULZ/USMCJmAIiwD83ZMKGTC5cLu7wnPjxT
 yy997F1dTqM7RQkcy+rNUnifQOUmJzlokHX2QugPKQ3zC4l8giChoSjN8liJOlrBRDCdRsrNJ43
 SNYdDvLUhDhm7foDlLPSUxVFR/c28nChSHjUYQPqvE+wfIrLcRqlBNP0vgbuYNluZm7yUu3fKBZ
 81GTn7O7uO+ETXDwYGvyo7qGAy5rSYSDqkavQWLvIlpMDQWwd7uqc3XdGDY9VoZTk91JjC9/Wuw
 O6gryPkrx2XIxdggaaPDSceyQHE/6OvjqSisL4YpNUc6ox+UBJvZU0KbK5Wm/yKNoFUk/GkcTbU
 N1FmoqUdmNvX/tYAd5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_015300_478790_6D0BAC03 
X-CRM114-Status: GOOD (  13.36  )
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

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

On Qualcomm Hamoa SoCs, the memlat governor and the mechanism for
controlling the LLCC and DDR/DDR_QOS frequencies run on the CPU Control
Processor (CPUCP) and are exposed via the QCOM SCMI Generic Extension
protocol. Add the SCMI vendor protocol node required for the QCOM
SCMI Generic Extension protocol to probe get functional bus dvfs
on Hamoa/Purwa SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4ba751a65142..abd3e4bb9372 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -338,6 +338,10 @@ scmi_dvfs: protocol@13 {
 				reg = <0x13>;
 				#power-domain-cells = <1>;
 			};
+
+			scmi_vendor: protocol@80 {
+				reg = <0x80>;
+			};
 		};
 	};
 

-- 
2.34.1


