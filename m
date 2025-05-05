Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB1BC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 15:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajIwN9ybFynnOoUBfqw560tKD3pLVfHj6Y3hXWa2aUA=; b=ebhfDCS//Fs5iytGr2s06M0+d+
	NqJh6H3MNKQzwFQBVvCmmp7v1G0QQ9KyEUvzfdWTmhYxKsiXe6pLgwUHsnMT8Wz1MY3fnpsBIRWMB
	GQ1VizzNG8Z/ynDNwb4G5nXAki4/+Oe87/YxAe+GK43dNhHFw37fbwPkTr1W94iDCSWLSfPl/PXJ9
	9t3OHemZStc9tVpRraazw1XatTiaVep+CLEh5W8z3UL+vxKB5q73lqWFD03jtduxgAxGyDDQ+QQzD
	6g/VPDmzIlxe66eqfgWEIHrSpLQI8naHRnsEu+62ce1YzMrXBzeTiyFhpjsoQvBg4ELnIdtrXYtT1
	iFwk8ygA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBxSl-00000007lWk-1hgt;
	Mon, 05 May 2025 15:10:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBxJo-00000007jbz-41Hf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 15:01:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545DPKdJ011686
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 May 2025 15:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ajIwN9ybFynnOoUBfqw560tK
	D3pLVfHj6Y3hXWa2aUA=; b=lJZJdjQT+SGbsmSHoVruH15IgghckrcmGxAU5AGx
	YvsS+TbzRMNfC26GffQYr4lBRj/6zBlGZAXvjtaeWVogMI1XclocAIR7MtGzgfni
	5PloLC8gH4kQnVEPkn/D028O/PfvRIMLp2z/utOYhOZXLQpdkRDJyIP6ThpiZ+HE
	gZDekTShyXdJK4JTMTfFZ3qEWJTq/U94VICWKpRLPm+hwgJEOOOb6Qmh2hssIPxB
	Xp89nV0ROUut3A9JYQ+H3vbo9a6+tp64ElUTTemxnycaS2CEjlE9Ctj87q72bojV
	9y8cIG9BXTMVXxpEyISgyEj0NguSwl20L27V9KdVpE4txQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da55ve0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 15:01:19 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-72c7d6a53easo3609415a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 08:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746457278; x=1747062078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajIwN9ybFynnOoUBfqw560tKD3pLVfHj6Y3hXWa2aUA=;
        b=whPRkDeHrS+xvxhwv70YH3p1Bv2pGTleMBYB6VYDL3sxpcmYR8Bgx4aP2NHcOu7Do1
         jeBC79ZeM8r8yDR8YHNNp/OckXDt/4yTixeGu7thm/bidjCHodKthEPq2t0DtvlpvezX
         EzIyprtlUWkHpGkpikBVemX5JBUVEWSsqybIhSC09TUPpXeuNiegKmtoOHUjCkeNNswk
         yRIz/PBkPvZmDanczdD5vo/ZazgGn3WGhRxWQilAvT7+FNdBVLCoxwUIxEn22ncste+e
         R8Uer2YlmirvrI99ntl/cTThiw1Oy2kv3hpysFjBCmpzYyQH1e25TBiqKaJK8r1FuQ1v
         ehHw==
X-Forwarded-Encrypted: i=1; AJvYcCWxvSRZdv/YW8gqpJHawertH2aDJCq0t+/K+zcpxEVJSVpkPbjOcLbcGh5qXCOY1TvXV9UIJsYE09urSCVghjzn@lists.infradead.org
X-Gm-Message-State: AOJu0YxvVMFKmURFltgA0fk0h6XymwflHXURFAEM3isz60Ft4Zq0ICRF
	u5caFl4siWjl+AOSBSdF/1hbVQ+j8qsbytEGF1fzS2aKOjyANEblaipePQi4M9BpR9AA3WsgKf4
	Qojig/fRazgwif1JRoL5EHg3KBDwCVtrxH0dF7k76+GB45/w8yKy4QLq5c3Ljs2xKNxjSJeJKqA
	==
X-Gm-Gg: ASbGncvGxHUI0eiJDxD2u+YAJKKx3uAFGOclpa7PZkhEsPgb08YOeGoveszysxwdUKX
	/J+SPDhXuDnFyN87DKfwkWZN7/TqTAQ2ZHMCR8QFSDNt8SDgVc/EP8Pxca/8FxYJBjVpYkBDVR8
	mbyK8+LFp1oQ+vPBGiBJsFQmUg1i3xGee5CE+UgjSuw6e5CGRotPLk5ZySbfFZxlBS3FQh0xCOL
	LjM67ZSEn9pNFkL7v/ad1rKJMhLZMuo9u9m78NNGX8EYk1EYdi08MCAuFITLVDqyDnMkFG+WMph
	rHg7PePkd8yzyoEwg7JuDlCkI7PS/hWcKiWGhv+Cf+Wl/or6ASOOxrC3O1Fb2OcA1n6avepsFx0
	=
X-Received: by 2002:a05:6830:6b04:b0:731:cb3d:67db with SMTP id 46e09a7af769-731e560184fmr6735244a34.16.1746457278355;
        Mon, 05 May 2025 08:01:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl5sM6QT1am070BqEbNtN/0tNEpvKAt2e2B2h/I/PNOETxxTlIHhgZfMD5SpwtZsT4oyPj5g==
X-Received: by 2002:a05:6830:6b04:b0:731:cb3d:67db with SMTP id 46e09a7af769-731e560184fmr6735162a34.16.1746457277726;
        Mon, 05 May 2025 08:01:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94befe3sm1749608e87.53.2025.05.05.08.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 08:01:16 -0700 (PDT)
Date: Mon, 5 May 2025 18:01:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 09/10] iommu/arm-smmu-qcom: Add SAR2130P MDSS
 compatible
Message-ID: <liflz2mkkc7jiwtiynim2g2oxewdckbxo7y3m7tevbncqizfjf@ethwzfe3ft5b>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
 <20250418-sar2130p-display-v5-9-442c905cb3a4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-sar2130p-display-v5-9-442c905cb3a4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDE0NCBTYWx0ZWRfX2UuZpAly6QEq
 T5pefuvWp0M77qKLpYyCwzIPNEfglFm3i7gdkjpBYiFkCd1M6cC0QqGekRfYg+NNLRwknnWRjjQ
 ULvrinlRru8xEIhPeG5BppN+++fAjHoT74KBrnM7KJCXac8yG9xII5h1dax1qDFJbR+9DKOxkya
 CLxOncMRcwFcs+GBEx1PyYIkzjXjbLFk7Jgayf/83fLxaWdG9mopI3B99/MKrHF4AEeuZCnHVAq
 318DMyHVNwBOXWs0NeSl7vf5g2NwxYHB76kYV9MRz0qSiI9RYo0vIag3CPvfnEe4tUQakg7T3es
 vE+UH/lUIRBe9Y58scWwt4iQLQsVm+Ig4Ns8u/l8DH5UP3BXEFXlyh9QwLuH2udTAHtqmVI04Kt
 oMcQUW5jXG03uH0GLijhuTpIBItHswl52pKBkKELHpLrtLf3C35iLrg8sZ5eVK7vbTafrVZ3
X-Authority-Analysis: v=2.4 cv=M9RNKzws c=1 sm=1 tr=0 ts=6818d2bf cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bEtjVc3RIV5_29FDWJ8A:9
 a=CjuIK1q_8ugA:10 a=eYe2g0i6gJ5uXG_o6N4q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: nntcu_i-hS2hRBJzrAFcMrm0tXPop1Kj
X-Proofpoint-ORIG-GUID: nntcu_i-hS2hRBJzrAFcMrm0tXPop1Kj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 mlxscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_080121_121171_D14006C3 
X-CRM114-Status: GOOD (  21.16  )
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

On Fri, Apr 18, 2025 at 10:50:04AM +0300, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Add the SAR2130P compatible to clients compatible list, the device
> require identity domain.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>  1 file changed, 1 insertion(+)

Will, Robin, with the rest of the patches being now a part of msm-next,
could you please pick this one too?

> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 59d02687280e8d37b5e944619fcfe4ebd1bd6926..ecc4a1bc9477b766f317a58ef8b5dbcfe448afa9 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -356,6 +356,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>  	{ .compatible = "qcom,mdp4" },
>  	{ .compatible = "qcom,mdss" },
>  	{ .compatible = "qcom,qcm2290-mdss" },
> +	{ .compatible = "qcom,sar2130p-mdss" },
>  	{ .compatible = "qcom,sc7180-mdss" },
>  	{ .compatible = "qcom,sc7180-mss-pil" },
>  	{ .compatible = "qcom,sc7280-mdss" },
> 
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry

