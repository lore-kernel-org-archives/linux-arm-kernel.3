Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC22C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 14:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXnswjIaiRYG8U7BeW3Gzzri+uQJOKwM0h35YoRqO54=; b=SFayh6bJayZrArsx6ivcKLK4Pe
	qGAJ7ffDbNbb7soDk9nvKJW9KD94K8mslqifnIne3793WU+owIOkHTMyzVJolAh5ba3YCOiG3wW5B
	Xt666Dn7o8x+INGs36tmKCqAJQ2aCujUCp5jZbBiGP/jt2g2RC+0NlxRc66fkcHjdqZMHx1+jmSZv
	iE2OiLPxNeJMeX91iPW5DgYdvtWoJLCU9N9a/ocxoZCpXOV/Aik0U1FPOMGuQk2e4V7swOkIto/5H
	vJHMWg21wYqNLz7pOCoFTBvUPED5UR6/qhVdvAYEGZZCiUbSIC4jfHbNIaxCk96bTDmChstwQUHq2
	TGnddHZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIY2-00000004dvZ-2rFE;
	Thu, 02 Jul 2026 14:37:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfIY0-00000004duz-1r8p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 14:37:49 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3HXK645329
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Jul 2026 14:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lXnswjIaiRYG8U7BeW3Gzzri
	+uQJOKwM0h35YoRqO54=; b=BFbnC2njgqijwErQAd6LOWtD7DJdESvTqDco7q7L
	NVtO0qt4eADNZ88+GI4ahZ7xjh33sr0Yy++xiIxnOAEosGQ6XazwuZYtKt1pRaMe
	Ha+V9mEDi5g18rnwovrPTZaE/CixaA60QulvSqvUqThhlfU0n37PvQ/D9kONd7qo
	WXXvryy1jDdSZ5di0cpe51/Q2bM2e0GMkfPQZpTwfZitgK0CciKJB9Wc71W9txuR
	sFiTX83w11RWWvNBa4Qll9h434UwphbRAH58Zq/IIS9y2Sq0kx3aziSA3abSM8so
	RN6e5BjYfN4Kt29iGXFa+OazycIHO/iyBKWktYjztd5N+g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5gmb2cjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 14:37:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88e0f04e51so1586812a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 07:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783003066; x=1783607866; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lXnswjIaiRYG8U7BeW3Gzzri+uQJOKwM0h35YoRqO54=;
        b=hUxv4koCvRzXGi/znMGlnC7ZZVfyUdJ5EkgoBRJZlT8G6+EJDWTW0hbDKs8kWuviby
         lExPW9D5YwyFVzK5PwDK99nXPlWEgI/PtBpI7zxnfJXNqtwJ5invX2WOSfzTVcspU/yp
         Z2UKHBymyoP0Iyp6FB5iSlEDt1JWFBlP+/g59dtk1k81LNfHzN6GiQGK1Mpjs2zXi19I
         9lp7Gy88dYl8Hdbyq/emq8yu8DQ/cQUiY6fVLY7OGU0juIz5ksZnUxRfM/p1shuQzsQs
         vt1wOyHiuwUbn1zDxnOT9E8rCmxIi4VXFdQ9n/qblZeMnFFXFLDxLdsGdMvnfyZSA1Jy
         zj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783003066; x=1783607866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXnswjIaiRYG8U7BeW3Gzzri+uQJOKwM0h35YoRqO54=;
        b=bElccTGD759XQW8UBSIpvbp87pOo/bVfaYX9qIQls1cJZSBZNXFcA0ZLPqjv7eSr24
         0spTQVDG8XxJdqiY3/mFFv9jdFZpoQYsMUau+C5yBHyA3WaTLMQQqNcVi4iwinVBdLNY
         S7U2QC1vmmw6PgzNerAtScrBP+LjQ/myiQuWPGMn/DcEZWuBcitF7FrHvmtcqxGCFgfQ
         I7CDzaMnKZ012rlv/Dh3M2C5/BRhRzu8TFD5A6XaBmEt+iYsLclyo8sn5LF4Zo5l2qO9
         EcM7PoOSk8RoK6g9VV6TgYGfsOnAvLZLx674zqpDMmlnvoULzNl5XA6EiJT524bttaoj
         0H6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+9nR4X2YiZsZHY09PuK2cbY4yQI0Jww0Ke0YVhOKzl2hzsO6ksWYE4/75toD5NuGnt5GaWu5AIIZWW6yww65jQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzhWdNvIh1V82IwDabhDs8B/RoawZzmHZULBumcbN7BbrLgOMk4
	2D1mJbgincTsGqI8RSZFAKgu3s/bQvsBXMrPoKuM0/c/EHhl0MDUBoVESDj2yBxUGHMw7u5xUUH
	4tGAprOGMQSnLY7bA7RfZQsztYWRyrGOAaBFMDC2iLBavFuwUVUOUmVowTpqQ1LauT71L4XHbfX
	w29w==
X-Gm-Gg: AfdE7cngqpksyEG4dFG7RJyGbfhnu8f7WovjsGViZB5IUql8aXlwkGtkySm0FSAjMh7
	X856MCnWwkkL178+hgfG3kyFD2xy2s0q/LnXB5bqVDleBoStB/kKORCbNnkt/P9irQ4JzZqph9v
	dtu3phoAmlwrCKbMOPL7TpaBPLQ985O5Mgw8+0IVcuQOKn3KA5mhtoz8wlBoG4FRxz0+NCoKIaz
	H1YUeC+a9r0uIstL3mZAOMmzx2XPIkE2+w0DSV+erV2qm0N0wE4C8oRxNt8/G0W4DAMwtkB5nvA
	CHYBFDhX4RddNfLMuS+zb/Spj3XEcMP1MxCsq2hIuPV5rWojcQflgTCtRdQDpulb4OlpmgqFRal
	f3jK/95mWRwK87ym++o19EExP6p3CovkXyyWbTqvFmkTfZl5+SWJ+9Dvh/Ikh
X-Received: by 2002:a05:6a21:7d06:b0:3bf:3306:acdb with SMTP id adf61e73a8af0-3bff40be1b7mr6903931637.13.1783003066345;
        Thu, 02 Jul 2026 07:37:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:7d06:b0:3bf:3306:acdb with SMTP id adf61e73a8af0-3bff40be1b7mr6903890637.13.1783003065851;
        Thu, 02 Jul 2026 07:37:45 -0700 (PDT)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b446a766asm1312275c88.7.2026.07.02.07.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:37:45 -0700 (PDT)
Date: Thu, 2 Jul 2026 07:37:43 -0700
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
        kasan-dev@googlegroups.com,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ashok Raj <ashok.raj@oss.qualcomm.com>
Subject: Re: [PATCH v15 5/9] mm/hwpoison: return -EFAULT when copy fail in
 copy_mc_[user]_highpage()
Message-ID: <akZ3t68so_q68OHx@hu-ashoraj-lv.qualcomm.com>
References: <20260618092124.3901230-1-tianruidong@linux.alibaba.com>
 <20260618092124.3901230-6-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618092124.3901230-6-tianruidong@linux.alibaba.com>
X-Proofpoint-GUID: NsJZQWWPHZVmf85JZhPHTVf_sZE-fDKf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE1MiBTYWx0ZWRfXxTSbybyztFEO
 AgsM0v/2JshFQJdH12IwlpMpUO1dNRy7p7iN44YZs5H0Fw4dNlbpwWetzUnHsDi8Z6fAv7mjDFf
 cJQ3KNqL0rlxk+z2ndxPysUiSECcOWk=
X-Authority-Analysis: v=2.4 cv=aJ7Ab79m c=1 sm=1 tr=0 ts=6a4677bb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=i0EeH86SAAAA:8 a=VwQbUJbxAAAA:8 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8
 a=RAEmS9DAgrXSH_0abccA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE1MiBTYWx0ZWRfX2wqUhkY8rx2A
 Y/on27ruGxTC/kVRyx6bAfGHmdVewN1l3/EeSdz8aPKhUsyaMmRGMVkmxrCyJal7zznV1BUFnrw
 DrfQfXP4LSwbq2Gt+fQN6TQTs2GOjUsxwjrNW7WlfX9RMqI0yoxCpCJ9ezV15ZkdUVgjE6Vc7v8
 qFD9lgVMFYpt6zM4TQ268bJEx8dTB++r8sFGFpDr1LCq+fEHMbGDvmuL+SnikxE4vFcQziLQe4y
 R5sDN/a10nb0b3V8bf2bYT2oiYOSClQF2Yb3AgueWJ0gVA/actPcZZdQEld1hOpXIKHEKLIx8x6
 BuftLQxU6z4yiS/Sdvyt2xrp0XrVvzINB6ANYiPJcBc4PjZ1XTmSdSxrUUuqheP6YM1NfgN1X7S
 z0EAkI5xY2nOOEpNdBEpCa3rnDqe9OKrjCF21IrDBeJTPPXMHcEY+t7AUkPUpJ+nuHabj3oZxei
 yPGuaao4JlZTTGRD5LQ==
X-Proofpoint-ORIG-GUID: NsJZQWWPHZVmf85JZhPHTVf_sZE-fDKf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_073748_609247_C7915FE1 
X-CRM114-Status: GOOD (  31.36  )
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

On Thu, Jun 18, 2026 at 05:21:19PM +0800, Ruidong Tian wrote:
> From: Tong Tiangen <tongtiangen@huawei.com>
> 
> Currently, copy_mc_[user]_highpage() returns zero on success, or in case
> of failures, the number of bytes that weren't copied.
> 
> While tracking the number of not copied works fine for x86 and PPC, There
> are some difficulties in doing the same thing on ARM64 because there is no
> available caller-saved register in copy_page()(lib/copy_page.S) to save
> "bytes not copied", and the following copy_mc_page() will also encounter
> the same problem.
> 
> Consider the caller of copy_mc_[user]_highpage() cannot do any processing
> on the remaining data(The page has hardware errors), they only check if
> copy was succeeded or not, make the interface more generic by using an
> error code when copy fails (-EFAULT) or return zero on success.

Agreed on the rationale -- none of the callers can act on partial byte
count, so a plain success/-EFAULT is better contract.

> 
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
> ---
>  include/linux/highmem.h | 8 ++++----
>  mm/khugepaged.c         | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/highmem.h b/include/linux/highmem.h
> index af03db851a1d..18dc4aca4aa1 100644
> --- a/include/linux/highmem.h
> +++ b/include/linux/highmem.h
> @@ -427,8 +427,8 @@ static inline void copy_highpage(struct page *to, struct page *from)
>  /*
>   * If architecture supports machine check exception handling, define the
>   * #MC versions of copy_user_highpage and copy_highpage. They copy a memory
> - * page with #MC in source page (@from) handled, and return the number
> - * of bytes not copied if there was a #MC, otherwise 0 for success.
> + * page with #MC in source page (@from) handled, and return -EFAULT if there
> + * was a #MC, otherwise 0 for success.
>   */
>  static inline int copy_mc_user_highpage(struct page *to, struct page *from,
>  					unsigned long vaddr, struct vm_area_struct *vma)
> @@ -447,7 +447,7 @@ static inline int copy_mc_user_highpage(struct page *to, struct page *from,
>  	if (ret)
>  		memory_failure_queue(page_to_pfn(from), 0);
>  
> -	return ret;
> +	return ret ? -EFAULT : 0;
>  }
>  
>  static inline int copy_mc_highpage(struct page *to, struct page *from)
> @@ -466,7 +466,7 @@ static inline int copy_mc_highpage(struct page *to, struct page *from)
>  	if (ret)
>  		memory_failure_queue(page_to_pfn(from), 0);
>  
> -	return ret;
> +	return ret ? -EFAULT : 0;
>  }

the critical part of this change is the semantic flip: the return value
goes from a count >= 0 to one that is < 0 on error. 

You have correctly converted the two call sites in khugepaged.c, but
confirm if a tree wide audit has been done.


with the caller audit confirmed

Reviewed-by: Ashok Raj <ashok.raj@oss.qualcomm.com>

