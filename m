Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDF1C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 20:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYyaI0FB+UTRojumzU3j18brP22Fad9SfaLy766ifSo=; b=TqdpyZl7XfODCxzjp2zHBzTypS
	PE+peog8q/EcIa+9uNActx2dr1oRyvPLubx59PeXtjsqA+aSMKs6rNBK6/c10U3uoUKHvhQQ1QQwH
	FKNbxQflccrbRPqxQfjq1ZaOZbq0fkzCQb/uahEUoZPmF/2vPDLiIA3IuT4H/Znob09J8ZHzVjqLc
	9/0/mS5DjCaT92WBObyQpsNAaYsgwcC6ei8L93ft9WbJtCA6vlWJ8+2PeK6Tqd8uoanITVz+P9eLV
	P+Ou67IyyDMa2Nj1QAWsh+hlFR0miGrMjnhw3I5zAFHexWmObEyr7bVB+dFeqEhqGApD0VY64CHCW
	FNsJ57VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO0Jl-000000025LE-3cAn;
	Sat, 07 Jun 2025 20:39:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNzt5-000000022gD-2Wco
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 20:11:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557ITFSp021397
	for <linux-arm-kernel@lists.infradead.org>; Sat, 7 Jun 2025 20:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XYyaI0FB+UTRojumzU3j18br
	P22Fad9SfaLy766ifSo=; b=aiLmEOCmVGDPKjvXK+/1dU5cgp8O05uABTCqjmCr
	iN3xVVrMQXKDweoHyj+5MJWQZb0fXhfvHhQR1zUg+o5zBI8N2e7ux48AtKrsXMjx
	FVnPNjXMLdnfM2v3el/IjTA3i+kqMwZU6XqSX7dgfeYkl/psWg9lC+AI3IVrKTM6
	94U6E2K5dNjf5UaZ6OhyuzwFUZh39puxtImAFyEfrDtNF81kuACTe/s3wNtRG+ZK
	ru1VF6EvfEe+rNkEPueODeM5s/vOoH+NjlXT69DJF9rSpIG6RiF3XIG4uFM+SQZP
	0XlMO34Q1DYqpdg96aIx+pMDEOF38/a2BSw8Ddh46Ca1CQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474asrh7m4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 20:11:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5d608e6f5so753445385a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 13:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749327089; x=1749931889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYyaI0FB+UTRojumzU3j18brP22Fad9SfaLy766ifSo=;
        b=bPnMgAui8NmXjCuNKXjdtKMIuPX2VqpgLIXPSgR+Iga7rPH2mm8wU0g0W1NO6CDHpr
         +Suh48D3uEeY9Js2F6g0jU7jmsOhQT2/1PJoMg5ifYJjcbZXVnLRuibIjK/ySi/7oy6J
         IsA2nJxWHSfMK6NuzQvP1vD4iKZ5Hw5A8clvC55LEDpZoZUqEOjMfeoBIEufIw5jVbH8
         qU0FU+QjApftWIFgf9f3JEAhcifd7c4I/v1pz16v4fjDk++l9KbLvNJQ8eqTsGYAM53S
         JN0Fo8YyGJF712bpOrjWcqy4cEt5/G3lIoWS2bNEg5wlRE0Wcso/+wRWUC8PtSAAWt56
         dqLw==
X-Forwarded-Encrypted: i=1; AJvYcCW/GZGyQbz4IWZJCh/vl2Y/zZd017SVn/NSoCVxvPc2TgR2qS/EP21h72v3sSWGA2dL32lZ15vx3pYxnmaBcEb7@lists.infradead.org
X-Gm-Message-State: AOJu0Yx66PifrS6vb6br7PVW0MVQEVn+ITcUEhzPgJ/lCTfqsvUjNkqF
	ANR40TtKwpJcsVJJC9oayk9Tx2L7viHmfbE3KzbOV50UCsigKnZOSs3F9FJNVPV+2QlAqHvHKXC
	rwwUCYgNNgZsJHiYdyOvIOf16P5NiLdwb740FtoGmH+scmzfyZG7Gi2TOcVSezam52Qt0jBNX//
	s0RQ==
X-Gm-Gg: ASbGncuym4euldBCnBuOkoTNdT1R0seudioqoVMJMIuUD5iZgXRMC/MAsiopwvvjn/P
	wfFw0YO5BR7Ik/Fy++WaZsgsiA2dybE4+A+SabwFHytBXEn4yN0kyueDmhnErz6hL3nY23erk4p
	O9w7YMp8kZZDaA5gmdWptebxiseAaMqJzw+f8JN38CcBU3mqVQDhD2810sxSAL3SKxebKwhv13H
	0lveKhyJVPuampeV0DKnMIO2b2mcuF4yhF06UTftMDpvt61JCbwMqYBctC5HkfRcwm7vgTpdQTG
	19f00g0zEGV3gdPy6Vb9CKFsJp3OYBjHhdVX9NGNbl0B4/1+p5Cn+s5ImaWxke2zZ4fIQn6s0ME
	=
X-Received: by 2002:a05:620a:199d:b0:7d2:1684:2429 with SMTP id af79cd13be357-7d229896449mr1172215885a.31.1749327089240;
        Sat, 07 Jun 2025 13:11:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa4olC6W9osviXHPQUeq/X1/7+Ru45fu+N79/NuD7ijwXEkSq5aoqXEsc9qfndAHioC3BiSg==
X-Received: by 2002:a05:620a:199d:b0:7d2:1684:2429 with SMTP id af79cd13be357-7d229896449mr1172211185a.31.1749327088811;
        Sat, 07 Jun 2025 13:11:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1ccdd53sm5543701fa.88.2025.06.07.13.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 13:11:27 -0700 (PDT)
Date: Sat, 7 Jun 2025 23:11:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: defconfig: Enable X1P42100_GPUCC driver
Message-ID: <hpnrky4frqjr2a4rdinbsizm3mwdognx2qmx76u7k6g5ocgeab@4vtgu5qqsquv>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-1-a8ea80f3b18b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607-x1p-adreno-v1-1-a8ea80f3b18b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: fiXAiQN-fYM018KRhGvDm8_CItReycSQ
X-Proofpoint-GUID: fiXAiQN-fYM018KRhGvDm8_CItReycSQ
X-Authority-Analysis: v=2.4 cv=AMUSjw+a c=1 sm=1 tr=0 ts=68449cf2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=ei04IxUCSHfnpyqhzYsA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDE0NyBTYWx0ZWRfXwqjfSx/IqXXF
 TIZsfvs/gqL1XU2M4WebHHN6rvGAL7/fPWNMYaCOTBnL4kCXQY6f0kE0fHRr1ibxZV7pkoYxwo8
 JVZkTWz/l/v37msiK/73peSHGP4o2NGG26OCDqOB5p4HpOLnF2PepTDHkqXaWtzVoj42oCKbd45
 xMjRanI9y0QiV4YoHIZL2UNLezqZQo9iv5uCR89oEzKfeXIIhZ0Vk+ajqskDClELPnjy/PCXnw7
 W/GV8rofwDfgDrJhx+lQRgonb1AiKD6ISjSgfM2yPpd6/swHvVhasEIYCSzAlUCFjrhbTisdcCn
 XGDRf4F55Ys2ErivX/KV2z2izf1t+ru55g/NH8tUCcI6YzxNLpntMJk0szox697rDchscZbi4Ss
 0rgihSAZk0NF6+mM5UIJzhqALkr08tC2VYGC/+8fidpuM0n6c86kywWFgunwDSR/+CDloxfE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_09,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=842 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_131131_763463_7277EF51 
X-CRM114-Status: GOOD (  18.41  )
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

On Sat, Jun 07, 2025 at 07:44:59PM +0530, Akhil P Oommen wrote:
> In order to enable GPU support in Snapdragon X1P42100
> (8 CPU core version), enable X1P42100 GPUCC driver as a module.

... it is used on Asus Zenbook A14 and other similar laptops.

> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 62d3c87858e1817bac291780dff3823dacd72510..9cc473fd0d3308f7869d00425e17b114c87093b2 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1350,6 +1350,7 @@ CONFIG_CLK_X1E80100_CAMCC=m
>  CONFIG_CLK_X1E80100_DISPCC=m
>  CONFIG_CLK_X1E80100_GCC=y
>  CONFIG_CLK_X1E80100_GPUCC=m
> +CONFIG_CLK_X1P42100_GPUCC=m
>  CONFIG_CLK_X1E80100_TCSRCC=y
>  CONFIG_CLK_QCM2290_GPUCC=m
>  CONFIG_QCOM_A53PLL=y
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry

