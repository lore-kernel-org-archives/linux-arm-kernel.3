Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA1B10A62F3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 14:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jv2EfhMbcWOA2sU2awQXAMiSQ1dwjbJBc3BzfW+6rZQ=; b=m2S01Gh5odBSxMLjEfItZazkQn
	E+PZQjlxCb4/cSmC/Cj2Mi0h9TxIpHhdcn1osnh90N8YrB9oLXHBshwYe1VB0nMbP9bCjhpRU/fxD
	oA+O/4jeaPgb1CSHGLr9czWJx3v225nBzCJjYRTswjYPXNxUVHwpEotzoSHGZG2CgfLDQLyoBNOjt
	T0qHYl92cvQ5lRHA+hfPBPazWpBujxFdRin+18ANzn/xBP5WnGBQYAP2HvNj3Sk1mNS2pMBH4TpKA
	k+ovkUxsmNcCsb/3QUBKFjHrVZ9kp5SWjcPv7rDnRWgY8NyaQOZprPyjYDA6w83NIKXWZHxwqgtWP
	MnGr3x4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lkM-00000005eVY-1okv;
	Thu, 26 Mar 2026 14:31:42 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lkE-00000005eS9-2pQR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 14:31:36 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43a03cb1df9so949562f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 07:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535492; x=1775140292; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jv2EfhMbcWOA2sU2awQXAMiSQ1dwjbJBc3BzfW+6rZQ=;
        b=FVSZE9XIRQrqa4G1JJlw6XGNaK8Cl5vDDhPIFbLFasRkI0ENAksXG8XhiPcrOukSVO
         Or26RZqpYWh2vbY0wt1Z5AVaOZ0yNid9EAfFvKqtFS159Co+ZDl8ilma7WpX05FdZG6V
         UDB4E9sioA/W2iocL9CcbKyY1i9gKIx7Z/WQ6J/G1FHfYfN5u13jHsMK6kVUm/7wrY5M
         EfWrj7Us+t4fJQDbgtA+nA0HDRp24d3hY0JAlxn+ipnDuzXZVrbBSS/bJxmECRNWkhGN
         ZYBcE9rAU2kaTv3hLgV4Q/ptmKCj5Q4krnzrYEXCnLNzL6yXaSI+J7TVD/1MGt87LoXw
         ba9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535492; x=1775140292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jv2EfhMbcWOA2sU2awQXAMiSQ1dwjbJBc3BzfW+6rZQ=;
        b=Li5Z0TcLEnf2jxTCJuBMkISuRK2BtLHXuSD/TvO/03H0j1t3BypyjOy/ljyHoseECp
         WnhAnha20Q9lmNQfK8rEudyqoSKLoskeCPIjArqr/OR0WfwX0ij7fsG3NgsZ1aBfTGK8
         mknzQQes85st5hcvtMT07Q8hb8X5AWxuS16SdE2FqHmf+ld4fBbqIhIQxUgZyFwuQBub
         /HN48A73Te6hiAk6FFTBrdcOBk+JxVlzqTcqGOWsmr62eIY0V5Md2NcbrT0K9Bv9cEm2
         +5Kqj9Vtu7ZaRas0z3XLgG9y636q849vsp1c9gW2/9HUAo3LSmD/zy3hn+fkZO2Ata+a
         u28w==
X-Forwarded-Encrypted: i=1; AJvYcCXK/DS9Nv+sC/KJ6PaltlhJ7rcJUD1UGqBo0fg15z80xalqO/hpru7AnboOVJKCrHkGOtgy4KHJfSCOqp51n2za@lists.infradead.org
X-Gm-Message-State: AOJu0YzANpKYm/c4dfxi3ApHSH55vBAlrpS3m1CIc2yPv9sSEoaKb72L
	qHv7zCQQG/ypelK2xFnGaP5B0rmf3FbQjYk5FlMabZGHEz0fVKEcsIwx
X-Gm-Gg: ATEYQzzjbWusdcYaznp0bro5SWh1diOblyKOdQOsuX+xE3Qk/QD7Putto0AfWfU2qpO
	2+KV48pWMf2vHgjtk+A74NEMkKQBk1h/Ckh/QCRj4EmNIxiEfG+w7w4fNKOZ/of0IQYJTceLcUX
	lIMk2gtcfXVR7A/53dyLdYEy5JZjraWhi1VldcC26UDA6QXA+28HbImTtaQSpvjMjWQZ7Aru98w
	PHuCODKddJR4c2s0P1M6n0gzdH/owBtaBEhaw2kjVQqVaA63sep4t5C0xJru2iHlssPl8+gyqWY
	HlFESap8pt9RfeEcoakR3vlvFhAuazK8LtEMeUsqO9vRJgEhPSBrOMsSlD++ORo6QU4Y0eVs+ZB
	7UlZFPsLqNZr0P39KrJ9tEd0XM/cRbLN3fDctnoegl5tZOOT3MPUghou22ODyIN97O+8dcJdpPZ
	91BlErVEl3rEvSBKLTBZp9eoU2h1ENrLZDSjVf
X-Received: by 2002:a05:6000:4381:b0:43b:5672:f02 with SMTP id ffacd0b85a97d-43b88a21651mr11427910f8f.7.1774535491079;
        Thu, 26 Mar 2026 07:31:31 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:d2a7::cebd? ([2001:871:22a:d2a7::cebd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e528sm8063097f8f.1.2026.03.26.07.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 07:31:29 -0700 (PDT)
Message-ID: <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com>
Date: Thu, 26 Mar 2026 15:31:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Alice Ryhl <aliceryhl@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com,
 akpm@linux-foundation.org, anton.ivanov@cambridgegreys.com,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
 david@davidgow.net, gary@garyguo.net, johannes@sipsolutions.net,
 justinstitt@google.com, linux-arm-kernel@lists.infradead.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-um@lists.infradead.org, llvm@lists.linux.dev,
 lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com,
 morbo@google.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 nicolas.schier@linux.dev, nsc@kernel.org, peterz@infradead.org,
 richard@nod.at, rust-for-linux@vger.kernel.org, tmgross@umich.edu,
 urezki@gmail.com
References: <20260322192159.88138-1-ojeda@kernel.org>
 <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_073134_727881_143F273B 
X-CRM114-Status: GOOD (  16.64  )
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

Hi Miguel,

On 3/26/26 2:47 PM, Miguel Ojeda wrote:
> On Thu, Mar 26, 2026 at 11:10 AM Alice Ryhl <aliceryhl@google.com> wrote:
>>
>> I noticed that the Makefile currently uses the arm-unknown-linux-gnueabi
>> target. It should probably not be -linux target to avoid this? Probably
>> it should just be armv7a-none-eabi, right? We gate HAVE_RUST on
>> CPU_32v7, so we should not need to consider the other variants.
> 
> I think Christian tried several targets back then and eventually
> picked that one.
> 
> Christian: what was the reason to pick the `-linux-` one? e.g. was
> there something you wanted to rely on that target spec that you
> couldn't enable or disable via `rustc` flags or similar?

It should probably be fine to use armv7a-none-eabi. I've mostly used
arm-unknown-linux-gnueabi since I though it needed to match the
bindgen-target (which is -linux-gnu for all architectures) and 
because from what I understand clang also uses arm-linux-gnueabi [1].
Also when I selected the target I thought that we would also support
armv6, but since I had no v6 hardware to test on I disabled it.
[1]: https://github.com/Rust-for-Linux/linux/blob/rust-next/scripts/Makefile.clang#L4

Cheers,
Christian

