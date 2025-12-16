Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE41D5E15A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 13:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6s5a+8iKx1asd3Iss9l5uMN5yVO3vIlass2blQdgmks=; b=jnE0AVpy579XqYsE/x3wtKM4yb
	xyinSm88Neycc2j/sBLLLaM7+XTDlod+1YGJ3fZF2pidO9y/3nK0ztv3ExqPxJvomXHjQV9FfbYKl
	oReDpc64CXRbLWDLG8WgIQksFgatSbkZMkV3CxkKmhND0stWQAabe5Yok2k8uuskxHX8cvXABtIhp
	r+o7/1T4Vg9ygMDTqxDXdsIv9NMeej6OBnR+UOhMyGBkUz73qoavfpKstgie7hTgeKlkibQZgnv/d
	6zsMaMIWiXL9PCp88RzgUJTcuKXIbdeqfJ7u/Fh3pKzvxFEfkUzydFMDWe4IuvVJrbuummiJIvSpv
	w/BZDy3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVIP-00000005HiS-0Xgo;
	Tue, 16 Dec 2025 13:40:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVIM-00000005HhG-3lhm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 13:40:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F4AE4421B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 13:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B5FC2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 13:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765892454;
	bh=bpE6mSMhtsJNcViEHUKqxdpK/zXIk25nSDmiikJg7Jo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NeZdgjmofb5XyxZ/9WvmQDRKMMTSL7UvRP7wXhCM0Sn1k0OBFCu7ph/Ju5GY0XNL7
	 aqoPVZqK6Uf82+24gaphNn/PeUkv1uFk6jNXl84kPZwk63Ov+FFGyxxW3JfHP6gQ7K
	 hiEX4jmVRRQ4gXRa8TTiN7k2GFggH0g4IrXrHv/svzQ67VjOTSouguE4IL4rEqYkRu
	 1fCwDjUzmIhKIHieXY7Djjg+l3hHsd53Fuu1izTymS6+7mURvOZSjrfDGXv1E1njvR
	 VE6jFsByaR6RC69K1SiOW4Utea7uiGZbxTDnZaJaogGFKZ85nLoQzcQrm6ab4btr3s
	 ikpOL4/rzbaVQ==
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29f1bc40b35so66680685ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 05:40:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUsVqX8CO7KcqcX4x59JKcMHIc5JOAgJ0KfcBcDAxcqAmywCE4sG7jLN893DIHrmSiv3P+cPmKKglW6VzoVVvBE@lists.infradead.org
X-Gm-Message-State: AOJu0YzPOUAg1gb4BZV2KzQM3iF1S3HU5GBmvtTwMqSIH5stMatc27xd
	BhUCrzxMtKQL4Y/gG1YbW2Zam0y029+OrJcdTGR1PUl1FfPgrkUfE2bF1mw5WyZMW3fCkqKz7Rk
	7x9fT6gAG4KgsVaKIKn0DgiSc5XtsMak=
X-Google-Smtp-Source: AGHT+IHcmZJ38d94bL4vjoP1Iao4l30Ahx8lP9aMcBlBTOZ7Gso5/FdhsFfK6P+oxGrsyN3M1S7cHEzzA6Roze4LOiE=
X-Received: by 2002:a17:902:cf0d:b0:2a0:d59e:9848 with SMTP id
 d9443c01a7336-2a0d59e9a43mr99280585ad.53.1765892453645; Tue, 16 Dec 2025
 05:40:53 -0800 (PST)
MIME-Version: 1.0
References: <20251126160854.553077-1-tzimmermann@suse.de> <20251126160854.553077-8-tzimmermann@suse.de>
In-Reply-To: <20251126160854.553077-8-tzimmermann@suse.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 16 Dec 2025 14:40:42 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG6cFsKwZk3a+xRrOYNz73efxjo=6Jnnr8HCKRO0X-zCQ@mail.gmail.com>
X-Gm-Features: AQt7F2qIXhwz3lKtiowhJ6LkUm-qxxF02G3Bdlrhhj6FcFVAi1NXBSE5o0PIhTQ
Message-ID: <CAMj1kXG6cFsKwZk3a+xRrOYNz73efxjo=6Jnnr8HCKRO0X-zCQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] efi: Refactor init_primary_display() helpers
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, arnd@arndb.de, richard.lyu@suse.com, 
	helgaas@kernel.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_054054_980171_B51D7B3E 
X-CRM114-Status: GOOD (  20.45  )
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

On Wed, 26 Nov 2025 at 17:09, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Rework the kernel's init_primary_display() helpers to allow for later
> support of additional config-table entries and EDID information. No
> functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  arch/loongarch/kernel/efi.c     | 22 +++++++++++-----------
>  drivers/firmware/efi/efi-init.c | 19 ++++++++++---------
>  2 files changed, 21 insertions(+), 20 deletions(-)
>

This patch seems unnecessary now that we've replace one table with another.

I've dropped it for now - let me know if you really want to keep it.


> diff --git a/arch/loongarch/kernel/efi.c b/arch/loongarch/kernel/efi.c
> index 638a392d2cd2..1ef38036e8ae 100644
> --- a/arch/loongarch/kernel/efi.c
> +++ b/arch/loongarch/kernel/efi.c
> @@ -81,19 +81,19 @@ EXPORT_SYMBOL_GPL(sysfb_primary_display);
>
>  static void __init init_primary_display(void)
>  {
> -       struct screen_info *si;
> -
> -       if (screen_info_table == EFI_INVALID_TABLE_ADDR)
> -               return;
> -
> -       si = early_memremap(screen_info_table, sizeof(*si));
> -       if (!si) {
> -               pr_err("Could not map screen_info config table\n");
> +       if (screen_info_table == EFI_INVALID_TABLE_ADDR) {
> +               struct screen_info *si = early_memremap(screen_info_table, sizeof(*si));
> +
> +               if (!si) {
> +                       pr_err("Could not map screen_info config table\n");
> +                       return;
> +               }
> +               sysfb_primary_display.screen = *si;
> +               memset(si, 0, sizeof(*si));
> +               early_memunmap(si, sizeof(*si));
> +       } else {
>                 return;
>         }
> -       sysfb_primary_display.screen = *si;
> -       memset(si, 0, sizeof(*si));
> -       early_memunmap(si, sizeof(*si));
>
>         memblock_reserve(__screen_info_lfb_base(&sysfb_primary_display.screen),
>                          sysfb_primary_display.screen.lfb_size);
> diff --git a/drivers/firmware/efi/efi-init.c b/drivers/firmware/efi/efi-init.c
> index d1d418a34407..ca697d485116 100644
> --- a/drivers/firmware/efi/efi-init.c
> +++ b/drivers/firmware/efi/efi-init.c
> @@ -67,10 +67,9 @@ EXPORT_SYMBOL_GPL(sysfb_primary_display);
>
>  static void __init init_primary_display(void)
>  {
> -       struct screen_info *si;
> -
>         if (screen_info_table != EFI_INVALID_TABLE_ADDR) {
> -               si = early_memremap(screen_info_table, sizeof(*si));
> +               struct screen_info *si = early_memremap(screen_info_table, sizeof(*si));
> +
>                 if (!si) {
>                         pr_err("Could not map screen_info config table\n");
>                         return;
> @@ -78,14 +77,16 @@ static void __init init_primary_display(void)
>                 sysfb_primary_display.screen = *si;
>                 memset(si, 0, sizeof(*si));
>                 early_memunmap(si, sizeof(*si));
> +       } else {
> +               return;
> +       }
>
> -               if (memblock_is_map_memory(sysfb_primary_display.screen.lfb_base))
> -                       memblock_mark_nomap(sysfb_primary_display.screen.lfb_base,
> -                                           sysfb_primary_display.screen.lfb_size);
> +       if (memblock_is_map_memory(sysfb_primary_display.screen.lfb_base))
> +               memblock_mark_nomap(sysfb_primary_display.screen.lfb_base,
> +                                   sysfb_primary_display.screen.lfb_size);
>
> -               if (IS_ENABLED(CONFIG_EFI_EARLYCON))
> -                       efi_earlycon_reprobe();
> -       }
> +       if (IS_ENABLED(CONFIG_EFI_EARLYCON))
> +               efi_earlycon_reprobe();
>  }
>
>  static int __init uefi_init(u64 efi_system_table)
> --
> 2.51.1
>

