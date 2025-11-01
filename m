Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A46CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 11:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u9/XD0hDKdvR4yKffolhsVjguJ0IGEa06vPke+jLhd8=; b=NpKWxzM6wuHMNip3ygh93Ko6iZ
	oCUCg3/Hho8pNtUphu0SewojHsOiTXKDZrdeOqBWKNu0TsB1fYx04tb1l1B7QWg+TibP0IwxPvXhK
	J0oIKw5LIwAbiD5HuLtOE5RnENwMi5lAST5lbAYQfA9R/W7pYyOlaFzgt3fLLm/ZasHdUgO61DT+1
	9Z/dwlhnIpnHv82IEzhFEvvlRvayT2V98yniyUo93sUjpFSGZ17SCi8+P+z+ZRFdGrDBBqYOvbpbN
	qGf6wqwG6LszQ+ZumrxYx/q55/KNL0uITse8RYnTMJX0SChbgi5y+W9+ysfsKDgW5nCdmJ+5CKq4i
	xF2Fv/5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF9yu-00000007J6p-3CHC;
	Sat, 01 Nov 2025 11:41:17 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF9yq-00000007J6Q-3mdD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 11:41:14 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b87171370b5so445366a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Nov 2025 04:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761997271; x=1762602071; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9/XD0hDKdvR4yKffolhsVjguJ0IGEa06vPke+jLhd8=;
        b=Sdid0T0nuTerLOvZBXwIHiFQpAWnZI3NltpPXitozKY5e5PNzVuiXL+D/2aFZdLdMy
         6k+Gu5TL7ScfssrYezNzXTdbfut8fuBs+dMIxeaI79YR2Q/V9cBG9evDYnn0sBHbIyoD
         St6Mai3FTY7k1YG6l7KbAf8YTT80wtOcw86luCTyFP5lWjhTcqTHRJaDASSUVGj8U97B
         G4JMnThBd7twRz5a3WTlag31kdnhdSFZagCJuMnAHHtUwagefrXfMpe/BLpRpA9iqcMQ
         RJHrI3FqZNVI47iPA6bHNY2bxkKS6ecWUVrMAxVVdoCM13UuvwQskTshLcV9J4+MiC59
         Pmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761997271; x=1762602071;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u9/XD0hDKdvR4yKffolhsVjguJ0IGEa06vPke+jLhd8=;
        b=aTZvEtVoHJXHVbfZyr9+yVIwAFdze1hV7DNbpQcbxk28pbJajD0Ks4kNJs0pY538mq
         QMAGCEtAiFZgTwc/cNa+d4S5Ohcku3qR+bkLX2tauFPCOPGidWveQqCPMV4Y6cDxte3G
         RJu5nhwQrO9yOnwy2KZYRETIvzDFtEI6z0hzqUz6yt7jqZQnQDxTNW4sB1f0gMsUYuIW
         ao43JXrsQyOYorb4ijUD+seUH9yzaJ6i52cKtsh2OmALvkONbelKotp8CN/pXic+nlz9
         +zVZj78WlRGREZ5eqoZN3UHMrfWuaCUPHzKh5S3WD2gvfp9ls4B9UyFuw6PUZKHoYboF
         Gw1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFCBbKjVWOqs1JIlCeF1sdREZj2NAgWNVPTYHluZDgbYy7XFdZaFkVZwUZk9WlxNxPmuNwq+KiNl8f/MnO9xZc@lists.infradead.org
X-Gm-Message-State: AOJu0YytX5aOuXNFwjTdu5/V6usTVq+EJFqQ2UvUf+3pZu43qXbmsdvJ
	gd8SMaGtAYpLHBVBhwAtvAWXWiGQiwyErmCSCIq8tUh7lkrwx7GDvrC+
X-Gm-Gg: ASbGncsNZeuKQQ6484eycxVH2ZnrSVf36u/UzONRvzQ2Q+QNYSVJa33Pflp5GplwyHj
	/gRCVBBiuLPaVAJLW8+eBucq42OtBnDZIFLFfk1fM3DkpWkC0H5M01072xi7DnYienAo1s8gaKN
	drwuoVlsKcRYgM1S4Bjv/L7kl0GkZCHUQd54JeMHNH4YCBNFg6GGVbCs7peml1Ivhy0OcB/staK
	6DZGb3ZegtkoC7jk7dF9VsW72HZ8p22I47avNpeon1vQjPbmhXQl5tR26FKGKmkXNqHYiNaKrTp
	dKYzkiEfhd2EpDOfi6Yh52mSRuRISF2aCWOT8ypyAzmNlNv41V2x46zwZSvB+UmHf2/SUvwTmWr
	vkXkKSzukvpOZPSgzi72Nyiu3PoVIyw42WYvHXSb7+6AleykdoelugFRDCNgnxfXHKXmlaKO6hH
	DVTKwHXiS3OXBN/YNmLQNcsTw=
X-Google-Smtp-Source: AGHT+IGnkjQ3QNztp1gwExI0GMt3jnJGiObcb1vZK/IUxRcgl6nteth7tOrwd8HtkzbJFL8zbVRmZw==
X-Received: by 2002:a05:6a00:4f8f:b0:77f:1a6a:e72b with SMTP id d2e1a72fcca58-7a778ee3291mr4459241b3a.5.1761997271299;
        Sat, 01 Nov 2025 04:41:11 -0700 (PDT)
Received: from [192.168.0.100] ([163.125.164.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db67cac6sm5051357b3a.51.2025.11.01.04.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Nov 2025 04:41:11 -0700 (PDT)
Message-ID: <3868c862-cf16-4259-829e-e9004028b3c1@gmail.com>
Date: Sat, 1 Nov 2025 19:41:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: yangyccccc@gmail.com, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org,
 Willy Tarreau <w@1wt.eu>
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
To: Catalin Marinas <catalin.marinas@arm.com>,
 "Paul E. McKenney" <paulmck@kernel.org>
References: <e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop>
 <aQUAR9MRxP6_qtEH@arm.com>
 <31847558-db84-4984-ab43-a5f6be00f5eb@paulmck-laptop>
 <aQU7l-qMKJTx4znJ@arm.com>
 <5ab48722-8323-45af-b585-23b34af3017e@paulmck-laptop>
 <e819db66-7f60-464d-9ee8-4e8ee3e59acf@paulmck-laptop>
 <aQXtqoUEtDr-xUeS@arm.com>
From: Yicong Yang <yangyccccc@gmail.com>
In-Reply-To: <aQXtqoUEtDr-xUeS@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_044112_952828_A1867140 
X-CRM114-Status: GOOD (  22.21  )
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

On 2025/11/1 19:23, Catalin Marinas wrote:
> On Fri, Oct 31, 2025 at 08:25:07PM -0700, Paul E. McKenney wrote:
>> On Fri, Oct 31, 2025 at 04:38:57PM -0700, Paul E. McKenney wrote:
>>> On Fri, Oct 31, 2025 at 10:43:35PM +0000, Catalin Marinas wrote:
>>>> I just realised that patch doesn't touch percpu.h at all. So what about
>>>> something like (untested):
>>>>
>>>> -----------------8<------------------------
>>>> diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
>>>> index 9abcc8ef3087..e381034324e1 100644
>>>> --- a/arch/arm64/include/asm/percpu.h
>>>> +++ b/arch/arm64/include/asm/percpu.h
>>>> @@ -70,6 +70,7 @@ __percpu_##name##_case_##sz(void *ptr, unsigned long val)		\
>>>>  	unsigned int loop;						\
>>>>  	u##sz tmp;							\
>>>>  									\
>>>> +	asm volatile("prfm pstl1strm, %a0\n" : : "p" (ptr));
>>>>  	asm volatile (ARM64_LSE_ATOMIC_INSN(				\
>>>>  	/* LL/SC */							\
>>>>  	"1:	ldxr" #sfx "\t%" #w "[tmp], %[ptr]\n"			\
>>>> @@ -91,6 +92,7 @@ __percpu_##name##_return_case_##sz(void *ptr, unsigned long val)	\
>>>>  	unsigned int loop;						\
>>>>  	u##sz ret;							\
>>>>  									\
>>>> +	asm volatile("prfm pstl1strm, %a0\n" : : "p" (ptr));
>>>>  	asm volatile (ARM64_LSE_ATOMIC_INSN(				\
>>>>  	/* LL/SC */							\
>>>>  	"1:	ldxr" #sfx "\t%" #w "[ret], %[ptr]\n"			\
>>>> -----------------8<------------------------
>>> I will give this a shot, thank you!
>> Jackpot!!!
>>
>> This reduces the overhead to 8.427, which is significantly better than
>> the non-LSE value of 9.853.  Still room for improvement, but much
>> better than the 100ns values.
>>
>> I presume that you will send this up the normal path, but in the meantime,
>> I will pull this in for further local testing, and thank you!
> I think for this specific case it may work, for the futex as well but
> not generally. The Neoverse-V2 TRM lists some controls in the
> IMP_CPUECTLR_EL1, bits 29 to 33:
>
> https://developer.arm.com/documentation/102375/0002
>
> These can be configured depending on the system configuration but they
> are too big knobs to cover all use-cases within an OS. This register is
> typically configured by firmware, we don't touch it in Linux.
>
> I'll dig some more but we may have to do tricks like prefetch if we
> can't find a hardware configuration that satisfies all cases.
>

FYI, there's a version to allow prefetech added prior to LSE opertaions by one boot option [1],
if we want to reconsidered in this way, it's more flexible and can be controlled by the OS without touching
the system configurations (may need to update the firmware). But need to add the prefetch in per-cpu
implementation as you've noticed above (didn't add it since no prefetch for LL/SC implementation there,
maybe a missing?)

[1] https://lore.kernel.org/all/20250919091747.3702-1-yangyicong@huawei.com/

thanks.





