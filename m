Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D12C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 14:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUtDhbbtcKbSXxAFj/FEcntFD19GWOd2zooRB+NLsp8=; b=t31AQwvz2ONmJtUge604FstAsv
	hbyUmkEHDv9TRidXh/CvZGt91USELHU1Eh57avncuurkRC2/C8bCsHhQ6SxPCgNGHyIu2FXQ/osW5
	J4A+mSQk8/6MBjkLiy2QxA3rVAhXoUjCiPMQjvD8qgw59Dq/NisRxfjuRJgyBSUn7kTgpxssAT/+w
	t6POcZ44gWdXpWXJaLJCK1tQuxA8RX//jILf6mAl3wprlPWYM23Uq+Il9xhEOs5TFgditumoCyLfM
	nqH8ohz/6sWvKgP/LQSgl3Z+e/crCzgzBvfXdcXIssMK2n7vbaPs1uXUEa1hjRPK9yn3d+6l1HU3/
	mNnvt6vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIJ8-00000004cQx-1Grx;
	Thu, 02 Jul 2026 14:22:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIJ5-00000004cQa-3Hv7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 14:22:25 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3IBB670824
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Jul 2026 14:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yUtDhbbtcKbSXxAFj/FEcntF
	D19GWOd2zooRB+NLsp8=; b=nCmkI5TRWV9y7yoTLpV9v4lAWF9h/PhhGDIj8Czi
	KmAjRGHQQy67BJEnB7Pjw3DFqChwM4t69zAlfJRJdmVSY7fy9l7j/2LQeg/S1ZnK
	yffZFQFIwGtcCSu6VCo2b0Cv4HxJM4BgqRwtr3MH+8B/F6ky04paC6YLQdigTbNd
	x/k60L2keuEVTMIE/H3afnLnNHjGMiwopolvgsMcCC70V0JnqLcxYOTHuwMsMpmr
	SgSKUF+KXgNgKW9YzjN1u30zNaFTQV9cwo/GpsfEeQe6V4mJ6KZnntQgGM5pRQaq
	7NInspXXu/4X1z4jD1EzrJ/0ihIQwLoIJEiLC7jkEecXZA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7na617-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 14:22:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c79e5de32cso22778205ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 07:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783002142; x=1783606942; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yUtDhbbtcKbSXxAFj/FEcntFD19GWOd2zooRB+NLsp8=;
        b=TiwlEMHCRwXu7pf10hNbzm15IGP37Sm/rExNBB82uDhw1mpx+2/7pIMd3LTZdwUxQh
         QV89ykwtuneVTB2BLrGgx0w9fg6+FejcBK48UGx9cmPqfGgL2lHG6ZDuDrDrDA+OYBMi
         nyNS91B6bEQULce2th/gTK4fBa54QccNCRKlWXteIr5QVYgLt8pINp/vGuFSBhtWOMUC
         4JMujHTwqRgpHwG7Niw5HzTvlF37J5opJnwIGwb4tl2EtRTfpIuGHSBUhZeAhadzhIGZ
         bmjCzMfzQ+STH91rzlbECl4XzoMwl3djUYPZfJCTEb4Nq6vb4Pnnd3kYcqeKO0k1uvxW
         dUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783002142; x=1783606942;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yUtDhbbtcKbSXxAFj/FEcntFD19GWOd2zooRB+NLsp8=;
        b=W4m3TK9gyaUrt9rrEBzx/3qY8L2YEkBKv+dubPsI7rf1yeTl6dBKa2kFLnk+9XUkbn
         5bhhCTr/KpDw0gKqanDyJ0uH76xKMg1ld3zTXML7Q5ZJ785p9Q/pGdYAG1W44NeVejyz
         H0WzsxeTGyhagDgoWNzXS7wYguf7iVZH4+b84Fjz/Q9icUXQlioHbiSoyZLbiXXvVbrg
         fMQsLf7tjzwS4IKMeSMVXvNO5vknaqXjMicOhwV1M1mnmdsnDoRa0uq3OtbsQqAdZXda
         5SZpD7FPdU5ZKkdYjvnp7op1umNO6khzwgZ+r2VHc92zfXn198YgCtlph25QClqYHO+O
         8SSg==
X-Forwarded-Encrypted: i=1; AHgh+RoIcufvJqlHyovBWNXdPsBBtLc/aOIEK2ExmxK2/kQCFNh5DB1JG8GZKXfhhMsgaUhPhRmLED0K1yxkobjTBEZx@lists.infradead.org
X-Gm-Message-State: AOJu0YwgbbqqpAMHPZYck8SLwX4m0EhLc/mkEy1IZqPsnaWVwt7i8U2h
	oCuXRhKL5nnF4hWUynxYaIk3/13CJaql79lSogtLhcXIHJ4ZqYS3CGlyNuPNvmFTwcOKvAQgSJu
	tyi2OcQmU9k+nThKVHISaVGwYjiyc7msE9biho2iIOYETVW4Ybo1oJF70mKX7qm72Zbc7GR3Om9
	/8UA==
X-Gm-Gg: AfdE7ckAJEifN1BeD5YTaXNzBSBILr//0hpBw19t9vwPaXB6qpSYaYfH79G36JCfyo6
	szAYtdZTrOLsBeWXzindbyC5kXhzpjcpHUF+vawWe/Y2qJLBgKED8Kfld2MDX8g3i0ZO8+DAEe6
	46KcKq9F4oaNPZbEPFwecV5kcCoccsgjJUIrQ2PqkfULenxe/hBc884kBkio++OL0wLxKtx4g2E
	/Cp47PCX896saPhGMzbpHx6638xrlspOa+1om4Kj4ksimpQaUBaZVAXw8YxHhXLpdey0kztUWBu
	1Qm2uGF6oZfKp4R4LJAruNIHiEoDhPu6/ZopChAAlLR74tFrOSrxog7bJhc9o4n87p4UrdAriCF
	Em8kHTzN09A+xyGGTbpiwfG3/tpO3X1S3sgbsgi14K4Y8uFqE3b6cWHS97NmL
X-Received: by 2002:a17:903:2b03:b0:2ca:f96:865f with SMTP id d9443c01a7336-2ca9112c25cmr54351965ad.7.1783002141474;
        Thu, 02 Jul 2026 07:22:21 -0700 (PDT)
X-Received: by 2002:a17:903:2b03:b0:2ca:f96:865f with SMTP id d9443c01a7336-2ca9112c25cmr54351375ad.7.1783002140789;
        Thu, 02 Jul 2026 07:22:20 -0700 (PDT)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b446a766asm1061863c88.7.2026.07.02.07.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:22:19 -0700 (PDT)
Date: Thu, 2 Jul 2026 07:22:17 -0700
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: Ruidong Tian <tianruidong@linux.alibaba.com>
Cc: catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org,
        tony.luck@intel.com, guohanjun@huawei.com, mchehab@kernel.org,
        xueshuai@linux.alibaba.com, tongtiangen@huawei.com,
        james.morse@arm.com, robin.murphy@arm.com, andreyknvl@gmail.com,
        dvyukov@google.com, vincenzo.frascino@arm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, ryabinin.a.a@gmail.com, glider@google.com,
        christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
        naveen.n.rao@linux.ibm.com, tglx@linutronix.de, mingo@redhat.com,
        linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        kasan-dev@googlegroups.com, Ashok Raj <ashok.raj@oss.qualcomm.com>
Subject: Re: [PATCH v15 6/9] arm64: support copy_mc_[user]_highpage()
Message-ID: <akZ0Gax5zZ23PIv2@hu-ashoraj-lv.qualcomm.com>
References: <20260618092124.3901230-1-tianruidong@linux.alibaba.com>
 <20260618092124.3901230-7-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618092124.3901230-7-tianruidong@linux.alibaba.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE1MCBTYWx0ZWRfX+Th7QQFyvHWZ
 qEX4SUIWqudpe94S81QzavUfZHuZpjCK34GdUCnnswgiSFc5GLZXQYmBGmQT/6h/JHs/tVyDHJQ
 GrB4czNgLO3qofZD40gmXZGOWpey30my9xVuhVlVn7LPqNnFKKVe1yuR2x3/KHOXxDP6RvBks1k
 ssbbHFHTcMsMZlU75QhW3pmb5+MtqgP7laFYsS605G+oRnp+hRTuH2HZnNddC391kcbI5tLw/5h
 /F5rWvrdYYh7iU99torEAARihvdjWOANiy7kqxc2MG8p9tbH3tlvn6dcsFJe2rcRQPczDLBUzmT
 1yoGJSpmE+dKHilDftqUtEWJF+cBCe7WxPQriNGs1YK7VOhbxSxlpVKetcO7vatiKgq6X1bWRKC
 f/S8vA3tP9Op2J9K99OXmFrrnci2il5op3jP0fjbpkIgN83esJumyu3J5cYiJTHxilUuhHmbSKM
 j5XiJbQR3pki3+cSLAw==
X-Proofpoint-ORIG-GUID: xxFMOgxLXbhg4TLKD2Am62sjMZqRJVuw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE1MCBTYWx0ZWRfXy63jNp+cW0+k
 FagreMDoo7xI/XG222fbz5ihso29clnCjFKWM67Xar9PfpvFvE25CooQI/Wld+vhJxZ90rso1M/
 leopJIYWAUmb4dKWhOU7QpCcPP40eOI=
X-Proofpoint-GUID: xxFMOgxLXbhg4TLKD2Am62sjMZqRJVuw
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a46741e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=i0EeH86SAAAA:8 a=mK_AjrNZ-qhgYdoIX5wA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_072223_837637_D740AD9E 
X-CRM114-Status: GOOD (  33.89  )
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

On Thu, Jun 18, 2026 at 05:21:20PM +0800, Ruidong Tian wrote:
> From: Tong Tiangen <tongtiangen@huawei.com>
> 
> Currently, many scenarios that can tolerate memory errors when copying page
> have been supported in the kernel[1~9], all of which are implemented by
> copy_mc_[user]_highpage(). arm64 should also support this mechanism.
> 
> Due to mte, arm64 needs to have its own copy_mc_[user]_highpage()
> architecture implementation, macros __HAVE_ARCH_COPY_MC_HIGHPAGE and
> __HAVE_ARCH_COPY_MC_USER_HIGHPAGE have been added to control it.
> 
> Add new helper copy_mc_page() which provide a page copy implementation with
> hardware memory error safe. The code logic of copy_mc_page() is the same as
> copy_page(), the main difference is that the ldp insn of copy_mc_page()
> contains the fixup type EX_TYPE_KACCESS_SEA, therefore, the
> main logic is extracted to copy_page_template.S. In addition, the fixup of
> MOPS insn is not considered at present.
> 

Hi Tong,

[snip]

> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index fe60738e5943..831b20d45893 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -21,6 +21,7 @@ config ARM64
>  	select ARCH_HAS_CACHE_LINE_SIZE
>  	select ARCH_HAS_CC_PLATFORM
>  	select ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
> +	select ARCH_HAS_COPY_MC if ACPI_APEI_GHES

ACPI_APEI_GHES seems like the wrong gate. The recovery this series enables hinges
on the in-kernel SEA claim path, and that is gated on CONFIG_ACPI_APEI_SEA,
not ACPI_APEI_GHES. From your own patch 2, include/acpi/ghes.h:

	#ifdef CONFIG_ACPI_APEI_SEA
	int ghes_notify_sea(enum ghes_exec_ctx context);
	#else
	static inline int ghes_notify_sea(enum ghes_exec_ctx context)
	{ return -ENOENT; }
	#endif

ACPI_APEI_SEA is "bool, depends on ARM64 && ACPI_APEI_GHES, default y", so
the config ACPI_APEI_GHES=y, ACPI_APEI_SEA=n is reachable. In that build we
still select ARCH_HAS_COPY_MC, but ghes_notify_sea() is the -ENOENT stub,
apei_claim_sea() never claims the abort in do_sea(), and every KERNEL_SEA
fixup added below is unreachable dead code. 

Maybe:

select ARCH_HAS_COPY_MC if ACPI_APEI_SEA

>  	select ARCH_HAS_CURRENT_STACK_POINTER
>  	select ARCH_HAS_DEBUG_VIRTUAL
>  	select ARCH_HAS_DEBUG_VM_PGTABLE
> diff --git a/arch/arm64/include/asm/asm-extable.h b/arch/arm64/include/asm/asm-extable.h
> index 8450ec5a3af6..9305ea77482a 100644
> --- a/arch/arm64/include/asm/asm-extable.h
> +++ b/arch/arm64/include/asm/asm-extable.h
> @@ -10,6 +10,10 @@
>  #define EX_TYPE_ACCESS_ERR_ZERO		2
>  #define EX_TYPE_UACCESS_CPY		3
>  #define EX_TYPE_LOAD_UNALIGNED_ZEROPAD	4
> +/*
> + * Kernel access: used in kernel context for both regular load/store
> + * instructions and MOPS (memory copy/set) instructions.
> + */
>  #define EX_TYPE_KACCESS_SEA		5
>  
>  /* Data fields for EX_TYPE_ACCESS_ERR_ZERO */
> diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
> index 7f7b97e09996..a0b1757f4847 100644
> --- a/arch/arm64/include/asm/mte.h
> +++ b/arch/arm64/include/asm/mte.h
> @@ -98,6 +98,11 @@ static inline bool try_page_mte_tagging(struct page *page)
>  void mte_zero_clear_page_tags(void *addr);
>  void mte_sync_tags(pte_t pte, unsigned int nr_pages);
>  void mte_copy_page_tags(void *kto, const void *kfrom);
> +
> +#ifdef CONFIG_ARCH_HAS_COPY_MC
> +int mte_copy_mc_page_tags(void *kto, const void *kfrom);
> +#endif
> +
>  void mte_thread_init_user(void);
>  void mte_thread_switch(struct task_struct *next);
>  void mte_cpu_setup(void);
> @@ -134,6 +139,10 @@ static inline void mte_sync_tags(pte_t pte, unsigned int nr_pages)
>  static inline void mte_copy_page_tags(void *kto, const void *kfrom)
>  {
>  }
> +static inline int mte_copy_mc_page_tags(void *kto, const void *kfrom)
> +{
> +	return 0;
> +}
>  static inline void mte_thread_init_user(void)
>  {
>  }
> diff --git a/arch/arm64/include/asm/page.h b/arch/arm64/include/asm/page.h
> index e25d0d18f6d7..5c4c9f974b68 100644
> --- a/arch/arm64/include/asm/page.h
> +++ b/arch/arm64/include/asm/page.h
> @@ -29,6 +29,18 @@ void copy_user_highpage(struct page *to, struct page *from,
>  void copy_highpage(struct page *to, struct page *from);
>  #define __HAVE_ARCH_COPY_HIGHPAGE
>  
> +#ifdef CONFIG_ARCH_HAS_COPY_MC
> +int copy_mc_page(void *to, const void *from);
> +#define __HAVE_ARCH_COPY_MC_PAGE
> +
> +int copy_mc_highpage(struct page *to, struct page *from);
> +#define __HAVE_ARCH_COPY_MC_HIGHPAGE
> +
> +int copy_mc_user_highpage(struct page *to, struct page *from,
> +		unsigned long vaddr, struct vm_area_struct *vma);
> +#define __HAVE_ARCH_COPY_MC_USER_HIGHPAGE
> +#endif
> +
>  struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
>  						unsigned long vaddr);
>  #define vma_alloc_zeroed_movable_folio vma_alloc_zeroed_movable_folio
> diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
> index 448c917494f3..1f4c3f743a20 100644
> --- a/arch/arm64/lib/Makefile
> +++ b/arch/arm64/lib/Makefile
> @@ -7,6 +7,8 @@ lib-y		:= clear_user.o delay.o copy_from_user.o		\
>  
>  lib-$(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) += uaccess_flushcache.o
>  
> +lib-$(CONFIG_ARCH_HAS_COPY_MC) += copy_mc_page.o
> +
>  obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
>  
>  obj-$(CONFIG_ARM64_MTE) += mte.o
> diff --git a/arch/arm64/lib/copy_mc_page.S b/arch/arm64/lib/copy_mc_page.S
> new file mode 100644
> index 000000000000..f936e0c98611
> --- /dev/null
> +++ b/arch/arm64/lib/copy_mc_page.S
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <linux/linkage.h>
> +#include <linux/const.h>
> +#include <asm/assembler.h>
> +#include <asm/page.h>
> +#include <asm/cpufeature.h>
> +#include <asm/alternative.h>
> +#include <asm/asm-extable.h>
> +#include <asm/asm-uaccess.h>
> +
> +/*
> + * Copy a page from src to dest (both are page aligned) with memory error safe
> + *
> + * Parameters:
> + *	x0 - dest
> + *	x1 - src
> + * Returns:
> + * 	x0 - Return 0 if copy success, or -EFAULT if anything goes wrong
> + *	     while copying.
> + */
> +	.macro ldp1 reg1, reg2, ptr, val
> +	KERNEL_SEA(9998f, ldp \reg1, \reg2, [\ptr, \val])
> +	.endm
> +
> +	.macro cpy1 dst, src, count
> +	.arch_extension mops
> +	KERNEL_SEA(9998f, cpypwn [\dst]!, [\src]!, \count!)
> +	KERNEL_SEA(9998f, cpymwn [\dst]!, [\src]!, \count!)
> +	KERNEL_SEA(9998f, cpyewn [\dst]!, [\src]!, \count!)
> +	.endm

You wrap the MOPS cpy* here (and in copy_page_template.S) in KERNEL_SEA, but
the commit message still says "the fixup of MOPS insn is not considered at
present." 

please reconcile the changelog with the code, and mention the FEAT_MOPS 
fixup support explicitly.

> +
> +SYM_FUNC_START(__pi_copy_mc_page)
> +#include "copy_page_template.S"
> +
> +	mov x0, #0
> +	ret
> +
> +9998:	mov x0, #-EFAULT
> +	ret
> +
> +SYM_FUNC_END(__pi_copy_mc_page)
> +SYM_FUNC_ALIAS(copy_mc_page, __pi_copy_mc_page)
> +EXPORT_SYMBOL(copy_mc_page)
> diff --git a/arch/arm64/lib/copy_page.S b/arch/arm64/lib/copy_page.S
> index e6374e7e5511..e520777b5150 100644
> --- a/arch/arm64/lib/copy_page.S
> +++ b/arch/arm64/lib/copy_page.S
> @@ -17,65 +17,20 @@
>   *	x0 - dest
>   *	x1 - src
>   */
> -SYM_FUNC_START(__pi_copy_page)
> -#ifdef CONFIG_AS_HAS_MOPS
> -	.arch_extension mops
> -alternative_if_not ARM64_HAS_MOPS
> -	b	.Lno_mops
> -alternative_else_nop_endif
> -
> -	mov	x2, #PAGE_SIZE
> -	cpypwn	[x0]!, [x1]!, x2!
> -	cpymwn	[x0]!, [x1]!, x2!
> -	cpyewn	[x0]!, [x1]!, x2!
> -	ret
> -.Lno_mops:
> -#endif
> -	ldp	x2, x3, [x1]
> -	ldp	x4, x5, [x1, #16]
> -	ldp	x6, x7, [x1, #32]
> -	ldp	x8, x9, [x1, #48]
> -	ldp	x10, x11, [x1, #64]
> -	ldp	x12, x13, [x1, #80]
> -	ldp	x14, x15, [x1, #96]
> -	ldp	x16, x17, [x1, #112]
> -
> -	add	x0, x0, #256
> -	add	x1, x1, #128
> -1:
> -	tst	x0, #(PAGE_SIZE - 1)
>  
> -	stnp	x2, x3, [x0, #-256]
> -	ldp	x2, x3, [x1]
> -	stnp	x4, x5, [x0, #16 - 256]
> -	ldp	x4, x5, [x1, #16]
> -	stnp	x6, x7, [x0, #32 - 256]
> -	ldp	x6, x7, [x1, #32]
> -	stnp	x8, x9, [x0, #48 - 256]
> -	ldp	x8, x9, [x1, #48]
> -	stnp	x10, x11, [x0, #64 - 256]
> -	ldp	x10, x11, [x1, #64]
> -	stnp	x12, x13, [x0, #80 - 256]
> -	ldp	x12, x13, [x1, #80]
> -	stnp	x14, x15, [x0, #96 - 256]
> -	ldp	x14, x15, [x1, #96]
> -	stnp	x16, x17, [x0, #112 - 256]
> -	ldp	x16, x17, [x1, #112]
> +	.macro ldp1 reg1, reg2, ptr, val
> +	ldp \reg1, \reg2, [\ptr, \val]
> +	.endm
>  
> -	add	x0, x0, #128
> -	add	x1, x1, #128
> -
> -	b.ne	1b
> -
> -	stnp	x2, x3, [x0, #-256]
> -	stnp	x4, x5, [x0, #16 - 256]
> -	stnp	x6, x7, [x0, #32 - 256]
> -	stnp	x8, x9, [x0, #48 - 256]
> -	stnp	x10, x11, [x0, #64 - 256]
> -	stnp	x12, x13, [x0, #80 - 256]
> -	stnp	x14, x15, [x0, #96 - 256]
> -	stnp	x16, x17, [x0, #112 - 256]
> +	.macro cpy1 dst, src, count
> +	.arch_extension mops
> +	cpypwn [\dst]!, [\src]!, \count!
> +	cpymwn [\dst]!, [\src]!, \count!
> +	cpyewn [\dst]!, [\src]!, \count!
> +	.endm
>  
> +SYM_FUNC_START(__pi_copy_page)
> +#include "copy_page_template.S"
>  	ret
>  SYM_FUNC_END(__pi_copy_page)
> new file mode 100644
> index 000000000000..e5afbeaaad25
> --- /dev/null
> +++ b/arch/arm64/lib/copy_page_template.S
> @@ -0,0 +1,70 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2012 ARM Ltd.
> + */
> +
> +/*
> + * Copy a page from src to dest (both are page aligned)
> + *
> + * Parameters:
> + *	x0 - dest
> + *	x1 - src
> + */
> +dstin	.req	x0
> +src	.req	x1
> +
> +#ifdef CONFIG_AS_HAS_MOPS
> +alternative_if_not ARM64_HAS_MOPS
> +	b	.Lno_mops
> +alternative_else_nop_endif
> +	mov	x2, #PAGE_SIZE
> +	cpy1	dst, src, x2

Should dst above be dstin instead?

Also the cpy1 instruction sits outside the alternatives block

Have you compiled with a toolchain that doesn't have MOPS? I suspect it
might break builds.

> +	b	.Lexitfunc
> +.Lno_mops:
> +#endif
> +
> +	ldp1	x2, x3, x1, #0
> +	ldp1	x4, x5, x1, #16
> +	ldp1	x6, x7, x1, #32
> +	ldp1	x8, x9, x1, #48
> +	ldp1	x10, x11, x1, #64
> +	ldp1	x12, x13, x1, #80
> +	ldp1	x14, x15, x1, #96
> +	ldp1	x16, x17, x1, #112
> +
> +	add	x0, x0, #256
> +	add	x1, x1, #128
> +1:
> +	tst	x0, #(PAGE_SIZE - 1)
> +
> +	stnp	x2, x3, [x0, #-256]
> +	ldp1	x2, x3, x1, #0
> +	stnp	x4, x5, [x0, #16 - 256]
> +	ldp1	x4, x5, x1, #16
> +	stnp	x6, x7, [x0, #32 - 256]
> +	ldp1	x6, x7, x1, #32
> +	stnp	x8, x9, [x0, #48 - 256]
> +	ldp1	x8, x9, x1, #48
> +	stnp	x10, x11, [x0, #64 - 256]
> +	ldp1	x10, x11, x1, #64
> +	stnp	x12, x13, [x0, #80 - 256]
> +	ldp1	x12, x13, x1, #80
> +	stnp	x14, x15, [x0, #96 - 256]
> +	ldp1	x14, x15, x1, #96
> +	stnp	x16, x17, [x0, #112 - 256]
> +	ldp1	x16, x17, x1, #112
> +
> +	add	x0, x0, #128
> +	add	x1, x1, #128
> +
> +	b.ne	1b
> +
> +	stnp	x2, x3, [x0, #-256]
> +	stnp	x4, x5, [x0, #16 - 256]
> +	stnp	x6, x7, [x0, #32 - 256]
> +	stnp	x8, x9, [x0, #48 - 256]
> +	stnp	x10, x11, [x0, #64 - 256]
> +	stnp	x12, x13, [x0, #80 - 256]
> +	stnp	x14, x15, [x0, #96 - 256]
> +	stnp	x16, x17, [x0, #112 - 256]
> +.Lexitfunc:
> diff --git a/arch/arm64/lib/mte.S b/arch/arm64/lib/mte.S
> index 5018ac03b6bf..1afe3ef1502c 100644
> --- a/arch/arm64/lib/mte.S
> +++ b/arch/arm64/lib/mte.S
> @@ -80,6 +80,35 @@ SYM_FUNC_START(mte_copy_page_tags)
>  	ret
>  SYM_FUNC_END(mte_copy_page_tags)
>  
> +#ifdef CONFIG_ARCH_HAS_COPY_MC
> +/*
> + * Copy the tags from the source page to the destination one with memory error safe
> + *   x0 - address of the destination page
> + *   x1 - address of the source page
> + * Returns:
> + *   x0 - Return 0 if copy success, or
> + *        -EFAULT if anything goes wrong while copying.
> + */
> +SYM_FUNC_START(mte_copy_mc_page_tags)
> +	mov	x2, x0
> +	mov	x3, x1
> +	multitag_transfer_size x5, x6
> +1:
> +KERNEL_SEA(2f, ldgm	x4, [x3])
> +	stgm	x4, [x2]
> +	add	x2, x2, x5
> +	add	x3, x3, x5
> +	tst	x2, #(PAGE_SIZE - 1)
> +	b.ne	1b
> +
> +	mov x0, #0
> +	ret
> +
> +2:	mov x0, #-EFAULT
> +	ret
> +SYM_FUNC_END(mte_copy_mc_page_tags)
> +#endif
> +
>  /*
>   * Read tags from a user buffer (one tag per byte) and set the corresponding
>   * tags at the given kernel address. Used by PTRACE_POKEMTETAGS.
> diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
> index cd5912ba617b..c22918ed0f3c 100644
> --- a/arch/arm64/mm/copypage.c
> +++ b/arch/arm64/mm/copypage.c
> @@ -72,3 +72,83 @@ void copy_user_highpage(struct page *to, struct page *from,
>  	flush_dcache_page(to);
>  }
>  EXPORT_SYMBOL_GPL(copy_user_highpage);
> +
> +#ifdef CONFIG_ARCH_HAS_COPY_MC
> +/*
> + * Return -EFAULT if anything goes wrong while copying page or mte.
> + */
> +int copy_mc_highpage(struct page *to, struct page *from)
> +{
> +	void *kto = page_address(to);
> +	void *kfrom = page_address(from);
> +	struct folio *src = page_folio(from);
> +	struct folio *dst = page_folio(to);
> +	unsigned int i, nr_pages;
> +	int ret;
> +
> +	ret = copy_mc_page(kto, kfrom);
> +	if (ret)
> +		return -EFAULT;
> +
> +	if (kasan_hw_tags_enabled())
> +		page_kasan_tag_reset(to);
> +
> +	if (!system_supports_mte())
> +		return 0;
> +
> +	if (folio_test_hugetlb(src)) {
> +		if (!folio_test_hugetlb_mte_tagged(src) ||
> +		    from != folio_page(src, 0))
> +			return 0;
> +
> +		WARN_ON_ONCE(!folio_try_hugetlb_mte_tagging(dst));
> +
> +		/*
> +		 * Populate tags for all subpages.
> +		 *
> +		 * Don't assume the first page is head page since
> +		 * huge page copy may start from any subpage.
> +		 */
> +		nr_pages = folio_nr_pages(src);
> +		for (i = 0; i < nr_pages; i++) {
> +			kfrom = page_address(folio_page(src, i));
> +			kto = page_address(folio_page(dst, i));
> +			ret = mte_copy_mc_page_tags(kto, kfrom);
> +			if (ret)
> +				return -EFAULT;
> +		}
> +		folio_set_hugetlb_mte_tagged(dst);
> +	} else if (page_mte_tagged(from)) {
> +		/* It's a new page, shouldn't have been tagged yet */
> +		WARN_ON_ONCE(!try_page_mte_tagging(to));
> +
> +		ret = mte_copy_mc_page_tags(kto, kfrom);
> +		if (ret)
> +			return -EFAULT;
> +		set_page_mte_tagged(to);
> +	}

I'm not certain, but this is a verbatim copy of copy_highpage()'s MTE
body? The only delta's are copy_mc_page()/mte_opy_mc_page_tags() return
an error instead of void. Leaves 2 copies.. is it possible to refactor
them?

Also on the -EFAULT paths, is the MTE tag state left half-updated?
like set_page_mte_tagged()/folio_set_hugetlb_mte() is never reached.

I'm not an MTE expert.. just checking, love to be wrong.

> +	/*
> +	 * memory_failure_queue() is not called here because on arm64
> +	 * the firmware (GHES) has already reported the hardware memory
> +	 * error and queued the page for memory_failure() handling via
> +	 * ghes_do_memory_failure().
> +	 */
> +	return 0;
> +}

So copy_mc_page()'s -EFAULT can only be produced by the KERNEL_SEA fixup
which is only reachable via fixup_exception_me() on the do_sea() path
after apei_claim_sea() has already queued memory_failure(). 

Is the ordering gauranteed? otherwise there might be a case where its
not offlined.

Cheers,
Ashok

