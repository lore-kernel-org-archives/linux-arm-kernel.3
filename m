Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43336C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 09:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=; b=YaOnTTfy8dzSXNWk8OKRVrUtgB
	D+i7vbsnysmVxxppuOyqugBOInn7fsbly5yYr/0bTiqvhdI8oAIOjwFp9cYi3J1QrT+aFROIDK7GJ
	4IHkkmey3G0pWgGzvtZbgpYeo+wYDMjDuXPuvjBBcNLLPf0l4mPNrHeL6mrKPDYMLmE28pRjtzEMo
	kfGubtxx/aRyEcSdIuiR6z3dkyjUxtKHuMMuzieASFc4OZkDb2Ki5OdeAl4zQZMuk/MkpCzhrrcdr
	ItLseKKDGSXFBlE5OGvG+0UYE+pR14ugbcmYQlh5g3DrMulF4EMx5EvWpt4lEwwahe9b2Z9AKbA/m
	egj7jPtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCy9-00000008jBz-1SLP;
	Mon, 13 Jul 2026 09:28:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCy7-00000008jBH-06EL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 09:28:56 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NcgI469173
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 09:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=; b=GIYxyBky5m8eupY3
	/FMWpds89QQ+q6BcylUebA41TWzsLJInO1OV4uQLUK+Iw09i4/MpKxJF7sQB2kQg
	UBhx9vwsdb9gWwC2Q0qG6/0GWNGkKIm0Pj91x84+ZAxFeoN76yv0L6PZEa4u3L3j
	z2BpAF6AmoUwyXQnxIl0ZV7pTEkBWU5Fq585FmzVXuek6zKwFW/XHPhyFhvRDnxL
	yYJdlAD2G6BipExsveIbR88kzyvWf+DwgYhVYZgnCMRd5tmicsltPKq3fXOhKhf1
	fNVnCiZ6V5qjHpK4nAA1gJIB25WIk7rBdI5aufxkmwnR9KK3qvzUlNJDsItx80T0
	zu0fhg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf485dr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 09:28:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso1608995a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 02:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783934934; x=1784539734; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=atPkySsWv5XiEktMKU+L7FD2X73fdpByuCrYTKPpP2fe6hcdGCW3Woj1TJ6JUjDvLd
         j6RY2HcoueDAfBOEL0Z7IsrHEN5WEyq4k9QULMpwOMXsSBrHvF0+bU+a9H/6XeqwLpL3
         VB/SsFg6iIGYzIkf1BikYBSxPAbVsNc7eaLwbfPazAhMttV6gCrMwzvYx7+g2A/q5i5M
         wlmLozApZpDGqPfB6j2aTnhq9PrsmPNqZjDW4Y1bv3ocZaf+AkRaZVseDdZwZvp/zhMp
         f6yFuyqjAqxu2cVqEsjXesPxfEuqK91Xh/ElxZh3mCBhfKU8nATnA95470CsH6nIoPrF
         rIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783934934; x=1784539734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=Vw3frG+ordFdeyPhbFDE+3IMU4woa7MVh0tA3cKwzAoVN2gfV/69E1OvN4osUSVKj9
         hHslTMojcnPWiBMgPES+fpiGgwf74NksHvCYoAjerMG4RLVj5btTJ1Bh0jaQq0N59585
         43PBN+sfvBVZl326PBhbv3ekkMIE0WJZi7cimA794x9ZDK4RsiaGvN0CpjP30Xc3rFWs
         3g3EB61M5MsFJLzSNro2bmI0HJk/6pI9wyTp7VwWdplsFdrNCR+7fo/DFAumKQj9t/jb
         +Y0dFwz+ZL80i/baPDgI5OevJd4J9Zbz814gDY8kcyzEPb2lURrZKfW/WlWE/puFqgaP
         SiEg==
X-Forwarded-Encrypted: i=1; AHgh+RocIeLILkZvMqeh3YbKcrj9RBV/ue6Yvs46aHDpLiY4H0DJLdSb68bl4iiAVn9+wFEuBVjU9g09vSL29a6zovL3@lists.infradead.org
X-Gm-Message-State: AOJu0YxxRkYO2ryQyjT3WunDiPXtsfEbrnSwYlroJh6hBF//2AX6CfKj
	0+aMc3JprN/rseOQ/RNFFz0KbH9/n+mxhAB1kdNPjWsoh5815GYHyvSr9+FQSYi1r9Ck9eXE9eY
	x9jp/TsXq4YGXBT3hqXvPRngVaAOWYC/qZ0g37855CGnZ5bJlRExpkx4Bv3DEEE0JAAXyE6vxRO
	MhOQ==
X-Gm-Gg: AfdE7clPC3dbOdjNCFNZhT6rBC2DSF9SIi2bLOfU0PKIKmQQm0PC0oHDpqpOf6N8dwm
	Q1SEYXLXffQB6vmIipJ2boMehNaRy8edTA3/LWGf+UVmoQRjjZ1Dy86WQAKnP2XgYzjFFJ882fq
	oipJ6XE5fS6iekZkLBVp0zMgadZN3cOXs5iPtQLahjc0FmGcd25/Pi5aUWeBO0VvNmv01Ip+pw4
	ziFIc+dHdoatZJJyg7RyUt9LUBv7bA7RveGEXUyBcUxsOHJAtUJCXOs1k3DhI5vDW471H7YihNS
	mATyn6wCOKZz91XkXmfXOaFJDugPFtFlR2YO5r/KN85TUwn0AIlj+BnbEdNbHtdZ7MMrqHBTgTQ
	K1d64UrQrjjk/dxXk4aew1HeZ4kGWVZcIyJBoR9XBbw==
X-Received: by 2002:a17:90b:3d84:b0:38d:dc13:6f94 with SMTP id 98e67ed59e1d1-38ddc137054mr5567322a91.37.1783934933936;
        Mon, 13 Jul 2026 02:28:53 -0700 (PDT)
X-Received: by 2002:a17:90b:3d84:b0:38d:dc13:6f94 with SMTP id 98e67ed59e1d1-38ddc137054mr5567306a91.37.1783934933515;
        Mon, 13 Jul 2026 02:28:53 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm47495569eec.24.2026.07.13.02.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:28:53 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:58:32 +0530
Subject: [PATCH v5 1/6] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra-camss-review-v5-1-db53be15dc4f@oss.qualcomm.com>
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783934917; l=1799;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
 b=+t8Y8RcdzA2kLv4JripQYvKr9E0fZ7/IV7iHkNwE7x1Q81Z3ydtjnu0AhACBMTPXnbayPkTm9
 ZDCRrTDZrY/AXCpFjUng8Y6HC6anxDMgvAUrsXPlzZIGB4EelIZRIOf
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfX4GIN3M/cv8ep
 GsGM3Wfda1Cao7cc3pDnSYBOWROQUYx/U1j3/70Mh/Ivkm5W7aT1Kq7SQq4mSl6xMkUcwzYn5f8
 iswELmTLVnWcEgzo/eA9BW5TqN67g/M=
X-Authority-Analysis: v=2.4 cv=OsJ/DS/t c=1 sm=1 tr=0 ts=6a54afd6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5OCBTYWx0ZWRfXzShTCDnSh45q
 HkNu1fDGPDdapurEQqyWqz+r5OHCm8UbRxNwiUJpmE4VxpCdlIP8uTYD8ZCsCTBPy4x9ME3Kj3c
 GW3KSYLtwX6rlFusfZsDGGW6FFSmk1zLgrgtr8AC9t/CnUqdg8tPN8G8BPeHlPIBqzeSGeFYELV
 U3J1AB2SYv4IuqxU6QfcpzrRD/GuNo5z6EsfMs0tv/hWlW1OS1/tpmL+SDWJuPlm/YI+sv8eEyq
 ahfp8+xiRq6XHtcs+hcyGmiTSGgXfU9bgu/0A69EOYpDEKfKUy1Y5CDQPNiN66EukTvA104agqh
 LXK6ra4WWp7gmiiIWLUavT6K3sJUZmMEUwx+KTTJL7DKCe3A67wscKjrsgHUTKlp/YIGlq99rXa
 AdSS/MgQsEEYxgNRWfpCczK18jwvpqOHQkaqcGJWbEi75Dz48YOv9UyJ6wdz3gMnU4cbTLaXSqb
 Gle+DW/d1TZdafz/8TA==
X-Proofpoint-GUID: bW18wio4r8E1WO7BJG61u80PyDBgU3vh
X-Proofpoint-ORIG-GUID: bW18wio4r8E1WO7BJG61u80PyDBgU3vh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_022855_075065_FB67690E 
X-CRM114-Status: GOOD (  12.88  )
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

Shikra contains the same Camera Subsystem IP as QCM2290. Document the
platform-specific compatible string, using qcom,qcm2290-camss as
fallback.

Unlike QCM2290, Shikra omits the CDM and OPE blocks, requiring only a
single IOMMU context bank instead of four.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss.yaml     | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..490a7f3a8c5ff9c624f46150ee651793811823de 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -14,7 +14,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss
+          - const: qcom,qcm2290-camss
+      - const: qcom,qcm2290-camss
 
   reg:
     maxItems: 9
@@ -76,7 +80,14 @@ properties:
       - const: sf_mnoc
 
   iommus:
-    maxItems: 4
+    oneOf:
+      - items:
+          - description: S1 HLOS VFE non-protected (VFE only)
+      - items:
+          - description: S1 HLOS VFE non-protected
+          - description: S1 HLOS CDM non-protected
+          - description: S1 HLOS OPE read non-protected
+          - description: S1 HLOS OPE write non-protected
 
   power-domains:
     items:

-- 
2.34.1


