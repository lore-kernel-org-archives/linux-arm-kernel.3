Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333C8CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 02:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iC9WgX+KWDNWsi9f4O8Igv8H9OJ4FvN98LJ6PC/Ghsk=; b=PX3lVs2fFqLDeGh+WM5DdpmivL
	2t6a3k6fZ9MPloHCwiICcibS0pfQAA5gq/7m415zUwXGHvrmA5eXMFbIoJDyXA7ijUUMgnBSur/SS
	Ez2EFxQLsYK54Bsjo2UpNW3eM6em5nEifUecBEUfXqdzzHx8PYIiIbzVYCVFQ87ib9JBlxaG/T+p1
	/hiDKZtjOaIuLaFMJIO1hk1wQeInmzku1rSWL2mKXAIRknSqon1oMtfRryA7nkMNo4pwj7MUusa6V
	QWtmYK1xY0KDoT3vVprYjlI1cwib0l4jEL3DIIW0CGT0Ew5lmJ883szLnZrbJc7tCVHQlzxrXI4GV
	YqmC/VsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0W2u-00000008ZCy-2rSk;
	Mon, 22 Sep 2025 02:12:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0W2q-00000008ZCY-34bg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 02:12:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58LAC3Kq018265
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 02:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iC9WgX+KWDNWsi9f4O8Igv8H9OJ4FvN98LJ6PC/Ghsk=; b=GlmbIEk4im3vfpRO
	CY/NvX85qe/L8GfIG9AqXB7WWZS/YiGGWf6gLu2zJYi2fJEU/B6ji+U1/dANlHKj
	ftwF7n5cweiZ0Ncv/tAqyMA+WPcQ3brNz1c1UeOGcWL7EjWVtsDIpsI8gXQECc1C
	PWN58CslKhHYh2+Cz2/t4Wf2jlDKeUbjrD3Tb6K+oWB8lhM5q+2V/CMPUac2JgLg
	HUaKfwkB+/Bd8Qjb7BF8dH0J4vbqZfI8EjSCMOCQDIWChX5knIr58RReDZlHIPI6
	+ZJmzMVM30rVqQrQZd5bg84+3PEu1gATBS7RSfVgHcxfPqirGf3y5c9PQcHof1nA
	PpY2fA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499nektwan-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 02:12:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77e7d9ed351so1842094b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Sep 2025 19:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758507167; x=1759111967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iC9WgX+KWDNWsi9f4O8Igv8H9OJ4FvN98LJ6PC/Ghsk=;
        b=AUsTj1B7GcXugWSlnu5BAtJ/z/fuqWSPTBkqu1tFWbzOLUm0asXHJc1NCJ48lxxM54
         RP2WFBP5+lHaWN6qHaSHSvqSUwDawwAZ1SaNJGlIWWj9gLyAWz0OxS83easbZzpgedcV
         JBjCztFRBk1Q8g9JQNiqDSPZC2Ry6v4gpxB/PXhM3nrFK9Rn3CzS7QtZyKBdPJb8oEpC
         jgDhrz+U+yNwtbRiqVhCMf4rjPdiv+Pn9ssRE0IDNWPmH7sJI2UwSImFyEboTnfAZjBV
         iNLbPUaWE9mZP/4Tkm+NjMZgBg/pivG5hbPdWjVaOxjcPWyUfUK35iIzBf46KwiP/S6Z
         y7BA==
X-Forwarded-Encrypted: i=1; AJvYcCXXaLv7hDpZhvJqjF0tCT1xKKBvyHXWdkNfUVH5A7Ho6tbxtThGyWo2uDVYFtyip7FgRNeZnSwlXpD6UZxIlWPC@lists.infradead.org
X-Gm-Message-State: AOJu0YyQPGH7LHmA6lZ/vj4oMSV9vZwHao+wwD4KoUKeixFkmoi3m99Q
	96kT/n0yUgIe+09YcKZzpWkPknui6mZaI7vFOwq//JRzq5rEcbAHL1eToKoH3l8EI4JAUinTtr+
	CYPtDRbjjyELRDqn/yp+rA15RgP8mgS1VVNS4lGBsr7ILRzwJjWXxyrSmj1mtswveJNOq01S83P
	FoVA==
X-Gm-Gg: ASbGncvUICtveuVBlTqW626rRkWhzoydjnacmbgObeXqSzaelIH6ea+ubJ7Z0maWhfU
	MAFvPbBd9xUOj9ucdVCGSHfjJLY1E0XdFNb/ZcCC38OEOTh0PkNWirNPEq3VvkmxMvkvLgAl+W5
	0Uy/J6T/wzDMlK1pSuaMPs533U9F1A7GdG54n/gCuvy6U6x9I6KpfIX5AlG++GM19ALpXNlMCAR
	K6IEM3s/P1oGwL16CLqfivLkr+4C/FFFRquG08na19rFbBtkNMjOI8hLU6or/hl/LbL2nxIq26K
	Ig9OdGmDNX6Yj948qZz3WyslwdM9oLebgjbBC5fMqf+kmrCfQFMHdgQ17ubnbZ97Uvyn
X-Received: by 2002:a05:6a00:4c16:b0:77f:d23:a1f3 with SMTP id d2e1a72fcca58-77f0d23a2d7mr12312842b3a.6.1758507167154;
        Sun, 21 Sep 2025 19:12:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0nJwt8VyPwRTk5zPxaaYSfuQQPElbSeruuL1494AIbjCBXPOMTC/N27eggzM78XkyrBx3Tg==
X-Received: by 2002:a05:6a00:4c16:b0:77f:d23:a1f3 with SMTP id d2e1a72fcca58-77f0d23a2d7mr12312805b3a.6.1758507166625;
        Sun, 21 Sep 2025 19:12:46 -0700 (PDT)
Received: from [10.239.154.126] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2863912dsm3298202b3a.26.2025.09.21.19.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Sep 2025 19:12:46 -0700 (PDT)
Message-ID: <9fb7e6be-a952-46af-a224-15cf8fe3bc7f@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 10:12:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: arm_ffa: Add support for IMPDEF value in the
 memory access descriptor
To: Sudeep Holla <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: Lixiang Mao <liximao@qti.qualcomm.com>
References: <20250919155216.34074-1-sudeep.holla@arm.com>
Content-Language: en-US
From: Lixiang Mao <lixiang.mao@oss.qualcomm.com>
In-Reply-To: <20250919155216.34074-1-sudeep.holla@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DnBNQvraEqAPLYGcEMKt0qjr24QAhqh8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDA0MSBTYWx0ZWRfX0ZI3sNtff2P1
 WmGz2AndAo8zJ5MwvqloZ1NZrODKIalRlnrcyg6bLl5jl5yZhwAlH7fikq5EnI225o6zvzrFuC+
 Qs+eHS9owy9PdFP3IgQbSh9nToPCAQZXxijq8hMynvyzpmB9Te0o5YeCOwxYBObmg4kL3vhoglL
 tNaIAPmjBuM9svkpf+5WsocNL/gDgAi/AtAANGvPYCWbkJ562ZdE+wg7eZQ1kk0Z7I7o24fZGwh
 j0oScCuEQfHcnsw1tKCS7AztUHAzG1uEJlgALreHEHdpAtlKYvaqImrlJh8DCSierpHs/MhyELp
 Fn7KldYRYaxnihc3vT0R3tE+F5rPU820YBXRHFzInOmo7acsJSmsqrQp2US9U8F2skKcHVyOAmB
 AQy5+4zw
X-Authority-Analysis: v=2.4 cv=b+Oy4sGx c=1 sm=1 tr=0 ts=68d0b0a0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=aaNDuw_hkKaaLFpP:21 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8
 a=7CQSdrXTAAAA:8 a=0PoAz1LEv9j6ZUXw-RcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: DnBNQvraEqAPLYGcEMKt0qjr24QAhqh8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_10,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_191248_787580_68F83BD6 
X-CRM114-Status: GOOD (  32.23  )
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

I compared your fix with mine which is tested internally, looks no 
obvious difference.
I think it is good to mainline.

On 9/19/2025 11:52 PM, Sudeep Holla wrote:
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
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>   drivers/firmware/arm_ffa/driver.c | 37 ++++++++++++++++++++++---------
>   include/linux/arm_ffa.h           | 16 ++++++++++++-
>   2 files changed, 42 insertions(+), 11 deletions(-)
>
> v1->v2:
> 	- Fix the size of EMAD in ffa_mem_desc_offset() and the loop
> 	  increment in ffa_setup_and_transmit()
>
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> index cf6e44429ecd..b68cd9eb09ee 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -654,6 +654,26 @@ static u16 ffa_memory_attributes_get(u32 func_id)
>   	return FFA_MEM_NORMAL | FFA_MEM_WRITE_BACK | FFA_MEM_INNER_SHAREABLE;
>   }
>   
> +static void ffa_emad_impdef_value_init(u32 version, void *dst, void *src)
> +{
> +	struct ffa_mem_region_attributes *ep_mem_access;
> +
> +	if (version > FFA_VERSION_1_1)
> +		memcpy(dst, src, sizeof(ep_mem_access->impdef_val));
> +}
> +
> +static void
> +ffa_mem_region_additional_setup(u32 version, struct ffa_mem_region *mem_region)
> +{
> +	if (version <= FFA_VERSION_1_0) {
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
> @@ -672,27 +692,24 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
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
> index 0a0132c6ae3e..6e180fc0e68e 100644
> --- a/include/linux/arm_ffa.h
> +++ b/include/linux/arm_ffa.h
> @@ -347,6 +347,7 @@ struct ffa_mem_region_attributes {
>   	 * an `struct ffa_mem_region_addr_range`.
>   	 */
>   	u32 composite_off;
> +	u8 impdef_val[16];
>   	u64 reserved;
>   };
>   
> @@ -426,10 +427,23 @@ struct ffa_mem_region {
>   #define CONSTITUENTS_OFFSET(x)	\
>   	(offsetof(struct ffa_composite_mem_region, constituents[x]))
>   
> +static inline u32 ffa_emad_size_get(u32 ffa_version)
> +{
> +	u32 sz;
> +	struct ffa_mem_region_attributes *ep_mem_access;
> +
> +	if (ffa_version <= FFA_VERSION_1_1)
> +		sz = sizeof(*ep_mem_access) - sizeof(ep_mem_access->impdef_val);
> +	else
> +		sz = sizeof(*ep_mem_access);
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

