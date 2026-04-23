Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E27F99343
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 07:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mlFZtOeHAVGD6oxAHJWQ3NW409GkmoeA2VYFJ7x7mFg=; b=zRuHzFYUsA31rrGdpjDgTxdxCQ
	z65HacznT5lf3tVVzat9jhjOjiYYMn5/jlkvyQxdxuHDnDA2sVZDYJE1opRcQU8HRakO8FMsiHtE2
	cyzK2TxDwAo/IYDWJXDI+LnFizjsHtm86W19/CqsYkjHnOy290lkN+lsr5LGASU9mIIV+zDzEL1r1
	3/RrUDB29NwRFtn2/CD8VK1fhrbU+X4BLlceM2LdpM/o6xK3XSRXsFrw8GJmxBXB7OJyMyQTFXUgJ
	OEzk1FpSolmTGL1M0sgO2utaMQoJ+yyYbl5b7vRHlNac1EfEtJS3Xi94xZE2Lb3nC9pDEx0u+p393
	DJyeyvsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFoUj-0000000B9KJ-1Sbh;
	Thu, 23 Apr 2026 07:29:05 +0000
Received: from mail-vs1-f42.google.com ([209.85.217.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFoUH-0000000B9Ix-32yJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 07:29:03 +0000
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6057723d553so3391530137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 00:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776929316; x=1777534116;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlFZtOeHAVGD6oxAHJWQ3NW409GkmoeA2VYFJ7x7mFg=;
        b=RF+4AN+HsarfNoGZrb2mNlr9KCaHzwq6tKl3e3calLu1lYatn4OxyqUMyV5cSJ8K0y
         xRahHqnB4Y5Vfa16dgIEL5kyeWt3bhhwrYc/J79AJXEhXbT9tNrZvRXvnGes/IX26yez
         MW5Ixc5MmACgv6as02jAJZMtLqoErWTY1AGsCqLqt+dPGd/V18Nx+IF4qH9FT7Twz6P/
         tnBe7StdSsIjfzxJ0QIH3xwocG2WcRc7/fUxqQ2CVWB+rb/9ukkY5gqdaHyH4g6f/T2P
         Bg8END/yH6/TAtnS8Rn2dnvOloL47VLK0/K6HwoQRMbwlsHKq5LGy8E7JQmkwpjiAY5D
         JmsA==
X-Forwarded-Encrypted: i=1; AFNElJ/0rxx4CFNQ2BKOaObQx3DWzXay/rtclRGUrgqOuhT8A1E//ZxIbzwQxSNDqCSW9CrO7VSCn515Dfcv4n5vwUIf@lists.infradead.org
X-Gm-Message-State: AOJu0YxXB/VmHtU44nVlNvcr4ShMOar8PXtwE5HnTcmXMV5q+pDM8OXC
	iJ+ZSEiJK7srVd6Ilug2uJqWyLKgeVj6a8UdnGE1qF8q9oFnlPIX/JGsyVH1XWa0OuI=
X-Gm-Gg: AeBDies7Sw6jWIBIz14NQWf8DRv+5Vk0JjHTGmPMtz66WtYzdI3MQ/RyGmZTXjmShdl
	XyeY56d5JJew78NKtKuKIRFFoI+BYDBhnSQjX+LjwUuTapCiUNu/oYl22xqzLA9MAx1UUpw0tex
	WJAVxj+NPwa8N6GLUESIrjeFtuSL+ObRLjqggaRFuIIUh9Kpe9t3D1S5v4K7tPnIyy/XaQgJGyj
	jvgwBlmIV123GGutmxyO+Zc58albKxmVAE5yZHWCxiPwtGJotkMgXechb9QOdZRlTgx/wzCG/Lj
	WXBncPN5Nl4E4+GLQM9y0LT/EwbBCEbS3uUfhuoHnGeatmj43IxBfiOXMWWuWr0aOYx1+L+XwwL
	K8yervYXIO+8YYDfjvDUvQyOXQrGsV0EL23Ozr28P9f8ZJj6d4zQXGeFFLf7mDyG5Gro/9YPSV/
	z48ZoUHBEchwJWzJqccSWiWBuhLpzTlRtskFahsoGPpoByPPZ3Y19IgrNkHCXn1789WMxbk5Y=
X-Received: by 2002:a05:6102:6a90:b0:610:92a1:15c5 with SMTP id ada2fe7eead31-616f7c4f78bmr14354049137.31.1776929315737;
        Thu, 23 Apr 2026 00:28:35 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-61747cb52c9sm9422850137.9.2026.04.23.00.28.34
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 00:28:34 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-605a3cff8d0so3814447137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 00:28:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9U5lEDxn1ys+hngBnwTGhED3cueuKvUZ8R+FprZMUvIicVqtZwPxqKQx6WqtCxvz1vgu4seISBFi+3+0nSs18l@lists.infradead.org
X-Received: by 2002:a05:6102:374e:b0:610:76c6:b759 with SMTP id
 ada2fe7eead31-616f68d86a2mr13645250137.15.1776929313804; Thu, 23 Apr 2026
 00:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <177687458572.932171.10907864814735342737.stgit@mhiramat.tok.corp.google.com>
 <177687459412.932171.8121855108122534476.stgit@mhiramat.tok.corp.google.com>
In-Reply-To: <177687459412.932171.8121855108122534476.stgit@mhiramat.tok.corp.google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Apr 2026 09:28:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUfaE8PJOYSv6nSDat0BArp416U0JvVNizWXp_pJeFAOg@mail.gmail.com>
X-Gm-Features: AQROBzBWFvupdSeqAxOVAc0cy9hT-Tw95EFaUW-lHl0FiR8iYpsy7jXE1aKRWTQ
Message-ID: <CAMuHMdUfaE8PJOYSv6nSDat0BArp416U0JvVNizWXp_pJeFAOg@mail.gmail.com>
Subject: Re: [PATCH v17 1/5] ring-buffer: Flush and stop persistent ring
 buffer on panic
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_002837_773371_CED370F5 
X-CRM114-Status: GOOD (  21.43  )
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

On Wed, 22 Apr 2026 at 18:26, Masami Hiramatsu (Google)
<mhiramat@kernel.org> wrote:
> From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
>
> On real hardware, panic and machine reboot may not flush hardware cache
> to memory. This means the persistent ring buffer, which relies on a
> coherent state of memory, may not have its events written to the buffer
> and they may be lost. Moreover, there may be inconsistency with the
> counters which are used for validation of the integrity of the
> persistent ring buffer which may cause all data to be discarded.
>
> To avoid this issue, stop recording of the ring buffer on panic and
> flush the cache of the ring buffer's memory.
>
> Fixes: e645535a954a ("tracing: Add option to use memmapped memory for trace boot instance")
> Cc: stable@vger.kernel.org
> Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

>  arch/m68k/include/asm/Kbuild         |    1 +

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

