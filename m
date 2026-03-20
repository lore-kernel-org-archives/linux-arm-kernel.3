Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9754D10987A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MmXHGaQzfs+IJLxwCsEE0bxv5XGFAsVai52fKs2Msxw=; b=pLqcQAxpGiTKmd2XpNQb3uOZJ0
	9NoQuPaaFNWRFGLZ0nbAN2/5OJyh8/XQJlSVP7N8WR9hSjgvhwHHVHA2jAfkCXFOuHVMbu1m3I7SX
	kvxMTfOLmG3c1HRcXsEM9jco30OwUcovFzn3yq9tgzwiHkc9lRyNnnjrfHkvWJjxkclda+d34vPw6
	icB22TcxM4BqiWW6Frm+IgTcNBZd1qTjHlLe6Z0Rp/uX0J5Evns3n5r69aFyggQE+VF18eV//t43X
	x7/stG+o9zX3E9tjITkCS9O7I1KiV0OFSTOKuCpri0XgYoCAlO60htMlU9Frfs3Dofq89b6R5U/5R
	Tcm2E4gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3cMV-0000000D5YX-0qK9;
	Fri, 20 Mar 2026 16:06:11 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3cMS-0000000D5Xp-3W3B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:06:10 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2addb31945aso13754335ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 09:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20230601.gappssmtp.com; s=20230601; t=1774022768; x=1774627568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmXHGaQzfs+IJLxwCsEE0bxv5XGFAsVai52fKs2Msxw=;
        b=SeJQJUyQLjzRcCt4XU3HIAw3ECK9F1RAc+OGpcjou8OCoOoDsiqEQMeb/fcWQZgZG6
         dHXitMJeD10R5kLLnMAfwyh+VSrWcDNUIRQ3u5aiZoXhfo3mD83Tl8GxhA7uF5OcqK2P
         em0g6BQM+oYsykBwpOk5eKzd8yW0Eu+OuMHoTAAQ4PTD3Yg3B8KGIzrsqtmT5Qi9jMXN
         b5qqY81phpHyT5JV2004cwMfFO/wfZVgbPy4SvbTma3uvCijsr7Qqu/dYTqSzkl8Hmvq
         6EUQUnAmJt9/VLE7YhFrl+ns2vguLyfXt1kqQTxicpOtBhjfeaGG/YoQsXQz395OYmJd
         uX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774022768; x=1774627568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MmXHGaQzfs+IJLxwCsEE0bxv5XGFAsVai52fKs2Msxw=;
        b=SXXEy2OARdmQVFm360ait01ZyCIbvS6yfTuwR8WDTQZBDhFOE1bckjH8gMa9JYyGsJ
         55uin8ITd/BZLQe/c51RZUeelrevz/CQPxGSlgeFwdXbLUJuF2fv7KoaMvgKcPl7yfsk
         QJ7Vsoc50Wm4h05fer8kAVAYFYBrfTM8MQLu6XSEi6GwisL6j7EROmwZ928JuyHpOyoX
         khyV3CB7fR9oZgfQrkKFoTRJVkcCzkN2JdCvJ5fUeDwC3g7XVV9FG5nKJ83vJtx4C6SH
         WLbKf2vRr2mBUg2jMZTNnI97V4H2tV/L0j2VNDVTeSgDx4ElXIvEcRI56fRSvu6Hbaua
         pmeA==
X-Forwarded-Encrypted: i=1; AJvYcCUzTSZN69I7yj4uRWLyNz/D2r21bL8CiUTGgviXRQg8byM9BfIGmWWjmuhBKtt8Q4daa7FTZzymmzRRagJwcuFm@lists.infradead.org
X-Gm-Message-State: AOJu0YwNDjO45jtD/MQRr20+8h3lVKH6Ex9zd0lK9alT4pXynsRkEhWU
	xOQe/OCLVYsxdgLmxQaA6BMVChR8ue/JjRYEYqYPz5u5Eonmu7jL5j+byxvoPd+yWRg=
X-Gm-Gg: ATEYQzznaOqm31dKRvHNKW56lH1bnkYTqOa4dB2wlPJeoSom5ZGvoJfI5m61OrTf76x
	8moxS6HggnbBxRvzHzA53zmAPFzypqgZCfLnsOjT/5nRf0V3fR6nL1KWKlijLGkXyX4vaaurPyR
	KcWptHCsD9civHPb3H71uF2HMbR2W0QQN2D80hgInxTjCznyJO5fCRLAz7eMdzZJp2pUfn9nssf
	NL6XNfEXq3/vW/7AtAUS4QzsAUipJW0IKsq8qjaL3d8uw/yOQ7ARqPuNMflgR+4t7C+etvBS4O6
	NrvCJ0njyCMUc53HVLFudjDOoTTkJXXZvcee7WxsD1Fe+dUzHqlnAoUOLhES9E37yc5oJGeDOjw
	4rtwl2rZqtEU2vJQGLZGS1C+jQZ9lEWgymzytGEfjwuQ4kQDq7KsCHz38NvoWk+xZruoClPx9pj
	ge
X-Received: by 2002:a17:903:22d1:b0:2b0:6e8f:8e85 with SMTP id d9443c01a7336-2b0826d73e8mr36730865ad.5.1774022767505;
        Fri, 20 Mar 2026 09:06:07 -0700 (PDT)
Received: from gpc ([2400:8902:e002:ded5:78c1:8178:95c1:6ca3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083656b51sm32785625ad.54.2026.03.20.09.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 09:06:06 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: usama.arif@linux.dev
Cc: Liam.Howlett@oracle.com,
	ajd@linux.ibm.com,
	akpm@linux-foundation.org,
	apopple@nvidia.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	brauner@kernel.org,
	catalin.marinas@arm.com,
	david@kernel.org,
	dev.jain@arm.com,
	jack@suse.cz,
	kees@kernel.org,
	kevin.brodsky@arm.com,
	lance.yang@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.l,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	mhocko@suse.com,
	npache@redhat.com,
	pasha.tatashin@soleen.com,
	r@hev.cc,
	rmclure@linux.ibm.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	surenb@google.com,
	vbabka@kernel.org,
	viro@zeniv.linux.org.uk,
	willy@infradead.org
Subject: Re: [PATCH v2 3/4] elf: align ET_DYN base to max folio size for PTE coalescing
Date: Sat, 21 Mar 2026 00:05:18 +0800
Message-ID: <20260320160519.80962-1-r@hev.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320140315.979307-4-usama.arif@linux.dev>
References: <20260320140315.979307-4-usama.arif@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_090609_132853_0F16032E 
X-CRM114-Status: GOOD (  24.39  )
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

Hi Usama,

On Fri, Mar 20, 2026 at 10:04 PM Usama Arif <usama.arif@linux.dev> wrote:
> diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
> index 8e89cc5b28200..042af81766fcd 100644
> --- a/fs/binfmt_elf.c
> +++ b/fs/binfmt_elf.c
> @@ -49,6 +49,7 @@
>  #include <uapi/linux/rseq.h>
>  #include <asm/param.h>
>  #include <asm/page.h>
> +#include <linux/pagemap.h>
>
>  #ifndef ELF_COMPAT
>  #define ELF_COMPAT 0
> @@ -488,19 +489,51 @@ static int elf_read(struct file *file, void *buf, size_t len, loff_t pos)
>         return 0;
>  }
>
> -static unsigned long maximum_alignment(struct elf_phdr *cmds, int nr)
> +static unsigned long maximum_alignment(struct elf_phdr *cmds, int nr,
> +                                      struct file *filp)
>  {
>         unsigned long alignment = 0;
> +       unsigned long max_folio_size = PAGE_SIZE;
>         int i;
>
> +       if (filp && filp->f_mapping)
> +               max_folio_size = mapping_max_folio_size(filp->f_mapping);

From experiments (with 16K base pages), mapping_max_folio_size() appears to
depend on the filesystem. It returns 8M on ext4, while on btrfs it always
falls back to PAGE_SIZE (it seems CONFIG_BTRFS_EXPERIMENTAL=y may change this).
This looks overly conservative and ends up missing practical optimization
opportunities.

> +
>         for (i = 0; i < nr; i++) {
>                 if (cmds[i].p_type == PT_LOAD) {
>                         unsigned long p_align = cmds[i].p_align;
> +                       unsigned long size;
>
>                         /* skip non-power of two alignments as invalid */
>                         if (!is_power_of_2(p_align))
>                                 continue;
>                         alignment = max(alignment, p_align);
> +
> +                       /*
> +                        * Try to align the binary to the largest folio
> +                        * size that the page cache supports, so the
> +                        * hardware can coalesce PTEs (e.g. arm64
> +                        * contpte) or use PMD mappings for large folios.
> +                        *
> +                        * Use the largest power-of-2 that fits within
> +                        * the segment size, capped by what the page
> +                        * cache will allocate. Only align when the
> +                        * segment's virtual address and file offset are
> +                        * already aligned to the folio size, as
> +                        * misalignment would prevent coalescing anyway.
> +                        *
> +                        * The segment size check avoids reducing ASLR
> +                        * entropy for small binaries that cannot
> +                        * benefit.
> +                        */
> +                       if (!cmds[i].p_filesz)
> +                               continue;
> +                       size = rounddown_pow_of_two(cmds[i].p_filesz);
> +                       size = min(size, max_folio_size);
> +                       if (size > PAGE_SIZE &&
> +                           IS_ALIGNED(cmds[i].p_vaddr, size) &&
> +                           IS_ALIGNED(cmds[i].p_offset, size))
> +                               alignment = max(alignment, size);

In my patch [1], by aligning eligible segments to PMD_SIZE, THP can quickly
collapse them into large mappings with minimal warmup. That doesn’t happen
with the current behavior. I think allowing a reasonably sized PMD (say <= 32M)
is worth considering. All we really need here is to ensure virtual address
alignment. The rest can be left to THP under always, which can decide whether
to collapse or not based on memory pressure and other factors.

[1] https://lore.kernel.org/linux-fsdevel/20260313005211.882831-1-r@hev.cc

>                 }
>         }
>
> @@ -1104,7 +1137,8 @@ static int load_elf_binary(struct linux_binprm *bprm)
>                         }
>
>                         /* Calculate any requested alignment. */
> -                       alignment = maximum_alignment(elf_phdata, elf_ex->e_phnum);
> +                       alignment = maximum_alignment(elf_phdata, elf_ex->e_phnum,
> +                                                     bprm->file);
>
>                         /**
>                          * DOC: PIE handling
> --
> 2.52.0
>

Thanks,
Rui

