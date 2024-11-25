Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFDBD58D71
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 17:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoCDHOpLJJRVTyg7xgEgEXccnwpQShyLlkcYxg2/ans=; b=VeyDbTrHZ/87o6zDbs9ykpKhDP
	cIXco6a4DRmTzZKTKuqTmDWs+0ZDl3rIWCMKePMlW/7yzI/UVw0HmzTIPokGr4uRwkqpC8CQAeMxd
	CK2KiyCCo1qcBJ22w79V8T130JFeyaGo6RjVTMxcvbD7uUPWamV7XjUggTU5VVhVKagXf6u71qKx/
	9l17QcAU3IuXgoMDOan4Cbhv4pDABQm2piT5MvLKpvcqBMKz6qj+mVounViTFGgpP+vYah2sykuFK
	Ji0UNMr0oLiWab55sqERuudR3DP67glM9VPKhFCUiqDrkEbMGiC4VI6MqAIAE0GmwWQhHMbjFjWa+
	oCyZLhtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFcqh-00000008kdY-1ezd;
	Mon, 25 Nov 2024 17:26:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFcpk-00000008kXt-0y17
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 17:25:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 09F79A41850
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 17:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74859C4CED9
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 17:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732555510;
	bh=k++Q5AiJfKWV3B5XEpjnJiw/wCMyTABKIynpHC8/ZOA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aLUtf7mqKqoZu345LXzaQpXqs1FYtALOVG1+IY544q6guYF1w8oh8ixjuTMoFlTVf
	 GCmtJTnBtSzNcpwhu2YpDEy7WQsTZhs7h21G9vxOn3RC1ZyDLpYAibiP8bBi3fC/+/
	 iBMkD2fMnOO1m0LiIU6GVCtsVtFMYQUQ3WfnX+onZQLySxs5sxz4IsaJXtXtoSrbvB
	 6OKQgZhJMS7gJhqHK2VpNvAfasFhCeKPUhyzOUsF2SmV0OmXp6n6O2Ctc5Xaydyj7Y
	 tKvnREvIarB81cqPJM+FNp+F4tslUJcTgtIsbGwXDiOtMDU4OgrWJIK5jcvyYeLOfu
	 /cKGsaP1tvFbw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53dd57589c8so3444433e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 09:25:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXRComdUHvds9b+K0lQDgOsAxQJDHEQz7/o5pW2WraQY+GgHhsro/ZAiqUlZtthDv4TLc4gPDAGOt9qiADbFs0y@lists.infradead.org
X-Gm-Message-State: AOJu0YwVl/kNtonQsoPYz8P6DsDTmuDqFCAWLzr3J5WXjr+UDB9z+4cP
	wJop1eshMhpeO080D64ADbut7Ppjku+pGB2CgAuw26Chn/ALU+AX4Y9OQEcShyKbBLfWia6fVGC
	4h8JhG//pbzHOOojCvITlHQOPqUo=
X-Google-Smtp-Source: AGHT+IHzV1ladglErctQdKdglEcprMGEHo+6nkDCkPJtDLxCJieoLazlhNtDyqoHbD8whZunRWVLLv/o+th6Qn+fO80=
X-Received: by 2002:a05:6512:1393:b0:539:93e8:7ed8 with SMTP id
 2adb3069b0e04-53de881abc4mr80069e87.15.1732555508706; Mon, 25 Nov 2024
 09:25:08 -0800 (PST)
MIME-Version: 1.0
References: <20241125170758.518943-1-yeoreum.yun@arm.com> <20241125170758.518943-3-yeoreum.yun@arm.com>
In-Reply-To: <20241125170758.518943-3-yeoreum.yun@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 25 Nov 2024 18:24:57 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG4A4h3=bZC6kSrwsZa7p4RZ-uN5N67pZUFLOQ2RJE64w@mail.gmail.com>
Message-ID: <CAMj1kXG4A4h3=bZC6kSrwsZa7p4RZ-uN5N67pZUFLOQ2RJE64w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] efi/fdt: ignore dtb when acpi option is used with force
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: broonie@kernel.org, sami.mujawar@arm.com, sudeep.holla@arm.com, 
	pierre.gondois@arm.com, hagarhem@amazon.com, catalin.marinas@arm.com, 
	will@kernel.org, guohanjun@huawei.com, Jonathan.Cameron@huawei.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_092512_401605_E49D6F76 
X-CRM114-Status: GOOD (  24.62  )
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

On Mon, 25 Nov 2024 at 18:08, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
>
> Since acpi=force doesn't use dt fallback, it's meaningless to load dt
> from comaand line option or from configuration table.
> Skip loading dt when acpi=force option is used.
> otherwise it could produce unnecessary error message
> while scanning dt if passed dt's format is invalid.
>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

I take it this is working around buggy firmware that passes both a DT
and ACPI tables, and the DT in question is broken?

If so, this should be fixed in the firmware. The EFI stub does not
reason at all about ACPI boot vs DT boot, and I would prefer to keep
it that way, especially because this code is shared with other
architectures. For instance, the meaning of acpi= could differ between
architectures, or they may not implement ACPI in the first place.

If not, I don't think there is anything to solve here. Those error
messages are not fatal, right? Note that older GRUB builds might use
the DT to pass initrd information even when booting via ACPI.



> ---
>  drivers/firmware/efi/libstub/fdt.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/firmware/efi/libstub/fdt.c b/drivers/firmware/efi/libstub/fdt.c
> index 6a337f1f8787..27291ef7c773 100644
> --- a/drivers/firmware/efi/libstub/fdt.c
> +++ b/drivers/firmware/efi/libstub/fdt.c
> @@ -231,6 +231,8 @@ efi_status_t allocate_new_fdt_and_exit_boot(void *handle,
>         struct exit_boot_struct priv;
>         unsigned long fdt_addr = 0;
>         unsigned long fdt_size = 0;
> +       bool acpi_force = false;
> +
>
>         if (!efi_novamap) {
>                 status = efi_alloc_virtmap(&priv.runtime_map, &desc_size,
> @@ -241,13 +243,17 @@ efi_status_t allocate_new_fdt_and_exit_boot(void *handle,
>                 }
>         }
>
> +       if (strstr(cmdline_ptr, "acpi=force"))
> +               acpi_force = true;
> +
>         /*
>          * Unauthenticated device tree data is a security hazard, so ignore
>          * 'dtb=' unless UEFI Secure Boot is disabled.  We assume that secure
>          * boot is enabled if we can't determine its state.
>          */
>         if (!IS_ENABLED(CONFIG_EFI_ARMSTUB_DTB_LOADER) ||
> -           efi_get_secureboot() != efi_secureboot_mode_disabled) {
> +           efi_get_secureboot() != efi_secureboot_mode_disabled ||
> +                       acpi_force) {
>                 if (strstr(cmdline_ptr, "dtb="))
>                         efi_err("Ignoring DTB from command line.\n");
>         } else {
> @@ -261,7 +267,7 @@ efi_status_t allocate_new_fdt_and_exit_boot(void *handle,
>
>         if (fdt_addr) {
>                 efi_info("Using DTB from command line\n");
> -       } else {
> +       } else if (!acpi_force) {
>                 /* Look for a device tree configuration table entry. */
>                 fdt_addr = (uintptr_t)get_fdt(&fdt_size);
>                 if (fdt_addr)
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>

