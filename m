Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AE8CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 23:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=isKEQzfxss1sYjk64yoM6hVVlanKUUPiN0aW5OP9ozA=; b=MGNfCc2LppSoBM9/e6KH4J/vID
	UuJ0CS3Mh4BYfcojmrx//qC9qiMxEYvL8AtMIqbITZNy2YP4mMtlS4DuktAqB0rDd/IxVLdDe9eRs
	2b24tSQDr9lqI1fELFppx9D8a0jeTB6bzPaCIOqLlQNPRHljO7tghetWCflvoJp1nsWO97aTcsYAq
	gVWaWai/7OGs3gTgQO7uWx55ucjWC0xecPDZTzf1cPwlY8FWL92/G9/sY0EdZqiC1udvHLSijhYYs
	fsPM92ycUnOyDPAQTwoEbkrksPQnGHlIxmY/n/dIBf5BIifmd2qeQotoe5fJl+mza167hlLfKeGw4
	GRO+Zf2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ZM9-00000004sZC-0W0Y;
	Wed, 24 Sep 2025 23:57:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ZM3-00000004sUS-1x7K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 23:57:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD5INc021489
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 23:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	isKEQzfxss1sYjk64yoM6hVVlanKUUPiN0aW5OP9ozA=; b=YT5/si8KhXNMZX2T
	aHs1Jv20X4rPpSuqJFJQf1wRMpf7N5oYFWcKaga1VLr4NskpsTnN7trpywqJyUeQ
	bO1R5lWKu4yUaGpnMtQKRswLPX27qqvAOFW3iy48VNvpO0I6DCFGrp8EsW/bfDx5
	UeOgnTNtuaeMshMVREFEMq+tR7f5ug23iKFmvELINIwf5WWaNHsrJZ9/Is/qS3sm
	IfC1XSdYRRrtdRZWNUFqeS8NMkMpYgH1JbbFLZ+wTrhpWyla7tGtIGEOQ0oYfQVE
	fNeyaxSHVp9k1hi9irhTDhXoAnuSLBLUqpcOrZ0f69tl+K+5Sew38MFgAzsBKmN9
	z4E2Ow==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budadn8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 23:56:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24458345f5dso4009845ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 16:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758217; x=1759363017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isKEQzfxss1sYjk64yoM6hVVlanKUUPiN0aW5OP9ozA=;
        b=PEHLobEF9XPgR83ftNwZHIk3hxb7BPbuhUqHjQfw3mECGlttRbGhgW40fPss8bTZae
         2iRF36+eJGMEc5HaiVbqEnmip3g9R3IpO1ILmG3cFK0SX7xkUy5X7ndRWhpX7SWmN2tT
         +2Qf/lkzcM8aF5w4j0o/Pqq03veIXIPx0IAzcOrpLDIlTfURJ3YgKZmACCWK+ln9vMed
         IDtxY+pkCP/TVGuqP2DoHr3U8cUTWs4IaGkB0gS95K2fQgv8C04RujgrTcI/3bWJLANX
         aDbZIluLc1hRR3lhJclB86H8LgqPb9sMV8cSP0JarwM68STvIIBLYHNJSMK85kVIbPH9
         8HAw==
X-Forwarded-Encrypted: i=1; AJvYcCWCjGux/OlrO+CaUkQmx0ipphBJdSEj2MpDJvmh6hXiS89WSYINhtW3ec4gVfEk3VZkZDcM2gBn1l5CYkwBxWOJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzC9SsAZPUsm6K1bg0FpNm73YOzBI9m85Jlpz1vfz5n3eWE7r1t
	rWyltS7nFuzdJf4N6Z3wmWYFKXYBCLoq5gNKlbhFIIUDj1Z0XvB4SMl+hx/UT7TW2WHTJvrfTbj
	ZKfcGx/MfPA7Uly/L8H37lLzf/ffZLoZkGpur6Bcq5FEy7BIfW4JaYwMq5HimF4UjPbpAbXjzH0
	M3uw==
X-Gm-Gg: ASbGnctFoZYC+kHAcxni3cP7V4jRGMPTMu/00K1sSOZu63f2Zats1rCCfNM1FY7nCIe
	xcSeae8c0GzV6nt8AskaGylIXXK1Qu0Ij4d2UynBIHBBUxK2jLdeDMROS6epQUWgHvK4AxrscVV
	xOWLB0W60wXiVLx5t4AVNwspZhgGT7SHzaAUV+c4rp/Ya0MYJWANxItRKKWhop8UmMJuGyE5BwW
	9yTw02/zsNvXT+guBcAnGiJ0F41YqL8i0vLnO8x8E4pHKwJEip8lgG251RTSjzf6ePWvrp6sL0x
	FGOyeKSIaT96V/Ybo/rMaW3ld32SYT/5JQvyKYPzmGxxTZsEtgwmcO03gvUELfEKsQnP+r9cC2I
	MPbMKBphZkGVgwLw=
X-Received: by 2002:a17:903:1a43:b0:269:8072:5be7 with SMTP id d9443c01a7336-27ed4ab368fmr13745595ad.56.1758758217272;
        Wed, 24 Sep 2025 16:56:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFehxrPaJqcD0zoFcP93jMpuoqnmCDC66PekYT5ca6v2kR3j20bFF+ZvrXw83kR+NSWs2aNaA==
X-Received: by 2002:a17:903:1a43:b0:269:8072:5be7 with SMTP id d9443c01a7336-27ed4ab368fmr13745185ad.56.1758758216782;
        Wed, 24 Sep 2025 16:56:56 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6881fd6sm4557185ad.87.2025.09.24.16.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:56:56 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:56:43 -0700
Subject: [PATCH 2/9] dt-bindings: clock: sm8450-camcc: Remove sc8280xp
 camcc to from sm8450 camcc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
In-Reply-To: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758212; l=1045;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=7G7QgavjnI2PuDqM9mUeILw47Kp6A2VPBmjnh3LL6As=;
 b=Omu47EnR+bgkxUUTbhFMWZbUJ6KHgo0C4uuRJDAgZ109au6Ey0JVTAUiJWM1osKJ5naM/Fl1e
 xl9N1vYgizlCbxAb3FevdwA+lT6Pr52Ad+E6Yhe12SYq+lpZg9pSYPq
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: YolbAafvKOe7LkV_ZZPDoW_C2urStbo8
X-Proofpoint-ORIG-GUID: YolbAafvKOe7LkV_ZZPDoW_C2urStbo8
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d4854a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=2bVdrMdO9wEKqzfnleYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfXyxCqUIaJBVLG
 gjgSPeq30P8rveVQ+zbvQk5ivDwRdUQtM2Gkji89q9EfX7hfewQlLljwtLYxzPhF2KY3Qis3p16
 dIs3TU9G16mqSwFBIlOnaYJjwduZY5RAuJJ/iQh+7+WqVctaabe3yJ5EtTdxJSDyIqFEBb6f8tc
 tbCTPhntXX5VEYKtPffP+UYK3p6KI7HvisosxVxpBQoEG0SawxYSnG6VjRu4RE9h8J/QV4xKWY2
 /qgjl1v/v19ZsQ49kY2fxA5HMqrDljqwnHoC3pG53TjmApVMo2GThsJXHqwvzK3VJ1/WVJgQRQK
 q6fph3X7wW+GhwS1cYHpIEKLSFy0jOwP8qe0IVOQhSz+gqtfR+sOF+Fd7uQsjdN68IjB7jtuPNV
 /CZNXiXV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_165659_630841_0D3FA89A 
X-CRM114-Status: GOOD (  14.01  )
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

From: Taniya Das <taniya.das@oss.qualcomm.com>

SC8280XP camcc only requires the MMCX power domain, unlike SM8450 camcc
which now supports both MMCX and MXC power domains. Hence move SC8280XP
camcc from SM8450.

Fixes: 842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp camcc to sa8775p camcc")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index c1e06f39431e..dbfcc399f10b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -63,7 +63,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,sc8280xp-camcc
               - qcom,sm8450-camcc
               - qcom,sm8550-camcc
     then:

-- 
2.25.1


