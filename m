Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D081EC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 05:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iI2i5cV2QPSlpE280H3wgvcz67NO3pUTtRCcIr6Aq80=; b=Z82sEK5F2HETUIc3qje2UNzawE
	ngUN8lCTaeCUyE7EzX4VBs0UhGPLqlxa0KdhVurm+FZHltVjN+UPGKzsmy1t44a7RtcmgN3kKCgzr
	qODqGor38zacIB1VvRJukfK7VH2pylYon0voj5tpJjXqLL6GuELgjPm+K3eejgBwLR+scTpZ3oxr7
	Jx6WTxYOIM2z+D4sQv9K6ckgyMqWbtS5n4GsG0sxJQB/fd0NGpH0CN2mMRtgt7p2WQPjFP1D0EXHB
	IJSXnKEJ2jNHh2ZsrSb167n9ymmu19qG4OIZa/wKdWMiX641eQqIiJ89vCZSp/ejk6zEzYd8UmyZr
	YuCYJnfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tph68-000000070uL-2dBU;
	Wed, 05 Mar 2025 05:15:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tph4M-000000070Xa-1v9I;
	Wed, 05 Mar 2025 05:13:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Mime-Version:References:In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=iI2i5cV2QPSlpE280H3wgvcz67NO3pUTtRCcIr6Aq80=; b=UJbDYM1hSHz83eFcMu8WI8fAce
	Ot0I4OQdEeS2Qec0JThYQAbXpIUFCx6yN8q6ysevINO52JYDP5x1rtk2bjHl01t7hSMZcj/PRSdbX
	YzBUQ/vG1SmAptAzlSPHoBFKc8qXmgROl84U8CFHI87rbRoIRbYAnDhgQ2RF2+kfait7HN1Mlf/zD
	cE8NErwyUnB2pPc9Uc7be4AYpt85hEuhdG35p0XIvV90z/ZiGAnqpPAj+LAML8SGoaIbXV2bS57aR
	Uh+XysEhxgMdSBEXnIZgUGMlOJtThXjuf5UBbKvcLFo+Gw43SgujfihKJCWstyq5aIu82vNNk1Qfv
	Bp0ii8MQ==;
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tph4J-00000004lPh-1Akp;
	Wed, 05 Mar 2025 05:13:21 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2feb91a25bdso8569364a91.1;
        Tue, 04 Mar 2025 21:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741151595; x=1741756395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iI2i5cV2QPSlpE280H3wgvcz67NO3pUTtRCcIr6Aq80=;
        b=AS9J/3wpj/s8aAx7rSI/kVXeLRrwVOgKY3AX4JvEwlb1hEf72xf4IXLFh1uqXX/gIA
         0IVzeQtCTD/vEunpyuLRioISWscL4KBV9rjj4Wv3DgytJhcQAwVDTjoV4rRMNBmn9BJL
         chmBZph6QgKjJha8S1Y2hWkW5vsnEIMQNQ4+BKNEEx3ZKL65OuWgqq4fyG/A+XhnwZ90
         iWKmvZF3h22XD3CcD+MBQQZTLk1sAx98v+wW0Go9QPa93DlYz8OwiU9EAPP4US1NCdsW
         NfzPESLuXKLi8Sk1b1VtYZUsk+Bj8/YnKqbzqLScB0zZR+JlOFz8Nit1tmwy6MS37lds
         B+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741151595; x=1741756395;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iI2i5cV2QPSlpE280H3wgvcz67NO3pUTtRCcIr6Aq80=;
        b=hV9VHc/3vrdutCPig6eYRJYfS2tnAc8oAboupV/vf/zSw3vHGGC2gy0XcNTRX+wkrE
         M0TAn5OXHur/lklipL2VCgwia5VkTccESNtNOSBd7uqUtB34HM56rQq009DgxG1+Mzo8
         FGTxCLVVk3zuBkvl5x3tQrcK0TTja7ASDNaHYqRZCEGeN/L3EBf1lmr23vkNivmiefzG
         5LFxfKE0z1KdQYPDPy4adwb56FhTh64lKVqdCNoyELfJZCOasPqDir39hhm1sshFxH0b
         DxxlIRde4zRuIEcJYQHb6qu96zhhh+ouwHNpzR6ngZKV4LQYUMvpKk7h8EzXxP0eqQgH
         pHyg==
X-Forwarded-Encrypted: i=1; AJvYcCVxEJ83s+xqk1wg4KkTMOwF/jLHrZPOxxTVddZaErYaQ3whFVmX0K1RTMcao+HbDMw0ulxoJbGL0Y79SR6YTXct@lists.infradead.org, AJvYcCWrLC9a3rAsrT53u4Xi0PAAhxwFJp2k9EH0j6V6oz4mWYbOXMfO6t0UT2m4Nj9vZO1tcdBqXU0pbcxAk5k=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3Wa/5Ka/O5mwPmTDyBescw3AA6AOQG+92AcVJBg/tuGmsXAHy
	yd/921dLqQeLa3qsqPwaH2kDv4+OHpr5nAPvNQg47fai0gNSG6o/
X-Gm-Gg: ASbGnctvRiLhB+JKQZDvYf4q6KunKEDJga/mIv8COqHTwi8Ee+gyuU0a621UI7pFnmN
	YmJ3gt0Oa3NdZuxffzOsRz8U+izVe5Zohm51vCwccFgi7l3iHfopC1x1p/EXe6ZU0Zakynt2LSl
	IbRdmDKvGoUvXKJ82zW8WvjURPvM/S8peZWfkUEFYrbfojom//zftu/duHIPU/AddLR4kvR1BHL
	K7BlODb78om9bI66RbBnkZ0tLPtHwiA7cB+FNBaLGqb6AP2I2obZGJgZy8dH5rpMRY5w5wiUw33
	aWQA1VxJKaASLhPv/NMcsUoRbS+J9zmweQSIs9YP05IsFle/KiyKC9DHWW7lIul42/bjvqm9Ade
	xleXOEcqhTljs1a4F/grEzt/Haic=
X-Google-Smtp-Source: AGHT+IFMSQhAQ13isO5dfJNAPGUjk16diS7qR+TcB+buuYoTv6JifWXgE+o5nAJ3u7mlLeqgq39i1g==
X-Received: by 2002:a17:90b:5688:b0:2ee:bc7b:9237 with SMTP id 98e67ed59e1d1-2ff4979cee1mr3291553a91.27.1741151594826;
        Tue, 04 Mar 2025 21:13:14 -0800 (PST)
Received: from localhost (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e78a991sm380662a91.24.2025.03.04.21.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 21:13:14 -0800 (PST)
Date: Wed, 05 Mar 2025 14:13:07 +0900 (JST)
Message-Id: <20250305.141307.586794213367343251.fujita.tomonori@gmail.com>
To: aliceryhl@google.com
Cc: fujita.tomonori@gmail.com, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, peterz@infradead.org,
 hpa@zytor.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, catalin.marinas@arm.com, will@kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, tangyouling@loongson.cn,
 hejinyang@loongson.cn, yangtiezhu@loongson.cn, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 tmgross@umich.edu
Subject: Re: [PATCH v3 5/5] rust: Add warn_on and warn_on_once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CAH5fLgjX9hh+QRrKggOKr+6p+UwqHSavzu4UXy9iGNL2wSJXtg@mail.gmail.com>
References: <20250213135759.190006-1-fujita.tomonori@gmail.com>
	<20250213135759.190006-6-fujita.tomonori@gmail.com>
	<CAH5fLgjX9hh+QRrKggOKr+6p+UwqHSavzu4UXy9iGNL2wSJXtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_051319_332337_96AA9341 
X-CRM114-Status: GOOD (  13.23  )
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

On Mon, 3 Mar 2025 14:33:39 +0100
Alice Ryhl <aliceryhl@google.com> wrote:

>> +#[macro_export]
>> +#[doc(hidden)]
>> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
>> +macro_rules! warn_flags {
>> +    ($flags:expr) => {
>> +        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
>> +        // SAFETY: Just an FFI call.
>> +        #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
>> +        unsafe {
>> +            $crate::asm!(concat!(
>> +                "/* {size} */",
>> +                ".pushsection .rodata.str1.1, \"aMS\",@progbits, 1\n",
>> +                "111:\t .string ", "\"", file!(), "\"\n",
>> +                ".popsection\n",
> 
> It looks like you're doing this so that you can reference the filename
> with "111b", but could you do this instead:
> 
> const _FILE: &[u8] = file!().as_bytes();
> // Plus one for nul-terminator.
> static FILE: [u8; 1 + _FILE.len()] = {
>     let mut bytes = [0; 1 + _FILE.len()];
>     let mut i = 0;
>     while i < _FILE.len() {
>         bytes[i] = _FILE[i];
>         i += 1;
>     }
>     bytes
> };

Neat! I will use this in the next version.

> and then use
> 
> asm!(
>     concat!(
>         "/* {size} */",
>         include!(concat!(env!("OBJTREE"),
> "/rust/kernel/generated_arch_warn_asm.rs")),
>         include!(concat!(env!("OBJTREE"),
> "/rust/kernel/generated_arch_reachable_asm.rs")));
>     file = sym FILE,
>     line = const line!(),
>     ...
> );
> 
> with
> ::kernel::concat_literals!(ARCH_WARN_ASM("{file}", "{line}",
> "{flags}", "{size}")),
> 
> That would be a lot simpler to understand than what you are doing.

Indeed.

Thanks a lot!

