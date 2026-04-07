Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B486EFEEF44
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 13:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqH9qDu+RSkWSmOuYsas0/ji8lEDf8sfNj81OgPLcEA=; b=MIPTQH33xEcYZd1J2a3wUD6ZVm
	E2S1wYKSlQJXBwMAMYdjb+bF1ySepW3FCR9N/+eNSRYGmGjPI4qN7/iGy6Urw/73Q/tJhccmF5Lzr
	1glnVtmjgTQaA3v9yjFKyeVvtms7KV+/vTDUgLt+yLL0Rq59chO9G7FckcOhKTuGui4ffFU8YbvR0
	6p5Pb8Z/3/w7RBGr+6G9afPNFOdR/WgUNI0zpkWVVOkJsDg6JiNGIiUw4leH+xdlCO27ZD6K8YkTw
	UkSeFOOwIoT4/mzczmbqadWnTvDVcdvPIZETlyJdPfoeBuZMAcoSe6pQSlG+joqO948xPc8q+POUa
	myDvAPVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6fb-00000006X15-41O1;
	Tue, 07 Apr 2026 13:40:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6fZ-00000006X0b-2xrg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 13:40:43 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637DJv6x4010120
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Apr 2026 13:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vqH9qDu+RSkWSmOuYsas0/ji8lEDf8sfNj81OgPLcEA=; b=eMl9tmzC/a8uTVA5
	sPv2R2zrCjgg3xMYRMNpC3IZn2j1evlEHQ6IkTVqblYshMHU7L9M++IEcStbxNcD
	31oSp6fKZacdBLWDZ+Cr2znc/l21xYKfJVAABMsQizvNzqb1d/YvxHCHga4l5r/H
	09sBSsbql6Y0tFBzTmuIu4h3d3wodEqrCi4gPBC2PYY/y3EYmZNeXx1fIPq844zg
	2AiV+a5A9ccaO0S5WULPGfVvzdoAwuZPAuw/dUBqq/dCcXPkFN3UmXWpmyZr9JhU
	Tt0EtOH5Ud+4Cuolz3CSFZo6P/4V1zN5kfdRyuxYDLARzt4WbvkjmonXrA1POO+Q
	G78gNg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrktvxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 13:40:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8c192b3fso85566161cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 06:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775569239; x=1776174039; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vqH9qDu+RSkWSmOuYsas0/ji8lEDf8sfNj81OgPLcEA=;
        b=R/ds9RRgb2SGcgbnaE0qcAo2RgzhfV0NxFcWsNXprgNSiUPDwsPG4iANm+pnha7hor
         J6dFatFUIthc7GnPCAoayQf3JBe7cAGb8mZZoc+20h8nlO90QaPe1RlDb8XIiuG5KyHy
         pbYMC466dhjtMPM13+6XmKau/rGllaXRq0XXvJS4+EOb9NHP4/Jn3B/rbxncpRWmto+O
         P+48iROCTErFfEnF+KM57UMpM37l/gWGLuSpH20nz9d8hSDLZJdXUOuWRWTl6iKuIV/Y
         1Brfk6i+ErVNP7geBvYCGLsPCaWsywacv6CbcDU04Mw/OIc62X7vioH2aqry/rZxo14C
         wrDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775569239; x=1776174039;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqH9qDu+RSkWSmOuYsas0/ji8lEDf8sfNj81OgPLcEA=;
        b=iHwVlfkbkMU2rFqhxKIEMfcpQSit+4e/73DLcOWE9cPWlsQ43BPzL/Unxl2ySfdM5h
         xv3/OkO5m/TZC9xPB53XQaeDrUc0+t8bBLEKteGnvq88SU9XsmoSrEYAFwjFCsDUvL5F
         KEJpnul4Q33RwdOLuzHmOzw/m2BeyMT36yoxcMurmoZO8Jhr5ZS44vKo7wNsAxfRQ8mW
         tK5BoBJoT0Xie+xqZCMWqyi0x4PVUtvJqHQ9LNer+CFX3/k5+LJMZc8FjBmqrwPYzaJV
         1Kulydnb8EyKhUOnw77+MMPvpPZ91fkNnzD4Qqbd6+rJhPmSu+M4HntKth+q480T8+WV
         QisQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/8IXiCdX0DyFUIAkmq4XIYi5AgaqgD5ICb+4K4v6zjZu/Ynwzj0uYUJBWDPxHdahcB0hXyOr+lakYYuT8E3vI@lists.infradead.org
X-Gm-Message-State: AOJu0YzM9Hhsu7y8vKQOv8omrSSexw71mnnpbDOPunLBJvzUaDpB2V9q
	moobCSoLEfbmH/qyT0B4SjVy1ezj4d9ixn+0DIYt4yZKGM54jS71Bm0cpwcY3F4Qqsf6WF6CMo5
	7EMQPVP6WHmrQD94wGIBqXbO67OCaTmMNNdw2r+ZKdFVlUWpwmEIWLnJVa62PYkQ/zMGMjIhcL9
	Vl+Q==
X-Gm-Gg: AeBDiety9zJ/D7340xErJczfjMF8uR8PFh4rqVB416RC+Kt/s4zWgIhxIjy/Id53HO4
	SDszCSqQAW3nqWhCsCE6WWaLrqQb3ETlR8KGWjO03KAi3mR8Z01heRTak3s9TWm4rlUF4w/IhBj
	9aUcuytu6VHgeSQnPd0F33kIgZOmknsC9My2rZdq5rKVb9SSLZwO0QVD9qp0u/8wClMkuDSqVzH
	cu+wLoCjEH4FthWzJM1yvbZEDgt8rE6PsClhmlj9lbPnZKkEfXVSWXDjX0daPBcCSEJ6jNnX1ix
	5dnlpaJpEjcPuJKgeBF4pRoAjr1OanTyJONVtA2CLge5gHMxyy7FpA8VaUSzOVsfQEthhZKzDy0
	HfbJXawcWRqsj0JCWz1/N8XNN4pZOO3Peh8R5pTUOEFQAtzDt
X-Received: by 2002:ac8:57cc:0:b0:50b:4167:7889 with SMTP id d75a77b69052e-50d629c5299mr254528181cf.30.1775569238888;
        Tue, 07 Apr 2026 06:40:38 -0700 (PDT)
X-Received: by 2002:ac8:57cc:0:b0:50b:4167:7889 with SMTP id d75a77b69052e-50d629c5299mr254527351cf.30.1775569238289;
        Tue, 07 Apr 2026 06:40:38 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a71f7sm52599754f8f.1.2026.04.07.06.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 06:40:37 -0700 (PDT)
Message-ID: <4c4e80be-4aeb-4275-977f-b3f8c6ab26b0@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:40:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: clock: qcom: Add video clock controller
 on Eliza SoC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
 <20260317-eliza_mm_clock_controllers_v1-v1-1-4696eeda8cfb@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260317-eliza_mm_clock_controllers_v1-v1-1-4696eeda8cfb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rrz16imK c=1 sm=1 tr=0 ts=69d50957 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=NEhj3jsE5cG0449qHM8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: u-Y8iDTui6YY6En75f17dYOmU4nAWwWQ
X-Proofpoint-GUID: u-Y8iDTui6YY6En75f17dYOmU4nAWwWQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyNyBTYWx0ZWRfX+s+gJP7IBPQE
 BFCXGIhXxFPexh+oWial6MCbFVFxfbJT8i4CvktUJT8THX0rnlRsXg+pO7Xfsc7ork5oGBCAQXw
 BHCjvKLB8Q8f14emCGzIJTC2mTsd6R6i0BO717XlITn7Fx/5Kut97ItNfKe69GF5E4AHtbTXZ8S
 HaKc4lRkgOEASA06ZGq4iAWAKcQhGXzhJTa0z9l8ReVdocplCG/DeMMPjYEtLMPGl/OsUhcYhkn
 MpBXvGc1yuYI8D9VM40TwARFAdyiO6mSksrh3QIVFjOK2zInUlSOBMLQcGO8F0q4qL44sHNysid
 Hlkxvm/8KW2IPimttX4eHoO472Gwxiz2ZVFcWACHTTAVkRDq+ekZ0eUQr7Boc75cJG82IaJxFJH
 D/oJEUhLgyq+zbp5HbpF/M6Ukjk/0tZ73+RFhNXuAJVJTMeDhu3qJZLKopAi01LdOe2k6e5F4hq
 1q2Vw/PXEwbSwChrd7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_064041_880323_B1B95E7E 
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

On 17/03/2026 18:14, Taniya Das wrote:
> Add compatible string for Eliza video clock controller and the bindings
> for Eliza Qualcomm SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-videocc.yaml        | 16 ++++++++++
>  include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
> 

Although I already suggested that this was not tested (and you never
replied where did you test it), but I also checked and this fails checks
- constraints are mismatched now.

Best regards,
Krzysztof


