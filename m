Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F2DCCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 10:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UML1yqzrbQrPry4HepC8vV3t4zwpEH9yK9wTNqr1R0g=; b=LlCfOl8Qod1xk3xdt3hXjZxs9b
	90ZR/KSsQmPcl+hx7M2g1h4ld8+RVFcWS3OebM4wvo7ChEBv8uHZ4DpI99K5DxUxxCqM147ctVSYx
	GMqP6XG3iWNFXyY7dmKPbqcbtcI08eRE8g2MKcAJzhR2uKx0ylQEhnwZD9ArLJbl/QkIx0bqQEWV5
	w8k1yoSpURseFftSIw6aFhYZMO91RnPzkuCHDRN1wMP0VHYZNZV7vvv2LlQWyPDi0xZ2v4Nc8ga5G
	RltZy+XpsMrx7q2Zmqt6780TA09IeM70DC3j+fV3eQlI2o+J6a4S/6/5/SCrrkVaAYTEaO6dmJlGU
	w7uS9xdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBsHk-00000005pXC-0LnU;
	Thu, 23 Oct 2025 10:11:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBsHh-00000005pWU-1jth
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 10:11:06 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7Gpvs018571
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 10:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UML1yqzrbQrPry4HepC8vV3t4zwpEH9yK9wTNqr1R0g=; b=PdmkTEjhYy74Piku
	o/rzY2pZzaSnTfurWYJ+nMcD+Z2vSvrjfeWbD4+vNPJSsQoWkHb1imjoSeyPfnl5
	f06t8xeTjJthYrgXjJW5Y2oMwqKVvH1dlT+3z0/llH9F+5ObN55oCURUAni5hd4w
	fDl7g98uzQAGvqMzhFcFSIm2LFrqhFGI5kdKNFKOr1n4nufjciODTzfkQ37ioaUc
	dWMAc6/JSX53oeo+AzNXxb5VmZiAFFDOg2snxx3hVVUpxykogKesbpHcfCM4YSDF
	F5dmXoqOArVJMPvrvgTR6Saf1pmRHf05Vpzkis+de7/jvmuz59NZaj0F6iL6/kkZ
	phdTnA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pr78u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 10:11:03 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b62ebb4e7c7so507632a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 03:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761214262; x=1761819062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UML1yqzrbQrPry4HepC8vV3t4zwpEH9yK9wTNqr1R0g=;
        b=GRLns51u3CJxJdFOSzjXWCHSf+u5uxIcUzRe9jAo43wB7pEZaGReoregNoiNioIQFP
         yc+MpckjpK3+IwvtMC/G8lp2JWqmCcqm/pQ4k3aceJH2YMMn38pJkkkjD/d+iPZeojGy
         +1vkgT0ZadhquZgFKcE0kGr2KhxlORTWAaAn8p0UJ2Xmeg7+l+wBfpcEzk/yAj0+jfpt
         v6AG/JcDj/Sjf02dqHtXUEzFACAh6F9vGt/vDm0ZOf2C8xB9++ViKvgWNsHu/zkoZ/Ar
         Fi0R3i5VVwTaKE0wEgqjxROTCCyay58TKTPqZHnezQOPQ7XGwIyaOTVZgr6A35JXnsLO
         XqJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVemG9Wfc4M621+o9zDzl+wSI/fPisv24y1Jmm43CfKHukXRMp0w26PaLPaJl18SBlL+MzyiuwtLKUen0r89Xne@lists.infradead.org
X-Gm-Message-State: AOJu0YyAP8ZJVUcG0hGuIaQYN3sJ51Jz7x3HblPpIiSZTHZqZdkg2vsn
	Pyo4UFjejUhAJFqhftlEAlolNjWipgEiIDbPVRSXwlFv/X/gm2XjhjM2eREhNYFzW4O8AaWEtsX
	E2hfKfavda2qqyj6wfNNnmiFj9Hm7TdYse+2VNAQ84Igjd5vsCHXaOdz1kcnx3A3jFagpXYY0ly
	jzIQ==
X-Gm-Gg: ASbGncspVSCW9fyn2a6RLYh1gL/+SN1rRzpEyQU6+GOQ7C7tDXNfMLw3vuVozqOPjKZ
	EPdAhF8EHJoYcOvfIG6NwQlikpN7zAPeIj0lVIF08vOYwSSjLM+PSrTyKs7vIoyyGaaDaNmsSRO
	YQb4vLnLprQRvB1a7P2UMBxY8++wZJvjiLspxkeFwLFUH/0+FXh8TDmqhB1ICb/OfMkgKF2Yrrb
	gaK/5mkwa9nArO/51yeZ0SZMX8FoOWggOEDl+slQyprtU10A3on2AtMTC38heUw40jyHyGVj4dg
	SYxmH8MIbjxUU9ZqPqPc+CaQr5344wFcRIpeqD1DT3HjT6/Y4LlWPY50LcvZHFx66jg4Txr82P+
	QKUdTK13Dl3BEHYVcZLkpOEGtbArFN8dk4BmRodRntkgzkMvNeidi12No2GSWnoYVqQ==
X-Received: by 2002:a05:6a20:9186:b0:334:7aae:c43b with SMTP id adf61e73a8af0-33c600ad4c9mr2446150637.20.1761214262561;
        Thu, 23 Oct 2025 03:11:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFy40H0MW5NZRQSkKA5Qh1AhBvaXks0B6kqhFazrM8IjeVicGOuL4gdISqwRAuDa2V1gGJ8w==
X-Received: by 2002:a05:6a20:9186:b0:334:7aae:c43b with SMTP id adf61e73a8af0-33c600ad4c9mr2446115637.20.1761214262075;
        Thu, 23 Oct 2025 03:11:02 -0700 (PDT)
Received: from [10.133.33.151] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb9c8asm1654060a12.9.2025.10.23.03.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 03:11:01 -0700 (PDT)
Message-ID: <f8c315b9-acf8-4085-ab10-0d6e60ef7c39@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 18:10:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: mtk_scp: remove unnecessary checking
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <aPi6eBlFLH43A4C0@stanley.mountain>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <aPi6eBlFLH43A4C0@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX2lzxkTt1OBT2
 8vZB1L7jjHKVMjimZGN4xt6OGoURXRiK+dykrcJ5Qw/DD/s0U+pTGzfCIuJSIfTbrGAYOpsCoqS
 TAD4sBlInNWG29IB6z3VOsjZuEDnYVvtqakqwE6Qg9njU4ikeHc/ySHkhygQdu5v4yG+8xNQ0TH
 iUa3GvDHaPlaibP0vpifaMF8SjnKg0xAygYsk00QuTQ3stl6FoAxH7DJMTynqPqnjQN31Lxj0sE
 Ft+FtkYWdFGFOTljCUkHW3A0v/V0+Kbo28PLkyEZjrI4TaPJ5jV8ofM/hHQ5A1jYQaRfpxylYZ3
 mlXC6zrwCO3a1MuDysXZv1g3YnPLovtaNQJfSKjTA1/EtqVwUl3ca0PhkZ8tU9wuFok7qIiWy5V
 Lp5YV58fyp/L3nAHxnM25XqQTP+kaA==
X-Proofpoint-GUID: PeySYkneidYBazwtJ4553lYDtgL5yGvD
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f9ff37 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=IDcGV2vxZRipFm0qDp8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: PeySYkneidYBazwtJ4553lYDtgL5yGvD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_031105_577417_6A31A9D0 
X-CRM114-Status: GOOD (  18.10  )
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

On 10/22/2025 7:05 PM, Dan Carpenter wrote:
> The kernel implementation of snprintf() cannot return negative error
> codes.  Also these particular calls to snprintf() can't return zero
> and the code to handle a zero return is sort of questionable.  Just
> delete this impossible code.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/remoteproc/mtk_scp.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 10e3f9eb8cd2..9b624948a572 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1127,11 +1127,9 @@ static const char *scp_get_default_fw_path(struct device *dev, int core_id)
>   		return ERR_PTR(-EINVAL);
>   
>   	if (core_id >= 0)
> -		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
> +		snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);

Hello Dan Carpenter,

The patch looks fine to me functionally. However, one concern beyond the
current scope: if core_id >= 10 in future extensions, the
snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id) may
cause truncation.

scp_add_multi_core
       |
       v
scp_rproc_init
       |
       v
scp_get_default_fw_path
     char scp_fw_file[7];


To guard against this, maybe should we consider adding:

if (ret >= ARRAY_SIZE(scp_fw_file))
     return ERR_PTR(-ENAMETOOLONG);

or just expand the scp_fw_file[7] array?

Thank you~


>   	else
> -		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
> -	if (ret <= 0)
> -		return ERR_PTR(ret);
> +		snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
>   
>   	/* Not using strchr here, as strlen of a const gets optimized by compiler */
>   	soc = &compatible[strlen("mediatek,")];


-- 
Thx and BRs,
Zhongqiu Han

