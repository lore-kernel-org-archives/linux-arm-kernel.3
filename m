Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D23C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 01:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=; b=WdRz0GtebQq0YB4qyE3DObQxnw
	xdu27Kd47S2gZR5Vb3DXpuJcxtGqVgZlaCyuTg7Mcd7M+4i3loXeIV5BhLVZwOCPQnjvovmFsiekX
	rIoGhRdSH9lu4TwV2mEEVQ4E1ZYygvP0nkoGX6b/NAkSMJFwO64opEqRibRbsircPRI3oI26zo64L
	r26SGE+oNE/2vGzWX9ZPYIymNdg/INAJnUv+Qj5TxsidgR2NZgXEQfkGm9K0dZN4+7l8hkEmYLJAz
	RpOBNM1zI+iwBMTa0eW36CgrnJYXrSYPpZ0AX6Vc9dNUKHH2E5bcwLjqRPXG05m5RWK504+Qdlph+
	vwLxMqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSPE-0000000AhVL-1wKv;
	Tue, 14 Jul 2026 01:57:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSPB-0000000AhU1-1K7a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 01:57:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E1kNoJ3259724
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 01:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=; b=GdFVVWf3TfbkZG2Y
	ZEXDFOc5++40fuiyQx0QM26CIhBkbPxbkOTAxrl1R13hRkEf6SdW7hR382NN/Q9j
	u8QJQxoFBsgkejxOhShH35JHCc9NLcn6SbNNLR5fRdV6k3pFfzGtAdA4uMMKKLDC
	QEAER7IIPXw5fH9e7RPre21/dFWA7vCKQp6segHeHdOiUsSIxEt6RvbVtFzs4366
	dvQwbSUQob1LThKD1mbuzp9OW5MJ3ZsPQ/IwOllR5XTY6jhahurQ1AjFLtvX/hy7
	XCg15Ao9QtNAf0JTY46Rfcx37sqY9Ek5q4oEzsxGrJPup26xAiiOjBXCQqCPzYbj
	T8UoQQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr48107-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 01:57:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8aee88725so5402922a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 18:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783994271; x=1784599071; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=;
        b=BBSKtchIQravyjDxJKlxIpkhAXkeg2UNLgHsYuQAlXNgFvbLwa76vLXz5mH83/VPWw
         QG0Ud46vVzT5HLkjyo1jfunkOXwPdSRavDs7X1uwUsNNUwkSt13SpcJUx1wcxEeixNzh
         ggLxDyo7xGWQ3eUu6NHZ8SX221IJFrJvg2jIid2ycbiBgIM9r4BJoWuEB4XabToMXSVX
         vyUkkDUdXGDo/ArkH77xo9v7Ca8PUEhOe1adp2W3/2dRXi7aHi1Ho6P5+Gb0KgEma30E
         t3Lx6TavLNhzFODGNmHoY7kqgFWjVe9tUSH3jXMvQS6YLWp+ImF5CVuY4jyql5QoyK/t
         2EQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783994271; x=1784599071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBIVcQAjVYYsOGfglxOehsEMd2HTp/k3lvhCVhd/5PE=;
        b=gOLNIRBHx8J9hcBCXRW4xGip7mcbuHiTrG0IT1vxJFeOsZDoUuQ2RkUaAyOe/mBft+
         ubsbz/TkklqO8wiIkznVYetK6PIrYB5Rbsg+evVVDEZ/x5A0M6KPa5rV0MDGDwSarhyF
         FZoHg9Xa2LKvpbm/DagwzeWDJP/gxYcn6a72mrAdzMmT8CzKcT1YbBM7INf1XI4tyLII
         hqbu+aGJtGuSzF/2fDH16HustVFWadmpRjju9iB1Fq/ZT1JV2oAxSxdaavISTw7Hv4Be
         IU5PjeXztSsbo/Ep354cDDuJzk3WRqCA+cGrPALMstBXsxM+FK716F2OpkmhI+W0TumO
         +s9w==
X-Forwarded-Encrypted: i=1; AHgh+RrLhaAJbb5vTkdtQnMHBigqoW8ThXSI2FeZCLJN+qxqbv5B/VVWGYwOHHWT7SSbXp/jxCTSSTwDT+w5xz/xUMrX@lists.infradead.org
X-Gm-Message-State: AOJu0YzhjJ52K5HWTErEDhAb5IyE84od+vE/jCQn5EcaWi3BtUhICyMG
	n19q7rO3jJlwJz+mzS/ctSgTW0zF/rYoyC0LJbuPeZWsgSeCq8OlamWDQim2Cp+ICEVgXtG+GAs
	cT0gusawROTQHJfZQQuxcTGQ8XGYLsVsEjCjJuTwfes+IYqkJenjGJoKaihZYbktHS18trOC6A2
	5+mw==
X-Gm-Gg: AfdE7clgJqtfcqBOKIgJ4RSQwJKFO0buYOTuzIQ7r74fA5gRXdDcdguS0ji2bs9/z47
	fbD+lGwYxiB0VBZtKi3Y/yzlzlR3W9sp97lkiL0mTJrHB0wK4zaLFQoRgfJbn/WVwR5TjMiplvT
	uBvdk+sM3Ck94i3O831wUHGP2zWO+uCJOXdq2DSO2Gmp6b683pkeH+es7kDQ2lv1NWVaHp2Zb8O
	FP0JI++lCbJUgUXMr+ebTn1JMYSRLUZZB5NVlQz4EN41n6jN5eC2qmmH/k+m1fwu3Tux43t9rsj
	5WrbkTIbOxmGJG+61qp20QtZaxPfAf9UuwLuhrUu4AoRbCZwBPzj3Gv7PcZ1AKiwqP3wh7nZAjF
	9Tv2WHFT5MC7o46+DZZe9qxNbcgy5lX8a1HIP9EOXP7nLPUHCWbNbW4kmFs7Frba8Wxs1S7JHMw
	==
X-Received: by 2002:a05:6a00:2d1b:b0:848:599f:26b with SMTP id d2e1a72fcca58-84a5140f5b2mr1435673b3a.14.1783994271263;
        Mon, 13 Jul 2026 18:57:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d1b:b0:848:599f:26b with SMTP id d2e1a72fcca58-84a5140f5b2mr1435657b3a.14.1783994270836;
        Mon, 13 Jul 2026 18:57:50 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f29ed3dsm634191b3a.27.2026.07.13.18.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 18:57:49 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:57:25 +0800
Subject: [PATCH 1/2] dt-bindings: arm: add CTCU device for shikra
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-add-coresight-nodes-for-shikra-v1-1-b1cf85962455@oss.qualcomm.com>
References: <20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com>
In-Reply-To: <20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783994260; l=948;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=tQRjjrGLQhurhoVg6JDZIViVv0b1R+8JttaNXtHXaZg=;
 b=dFnReCQgB1F4kdP6N3jOcn2Ya1eg8bL+kLH+qKY8JJP5w1AWyBHlggG7AXiRu9hPYu4/4MrrW
 LCjAADl1NfFC3xBVmDM6Iq1YOeuluTQfFmcIKhbdK2sUMjdi3FMnmzm
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: 7dDq02NydCL_bqw1EdypuOn0VGqw9M7r
X-Proofpoint-ORIG-GUID: 7dDq02NydCL_bqw1EdypuOn0VGqw9M7r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDAxNiBTYWx0ZWRfXww2jtKtlKbdp
 3w6d5/AIeTOx0WC7/i81l1S1EnIoXGl++7odZAi9nHNq9ZZ8TBGDfRM8EFlapvbjQ0Mz9k4p0Sb
 zlm2CJS0dEJANafQdM6zxqr8mfuHmanlpSyduFvBLV3jUIMPUsqOn8YjLNB/QcSdvJAEMfv2RPR
 IqtOi8twObahIuTfkMTvcyigi1QCdRch8Pl8SOZP3QbhVxbJkX50OHzuWs8kNAHYSUuFLShqVOS
 Dsm47SSEC+/797Kj5yhAg4g18/4ufPem9jPZBzZt1kocRa45LrADDy77loPZMWRcK3/N2OirYao
 Atl7mtqMkLM9cS70j3l4jdBKRgncv6xRRA0Z7SeQNA7s7rWrFbur8X1jK/9jV/IHfu/SxY6aj34
 GKHIXt/1fHQawLDBoq94ceQMaIpro4m8SOZHyBSZpVZM34iFKakd6/1pg/GJQdLB3Em6RQ+d2uu
 gTYqRyltqGY5eVYIqdQ==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a5597a0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bwSPl2VgRa2lNh99CM4A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDAxNiBTYWx0ZWRfX29ejaLlEvmpH
 uM+YQmG3Jaao8gfsPXnJoLIbfxte22Sxjxdf+4UIppsqyE3A1OehIN+CvhJrIwa1NdUWTt+2Cp3
 UmmvLophkPRWzIHWTzN4yy1+jok88gw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_185753_478212_5DE0908D 
X-CRM114-Status: GOOD (  12.89  )
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

The CTCU device for shikra shares the same configurations as SA8775p.
Add a fallback to enable the CTCU for shikra to utilize the compatible
of the SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index f3f3feac4ce2..335a8e1a5a9e 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -32,6 +32,7 @@ properties:
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
               - qcom,qcs8300-ctcu
+              - qcom,shikra-ctcu
               - qcom,sm8750-ctcu
               - qcom,x1e80100-ctcu
           - const: qcom,sa8775p-ctcu

-- 
2.34.1


