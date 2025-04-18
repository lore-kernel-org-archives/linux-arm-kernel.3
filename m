Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01D0C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 12:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gnj9zyq/0nt1uavrCh/EJH373gTM2j2MUhc1HuK/Cmw=; b=o6rP5/agBjwesfSPtbxRALSz0W
	Cg5AANFRuVxOgpME2VcadYARzkkmLZEUEF/OobXhbBw1S48+xx7MgVnSYiENxBrnfPeFemJjnrjPp
	M/dbKE4BoOex8H0zsNaYJjgwAilafn93Z4pbEoQfjTUCK11ZLCHsOoBUXctnPjIfBGBMxEUbEkiG4
	g2xUFxhnYcAI0VSJkCu0OoGvc804zM4Gc6zYb9LM7OxPypMXKn/lx8TWwJRzJuBJ3h+06gRz/B6sd
	FJD199Kv54Jepnr390UhR3R5G2X/UhU6dtH8wJZMVsgxY03TzFdFcD0R2Ubmno3/w1MRY37du5xlM
	39UQiNmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5kZg-0000000G2d9-3FQS;
	Fri, 18 Apr 2025 12:12:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5kXl-0000000G2Oz-2Did
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 12:10:06 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HMvALq013110;
	Fri, 18 Apr 2025 12:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gnj9zyq/0nt1uavrCh/EJH373gTM2j2MUhc1HuK/Cmw=; b=ocElkma4te0ayMG7
	U9HswTJUg1vZlzL7zpEdKfUgUfxrWGbQ2kOKMeyHSJ6UWmh2lacWZO3woZXHIu+i
	5mfMzTL8JJe8VramdbHkxvrr05Vg1tne5sLL5WmYZMEYe5WVFf7KQ+GWhgGzEJhr
	Sk2PRpBaOHRveet7CH2wWGmWTYBNcpEX1mCd2mJxjQPdbnSbKJBM/AMuxpiDggkv
	M2HwlpAEsixsKmXucrqyzsA9tNHXOp80R5dad7PALmB8Iq6eZzHHdV/HXdepYfu/
	7DMNcurea2N4rECTLlyPN/C8bBX0pLkBooLJRCp4Ck2OGyTWXUf6QV5fB2dMrVJM
	Ko5+dg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhqj2rv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 12:09:57 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53IC9uM3019677
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 12:09:56 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Apr
 2025 05:09:53 -0700
Message-ID: <72f49447-5c99-4028-90cf-3f5cc11e8b53@quicinc.com>
Date: Fri, 18 Apr 2025 17:39:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: stm32-ospi: Fix an error handling path in
 stm32_ospi_probe()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Mark Brown
	<broonie@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        <linux-spi@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <2674c8df1d05ab312826b69bfe9559f81d125a0b.1744975624.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <2674c8df1d05ab312826b69bfe9559f81d125a0b.1744975624.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ALN6EHSkm0hBo3TgySFp18EK9VHox7fV
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=68024115 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=O8aqTkAXavC4eiQugfUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ALN6EHSkm0hBo3TgySFp18EK9VHox7fV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_04,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1011 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_051005_694156_0550FBEA 
X-CRM114-Status: GOOD (  11.43  )
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



On 4/18/2025 4:57 PM, Christophe JAILLET wrote:
[...]
> diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
> index 668022098b1e..9ec9823409cc 100644
> --- a/drivers/spi/spi-stm32-ospi.c
> +++ b/drivers/spi/spi-stm32-ospi.c
> @@ -960,6 +960,10 @@ static int stm32_ospi_probe(struct platform_device *pdev)
>   err_pm_enable:
>   	pm_runtime_force_suspend(ospi->dev);
>   	mutex_destroy(&ospi->lock);
> +	if (ospi->dma_chtx)
> +		dma_release_channel(ospi->dma_chtx);
why can't you move to devm_dma_request_chan ? No need to cleanup.
> +	if (ospi->dma_chrx)
> +		dma_release_channel(ospi->dma_chrx);
>   
>   	return ret;
>   }


