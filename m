Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65017CD8CAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 14:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aI77O8CJQYdLvJeOk6wk0XdV8aL27Vmep/f1OBCKYOw=; b=MbsKA63/BaJp3EHi2RjpgTdKw/
	gA0s2uMzM3g/MFPhbpzzPmifnD79YBJ95Two8zyke78WUF3QRHBzivNY0XrW7FUesv0Vrupy32cdg
	8DeNbVVT05q9hLdHgnwdbDXi15kk/6lj10avSQCnpReZ8SatHE98fe6YA4N0DHspTsnYlb7zeShma
	x26Y6vlZyKC1pX0TBXfKO71F5wBkLiW3Pe76aTpV9mnDfERLzg7Kt9dW9lDxxhs7/RskkbqdJUTVk
	MaKMToWNkWerddAhpvyK/VRgWB8xvW65m3sH1JZjPv5s0SYWYgZRWgP4DipHzGBoROZA89BUcJ6aU
	kBIyt+4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxqR-00000005pco-2kkz;
	Tue, 09 Jun 2026 14:54:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxqO-00000005pcG-43Bu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 14:54:22 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClKmt652203
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 14:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aI77O8CJQYdLvJeOk6wk0XdV8aL27Vmep/f1OBCKYOw=; b=ZhkhebgR2zoqYeo/
	2xws2T09pgVBRSGN6bcoL8wMfMzP0WwjZfjzzjkSaAh/Go0QcwZJYrSn8tpBs1co
	NU70HdWw67A6X7XdoE/5DPUzbs2lEO/5k3Wy3tdvdZIY8RBSHxDd3uFAkBd1eCzV
	tL4E03OFGYuYgR4RBWv9aAGN0OPWZ6tQKKyXcUudwySqx2LuKyR0suWkw6RKRFlc
	xgzkwNBz3+JS3okCWhxNVkXB1PexbSCnycKu0WvHKkPcKpi1hyxt1IxA84dsYxJa
	4CzQ3HAqXsewSED+7RjoaqM3czPIC6TvUNn0ej5wXdT7ZriCSOQtQFSK3fYuG6lA
	KymTlA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0sswwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 14:54:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5178a632a12so15409861cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 07:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781016859; x=1781621659; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aI77O8CJQYdLvJeOk6wk0XdV8aL27Vmep/f1OBCKYOw=;
        b=RvZ5Jl5UmVjMSWL3sqtqTbcaCWblMzYAsiIUZQn98SEOW8yRfV+r8QI1gjPYyBtaJg
         CEPjToHJQEa/Kuwh9eZyrnto5zZx1Sm5RtFU5yeVCd5OAK11/TEnLYPURhBYvK1o3pkb
         HK4FZkHhNzUyLbNGfFdA9k41WPkAQJGT9LJn5Pg3z4avKr2Pwrj9ijQ2mSKJ+3d+uqSV
         AyxGchZXf08/+CL2AmHg6EJD8vxjDSWON0x9TpmleDkIu7R0vvZkQBiKgWFLlcWcbE3g
         urfbYSoK9i4+HvSCzJFRrUEyWzRiZBqxlYZ4wAdaVbM3C4TEpsRIvnBhtMlFDEi9czz7
         Im1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016859; x=1781621659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aI77O8CJQYdLvJeOk6wk0XdV8aL27Vmep/f1OBCKYOw=;
        b=bfxLaggzo/AEAkmLRSTfgpSNJ4x8SZAlYn8S8pinN8NiaKLabfM58fXt1LFrX2iFR6
         A2yfaOXTV2HaW0Wn3+O1hiH62eqdlfUFZbUgw1+A3HiZ23wIGr1Uz32dOBssdcFSzy5i
         3D1DWGV5si0KHrSq8U5/GiXCEyNd0TYSI+hPxpWh22kUpWmS2aVeCTaenUm/FvVZLRJI
         UPHM/j2All7mseS0NUTlIUn9+B9uMjdILRhaFddlbbp2Lfn/LMUX1cJjdAHPqGDEKxZP
         Dv6WH6YmFPTugFAjbOfie8wnW48SuyzzIhK/Fzc2GDKMwW+37XI63//f1rm8f5z/fDGs
         Rfig==
X-Forwarded-Encrypted: i=1; AFNElJ84h5fuCswEAPu8x2nMvnDmkkOFKR1XEJdg5rQ//NKuDXwtaebOAhdf6JFss2cEF9QgpckgKJD4I2jaWyzJpYDu@lists.infradead.org
X-Gm-Message-State: AOJu0Yxkd1NTYpL+vmY+Ftuu6XFRtvq7ySxKfdAJjamRuCfgqRp9t9PD
	l0Ke2huxk3I3JMOalNY4mYXoewvgME3EpbcNw9WGP1d+OZwd80On6a9o59lhBvd8nZEYJhlNuhk
	gMiDJ52HxkOJbZ42eEp3M8W4kDQOcB/LLeOG31kONiWM9Q2KzlsYl8JfbB7JmZ0izDvnqb39efj
	x9/Q==
X-Gm-Gg: Acq92OFIPwU4yjg4snCaTNVEa3zwIYn1MaKKgmITqvAvFSP8AP8Seiq+YdqoNyqkx56
	bpL73cP76kxnc47YIdol3gSVRJAcHaiOgAoWCKwt1jsjK35fNCIFCqQ4ojAoHev113pwpFI4yPF
	/UprUAhp880N5FfwVC12ALiizNIkH+c5qHYliQpGsb4duQvb/WLu4TQ0FNtHNzvTvBpKiYkcvp4
	pZbfHL9nAK2FTWyKURgmhcOzjXgF/MIxy77qyToNqsFPY8wSJ3Mcr672fgfVe8S6jY3TPGdHEVg
	pKSDydALXWh6w6P2HWu1YPILTPq1dAhPyQmh1cIpcSAM9cCtUn4QDnJfZXCSoqGQWiI7Tt6GNRp
	INxwqDyq2GRk1Q1KMVd7fgXTqaq8ssbN9uodlRxBVVXmYpbxTcshWP7ot
X-Received: by 2002:ac8:59cf:0:b0:50d:9138:3322 with SMTP id d75a77b69052e-517ca478a9cmr25292131cf.7.1781016859323;
        Tue, 09 Jun 2026 07:54:19 -0700 (PDT)
X-Received: by 2002:ac8:59cf:0:b0:50d:9138:3322 with SMTP id d75a77b69052e-517ca478a9cmr25291561cf.7.1781016858752;
        Tue, 09 Jun 2026 07:54:18 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm1053926366b.52.2026.06.09.07.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 07:54:17 -0700 (PDT)
Message-ID: <604e0428-61b5-42a2-b6ce-a2b071378cbb@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 16:54:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: glymur: Add GPU cooling
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
 <20260522-glymur-gpu-dt-v5-5-562c406b210c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522-glymur-gpu-dt-v5-5-562c406b210c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MiBTYWx0ZWRfX0omah2wJWqYJ
 p8Bf0DHJ8vD2/56FhpFndSSTBhDMxj5o7pjnZEVCd8k50eqwNrdzWm+BPGtv/P7OYvBcYnM8hwL
 1LZgnhdPbpaqkd0iECIMD8rZ9P+yKCjx+t/s2l/IkVArrbBadRLbK7Y28P5q3GysTiwJUrr7n0W
 2oKKjfS1jjMiHNvUxT3auigtYiqLhjaigLVp9EeQxUyTMpJI9x/WyMlKSQJyvudBv4LcBae9Msd
 54ZDnuYjNKMggeL06eRKRV2btfOE/kOh8duQNdFx+Ims9C7rXFz/pJam+fVM8Ws+/an9F4Q9qO+
 Pl/8qvp1fwpZawbP57kw/prWW9aVMnHuQY/kaa9imyAtLZOG4uCCxWS8rEVKUgs6ou3JdC0n/6L
 pXnNulx1+CrVCUraB5BTN1Jr4mZhz6k/J41xzgbfARv/LQGlHMLjQhm4EuVkoilLUVb/LWUL46x
 xqK9xNehhf6MkObtQRw==
X-Proofpoint-ORIG-GUID: i5skzA-3gKgO59ne_0wHSiNQp6fbBiti
X-Proofpoint-GUID: i5skzA-3gKgO59ne_0wHSiNQp6fbBiti
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a28291c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=GwzMoqaa5OBlIbEppCgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_075421_029664_0BDBCAFB 
X-CRM114-Status: GOOD (  10.78  )
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

On 5/22/26 12:12 PM, Akhil P Oommen wrote:
> From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> 
> The GPU does not throttle its speed automatically when it
> reaches high temperatures. Set up GPU cooling by throttling
> the GPU speed when it reaches 95°C.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

