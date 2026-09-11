Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AE8C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 22:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1CitEInQG9IH8hFfkxw+Dy1+TcxOBHzYjUh6RK88Fgs=; b=CxmEJJd5uEnlKI1vdt0JaLVbVX
	U9IQltbv3pBUN2vzCT2OmNw8zXtTOp7MiOsd9GRHUcIuxLgdf7aSbG9VdJ7PulgqFKHNM1k6KgxhQ
	kkvI7ROfex6Ik/VH1RfPT5HeRGo631bi/OGGsBs4ekwRuYZpN9KEOpKJ4kL+uecHlVLCIsDNKrGRh
	fblv1jwDICbBc0a2clyJFT6d1GPqJjain0Ox2rAREGrGUV7lP2DJjePK6S98F9T1sU947zVs6rRgS
	yUdBtH9ifcQaODzX9BEwA5WTgpd6sIsyu+AvB7UJInyCj340hvgRwZvXyRdkzJxWvaqA95CrFyLqB
	wwzXOlUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59Rx-00000000EOI-0X2X;
	Fri, 11 Sep 2026 22:10:25 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59Rt-00000000ENX-0lbi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 22:10:23 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so10796505e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 15:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789164619; x=1789769419; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1CitEInQG9IH8hFfkxw+Dy1+TcxOBHzYjUh6RK88Fgs=;
        b=Vu6dKsPcNI5U9U7anAngoqYq+QRvUlGMvbGoSrQ6Fx6TDM4YpLscW+5Ma9uZTM3Wci
         m/TLsPX7wv2t11xVLFjQfehrf1CBVrkCWyyRzbvTFjSd+sMHBBb+YZYaPoK44oaCOVH8
         9Fi9FKfWDWHyGpYlSqBAaCseBtuM50Tc4CHE4tl2ZZQunwVxZRy6L27ImirAU0XqMcE9
         QZBv8X3tK2l1KEy7N285Gw69qnMqSWATCvYfhN6/cevQmqMdXu7jjQ++MzPmlMm6Raq0
         keIL4hqZqMxzqQBxTDdTW+6v7Qq3IfZ1fiGVHXy+LteCx01+8u6TLJ5YyPeoN8u95ROe
         ZJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164619; x=1789769419;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1CitEInQG9IH8hFfkxw+Dy1+TcxOBHzYjUh6RK88Fgs=;
        b=TyRAQjUtDxKTu6HimixhBxga9BBY5isiBH80gX1SvfWnENAFVJwXW+DsN+6UOeyj3P
         DlxcHiE+vF6YLojpB6N8jkQ1icn/6yZCUrRBp/0QY18llrG0Cyg9UuV3Z6w44fCrvjlN
         ZUAnDPpD9E6x8YKBNkb5xJuqdRdlPYd6UVre9hxSqhJKWV1rKSG/O7jNhxWR5otrN5Wq
         oDXFeu0MA0YmIt8fluJ4iBaMcgzhNI1itymphmg72mvai180vTsMezCROKqM0o6KofVX
         7ggXmD5bBSqDKl7mbnGQjZVqvLMnb5uDtaXl7AwWFtDquY0v8XlTDBqoaF2WMXFfGANX
         n5NQ==
X-Forwarded-Encrypted: i=1; AKwUvByKN4+oOyGz4AXq81B9I461ga8ct66CTyRo1Q4ceaoJaUgL3Efqt6TrUN8ZedEO7Nbx1DtTry9Ifbs4eiS/Trbl@lists.infradead.org
X-Gm-Message-State: AFuF++kkigzhBIx3Up6h3AEhqY/7H+SY5IsrVJA6FS3bl4z7BL6G8PDz
	SLVzppebaMHdBT9MqN47tQNH2XvfRPdN9UywtmLL38FrWhBGa9yFOaleKRJSNSTA
X-Gm-Gg: AYBFou2nXV+yofji+kXaB+ZLgewY8pseF5QOVNcYjrB7xr6k86FfwMo0WvLphdOeLdg
	J1luzLX9tcZO+7IIebp1r6D3ix4lfClPnyLRRXcbggGomt3tYgBDyvHXMCqDrTx1KOCJJwbu7vP
	0f0D5iWmHTA6domij+Z5AYcBcPqk2Fb//BTFl+SDFrOiXiap79/hqDSgk4CCYS77jYz4mNUvUhn
	499ArO139kXcQkkb0yhuY5TXoG9rkZdVBQK1z4vsE5brsG06auMiXOn310YhCDCELbEMT3pjHmq
	kNZjqTdkLqeG0WY+QtGUXJSggYDVkC3rCg9JRIK5AbM0XA32mgGDjwwmesGGK48B74TxLPmxngC
	eGVbsebxnLhectu0SSyOc5DAUnasBITSgfho6ELf8i7XdGcOyWnkOnPDfmyyeWx8cEezU+0gNwd
	VY0CdZxEorYktEvsaUlkIQn7rnqv/6DNWXetMNjpV9vm20QghsJdjWPdHK7uxVqT2hR38qN3Lqa
	5UdJD5SlberZkGlg17B1uFciE3sh3QgIqQ5
X-Received: by 2002:a05:600c:8b41:b0:49b:d45:703e with SMTP id 5b1f17b1804b1-49e6198865dmr87033975e9.8.1789164618893;
        Fri, 11 Sep 2026 15:10:18 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a81943sm69553525e9.1.2026.09.11.15.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:10:18 -0700 (PDT)
Date: Fri, 11 Sep 2026 23:10:17 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, frederic@kernel.org,
 neeraj.upadhyay@kernel.org, boqun@kernel.org, joelagnelf@nvidia.com,
 rcu@vger.kernel.org, "Andrew Morton" <akpm@linux-foundation.org>, "Arnd
 Bergmann" <arnd@arndb.de>, linux-arch@vger.kernel.org, "Vineet Gupta"
 <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, "Russell King"
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, "Guo Ren"
 <guoren@kernel.org>, linux-csky@vger.kernel.org, "Yoshinori Sato"
 <ysato@users.sourceforge.jp>, "Rich Felker" <dalias@libc.org>, "John Paul
 Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>, linux-sh@vger.kernel.org,
 "Chris Zankel" <chris@zankel.net>, "Max Filippov" <jcmvbkbc@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] lib: Add two-byte cmpxchg emulation function
Message-ID: <20260911231017.550f8cd1@pumpkin>
In-Reply-To: <20260911192540.20983-2-brads@mainlining.org>
References: <20260911192540.20983-1-brads@mainlining.org>
	<20260911192540.20983-2-brads@mainlining.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_151021_250347_63510852 
X-CRM114-Status: GOOD (  19.19  )
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

On Fri, 11 Sep 2026 19:25:34 +0000
Bradley Morgan <brads@mainlining.org> wrote:

> cmpxchg_emu_u8() emulates one-byte cmpxchg() in terms of four-byte
> cmpxchg() for the architectures lacking native one-byte atomics.
> The same architectures also lack native two-byte cmpxchg(), where
> such an operation is not supported and either fails to compile via
> BUILD_BUG() or fails to link, because the bad pointer sentinels
> these architectures declare are never defined.
> 
> Add cmpxchg_emu_u16(), the two-byte sibling. It reads the enclosing
> word with READ_ONCE(), splices the two target bytes through a union
> and loops on cmpxchg() of the full word until the compare succeeds.
> Like cmpxchg_emu_u8() it is fully ordered.
> 
> The Kconfig symbol gating this file is renamed from
> ARCH_NEED_CMPXCHG_1_EMU to ARCH_NEED_CMPXCHG_1_2_EMU, as it now
> selects both the one-byte and the two-byte emulation.
> 
> Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
>  arch/Kconfig                |  2 +-
>  arch/arc/Kconfig            |  2 +-
>  arch/arm/Kconfig            |  2 +-
>  arch/csky/Kconfig           |  2 +-
>  arch/sh/Kconfig             |  2 +-
>  arch/xtensa/Kconfig         |  2 +-
>  include/linux/cmpxchg-emu.h |  1 +
>  lib/Makefile                |  2 +-
>  lib/cmpxchg-emu.c           | 35 ++++++++++++++++++++++++++++++++---
>  9 files changed, 40 insertions(+), 10 deletions(-)
> 
...
> diff --git a/include/linux/cmpxchg-emu.h b/include/linux/cmpxchg-emu.h
> index 998deec67740..fee8171fa05e 100644
> --- a/include/linux/cmpxchg-emu.h
> +++ b/include/linux/cmpxchg-emu.h
> @@ -11,5 +11,6 @@
>  #define __LINUX_CMPXCHG_EMU_H
>  
>  uintptr_t cmpxchg_emu_u8(volatile u8 *p, uintptr_t old, uintptr_t new);
> +uintptr_t cmpxchg_emu_u16(volatile u16 *p, uintptr_t old, uintptr_t new);

Why uintptr_t? Shouldn't it just be u16?
(Which probably means the code would better if it was just 'unsigned int')

David


