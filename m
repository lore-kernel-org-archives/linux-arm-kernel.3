Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B089DC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 14:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxSF6lnsSAWsI4yFBGjBR+eKMGMyYNRUTfnKAxfWQFc=; b=LSj9aLbS5rigCawBHfZjJ3khaS
	m3AaDkR1Xd4twleMI5FlQRAGTbwKg7wCWFZstRnltaKfHMkRFxlh+VOZ7OKmvr9o9LYTYWvfyCVN7
	3HtC6X3DqtB+3J51cDH5s0JMrNyX27WTAHMTyfjelKfmsZfYJGs7Pb/THCNp3NlesSzIR2AW3VwqO
	HYV/Fol8/Rr9LJtTLH59POi8bb2InRw03C/IlEu5Z++RCuACoQFYFk+T48MfzVj0sK5Yr+Qw0yrIf
	M3X+5YtufuILhZK10VOPvyuDRhVXd+EerVomme/1910KU1FjlQ2hpRskDusVA8FnNBcjZhJ4YerIs
	vtXdvnCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueaMr-00000005BYp-0C4h;
	Wed, 23 Jul 2025 14:22:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZS4-000000052v2-2uM0;
	Wed, 23 Jul 2025 13:24:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:Message-Id:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AxSF6lnsSAWsI4yFBGjBR+eKMGMyYNRUTfnKAxfWQFc=; b=njepFn1zH3m52U/cv+ACYqBanu
	hxxF8miSoc7+j54fpSGNZKr4tSEWVlo07EYGkzpMl2LDFH3IS2okedL/ySfCNVNKh4VzC1ZBUxKkF
	/vERYGMDcWGDVS8LZvxKd9WJUe5SlLYj/tH6Q3no1l1dcT7y5KKzC4ZeD5npmfoVP7V/YV8xEnPfO
	T0q1Y6VMpKMX2AzrZ3l7l7aVANziFXkANAs0UDQNynaN8T/4AG3cMEWudaVoNdVIyu1feKFrXvmqy
	lM55ppaBimIX/Cl0j/HFKoT4fua/Uq7J/4gPfauu5YzoerAPdAXzIst+XMnEbr7qNW01HmI/+cfXF
	/yaSP/VA==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZS1-0000000BTCW-0Buz;
	Wed, 23 Jul 2025 13:24:07 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-23636167afeso63977315ad.3;
        Wed, 23 Jul 2025 06:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753277042; x=1753881842; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxSF6lnsSAWsI4yFBGjBR+eKMGMyYNRUTfnKAxfWQFc=;
        b=BKpO5+RwOgoX8BaYVrntZmPCOBRZ1VAavzEWTxuAK4q2AF2nR7ewSpZ6NiK4R7D7xE
         LuyGxB4LBZS0AjcnfAJouVy4/VGxx3VqNrsw0NSoxW0xppBTMVy/kZscJ/xM3m88Mplj
         CGF1KvSk9w/L8o1FTW2vvwD0B1hqSEgWpxwRxyWlQqTavhwg7iYklfTukGzb8dNzazC+
         k3YLYaSWcsKn9V0IkdakNgqp9FuTwoHrYUhJy5K4aTeWAyIst5/d2AYfltud9t2hRUaT
         9kAS2Se70k5VG56KcepaLUu+fIw8WIoWwuTWzM0YL2mLGC82hn2sAUYizAyBM2NYbPDX
         uHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753277042; x=1753881842;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AxSF6lnsSAWsI4yFBGjBR+eKMGMyYNRUTfnKAxfWQFc=;
        b=icgheahhnQC3Gi/Y+XI5gZ8HZ+7QL+hMRGQG8O7cAkAEqOxePO6AhcRovq4O5B8I7g
         sODty5GjtcFWbNwWl+TzIN7QN30UaMyLB3s9gG12oscKUTx+vp/BXwKJTjxWhqve1NcR
         MnyL1NlSFZIgJog6F4a37uIB4yO58h0FpdzkkJzRhNDuUvMkSl8rSDNlrmmlrF5M7JHM
         XPwX0MjBBEC7DeF0aV7qEO2LCJy/g2rKbtDW8DUUxhuyLJsW5zRN52KSGzrpMV2V7Bz8
         dcUqc7rCMCZBEuJYzsxsV0VTJTwZ6E/r/ZxkzyZAAfnywYCuwstD+kJrrIQ6Sewvx5sz
         XkHA==
X-Forwarded-Encrypted: i=1; AJvYcCV5t4XaYEoxMutXLjsM4ku8uBNa9HcnbeblBulWKXeIRBRrhy3RnYdj4a5N4mA2c6UWlgSxLBYZGA07YTFt4OJf@lists.infradead.org, AJvYcCW8KilFOSDWa2fwXARcFrpaH+sT/foRzsMZcFDK0NZ13k2SHRLk5jWdr5hMdwKwFfcF7WZi08FeW2UY7K0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxrWUy2FwFXjpDddp/2LkaP51aRdn8nrLHtTlx+P5PjEhTRQtuY
	dB6444VCkNeU3Zmmhe5rEdTenKpgUHathKOvCRXIeZqSRNMiBkIJdX4j
X-Gm-Gg: ASbGncsBrq5hMwz0LfDJydrSIRF4cwGvEV3gwE6Ti2Vrr+04n1icqavyzG30Oc01vX9
	QVCmHNAIYeLUzOHgshfqi2joI7pIAhHu90DD5bucu0sf7RQmz5+jj4wCxKYNitZ+rU0r7+h41Jw
	Jn0hCz68f3UO99i/AWE/7Yf4QG0T36sHJQ4WKDsFMsV1P2zqsxBkwNiCaKrnDw0hYaRW+zvXwdj
	vFBZaOC6QO7SrxJVRr9ql5LTJINKTs7xuiupOEb2n4+EzN79Xfmbr1f0sZH5nlG0WKHqTSMsAhe
	AcdanIAO9eRxSK2RAGpH0WwQ1GLrIfQRSA9wIg0tU/KkcnM9iqYLq0GAuYK6huEXv7wfx1N5XKc
	YifdoLH96MlWccxh9V1wqiNADIGYZp3wbBTQs/YOUw+BwIpYV/VGGWKjdAcbgsb4nV0J2Z+rueo
	vp
X-Google-Smtp-Source: AGHT+IHeJqmBBFuJxJuYzYQrFS3o4VgCeV81DU3JpPQ+6NIF4D1yK+R8kibmHclHfqnrmsxDYjwysQ==
X-Received: by 2002:a17:902:e887:b0:234:bca7:2920 with SMTP id d9443c01a7336-23f981b42c1mr48016245ad.24.1753277042029;
        Wed, 23 Jul 2025 06:24:02 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e4750sm97384825ad.6.2025.07.23.06.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 06:24:01 -0700 (PDT)
Date: Wed, 23 Jul 2025 22:23:43 +0900 (JST)
Message-Id: <20250723.222343.803840555288624865.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
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
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org
Subject: Re: [PATCH v6 0/4] rust: Add bug/warn abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72nLQkJo8voGONJBEgE8st7=A4RW7VP+W++SVCWse49n=Q@mail.gmail.com>
References: <CANiq72=Hr5rg7tYta8aUoxt8hOPjR2ik5_-xMWZwacr63=-7KA@mail.gmail.com>
	<20250723.152042.1300024463910400.fujita.tomonori@gmail.com>
	<CANiq72nLQkJo8voGONJBEgE8st7=A4RW7VP+W++SVCWse49n=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_142405_396252_5C3BF5B2 
X-CRM114-Status: GOOD (  16.93  )
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

On Wed, 23 Jul 2025 11:52:04 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

>> The patch for arm64? I tried to minimize changes to the original code
>> so not intentional.
> 
> The riscv one, i.e. from the range diff:
> 
>     @@ arch/riscv/include/asm/bug.h: typedef u32 bug_insn_t;
>                 "2:\n\t"                                        \
>      -                  __BUG_ENTRY "\n\t"                      \
>      -                  ".org 2b + %3\n\t"                      \
>     --                  ".popsection"                           \
>      +          __BUG_ENTRY(file, line, flags) "\n\t"           \
>      +                  ".org 2b + " size "\n\t"                \
>     -+                  ".popsection\n"                         \
>     +                   ".popsection"                           \
>      +
>      +#define __BUG_FLAGS(flags)                                        \
>      +do {                                                              \
> 
> If you look into the `.popsection` line, your patch adds a newline,
> but I guess it was not intentional. In x86 there is a newline after
> the directive, but there we have `extra` afterwards.

Oops, indeed it's not intentional.

> (I noticed since I went to expand the macros in a dummy file, given it
> can be something tricky to spot differences in the normal diff, but it
> is visible in the normal diff.)
> 
>> Yeah, I followed the original code style.
> 
> And here I meant (i.e. the first part of that paragraph) that:
> 
>     -                    "\t.org 2b+%c1\n"                                  \
> 
> now generated those two spaces around it:
> 
>     +       "\t.org 2b + " size "\n"                                        \
> 

Ah, not intentional again.

