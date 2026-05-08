Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A199CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 17:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qBZJCatbKW31QndpUrt3FNHubTaN2agrmTU0pE10pw=; b=d9b6AcQQOGl0h3d2b2ijX2yxe9
	gJnzbDyvHXbeYUqgJt0dvtbL2jMTSoPgbT1sdhrrvyIwpY+RIMthmYqaD8Va+DzTmjCzZVZVmWpqJ
	RxoWKk4INSTPbz9DrUwXvZyH4RSUUj16nmr5MGZTYotlYEA/Sejh1CtF955RVu5mKsnjCXdaBi/ZS
	2Mhm+xe2GWG1dTmWPU+P8x/VsTWJIwH0RIZaUizw05APbGuotkr00YM5NiARbg+YqO0L3pCbc2Yde
	nFFpP8HzS35DAdTI9AXI9ndcakxtELUOCjyIHzZo3b6ZJDK6pd3uX3josJA/H5zBr6wvVV8yu6j1F
	u/ut2tRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLObv-000000074DM-0aIp;
	Fri, 08 May 2026 17:03:35 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLObs-000000074CM-199c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 17:03:33 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-67bf769704eso210a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 10:03:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778259809; cv=none;
        d=google.com; s=arc-20240605;
        b=LU/QgSyVLSMTWEl0Y+TubDUsm63n5hpTveDrJB3pftO1iAZAxP8WcuJ10h0b7w/0un
         SjeQWrTC9C5tPIyuFNawWapgfGncY7vtbRsu+g9tX5lTIrZpRbfqzBHEjg/bET3SluuQ
         tYYmz8XmjSqyocKAf3MVeNxq3s5lF0V7S1ji3TxNZ/uJUNJj8bs2YA5IBWYAjWhBtZ1h
         Ny3NGBjR+S0EqAGwBN9BDvqYQCdv5gC6PsodVR+OifCTvLYr5ivDqyGsdSLe03shf455
         Y7M3FjMOuTs0lk3I49KPSghlg8e6jpEQKhXR/CP1taUDY/+eikzSKTFa80w/7EdVrD2U
         HZzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1qBZJCatbKW31QndpUrt3FNHubTaN2agrmTU0pE10pw=;
        fh=Di2MDiG010PKBLg+66sPePufzY072Jj+hH7ugPKpVX4=;
        b=fEgNeapJSUH+pn0fFdB4aB2+jeVr+zCvD30MjVJVj/oN2GiaUIlKIzUZY3I+mEYy0z
         O3NvyUkNLnHpimMQJc39Tn/2+UliS+oO4c2QToWKp3VsRZfnWgOdB+BKGtNsvoj6HAZA
         wKdqq3sY2474n1Z0ysQCOot2d0jnDOIDOx4Y4vwuQ2IuAHIOnmpn9tvck7KuLEDUAj4U
         MIMLIu1yfI/cY4LCGTJypYX3IKKHvntYBtZuetQ8TMXxiMcakAfJ9QMvv/vrVPl5jNz+
         tRK+r4kf/owAb26lPB9+Fu06PXsEMyRZjw/TyjNFq78W6X+AHLTZEuBL9WYWDSbVKwb4
         U93g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778259809; x=1778864609; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qBZJCatbKW31QndpUrt3FNHubTaN2agrmTU0pE10pw=;
        b=ROud40IX7bT0f99Mp6tu+gk5dJGxhi2F3uDpQh37wqLG4rfHHeVQkeTRkSfXglBGt0
         USMCbNzYnOrH/uX202kRjiVrBIGb3nmLK1w1sWqKfBnwprE4CI17kMQDBcteQRmq63B8
         HX/dTiEKGhfhXImDxqs/E6gwNT+ZAO9Hz9RXggHv30bk2q+Ksvam458EZekERflLSOMi
         WHIFBkfTXAqMWcqzTaFf5sNa02P0tKq3RIyQGBFuNHbPj59P59xmQCkDWsZGAPdGpabd
         FvNfaWpB2IOvcBuPoTqpyKkmwBPLuzvkUivi732naq9yLhR+D3NNDbDUk35KHS9ZQ/gc
         d1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778259809; x=1778864609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1qBZJCatbKW31QndpUrt3FNHubTaN2agrmTU0pE10pw=;
        b=FJabMiQMQEUfCoYwJayVYfvrA2BppEKGPX7/L2AuJP5Yl7FL6NbX5sUeDQ2P6rGJR1
         GHbGr139gze3XH0cQMAUTADQ24VYG3UnDqvFqYhzDYLa7a/huCk0PuBHrbdwGhsPXcR1
         7/RzCW4DbNjykjxjcIwsqmVaOFAioAT2zGQKQGfoDReTR7qSmyblmdXzhQ+vS459GVSK
         gb0TD7UuKpj8yZDWGue/O7pjEekDZUqcFSI+N/2J6eB07afTbDMnb/sOepUOa3L5fGsj
         NKxKGbmVZTUvOsI1julX06qYjl/4b/18Kt2JxGK2S9kWRpnhIFoAkZMfKrjcG+QNtip4
         IMUw==
X-Gm-Message-State: AOJu0Yy8SrPWl0udSBG07soB/MbuLdX95kyerRXIxgstfmZVumvlTwir
	YbPsGnO23lK/1vD99VKWympGpnP6AajfwIvL8WWGo0HyDIzDPA/siKLoLVwgxnjlmrvA11buAig
	6eX8eZyg2IrJtypC0SdD/0ZI9d9KPaqqJyUSNRVWq
X-Gm-Gg: Acq92OH2TH48E+2PVP/q1aSZuIPLkGkMupo3hD2xUwYZOrLCYBOYoX7/Xblnzx8Q/Ux
	oXZSAsgDQgci8YqK2gZ8pg3dRFh2i230JgfzdwSTAjnPUGVJTWkHH9/UyRjAseevrxaSEGXvWKh
	50y79mLnxYKZhcb2gbjlmSA0pOEsXOmEIn7/zfAXJuu3C+OlQ2NVMfkXnDT7D0syihTDSha+83R
	zhv1M3ZvGDspQ0b5YAaqEyFXHO8pa0RMqnCxbjOfKlkUS0I7aQNOE3uZfXJ5xDetkd/rOxHiz7a
	rbIJjzsmyOj9o+71sePFJpiw3756maXaizt/lveqHWuBD3Zk
X-Received: by 2002:a05:6402:2b9b:b0:678:93b4:1fd3 with SMTP id
 4fb4d7f45d1cf-67ec504bd96mr99834a12.6.1778259808513; Fri, 08 May 2026
 10:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260427153416.2103979-17-ardb+git@google.com> <20260427153416.2103979-19-ardb+git@google.com>
In-Reply-To: <20260427153416.2103979-19-ardb+git@google.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 8 May 2026 19:02:51 +0200
X-Gm-Features: AVHnY4LQJXE4H1yzg2s_XNJ6vUI7RiUknwjEFltvEk-tdRdSsPKhVQM2Qli3gQk
Message-ID: <CAG48ez1DJ88a0pBCE-Q0VXyDuJgng8zdunb38g4b4JPU88exww@mail.gmail.com>
Subject: Re: [PATCH v4 02/15] mm: Make empty_zero_page __ro_after_init
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_100332_342015_150DD4C2 
X-CRM114-Status: GOOD (  24.43  )
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

On Mon, Apr 27, 2026 at 5:44=E2=80=AFPM Ard Biesheuvel <ardb+git@google.com=
> wrote:
> The empty zero page is used to back any kernel or user space mapping
> that is supposed to remain cleared, and so the page itself is never
> supposed to be modified.
>
> So make it __ro_after_init rather than __page_aligned_bss: on most
> architectures, this ensures that both the kernel's mapping of it and any
> aliases that are accessible via the kernel direct (linear) map are
> mapped read-only, and cannot be used (inadvertently or maliciously) to
> corrupt the contents of the zero page.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Jann Horn <jannh@google.com>

Sorry, I should have looked at this properly earlier instead of ending
up duplicating this patch with
<https://lore.kernel.org/all/20260508-ro-zeropage-v1-1-9808abc20b49@google.=
com/>.

> ---
>  mm/mm_init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index f9f8e1af921c..6ca01ed2a5a4 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -57,7 +57,7 @@ unsigned long zero_page_pfn __ro_after_init;
>  EXPORT_SYMBOL(zero_page_pfn);
>
>  #ifndef __HAVE_COLOR_ZERO_PAGE
> -uint8_t empty_zero_page[PAGE_SIZE] __page_aligned_bss;
> +uint8_t empty_zero_page[PAGE_SIZE] __ro_after_init __aligned(PAGE_SIZE);

I think this is fine as-is; but FWIW:
"__ro_after_init __aligned(PAGE_SIZE)" means that this will land
in the middle of the .data..ro_after_init section, with padding in
front of it to create 4K alignment. So this probably wastes some
RAM on padding.

Looking at "nm ../linux-out/vmlinux | sort" with this patch applied
(from a build without any LTO or such), I see this:
```
[...]
ffffffff8473d378 d shmem_inode_cachep
ffffffff8473d380 d user_buckets
ffffffff8473e000 D zero_page_pfn
ffffffff8473f000 D empty_zero_page
ffffffff84740000 D __zero_page
ffffffff84740008 D pcpu_reserved_chunk
[...]
```
So I think there are almost 4K of padding between zero_page_pfn and
empty_zero_page for alignment; and I think when the linker linked
mm-init.o with the rest of the kernel, it also had to align the
compilation unit's entire .data..ro_after_init section to 4K, which is
why I also got ~3K of padding before zero_page_pfn, resulting in a
total of ~7K of padding.

If you want to change this:
I searched through the arch-specific linker scripts, and I think they
all rely on the generic RO_DATA() macro for emitting the rodata
section; so creating an analogous page-aligned rodata section should
be as simple as adding "*(.rodata..page_aligned)" directly after
"__start_rodata =3D .;", as I did in my duplicate patch.

