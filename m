Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8368C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 07:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wEO0P/4McgPJ7BP0yxbjT3/h2+Tl9EqmI0luXhkXNF0=; b=ALrFgh9Gs5x9zIv1B2GbJOzGYX
	yikrdJN7pnFRKEv3xCTVwrlO19LEnWYSBTKbDhh8e7Kk5JkAOgo7RJAezBmhFCCb+0YogKmuRHnFi
	yyaOf1+T1IFYx+wXGiLmnDdqQ5g/SiZRlMLsmqHY5lQMkT0SDEQKisi9n2vC4QmaH5D8q4E6OZf0g
	PLGUVbnq0iEZ/Z35KsK2rJxBakla9lNzS4GpSMi3Itz531VIE1zV0eClzQcfi0dRmACXy4SZsiedN
	7RnALo664sfi5ew+8H3/h2ASyhI7NPcoRDIoz+sqxyyZBW142UDVtw2bpzliOLyXE8qxHKAsclal1
	fMtMLajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38me-0000000Cr0Q-1f6Q;
	Fri, 11 Apr 2025 07:26:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37vV-0000000CjV6-0cOp
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Apr 2025 06:31:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wEO0P/4McgPJ7BP0yxbjT3/h2+Tl9EqmI0luXhkXNF0=; b=f1TcjYv24BEqSXK0gu5RYHx93F
	gcWtYF7OrbiYuCpVPLYt+FVJJCmXy950uXFoS9hNv7J0d6XEz7GNrbDXiGXXxs6rTYHamWKeax8JC
	3ln50nlBGSCum5x9kVgm+sfJaPP79eNjpnidiZxhYIF4qplS3fEjgoXbEVLYuU/bUZ4vOMWGGSiu+
	XZxcRwP3kZyXHJUGvEVwqSkXqGsX9BIIrm1CNNuB9+kReOb1krvKr6GxY5Gf3r2SoYCPV7W8/jgCu
	3i9qF502jsrSrodXiw17xt+MIEUvg9yfLbJwilfXfaQjfy2SZcUI1QU28DOg8id5m0ZajJ80614dQ
	tjvk5vqw==;
Received: from mail-vk1-f178.google.com ([209.85.221.178])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u37vS-00000008wJQ-0Uz7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 06:31:44 +0000
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5259327a93bso719787e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 23:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744353098; x=1744957898;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wEO0P/4McgPJ7BP0yxbjT3/h2+Tl9EqmI0luXhkXNF0=;
        b=r2Unsy53n+Hk6xqwHmQbcHbqwIsECniFedEa9RIkaasGhgGS3iffKAWULmKUROaDKD
         iStgkDdn/q3dpYO7wdNmV6c1T1P5fb8HpvqnGeLntZWRfsxQMbhu3h1Ikbm6/xZXVFoQ
         779fk4rPt9j3BuH4FSXaw0y2lez4c38bq/eWlqvT+F3vJPdNsXqbT/V6qiA0/JKRnhnK
         B0b/t0KDWLr85S9ciNp25bV92UTJ6DcTRHFc++o8nPdlmBHWKjb96aOlqiduxy2BW6uz
         uswXLRdqSgDmqrCSX+QUG1YAoJGrz695549BdEiOGFNr6IWeNjIWAWMQvwlf32ZA5AGZ
         K8pA==
X-Forwarded-Encrypted: i=1; AJvYcCXM5vNIVXGck30HeffBc+o4ICp7VeQ6AFWdYYGyGJpVmVNXIA0KyXGCEPyqi4XfFiyDy4GgIGA3UTlvbt3CvhCP@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+SKfYNgRPhxX/yeqOerZk3dZgg3uZv+XtTP6Zzm2XptAeoYZK
	TXa42fIz2abDfU8E3yFjgnPxn9bSFtqAQ64dZPoRch4I4rYPUIXwp907XrE6xy8=
X-Gm-Gg: ASbGnctboihNhIS8s3MqgSjvRvmrdlaYDyWBmoAFaHIfR4HUEVJJJDos6juPKJC6Lg1
	Ub/eV2ckmd5ty5nj7LWgT+EWPHtiBxRJN6i7WKxBaEBTuRL6L9XRwUcyflotAB1jY150sWbPJfH
	Ta6d+UGLzuK7JLbYeTDjpvY8W92k3PlkoSQVULdk88X6jGHzuh1jTD4dfRgSMz5OvUTkQGbJvue
	z0LBhS6UlxylgFBsEdxK3/D5YZZ4bCCBzGZox+pJEzvP9BGVJn9QDCgnPGNHxNncuK+CGMpFW4R
	dG1caN82b9ujwqQiZOCRY7OAHP96WllgK+njpkCCsfjLBg+ApltySnyRVsWjWBj/1Rzi2tuY/Vq
	R8BM=
X-Google-Smtp-Source: AGHT+IEjmb2gNq+Ma/yusH+65gS/oQEvxzAlrnsQK03suc9wKZbfSM+5XgbrYoiRbfIqrptO+nzepA==
X-Received: by 2002:a05:6122:d95:b0:520:51a4:b81c with SMTP id 71dfb90a1353d-527c3596f31mr781730e0c.6.1744353098372;
        Thu, 10 Apr 2025 23:31:38 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-875572b2b96sm944274241.28.2025.04.10.23.31.38
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 23:31:38 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86d75f4e9a1so648444241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 23:31:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWN2eLNd1Pm53O+h9OrNdCtsn5K4c7A5fFM+CTeGePu+GK5YoTVlgiMaFoN/6fQrn1Lyy1qfY0cEQ/Yo09QBFcA@lists.infradead.org
X-Received: by 2002:a05:6102:b02:b0:4bb:e8c5:b164 with SMTP id
 ada2fe7eead31-4c9e4ee720bmr793116137.7.1744353097831; Thu, 10 Apr 2025
 23:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250410200606.20318-1-dylanbhatch@google.com> <20250410200606.20318-3-dylanbhatch@google.com>
In-Reply-To: <20250410200606.20318-3-dylanbhatch@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Apr 2025 08:31:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-1f3_ufKzHxg7KP-oQOTUR=P3e36W9X=+nkA4SH1F_Q@mail.gmail.com>
X-Gm-Features: ATxdqUG8wphQEVB9r3YF2jmxCQ7GDshhzzkv5uNWZN8ycvFadPAv3ateJjFVJyg
Message-ID: <CAMuHMdU-1f3_ufKzHxg7KP-oQOTUR=P3e36W9X=+nkA4SH1F_Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64/module: Use text-poke API for late relocations.
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Song Liu <song@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Roman Gushchin <kfree@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_073142_288844_036F1992 
X-CRM114-Status: GOOD (  26.49  )
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

Hi Dylan,

Thanks for your patch!

On Thu, 10 Apr 2025 at 22:06, Dylan Hatch <dylanbhatch@google.com> wrote:
> To enable late module patching, livepatch modules need to be able to
> apply some of their relocations well after being loaded. In this
> scenario, use the text-poking API to allow this, even with
> STRICT_MODULE_RWX.

Wouldn't using the text-poking API involve calling text_poke()?

> This patch is largely based off commit 88fc078a7a8f6 ("x86/module: Use
> text_poke() for late relocations").
>
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

> --- a/arch/arm64/kernel/module.c
> +++ b/arch/arm64/kernel/module.c

> @@ -431,6 +444,30 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
>         return -ENOEXEC;
>  }
>
> +int apply_relocate_add(Elf64_Shdr *sechdrs,
> +                      const char *strtab,
> +                      unsigned int symindex,
> +                      unsigned int relsec,
> +                      struct module *me)
> +{
> +       int ret;
> +       bool early = me->state == MODULE_STATE_UNFORMED;
> +       void *(*write)(void *, const void *, size_t) = memcpy;
> +
> +       if (!early) {
> +               write = aarch64_insn_copy;

Perhaps aarch64_insn_copy() should be renamed to text_poke(),  as it
is a wrapper around __text_poke(), just like the x86 implementation?

> +               mutex_lock(&text_mutex);
> +       }
> +
> +       ret = __apply_relocate_add(sechdrs, strtab, symindex, relsec, me,
> +                                  write);
> +
> +       if (!early)
> +               mutex_unlock(&text_mutex);
> +
> +       return ret;
> +}
> +
>  static inline void __init_plt(struct plt_entry *plt, unsigned long addr)
>  {
>         *plt = get_plt_entry(addr, plt);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

