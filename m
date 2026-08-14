Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F233C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 15:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kyE9VpOdIdaJ4nhDgsqi8sGDrAQp14puQ8jsBWnSrk4=; b=AvUj5TvlsQ1P97g1nYE0vTwCqV
	yM4XUSTaLgdc4DQhKtPQCMEaVY65cCZ/15PmedyRrRmX1tNza4P7hgdjIgFSl71Wfj0D/fS1H+GAV
	otaNvDIoS8AejJUJrm7ug0YhMkn3CP86GETPJTbz712rsCYMQmayroEeD9Ymh1/W31Rc0NyhJ6OIp
	J1VwGZAi6rO3QZn6zaxHWnHZ58WEz6ZtX5tQkC4wYnCGAtCLx33AfOh1nSMjlI3jZJZDHjcIlXu6p
	aKWYxUGnImdpPriZEXiLv3UYRNDDx3NXKdsLfqn8dHB7ce6w6UjtScb/cFE1YCVz9jZTMPMWxfIFi
	xM7yR4kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuteB-00000002qXc-016n;
	Fri, 14 Aug 2026 15:16:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wute8-00000002qXG-2Xh4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 15:16:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EDx0i11852415
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 15:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kyE9VpOdIdaJ4nhDgsqi8sGD
	rAQp14puQ8jsBWnSrk4=; b=l2X/4kUCbRyW2naU8380mUkZRR7Ih7negTrhzcMO
	yO7pLFlYCLpT0U9KsQTB31rtB6qOAlOQ7tXmjr0frq3MhmYKk6QHtKK/50Kbqzjg
	GiQw2kKgjku0JBKi+OZS3Cq/Ynq4h6KmUjAMcP4sjne9TDOGPK5sNWX/FyGKJ2Y7
	SIuHlKEB1zWI39oSGe3/1Sk7fC76Ecp1snprsFR9kFyxK/HZdhOmKSykVqFCsEu1
	M8DJmwSZ6W/rRlf/Uwi6OHIffgtEmAdiOFIlO6HN+5SBb1OZAHEeduzf2jXrE8om
	rl6zCiFQTmuraJo6WGhom0/f1uPa0hf/WjjHEagZCSpQLA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g20639g1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 15:16:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c26012cd0so11325441cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 08:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786720594; x=1787325394; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kyE9VpOdIdaJ4nhDgsqi8sGDrAQp14puQ8jsBWnSrk4=;
        b=hvetv3qJRT0IYoKXyhFC+g4XDywUVlfrbMIrZevr/HbyFnwcyxMVKIQuJufbRDzBKI
         rH9UnCJowLZxi/onnS145CIXhDdiJiTzPiRUU7fRo5qRbFOSXkmDMiFd3HwahAdQ5p3X
         WEXkKvPqPEaAL8QaOm2O1oheHy4qO5KkG6sYpJ8uuM+f74Ye/TGDCG9V9s3dSb7P5ZRy
         XrFivG9D35p2iFQaKASHBuFTC4kZ8a+1ksePtFd48UfgngqrM0PAy4uZi55CAPQakToD
         r4RIZQB6IexuazJWpgF/9EfYI2gxZ0ClzwQm6UI1zoie76Mqeo6fyJkM4r+4mrllCH10
         +hBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786720594; x=1787325394;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kyE9VpOdIdaJ4nhDgsqi8sGDrAQp14puQ8jsBWnSrk4=;
        b=k2p48W4xuI96xIgSTtC0AhtnsHfVucY+NYIXk+s1trlxkW+b7p8aF0wG1Uzd3kSKkd
         NkvNkGCV2Kx78KN5+a8t/reBJ4NbcgC6absRxvQSVqRcBngSSI5+UZI0tijTDApDWTwg
         OEkSYZsgzJQC+rsrWOGtzZ6boGaFYsYTkK/8OKHjGi0vepw1JwD6mJXYBqWGFDqz5AtA
         5RS4LzJW7lUJSD4tv6i3N5C32rWKYhOmfs5ktbNU99PiDHx2LSxtIOLHSEUml4ZsOU5R
         H4DmvaRXEYHNn5QtWgihcITxjcl0ntIIf++4ClHpngvG2E8cTSexqKKlmklIMMmbWFBQ
         pNGw==
X-Forwarded-Encrypted: i=1; AHgh+RrW8lXQsmaSHiGAgm5hqQstSkfMqEMvA3AX6l+rb/2ORC+5QchURPEcv46gYYw8bbp2K6Qb341yXxTckzMdq18h@lists.infradead.org
X-Gm-Message-State: AOJu0Yxrvh5IfMrOIiVTt3MRk+F7AttfzFmpcIj0GfwZS1blLnZeYO//
	1IWm/g98Nripc4iIbebS31zYRvO/zZOiOXeMVGxSbTSE2lECmVh5FhVebOrcQm/RjyqbGrqI7pG
	wgaA31KMmrdFY0gNXtztBggLtHYWXrHyIPyM1mVGmuuAV+eoY5YLt81c34tLmHWYlI7vswZiLbH
	/5WA==
X-Gm-Gg: AR+sD112xmaAUIydpaJNwdxEWPy0rxjYMU8yAA2tnlUGU2Xy/BAXN7eFIpr39Mq2wh8
	wXSluF5Ht/ZqccwE5suGS7TW43Yw8JmUdA+KhSpz0XIa8lCEebxVPb3Fy2RBlUxi9xLUvLhpU93
	+Z4tDyLYEyn4JkLzd4fqJEsHTXa9l1rZHA1meN4GxPhR93gwCLgS6z97rOO6gbl9w2lXnIYLBqQ
	SxRwJrDclhX+uC1HVmbnXKNA/lcJ9mTFCalxE74m6uA4yZwY42GOsNfSFSu+Kf0vWvwTXLY71uY
	+bquKAvSCgEOBDsdmR8qdjXriHmU1/1XYXmtPBVv8NwMBehJccSzI5xGTga3EGzpCJSYv5HzvDJ
	DY6bWGZKsRsxo8M9zyFZNURNn4OMJ1xtEESQYbtlNX0mDZPI001TQ3JLRjYWondFdB8m392mM0n
	Q=
X-Received: by 2002:ac8:580f:0:b0:519:efea:cf41 with SMTP id d75a77b69052e-52d85431a8fmr70899641cf.28.1786720593203;
        Fri, 14 Aug 2026 08:16:33 -0700 (PDT)
X-Received: by 2002:ac8:580f:0:b0:519:efea:cf41 with SMTP id d75a77b69052e-52d85431a8fmr70897581cf.28.1786720592234;
        Fri, 14 Aug 2026 08:16:32 -0700 (PDT)
Received: from leviathan ([2a0d:3344:316:5100:f22f:74ff:fe21:6f68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2c1307sm9145087f8f.27.2026.08.14.08.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 08:16:31 -0700 (PDT)
Date: Fri, 14 Aug 2026 16:16:28 +0100
From: Leif Lindholm <leif.lindholm@oss.qualcomm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        loongarch@lists.linux.dev
Subject: Re: [PATCH 2/3] efi: Pass EFI boot memmap struct address to core
 kernel
Message-ID: <an8xTBiCy_PEuwZi@leviathan>
References: <20260813074506.643472-5-ardb@kernel.org>
 <20260813074506.643472-7-ardb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813074506.643472-7-ardb@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDExNiBTYWx0ZWRfX0BlkkUdeIZKD
 VVyRF/VPFNNS4McLKl+g23vp1h2nrn9z1bdXTXG+oEZxOqgt9yBwtzYtdmc36XRTYncsyPt/wxO
 64os7BJzFrZv59i158Sp0mh3rZ1saFQ=
X-Authority-Analysis: v=2.4 cv=Z/Hc2nRA c=1 sm=1 tr=0 ts=6a7f3152 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=7pfS4neli2E25kVr3iQA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Xsp8YCztAICeCJpWd4tzfSflKO-HQmJW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDExNiBTYWx0ZWRfXxlrBjuswseWk
 Il432kXrFUDyWTMei9MaRR8eFfFN7SavESOMVopME0ZHnG7lds/rYgOCQ1y3X7Mos9Uc3Zui9PK
 BSEBvdmtVX583fr0pC3SiYJ4fCo/IdJJv0jf9H1VJ49xlLqyp7UVL3YWRm1aHJ6iLB+f2xm31PL
 +ync7lkosFhvYhlP0JA+MfIvn86nxekzxdd3Izo4gNRfYNisAiSybCwFYFbj8UFb7Zj6ukDHgCV
 Uib1xJL8WwMlEKe3wSyrooG58inwGEGlEN2ZTEf7iu4qppn/5rQNE9KwWR4n6S0Clc+wqMvo7Vm
 MXiXw2fpQFfKy7zJ70sGNLLr1bKimNJKnUvbe3uXBhH3VuRWpUs08FfmVgAysJbFLe24trfYhDq
 /9h4vccWqyrxUfqX1J/zOS1gwFLrGDzXb47XQux+DqsWK7rhkkoGSbyjpT+X2i+OleQ/jRHTuYq
 jwmzwMI6SpErOHWq/Gw==
X-Proofpoint-GUID: Xsp8YCztAICeCJpWd4tzfSflKO-HQmJW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1011 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_081636_793022_536FCD83 
X-CRM114-Status: GOOD (  38.67  )
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

On Thu, Aug 13, 2026 at 09:45:09 +0200, Ard Biesheuvel wrote:
> The EFI stub already passes a struct efi_boot_memmap populated with the
> information of the EFI memory map as a configuration table, and so
> passing the physical address, size, descriptor size and descriptor
> version via 4 different DT properties is kind of redundant.
> 
> Instead, pass the physical address of this struct in memory so that the
> kernel can just retrieve the values directly.
> 
> Unfortunately, the scheme with four separate properties is boot ABI for
> Xen, and so this needs to remain supported.

To clarify, you mean boot ABI when running under Xen?

> But for the EFI stub itself,
> this is just an internal ABI that can be modified.

Hmm...

So this leaves only three properties that cannot be derived from the
System Table:
- The System Table address itself
- kaslr-seed
- bootargs

The latter two could also be given the config table treatment.

Is it time to update the boot ABI to say x0 will hold the physical
address of "device tree blob (dtb) or EFI System Table in system RAM"?
They can be distinguished by 0xd00dfeed / "IBI SYST".

The use of a generated DT when none was provided by firmware has led
to both confusion and shenanigans, and might be nice to get rid of?

Either way, it would be nice to get rid of all four of the
linux,uefi-mmap nodes if they're now completely redundant.

Minor bikeshedding below.

> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  Documentation/arch/arm/uefi.rst    | 10 +----
>  drivers/firmware/efi/fdtparams.c   | 39 ++++++++++++++++---
>  drivers/firmware/efi/libstub/fdt.c | 40 ++------------------
>  3 files changed, 37 insertions(+), 52 deletions(-)
> 
> diff --git a/Documentation/arch/arm/uefi.rst b/Documentation/arch/arm/uefi.rst
> index 2b7ad9bd7cd2..c19cf3720f27 100644
> --- a/Documentation/arch/arm/uefi.rst
> +++ b/Documentation/arch/arm/uefi.rst
> @@ -54,17 +54,9 @@ Name                        Type     Description
>  ==========================  ======   ===========================================
>  linux,uefi-system-table     64-bit   Physical address of the UEFI System Table.
>  
> -linux,uefi-mmap-start       64-bit   Physical address of the UEFI memory map,
> +linux,uefi-boot-memmap      64-bit   Physical address of a struct efi_boot_memmap
>                                       populated by the UEFI GetMemoryMap() call.
>  
> -linux,uefi-mmap-size        32-bit   Size in bytes of the UEFI memory map
> -                                     pointed to in previous entry.
> -
> -linux,uefi-mmap-desc-size   32-bit   Size in bytes of each entry in the UEFI
> -                                     memory map.
> -
> -linux,uefi-mmap-desc-ver    32-bit   Version of the mmap descriptor format.
> -
>  kaslr-seed                  64-bit   Entropy used to randomize the kernel image
>                                       base address location.
>  
> diff --git a/drivers/firmware/efi/fdtparams.c b/drivers/firmware/efi/fdtparams.c
> index b815d2a754ee..a54a76a6aaeb 100644
> --- a/drivers/firmware/efi/fdtparams.c
> +++ b/drivers/firmware/efi/fdtparams.c
> @@ -10,22 +10,30 @@
>  
>  #include <linux/unaligned.h>
>  
> +#include <asm/early_ioremap.h>
> +
>  enum {
>  	SYSTAB,
> +	MEMMAP,
> +#ifdef CONFIG_XEN
>  	MMBASE,
>  	MMSIZE,
>  	DCSIZE,
>  	DCVERS,
> +#endif
>  
>  	PARAMCOUNT
>  };
>  
>  static __initconst const char name[][22] = {
>  	[SYSTAB] = "System Table         ",
> +	[MEMMAP] = "Boot Memory Map      ",
> +#ifdef CONFIG_XEN
>  	[MMBASE] = "MemMap Address       ",
>  	[MMSIZE] = "MemMap Size          ",
>  	[DCSIZE] = "MemMap Desc. Size    ",
>  	[DCVERS] = "MemMap Desc. Version ",
> +#endif
>  };
>  
>  static __initconst const struct {
> @@ -49,10 +57,7 @@ static __initconst const struct {
>  		.path = "/chosen",
>  		.params = {	//  <-----------26----------->
>  			[SYSTAB] = "linux,uefi-system-table",
> -			[MMBASE] = "linux,uefi-mmap-start",
> -			[MMSIZE] = "linux,uefi-mmap-size",
> -			[DCSIZE] = "linux,uefi-mmap-desc-size",
> -			[DCVERS] = "linux,uefi-mmap-desc-ver",
> +			[MEMMAP] = "linux,uefi-boot-memmap",
>  		}
>  	}
>  };
> @@ -84,17 +89,20 @@ static int __init efi_get_fdt_prop(const void *fdt, int node, const char *pname,
>  u64 __init efi_get_fdt_params(struct efi_memory_map_data *mm)
>  {
>  	const void *fdt = initial_boot_params;
> -	unsigned long systab;
> +	unsigned long systab, memmap;
>  	int i, j, node;
>  	struct {
>  		void	*var;
>  		int	size;
>  	} target[] = {
>  		[SYSTAB] = { &systab,		sizeof(systab) },
> +		[MEMMAP] = { &memmap,		sizeof(memmap) },
> +#ifdef CONFIG_XEN
>  		[MMBASE] = { &mm->phys_map,	sizeof(mm->phys_map) },
>  		[MMSIZE] = { &mm->size,		sizeof(mm->size) },
>  		[DCSIZE] = { &mm->desc_size,	sizeof(mm->desc_size) },
>  		[DCVERS] = { &mm->desc_version,	sizeof(mm->desc_version) },
> +#endif
>  	};
>  
>  	BUILD_BUG_ON(ARRAY_SIZE(target) != ARRAY_SIZE(name));
> @@ -115,6 +123,9 @@ u64 __init efi_get_fdt_params(struct efi_memory_map_data *mm)
>  		for (j = 0; j < ARRAY_SIZE(target); j++) {
>  			const char *pname = dt_params[i].params[j];
>  
> +			if (pname[0] == '\0')
> +				continue;
> +
>  			if (!efi_get_fdt_prop(fdt, node, pname, name[j],
>  					      target[j].var, target[j].size))
>  				continue;
> @@ -123,8 +134,24 @@ u64 __init efi_get_fdt_params(struct efi_memory_map_data *mm)
>  			pr_err("Can't find property '%s' in DT!\n", pname);
>  			return 0;
>  		}
> -		if (dt_params[i].paravirt)
> +		if (IS_ENABLED(CONFIG_XEN) && dt_params[i].paravirt) {
>  			set_bit(EFI_PARAVIRT, &efi.flags);
> +		} else {

This condition branch doesn't in fact have anything to do with the fdt.
Should it still live in fdtparams.c?

/
    Leif

> +			struct efi_boot_memmap *bm;
> +
> +			bm = early_memremap_ro(memmap, sizeof(*bm));
> +			if (!bm) {
> +				pr_err("Cannot remap EFI boot memory map\n");
> +				return 0;
> +			}
> +
> +			mm->phys_map		= memmap + sizeof(*bm);
> +			mm->size		= bm->map_size;
> +			mm->desc_size		= bm->desc_size;
> +			mm->desc_version	= bm->desc_ver;
> +
> +			early_memunmap(bm, sizeof(*bm));
> +		}
>  		return systab;
>  	}
>  notfound:
> diff --git a/drivers/firmware/efi/libstub/fdt.c b/drivers/firmware/efi/libstub/fdt.c
> index 23b3543d3041..417b1344bdd8 100644
> --- a/drivers/firmware/efi/libstub/fdt.c
> +++ b/drivers/firmware/efi/libstub/fdt.c
> @@ -32,7 +32,6 @@ static efi_status_t update_fdt(void *orig_fdt, unsigned long orig_fdt_size,
>  {
>  	int node, num_rsv;
>  	int status;
> -	fdt32_t fdt_val32;
>  	fdt64_t fdt_val64;
>  
>  	/* Do some checks on provided FDT, if it exists: */
> @@ -102,21 +101,7 @@ static efi_status_t update_fdt(void *orig_fdt, unsigned long orig_fdt_size,
>  
>  	fdt_val64 = cpu_to_fdt64(U64_MAX); /* placeholder */
>  
> -	status = fdt_setprop_var(fdt, node, "linux,uefi-mmap-start", fdt_val64);
> -	if (status)
> -		goto fdt_set_fail;
> -
> -	fdt_val32 = cpu_to_fdt32(U32_MAX); /* placeholder */
> -
> -	status = fdt_setprop_var(fdt, node, "linux,uefi-mmap-size", fdt_val32);
> -	if (status)
> -		goto fdt_set_fail;
> -
> -	status = fdt_setprop_var(fdt, node, "linux,uefi-mmap-desc-size", fdt_val32);
> -	if (status)
> -		goto fdt_set_fail;
> -
> -	status = fdt_setprop_var(fdt, node, "linux,uefi-mmap-desc-ver", fdt_val32);
> +	status = fdt_setprop_var(fdt, node, "linux,uefi-boot-memmap", fdt_val64);
>  	if (status)
>  		goto fdt_set_fail;
>  
> @@ -148,33 +133,14 @@ static efi_status_t update_fdt_memmap(void *fdt, struct efi_boot_memmap *map)
>  {
>  	int node = fdt_path_offset(fdt, "/chosen");
>  	fdt64_t fdt_val64;
> -	fdt32_t fdt_val32;
>  	int err;
>  
>  	if (node < 0)
>  		return EFI_LOAD_ERROR;
>  
> -	fdt_val64 = cpu_to_fdt64((unsigned long)map->map);
> -
> -	err = fdt_setprop_inplace_var(fdt, node, "linux,uefi-mmap-start", fdt_val64);
> -	if (err)
> -		return EFI_LOAD_ERROR;
> -
> -	fdt_val32 = cpu_to_fdt32(map->map_size);
> -
> -	err = fdt_setprop_inplace_var(fdt, node, "linux,uefi-mmap-size", fdt_val32);
> -	if (err)
> -		return EFI_LOAD_ERROR;
> -
> -	fdt_val32 = cpu_to_fdt32(map->desc_size);
> -
> -	err = fdt_setprop_inplace_var(fdt, node, "linux,uefi-mmap-desc-size", fdt_val32);
> -	if (err)
> -		return EFI_LOAD_ERROR;
> -
> -	fdt_val32 = cpu_to_fdt32(map->desc_ver);
> +	fdt_val64 = cpu_to_fdt64((unsigned long)map);
>  
> -	err = fdt_setprop_inplace_var(fdt, node, "linux,uefi-mmap-desc-ver", fdt_val32);
> +	err = fdt_setprop_inplace_var(fdt, node, "linux,uefi-boot-memmap", fdt_val64);
>  	if (err)
>  		return EFI_LOAD_ERROR;
>  
> -- 
> 2.47.3
> 

