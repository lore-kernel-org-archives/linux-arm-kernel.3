Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AA01061B20
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 21:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zlsVcWSeeIpbPnsSYMwOt0k3yfDPRs+s8ihr0jHypXY=; b=OjQY0EOrF4PeVx+HTMTgxEOlnQ
	z9K2i47svWa22WB6zntpKPzbfo7isGkvUhRnzVU3RQZMWxh8X4DnlyMSYw8bXuGqdm/iybPris69k
	I+VAaJh06QJY9N0ZuIOcq8Kwi+ZasBmh6CSOooWo4n20+vFw0QHolRDXpjIAmCeig043rrdWPIOOX
	g5+XuRTuY1Y8jIqHYqg42gqRKEmAW8XWgphL7zNcpjwXTEHalRE/1wRuGFPncI0TqY9AcPnr+oXPX
	2qJ0fCDbvHEmBIxCHoEy+yZ3OkNjOBQ3OMMdcF0R/YudO0kK3/wcGjtQDjFdiiUxnqBny89pTvnQz
	e7aX0bTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JrM-0000000BtAm-2xqh;
	Mon, 30 Mar 2026 21:09:20 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JrJ-0000000Bt9G-3ZRG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 21:09:18 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso1956325e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 14:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774904956; x=1775509756; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zlsVcWSeeIpbPnsSYMwOt0k3yfDPRs+s8ihr0jHypXY=;
        b=EZwA6/ua8aWp8U89w0Uaq1+YR7XRPVIPXSlf8ZQYEokpKwBmoz15lAbzdk1tOAjeeO
         6fYC2BH3rITBQ53fft+z/p68XiWxUDHrwSp+g9+M93rwVBkp5xPe1v+tqeEDKQDvNDPM
         P0oi0/sAfj8b3pXCKRcFdv+ZiHvoVBVIDootoNKwdzzmVWrz0+VpOb6XNa5XUblU47Br
         bmRkwNN8KDO+VJl71KtiGItTf/hgVy++6kW1LrJ38tNbswZ5U8M69ZowAc3rWSnytAdc
         l/iueRMVVLk+NiLBKvpSLM15Q/tr1eWo3seFI1OeUfEXJX1LgcAfzkFWcVFSRmrdSE3z
         krMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774904956; x=1775509756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zlsVcWSeeIpbPnsSYMwOt0k3yfDPRs+s8ihr0jHypXY=;
        b=DDk07AJB7n/fXKtwG6uyij8FNYA5zDl5fdWcxxcjCrvBncHCdpr9Tx0+GafLPTFOQG
         HTSIJAki0/nnNWowtoX0QT7UtTZTQOOd1wd+JWmVeBqsY5e7O0En/9KxDZw+kfIv5eQf
         iSdVPqrFFv/3yAoXwAPvsrviY84xUDCGR/6D+pWAy7I5C6iizJ/P17JXDN6GBuZCv0UK
         aTIVuqs/aNsb+PvDX2W/+sWP/IzboMZKa95djOHlgOCgmy55lpTYJcaa1NCte/4lkbDk
         Bf0vDbh4WnCk1oAS+HUhXlaT7kcS/fBlAhObjzbFQudz6Qyok6XIfFXdKb3gB7k6J1Fx
         ddYg==
X-Forwarded-Encrypted: i=1; AJvYcCXSJyWKQxw19Xt8rmBSdYkXGqnXK5Z0VVHdfF1HXRrdnhjSv1nF78oEg1A9xJouLjDJFSZNlcszFw2AgonRU0YR@lists.infradead.org
X-Gm-Message-State: AOJu0YzQrBFM3+dtqtZZDqt/nkig7GnGnGa+Ne9wQdBwx7y4Zf+myyvG
	SqalLbNfgp5h0hk+W3SpY7HHNMTr6qZCbX1K0tnm0KR3sDWWrCbNxzC+
X-Gm-Gg: ATEYQzzjjvsBVFWCjC/TqP/haP67yw8c0VtAUPdxXWI31d/T4R0KTH2IofUhm0kt+jC
	+huIgIyzsVIwsbAv5Tqdw2fJAYcAHG9gwsD3bINDGm8teG+l9KLIDUIQVTaKJ1jJQ5gAvKy+DLZ
	UpsSlzwy8oShmTPEDhyEgHathgVScoz+gmISVtpf+9cOY+H/pqXpL2rmyuesjmtmAkn+fYfSX5l
	Lr1LRu8RrKfuohfULT3dY/cPTrxLAI95/Y4QiCekhBTFC3GW9/ZSfxe5qkhxc5M2qKUoijrP6bx
	qATiKXfsqOn4XULq/griEk7dNxzoNLrdNuxm/2zwGa8fl3aGyQm+gH938r56s3KAnnEhKzJNVBF
	7pjXokkFwtrWQzn+Kt8rQuuT5nRxTJjcJ/gOIEVj1Nh/ZkCHKAq27rF1vafJpaCaQ2bqKL0nkY7
	j4AWztemBm1xIIOJZQrGiqsNM8VPGEHw58IjE1
X-Received: by 2002:a05:6122:3c44:b0:56b:9ba4:1372 with SMTP id 71dfb90a1353d-56d4a5f8c0emr5672211e0c.9.1774904956234;
        Mon, 30 Mar 2026 14:09:16 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:d2a7::cebd? ([2001:871:22a:d2a7::cebd])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58a333c9sm9989448e0c.13.2026.03.30.14.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 14:09:15 -0700 (PDT)
Message-ID: <f159850d-5fe6-4329-9703-b355305fd106@gmail.com>
Date: Mon, 30 Mar 2026 23:09:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Alice Ryhl <aliceryhl@google.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe
 <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>,
 a.hindborg@kernel.org, acourbot@nvidia.com, akpm@linux-foundation.org,
 anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com,
 boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net,
 johannes@sipsolutions.net, justinstitt@google.com,
 linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-um@lists.infradead.org, llvm@lists.linux.dev, lossin@kernel.org,
 mark.rutland@arm.com, mmaurer@google.com, morbo@google.com,
 nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 nicolas.schier@linux.dev, nsc@kernel.org, peterz@infradead.org,
 richard@nod.at, rust-for-linux@vger.kernel.org, tmgross@umich.edu,
 urezki@gmail.com
References: <20260322192159.88138-1-ojeda@kernel.org>
 <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
 <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com>
 <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
 <CANiq72=b+cr7Stxph_hXQTmD5crCvwWTqdaGKOJ7W1-66v4i_w@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CANiq72=b+cr7Stxph_hXQTmD5crCvwWTqdaGKOJ7W1-66v4i_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_140917_897918_18E0100A 
X-CRM114-Status: GOOD (  15.23  )
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

On 3/26/26 6:30 PM, Miguel Ojeda wrote:
> On Thu, Mar 26, 2026 at 4:18 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
>>
>> I'm not sure if this is still true, but I believe it used to be the case
>> that the -linux-gnueabi target has one behaviour for enums (fixed size)
>> whereas -none-eabi, the size of the type depends on the range of values
>> included in the enum.
>>
>> Certianly, when Arm Ltd were proposing EABI, EABI had the latter
>> behaviour, and I think there were cases where Linux used "enum" in
>> its UAPI.
> 
> Short enums? I see `c-enum-min-bits` in the armv7a-none-eabi built-in
> `rustc` target, and indeed:
> 
>     #![no_std]
> 
>     #[repr(C)]
>     enum T {
>         A,
>         B,
>     }
> 
>     pub static S: usize = core::mem::size_of::<T>();
> 
> is 1 for that one, and 4 for the other.

I guess we could use a custom target spec, but I'm not
sure if that is worth the hassle of adding another one.

Cheers,
Christian


