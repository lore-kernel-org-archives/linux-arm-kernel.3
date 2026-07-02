Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C232FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 21:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IyRoxpXj+Ka4dI+Kbzu9PuHOF8FtaKbvbbmQn5I6obY=; b=nGhijlXJLU/5d9Z06ueD4qxMS/
	yzGvIDwAKpna8g8SuhJIBPYvhBNgORpKqGmVzFYq3EAL8anWDS6+HlNKdm1laUiX0WZmUUTMygzml
	2ftawmadXLhNspet8nyN3sQA1KePFrOwJk9xkL/Mq6M7JWRuMnxXpjuXLj99A0fFrebTG+ESZuNeK
	HW5BrGxUCRtC9VSAwwaBMonCMlUq/GzFnRj8KdMPX5LaEwN4bGzj7U8yBPVglURL9fjF3Feek0RzF
	0cY7PGI/qJlsml1+hBZbyygY6FezFucAICGGJnObsNJQwsG/KTOlwBfmVpaaeyZjJKdtdbn+XrklQ
	pFyil90w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfOgx-00000005VAX-1ziF;
	Thu, 02 Jul 2026 21:11:27 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfOgv-00000005VAB-29Hl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 21:11:26 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-691c5776f95so683779a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 14:11:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783026683; cv=none;
        d=google.com; s=arc-20260327;
        b=aOp6AdJL7QfXbmDHjCM/r9O7Cnmsm9XDYowccZIDKtJVXwdxv9wzRlpAhGEaflxU77
         TzoFeAJf2dr3kus6yeu3tGnILqloB7E8Q79e8lB4hx0AvUQ5c9aUv75elWmSywv7ze8l
         TNJIoJd4tglkZRcFUbdW6rm1Z1EA+xg9LVC3uoBKj+YoOH771rc/DyH8xUNx/kBL35/7
         uvADhsaGjP5EdAj1MwtBpiOiqeRa9zX60wktEyGYrKmOVGhb+hD1nCe9MmTLfLMVzfrf
         3QKS2dPn+1GEjDu2B5wVrKp5ab9kGdNWhnlIoY+Bz4ZBp8vWM2xlmrqDDuDPt9ip9SU0
         0suw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IyRoxpXj+Ka4dI+Kbzu9PuHOF8FtaKbvbbmQn5I6obY=;
        fh=Jc8J7QETDy9bUUHao77gIGHtrJapThLuu/IA+q6fNm4=;
        b=N/zeprIIwqjIQ1UNqt8yLn7FzDj+zZlCsYw8bUajWHnwJVDK6YN39Der5Dg89CwdcG
         DYSutbuz9fNnJgZPttIovMAVOhWkIGZTl8tMq2fg9MIEqqjFz2mZj51EcYWDu7174PWH
         n4/PKzwlfQLay1/No7kUicIn12OzAoKsTGIOJZwTesIuBiu++CMEnfcytx/AhJdPC84Z
         maxE2mWEgP7IdRp6IQ9Y5OCjqLWi5zEXI0/eGWXhY9ZFDXUU7GWB3gUeZ8xdv4HnoEjt
         ARbXiK1lssNzVq/W488P/tu/+eek4M3KGgKj8slA9Wpdx5LAQGZ+EF+tLFahcKmmHKx7
         H5MQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783026683; x=1783631483; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IyRoxpXj+Ka4dI+Kbzu9PuHOF8FtaKbvbbmQn5I6obY=;
        b=RlovYu8y+tdCyTn2GHFEiKWP+ZXCXWG+GxyLXZZJpQroHpJMcM4Y1/16H4MaJDiMv/
         YF5SMWA+qNfyXXwBGualTnKFBNvpKMMZVH2+lto9SIVMtzGAJbvpZT9JldKGt7ABr115
         ToXrUTZxB+fjFZIn4ce7MmTNHhtnbZviKqFF6fabgVXMFFbP+UOflsleEINWZCf3ch4I
         00XaNvwH6Ug75j+nGRamfNa2VprAltQSuG0xN1Tw++b9WCZpghmW503zaNJlWZnsMM2+
         ZcPdis0tJVlHsKSAtcgkn+3zb3enidqAVoVMDoRY1rTG251l26YN2kUPTj+uNBpCrWQx
         LT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783026683; x=1783631483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyRoxpXj+Ka4dI+Kbzu9PuHOF8FtaKbvbbmQn5I6obY=;
        b=dA6smal/4ocOiv/1fcwisfKLE8w5lnCnoNNtA2kmlp5IqN+wKEXcyfvU2tWaxuWvw4
         sYs9mu5FkbNXA9uZzR0NNqQmqdQGaF6fijJ0+X0HQI/ATMxI2MfI6zb/nAzWng7EChsT
         SYPoPhgcC8mHkAgzJtRUGTSOzwwkFJyOT6Dp/WGRBcCze3TmG20pi83QinbkeL17IklG
         ITH5eFl85Q8CImZKzY9WVm26wJukH916V72nmDM/G6YQbTv5C7GPgSeqtB/Uq5BfFrIQ
         CcPX9JyULN6z6+LXFyKa19L2f7yl3MGFOdYMhyFDS0jfswxMhBwiWLSdnDaQGZN6rrfz
         f6BQ==
X-Gm-Message-State: AOJu0YydpLUrDWR5mlK7XMX45bOYFJtWFeSBTOrXAZ9BBX/tApAnlZAe
	DtXEWfa1HZIF8lHGEEjGojY7aEnH1SimaDJtQ/KMPTZaaMblR1BewbSCqFnuWUxWkWN6i4C1qdy
	CekzxQURddwgsHC6PP36ZbgxoNdeVZig=
X-Gm-Gg: AfdE7cni8jAgf6o17yAk7ZgAN0FPCTzDcq9gVoInTR/cqIcJrFohhYvc782jC3oe/za
	BbBtyAxZ8bo2iZJtM9AuBxJMjyDCNlgAzelCVYiXAnUzwiXMX+u7vhTtNy76u6yzvgt/teaCvpm
	Ewm9G7erNAlUMrQo0iUFL2qxemVE63qe7ZVlxriWehRdnm48LgCaKbkiOyue9zns0Jg7lOwgMTg
	yD5ssqaG0DXZrUBNxePy+06E2qgDYBSDjuq6aywoU2UMsQ1xoQURJC0bG/JFMRxUn3rSr4=
X-Received: by 2002:a17:907:9694:b0:c12:34ed:da14 with SMTP id
 a640c23a62f3a-c12aa4ac861mr368442166b.64.1783026682966; Thu, 02 Jul 2026
 14:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260608153421.26910-1-dbgh9129@gmail.com>
In-Reply-To: <20260608153421.26910-1-dbgh9129@gmail.com>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Thu, 2 Jul 2026 17:11:11 -0400
X-Gm-Features: AVVi8CeOkNqGWbRMwHYX2Z7L7hQPP4OnUBV_6qxEsbgc9_Nd2zmTjOMiDTZgm8o
Message-ID: <CACrCO_W7jHY6WMZbPsUHHHWFK-yBHayS-5UcQeeyOGiFUcV2eQ@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: mstar: Drop OF node references after mapping
To: Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_141125_569815_1E32E911 
X-CRM114-Status: GOOD (  20.05  )
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

Hi,

Just a gentle ping on this patch.

I would appreciate any feedback when you have a chance to review this.

Thanks


On Mon, 8 Jun 2026 at 11:34, Yuho Choi <dbgh9129@gmail.com> wrote:
>
> of_find_compatible_node() returns a device node with its reference
> count incremented. of_iomap() uses the node to map the register range,
> but does not consume that reference.
>
> Drop the node references after mapping the smpctrl and l3bridge
> registers.
>
> Fixes: 312b62b6610c ("ARM: mstar: Add machine for MStar/Sigmastar Armv7 SoCs")
> Fixes: 5919eec0f092 ("ARM: mstar: SMP support")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---
>  arch/arm/mach-mstar/mstarv7.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/mach-mstar/mstarv7.c b/arch/arm/mach-mstar/mstarv7.c
> index 274c4f0df270..64262b8f10a0 100644
> --- a/arch/arm/mach-mstar/mstarv7.c
> +++ b/arch/arm/mach-mstar/mstarv7.c
> @@ -86,6 +86,7 @@ static int mstarv7_boot_secondary(unsigned int cpu, struct task_struct *idle)
>
>         np = of_find_compatible_node(NULL, NULL, "mstar,smpctrl");
>         smpctrl = of_iomap(np, 0);
> +       of_node_put(np);
>
>         if (!smpctrl)
>                 return -ENODEV;
> @@ -116,6 +117,7 @@ static void __init mstarv7_init(void)
>
>         np = of_find_compatible_node(NULL, NULL, "mstar,l3bridge");
>         l3bridge = of_iomap(np, 0);
> +       of_node_put(np);
>         if (l3bridge)
>                 soc_mb = mstarv7_mb;
>         else
> --
> 2.43.0
>

