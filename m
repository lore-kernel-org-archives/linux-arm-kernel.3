Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EF5C36001
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 14:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASbCVF6IGoyY2N0TjxdPMAgZr4dHNvrD/QqrVeipMWU=; b=gOyrzEWgBxuu3AzWPz0ddniYvB
	J0oMeD/YqTDmr+BW+hMCNdSkqiY5QJ5ak9wWs0xi1VmEG7eIEVeHPJmnjBohDhIalAjSS2/B9z5mv
	zaSsZRxOSjlv0Gls2ojN7Q83YOUCk7AhGH5KXtfeY/A594U38A+C1+DDQibNo/xKGX3OOwgc94iiD
	yTam9qgos2jPiwzUOg+mKB0sGUp1rsfOkRXxqz9Iz523dBYcjB5PpLFlDcDXA4jarslPEuiYSiRQH
	m8g+tMqixU4EUBXCXPH3lXGYQ8kQdhHgE2PyAixf/LKsipku1VULCrKqOsRJQXEl/bBeWqSBx9V3C
	ysGa/zuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdUF-0000000F8eZ-2YIB;
	Fri, 21 Mar 2025 14:36:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdPt-0000000F7a8-35Ku
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 21 Mar 2025 14:32:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ASbCVF6IGoyY2N0TjxdPMAgZr4dHNvrD/QqrVeipMWU=; b=mHU5WVRg1hJ+ZIv65lNzNzK9er
	CZUBXOK7CPrBmZy35ewd+/Z3dEmVpsGkuzp/I7MAoZnMyDXROYpYah5DjLfhgA+63sFD1t2QdLzBc
	nm/qFXR8whXd0wVsTi9xw8KX4M419JU/cgLq4DF5Zf3MAknq7wVf9piKcyMlVtTl+HKq/1mAs74Nf
	akfCzPblP8CS3g30XdeqmWkR557as1HuV81HiMr2PZIhTdwW9lmIC580CV4wunXQHOB3ToNJZwhcx
	6jUQP+feUX7aapweV/NrNcSgiuy/PJcMbXkOTONwqfeMA2gm4zUDzclRZ3Wgh0/VLV0Bv6J6Vufcm
	Fy7Ug9pA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdPq-00000004O8H-16mm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 14:32:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATCwn011435
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 14:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ASbCVF6IGoyY2N0TjxdPMAgZ
	r4dHNvrD/QqrVeipMWU=; b=j5/rvATVRl6e8otFJk7TbSloKEolYfxdsRjzEMzg
	ahv0NV3EzON7+NlL2LG+x07BVD1G8E2LXmCAqs6xepVXisQWj5WOYaNhCE9+uC+7
	2QdprtEUMU1KEes4JYdCFKdWDiOKqjBIfgD7cTX/4jBIq5s3o6gXIWFciWpsoRaV
	hgeIjdTpqO+YtrYjBBhgbamNBdrIRLQVDtUuCuni2MOCH9fk1zCfI1xQYPYov8gO
	I/yYtk099O770kxqToSM5yJuDhflwyBv34Z4q7gg4yRaXHFSiRqwS56wjKrP08/E
	BIO4BQrb1UG+nx+sT9ArT0tL9Oc1Nd9XF3BpCXJOGohTLg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g15y6r57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 14:32:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5b9333642so180935485a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 07:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567519; x=1743172319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASbCVF6IGoyY2N0TjxdPMAgZr4dHNvrD/QqrVeipMWU=;
        b=roTt1WTFuANjQ4ZBP0nKm4oQmxUmlxm0AmXtVwtNuWBopzslh1kkM77Xk6PKhfZGZD
         7vPZYh9ZKvxlisttTLzf2AhNfjHafPGbM0Fop5Sy2NoRuMmUP3Lq5wXv2h8uwW4ufjFK
         fl4cTFQK/yZioSi8FkL0XXM+IZB4bbG9WZc9tJjZbhHiyLb8gKS2jC6lM2WfOYbyC1u8
         WI9daI4Yx6FBRevjV2nZAxHHdgAIxBQyAufBsu4Udc34KSY8u4stfK3SdwPEKIXDkNa7
         bh3DIPgz5wPlPLGMK6d1OoxrWFk4QsEN1epKe72zPsDMg0nqIWEQ3nnc+EEXk4qMHBDg
         Pu7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtrVBpfGfIq6aeLe0+QV6JCFw02zMeq2OQsi0Afa3Jlka8Cwipub67tUb2hpzN7pR8SsFheWKBPMGTtazBEJox@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+nU7c8xtm9udzXCoj1jt1a+b7rWCi7er7kIQQLD8PKyBZmDsS
	M23VltgzydEljMenGbf2avgU6jtTy71WKK4JPBqDmhQM4crrQv1J9fYRpojAvIIWAlY4dluc55+
	uOQ8mX8m+FDWFuJKMR7kPtqekHasYo51aFQMN8MRjg2H7PPyZABfdS6M+ezq1D6zED3+tVaImMw
	==
X-Gm-Gg: ASbGncuP/0GT2jKNWuOxnpjm7AZk0gG27SzjK3tqKCP0agr25YUNDQGMWQs3q40M1r5
	IW6soJDsXr4XpLgy7+3X3ZFo4rsoN9qI+5p7Bmre3szoiqFYRhYb6t6R+Dw8xOq279GSfbBvXJH
	sraC5A88q5tmtRevsNZLhQUNWq4roORMYL60toAt+nEf6SwIGbOsE0HPscWRMjrZsNVn5KfYIxm
	zqa1ReU/nPDJe9jkGn7C+QIEBmdm1QHpx9QcpYyFywmQdNq84FbuBA4rmaz3Kt6Hqv5iBS/x1k5
	mDKk88hcRUqnO+zSZQzNP7ItRLBJPfz3EDLJDyzF6VxaSKXEjK1MjxV9ZqRuWwqBSyAZhPpNjvK
	3/Lo=
X-Received: by 2002:a05:620a:461f:b0:7c5:5e5b:2fdb with SMTP id af79cd13be357-7c5ba211392mr509660585a.41.1742567519264;
        Fri, 21 Mar 2025 07:31:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTvGJ85KG70hDc3USgHc+qZKoWAZnYtaXcPyp6rUDakGGGOGIHCJQh/uHXW8DEKPu0mfBeXA==
X-Received: by 2002:a05:620a:461f:b0:7c5:5e5b:2fdb with SMTP id af79cd13be357-7c5ba211392mr509654385a.41.1742567518714;
        Fri, 21 Mar 2025 07:31:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad646bd42sm194861e87.26.2025.03.21.07.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:31:56 -0700 (PDT)
Date: Fri, 21 Mar 2025 16:31:55 +0200
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
Subject: Re: [PATCH v3 05/10] phy: phy-snps-eusb2: split phy init code
Message-ID: <7v3xkvldjnpqakrndwl6wb6vdsl3idbirlhddpqhwtt3ddadzr@kjafi3updcsb>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
 <20250321135854.1431375-6-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321135854.1431375-6-ivo.ivanov.ivanov1@gmail.com>
X-Proofpoint-GUID: 8H3mMlIAWhEIRP7aK2P2ntjPKxBDUZZD
X-Proofpoint-ORIG-GUID: 8H3mMlIAWhEIRP7aK2P2ntjPKxBDUZZD
X-Authority-Analysis: v=2.4 cv=VaD3PEp9 c=1 sm=1 tr=0 ts=67dd7860 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=XJ2MQsQTle-X_OudA-YA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_143206_672075_ED85949D 
X-CRM114-Status: GOOD (  20.36  )
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

On Fri, Mar 21, 2025 at 03:58:49PM +0200, Ivaylo Ivanov wrote:
> The current phy init consists of hardware power-up, as well as
> QCOM-specific eUSB2 init code. Split it into two parts, to make room
> for such non-QCOM init code.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  drivers/phy/phy-snps-eusb2.c | 96 +++++++++++++++++++++++-------------
>  1 file changed, 63 insertions(+), 33 deletions(-)
> 
> @@ -378,6 +401,11 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
>  	if (!phy)
>  		return -ENOMEM;
>  
> +	drv_data = of_device_get_match_data(dev);
> +	if (!drv_data)
> +		return -EINVAL;
> +	phy->data = drv_data;

Nit and completely bikeshedding, but this looks simpler:

	phy->data = of_device_get_match_data(dev);
	if (!phy->data)
		return -EINVAL;


Anyway:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> +
>  	phy->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(phy->base))
>  		return PTR_ERR(phy->base);
> @@ -424,8 +452,10 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id snps_eusb2_hsphy_of_match_table[] = {
> -	{ .compatible = "qcom,sm8550-snps-eusb2-phy", },
> -	{ },
> +	{
> +		.compatible = "qcom,sm8550-snps-eusb2-phy",
> +		.data = &sm8550_snps_eusb2_phy,
> +	}, { },
>  };
>  MODULE_DEVICE_TABLE(of, snps_eusb2_hsphy_of_match_table);
>  
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

