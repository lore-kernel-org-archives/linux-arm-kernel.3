Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1982E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 07:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+w2LGhzYqZCXOMv9ifrXPQvEFWM1qsG020A9asbGYE=; b=y6gV6a1Zu8pF45oyC1InwIzWcy
	Gk7WM4PViyyKwQiP0izFQ4f4ZQTObrQ1xDmlR/M4oyYbd6JkRpiscSEPw62+Igo6m0S/mEX5mC8T9
	884MEY5jw8mwSHoTYBviSTqHA4a3hd+7Kij5M8S0w9vcnLwPHLo2FKvQ+cnve2NBnfpuSPJghMB4b
	LVBcI3BSlfk0QxvK9rWTn8afj5KKfIrD5bAUyrmBvqqLXC31KPQWR0n83dikKDMdrz+YdaEQ17Cv8
	F9qXJ0xmH/vI89ToZYsn2SxnRMsQDwXG7lLgBynWx0klbKeREqJid3GEL0DEXY5sOHGidNeT4TH4l
	2W7mcdNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKuaS-0000000AXjw-1Lk0;
	Tue, 10 Dec 2024 07:23:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKuZP-0000000AXcf-0eBc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 07:22:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EBCFE5C55A8
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 07:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1741C4CEE1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 07:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733815329;
	bh=JgANJvetXmjIIjl82nst3yjcT2gPPmG3hKpYbXFTbw0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Bz5thOH5IPWddXzzwNB46r6vG0rLlKo4aAw/dySHnhaZP++qrsZd0Kud/BLw+d/EF
	 FGznmBYfh9lOuEDAH8un0Jsu+B/H7Iv5PNgmOEZqylWS0K9Rzm8WnlJ2BqikL6bwa+
	 2FAqyeVJ/PGxPO2pbVYgzNi3NjuX42sEwGbpDf2yBgjYRcyIvKdPgNefR8//aPPT1q
	 Kn0lLlRar1fMKZm30ihDfxzjBIjTonOAKeha6A7tsiVPDnZVhwYikD0xqWGUXl4JBz
	 xjrkxOFAPhw1iWBjyJHZgsnaeTTQsHimH1ZfyjZeBPYtyXdklpuVVIQaVUuwLUhqV+
	 J4/ynCSkykmnw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53e3a37ae07so2952444e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 23:22:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX46pK5Gzqsp+KWdbSgeGgdTUZQSwsEmCCAohVCc/iS87HXRY96+UvqYXdAXKPdCePNJTx8UiY1J8M6t+yCWWPe@lists.infradead.org
X-Gm-Message-State: AOJu0YzWLOl/50ln1HLsO0mB1JyknlJcy/7sH0RRtvgbxF8kc789mtHn
	/u1p0a69SUUc0qAklwzP42xPhEvAP9SN7naDyEeCxUk1pC0X9+MuTY8/oUClVgcYZASd4SaV+9F
	9g8Re+Ze2zg/Ph5XtcPFZqwRmxxQ=
X-Google-Smtp-Source: AGHT+IF5CuEdhlOn/D9CixIkKFmGHI+XYu1ntkKIj+2KqlMWLHpsTP53kTpyF4KcjlSBayaIjQoT95J9Mbji7/lO+o0=
X-Received: by 2002:a05:6512:3e15:b0:53e:395c:688e with SMTP id
 2adb3069b0e04-53e395c6941mr3861054e87.10.1733815328190; Mon, 09 Dec 2024
 23:22:08 -0800 (PST)
MIME-Version: 1.0
References: <20241209072020.4743-1-shijie@os.amperecomputing.com>
 <20241209072020.4743-2-shijie@os.amperecomputing.com> <d13f1879-7fbc-458d-8fd3-4340b51165fd@arm.com>
In-Reply-To: <d13f1879-7fbc-458d-8fd3-4340b51165fd@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 10 Dec 2024 08:21:56 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFJhFfhy=Gwm=QrdN6XPUd=7SKNKFBF_Z4eQ30r509BCg@mail.gmail.com>
Message-ID: <CAMj1kXFJhFfhy=Gwm=QrdN6XPUd=7SKNKFBF_Z4eQ30r509BCg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: refactor the rodata=xxx
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Huang Shijie <shijie@os.amperecomputing.com>, catalin.marinas@arm.com, will@kernel.org, 
	corbet@lwn.net, patches@amperecomputing.com, cl@linux.com, 
	akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org, 
	xiongwei.song@windriver.com, inux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_232211_240782_05368B6C 
X-CRM114-Status: GOOD (  13.72  )
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

On Tue, 10 Dec 2024 at 08:17, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
...
>
> Reformatted and cleaned up the above comment a bit but feel free to
> improve it further.
>
> /*
>  * rodata=on (default)
>  *
>  *    This applies read-only attributes to VM areas and to the linear
>  *    alias of the backing pages as well. This prevents code or read-
>  *    only data from being modified (inadvertently or intentionally),
>  *    via another mapping for the same memory page.
>  *
>  *    But this might cause linear map region to be mapped down to base
>  *    pages, which may adversely affect performance in some cases.
>  *
>  * rodata=off
>  *
>  *    This provides more block mappings and contiguous hints for linear
>  *    map region which would minimize TLB footprint. This also leaves
>  *    read-only kernel memory writable for debugging.
>  *
>  * rodata=noalias
>  *
>  *    This provides more block mappings and contiguous hints for linear
>  *    map region which would minimize TLB footprint. Linear aliases of
>  *    pages belonging to read-only mappings in vmalloc region are also
>  *    marked as read-only.
>

If linear aliases are marked as read-only, how does 'noalias' differ from 'on'?

