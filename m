Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40DCCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 11:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXNsvpmExzEXM1J7XKQU25avjaUjuFbYf81y6omDQEg=; b=K5ON8w5Q9db9b1SoLvtpa3uq2p
	Ec0TBcDQXUqjFHXH+/M8JmCxRqZWWRBRgnAJFlcbUHbsr7nnamkDaNWyGSpdJfwhbyTXn9lNP6uhC
	EUadWS5dEK/Aq9CgBOHrIS1JKWHxYaPyU002FdUDSD34MRmegcdoH61YWtgEstEEDuvvLGDIgrIAG
	/dBrjLvRG4Qc93kStneI70mPVbuJnWkXFiWFlCKB/Nvsma6VCCCtxuPhjDG4q9nNy1E/huPJ6rIln
	D22onPrrEBSyAAJ29ywCjqyeX1afdxU34VY2vYIXIqI2GVDRIqs5RAfOpDqaYorpEHrlYk5pKoDfD
	QPhRzP4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzRB-00000006BrM-0EHG;
	Tue, 23 Jun 2026 11:37:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzR8-00000006Bqe-3vpk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 11:37:04 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBYtJp113975
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 11:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MXNsvpmExzEXM1J7XKQU25avjaUjuFbYf81y6omDQEg=; b=OetdD04sMT8BXOHl
	P0ZfY0xGtL2vRhpknWkdpuLX31ixTvC6kpV0E7VQdx0gj/pE8GCrCnomrMVSoU1+
	L2bCcW3nQ+aUWuIXihofuZXtk6g13KrVR2/2baRhAnB8pdxL1JML37cHNUuDwsL9
	5MVe6YTHbtX2udMawnrW7aZgXiGhpEAyN2hDgmAJLUOFX6tzvK3dZK2DqvRnWAbA
	ndKWhmmmPYlyDqb7nmieAixUTjlWqAOE0oPFv8GUUkOsTpEFyBJ6bbgzJ1gvoniI
	XyL5R7akeITlahYsjQv8hfHbBlRRM23j5kPYYklFHNfS/zERxNBB56rvyaxkX1YF
	GewvCw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvs9bm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 11:37:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5176891d0a9so13481621cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 04:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782214621; x=1782819421; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MXNsvpmExzEXM1J7XKQU25avjaUjuFbYf81y6omDQEg=;
        b=ay08LTlsyqysfoEh8PugBx5ta05JVj/hS28Q4Xpg3JKqmTNvyWsxUuECUK30aUOC1w
         8jhZgt1WPi4FZg9OgXLhCwBaOf6YNigTyhNn9OThJ6VJmxB3l+KwfKaMmzXJ1olynT2/
         n1t+TcqX6FD3d/EcMmk63lCs1YJPDDGp6qkIQXTqqR2SeSxSGid5agKg9kTOWV8Aicmu
         hGWDPrFTXXLGqrSG8FnFe9tOGUuP/SXOtfp4eEvBu+YBjSFeNXBXdhQb5aX8v+aypkuG
         RIZsES4pgk9OBRH45mxu9OtgzzlUldtGLHXH1FD6AmVh8081ADVj5NnqHN96dpjwhDQV
         DBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782214621; x=1782819421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MXNsvpmExzEXM1J7XKQU25avjaUjuFbYf81y6omDQEg=;
        b=VXXElTo7jyl9reeW1ewmKCQQurtPmat2XL7q41ECEXtVtTPkJAib0rPcEpPejT9VAx
         QX4Ll5lnnPAQ/f4BOLM3aks2Tn1sDhliQAfRR6oyY3RVV3Bc6LS5eVpV/9YtO23Z6J0W
         7foSGba0K106X/nns9yG0k2roJcPnVdvxcIFrcV1DiXRs/ifjcDGWiJatnL4qlC7ccNT
         tnpoThTK3yxuBpUIHbM+tjY5vv5rJ/7WGruXlb3lj/X5pk3/HxXxbUZaozJ5thLg/Cbo
         t9Kc7j180f+mSJdsqc4z7ikFP7paj7n+SQj2uGRIM8RVhMth4Ek13idJY+fsxUwv6eTg
         ZLBA==
X-Forwarded-Encrypted: i=1; AFNElJ9wJUykjyQK1Xa7XOBW73fhoAKtZU5c7g4KWCo7qiJRHR3R7CT+xeC5B0kn+qxpJu1nltm4ymibFp2JtgAlOP0m@lists.infradead.org
X-Gm-Message-State: AOJu0YxljVF5O35pbRlzM24O2xnINVNqdxZmel1va752xzSnDW894wZW
	L16g6DYe0Mz+DpNj8qUV0bLrO2I4yrDgWt/f31X4ul7MOa6R8a3Dtow8P0TbYpcrUjMUIei38Ks
	TVWGsi2j4jtVeW/FYpygSOFOjo/qO/3LWwtmiz8ax8SWW9LB+YErnynq1PRCyeypPWwTKZL5xgv
	bSTg==
X-Gm-Gg: AfdE7ck5NOzI5lDyswOREt0LKVsJPMT0xBD5BX4OO7swmh9ite6rtonKYRVJMBTTRzt
	iaYjw0JV6kFgJqT0mTialb4JdQghqby/iDt1JVEVKEJUhT8uN8SxY2gYrXCb+BKJ2wf4K4PY9YL
	9sZiEz/6SYIV+ZjMJ+3wKFZ0rMdYOUim061Z9s0H+NoGGmza3cVVRSynmgDUJ0NPevNSVzUrk9w
	e4BmDE3zTZqcakrDdoSYeVWp2AOlzYyNn1Ezeghcz3RmVYRPKj70w5wAS/Xx1+8LDRwHrxrRbz5
	clcIUW597As0ElcX4Ja1omRHWmtTq3dw3CqxF2m7nCI0/GUsl+MeSk5GHiUQN+5BrZgYOVFveON
	7NABygCzpPpl+AB7vRtkBQyejLgNu/89wDPs=
X-Received: by 2002:ac8:7d49:0:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51a4f380d0dmr47487221cf.0.1782214620866;
        Tue, 23 Jun 2026 04:37:00 -0700 (PDT)
X-Received: by 2002:ac8:7d49:0:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51a4f380d0dmr47486981cf.0.1782214620409;
        Tue, 23 Jun 2026 04:37:00 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be498e4sm4536670a12.20.2026.06.23.04.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:36:58 -0700 (PDT)
Message-ID: <4635a665-f605-4647-810d-c9d83a271a86@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:36:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] phy: qcom: qmp-combo: Correct pre-emphasis table for
 QMP v4 DP PHYs
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-7-37e2ee8df9da@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260622-sm8450-qol-v1-7-37e2ee8df9da@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a6fdd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=N-WSo6sfiX0bQk_JYPcA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfX1sQ6svWnT3EP
 WXwKTaghCTwCXpq2LNlgsY/bVSLd3wzOwqZdzD3BPcuvcJZHZltW1fyj5/3E6GlW4GYeK9javIE
 7UBuMqYovhCZNo8lIWXG5HIqm0HXzlE=
X-Proofpoint-ORIG-GUID: bFMz8bNmX_uTyYMXeT_RpTwuvt3wWDVU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfX+lo9EwqBrgAE
 4nNAYQIQ4041mn2dXjwI/LVXoi6bP+6jsPKdKwzhDLaNG7buV8gZaKeAffl4ZR9GuowPUXjNwCG
 KUXB1Sn57Nk/u+mwhE6J5+9/+4A6IesvzwrWug3VgL+1h43R9GaeNZ7PC1ifaJlw4V/EQQIAIRL
 sozGrQT3YqCq8i/unABNub3D9z5fITedJvXr9v4u/ySe7JxWlPQ+Ui+/vkFBX+KXhW6/MkCYxAa
 IwDcQ14nEOf9KabeEJY50Akrouk+Z9NB33i8fuNMRWqyvsdFDcy1CyjD0RmWXySS/oCIlf/bUJr
 SvSL4K3wvnseGjLlEdtNtKyvxfnJGa/g9dG5va928FQWfaI94DN3NyUoMvVhR3jv9BNvOPKOBIv
 ir2KMqV6v8W/RAwJAKc+trhvtS9hop1fynXFHCJ0Jf3sAPa/up03Ed+xyfcFMpvWGnbjMFYL/JJ
 x8eII3fa5DSMzT60vmg==
X-Proofpoint-GUID: bFMz8bNmX_uTyYMXeT_RpTwuvt3wWDVU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_043703_102363_9791CDE0 
X-CRM114-Status: GOOD (  18.99  )
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

On 6/23/26 2:54 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Comparing sm8350 and sm8450 tables, this seems to be typo.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 9bd666ac2c49..5b278fd54a16 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -2108,7 +2108,7 @@ static const u8 qmp_dp_v4_pre_emphasis_hbr3_hbr2[4][4] = {
>  static const u8 qmp_dp_v4_pre_emphasis_hbr_rbr[4][4] = {
>  	{ 0x00, 0x0d, 0x14, 0x1a },
>  	{ 0x00, 0x0e, 0x15, 0xff },
> -	{ 0x00, 0x0d, 0xff, 0xff },
> +	{ 0x00, 0x0e, 0xff, 0xff },
>  	{ 0x03, 0xff, 0xff, 0xff }

It seems like 8350/8450 should be using what this driver calls
v5 tables, with this fixup:

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index cdcfad2e86b1..63a4f2127e3c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2134,7 +2134,7 @@ static const u8 qmp_dp_v5_voltage_swing_hbr3_hbr2[4][4] = {
 };
 
 static const u8 qmp_dp_v5_pre_emphasis_hbr_rbr[4][4] = {
-       { 0x20, 0x2d, 0x34, 0x3a },
+       { 0x20, 0x2e, 0x35, 0x3b },
        { 0x20, 0x2e, 0x35, 0xff },
        { 0x20, 0x2e, 0xff, 0xff },
        { 0x24, 0xff, 0xff, 0xff }


+Dmitry please confirm

Konrad

