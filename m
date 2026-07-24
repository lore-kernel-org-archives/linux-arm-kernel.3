Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523B8C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 10:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yojKAUGM+GkGi33c8OqxOy94cxlFxIcwe6j2MVwu7ss=; b=2vDRkbAVX3HLaT0vQ0IHsyLd+Y
	jKswbkNWm221NIYTntI+gfOjvKXGPFZdx2WEwo7PyD34uY2kTWN4kE1dTsKIQ79SvHxemBlxfjDg4
	Mvpf9wilpTPmS5I2BzrOMAJbeCVfHkTJcWZtZMrQWKiG/HFMAsT5ujSTPYSSRabJO4kAFV4YP9vZO
	y03GCYEcOraBQKXCy6cy4KiOTqXuzC3E1TsYB2+ALrxp5s68NfQTFLp3QzspIeW8aiIWGfqiw5HTZ
	z6SENUpyHitAZ562kCLa8fvXVzx6fBEt6QS5In+c01FDvq5aKcz0TSA7bR0B2g882zEmTBVrEkFFU
	0yzPaHiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnD27-0000000G4iW-0PYw;
	Fri, 24 Jul 2026 10:21:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnD1s-0000000G4Yk-1ltt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 10:21:23 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADruI2742608
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 10:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yojKAUGM+GkGi33c8OqxOy94cxlFxIcwe6j2MVwu7ss=; b=ZRzELO4zyihGjziS
	72Nlcb3z3s0+7l5QxHhHql8T64UTRRfr1tJSs5oO4pvzdqFpnt0Q0lSz1yZCJ1Rk
	zPoFELxhAyJHMfDzMoWWYVGS19pSgrr1AucfANF9QRSXjew499/Kjhdy/8+WRkXS
	VyJmFHZe+EE72oXZMUjURfNlPTnMjJ9wev1IGseM0595zRpY4m/6a40E3neQGXiX
	C/qCPH4AQGM6lcR3PpoRLJwHYa0/V/7rE1ChdCFBWCj7UNWP57rV10MMBTxlyKlN
	ELS441cdSCt5nL6YxPCa7G+Isc0y9CTYr0wcf4P0qmng5npxp/IjnLE8UooRoeuu
	kgqN2A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p51acv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 10:21:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e048a801dso359852b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 03:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784888477; x=1785493277; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yojKAUGM+GkGi33c8OqxOy94cxlFxIcwe6j2MVwu7ss=;
        b=dTu43S5TtIarx37dV3oNLGo+kqtBdW6w9X1g5GBVhtYxrEtltzfOXRpMhKUbaZv9W8
         3Fx1oi8v1SChpJyPn6D1HmD/6IQmfUs8+IbLFN+a6PypIzQGj91iMXwXc/GvPtQxlSyR
         3r59rgjCNCMG8O/YBYqyuHAt7o8Wsee5YNlo1KWuJxuMdvbcft5ikuiQC9lKLMSJJuiT
         IJe8whwFTp6UwJcc/vqB/FwaOfj2z3d58CigsuPWr+gIuT5gdPIiEzPOB2KkJyVYoOAr
         6owzVq1FVCMHgXIn0axy2pPvYAn6zAy9Y2yffKL5fAIqXm3C87u/GNcH8GtzkhOD77Ya
         e06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784888477; x=1785493277;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yojKAUGM+GkGi33c8OqxOy94cxlFxIcwe6j2MVwu7ss=;
        b=oJTqbp5bf4j4lb5/CxiDUKPEAipDBTHon5utFh8p5nj7BomEeBM7lccJzDe75YiSVt
         SsU1g16hp/NVqP0K2c4VPjm8t34EwHKYn0RafzvVr8MIm3tKoRMDZ+pCxx0jrO2+Bth6
         eaidz/9otw8W2gIh63XPccv3xuNhHikUWsGdwHfboPyBsE5XuClk4FYV5Qz1gjc8Q9pI
         izics6U1dSbhKO9DJ7aD0NJ0KF9py8QPF6Al23+ZZ408uDw/MgYkmx9U3suVTChmgp0y
         ew+42WNfDzfpElO9aVEnCIXtklmgmGzaE9VIdEqUL2dHgi2xgpnniP/6PBRulxFW2rD4
         YNww==
X-Forwarded-Encrypted: i=1; AHgh+RrTLSvXNZqgo/HUjPTQ5/5L72Qykt/Cv0KcMNEHxpcbDF5etbgi1BwqK4sBrsAjZsN/vBqL0VVLnO4Gmdrf10NW@lists.infradead.org
X-Gm-Message-State: AOJu0YwRBUl+m2jxkkRqi4oEVpxWBK9QjxQ2A5gtPrxLtgNa6C/SAHV5
	xvb/cgMdt09at5VFssKgamSz7aJabe+RsKut8LPwUct1ODLJ7y+ijyIGzOcROqv7w7ty9mOApa4
	9XS4OGVzUKmpIgObDQ/MCBlPiS45vf5O13Dwg7u44463eAqvJ6PC+ZN927lDTb71ZxSynXgWCzM
	gisg==
X-Gm-Gg: AR+sD13gCiadoxbuZNaX6B65ODmVMssGbkZ5QyY2jL5hA4hivKY10AgaT8H6fNNSffS
	dA08a9SN8QfPH/7o1VAu7ZyJAfHe/2a9Xgs72dU83wpVCI2uy4f9+ZoU3K+9vICwNIKgiB5w0P8
	wCnGAx6WrRKtxvdU8N8cnQyxkUu43esw19B3fcRRBAeBTuS+/WLm2QI8/L0dSFeBxMov9oAPPXI
	eJxIfkcLcYccyD2BjlyOuGPWidzDt/jD2nczGkPyJGR3109XtzYIAtnPzvWNeq3ogWYsPRVFtmm
	OeedUB73XOZ8uP7NibT19JCniP/zLgew4d3ngVmZy7vrdSQhVAaMNAnF+M5DIcWkIRbEnfpRCnW
	4XKYUXZNpPklN1sWH9y7IcKhlcaUn3Oo=
X-Received: by 2002:a05:6a00:12da:b0:848:2f7a:2e58 with SMTP id d2e1a72fcca58-84e2bba3617mr7265037b3a.71.1784888477625;
        Fri, 24 Jul 2026 03:21:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:12da:b0:848:2f7a:2e58 with SMTP id d2e1a72fcca58-84e2bba3617mr7265010b3a.71.1784888477145;
        Fri, 24 Jul 2026 03:21:17 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175ce455sm4451448b3a.48.2026.07.24.03.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 03:21:16 -0700 (PDT)
Message-ID: <950e7499-fc8b-44fd-999b-d3197bc92308@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:51:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/10] arm64: dts: qcom: milos: Add power-domains for
 camcc and videocc
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
 <20260717-b4-eliza_mm_cc_v6-v8-3-5cca1bef2e48@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-3-5cca1bef2e48@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a633c9e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=vyOKmKYE018VkNFVGwIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: oQryzrYWVgCAPoz2MpAKSOs6U0rDz4bq
X-Proofpoint-ORIG-GUID: oQryzrYWVgCAPoz2MpAKSOs6U0rDz4bq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX6DUjqTCyAogU
 +buqBSfFMPtB+DFAXmcLZEv3c6rSxrynuEFaFNyU4HGOA3Ow4NcFliK+BNBfJ1MWT7nU7w9qDe+
 tABz2PIOLbCFGb4kgDcFXrYXFoVbFh8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX/EkP2cNHBSQH
 aN35nF2TUT0usN5avqKCL2czEwcmobCXk7Ky3RJvGkh6ir4E4e+mXx9Kc+gUDkYPy4OPt37oFta
 yuMrObj5KMSwKtXSTOcq/OIuxB5ul7e0+Qt5cOIatqIiA/EK+NpQ7d4gARYmEChCi9qZecs2/tg
 1r1Yo9TD2cyubc3K6IdwLjmQvif+sCCTiIigOluMShcZheToGyaGiFf7pQIvwWo+PCTJFcZb8GN
 qPQdI5ZBcAL0suhtc6nuLE3/FOcsHot3CqOJmQ+IZNPrS8Bikl19J7jUSSqZruFhFUXJoUm3fA+
 IALonTTS0djB1R/i6HG1fb2WQKqmSAttIDMaEjS9BGumwvCYNNAOR2C0smh2zRwBq8Ek2523rWH
 Nt1q7IjK1PzZx9TayvG3Fi+QRlHTeoS9NJFxY9shV+PFg7fNwY/SryIIJFobs4N9nVtoH3cp0hD
 CRuCoDH3IyQ5/oZGW9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1011 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_032120_586824_BF1F7673 
X-CRM114-Status: GOOD (  13.87  )
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



On 7/17/2026 1:01 PM, Taniya Das wrote:
> The Milos camera and video clock controllers operate on the CX and MX
> power rails, and require these power domains along with their
> associated performance state votes to be specified for accessing the
> clock controller and its GDSC. Add the 'power-domains' and
> 'required-opps' properties to the camcc and videocc nodes.
> 
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 


Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

