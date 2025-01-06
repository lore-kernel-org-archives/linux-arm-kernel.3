Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C19E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 13:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=af8Jbj+kqP+p1W8uyVyt9V0YBDVs6Wu8XxDGXWv1rDo=; b=xf3X+7YnT21ptfDL6Mj0lOoH+5
	+EEfR4/LeVbk09+ahDAc//1T9L0gI28dWsL9Vt8Te6XBe3D2NlRvswJ2VvYQgzsOGBZHqEKANp7qp
	ROLe1rxWOtKRioCPY/VCNXRlt72eeq/DRS+1lMItTApgmkW4qyv8nbQyZpGAdp4CK0yEG2kf+vreL
	HTZ5/7OqPmUo0LYWnmxiEjmJ1GAN0//YPWGjsn0HgTozhfZOojI2LX8lqHrTOc8EPX9prbi28t7Zt
	nZEetG1K5RuS4DjVRKOCiVz+CMJeHrIBDXMeiYH9UiTtWmmNAjqh9mZgkbG1AjeS0z447m7gR0iXo
	edWCtYRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUn6D-00000001OXy-2BKZ;
	Mon, 06 Jan 2025 13:24:53 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUn4m-00000001Nwx-1ucz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 13:23:26 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2166022c5caso181427105ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 05:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736169803; x=1736774603; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=af8Jbj+kqP+p1W8uyVyt9V0YBDVs6Wu8XxDGXWv1rDo=;
        b=h9je9bnkJ1K58rmo3mSBqhalm02umZk1VXKIKRBynSte3n2WUgiyTcOIiSPptpo21H
         YFKE/FruLpWnKeu34E8koURHHuofMbKF/SELtRHw4QpibjA0JsTuZcIrsdtZ8u7DVE8v
         rTkYn387OP5F0u4RJiGU7tpgLPidWfh1rGjCeVgGoS0bxKJ5Avkrq45pw3razAO0fUyz
         YMQPx0UrprOMxHIbUiHcKsPoiWKhuH8Z1mNUje/NZA4i5QwGnBgTQ1R0PiTgPwkxV8iO
         0NZvASmMB23NHO6/Khq/JXAw5WaQHtc7xJ3JQwzL52b5oMeOoKt6p4eM+FGHqxkauUGE
         eU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736169803; x=1736774603;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=af8Jbj+kqP+p1W8uyVyt9V0YBDVs6Wu8XxDGXWv1rDo=;
        b=pVWjpedKbTN1xm1LQtQ+utWHOe3IEq2z+CW88vve/XjyPUjSMTG7WCj3ziWL2xWc1O
         nDVCQjOkmdbbiLJx+SFqCVJ3enKmykZONSVQ9UgVepixYPGLJJh8kg8hOFdbXJmyFDgM
         8dV0XR8qYw9/YxSuZS2o9gXeMXZungt5G6HJ2o0UsWNPPtMHpQhh6yxGUGiFvPWE9XOM
         i7bQ3nTSL7yvhZsl2W8oGc5r3Ox/26op09c2fQBE7mDXlhv0QZIx5xCSeN0RhlNDh4eP
         O+Kpj3m2oMg0F1naKjO7fWkEZFoXYSpCjNopbyazNohmDr2fqmyTZ04IXdGSAL9BZqE/
         PzRw==
X-Forwarded-Encrypted: i=1; AJvYcCUq01d8QCH+mCdA0rgUaSNKQY6p8brxnwIGpJTmf9ScJBa5R6chcn4CGyzRd6vCVjDQBIKKZuznLPc5y7ia1ChY@lists.infradead.org
X-Gm-Message-State: AOJu0YzodnTEsgE60pNUyFd1asfZzRIajX3+7xAg4Nd8HrZ/hc8gTolw
	Ax/2L5f4tWDb92P2hHl+3+y0cz/EC4EKZsmf3eQtzhrif09Drw18fJq+xJ/tuZ8=
X-Gm-Gg: ASbGnctQmkYq72NsIy6z8F8P8+wrxj3X1v1Xfc0Wqv6hmDxWG1J7ezJzJ9ZzCWgppIP
	1kq22A15AUhlke9t237pWVA1przhM53yXNrOBLBz81jXb+025nhXwj2fVSfJUwF/QrPRLa4+GFz
	0fXXfXw4v6Cmq6ISeiAkNk7yY/4p3Jt+rIybjT3dkq2lUCGy1kBUyWlKlqu9AcmQr1i5g1xxcNd
	lb7BdLLcnrBoQaXyD4HLjGe5Fa/Ws+vfv5h8QmCqsStW7+XhDYPkNjFBWA0yiV/dasfK7bNRClE
	F66WDLTb85/sGw4WjVAbjWtG1sLirWUFbKR8Z1qZhjVjOBc2Q5Ze
X-Google-Smtp-Source: AGHT+IE/ZrXmD5LZyqp5+IF7XucHWltqSucrfnZMLD6UEt/qaBj6OXgwMq9je0lWMbXPRWlni+TKWA==
X-Received: by 2002:a05:6a20:2d07:b0:1e1:b44f:cff1 with SMTP id adf61e73a8af0-1e5e07f9c06mr81291446637.33.1736169803320;
        Mon, 06 Jan 2025 05:23:23 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:d64:296c:a8f3:f81e:f88b? ([2409:8a28:f44:d64:296c:a8f3:f81e:f88b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c149sm31371677b3a.191.2025.01.06.05.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 05:23:22 -0800 (PST)
Message-ID: <bce4bb4e-459a-44c8-945b-8889149377fd@bytedance.com>
Date: Mon, 6 Jan 2025 21:23:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/15] mm: pgtable: introduce pagetable_dtor()
Content-Language: en-US
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, palmer@dabbelt.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <8ada95453180c71b7fca92b9a9f11fa0f92d45a6.1735549103.git.zhengqi.arch@bytedance.com>
 <Z3uxwiEhYHDqdTh3@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <e1de887c-6193-48ee-a9b3-04c8a0cdda45@bytedance.com>
 <Z3vOZ18jcCpHIcPD@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z3vOZ18jcCpHIcPD@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_052324_514717_5F77F293 
X-CRM114-Status: GOOD (  13.73  )
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



On 2025/1/6 20:36, Alexander Gordeev wrote:
> On Mon, Jan 06, 2025 at 06:55:58PM +0800, Qi Zheng wrote:
>>>> +static inline void pagetable_dtor(struct ptdesc *ptdesc)
>>>> +{
>>>> +	struct folio *folio = ptdesc_folio(ptdesc);
>>>> +
>>>> +	ptlock_free(ptdesc);
>>>> +	__folio_clear_pgtable(folio);
>>>> +	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
>>>> +}
>>>> +
>>>
>>> If I am not mistaken, it is just pagetable_pte_dtor() rename.
>>> What is the point in moving the code around?
>>
>> No, this is to unify pagetable_p*_dtor() into pagetable_dtor(), so
>> that we can move pagetable_dtor() to __tlb_remove_table(), and then
>> ptlock and PTE page can be freed together through RCU, which is
>> also the main purpose of this patch series.
> 
> I am only talking about this patch. pagetable_dtor() code above is
> the same pagetable_pte_dtor() below - it is only the function name
> that changed. So why to move the function body? Anyway, that is

Ah, I just don't want to put pagetable_dtor() in between
pagetable_pte_ctor() and ___pte_offset_map(), so I moved it above
pagetable_pte_ctor(). No other special reason. ;)

Thanks!

> just a nit.
> 
>> Thanks!
> 
>>>> -static inline void pagetable_pte_dtor(struct ptdesc *ptdesc)
>>>> -{
>>>> -	struct folio *folio = ptdesc_folio(ptdesc);
>>>> -
>>>> -	ptlock_free(ptdesc);
>>>> -	__folio_clear_pgtable(folio);
>>>> -	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
>>>> -}
> 
> Thank you!

