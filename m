Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECF5CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 01:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dMk1PFgMI3iBzjl2W60oVJ/yYa1atum9g4O87B2FnM4=; b=SscLHBdeQCnlq5gUHnc04u6Mro
	ALhiJKqyRXSQVfeSe8q6iz15nRfHCp7ZPNG+TbdaCd+AfQYlafsgk1nTATpDeI6HaXWtxD32qkafJ
	bHEV7UmuEl7B/NZ5L7xodFahLIXq29Hf6yVAwngT473arffCjVGs7wSwgkWxb03Iu7gBaQnzN+muS
	BChy3Y8wdUHQdcpfR0k1fviOwSnnqMiqNcxK9NmFQ9apMGDmdgT7iB6wIexFuYiWJ/dVApARF6xwV
	JkeUZSbDhSnsB7S+4Iy1rupU++qDNX+/RJ6V5JFbV+pbXuusUIngGOi2oR2roU8dgVYQlPhM27gvt
	E5LUO0pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1EeN-0000000FJxN-18mh;
	Wed, 24 Sep 2025 01:50:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1EeJ-0000000FJwq-3215
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 01:50:29 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O1PEEw026280
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 01:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dMk1PFgMI3iBzjl2W60oVJ/yYa1atum9g4O87B2FnM4=; b=VaxDiuJMS16vKNsj
	q1L6Jcsn5+FnLoWd03ZKAuZyZ537P08Gz1sNhHV+C5pinVVSyXCuJRYeKMoNx6wo
	ojYWqbQU8fVv2dgqmWOjjM8lIH3eO/W7hi8qPbxXfxPv5SCQEb9F73QiGdrHvU5v
	Y6Gt1EiL1zV7NcoA/fwgALoU22snvsYjiS4QktRjGv+UInfC3bfvWweZFbtZO68f
	hDxFwsGBYFh3+HGKWigikbleEI33K6w6cnJemwqXYQ6sV4hlsXPAHvG+zdxtGQj5
	+tPO8T6uA7LDTFYSs3Xsb5F4I6QZo225MbHqZJeYLXHYdHqQKmJIsyju1kJTHjrO
	Op4QHg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyety81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 01:50:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3307af9b595so4350448a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 18:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758678626; x=1759283426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dMk1PFgMI3iBzjl2W60oVJ/yYa1atum9g4O87B2FnM4=;
        b=DsGhOCkquQBsnd6XyW0KqGYzi3K9/5JsaSely2pNZQwwseNqvk019PTVkRWKEecAvW
         8m79juZG7uVwTncWTuhPlbEkw6KssFslf48zF4QpcNn6claxMqi8uYhLh3Gm/ZM8dp3g
         hkecedAF5tn1cCHstL68etxyLj07qYOYKdgl3sJTBBpC2wq8nzw/mCaLy7/rki3Skzmb
         x2AXCxxseVi2+2G3dKWnqirnhIF2pX31KeOZhvaQUeZjKjm6Sl2UezO18YWzoRyzCpMF
         Z4vuyEQanr1MBmbli9ovJpHNR32ABnEAdG7KE7xANRXQxHpwXB0FsbSMVHjZbTwNUmkg
         2chA==
X-Forwarded-Encrypted: i=1; AJvYcCVoF/DCo5QWTIQ2ryzGkwpIdV7yHAvYHEFOX9SdMkU9RVmHgQgjCzsZCcVpLNF9L85+3H0zZaUEkO11EtEZiXKx@lists.infradead.org
X-Gm-Message-State: AOJu0YyEF0SGSNneiDk2LAoPOemGTN9GHuwN+XpLiGx/MBQsyB3zWw+A
	R3v19EWUAA9a4lgk2zKxY4XrsNOcxuASJi7ckyvxskR//VoIkH1v1Y0MSwp/DqOXkhTDNIszjv2
	d5hIs2uD3oXcw4p+wv+YQTh+aZhBKvDpvXNMipyq2cO3wXIx6Buibf+sT/MUJaCXke/UtV6SYnW
	EBVA==
X-Gm-Gg: ASbGnctHzfHzSS35GSXo3q8hccahN3gVZSyBPgFi6pM/JdM7ZuYIDs0YQSCgjYRap/Q
	/cFxMeH0kYW04PdRF8slvp0jgcUVe9N0nYc189VgBUBG9mgcjsMdiYBQfc3vqC0vS2pBOajOb5L
	qKNI96V3q+0wH7Ydi0trKBWUP5AOnuvsxwehBwzlHTmQBabXlxw/zianWezWrgefxub+Bpw+1V/
	jZcPY9Tu67UEC7uvasBoouiuzwPJAVsA3r795I1tSB5NqU7SD8ztMwjdMjNuAtcMurXrcB3orCg
	Pr2lmptGeYpBkoaPgzbpOLM2tUAJ7kdYJsWE1sKjGOtoryA70LXHtMa3h1L0Q7efZgy9
X-Received: by 2002:a17:90a:e7ca:b0:330:8c87:8668 with SMTP id 98e67ed59e1d1-332a9513658mr5170043a91.14.1758678625586;
        Tue, 23 Sep 2025 18:50:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC/ctB7vh6PDCSgKOJgudcq/zBAOSGTDLmlFLHWBJL5DS42mvLkFysSiW1tZ+GQYJeN7UkGQ==
X-Received: by 2002:a17:90a:e7ca:b0:330:8c87:8668 with SMTP id 98e67ed59e1d1-332a9513658mr5170010a91.14.1758678624840;
        Tue, 23 Sep 2025 18:50:24 -0700 (PDT)
Received: from [10.239.154.126] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bd8fad1sm496360a91.4.2025.09.23.18.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 18:50:24 -0700 (PDT)
Message-ID: <c88f5edd-492d-47c9-8188-c702cfa6301d@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 09:50:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] firmware: arm_ffa: Add support for IMPDEF value in the
 memory access descriptor
To: Sudeep Holla <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: Lixiang Mao <liximao@qti.qualcomm.com>
References: <20250923150927.1218364-1-sudeep.holla@arm.com>
Content-Language: en-US
From: Lixiang Mao <lixiang.mao@oss.qualcomm.com>
In-Reply-To: <20250923150927.1218364-1-sudeep.holla@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _iYk-0Qh03iYaPq_XKEkDok8aXlFy2uA
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d34e62 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=aaNDuw_hkKaaLFpP:21 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=RHNJ8GERv2vVevSSRggA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfXxVI9ixe2iIXt
 SGklI8HT4gSe8suL0MF4Ng0t77Cnif199AJD6hNgMteSSvLTGw4+53+pjOsp1YmdeEonxCnPpoN
 qlfKgrQzJANkJvk+XhIB8v8jwCZE6ZKMShN3M2NXCAeqvhJeFuj2P++nFvGfW3ZqCPTr+UfTYUt
 xR++Knts9Rmv8P8Slv+fyeQ6yrO09iN2vQvVSmDXXIFoXpHZZvwojm7IpefiSkM79q1DP/CL6D+
 cKAToyf+upuwNhmBstkfLNsBRDpItgLw8Ixg3/7nr9TMJ5B33+vVV4LdO31TJJ+xqHSoCLIyWg3
 Igoz9NUza/nzU6pQTP3F8GOxPA8458c6Cc8jHq7b7c6GzhF49dDiZwR2pWCjSdrYKSFDhK4TPld
 DSIZ3yzr
X-Proofpoint-ORIG-GUID: _iYk-0Qh03iYaPq_XKEkDok8aXlFy2uA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_08,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_185027_773031_7AD1323A 
X-CRM114-Status: GOOD (  33.16  )
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


On 9/23/2025 11:09 PM, Sudeep Holla wrote:
> FF-A v1.2 introduced 16 byte IMPLEMENTATION DEFINED value in the endpoint
> memory access descriptor to allow any sender could to specify an its any
> custom value for each receiver. Also this value must be specified by the
> receiver when retrieving the memory region. The sender must ensure it
> informs the receiver of this value via an IMPLEMENTATION DEFINED mechanism
> such as a partition message.
>
> So the FF-A driver can use the message interfaces to communicate the value
> and set the same in the ffa_mem_region_attributes structures when using
> the memory interfaces.
>
> The driver ensure that the size of the endpoint memory access descriptors
> is set correctly based on the FF-A version.
>
> Fixes: 9fac08d9d985 ("firmware: arm_ffa: Upgrade FF-A version to v1.2 in the driver")
> Reported-by: Lixiang Mao <liximao@qti.qualcomm.com>
> Tested-by: Lixiang Mao <liximao@qti.qualcomm.com>
> Message-Id: <20250919155216.34074-1-sudeep.holla@arm.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>   drivers/firmware/arm_ffa/driver.c | 37 ++++++++++++++++++++++---------
>   include/linux/arm_ffa.h           | 21 ++++++++++++++++--
>   2 files changed, 46 insertions(+), 12 deletions(-)
>
> v2[2]->v3:
> 	- Moved FFA version checks into macros and tie them with features
> 	  to improve readability and maintenance
>
> v1[1]->v2[2]:
> 	- Fix the size of EMAD in ffa_mem_desc_offset() and the loop
> 	  increment in ffa_setup_and_transmit()
>
> [1] https://lore.kernel.org/all/20250915150119.3106344-1-sudeep.holla@arm.com/
> [2] https://lore.kernel.org/all/20250919155216.34074-1-sudeep.holla@arm.com/
>
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> index 65bf1685350a..c72ee4756585 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -649,6 +649,26 @@ static u16 ffa_memory_attributes_get(u32 func_id)
>   	return FFA_MEM_NORMAL | FFA_MEM_WRITE_BACK | FFA_MEM_INNER_SHAREABLE;
>   }
>   
> +static void ffa_emad_impdef_value_init(u32 version, void *dst, void *src)
> +{
> +	struct ffa_mem_region_attributes *ep_mem_access;
> +
> +	if (FFA_EMAD_HAS_IMPDEF_FIELD(version))
> +		memcpy(dst, src, sizeof(ep_mem_access->impdef_val));
> +}
> +
> +static void
> +ffa_mem_region_additional_setup(u32 version, struct ffa_mem_region *mem_region)
> +{
> +	if (!FFA_MEM_REGION_HAS_EP_MEM_OFFSET(version)) {
> +		mem_region->ep_mem_size = 0;
> +	} else {
> +		mem_region->ep_mem_size = ffa_emad_size_get(version);
> +		mem_region->ep_mem_offset = sizeof(*mem_region);
> +		memset(mem_region->reserved, 0, 12);
> +	}
> +}
> +
>   static int
>   ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
>   		       struct ffa_mem_ops_args *args)
> @@ -667,27 +687,24 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
>   	mem_region->flags = args->flags;
>   	mem_region->sender_id = drv_info->vm_id;
>   	mem_region->attributes = ffa_memory_attributes_get(func_id);
> -	ep_mem_access = buffer +
> -			ffa_mem_desc_offset(buffer, 0, drv_info->version);
>   	composite_offset = ffa_mem_desc_offset(buffer, args->nattrs,
>   					       drv_info->version);
>   
> -	for (idx = 0; idx < args->nattrs; idx++, ep_mem_access++) {
> +	for (idx = 0; idx < args->nattrs; idx++) {
> +		ep_mem_access = buffer +
> +			ffa_mem_desc_offset(buffer, idx, drv_info->version);
>   		ep_mem_access->receiver = args->attrs[idx].receiver;
>   		ep_mem_access->attrs = args->attrs[idx].attrs;
>   		ep_mem_access->composite_off = composite_offset;
>   		ep_mem_access->flag = 0;
>   		ep_mem_access->reserved = 0;
> +		ffa_emad_impdef_value_init(drv_info->version,
> +					   ep_mem_access->impdef_val,
> +					   args->attrs[idx].impdef_val);
>   	}
>   	mem_region->handle = 0;
>   	mem_region->ep_count = args->nattrs;
> -	if (drv_info->version <= FFA_VERSION_1_0) {
> -		mem_region->ep_mem_size = 0;
> -	} else {
> -		mem_region->ep_mem_size = sizeof(*ep_mem_access);
> -		mem_region->ep_mem_offset = sizeof(*mem_region);
> -		memset(mem_region->reserved, 0, 12);
> -	}
> +	ffa_mem_region_additional_setup(drv_info->version, mem_region);
>   
>   	composite = buffer + composite_offset;
>   	composite->total_pg_cnt = ffa_get_num_pages_sg(args->sg);
> diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
> index e1634897e159..c2d1f743e44a 100644
> --- a/include/linux/arm_ffa.h
> +++ b/include/linux/arm_ffa.h
> @@ -337,6 +337,7 @@ struct ffa_mem_region_attributes {
>   	 * an `struct ffa_mem_region_addr_range`.
>   	 */
>   	u32 composite_off;
> +	u8 impdef_val[16];
>   	u64 reserved;
>   };
>   
> @@ -416,15 +417,31 @@ struct ffa_mem_region {
>   #define CONSTITUENTS_OFFSET(x)	\
>   	(offsetof(struct ffa_composite_mem_region, constituents[x]))
>   
> +#define FFA_EMAD_HAS_IMPDEF_FIELD(version)	(version >= FFA_VERSION_1_2)
> +#define FFA_MEM_REGION_HAS_EP_MEM_OFFSET(version) (version > FFA_VERSION_1_0)
Minor: version -->> (version)
> +
> +static inline u32 ffa_emad_size_get(u32 ffa_version)
> +{
> +	u32 sz;
> +	struct ffa_mem_region_attributes *ep_mem_access;
> +
> +	if (FFA_EMAD_HAS_IMPDEF_FIELD(ffa_version))
> +		sz = sizeof(*ep_mem_access);
> +	else
> +		sz = sizeof(*ep_mem_access) - sizeof(ep_mem_access->impdef_val);
> +
> +	return sz;
> +}
> +
>   static inline u32
>   ffa_mem_desc_offset(struct ffa_mem_region *buf, int count, u32 ffa_version)
>   {
> -	u32 offset = count * sizeof(struct ffa_mem_region_attributes);
> +	u32 offset = count * ffa_emad_size_get(ffa_version);
>   	/*
>   	 * Earlier to v1.1, the endpoint memory descriptor array started at
>   	 * offset 32(i.e. offset of ep_mem_offset in the current structure)
>   	 */
> -	if (ffa_version <= FFA_VERSION_1_0)
> +	if (!FFA_MEM_REGION_HAS_EP_MEM_OFFSET(ffa_version))
>   		offset += offsetof(struct ffa_mem_region, ep_mem_offset);
>   	else
>   		offset += sizeof(struct ffa_mem_region);

