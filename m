Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32150C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 15:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQlDE2/fBoDju/XlglpVY6/wfpayn18xS3bj6jOtEoE=; b=fsEjLMQNSeh/ionAUYzAnRaY/B
	49mLscJtlcvgRINC72GOdia9RxpdJpY5L/5ep4frFt6cUB2DvP9OYKYj66sBkVK8lcT6KLEtVtaAj
	hoeyTJAIOg5O5g4ganLJkIXLGaLorhVs4yJcd/q+b3P9GF5Lfo3O7RYsSv2NiHdWBYwIBZKnuDKyk
	5XMYc6fpgFNPEgnCSyfYObcRoGwesgOFU+hyCc1rAmrHTPF0/NYVHfGVVBH75VBh299tMFDmESN6v
	tUiiidR12FYR+mcQDK0aOY8/W/w+nnZOUeOKf2xVU4o5sKsfBxiJ7/chHEzko0YF810a7fctp1NFT
	Ra0lnS7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvej7-0000000FNbg-1Ftg;
	Fri, 21 Mar 2025 15:56:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvegG-0000000FMyg-2yNd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 15:53:09 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATCmI011445
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 15:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VQlDE2/fBoDju/XlglpVY6/w
	fpayn18xS3bj6jOtEoE=; b=jD29Qml+wTE5+2QhwYgyLZzkeSaTzE/Pij7VjbA8
	4k/oIrWsQmIIoY+EZfu/XxBkvCr9ObjmenKZfOZvT417avfhJwOHhvfnZTpcRbQo
	K/K05js6Gt8KWqcU0/pisHfHxvtLYFI1ME0D8iaphCtOp8GITOEWO92R07LO0hFq
	VXgVdxArFxisF0wZCH5OHYTnQptnX1R1gE5RxZM0ie+vgOZe8nTsfe9KWNBftY9K
	+NxWKq64w0ezd4sk2iEBcQcxJ/chx0OAtgyCIZOJC+nre/RG2hdyQ2WmJW7fcDUV
	H7hDNM6UhcPNcpQBIwVulZKgQBjKNw2Us8yTMtx5bQbnLA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g15y6xtu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 15:53:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e9125db6eeso39473036d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 08:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742572387; x=1743177187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQlDE2/fBoDju/XlglpVY6/wfpayn18xS3bj6jOtEoE=;
        b=I8zup0uwyH7a/FMK85+CmZv9KvYBKH9d+OF3F6KI+HO3BLPIr+Q87HjiI/LCnnyCbu
         2CSgjCkyLA35cMfZiailMumT9/r09A2hWtQ43jf0xvr7JXiPAajznVieOhdATdG4hadS
         bXVcqTVzElpC2WltSifsr3bCgt6cNmhTM/6ih64yt2Z1XTnhnAihQNd4LCO7vaK+5ODI
         yGMjw+7Xs1nuEo38xhTqzojJnAvENk2vB5gaD7oUsdVLCP1Si1UB/gBVVN8Gyz9tBDUK
         XKu2YsNp4rz5jH3J8y49P8hPU1dL+1wqvf5zYIloikSKxI2L886k2YNejr2cNxqz2pTm
         Hypw==
X-Forwarded-Encrypted: i=1; AJvYcCWILG3vitqnBt3wlelTEZGnmK4/+9jkp5v4eX2BltzPNd+p4+tmQHvRsdPQt0l4KJBPruUVN0/MVD4NdOobJsAP@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4UF1ZwYgNQOhSG7iogXTH8VaxI5tKGoGO7A3Hy+n24ttI2cxK
	bQcCoyOqnCsnQK0mcXHoIxrSZYT/bVgBfDgScsE9V1F3MveUcsDnwuE6oTNJM2rZcKWNOUNoZNn
	m+eW+Cc3A8BMLsZeFXkM3+AJ+RC6ZGiaAZqIJyFK2sXA8UPQVOhT5jwdvwxQ/4rfWqhfE4qKdMA
	==
X-Gm-Gg: ASbGncuT6u5qOdG59LpLOX446Z+t9EInjwKGkArwcfrwkgPaHnL5Og0QlcBIuv5BE5/
	Mkwq/AInaQjy3NQQ87jvsrt/zpuRrlbs6js/sZDntO09K2Wb8lhgC+4K0p7mSwJfTk2sD1zPgZx
	FoKCL3bNhhfNi5hng1lgEhMLQDI3SfaYPgq7tYjdAksS5anc54Sx4CnSlq4RHrANyBSkQvnzbn/
	L7fT6MqyqTS0ZfmS1Y1QyUsfJIm1iIJObdiSuubTPPDHhq4V4ijWkPMtzmtOk/LjxWMs1Y7i/5a
	dU3mfd6NdVGanUKOkapFvNE7OOnyE3//H70QTAKYZf++DDLSpDt4Gd+xFDKWo8bx8tYSwbYfnNo
	ia/A=
X-Received: by 2002:a05:622a:180a:b0:477:1e1e:de with SMTP id d75a77b69052e-4771e1e070bmr43919941cf.0.1742572386753;
        Fri, 21 Mar 2025 08:53:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3lNdzhAtr0sK0LLAK9PFg2BBOEsioVsVc8qjwwC0svOGQ2IU+IMTDXrTnp+MfGwnE56Mnog==
X-Received: by 2002:a05:622a:180a:b0:477:1e1e:de with SMTP id d75a77b69052e-4771e1e070bmr43919501cf.0.1742572386254;
        Fri, 21 Mar 2025 08:53:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647c54csm216260e87.66.2025.03.21.08.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:53:04 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:53:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 08/10] phy: phy-snps-eusb2: refactor reference clock
 init
Message-ID: <vphiep5kvusrsyv76a3hdnkso35isoe76uy5hx2vm33tix7yxl@4qh6sk3xe3nu>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
 <20250321135854.1431375-9-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321135854.1431375-9-ivo.ivanov.ivanov1@gmail.com>
X-Proofpoint-GUID: p1aQHJAKRCcn-63P6dggWTPaUKAzEr4O
X-Proofpoint-ORIG-GUID: p1aQHJAKRCcn-63P6dggWTPaUKAzEr4O
X-Authority-Analysis: v=2.4 cv=VaD3PEp9 c=1 sm=1 tr=0 ts=67dd8b63 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=bmNeyW_Q0om-5_paTGoA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=783 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_085308_874086_DA1AC1DC 
X-CRM114-Status: GOOD (  14.89  )
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

On Fri, Mar 21, 2025 at 03:58:52PM +0200, Ivaylo Ivanov wrote:
> Instead of matching frequencies with a switch and case, introduce
> a table-based lookup. This improves readability, reduces redundancy,
> and makes it easier to extend support for additional frequencies in
> the future.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  drivers/phy/phy-snps-eusb2.c | 61 +++++++++++++++++++-----------------
>  1 file changed, 32 insertions(+), 29 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

