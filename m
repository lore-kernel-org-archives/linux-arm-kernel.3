Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6602CCA0EE3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 06:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owhi08C/M/NN6d0s604Ju+m1uDGPJY3DmSHO26z2ljg=; b=y7WBZ48C84A95Fj+bjdOly4gET
	N1MeTPEwqdjbO/etG9syeG7vwufZ2qlkJJdCtqzs0SaYY8jdd8CzV4pTdHnsPWqaexLM8trzE/r1p
	hvWMIkgXUz/O7A11wA2vm6aev+jiyvN2aMj/Y/Wzt6ixBx8LUPUx2CC9ElsxNfcOH5+MBDta4aiZ5
	SOnTm1FHRYaVIcTD7IzxGB/Ukrsqnp4gTIgx0fKfbSrZvcUHcL9xcGZNXfX9L4PykwYj+OZJxzOoi
	bUssmfj3yk1DHD0Dx65pXrg/WNdU3kmPEzoHv6zAK44gCoGyRcdk9nR9yPKxG9cXEPizpqvXv7jL5
	d0OkQeEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umRrQ-0000000FzKR-0EIk;
	Thu, 14 Aug 2025 06:54:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umRop-0000000Fz1a-3X25
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 06:52:13 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DNS9f4031956
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 06:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=owhi08C/M/NN6d0s604Ju+m1
	uDGPJY3DmSHO26z2ljg=; b=HWf9WJA4YNEMkKYqHshBP/5z3OILqxFW/kix8dkM
	vK7hhkcNIW6Z6wLB0qzaxVobXrjPpm0oHj/cf+9I8ekd/7n6sCapHX0xL+7OYFUO
	tlphFb/YO+WjWPA77qQo9NyWmiIzZp///U1dSDaniiwTO6+HOLofNpXqS4UvXm21
	Rrmxj9m4pUAlhrZTpRYAKGiZKP5U/t4mOcJbUA+Y079iS3GQtjJJKDeJEgvgH3vf
	FlbrLIP2J2Cb6dW/swQDMycluZponh4VUfKH4zGf0g6i5KqdVxtVwF5ZQ048dOXu
	mTkeCQF3aFCfHT8WLdIVG7NGqsmIaVT9u2ToswO/rwA4Jg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4jmj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 06:52:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b109c7ad98so24428601cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 23:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755154329; x=1755759129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owhi08C/M/NN6d0s604Ju+m1uDGPJY3DmSHO26z2ljg=;
        b=PfJ0w9Q2TGO31KsuKdsHzxg2hcrUG2+ktV3mwfhuNwn8yOK9qxBhBZkJGjWtpe28xp
         y/uRqngOsmW0acnGiZlRR2NytbaoZTnKwb/ossFHehGLP9shEfVZ5eJJUvizNgsaGz8K
         KObfLcaGdcxI7f15HEQLFMXeauY3Aj/ze2h44iAIxo30j7UFXzzvbTXoeJzhCOtmrjSS
         ei+By4uBb17/RYjkdoyV3OgAD3XtZ05cwKYUKb08LPvycZdPmixLdlpD34+2B9AyvsPZ
         YhZoFy3/5B3inCPw4xEDgtLPjWCT/IT5U0vqS9U88wpIvU3ZKf3Jm42VU6I7pJrhqp3W
         XYvA==
X-Forwarded-Encrypted: i=1; AJvYcCWLm6vZ69t7g5PwaXzoP/U8XtE4lfIdoSxWEdD4yTUBz942K2thYtk8EeYpSf1U3iOdfuakfdOgeN0cMlQvOt28@lists.infradead.org
X-Gm-Message-State: AOJu0YyGlJUPIOCQztQZPL8dw/mnBsWkTYacFtV7J6RAPq2EpW31NDGk
	6V2NwoemoJ2pnfWMX25V6aVeTUPyUGbBQ4JA7DALIvOgd68wl698uHTX+SLN6z5QpqUlEdkVbNe
	0Jf56fKci3UlsMlf3zDd5FZU2jb6sOEQG/s9/7/8hLhWpdzgy5ylx2HdwE/qxKESVHBfSMEjyKO
	ZGdA==
X-Gm-Gg: ASbGncvCsYnKZXksTEg5kKXDSnM4MNNWnBBjev36JbWLlVwf0ZE66BnHO4DDUgTWZec
	e+yCyEWzbv9TTSsPoAVe7oxPAhJlPjyV7EkAN3zHx3H66YkumypgFwnTtXj2uBAYefhTBOvuea+
	Q8idEeyKbeub4nb+QMMrfAd7g0s9p+xkk2BpaT5maPaOnrMgpE8qCeeR8h9NPfWWimyr0s8qj5x
	Ate95vG0rk+MDUMXgzusCwCcJko47BsFqG9jO+9vmRNM1SpYMxCBbZymOdNzeTvAboUyE07EqnA
	sCb8ijXgPXhOSWeTfn98ptLRZfqyvGU4BelHyKrqAz/5T0NQPYSkh9wKp14p4ZejBfr/llF90CY
	HM8DZY62XbpoS9vqT5Xmw59ApQkYHG3nFnK5iq1Er92eCHnUo/U2Q
X-Received: by 2002:ac8:5808:0:b0:4b0:7f93:3cdb with SMTP id d75a77b69052e-4b10ab647c5mr31568061cf.43.1755154328723;
        Wed, 13 Aug 2025 23:52:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEM0qr1LVcYRMByeamQSKE14P39HiE+Ci5RWjhuXSylU1tRHSO3/y8Hd3syjoumZhxu28HzQw==
X-Received: by 2002:ac8:5808:0:b0:4b0:7f93:3cdb with SMTP id d75a77b69052e-4b10ab647c5mr31567601cf.43.1755154328087;
        Wed, 13 Aug 2025 23:52:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898bdcfsm5494037e87.32.2025.08.13.23.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 23:52:07 -0700 (PDT)
Date: Thu, 14 Aug 2025 09:52:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v4] remoteproc: Use of_reserved_mem_region_* functions
 for "memory-region"
Message-ID: <te2o47dxihjsckaigfdhbrbyqxaeqmchmtx5xbx5y2smu6yaja@t7uccvfsxmay>
References: <20250813214808.895654-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813214808.895654-1-robh@kernel.org>
X-Proofpoint-GUID: ANMc3OxS9sQ_zLGESorF93XRfuIUbJej
X-Proofpoint-ORIG-GUID: ANMc3OxS9sQ_zLGESorF93XRfuIUbJej
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfXwa51ncEj9b09
 DzE4I5nxSf+LdeEZKG5A2vZrpILhydYVjOJP9OiZsBtv0FaW6GqrMKkgjMcMNZPWckCw/06H3Oi
 kCIGXCdoyTWqksEOWAE7nYLBxhE7IxwdNoKWnz9wzbm+c5gdoasrXYRcDMDBAL6ZPGXsjPP0iCj
 hG4OvLHhk6TC+rGuMV5BofCFKStIst2FnkT/iVw5s2txwdNzxLXU16ckoWY45kxBSXjCvwEjDBd
 kHOMJqfSLRMzw1z1Ne42LJP22Aitj7BPJO6ST+4agAVv7IKsYNsR5Vi3b2Ey+6RV94trQACma/3
 sfVb38gb5kTAvwSH8HiiXH7Q29aSABAgTjAjQJ3pKDRG1xizz5NuhljBJDfsJP7Z8wjTE12siea
 eumeBQYC
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689d8799 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=8b9GpE9nAAAA:8 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8
 a=3NaVR53663puj-g3OQgA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=T3LWEMljR5ZiDmsYVIUa:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_235212_011444_3F78FC8D 
X-CRM114-Status: GOOD (  34.56  )
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

On Wed, Aug 13, 2025 at 04:48:03PM -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() and
> of_reserved_mem_region_count() functions to handle "memory-region"
> properties.
> 
> The error handling is a bit different in some cases. Often
> "memory-region" is optional, so failed lookup is not an error. But then
> an error in of_reserved_mem_lookup() is treated as an error. However,
> that distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Tested-by: Peng Fan <peng.fan@nxp.com> # i.MX93-11x11-EVK for imx_rproc.c
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v4:
>  - Rebase on v6.17-rc1. qcom_q6v5_pas.c conflicted needing s/adsp/pas/
> 
> v3:
>  - Rebase on v6.16-rc1. Move TI K3 changes to new common file.
>  - Fix double increment of "i" in xlnx_r5
> 
> v2:
>  - Use strstarts instead of strcmp for resource names as they include
>    the unit-address.
>  - Drop the unit-address from resource name for imx and st drivers
> ---
>  drivers/remoteproc/imx_dsp_rproc.c        | 45 ++++++--------
>  drivers/remoteproc/imx_rproc.c            | 68 ++++++++------------
>  drivers/remoteproc/qcom_q6v5_adsp.c       | 24 +++-----
>  drivers/remoteproc/qcom_q6v5_mss.c        | 60 ++++++------------
>  drivers/remoteproc/qcom_q6v5_pas.c        | 75 +++++++++--------------
>  drivers/remoteproc/qcom_q6v5_wcss.c       | 25 +++-----
>  drivers/remoteproc/qcom_wcnss.c           | 23 +++----
>  drivers/remoteproc/rcar_rproc.c           | 36 +++++------
>  drivers/remoteproc/st_remoteproc.c        | 41 ++++++-------
>  drivers/remoteproc/stm32_rproc.c          | 44 ++++++-------
>  drivers/remoteproc/ti_k3_common.c         | 28 ++++-----
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c |  2 +-
>  drivers/remoteproc/ti_k3_r5_remoteproc.c  |  2 +-
>  drivers/remoteproc/xlnx_r5_remoteproc.c   | 51 ++++++---------
>  14 files changed, 204 insertions(+), 320 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index 94af77baa7a1..a5b7cbb8fe07 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -625,26 +625,20 @@ static int adsp_init_mmio(struct qcom_adsp *adsp,
>  
>  static int adsp_alloc_memory_region(struct qcom_adsp *adsp)
>  {
> -	struct reserved_mem *rmem = NULL;
> -	struct device_node *node;
> -
> -	node = of_parse_phandle(adsp->dev->of_node, "memory-region", 0);
> -	if (node)
> -		rmem = of_reserved_mem_lookup(node);
> -	of_node_put(node);
> +	int ret;
> +	struct resource res;
>  
> -	if (!rmem) {
> +	ret = of_reserved_mem_region_to_resource(adsp->dev->of_node, 0, &res);
> +	if (!ret) {
>  		dev_err(adsp->dev, "unable to resolve memory-region\n");
> -		return -EINVAL;
> +		return ret;

This looks strange. Shouldn't it be `if (ret) {` ?

>  	}
>  
> -	adsp->mem_phys = adsp->mem_reloc = rmem->base;
> -	adsp->mem_size = rmem->size;
> -	adsp->mem_region = devm_ioremap_wc(adsp->dev,
> -				adsp->mem_phys, adsp->mem_size);
> +	adsp->mem_phys = adsp->mem_reloc = res.start;
> +	adsp->mem_size = resource_size(&res);
> +	adsp->mem_region = devm_ioremap_resource_wc(adsp->dev, &res);
>  	if (!adsp->mem_region) {
> -		dev_err(adsp->dev, "unable to map memory region: %pa+%zx\n",
> -			&rmem->base, adsp->mem_size);
> +		dev_err(adsp->dev, "unable to map memory region: %pR\n", &res);
>  		return -EBUSY;
>  	}
>  
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 0c0199fb0e68..0fea5f91dd1c 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1961,8 +1961,8 @@ static int q6v5_init_reset(struct q6v5 *qproc)
>  static int q6v5_alloc_memory_region(struct q6v5 *qproc)
>  {
>  	struct device_node *child;
> -	struct reserved_mem *rmem;
> -	struct device_node *node;
> +	struct resource res;
> +	int ret;
>  
>  	/*
>  	 * In the absence of mba/mpss sub-child, extract the mba and mpss
> @@ -1970,71 +1970,49 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
>  	 */
>  	child = of_get_child_by_name(qproc->dev->of_node, "mba");
>  	if (!child) {
> -		node = of_parse_phandle(qproc->dev->of_node,
> -					"memory-region", 0);
> +		ret = of_reserved_mem_region_to_resource(qproc->dev->of_node, 0, &res);
>  	} else {
> -		node = of_parse_phandle(child, "memory-region", 0);
> +		ret = of_reserved_mem_region_to_resource(child, 0, &res);
>  		of_node_put(child);
>  	}
>  
> -	if (!node) {
> -		dev_err(qproc->dev, "no mba memory-region specified\n");
> -		return -EINVAL;
> -	}
> -
> -	rmem = of_reserved_mem_lookup(node);
> -	of_node_put(node);
> -	if (!rmem) {
> +	if (ret) {
>  		dev_err(qproc->dev, "unable to resolve mba region\n");
> -		return -EINVAL;
> +		return ret;
>  	}
>  
> -	qproc->mba_phys = rmem->base;
> -	qproc->mba_size = rmem->size;
> +	qproc->mba_phys = res.start;
> +	qproc->mba_size = resource_size(&res);
>  
>  	if (!child) {
> -		node = of_parse_phandle(qproc->dev->of_node,
> -					"memory-region", 1);
> +		ret = of_reserved_mem_region_to_resource(qproc->dev->of_node, 1, &res);
>  	} else {
>  		child = of_get_child_by_name(qproc->dev->of_node, "mpss");
> -		node = of_parse_phandle(child, "memory-region", 0);
> +		ret = of_reserved_mem_region_to_resource(child, 0, &res);
>  		of_node_put(child);
>  	}
>  
> -	if (!node) {
> -		dev_err(qproc->dev, "no mpss memory-region specified\n");
> -		return -EINVAL;
> -	}
> -
> -	rmem = of_reserved_mem_lookup(node);
> -	of_node_put(node);
> -	if (!rmem) {
> +	if (ret) {
>  		dev_err(qproc->dev, "unable to resolve mpss region\n");
> -		return -EINVAL;
> +		return ret;
>  	}
>  
> -	qproc->mpss_phys = qproc->mpss_reloc = rmem->base;
> -	qproc->mpss_size = rmem->size;
> +	qproc->mpss_phys = qproc->mpss_reloc = res.start;
> +	qproc->mpss_size = resource_size(&res);
>  
>  	if (!child) {
> -		node = of_parse_phandle(qproc->dev->of_node, "memory-region", 2);
> +		ret = of_reserved_mem_region_to_resource(qproc->dev->of_node, 2, &res);
>  	} else {
>  		child = of_get_child_by_name(qproc->dev->of_node, "metadata");
> -		node = of_parse_phandle(child, "memory-region", 0);
> +		ret = of_reserved_mem_region_to_resource(child, 0, &res);
>  		of_node_put(child);
>  	}
>  
> -	if (!node)
> +	if (ret)
>  		return 0;

Shouldn't we differentiate between an absent region (OK) and an error
during parse.

>  
> -	rmem = of_reserved_mem_lookup(node);
> -	if (!rmem) {
> -		dev_err(qproc->dev, "unable to resolve metadata region\n");
> -		return -EINVAL;
> -	}
> -
> -	qproc->mdata_phys = rmem->base;
> -	qproc->mdata_size = rmem->size;
> +	qproc->mdata_phys = res.start;
> +	qproc->mdata_size = resource_size(&res);
>  
>  	return 0;
>  }
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 02e29171cbbe..b3f7209289a6 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -121,7 +121,7 @@ struct qcom_pas {
>  
>  static void qcom_pas_segment_dump(struct rproc *rproc,
>  				  struct rproc_dump_segment *segment,
> -				  void *dest, size_t offset, size_t size)
> +		       void *dest, size_t offset, size_t size)

Irrelevant? (and two next chunks)

>  {
>  	struct qcom_pas *pas = rproc->priv;
>  	int total_offset;
> @@ -149,7 +149,7 @@ static void qcom_pas_minidump(struct rproc *rproc)
>  }
>  
>  static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
> -			       size_t pd_count)
> +			   size_t pd_count)
>  {
>  	int ret;
>  	int i;
> @@ -176,7 +176,7 @@ static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
>  };
>  
>  static void qcom_pas_pds_disable(struct qcom_pas *pas, struct device **pds,
> -				 size_t pd_count)
> +			     size_t pd_count)
>  {
>  	int i;
>  

-- 
With best wishes
Dmitry

