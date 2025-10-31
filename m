Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A77CCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 09:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dp94GrDZg0UVkVDHJkjmLVgK6x3UrsnNDqe+2G/50o=; b=GTbneRhKmGZPttm8aGBCx0XZuD
	LQE8NWp8+XqN5+IXIul+ew2FHUimebproNT/8TkJrwSOFyfKMSD9BQbq4uGTvhgcPY+U/X7YVyyZ3
	bi8siYEXtA/8QoLPAgu2EAJjvM54P9vS+YBJoeV+MHq4LecW5ToXsVOxEVDxw9aUrFIKfhuZSGtNs
	xWO9YScxXPUNn4tl2Pi9nLENPLoWg2iLRHtgyyhHlfO6XOIeSroSny69+P1D7aeyNdqJWWwGQQuqB
	QEz2gnMWDoU3N0j9W1kHsiHpwIFhzrWJ96qHfk+2EJS4fJDiNtaRLesdfSyV+qusbgQrb0qSwHHHs
	HVf3wHWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl5E-00000005kYT-45mE;
	Fri, 31 Oct 2025 09:06:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEl5B-00000005kWi-3q5k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 09:06:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 13B4861DE2
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 09:06:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A875CC2BC87
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 09:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761901564;
	bh=HY35X0Jzske9SGqhpLiK1C62JcE5DLM53IEaMjOcCVY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=loiaIyIRL4ulsJ+FEOYNY2/S0JaFMly4NkQGS459NSi2JDRp7vA9vd5hhO/+s7lQP
	 PDKYs9cFu3Y4+CBCIeg22y9Ur+yDODNTSL5i+QmD8p0vlURZy3XlnZDOjc2mOAxD5X
	 VDVAPczTuQaBCJPIlj9a0Az9kAhcSmQWxNcvFIUxTKIXfTrWUVuNu/OzuGtn69HfFL
	 KJLb9+41Ok1E3GdO0yLxMPmjL3lgN+fQ67PjkNROqU7hkuOspvJ/ozRFnIjDn6VMkQ
	 ZwBKrsyRrEuTxqye8yU9QRH+FwGRNNHB9h32JsCwr1RRGbtZJ4KUxO1akKXde+Yj9w
	 02c7pcoln4uUQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-378d710caedso19439921fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 02:06:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWYBqRNK1yLUn9M/l/aZjwYFZkOD+px1aIrOYJrx2x+nflFXdA2uMKvVaafA9GABrUmQUbbmqN8ISHNKJkO90SD@lists.infradead.org
X-Gm-Message-State: AOJu0YySy0qI+sNzfMxnjaBv2SATulf5PnWCN3/oADKMtKb0t/KDISSf
	Ns0W+z1MVX1d6so8bWq0KGSQHgrkjx6094CrRauAzOoROEhY/TDSVedD+aIHuvjBQPlpxnktwN1
	tW2TqXzLU2RwpmPNf9eW+NGzS6cB5v2Q=
X-Google-Smtp-Source: AGHT+IHo1BDxtEcYJCNqrkX3cSbClvnLOEGhzOUXS7m3YmCBUjmZoaCOU8Y8UHOzac6EJyOFBI9H4ZUYvlMV1sk1fT0=
X-Received: by 2002:a05:651c:50f:b0:372:9fd0:8c44 with SMTP id
 38308e7fff4ca-37a18da85c2mr7825361fa.3.1761901562867; Fri, 31 Oct 2025
 02:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20251022114527.618908-1-adriana@arista.com> <20251031084101.701159-1-adriana@arista.com>
 <20251031084101.701159-3-adriana@arista.com>
In-Reply-To: <20251031084101.701159-3-adriana@arista.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 31 Oct 2025 10:05:51 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE6L2PTtYYqOC7+fQd7HoB_FJAOtF=p=u+AimhqkLzV8w@mail.gmail.com>
X-Gm-Features: AWmQ_blu14Z2p8TiOqD9ran31qq1TH0PhxjuvuYB7qcqo-ibv4LM8TnejHIrFyE
Message-ID: <CAMj1kXE6L2PTtYYqOC7+fQd7HoB_FJAOtF=p=u+AimhqkLzV8w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drivers: firmware: dmi_scan: Add support for
 reading SMBIOS from DT
To: adriana <adriana@arista.com>
Cc: ilias.apalodimas@linaro.org, trini@konsulko.com, robh@kernel.org, 
	krzk@kernel.org, jdelvare@suse.com, frowand.list@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, vasilykh@arista.com, 
	arm.ebbr-discuss@arm.com, boot-architecture@lists.linaro.org, 
	linux-efi@vger.kernel.org, uefi-discuss@lists.uefi.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

Hello Adriana,

On Fri, 31 Oct 2025 at 09:41, adriana <adriana@arista.com> wrote:
>
> From: Adriana Nicolae <adriana@arista.com>
>
> Signed-off-by: Adriana Nicolae <adriana@arista.com>
> ---
>  drivers/firmware/dmi_scan.c | 58 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>
> diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
> index 70d39adf50dc..acc0e18b8d0f 100644
> --- a/drivers/firmware/dmi_scan.c
> +++ b/drivers/firmware/dmi_scan.c
> @@ -10,6 +10,9 @@
>  #include <linux/random.h>
>  #include <asm/dmi.h>
>  #include <linux/unaligned.h>
> +#if IS_ENABLED(CONFIG_OF)
> +#include <linux/of.h>
> +#endif
>
>  #ifndef SMBIOS_ENTRY_POINT_SCAN_START
>  #define SMBIOS_ENTRY_POINT_SCAN_START 0xF0000
> @@ -670,6 +673,54 @@ static int __init dmi_smbios3_present(const u8 *buf)
>         return 1;
>  }
>
> +#if IS_ENABLED(CONFIG_OF)
> +/**
> + * dmi_scan_from_dt - Find and parse DMI/SMBIOS tables from the Device Tree
> + *
> + * Checks if the bootloader has passed SMBIOS table addresses via the /chosen
> + * node in the Device Tree. This follows the standard kernel DT bindings and
> + * assumes a fixed 32-byte mapping for the entry point.

Not sure what 'the standard kernel DT bindings' are, or what you mean
by 'a fixed 32-byte mapping. You could just drop this sentence, I
think, or otherwise, describe that the DT property gives us the
physical address of the SMBIOS3 entrypoint structure.

> + * Returns true if a valid table is found and successfully parsed.

if a valid entry point is found

> + */
> +static bool __init dmi_scan_from_dt(void)
> +{
> +       struct device_node *chosen;
> +       const __be64 *prop;
> +       char buf[32];
> +       void __iomem *p;
> +       bool dmi_available = false;
> +       u64 addr;
> +       int len;
> +
> +       chosen = of_find_node_by_path("/chosen");
> +       if (!chosen)
> +               return false;
> +
> +       prop = of_get_property(chosen, "linux,smbios3-table", &len);
> +       if (prop && len >= sizeof(u64)) {
> +               addr = be64_to_cpup(prop);
> +
> +               p = dmi_early_remap(addr, 32);
> +               if (p == NULL)
> +                       goto out;
> +
> +               memcpy_fromio(buf, p, sizeof(buf));
> +               dmi_early_unmap(p, 32);
> +
> +               if (!dmi_smbios3_present(buf)) {
> +                       dmi_available = true;
> +                       goto out;
> +               }
> +       }
> +
> +out:
> +       of_node_put(chosen);
> +       return dmi_available;
> +}
> +#else
> +static bool __init dmi_scan_from_dt(void) { return false; }
> +#endif /* IS_ENABLED(CONFIG_OF) */
> +
>  static void __init dmi_scan_machine(void)
>  {
>         char __iomem *p, *q;
> @@ -718,6 +769,13 @@ static void __init dmi_scan_machine(void)
>                         dmi_available = 1;
>                         return;
>                 }
> +       } else if (IS_ENABLED(CONFIG_OF) && dmi_scan_from_dt()) {

Please drop the IS_ENABLED() here, and fold it into dmi_scan_from_dt(), by doing

if (!IS_ENABLED(CONFIG_OF))
    return false;

at the beginning. This removes the need to provide two different
versions of dmi_scan_from_dt().


> +               /*
> +                * If EFI is not present or failed, try getting SMBIOS
> +                * tables from the Device Tree.
> +                */
> +               dmi_available = 1;
> +               return;
>         } else if (IS_ENABLED(CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK)) {
>                 p = dmi_early_remap(SMBIOS_ENTRY_POINT_SCAN_START, 0x10000);
>                 if (p == NULL)
> --
> 2.51.0
>

