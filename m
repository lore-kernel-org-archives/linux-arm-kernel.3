Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DCFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SbjCETrpVj4j77Vo3a/oe72PsOFxot0+LxVY86kScYM=; b=yb4mX+0+n0PoDm6/3rVjVQuZvJ
	1l3YMy4tLoFc9PE28LBRul1RTQs3z4/f4xsSjYr2P/JaUwMJWxYrYrVPwICKix7EOASRkyGuZl5bg
	Q84tE/sdjOA24Z3GbgdptynVdIhk8FIAK8RRbtmJV6AiLabR/bioHs9PSjeTxY4USddKgeBihlpFA
	9hJ1DEwFdsrCuPXoIpGR0o7Phagl+gSLnq5jfSHf9KuM1kS+YW2hdgZueqoa1CTXbQtbkNyGa0oxE
	rSKogOpty4m72lkb7pORT7C9f6nBGBsGaL7bVsBJSs/CJFVg3egpHJGVViIYGcPcjynClVAqR5l20
	MfOXQiVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfnQ-0000000C5JD-0yjm;
	Mon, 06 Jul 2026 09:39:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfnN-0000000C5Ih-33eD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:39:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669436a4108150
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 09:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SbjCETrpVj4j77Vo3a/oe72PsOFxot0+LxVY86kScYM=; b=igSfXDSGDXZyx/+x
	3CJahP7NvHEriESw1Af3soF728wAkm8m07BTNRQTpyQV0fid7mWNRl02gXhYnqfK
	bcBuMpD07adRfZTDp0SxSdh2UShWruleWpw/E6BQdNodE7o93BBEDR0TdVM2WKrf
	1sAnRmnjHO5SaJ6Q4pjJWO3/NatVmggzTxajWuTS3jmic4RD3cl5WNsW0MZXgEup
	FksPk3ls5DCyO1vE6BYGTqN0SoTKCEIAjVASH6ujrtF+CXDZZw3dcXIQpjCrIT1D
	2WjGHPvi6Frnz1luwacQfR7vZbQ+uCjC3pPXQowDURBYYqvPTNHnn+/JR80Jfrqy
	A0PsWg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxrk4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 09:39:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e21552dso66413185a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330760; x=1783935560; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SbjCETrpVj4j77Vo3a/oe72PsOFxot0+LxVY86kScYM=;
        b=kGzHeTygfNXT6OzuT0fcgpatYn8P2wMao2KUp16WRuWr3gFoFQ7U9wlCgBlrrUhf1w
         dVytteA5pTup2tECx9LkEm+HRH3qF4QM75nTYULSTy1CbxZARF3y5fSXSt+y/ziGKw2M
         UK6Qijdf2Up9khDeIQ34YGiw5x5ibih0BZ8yUE2nSLlvOw7IAPB13xnKTshDTzLfvFlW
         Han5xibSKvNTGhN0sV0DCrLJDmCpI74m/nqgQNnugRaj/yLfw0y9taTEt2LncFiKyowY
         U3Bul4AByqnq27PhHGXjioSDvCfxs3oQJu2mOpEy2K4Qb3lIEwe2UrJTZxkSKrqL/6cm
         sDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330760; x=1783935560;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SbjCETrpVj4j77Vo3a/oe72PsOFxot0+LxVY86kScYM=;
        b=eWfOyuUZ86T54DJggNwfG8m0D0kMraF8ISx2HAMMOocAXFKX45SBy8yYLEq1Dafc6K
         RDwsFpWwr4GlNUnlxwyYaSCN2CGktfgIS/XZYHEzK9n0Y+mkAnkdF+2H1UAPKHJ9hsxr
         EqrSICcKb7WVyOwot/XV1jrunkBpdyUcXw5HyZW+qFDJHSKLPdYFh/ah5yWJxyvWNbWS
         BYT9obnS1RpA6mUmdKm6mLEUAPKroGrybUv10w6xt7WyyYHj0AkfqvfnnhzN1j60F5K3
         8rcR9P8A8bAy3wZyQZKPPKf6ECXwGYf2rO2y+EkKvWyXyLX3oEB0ouS10D9SLeiUfvDw
         u8kA==
X-Forwarded-Encrypted: i=1; AHgh+Rre+UCEc2sVralpT63/Tzb1fa0TEzcrmFJEnAUhtsnMdd+DJRIbpbfPbtUekyhrBQrq1zvwj/7rnbVpzmiNBC8k@lists.infradead.org
X-Gm-Message-State: AOJu0Yz88ZQhOhxl3w4fXKs3DwvrBuGu+5+SXaiaNGJKJCXTK+oHn599
	6V1tmG9sdgcueJXPX32+X2CixyHg6fRQBUtH8KT+2F0n1kQt4TUs5EwRvdS9XiIN90AgN+I8y1q
	ajSBQbiX9DqJ36T2IlCje1DnvSgLlsqU4ABvWSIA8BcsJbYqS+8XK8sadio54d8ttCY3Zzcg4Cp
	bvtQ==
X-Gm-Gg: AfdE7ck0ukErtYBanndu3KIrahabIwQQA8Zufncmz8YXmcrt4anyqm1LTZEmbGpjSel
	c645gQW3Lat7A/VN5jgWWa4Gmp6/maYaRqsgS5gjNHAOZZ/BR0IQRhasqoE480HrGFnHWw/raJ9
	/MA60+8okE5VYe00db2cL/QnTJ11w1dLzzQwwWcWo41U/dm2iB/zaqCLBAjCw6Ch7zlNze4kBEx
	0Y2CCn9wgwV5aVdT+FLRG4CSwwR5uVIo3R+aBf7Y59h4scbQnEFkDcNMNpJIJ4edVIstBlvQgd+
	JUc5xUdy4ScyRoWuw7jocdTXPnqHposYkQnhocyULjkfvP//qZ+FsuqcwRqA9q4/anv7BSFPmbv
	ffgDPedZxz8tfI6G95ZTX0QmxhR+B6k1crPA=
X-Received: by 2002:a05:622a:8b:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-51c4bdfe4d1mr85762681cf.5.1783330760054;
        Mon, 06 Jul 2026 02:39:20 -0700 (PDT)
X-Received: by 2002:a05:622a:8b:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-51c4bdfe4d1mr85762291cf.5.1783330759458;
        Mon, 06 Jul 2026 02:39:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19daea67sm3674475a12.26.2026.07.06.02.39.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:39:18 -0700 (PDT)
Message-ID: <2304770d-a752-48c1-a11a-30978a834b0c@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:39:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: kaanapali: Add GPU cooling
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-6-6ac53de56314@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-6-6ac53de56314@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: s72JkmIuSs1eJkXL44XZR03PL0kn1kBF
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4b77c9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=K30R3rYzCv3NiW1yJugA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX1KXq/lKwvT3S
 eXNVu0eQ+DlT7VDRRnwZjK1nYiTs2w7Axa183MUurQv0aZ7HYpjDfi6/Ehi6CmTQgfJNdqASXkK
 3H+ZjSZ4cEbE3Cb0/KcSXaxuquGaXa4=
X-Proofpoint-GUID: s72JkmIuSs1eJkXL44XZR03PL0kn1kBF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX2JDXnhyykJ/n
 xsHefuWQeG45GdZOZm7j+UD4KB27T6R/MQ6Q/+8b9vrzjs+hblzTRogPFA4qTxzKktoE2kk03AY
 tUGItLdzM4J8odr57iU9SojQoMmWt5JI8ICQultc1PuV3qshFMY+M/wZf1QAZM0HXl6xAIWYRVE
 P9bZDhnAgAT+jNYmw+w41dSKinPj1hnGeiE8/AJ9ZHmZnhs2Vr9EeoXS4u/a10u52uZuQ3P62FT
 cHU8d1ZcDxKpYED8jBrqu9LHBudbbXX9eG2qyhq/p4j9KuOdcfO/xvQ7lMA8JGuzu9Gy4xkcC6b
 7C/8EVbqdWkvihxFYWc1aFHUTje+qkTIS7aOwVo/g90qp9jP3MYp3dUtcYipPIaPnDSIfh0JQK+
 1236gV69WjF6Gf22FsjffyWAP49cN+ymwG0UYPhaWKkESYR434+7nmEF+oxhDGfDuExM8TzyDBt
 7Ik2vO2/jD1N3GJejig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023921_774038_3E00BFC1 
X-CRM114-Status: GOOD (  11.40  )
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

On 7/5/26 10:00 AM, Akhil P Oommen wrote:
> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when
> it reaches high temperatures. Set up GPU cooling by throttling the GPU
> speed when reaching 105°C.
> 
> Introduce a passive polling delay to ensure more than one "passive"
> thermal point is considered when throttling the GPU thermal zones.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

