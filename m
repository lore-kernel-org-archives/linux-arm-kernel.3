Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAAFC369A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 12:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYYB8xWXXp3NrY8EvpLd9vo2DOULWKf7nlbTH+Fs28E=; b=zCyaNEHskPdW9AeDvSTc0WDOYz
	bvkhg4AewQZEUFFQAfUudKIqTKLPwNalHqcr13rjVajRZjZE+UUGonrMfmBp1rDynFtZJcF2PG3QZ
	fD6GTEJNcIzPWBC/hJzWzJXkXP2YQL9Cu/YUoEyYqUQzX1eABZolqYxBN19d0ry4NmEuybqp3bSVn
	8Sk4EDRUJ15etp+Y2zYzpENl1ar8vj9cOY8l/ve6of9IGDGL1CblazuntXOMCWH8ZP1pcdmyev894
	B8ZDqOJIJKrMvY5Eolm1OZwbFUaUstlmlofd3MZk2YNRavgBcgvowwW4R+i1eE1b87e/j62jUFonO
	8FzGaJ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rH3-0000000AY2I-3sUt;
	Thu, 10 Apr 2025 12:44:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2r6w-0000000AW3M-3VUR;
	Thu, 10 Apr 2025 12:34:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:Message-Id:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CYYB8xWXXp3NrY8EvpLd9vo2DOULWKf7nlbTH+Fs28E=; b=nK0DnfDDUiA3Tb7q1byWfz8RVW
	TFUZopMk9Jp57KtvPZPxMaiMvKzOtBJB7bLMQ9kKyDk/hHLu+I4JEv1xPq116oEUNnTc5OyjAFvAv
	uG1S2z6VCaatnHGZvKbyAaWVT6pAZ9pJuvannmI4H48IbjkfdIXrrxgWeee/0zQ7/YRNmEAQ+8LGb
	s1WvVnjteY3Ba3bVEqmKvCxwjVpYOHLxOMjXvi4EiNjrW195PexqacFi4kiojai7ydHc5aIgOxIvU
	T9waxj/Vqjk6U4/5OPE/mVbPab98hX7g60Fda6H9il+NtAnHhYuIaPKE+AW2mJROPeiBikv1qvH4M
	cUdGVNIw==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2r6t-00000008obo-1HXA;
	Thu, 10 Apr 2025 12:34:25 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7398d65476eso568074b3a.1;
        Thu, 10 Apr 2025 05:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744288460; x=1744893260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYYB8xWXXp3NrY8EvpLd9vo2DOULWKf7nlbTH+Fs28E=;
        b=haWJjeUQKcg1OZViQWOfPSFaBa6A++zV4pAltRPN3fb4aO46zMHp77VtVoYEmRNnw7
         2aYGd6EE6pnnPe/PdV5qi2J7TqA94K+C9U+AUBZIRO8SeZHmFop4FA6MR2flPkjZ2ype
         mkv1JLN0le3q9yqZ70dKDRgLp68vyQpIkeT2/SpyoxC9Ih6mQN+6tIpiNe0Bgz4MOdXm
         MQ2zRD92g/FzMKIrkom16TLVrUmXEjjjqwUaw1eEYZItcG28oI2gt48aYsoKEJM2Xbve
         xWSvbwmYV3L7IplbkRj/Q9lz+QmNAp364G+dAV9KnVR1rUQirkSgoJbJ51uYuxRNYCWt
         ywsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288460; x=1744893260;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CYYB8xWXXp3NrY8EvpLd9vo2DOULWKf7nlbTH+Fs28E=;
        b=vmmdUaDr0kPJMnL9JQq6NjS50H+dAepQa75vZh6Z+k2fA7Con9O4rQPFnuH6gEfAhQ
         783pUzZts5blAic2qPlHAqpceM2XxUHGgePezfsuPUGPsHhn/DCzNA71oFzOdoA2TwM6
         rRTueygBBUa4iCAM5VWu/uEBhgSNV9Iqcf1CpR42K9ah5YivUpQVVY4HPW/wbNmHpiyq
         VSgQRllkSLqVOMZO+cjVs+4V9J5uR3WBNNCSq62gYwPtaSOWWvIERtSGSyD0r9p2AMXX
         Xun2U4uzpH1MQCu1SBFI53FYFEQ9xuZ//L8TM2IItT8k42foeVxyjL5uaaGN8yJqnVCJ
         E1Ug==
X-Forwarded-Encrypted: i=1; AJvYcCW6QcO9xKTGH7wS2yUDwEZ6F30pxwN2ko9ioeQIfYbPEKPHbHGJcgCh1pVvso4rHgBVkCesaPbx2tGgbPdkfazI@lists.infradead.org, AJvYcCXMEVIKYJ3YDeWpMYm143jOhphXWVBnK3h2GN0Ymm02V0s8F6OwCFtpUPPrAz9T0V6D08uFnU4xf4mTWsE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwezGZ5CPHiu5QnjAFhrEfiGPDLPHu/mDV7/sevOzj/AfwxnwHy
	U9rQN8nHjwWp5cM1lv2+2JGgrludAN48xyKFrGu4lrjgbbsjtTQN
X-Gm-Gg: ASbGncsiwGA/oPkPfmwswHGqz/zOFUE+PwNymKXisFihB4A7UFdZzfDutDHZgLfDjiB
	i6thYEWPyMlKTKZEey8AYfNVvTR6lXht5pU9AUtz+5yhO5XXCQGdYVWZHbOeFIq70ZqZav/mpWq
	U3bcJ9nnLyFfNpP7nH1oM2jMxIgZsKuBMHnjMZkVaKj9pcfzAcjllY2pnnbUXIjGAXuHHN+dhas
	vzLcrKmxXCDyOd2CeIErmNsREDAWnyJOyGiqfcVaw1uWIsTz7Ll4OOFNi3raKKxkJO/U/dvMO1V
	1ci0sU4JFL4oovc3pmeVcxI6/Ht4CM3kgCUrVfDnhPq41JGaZLdOR1hcpHOm/NLGfvhbJDPj6Nw
	8nunW4gd/fTsVt+5YCiD9Glg=
X-Google-Smtp-Source: AGHT+IGl2utS2unvYHRMdT2RP9ueZqQhdCzDP3jwZyYMjQoG9MrpSlL23CvVNg2kZbwezJItYp/l0w==
X-Received: by 2002:a05:6a00:1487:b0:732:1ce5:4a4c with SMTP id d2e1a72fcca58-73bbf869048mr3236065b3a.1.1744288459852;
        Thu, 10 Apr 2025 05:34:19 -0700 (PDT)
Received: from localhost (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e69ae9sm3206479b3a.173.2025.04.10.05.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 05:34:19 -0700 (PDT)
Date: Thu, 10 Apr 2025 21:34:02 +0900 (JST)
Message-Id: <20250410.213402.1373597003035091247.fujita.tomonori@gmail.com>
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
Subject: Re: [PATCH v5 4/4] rust: Add warn_on macro
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <Z_d1xAAptnfzqg1l@google.com>
References: <20250409065802.136971-1-fujita.tomonori@gmail.com>
	<20250409065802.136971-5-fujita.tomonori@gmail.com>
	<Z_d1xAAptnfzqg1l@google.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_133423_487984_FBC2DE5D 
X-CRM114-Status: GOOD (  11.02  )
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

On Thu, 10 Apr 2025 07:39:48 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

>> diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
>> new file mode 100644
>> index 000000000000..761f0c49ae04
>> --- /dev/null
>> +++ b/rust/kernel/bug.rs
>> @@ -0,0 +1,114 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +// Copyright (C) 2024, 2025 FUJITA Tomonori <fujita.tomonori@gmail.com>
>> +
>> +//! Support for BUG and WARN functionality.
>> +//!
>> +//! C header: [`include/asm-generic/bug.h`](srctree/include/asm-generic/bug.h)
>> +
>> +#[macro_export]
>> +#[doc(hidden)]
>> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
>> +#[cfg(CONFIG_DEBUG_BUGVERBOSE)]
>> +macro_rules! warn_flags {
>> +    ($flags:expr) => {
>> +        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
>> +        const _FILE: &[u8] = file!().as_bytes();
>> +        // Plus one for null-terminator.
>> +        static FILE: [u8; _FILE.len() + 1] = {
>> +            let mut bytes = [0; _FILE.len() + 1];
>> +            let mut i = 0;
>> +            while i < _FILE.len() {
>> +                bytes[i] = _FILE[i];
>> +                i += 1;
>> +            }
>> +            bytes
>> +        };
>> +        // SAFETY: Just an FFI call.
> 
> Safety comments could be improved. This being an FFI call is not the
> reason why it's okay. Furthermore, it's not an FFI call.
> 
> Otherwise, this series LGTM.

SAFETY: It's always safe to embed metadata such as the source file
name, line number, and flags into the .bug_table ELF section.

Looks good?

