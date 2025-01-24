Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF31C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 06:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48WLvrmGgq8l5irtiIVlpxzaJVXPZ+RlqW2L6jPOFuM=; b=HnfE11roZwCy7bX4ve65v9lZM0
	2L4OWKulfH8VlcEvSoEa08t4T1ziiOKwFXpJB38i/Ar1oPay0pRJPsz0vFLS+wTQvYuHvraW9xAax
	ti52Nzz5mB2GlCDKVAtzpM6WTsuDLyhXgST6zQ7TW248PMXXJMWnAC7J8W7Yi97XMGGYL6bBevhgK
	4ZnOPXGxD79bG1vpYsEiIJHqY3bjaYRODS55N2IonRlg1K2IZpROo1Zw73EuJn5Y7hebKdWQ9vCkz
	egdgPkqMCFmutKj0a7Ka85a6NCheOzffGXmSoPZVQUM8SGyM09rw1WGHO7ZWyrDoOcoTB1ns55aB3
	t4s1c28w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbClF-0000000DywH-1xre;
	Fri, 24 Jan 2025 06:01:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbCjv-0000000Dyrj-49Z6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 06:00:25 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O3sYhc030950
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 06:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	48WLvrmGgq8l5irtiIVlpxzaJVXPZ+RlqW2L6jPOFuM=; b=meFLRnHKT5vtOFkA
	Ar3Sav+HG2/0PS8xAIG07cOtmouwEYVrBxVf/0h7UHglk+DkA4sGuCVFuRhnqDC4
	Jq86RINgIPrrfHVDX/XqosmrMeBBCZMOgWi63EVOc8meNayNo8nOk8Z7F/6+JdTb
	HjDQY1TkTkQU4kRhv3lxzddrJ3BfkXovFmLjrxalG8EH2eYac/4eucGrS5B/bspz
	GisSdGzyAdMzUjXi66K/DTrV210S12g/t2PkNPbBjdP/Sc+6m1XzG6qejjbqbnlL
	ff7SeyLM2EPPieH/Tz1UPgtTiWMWTsAK1GUijczN8GN9oBYcyXTIIyUzs9atE5p9
	QY2qIw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c3bxr7b1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 06:00:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-21631cbf87dso35492125ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 22:00:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737698421; x=1738303221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=48WLvrmGgq8l5irtiIVlpxzaJVXPZ+RlqW2L6jPOFuM=;
        b=ZLcjnacyQWtxlrmY4JeldJhtiqYqgOHTWDlsFPfWDXE3YE9pvndjGTGY3rmqxRzxN0
         mE5cpel0IplEJVag8ubxVe7NlZa4KgtiCaLWsUrGKRm91DuVYzYc7v8HzTqj59ZRGN6q
         jUcKvbjSe2PeP93VeLrcI2WzoNcrX/p9BBFUsWiaIGQeuLPlpiRJUp0XchMcpiNXhqbr
         4AchwpxQSVlv3yjQuqbBY1HJsNO4RsHRy/4GPTrJC1P+EZdyF2uRLYc2T+8E4MSaZwKb
         AEdlDmYVZdDbH5c5MLmxzbUYYZpjgrG+yxRl/UqQs3epnGY6cDkqDBzVdWSxjundRtKv
         kGFw==
X-Forwarded-Encrypted: i=1; AJvYcCUjFTCTmjCHfgyv36QuHt37QKOAbeZeigQomfGLgIpb/d5AFaPua7UiPmTRiNmLFlpPz4mtCWBcr+jzcbqjSuvz@lists.infradead.org
X-Gm-Message-State: AOJu0YwoOZwMIKzabi1bn0rTMkVzRkFNDWZ5P/PgYq57/Ha2ji9+ljMh
	DAZYQf/C7DgtZAvhF0BHYv+miRRgxAiWPLzfFGGHJUbJag0ERBbyNXHDUFljSa52V2RsXd9elIv
	RvP0mrUgx8sQAyaQCjfHp9El2RS1xTq9zEvWPEKQhBjrRp1z5IcKy4lDUQtZQQM6nfx3tmT04FQ
	==
X-Gm-Gg: ASbGncs78xpDOG5GqemLpSRLsE+Acz3jm9FiSnNkz/05q6GV/PGtETHapfEVfYBt7LG
	wwTmVyVK4nhcKt5N1UOEPKb6PkKB/yTYLYApsVk99Bu2Mj5HfDuL4kMUWx+dk51Q53UNFdvYNx1
	ZNNWF6/+2Qs3dXA5Gk1AUbSagIxCwnn1bTN+c8HZtQMd/rwWG3Rz2hlHPLCkWg2Fbrd7P7aXDyz
	FHMvw715l9LhXddh9iJTtIr2y4k0D6bFp/fMKxjqjXtAgrBax5AlnOXE8ZNso4LBb1GpkJPUl+l
	/yRWKx4vrj8=
X-Received: by 2002:a17:902:e743:b0:215:a039:738 with SMTP id d9443c01a7336-21c352de481mr468312635ad.5.1737698420699;
        Thu, 23 Jan 2025 22:00:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEY2M8ll7VI/M66jt4+0uoyEviD0sV6PuwerOhF56aY9l+1ofmanLjzThwLUGQXXTPjMhbOjg==
X-Received: by 2002:a17:902:e743:b0:215:a039:738 with SMTP id d9443c01a7336-21c352de481mr468312165ad.5.1737698420336;
        Thu, 23 Jan 2025 22:00:20 -0800 (PST)
Received: from [10.64.68.153] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da414ed3bsm8435955ad.193.2025.01.23.22.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 22:00:19 -0800 (PST)
Message-ID: <2fd825ac-ea58-4acd-a27b-b104868bcc20@oss.qualcomm.com>
Date: Fri, 24 Jan 2025 14:00:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: xilinx: Update the zynqmp_pm_load_pdi() API
To: Nava kishore Manne <nava.kishore.manne@amd.com>, michal.simek@amd.com,
        ronak.jain@amd.com, gregkh@linuxfoundation.org,
        jay.buddhabhatti@amd.com, praveen.teja.kundanala@amd.com,
        siva.durga.prasad.paladugu@amd.com, u.kleine-koenig@baylibre.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250123103522.1258499-1-nava.kishore.manne@amd.com>
 <20250123103522.1258499-2-nava.kishore.manne@amd.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20250123103522.1258499-2-nava.kishore.manne@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IPb2-S5sYLFRGkqJKLF0mLPDN1s7yMaX
X-Proofpoint-GUID: IPb2-S5sYLFRGkqJKLF0mLPDN1s7yMaX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_02,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=896 clxscore=1011
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 mlxscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_220024_155490_9C55D3A2 
X-CRM114-Status: GOOD (  18.12  )
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



On 1/23/2025 6:35 PM, Nava kishore Manne wrote:
> Update the zynqmp_pm_load_pdi() API to handle the firmware
> error’s properly.
> 
> Signed-off-by: Nava kishore Manne <nava.kishore.manne@amd.com>
> ---
>   drivers/firmware/xilinx/zynqmp.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index 720fa8b5d8e9..ea04a6ac402d 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -1483,8 +1483,16 @@ EXPORT_SYMBOL_GPL(zynqmp_pm_set_requirement);
>    */
>   int zynqmp_pm_load_pdi(const u32 src, const u64 address)
>   {
> -	return zynqmp_pm_invoke_fn(PM_LOAD_PDI, NULL, 3, src, lower_32_bits(address),
> -				   upper_32_bits(address));
> +	u32 ret_payload[PAYLOAD_ARG_CNT];
> +	int ret;
> +
> +	ret = zynqmp_pm_invoke_fn(PM_LOAD_PDI, ret_payload, 3, src,
> +				  lower_32_bits(address),
> +				  upper_32_bits(address));
> +	if (ret_payload[0])
> +		return ret_payload[0];
Looks a little bit hacking. As the ret_payload is u32, return as int, it 
has possibility to overflow?

> +
> +	return ret;
>   }
>   EXPORT_SYMBOL_GPL(zynqmp_pm_load_pdi);
>   

Thanks,
Jie


