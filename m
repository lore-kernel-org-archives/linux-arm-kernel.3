Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CE1C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 14:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHwNCKL7rI8qLXASgeFOwWWHdqGq1CwWcM2bQSyDUNo=; b=4Yt+O5psT4M0rwvx+K0d5kPntw
	iIYxgL9bdFd55h9XRT5lMKkjImUUt+PZNtlGqEVVVR5cKxpXSynqOwF1McCYrOViouHxmVAEIQNHq
	bLM6+9Xi0cUA9whi32fnROfhw+6RLkZAAgRVuHjtlt7UsIEWUrABZTfreAsZkE++t60y/um9FK3yW
	TQ1zTzdYqeabH6/w1EdhUKtF4ujmxagf8R6cWP+P4YaqqGP4oOo1eiqiyEjputbsf7nV0ky7qrFGh
	W7mDrzZX+DkGhN+yHjZX8e1UKX7rEitLmOS7NzyZjD/BWPKCpTiF3RNZ7ygXH9p83DCSHfh0YUrfA
	HZRLLpGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KtN-00000002PAf-1lys;
	Mon, 14 Apr 2025 14:34:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Ki3-00000002M9U-20AH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 14:22:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3110C61148
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 14:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8778BC4CEED
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 14:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744640570;
	bh=J1MHietiZvsPKVDE5/U3rEBuftv5MbrgbBjOGLDvYsE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F1s4t2kD2adU4pmBIV1heZSSiHaT9g0JrMqm7KaFCN80D3LMh0BDZpx13Vqijbjl1
	 BVfumjNc6lORGXn16nlsnhIEMtQ6ENEdAg1n8aNMcSJr9z/7j5zz/IRU6iP/qSQGp0
	 dJOv36OAjNO92axVRHbOsGeDkCaj0UaeJpt/5yW/0aW9zV+P3YH1JSjylZxtAbrE7s
	 9kHoTasaE9aw9rEUY13eorvbDTLPbCmXYmOzktKDTpuuj0Cxq1J9JNEu4BGkUfmd3V
	 zM/nqfQ5LH7exttNvd+yxr4xeEvXlx3f5YyPZHGprRzDO5+fDZjQr3UijduPfnHlMU
	 5oTLNvfF6YezQ==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso6978830a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 07:22:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXDK2/WGhN8Ia6U6GL9NArDp32HOCstmei26awkW6c9CgoovPHUCwrCME7cIhe/7MIOhWxC9SztfsZJaDyAIEMN@lists.infradead.org
X-Gm-Message-State: AOJu0Yy//UnJm6sk7PfcL6DjUgAbF2V0KPqjzZLvDLK/TbwGvvgIe0fd
	Rocj+WwKLCM2IN8JaA30Ois/iwONUQrb1Hm1klC94j5avTnbAONY+F8l41yuHIwfgg+Z/QtBQ7+
	ljp9eZROyLRoZpAiCEVDdK3ugeA==
X-Google-Smtp-Source: AGHT+IFoA2QqamDXch8nyGUFZYs4yy7+kWv81Iq7qbLCVH51Gxp43p0ni/wWkr5Z2E7Q+eWsFkOGFlX3gRFXfcYTtAE=
X-Received: by 2002:a05:6402:3553:b0:5e8:bf8b:4396 with SMTP id
 4fb4d7f45d1cf-5f36f647570mr11801484a12.13.1744640569054; Mon, 14 Apr 2025
 07:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250414083243.59664-1-bsz@amazon.de>
In-Reply-To: <20250414083243.59664-1-bsz@amazon.de>
From: Rob Herring <robh@kernel.org>
Date: Mon, 14 Apr 2025 09:22:37 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJdk_UtCEEVrakO8azjxWeLLDGTfWAVqtoPS99VQz3jWQ@mail.gmail.com>
X-Gm-Features: ATxdqUHE6vbzzhRs55bf91_PCgZ2uLkWQ65QnUjEUkOFxOfp0jQxJz8Gov6b02s
Message-ID: <CAL_JsqJdk_UtCEEVrakO8azjxWeLLDGTfWAVqtoPS99VQz3jWQ@mail.gmail.com>
Subject: Re: [PATCH] fdt: arch/arm64: Delete the rng-seed property after use
To: Bartosz Szczepanek <bsz@amazon.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Alexander Graf <graf@amazon.de>, =?UTF-8?B?SmFuIEggLiBTY2jDtm5oZXJy?= <jschoenh@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Apr 14, 2025 at 3:33=E2=80=AFAM Bartosz Szczepanek <bsz@amazon.de> =
wrote:
>
> As a part of platform boot, device tree is being read to extract
> randonmess bits. The 'rng-seed' property is used for that purpose.
> After reading the value, the field was overridden with NOP instead of
> being deleted or zeroed. The problem is that NOPed fields are later not
> reused, and kexec code appended this property every time DTB is prepared:
>
>   /* add rng-seed */
>   if (rng_is_initialized()) {
>           void *rng_seed;
>           ret =3D fdt_setprop_placeholder(dtb, off, FDT_PROP_RNG_SEED,
>                           RNG_SEED_SIZE, &rng_seed);
>           if (ret)
>                   goto out;
>           get_random_bytes(rng_seed, RNG_SEED_SIZE);
>   }
> (source: arch/arm64/kernel/machine_kexec_file.c)
>
> Taken together, DTB grew at each kexec by 140 bytes ie. size of the
> newly added (and not overwritten) rng-seed property. ARM64 sets a hard
> limit on FDT size at 2MB, which means that after at most 14,979 kexecs
> DTB exceeded the limit causing catastrophic (but silent) failure in
> setup_machine_fdt().

Just like 2MB should be enough for anyone, 14979 kexecs should be enough. ;=
)


> This commits addresses the issue as follows:
>  1. Call to fdt_nop_property is replaced with overwriting the rng-seed
>     value with zeros.
>  2. Zeroed rng-seed gets special treatment and is not accepted as valid
>     seed. Warning is emitted on zeroed value.

How do you get a zeroed seed if you delete the property when zeroed?
Sure, any random bootloader could do that, but that has nothing to do
with kexec. And does it really hurt to add 0s to the random pool? A
warning is fine. In any case, none of this is specific to DT seeds. It
all belongs in the core if it is a problem.

>  3. Kexec_file code is modified to delete the zeroed property if it
>     can't fill it with valid seed.
>  4. Proper error handling is added for the case when DTB exceeds 2MB.
>
> The change was tested in QEMU arm64 environment. To do so, kernel
> containing the change was built and included in buildroot initramfs.
> Subsequently, kernel was started in QEMU. Using kexec_file, new kernel
> was loaded and kexec reboot was issued. DTB size was noted in this step.
> After new kernel has booted, another kexec_file was issued. DTB size
> was confirmed not to change.
>
> Signed-off-by: Bartosz Szczepanek <bsz@amazon.de>
> ---
>  arch/arm64/kernel/machine_kexec_file.c |  5 +++++
>  drivers/of/fdt.c                       | 18 +++++++++++++++---
>  drivers/of/kexec.c                     | 12 +++++++++++-
>  3 files changed, 31 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/m=
achine_kexec_file.c
> index af1ca875c52c..af0e39f6c96d 100644
> --- a/arch/arm64/kernel/machine_kexec_file.c
> +++ b/arch/arm64/kernel/machine_kexec_file.c
> @@ -170,6 +170,11 @@ int load_other_segments(struct kimage *image,
>         /* trim it */
>         fdt_pack(dtb);
>         dtb_len =3D fdt_totalsize(dtb);
> +       if (dtb_len > MAX_FDT_SIZE) {
> +               pr_err("DTB exceeds the maximum size: 0x%lx > 0x%x", dtb_=
len, MAX_FDT_SIZE);

You can't check restrictions of the kexec'ed kernel in the current
kernel. That restriction could be removed at any point and might not
be a problem for the kexec'ed kernel.

> +               goto out_err;
> +       }
> +       pr_info("DTB successfully created at 0x%lx (length 0x%lx)", (unsi=
gned long)dtb, dtb_len);
>         kbuf.buffer =3D dtb;
>         kbuf.bufsz =3D dtb_len;
>         kbuf.mem =3D KEXEC_BUF_MEM_UNKNOWN;
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index aedd0e2dcd89..8c2895cee682 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -1019,6 +1019,18 @@ int __init early_init_dt_scan_memory(void)
>         return found_memory;
>  }
>
> +static int check_randomness_nonzero(const uint8_t *rng_seed, int len)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < len; i++)
> +               if (rng_seed[i] !=3D 0)
> +                       return true;
> +
> +       pr_warn("Provided rng-seed value is all zeros!");
> +       return false;
> +}
> +
>  int __init early_init_dt_scan_chosen(char *cmdline)
>  {
>         int l, node;
> @@ -1039,11 +1051,11 @@ int __init early_init_dt_scan_chosen(char *cmdlin=
e)
>         early_init_dt_check_for_elfcorehdr(node);
>
>         rng_seed =3D of_get_flat_dt_prop(node, "rng-seed", &l);
> -       if (rng_seed && l > 0) {
> +       if (rng_seed && l > 0 && check_randomness_nonzero(rng_seed, l)) {
>                 add_bootloader_randomness(rng_seed, l);
>
> -               /* try to clear seed so it won't be found. */
> -               fdt_nop_property(initial_boot_params, node, "rng-seed");
> +               /* Zero out the rng-seed property */
> +               memset((void *)rng_seed, 0, l);
>
>                 /* update CRC check value */
>                 of_fdt_crc32 =3D crc32_be(~0, initial_boot_params,
> diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
> index 5b924597a4de..f5bfbac77a66 100644
> --- a/drivers/of/kexec.c
> +++ b/drivers/of/kexec.c
> @@ -453,8 +453,18 @@ void *of_kexec_alloc_and_setup_fdt(const struct kima=
ge *image,
>                         goto out;
>                 get_random_bytes(rng_seed, RNG_SEED_SIZE);
>         } else {
> -               pr_notice("RNG is not initialised: omitting \"%s\" proper=
ty\n",
> +               pr_notice("RNG is not initialised: deleting \"%s\" proper=
ty\n",
>                           "rng-seed");
> +               /*
> +                * The rng-seed property may exist as zeroed stub. If so,
> +                * remove it to not confuse the incoming kernel.
> +                */
> +               ret =3D fdt_delprop(fdt, chosen_node, "rng-seed");
> +               if (ret =3D=3D -FDT_ERR_NOTFOUND)
> +                       /* It's fine */
> +                       ret =3D 0;
> +               else if (ret)
> +                       goto out;
>         }
>
>         ret =3D fdt_setprop(fdt, chosen_node, "linux,booted-from-kexec", =
NULL, 0);
> --
> 2.47.1
>

