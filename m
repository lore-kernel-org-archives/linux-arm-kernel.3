Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF52CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PuMgbKDOyQwBHJzatzWciwXjmsp+q/nFMV9PYpQ10wo=; b=zSdA3kTGgIHGIsjnfeJ0l0z6/F
	C6WjNMNCWwUdaVYb/3sV27LW4vDEIjW9liP4UMbYn+tuQEqqJS5T+b+0jeQC5HiL1VWn3q4yXSARJ
	KhgQS4V8o1Fb63e1qVDbBSZNDduyFbw90IcQqOmHoNNdlMQJcyBD194WIUPMPSwDqNJycYqUKbuOv
	jJZtY96FzBfWRVHd/GJc7yvapMgu5ItpB7eWbtv9JCe/+kVeFpC5rfo1Zg67Q+ncM7OOBRUTIFSwg
	KqtTSVhf87PA8xaN1I5POuyfmZjkEsLKDaKTatO5Y4Z9VBmUK0hdbJkmcThc57++byiZgSKaoYsbl
	9r30eEig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWadG-00000003h5h-1ZBu;
	Mon, 08 Jun 2026 14:07:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWadD-00000003h4U-2Zbb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:07:13 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRAoa3340126
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 14:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PuMgbKDOyQwBHJzatzWciwXjmsp+q/nFMV9PYpQ10wo=; b=CP5/pt2vogFQ9/zu
	BY6AKFYkcseBG2tu3CPfUAFZ/QYkVNlP10oR+YLVDZHOTf9L+GsOkjMPy/zi61yS
	z8nQV4eRLst/vM78FFTqmKYXr/nVsRNxdjJtu6LKcRgqGaJmO97iGnuft/dQJF3k
	x2FwWNsM2ZM/5rAlFjdSXY1ZX/igNCPdpYzb9rSZT+j0w7jjm85UN5tteoKAyULn
	fp452DF35mf7o9ZhlFPu0HhlnvCSo03diWfzkHLHAp6lHT/HCALQOCPo8O6y25LD
	em08AWL4V/dMGe69kRjVJkVTaExdo7mgwg4mvHA59QhaPnsu9SSDMXehUpmMtX4x
	RSUqCw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m0m4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 14:07:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf32259e0eso58880755ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927630; x=1781532430; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuMgbKDOyQwBHJzatzWciwXjmsp+q/nFMV9PYpQ10wo=;
        b=P6gPRPh5uz57pvm8wodo87OpgZVkRxTc2fTier5DN+OmZOyxmbc2fAyvXRZQzCjV09
         GEHJZ2ZS8yDk/mjQ2qpvVu5lvidWbnY5mxB82J8Q8yGPLUeeY43YuiDYcW7P59VT1r96
         Xp6fyGjE7PLuTLs6uwuOWcQmNADnfIkd2tbnq5Zmd9HdDst2VWiweUIZOsFEpPbJqOfz
         iO+9jTIrqpmQhCAKEekPUYzEunEfxN2oHJGhEzaPJ8Pb7ixKBicnopDqdQk3iATA0+HE
         TZ+8LJmCCkXTS4R+yR67tVrlClYPn1ImFbDGiuVz1A+Az73aC18aKMxQ1F213cLYrw0J
         jmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927630; x=1781532430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PuMgbKDOyQwBHJzatzWciwXjmsp+q/nFMV9PYpQ10wo=;
        b=ljCjb6XP8DupfF924kSOEaxDdV+wVVbGTs+NNgDJjML1SWfLgiZtC0k3TC6Mwf+9zu
         qNmBUPDUDQXLPDzZWfwMHTXEPtXFRdj9g4qT3rQmXrix2muqPoaJTnnb1hZ5jCU2f3L4
         1XVUsEogQ/hasNV6U6/x+ZyoxKNhDt0rPXuiVBhXEQJSffGXdaeqZMd01m6o2xu+deG9
         +QwzLk7i1wxNc7l+EbNvot+XPDDXzWA4ZmNDjx2FApyrXUv1Wxjg9K70nQBSDT2dLgFc
         bFj/9EZF12jRf+dPaxy5vZhaJPB+XIxavNIF3z3nEYX1udwPF9kZFc0pED4JzPZ3WoG+
         pd5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9pu8Ih/dp3QFW2ni0qJ79lPaBTPnoZoj0FnTXWUzrFRKLD+SnbADfvGYNf6OQCjUGSbp0K61ILBoWf9HpNXOL3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9OLjBP5N6/CddIvV+Z2C9GZ66RwzRBAmxtHo4KA0SDfx4xaqK
	plTG4K2RXmdwAsaLQtKL2v5bxZW3w5PVpJLJb5TIjqqXQH7g01ARBEfXDff7gzSFVP2mbdNxBMv
	+nKlijNmgUsee6DNju81DiOdky2i+vhAYoFnPJ4YTr6eTo7pCnkWK1oeJKAzqKJvBCz7Apvheow
	Ht29T61VZgc3vS
X-Gm-Gg: Acq92OFdiNWwKL+FELuJK1h6iC4v02m+oitb+bQp2j5T1WvC+RpFDKWmgAA4XwDSqd8
	IcOSfr+w9VvgjmtWNeAfLyDSZYqlBcmfu8JEqOwa+0io7knxH48PkJ2bKj4Su9It47PZu6BrHej
	4IEaP2Zy2yIrR0vs7oI91jZskbGVeI7UPr7aSitCpLR/lg1VoFyIqj4OY4PyrMkOaYan8W41wiH
	omI0oKVjO0Rpbq+vZ6ZbxI64hpN2VQZxoP9VQrEL57uYb2kGGNye7hYzEsPD1It4bCcxyhZL4pS
	T29EVACX0vHsoZigyWDbS8MG1nVHoR67Z9iMVRjdugsNbLxFpV3Ddol1K6ZlLm4A9+JZ2/cyKQz
	41IB/+aOy9GJOOmAZUBQgf5wwUICoN7LtCiBv7eUU9rOL12k40u9ZQbDc04bpFjA=
X-Received: by 2002:a17:902:ef08:b0:2b9:6458:1a2c with SMTP id d9443c01a7336-2c1e820e30bmr194406525ad.13.1780927630393;
        Mon, 08 Jun 2026 07:07:10 -0700 (PDT)
X-Received: by 2002:a17:902:ef08:b0:2b9:6458:1a2c with SMTP id d9443c01a7336-2c1e820e30bmr194405945ad.13.1780927629848;
        Mon, 08 Jun 2026 07:07:09 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1646e5c51sm183935955ad.0.2026.06.08.07.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:07:09 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 19:36:39 +0530
Subject: [PATCH v2 2/7] dt-bindings: i2c: qcom-cci: Document Shikra
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-camss-review-v2-2-ca1936bf1219@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
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
        Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780927607; l=1258;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=mQqM1w0igZ6gBceLVpA3L2XftiTNlEyJu5WZnfpZjYc=;
 b=l8C0oDCVF0z+wAAe3f1ETkYCRM41rQ3byPRVTvb/6lKc/KRgZkw4TgfV7TAbSpwLqbckDutfq
 MSCZkcBP86pA3vry1LMmY+U8R5P4bc7WLYWyk1aWsCm5VV9xaA+Ftdo
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfX38KvmfNX0V9p
 cE7uUyEOke72736J4tXW7HxlFV/43nwzt6W8ra02qsXHGBhR7NQ3Yt5KVhNgTW12tMkugGGm1J4
 0nAcM7qUrsvvHxZ0Wz9a2dC1kW/RQ1nd2PKv+D0h0wwT01j4rLKOYm8vp8YFMBTe/UgUPX9KjeM
 GL0GWJJuWbaQKUGB7Y0DcFBlifUw2/al2UWGygXTmsg3BmusYIu76ZJ5a23Oe33fzD8gwCRF/Ez
 BMKDAR5pDsCVVBWpU50dUPWejMnJpbvkKZ+cOb7aiWjjQCx/1OHTm6vfC3jK5PC1fK1Z8Ir4LYE
 24h0vcn8+Lgtl3t2NfyCEiczV5+jU9knof4OKgYhiCP6oqBYpR9JCH7ZscFXBBkp62P82z2cMHF
 ETO3S+ySaMDY02JuZLidjKyIBse9fVhmiLjLbiT84Gic2D+MLwM6S2HDhcyvW/JskceDJnOgzvI
 VCH9VAsMqi9r0Cd7oBQ==
X-Proofpoint-ORIG-GUID: Jf4U55QlF7n2qCm5CococQ4HoSzv_PEL
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a26cc8f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=LDBv8-xUAAAA:8 a=KKAkSRfTAAAA:8 a=phzA4CzYhpZqrDFsW3YA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=DZeXCJrVpAJBw65Qk4Ds:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Jf4U55QlF7n2qCm5CococQ4HoSzv_PEL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_070711_660199_403125FB 
X-CRM114-Status: GOOD (  12.24  )
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

Add Shikra compatible consistent with CAMSS CCI interfaces.
It requires only two clocks.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 7c497a358e1dc8cec8b31c17bfedf315e4e00606..c94069afd8d06dbb08ddd6b49e2de7dc7acdc29a 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -35,6 +35,7 @@ properties:
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
               - qcom,sdm845-cci
+              - qcom,shikra-cci
               - qcom,sm6150-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
@@ -137,6 +138,7 @@ allOf:
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci
+              - qcom,shikra-cci
               - qcom,sm8750-cci
     then:
       properties:

-- 
2.34.1


