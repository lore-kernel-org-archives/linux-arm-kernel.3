Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D04C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Jgmi8wIPoCDQdyFphlVzecqrFuQqOuAqeN/auAyVgE=; b=NyjHqBUMmGPMQcVtM7WCqzNTzF
	/rmDUl5o5WXG44XyyFObqt3ju4edllCYKEn+3/vfqANBGoV/1agbcgp3XzoSmLaUCNP6PpKYyeVd4
	f/JFCogw9h1VsqC5rPMS0AxZEGEYEjbKfjjvu1/3nkyuAYRrH8zE7XvJoAJd2pyoUZ0ZJpBt+c98x
	HBiLMpLp/HP7dWJuC4iiOTpOCQN8Sz19egIQwqQaPCLiAvKZsmR0QnfjBvgEtouFACPWrNHL5uzY6
	XkenO+mEqzYwUDOE+wQIGIsUZLOpMDzdcwVV8K63VnmuPaCEGumhKq4WMc+El0hoMaG4NZLcDBUBD
	17KWBc5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumOt-000000029zh-2NV5;
	Fri, 14 Aug 2026 07:32:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumOr-000000029yi-12Cb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:32:22 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QTaZ1172836
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:32:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Jgmi8wIPoCDQdyFphlVzecqrFuQqOuAqeN/auAyVgE=; b=Yk7TcyFXpfXHEiYM
	OKZWAYRpq7iwBqV8Xw7er2cFPE6P/LnOQJb/1rWdgXG0punTGdfUKgL8O1Bjr90V
	JEiuciafApLfSAM/NitwRI4j1MIlcapFGQDxhnruY1q2dQ47kBROGW2jS34p6PKm
	2Ku8lRQ3Xp3xoGXR/Ki0lfbPwQmPeSPngRNk1dj4qStwtwefNDsMXKiy/M/qWUIC
	QEOblOOU1/Y9JDUUwN7bF3R1jHEk/2f52O9UtHQ67YwxjZLhHKJFZI9KdSmtBHDu
	b/AlgJR76mHiCTOxPcB+tjgoW9onz5COgRuoOI69kICnnAuEpdqy8UKo/3AF/BlN
	meNU0g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1nugstpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:32:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cccfa32670so8304145ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 00:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692740; x=1787297540; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Jgmi8wIPoCDQdyFphlVzecqrFuQqOuAqeN/auAyVgE=;
        b=MjBnYOSGUsrnk5DY90VruBt91pPPF263s9GdrO35iKLdQ7Bay0Obq7EO74TnjwSLqR
         kHcyo7LFIXU953wnYCeTEtYJkuS7UOxD3E8P7snI2wKqdp4fSHjS5Kyfo1Iy/B8eaAvw
         duvxWm1Ag6mW2APPEAR5tPZ8OLlsB7TcQiv/MFhS+heNTLX2ReJv+f8wO7L758Rf/JzW
         vaDzkkG4RWNXHsav0Y9cjVSrMnfhDB1KtBb+bLEebCgU9NDIqaG2ytPZSpAW0G0xgtrn
         CEUewS/OWL0oyvLrN7d0PcMGf/D+eKoUnHeFOHBQAysXtRQ85MfLjhF0fY9c0ExXNZjq
         zKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692740; x=1787297540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Jgmi8wIPoCDQdyFphlVzecqrFuQqOuAqeN/auAyVgE=;
        b=BY8A37bMpL9MdH3w7XmOwnrWf92TOipnD9C/kR9DiIEx/9XIVnzZW8P2TZMa5Kl0IP
         9zkPD84yc4arF5pTUXnygcAk4TEda6TzV20N0QFYTJPCdp6a6bp/u/WZx9ov7+R0VZOf
         yYB5dbSgpwrFNo9XxTba5g8cOAAjg6hkXdNNbBAYBZ8hZkqTOFA6JOmQx9hDI03I3OsO
         ykx4O1lHIaSHhwVYcHs/TeoJRw0pQKbtpzRTo3elhEiwzgWxLFxDOlvFzYVyTN0lz5yw
         MwZ6/12cuXZtdjzrGBcQ/Jlv2Fy7RAd8oqtd3CBlfYWYqIVrJpQZaRn7gECPdilEKVWB
         FTUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrn+I2KAO9wjc/Uzc1kC6xoAiDIg1phr6oxyz9uZR+cwBoKAgH9Kl6OJ8J+s2HqZQeKejuRSY6wQrWq+9yR5Fkg@lists.infradead.org
X-Gm-Message-State: AOJu0YzrahrL7vXHOS0jp5y0UqG31M4VX3vLAoflohB5QvoISDbJ+/9W
	UcrZSprCSA6Dvrac8EaevmfCYxGZXZb36BI4IQzMhZlWGVHajI3ArTMCneHW2Lwh8YdROjkvAI4
	1NOnp10GLOEqCnByLuaC1HVwzWOqhpTQjyk2cRSpRaxKYDhD6+rCddVhF4lPR/LzNLSgL1pFmeh
	cQhg==
X-Gm-Gg: AR+sD10w5mrAfd9Z6iqveJO6ih2hyR5dO1OPinVAMHrJMIw+drwxfHg3c6CtVmwR5r2
	o64nnbdj1k33IAyjDGdEzvejzhNPyfk0AIv53b4v8md/zEkTo5bQ8qbs31O+6d+/X8JrdOkpLr2
	gsnmnZp3qHdFjHwghjeZsZ7QYzIFTkq2xXBiBZb25J+GvNqzHtI7AOSVDHhowpTtvDsCvbEay0x
	HYmT282lIl5Cy17JFU0owCTYMQjjmBCFxfXA6TPuckCgI4cX3W04M0mT9mxVIF4/yH8N7HxSqrl
	ozq/cxIcjxTYrKDxdzMi9t5SsBV/Qd3p0pFUgFFt3EvQwH14RBG4mgiHBGXSa6aKFLUeIA3PkSU
	YQuNQ2h6tuFoQkx5KtSWpJttvXht5KKyqpjEkY93NAQA8ehQhb71fyuN+A0SYWO5s7tCr9+igwD
	qzVYA2OJUiICo2UWgw39N3f5w=
X-Received: by 2002:a17:903:4b50:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2d3b0eec2e4mr44891155ad.13.1786692740056;
        Fri, 14 Aug 2026 00:32:20 -0700 (PDT)
X-Received: by 2002:a17:903:4b50:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2d3b0eec2e4mr44890695ad.13.1786692739653;
        Fri, 14 Aug 2026 00:32:19 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:32:18 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:33 +0530
Subject: [PATCH v2 02/15] dt-bindings: power: rpmpd: Document Kuno RPMh
 power domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-2-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692713; l=801;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=lLT782FdZyRPskpp4opbNA4IOV3INNb0OEUPXEsUiSs=;
 b=jDdmD78RpRBpRWF34hMwTuXF0ZnrvD+D2rjqsQjw/43sLItFVbt4tdFC24drYcgzLI/5fzvfY
 fwnnvkQ/oibBSN8xWcqibqoln9lMeEGWd+kpB6pUZSv6OpNSU6jyRXv
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfXx1uXtcuc8GPy
 Q/K5/qppNguosQYqFfpF8DXiDJvFbhjNvX/VODUHK3wME+4YyLeAd+rxnPOi9aYrn+C02a3Ltbt
 FakgrQF4gIk2voABJKoCKmgjNMpXNVHJPbNUEgj0KkTV2XqWlEFsUE3GmRxeUN6zJhet59vwqXK
 7YgQGqvhl5p2Ka8LCnDPuBwpvGswMTpmO0bdUToN//IoyrpQutyhR/FRlPJkTxceoqbH2YkG5Hz
 XZ2Mz8PnE0ykDXoYGgc0oXYnLrYVNLTaHE0+P+0Drsi+K+eHnAlWRRoh724Sf4PXQJb+gbUPO6m
 HapGEIQiXSUA8dJ8bmu+IdNgX25CK8S99/n6jBSmoc4VggOzv6RthbHnCXZapP7d+0WuI0TlVpD
 5oDKOhr9n1DQABry5y2hOTmiSu8cdDhk5NlmPQTDZ94ksEpfrG/tVbmrk/D6v5lSDNH92cZW/6D
 TrNv+LgAvyCs3bQngxg==
X-Authority-Analysis: v=2.4 cv=drfrzVg4 c=1 sm=1 tr=0 ts=6a7ec484 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=lHgBgSUrZIjjmBdF2hoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: cuyMKAr48IXEfjFUxUmdGU8hh7BNN7hL
X-Proofpoint-GUID: cuyMKAr48IXEfjFUxUmdGU8hh7BNN7hL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX+0nagm7oSx6/
 /7MdXATRIs1sLnSBHdnVdlMM7oKpoxzDCayo9bEGF+sZ8oFtR8XuIjHZ0HlDM8xr29f123D7wih
 Y3eVwhsm3Ve3ljO0dBCJEgPDC3AIy0Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_003221_298113_100595E8 
X-CRM114-Status: GOOD (  12.26  )
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

Document the RPMh power domains for the Qualcomm Kuno SoC.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0a45e1f55062..7fc3927efa27 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,glymur-rpmhpd
           - qcom,hawi-rpmhpd
           - qcom,kaanapali-rpmhpd
+          - qcom,kuno-rpmhpd
           - qcom,mdm9607-rpmpd
           - qcom,milos-rpmhpd
           - qcom,msm8226-rpmpd

-- 
2.43.0


