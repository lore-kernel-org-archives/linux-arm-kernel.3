Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4562DCCA472
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 12:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4OPP5rGtbcoGt2hmvhc+u4aKUyzxDw05x/alaaMMrU=; b=Q1QDXkcj9G3g6vyQcIPhn7kYoi
	YulDWAmW1/AKN3wwuBcPE1XpDoWAs/8AA2oseCdx3CEmphlWAfxNR501VSC3uhrKFxJoyaZQRbDkA
	ToFnxUDufSn8LXFVrB3v9uTQHXmGYXhV78CtGJJCm+F2QMbrMElO6+b2f5y78eYyBbpn8ICNRKk7h
	E6if3KHDfvGSfnlxnFJS42VU4hmGJ+4iK7j70xibzN3rBhgQnhjOcD9U/XwXCbN8QPcxnEg9aVS5g
	4yuDEb7EyhoZdKklO3GFe1sl1UQbkaWGXghZ0Xw0lT8YyWE2Qovd44wxU/9vcnNxnJliZ1dRsSlcQ
	oHzFtqbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6TTJ-00000003q3K-1zxe;
	Wed, 08 Oct 2025 12:40:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6TTG-00000003q2k-3dAz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 12:40:44 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890awh002267
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Oct 2025 12:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M4OPP5rGtbcoGt2hmvhc+u4aKUyzxDw05x/alaaMMrU=; b=hBd04cJgCs6FMEwT
	SLJv6hQIebpXckG7rSWR5WFqC0HAU3YzOqpBfUqFEbgMvU3Xc06MuQzjHrLsqdwt
	h8Ne8CmeNfpDQcCFgxPdgr9088KLmQcUJ6WknNvlJeMX/WPbctqMXCS4uJPYAI55
	2sta4654l/LibwERamb75M6AUI26ZJgtDStfAFLJF52818MNZxQIpzcnGlK0ye7T
	4UDigkvXMMEymCQfW8bOWuyTcJ0nExA3Vj3Q2l1d74UpiSK5uBihcP/VVfRrfmRD
	gq4Ky1onVbv6UtGwEYtK9uFvTQzRF24dfgGA+07skz++WYq/NeKviK0zVWpgy3Es
	QNDw5A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxnatdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 12:40:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-795ac54d6f8so15769896d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 05:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759927241; x=1760532041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M4OPP5rGtbcoGt2hmvhc+u4aKUyzxDw05x/alaaMMrU=;
        b=C3lnBHThgyhXuBrjwiHuORDnh66RUkBoCfG7l8EDJoDSuHZW9cnjSuw31EWGxlmcIn
         Pr9n8xwLwr67+N6Nziw5W9mIhCA6X4wlnMe5t568W+9qrl33L6GAAX9iEQMKbHTxp8kZ
         XP5M7b55YLRt7jjYtnQQ0mQQIVePR49TgeXRJ/tRKNUtIUlgXya+WyObJWTDf4sYLwig
         HlDL0gQDbKN3bhDSC/mn5OST9AnsQ/hIFHmCyA6NemQ0QL1S8Bzm3rXslwGmDOD9JZr4
         X00t9jFFfJm5bnlwGZ27ksKs5dPssgJ5MPZLCil2cIqIFF/11b/4mXZHZc8vH2ARoL7+
         DlaA==
X-Forwarded-Encrypted: i=1; AJvYcCVRHRqiIG4Q2v401iZIEx3okos8H6BVqojl+mH+69Us+Mljr9fomKOaycgh1a+yk7o7fbVNYl+MP02EUuPhflGQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxJvPGw7ulxxTHus7v+Vn5OAHEMENcwzyHxIikAKRPNkfg5LwjJ
	3cBcH+mZap/kQ4NPUn7uKiNYBRg6BPQA1dRi9q5Zs3opaAMZwIT6ObN5fg93//r1z5NMWWLWPXw
	1GjU0AvE0wuvy2eaRrRC75uomzjEYGwgyh+PM4UxHUG2UsZi5tT0fIDd4QwvwPiR8Sg3v4x+4Sy
	N8fg==
X-Gm-Gg: ASbGnct6eDuH/upzBobMx9VHfgzK75LnhjS9k0JTKshLy/HKUaHM/19uXCwz9FZDC+7
	M3uIjnQMpIED9UkGbSohFolBNK86kpssGoYCxmPQcMzfbiOiFQtcw4MhMMzlf/gjiGgjqMdockW
	Q4/ChZCN7CGD8dOvtGcWXvnnjJgtE814iSjtYust4UJ+VEMM4fPV/RcxV3DtSn8117eu+uBUFAR
	XwF6kYPw3nCqzkSt0yWobUNTmIdkc8YEGUYczIYPa8XEzvqEdsQTZTvDkDzLIClkm7FHk3IAjDI
	4dwD8ih+mPjBTH9566bf3+qajLDI/LQJJd0Q29xqK3zsXwokJKSfC7XPHOowbN9yvcR9cKhe9QS
	rwsFPzC2nM10Szx8nWq2p/bK3uG8=
X-Received: by 2002:ad4:596a:0:b0:784:4f84:22f9 with SMTP id 6a1803df08f44-87b2ef94002mr25131256d6.7.1759927240910;
        Wed, 08 Oct 2025 05:40:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3QYIdes0zzXDXLbtN1GZArLUcJtOk9G7EMYv269Ezp7bFtd3e0tnh7OnfT4Sdj7S94CaghQ==
X-Received: by 2002:ad4:596a:0:b0:784:4f84:22f9 with SMTP id 6a1803df08f44-87b2ef94002mr25130856d6.7.1759927240350;
        Wed, 08 Oct 2025 05:40:40 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6378810112bsm14570055a12.26.2025.10.08.05.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 05:40:39 -0700 (PDT)
Message-ID: <e3400ab5-c4ea-455a-b8ea-d4fba2ece85d@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 14:40:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: lemans: add mdss1 displayPort
 device nodes
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX3Gz+lrKNzx0A
 L/CMl/Yg3sOHfYcNEug1QaOliJTRfaptAVqCfYaiADXhKFCX1MukX/XrCVPcAUKvQPJZ3VQDJtK
 JXS3ydbHYe6oFE6pDsW3Nh9XFePQICARhKyWFV3Mt6JyFEEz3ye39OA3kuf2PAauPYZG7Bxbybf
 s69wuCj/ZO/bdVWE6DU22sBqx5YkdHgjJS5VD+3Y29xnYlEulzBKvlwizbcgLeCWX/LN7W0Fg9/
 ofipELjRNQ02QUsBmumYphS1Eg+0BO8wT6KwPQqqwGrLCJLb3CXooANzrb1DXmUglHS0xw8DZSJ
 18bc1p5xuIuNBLocrRIeshG2CtSh/uO7yrmD3KLAJLyADrd04N5v0CFU9g70PFHvz0qxHnFbnUS
 AXtezbjO6xU5vjznJfMFSxJ6yifFVA==
X-Proofpoint-GUID: D7Adj3wHpGxi0cdWJUkE2lULQEP16AaM
X-Proofpoint-ORIG-GUID: D7Adj3wHpGxi0cdWJUkE2lULQEP16AaM
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e65bc9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=5YqVK4ek60l4VI_saP8A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_054043_032842_731F974C 
X-CRM114-Status: GOOD (  12.71  )
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

On 9/26/25 10:59 AM, Mani Chandana Ballary Kuntumalla wrote:
> Add device tree nodes for the mdss1 DPTX0 and DPTX1 controllers
> with their corresponding PHYs.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---

[...]

> +			mdss1_dp0: displayport-controller@22154000 {
> +				compatible = "qcom,sa8775p-dp";
> +
> +				reg = <0x0 0x22154000 0x0 0x104>,

sz = 0x200

> +				      <0x0 0x22154200 0x0 0x0c0>,

sz = 0x200

> +				      <0x0 0x22155000 0x0 0x770>,

sz = 0xc00> +				      <0x0 0x22156000 0x0 0x09c>,
> +				      <0x0 0x22157000 0x0 0x09c>,
> +				      <0x0 0x22158000 0x0 0x09c>,
> +				      <0x0 0x22159000 0x0 0x09c>,

sz = 0x400 for all 0x9c

> +				      <0x0 0x2215a000 0x0 0x23c>,
> +				      <0x0 0x2215b000 0x0 0x23c>;

0x23c -> 0x600

[...]


> +			mdss1_dp1: displayport-controller@2215c000 {
> +				compatible = "qcom,sa8775p-dp";
> +
> +				reg = <0x0 0x2215c000 0x0 0x104>,
> +				      <0x0 0x2215c200 0x0 0x0c0>,
> +				      <0x0 0x2215d000 0x0 0x770>,
> +				      <0x0 0x2215e000 0x0 0x09c>,
> +				      <0x0 0x2215f000 0x0 0x09c>,
> +				      <0x0 0x22160000 0x0 0x09c>,
> +				      <0x0 0x22161000 0x0 0x09c>,
> +				      <0x0 0x22162000 0x0 0x23c>,
> +				      <0x0 0x22163000 0x0 0x23c>;

0x2216_2000 and _3000 don't exist, there's no MST2/3

sizes should be changed similarly 

[...]

>  		dispcc1: clock-controller@22100000 {
> @@ -6872,6 +7115,8 @@ dispcc1: clock-controller@22100000 {
>  				 <&rpmhcc RPMH_CXO_CLK>,
>  				 <&rpmhcc RPMH_CXO_CLK_A>,
>  				 <&sleep_clk>,
> +				 <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>,
> +				 <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>,
>  				 <0>, <0>, <0>, <0>,

You need to remove the same amount of zeroes that you added

Konrad

>  				 <0>, <0>, <0>, <0>;
>  			power-domains = <&rpmhpd SA8775P_MMCX>;

