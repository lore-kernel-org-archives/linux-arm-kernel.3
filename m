Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05651CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 03:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrpjAWiwCyBIR4NqBN1fG3lVzpUvOEKnEsnydrbcid8=; b=dIq3Cpta18t3H+Cn9pQ+Fo518E
	lYVlH9oleI0rqRFQe8KeUpU2jYkDEKK6S+wu+qc0tazMG+RK3d+MmGJe35cP2xOYk6sZaVXKkz1YJ
	dOy5AwkLgCLiURuHFlBATG3LuhXQq7F4Ku5/aB88vuM9KqVSFKA6qv2Ph5rtwxhRkrL5uQJqlE83q
	7bp+/sP+TfYwO9I7q7Xu5Zj/Rt3MF22TecG+iQoZ+VxrZlDp9EQKm5V8Rqj2ZCPfrpQcQN4R4bBiN
	GJhI8FipCx1ovWP6xuyU7KZ2z10j+Z5fvVqxHaiMlljdDPnQe//TpiULBdwF5uC82wN2Y31EobJGM
	qSnBFbXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHD0n-0000000GcES-3gfp;
	Fri, 07 Nov 2025 03:19:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHD0l-0000000GcDZ-23mM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 03:19:40 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6H3bin557108
	for <linux-arm-kernel@lists.infradead.org>; Fri, 7 Nov 2025 03:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BrpjAWiwCyBIR4NqBN1fG3lV
	zpUvOEKnEsnydrbcid8=; b=jBHaAfNABCQzblEMPABGZ6Ayu8XrzJog5gBepCx+
	d6vBKxEi9ASrvsstFwGiM5jziNcsyNixWVSXOvvfTqT2ssIzJ1xMbg4B4uJU1J2l
	3rJlsUgyLpK7kqRPTn5mg3/au8PUDOZukxF49NQd8vt4crfiltFLpyghFZ5m+n+V
	bqAjxvVeLlzX3R9hah2xXNkbxy6+D9AMOOKf7J54dQABmhEYA9XOeTuCmzzh2Dx3
	d+iCR96epD5azDtJaj04sY+ClRIH5GN07VxSJ4AKVJYx2+7UOEX9y2nhXHxjyra9
	IkhtI9n40Lm6Gicu8VxJXaAdE2+gprK5qZZp+m/mZ/DFvQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8yr9shwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 03:19:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4eba1cea10dso12163771cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 19:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762485577; x=1763090377; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BrpjAWiwCyBIR4NqBN1fG3lVzpUvOEKnEsnydrbcid8=;
        b=NuIk26SSk8nkIdtL14PMX2lPz/E13kBFbkSutCVJY5epjm8v3KQoLIEX2bwQFg7Qbe
         83CzNOFimehWZ01No0MyevMUMNdOOCY7OBhrqK3sPh1HpuZeAiPLgKOAwfLUNNe+UUNQ
         rfYZJ9HOx89JRuV6PS6o3FgNWKswT2B30Cv04D3Az2ocUHUOAGt8+JN9ZNc8Uxzti0fz
         wCLhG2F12w7Y4dbGNDZme6fN/jzsURdkzps0mikXW6JUjAeS7Ua1l9hv0iiomC/UzVX9
         iYLSGDPqsYJDpco+rOY1i84Agc34EFaIGtjo2afNcZzj2i2YTiQOIyCHiPt9/H4RtVtF
         o+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762485577; x=1763090377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BrpjAWiwCyBIR4NqBN1fG3lVzpUvOEKnEsnydrbcid8=;
        b=LoxDVvxAHVDiE395PGDRZl5eeqMehw70fRrRu5SeoV36KQ85P7ewXUIajiVG8+hwSK
         6qp5ZtgzSVgwyGJEILhRREpQn8vmMzg/eF28wwQ3JFcf/9OTb8f8eQsKDomIJ6wuZLdC
         9iEZJOBEFNxGzb84p37LLW63Lv2GdgzejVBhKOoCtxgew6D+xE87dOL2tA2QIInLjXFr
         dm1PevZCCUj+Lc7copafX7HJrbPuKAPoEWXsfCvxjnUFnE+Wtnnsqhe5w6R4GvCKnNcv
         esw6b0SIXmpmcdKoKgIy/2lk//fzBV/ufubZbgN6I3Lgr1zmCgafGCGN21WJFGuauZW7
         3oRA==
X-Forwarded-Encrypted: i=1; AJvYcCVFZaw/a8aUYnPlycaHNTXKAO8xfZ+6qlYucsTPSY7H0j+6gQTr8YPg2EPYMIVxOO0n7HOUEoXihraSPz0INIxS@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+tJfr1QsJHcyemrE1cCMIhh84uht7F8SGnNktur1dfRYWFFXW
	bPfC9P1xw1gHzQS7ffhO8mm7efFmmqC55aoU6cXqyCc57LE5rAD+OFrgPCvilXPcUS1R+PVP2iD
	emYGmEo2L0kV0ZScpp4Py0mwIe2EbYuk1KqW8RR8y48djoUDOi6y3FCv0cUKR79bFvGAVR28qF1
	oXZg==
X-Gm-Gg: ASbGncsMP3EaYWgdvyneWYr7HHuLGtr0CNAbIS9Eb4O5TIEkKNey/FoI34zTz3K67m4
	sBoEwLQpFOripKr+ZahB7lvPbY3txaIM62VCV4brv1Fp6hzmqDIjii0Xxxj6SOqUjXDcXJ0gVFy
	XANm18HDXeRPT8jjpl5EjUmvXIi57ihi3tUEvBXMt0HCB8/OvrH4DRWeqFaxAQlhH9uDy1lHN2n
	zdZu37w3lOKlfrjuMa2rIV9Df7/xlp32Lx8fpReCRlwXiimVP0rbOumxRw3/51ixUJOfL5f1GJM
	hJx1eEtnFXDI0xA6hfixgwA9MUe3f7n/SUUtNZp/NnXPJ01xxMoDAQrzdkhEbor9KLhKUHs/4IA
	8B2KYvuCdkx3pav8WDe4RN79gRblu+pcHC9crdfmbT/nqVcKJvpc+aMQbrpMVez6uLVWn8KFqBP
	avIfILsPAIG2m3
X-Received: by 2002:a05:622a:11c7:b0:4ed:6746:5c3d with SMTP id d75a77b69052e-4ed949432cemr23756961cf.16.1762485576966;
        Thu, 06 Nov 2025 19:19:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/3FjNRKucfvNXkDZbeGXLag2dCvNMAIUYAMoAD/S9Y8MWbIoOna+co2re+tgJ+a1VvKEhZA==
X-Received: by 2002:a05:622a:11c7:b0:4ed:6746:5c3d with SMTP id d75a77b69052e-4ed949432cemr23756521cf.16.1762485576496;
        Thu, 06 Nov 2025 19:19:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a019f09sm1147166e87.31.2025.11.06.19.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 19:19:35 -0800 (PST)
Date: Fri, 7 Nov 2025 05:19:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 11/13] soc: qcom: Simplify with
 of_machine_get_match_data()
Message-ID: <odmsib3dsxzzggq4gcx7gmh6vq3crlv25fz4z2l2ntezvx6gbi@uelqojwjjait>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-11-d780ea1780c2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-11-d780ea1780c2@linaro.org>
X-Authority-Analysis: v=2.4 cv=DrpbOW/+ c=1 sm=1 tr=0 ts=690d654a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=e-unOtBAnIuy2i46bukA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: erisiKyLhLtIdoab2ALyhDhcCTfcZz_w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDAyNCBTYWx0ZWRfX1/DnwPSPsp4R
 bTbBjcCAMPTDRsgwgqE/POTQiC4hEPZZLArmC0o4V2RqBrUjoFWMRMOtjxvBTZ6FOE9tXSVtM21
 90J8nM6oTuLnkn5MZ6Z4wtODYk8Frsc6W0EDYj0jITmFFEsqbmQ6qHeWoyWD0AW27OMGexRoftX
 7Qc5++Hs2945dKM0K+X2X5gMW+J7g9jKfuJCCmolzsdyzx9a6nxerv43xT4cLojU8nZBXnh4XRL
 uTFMXOSgl9OqhPrEUGvUQh1J9Zm+e0l+JivGUnnOAbDTLm0ZwXScjucT5GLoA2nIA7R5uIDIS4T
 VQeVsT96GzWtz5HtVZg79z/Ek1UYkJdvF/lc4PCdbf/O8veYL00ToWYKpq45gE8xrrLTs7oORSX
 qDHCxXJMCMFAWJIEE0YAvRvBv17tFg==
X-Proofpoint-GUID: erisiKyLhLtIdoab2ALyhDhcCTfcZz_w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_191939_534566_B40581E1 
X-CRM114-Status: GOOD (  25.73  )
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

On Thu, Nov 06, 2025 at 08:07:18PM +0100, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with new of_machine_get_match_data() helper.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Depends on the first OF patch.
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 17 ++---------------
>  1 file changed, 2 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
> index 1bcbe69688d2..07198d44b559 100644
> --- a/drivers/soc/qcom/qcom_pd_mapper.c
> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
> @@ -613,25 +613,12 @@ static void qcom_pdm_stop(struct qcom_pdm_data *data)
>  static struct qcom_pdm_data *qcom_pdm_start(void)
>  {
>  	const struct qcom_pdm_domain_data * const *domains;
> -	const struct of_device_id *match;
>  	struct qcom_pdm_data *data;
> -	struct device_node *root;
>  	int ret, i;
>  
> -	root = of_find_node_by_path("/");
> -	if (!root)
> -		return ERR_PTR(-ENODEV);
> -
> -	match = of_match_node(qcom_pdm_domains, root);
> -	of_node_put(root);
> -	if (!match) {
> -		pr_notice("PDM: no support for the platform, userspace daemon might be required.\n");
> -		return ERR_PTR(-ENODEV);
> -	}
> -
> -	domains = match->data;
> +	domains = of_machine_get_match_data(qcom_pdm_domains);
>  	if (!domains) {
> -		pr_debug("PDM: no domains\n");
> +		pr_notice("PDM: no support for the platform or no domains, userspace daemon might be required.\n");
>  		return ERR_PTR(-ENODEV);
>  	}

Here you are mixing two cases:
- There is not match in the table (in which case the driver should print
  a notice)

- There is a match in the table, but the data is NULL (the platform
  doesn't have PDM domains). In this case there should be no notice.

-- 
With best wishes
Dmitry

