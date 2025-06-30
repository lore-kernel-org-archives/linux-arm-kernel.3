Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCB6C83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 22:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5Bn6WtEbimwKYIt4/ZjgnbSpY9GsCsqCOMb7LdunEU=; b=HTjZmZ9TloxKCHQg3lMnfmA2Nj
	sYq8LWuA5qiKjrlw1LbXwvp3fZTbU3vj00sTwmBEJ2hyZsyn8l8EIDl4LX1CV1M11rbCgP5xsgfEB
	BiaXidIECZ+mnVDCPy2b/s7HsLSsMETgKobYEL6LZmB8ncDeeXiubRw3pZiBgsrhRqlIlZvynIETn
	z9C8HXi4O9q3dKuvE7slhISCyA3Vkum+BSAdOzNHjzLJlIZiIMCdnVjlDt0eOfHmi4go5KrPztK96
	tE1k1f1bSuEbJvKqHhcrUeytNOibd6NKr/S7Do3zv3p2F2FfvENIgAPgAgL7PTKL/bBEVcjogkU1f
	uOmGOt+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMjm-00000003ZFH-45m2;
	Mon, 30 Jun 2025 22:12:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMXc-00000003YAQ-3f6l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 21:59:58 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UG41Ya007067
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 21:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j5Bn6WtEbimwKYIt4/ZjgnbS
	pY9GsCsqCOMb7LdunEU=; b=et1/w5/JkJ7dXjXHYCkG8PGJ0gnTKCmfuMUAHgEo
	HMusIxEdMGHLVJMBvRXcHeFJ0IU8yHu338YA+kKlJ8zoqUKay/z8lRaXyYA5xXQe
	TvnFe7sGzVvRjLokMOAw9kZDHFwXOY0Y0VWk5XtDY5ivwcpJOldPKRyo0jsu82W1
	67+g32o0eWSyLsW7C+lEHxRGzbCq8ncj10DBJcBvDfY5E/VHglRmsaJDBguRp+s7
	tcQINy6lXufuwmV5jYBFBFKJHeiXSGnUQYng1bF6DrIdzL7T+BseAAMVuz0GKOTu
	wwQiYhV6I7cl5nv7Eb2HThnTgr28MTwHHOVMFmYjdqxN8g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5janhq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 21:59:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-313f702d37fso2371836a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 14:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751320794; x=1751925594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5Bn6WtEbimwKYIt4/ZjgnbSpY9GsCsqCOMb7LdunEU=;
        b=moycBOflJOZIlRDgXNrpeyOKXRTGqJn4bjwTqx46qmo2j2bvDApAWye/zMNmpgp/yn
         RE0TKUJs+rairgIzkeeUUSkiW4BOyQmdlhcBNl2sMUcqlfanx5AC49PVoH1+1jehME6K
         tu0nx7aHbINejzZQ8BZD+uv0yTofytyplDemQ29e9zeIqZLarWLnoCskkmXyyHK5nyZm
         qPc7XLZGcYVCq/gKm1zRvbs+iFyjQirFP8CutdohYdt4mtiIMXAWj662Pm6DEtUOyDFf
         jKAeTq3CwMjHgrKNBHMbl32W8mSv7OdREyyDRtpM5g86/rCf/DjuPqts3WdsW7mxdzER
         Ge1A==
X-Forwarded-Encrypted: i=1; AJvYcCUZwwhOaUTWx0EBgWOZlweXxOaCtd8w4uhrl65rywlXbtr7vant5k7e3fcuNs73I56UJHcAdNY3BweK83K2t00v@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8L6b+im5WSPTAjQZWCN8V6JR+vQiH3Dyk9Xu6r6CVbkPXo9E1
	zQQFW/FGEAmumLLiQbeilK2jNZfxsGZT/r+++wi5j8DGjvot0N9o4emHE1OeucWilDgK8ddNwnA
	o23K6hFCfISH7P+7AdmOkgZ537KKdpqSrVVB3gXwoWOu+GY/tlig/fPr9DgRoZJcu7cI016Ccwx
	M8gg==
X-Gm-Gg: ASbGncuASkE5QyFlP0+7DDgi2L+BmXHmfrRjoe2GwlAjGKt0hUGclw42DeKqgMAmBQd
	P5gkQV1MhVdzPZSKR4k9g+lySQ9lF2N4M49WM4Pn6up7jLFM9h30ySi/ZyMoITkUPcNftS9o4CY
	9qSxxy8M+sHRU2PZTaMv9l3NnBMGUBe/uh2Q9iN26E27SWBkIPtSWTIVt80ZO3trc2JqahxCZKv
	DXMhiP7ZmKKY407zORpXWkl8Ub8Q/E682LxEXaC2P1vban72BKDcWmITzQsHGrpfD/CZy65muCd
	2PA5GX4GE0mbEfD2dg4eB//h4ynmRqgxS1zHEOxNgbyht1QElcdb/5CnInICj8BYpvhI9TW3Vpp
	Q/iDIzg==
X-Received: by 2002:a17:90b:268d:b0:312:e91c:e340 with SMTP id 98e67ed59e1d1-318c9283adfmr21494864a91.35.1751320793826;
        Mon, 30 Jun 2025 14:59:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGb3EC+ajrtLWff/5gPWkKDnqD5kFdfXbHl7+2iA8bxSslPgNcBKF5TWjxSHHYgk8wAF+S2XQ==
X-Received: by 2002:a17:90b:268d:b0:312:e91c:e340 with SMTP id 98e67ed59e1d1-318c9283adfmr21494807a91.35.1751320793324;
        Mon, 30 Jun 2025 14:59:53 -0700 (PDT)
Received: from hu-bjorande-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f542661asm14131485a91.26.2025.06.30.14.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 14:59:52 -0700 (PDT)
Date: Mon, 30 Jun 2025 14:59:49 -0700
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-mmc@vger.kernel.org
Subject: Re: [PATCH 00/14] Various dt-bindings for SM7635 and The Fairphone
 (Gen. 6) addition
Message-ID: <aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com>
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=686308db cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=ykmX_Yx8RuNhN3dvDKMA:9
 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: KSZ06ofleleA1MnoD9vJVRE2DUX75zOB
X-Proofpoint-GUID: KSZ06ofleleA1MnoD9vJVRE2DUX75zOB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE4MCBTYWx0ZWRfX63pJr1pt8NY1
 z4lwgmaripr1vfgC5Ms/OQWs8CkHypJH9Y4OqlHgpxmXrwhhb1Q8BlNcMM/i5oXMfRqgViPGJRK
 WPaMoWOGZ79jSf5RBeJzlItEPSPn8ayPhx38mlw+HwRfcTOlmgnzSchIbvajQBuM7wxIUb5J3cL
 q/IGRg6q6dnTMULy7xVSCazDNHynbcJcw3fdc018OjWpRrsQ1O4ar09dEYSIGJWgW5nZZ2t4bc/
 CmKk0w0usRQBt2SuWx4oWh5ZoZ1VBJJkSJ44hdqGlZ+2AwRiUU7fVCrGcYK0DA2/C6uYjvuZAqu
 9CleuIr3qVvciGWQf0GMY2JgrFZKxyAYLsc45JKYTU/ofS7bhNCHt676hecP+3m3a4WfSU8z1n4
 EHnKAmuI5CVGslyxCoRSPE2v0vXFDUETn7k/BFJw3zzjWbR/k20G/FrXZbzSnNPhaCQ021m1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1011 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_145956_941708_59E4B33C 
X-CRM114-Status: GOOD (  24.22  )
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

On Wed, Jun 25, 2025 at 11:22:55AM +0200, Luca Weiss wrote:
> Document various bits of the SM7635 SoC in the dt-bindings, which don't
> really need any other changes.
> 
> Then we can add the dtsi for the SM7635 SoC and finally add a dts for
> the newly announced The Fairphone (Gen. 6) smartphone.
> 
> Dependencies:
> * The dt-bindings should not have any dependencies on any other patches.
> * The qcom dts bits depend on most other SM7635 patchsets I have sent in
>   conjuction with this one. The exact ones are specified in the b4 deps.
> 

Very nice to see the various patches for this platform on LKML!


Can you please use the name "milos" in compatibles and filenames instead
of sm7635.

Regards,
Bjorn

> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Luca Weiss (14):
>       dt-bindings: arm-smmu: document the support on SM7635
>       dt-bindings: cpufreq: qcom-hw: document SM7635 CPUFREQ Hardware
>       dt-bindings: crypto: qcom,prng: document SM7635
>       dt-bindings: firmware: qcom,scm: document SM7635 SCM Firmware Interface
>       dt-bindings: qcom,pdc: document the SM7635 Power Domain Controller
>       dt-bindings: mailbox: qcom-ipcc: document the SM7635 Inter-Processor Communication Controller
>       dt-bindings: soc: qcom,aoss-qmp: document the SM7635 Always-On Subsystem side channel
>       dt-bindings: thermal: qcom-tsens: document the SM7635 Temperature Sensor
>       dt-bindings: dma: qcom,gpi: document the SM7635 GPI DMA Engine
>       dt-bindings: mmc: sdhci-msm: document the SM7635 SDHCI Controller
>       dt-bindings: soc: qcom: qcom,pmic-glink: document SM7635 compatible
>       dt-bindings: arm: qcom: Add SM7635 and The Fairphone (Gen. 6)
>       arm64: dts: qcom: Add initial SM7635 dtsi
>       arm64: dts: qcom: Add The Fairphone (Gen. 6)
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |    6 +
>  .../bindings/cpufreq/cpufreq-qcom-hw.yaml          |    2 +
>  .../devicetree/bindings/crypto/qcom,prng.yaml      |    1 +
>  .../devicetree/bindings/dma/qcom,gpi.yaml          |    1 +
>  .../devicetree/bindings/firmware/qcom,scm.yaml     |    2 +
>  .../bindings/interrupt-controller/qcom,pdc.yaml    |    1 +
>  .../devicetree/bindings/iommu/arm,smmu.yaml        |    3 +
>  .../devicetree/bindings/mailbox/qcom-ipcc.yaml     |    1 +
>  .../devicetree/bindings/mmc/sdhci-msm.yaml         |    1 +
>  .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |    1 +
>  .../bindings/soc/qcom/qcom,pmic-glink.yaml         |    1 +
>  .../devicetree/bindings/thermal/qcom-tsens.yaml    |    1 +
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  arch/arm64/boot/dts/qcom/sm7635-fairphone-fp6.dts  |  837 ++++++
>  arch/arm64/boot/dts/qcom/sm7635.dtsi               | 2806 ++++++++++++++++++++
>  15 files changed, 3665 insertions(+)
> ---
> base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
> change-id: 20250623-sm7635-fp6-initial-15e40fef53cd
> prerequisite-change-id: 20250616-eusb2-repeater-tuning-f56331c6b1fa:v2
> prerequisite-patch-id: 5c504d171a4d1acd9ec376e01e0dd0fddbad92b8
> prerequisite-patch-id: 0c97dcf5472fbed8ef4cffbd482f3169fe1e972d
> prerequisite-change-id: 20250617-simple-drm-fb-icc-89461c559913:v2
> prerequisite-patch-id: 1ce32150adbe39ad43d9a702623b55937d92a17c
> prerequisite-patch-id: 3562d9a85381bee745402619a7acba9b951f145c
> prerequisite-patch-id: f8447266657b779a546ecbbbc2e38bd61c422f08
> prerequisite-patch-id: cb9d07c82e73ab3691e0ace9604bfa69cdd6bb64
> prerequisite-patch-id: 18ab6ca6a024e5b8ea8138111064db593d72da35
> prerequisite-change-id: 20250620-sm7635-socinfo-8c6ee8d82c9d:v1 # optional
> prerequisite-patch-id: f1b2e11df96c271c9e3d010084809f361ee4249c
> prerequisite-patch-id: 1471abf17230db340c67a84b5a9009f1f2ea6e0e
> prerequisite-patch-id: 57bff00c4fedce1b78615375f12517b955dd1d16
> prerequisite-change-id: 20250620-sm7635-pinctrl-9fe3d869346b:v1
> prerequisite-patch-id: 43b88c44c6fc5b72a490cd3acc5d2585206e81f2
> prerequisite-patch-id: b3b6ebd4a288bd4abf227c939a1a92eafb2cf2c8
> prerequisite-change-id: 20250620-sm7635-clocks-7699d338dc37:v1
> prerequisite-patch-id: 48485e0e7e8a992695af1690f8cd2c09c227a4bf
> prerequisite-patch-id: 4685ceba3f900ad6d1d2ae35116d37f64a171d5d
> prerequisite-patch-id: 80f71dad0c0a77da98e5e66b592f38db6d81b4b1
> prerequisite-patch-id: 49a2fa1a14931d9143da232969e7487061466930
> prerequisite-patch-id: f5d1794f61488235644f78ffc28e3dacdab215d1
> prerequisite-patch-id: ab257573067ff09c94270e1fa6ad4de1480c06b9
> prerequisite-patch-id: 6608bd3f2e198a0780736aebcea3b47ee03df9ef
> prerequisite-patch-id: c463d0d2d84c8786ed9a09016f43b4657cbc231e
> prerequisite-patch-id: e113e76af37f01befaf4059ee3063cb45b27fd6b
> prerequisite-patch-id: 40f8b8acd07a9ff7da8683b1be6a58872250e849
> prerequisite-change-id: 20250620-sm7635-clocks-misc-0f359ad830ea:v1
> prerequisite-patch-id: 127f332296fced39a2fd2f9a1f446ba30ec28ceb
> prerequisite-patch-id: d21a0c8ceb06523c9f3f4ce569d28714878b3f84
> prerequisite-patch-id: 87029a8844ef174ab3e0f953a1d16957fe6c13cc
> prerequisite-patch-id: 095c767d7b7aa67d47026589c926636e57349ca6
> prerequisite-change-id: 20250620-sm7635-rpmhpd-dcb5dc066ce2:v1
> prerequisite-patch-id: d71fe15334032610c05cb55aeb28bfaa44e3530c
> prerequisite-patch-id: 729544e856b8046f7a311b719d9495f8b33c1e1f
> prerequisite-change-id: 20250620-sm7635-icc-e495e0e66109:v1
> prerequisite-patch-id: b387217215d6f83cbd50c380171b159a2f1406d8
> prerequisite-patch-id: bffd82274c35f6d520f524aa2a9c1c4bef7e047e
> prerequisite-change-id: 20250620-sm7635-eusb-phy-d3bab648cdf1:v1
> prerequisite-patch-id: c242c9b099d738214def29d2e464b64be5f14e62
> prerequisite-patch-id: 8c1eb426c08bc1ec9462e77139b3b64d5e1453e9
> prerequisite-patch-id: cdbc469ab33002c6bf697c033755b598dd1a621e
> prerequisite-patch-id: 6bb2900bb530880091622ef47d141fe1f5756a52
> prerequisite-change-id: 20250620-sm7635-eusb-repeater-0d78f557290f:v1
> prerequisite-patch-id: 5c504d171a4d1acd9ec376e01e0dd0fddbad92b8
> prerequisite-patch-id: 0c97dcf5472fbed8ef4cffbd482f3169fe1e972d
> prerequisite-patch-id: a618abb349c3de5b49f79b4b0f86d9ab502ad500
> prerequisite-patch-id: 09f91ff3a25c16a0375bdfec80604a64eab0b4fb
> prerequisite-patch-id: 8fca8b09d70409c5c78f9f1b77d0a4c75bce38cf
> prerequisite-patch-id: f5c2c24d2baefcd7ff91718529ab2f2c264ab99f
> prerequisite-change-id: 20250620-sm7635-remoteprocs-149da64084b8:v1
> prerequisite-patch-id: 3c95a20dd456dfee100f2833de4e9931a2073c7d
> prerequisite-patch-id: 5292d77663ea9c44346b8da86bda36e0cce3fe56
> prerequisite-patch-id: 015edcb2a69b5e837dc7edfbc7adc22145ba611b
> prerequisite-change-id: 20250620-sm7635-pmiv0104-34a679937d9d:v1
> prerequisite-patch-id: 8fca8b09d70409c5c78f9f1b77d0a4c75bce38cf
> prerequisite-patch-id: f5c2c24d2baefcd7ff91718529ab2f2c264ab99f
> prerequisite-patch-id: d7a06ece910e7844c60b910fe8eed30ad2458f34
> prerequisite-patch-id: e91b741c9cfc80aa149bfd8e43cae90ca58e17f2
> prerequisite-patch-id: 5ba4a49c3792cb208ee064a6ba13545e40cb70ac
> prerequisite-patch-id: 5bdfcbdd226f7223c04a65c1a3cdcc3ecad38858
> prerequisite-change-id: 20250620-sm7635-pmxr2230-ee55a86a8c2b:v1
> prerequisite-patch-id: f0bd6e083324f954b988647bb42d4e2be179fbda
> prerequisite-patch-id: 8fe1c0fc544e8bcb35522c5eba0b36e83bfd0c19
> prerequisite-patch-id: 525c9eb0087025024bb0aaec1ed1d7d2c0bc8f03
> prerequisite-change-id: 20250623-pm7550-pmr735b-rpmh-regs-06087e5b3a99:v1
> prerequisite-patch-id: 7360606a06f8fba3ea9a8f84b4ecfb8209e91ab0
> prerequisite-patch-id: 7a06a346abdb7f7386912b92f2b84af87e7439a9
> prerequisite-patch-id: 1e1a6eb9c5421812c07421f9fa7e3f16b26a42da
> prerequisite-patch-id: 224df3e4068bee3a17bde32e16cd9366c55b5faf
> 
> Best regards,
> -- 
> Luca Weiss <luca.weiss@fairphone.com>
> 

