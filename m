Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F0DCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 07:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNxFi0i3Eh2p+y16pwvSqh55C8YjwWwX1e+4QDG9pEw=; b=mhWouuWHtJDZb9UN33ciWKqdg5
	9y3wUwXWAwbzhJH7L1rPWCO4vvf6o/+hoc6ecf+IlITUAgPLXd9+V92G9wpc+OmNyhyojMjpzOOqM
	Q0yyZnNjxIBvNp3vJcRq+zIdNQ64ouIizf92NanF2LJKg6b1Y6ALYzwK9A6ZceShwPiz9DdJGKJbQ
	7EhHIIHOOmrv6Nz1qm9/nHiv9vymJ4Eqi7YT+bDpcUAYu9oV89y++7PC4VGI3eLPqYfd9WC+OMulb
	z6xr1nz9UNFKjAyWvI814e8GXzTYLmiwnv4ZRRaCuLnfn49Q8qx6OFM5BpFmthXaLCULJKQ7sl4JR
	IFPucqqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMi1K-0000000G0ZG-1pxJ;
	Tue, 12 May 2026 07:59:14 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMi1H-0000000G0Yb-2uSg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 07:59:12 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-434e69e943bso3925015fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 00:59:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778572750; cv=none;
        d=google.com; s=arc-20240605;
        b=gSsiTLlMevJU1XYG++ihxAXDXuZIUQ9ydSTQ+tnD8it8AIQpoDU0PZeh2bUhsjePDH
         mvnwqCAbove4QBq39n0Rf1RBqyuhrC4E8B/QZ69y/iQPyY8d64hmPM2q6JQmx9iOSFMp
         W3xVOejJ9GqxegDCHo50GHaMql5pfVE5gIkhuZdLHbOfUlnha5Nhzwz66h9SN5TBv4cQ
         bsY0Vasys5PCI9CWDdjUi3IEaDMRULwSCWj5C3z802TlM32gSpxiy2z+CedrKMjAQXLH
         P+X+mmu/H4ilRlMMZ516XEXq4VjwTyPt9q8WzDOyj3l2+TGK68YNMQ3CA8EppwuQbzQd
         5Aog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GNxFi0i3Eh2p+y16pwvSqh55C8YjwWwX1e+4QDG9pEw=;
        fh=SieTQheVuZS969dWjbCNWK/Mm1snMwSRREnX4n7OZao=;
        b=MjbddC600mztqz/qHhnQrGleKYMCuMr1TcpX6kF9fiqM4Xm+NTL8ivTNgnt1kW7oWw
         CtCILKrbIs7TbjXHHj2NXfLxkN9zjDSwS5UwNzDqCSOY9QiYeRpQWVxF+29ABImUHti8
         tm03aq9jSjF6ar4Z+0S7wct5Al1dLbZMCulQnfF3Bmco/cblVH3oJAexQkwAL8DNcr3A
         8jrnZiUuCSV1p/JgFuC+oun5c0cTkppequi+bMZtf2QmLshnXOqXTG8+3TKLOkX5iiqH
         StqCbFo8mR/CqzO8TqFBLWLMw2jN2+/vi6UAjKGmAFEpk1L8LsRD/O7WQSWp5JGUmnVV
         wFvQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778572750; x=1779177550; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNxFi0i3Eh2p+y16pwvSqh55C8YjwWwX1e+4QDG9pEw=;
        b=CcZw9OPhyHddhY4TcpGNLNzdyNk6Oji/Ga5pP7mrws1YFPEmN+nanH5TvTRuw0oC0i
         OA2kOHhaeLzGJ/5P91RMI9b5gn0yIyQUssC70qDuyzdNMNfKh7hEg2c9dzTqTsqQg9F/
         tDl0b80yWrlttVEIEHVRUtCxfmUC+HXNAJEBklRdOZauZ/r64ejjqIKgtIlWmLHPJoRm
         fGsMzRKaY40WZdfwIe7fqBL/5SZGVLiWUwQ1UGSVxXCYQPgfBkzzgRD/bS7wCvZZKMzj
         TqMtsByn2IHzomjidIQUUnZvS7ek/dOzRl0r7wFLQeNq+1ZgjJrIMYt5TEnvG6Oowo3U
         ntfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778572750; x=1779177550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GNxFi0i3Eh2p+y16pwvSqh55C8YjwWwX1e+4QDG9pEw=;
        b=iPluy/84ppfYamOB139MBIw3AMOrnp5y7oy7MmyEGqiRLZW9257Vhcq3W8eGEyC7g2
         E7KPJFGF5y7QmzzlPM9N7GGiZHImxpdJXIUyPHdkAKy/hoHRxq8ELlGTvgqJylDZ6r79
         Ri9kBCfZbn5qzLSrWY0t9NmjhAlG5cNGe3uOug8v01Ltwljm+Wht5NeTlbYhgmXOUjc/
         i2eUJQVZ1fY0gouEY9FfDWF1+5uvdR26xKzaAiCagu/XxbpWcQliqP1KM6Ezog4ogUPJ
         KM6rJuCRAzzr2KGwN2ZMOjoX0G9Nx8ehXvYV6vh9UH1Nus5Dl9hc0RlRiAG+rMFfWbct
         rS4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8LliaFltM4lhKkRJCu57LC+MLwfXtXjroFHvHxLD4wN8LSaQHhIEHgUMSq/L++grnC69dVkGREJ8XVKhisjaaa@lists.infradead.org
X-Gm-Message-State: AOJu0YzpDOz9CLTGsSXDdfBwpwIpO3kqgGYPThWQmBl5YKd/iOlIzxkb
	O9AQ7WKox9kPjsco7smwY5lRt03PRRxCaFtSFUK3wRY+tm6go41zdwvmuf+R4iY7u8tBFoVhbks
	3/FK1BG5diwEkF7b0qcmUaq63ejZ1vSk=
X-Gm-Gg: Acq92OFlJUDyXoH6+X/o+X8c0jYcvhKYsK2IzdvVCVoiuOWf31tsLCSprCFowms1ym/
	GRPALnCF66zwYLvuz3n/qVBm9asjBPlszAQiM/kIMMNOBl7IhWb5ehmfUVXm+lFjCh8Nmcmw2F7
	UuP/zsD6fCYdHKnov3Z3M9bl0IHtIBpbhSXtFeSsAX45MaQYUDgnOVIai/YleNs/tZV+r6zIby5
	Qx5qSUn8TkrhMRGDb/8aien7jzMoIpklS9a5eaP9OwxNRhzuPcnQlWgpK079Sx//qq3KnHIAvvC
	uWQQAy3adBvAIUDWdgpUL07sM0z+OM2a6l4yHA==
X-Received: by 2002:a05:6871:3412:b0:42f:af81:2765 with SMTP id
 586e51a60fabf-434f69a0b03mr16855497fac.16.1778572750275; Tue, 12 May 2026
 00:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260512060627.3781329-1-danishanwar@ti.com> <20260512060627.3781329-2-danishanwar@ti.com>
In-Reply-To: <20260512060627.3781329-2-danishanwar@ti.com>
From: David CARLIER <devnexen@gmail.com>
Date: Tue, 12 May 2026 08:58:59 +0100
X-Gm-Features: AVHnY4KyYcOEEwQtm4OTa_bKSqp7vmL-5pqMaYZfRIc_VgOTVcf64VUdTb9yyXI
Message-ID: <CA+XhMqykBWcMdk+iNnOtUxM4MX6jpDyUwfuAVZFbjAShO9_v7Q@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] net: ti: icssg: Derive stats array lengths
 from ARRAY_SIZE
To: MD Danish Anwar <danishanwar@ti.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Roger Quadros <rogerq@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jacob Keller <jacob.e.keller@intel.com>, Meghana Malladi <m-malladi@ti.com>, 
	Kevin Hao <haokexin@gmail.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_005911_744731_B1991A42 
X-CRM114-Status: GOOD (  25.69  )
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

Hi MD,

On Tue, 12 May 2026 at 07:06, MD Danish Anwar <danishanwar@ti.com> wrote:
>
> Replace the manually maintained ICSSG_NUM_MIIG_STATS and
> ICSSG_NUM_PA_STATS constants with ARRAY_SIZE() expressions derived
> directly from the corresponding stat descriptor arrays, so that adding
> new entries to icssg_all_miig_stats[] or icssg_all_pa_stats[] no longer
> requires a separate update to a numeric constant.
>
> To make this self-contained, break the circular include dependency
> between icssg_stats.h and icssg_prueth.h:
>
>   - icssg_stats.h previously included icssg_prueth.h (transitively
>     pulling in icssg_switch_map.h and ETH_GSTRING_LEN).  Replace that
>     with direct includes of <linux/ethtool.h>, <linux/kernel.h> and
>     "icssg_switch_map.h".
>
>   - icssg_prueth.h now includes icssg_stats.h, giving it access to
>     the ARRAY_SIZE-based ICSSG_NUM_MIIG_STATS and ICSSG_NUM_PA_STATS
>     before they are used in the prueth_emac struct and ICSSG_NUM_STATS.
>
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> ---
>  drivers/net/ethernet/ti/icssg/icssg_prueth.h | 3 +--
>  drivers/net/ethernet/ti/icssg/icssg_stats.h  | 7 ++++++-
>  2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/e=
thernet/ti/icssg/icssg_prueth.h
> index df93d15c5b78..e2ccecb0a0dd 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
> @@ -43,6 +43,7 @@
>
>  #include "icssg_config.h"
>  #include "icss_iep.h"
> +#include "icssg_stats.h"
>  #include "icssg_switch_map.h"
>
>  #define PRUETH_MAX_MTU          (2000 - ETH_HLEN - ETH_FCS_LEN)
> @@ -57,8 +58,6 @@
>
>  #define ICSSG_MAX_RFLOWS       8       /* per slice */
>
> -#define ICSSG_NUM_PA_STATS     32
> -#define ICSSG_NUM_MIIG_STATS   60
>  /* Number of ICSSG related stats */
>  #define ICSSG_NUM_STATS (ICSSG_NUM_MIIG_STATS + ICSSG_NUM_PA_STATS)
>  #define ICSSG_NUM_STANDARD_STATS 31
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_stats.h b/drivers/net/et=
hernet/ti/icssg/icssg_stats.h
> index 5ec0b38e0c67..b854eb587c1e 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_stats.h
> +++ b/drivers/net/ethernet/ti/icssg/icssg_stats.h
> @@ -8,10 +8,15 @@
>  #ifndef __NET_TI_ICSSG_STATS_H
>  #define __NET_TI_ICSSG_STATS_H
>
> -#include "icssg_prueth.h"
> +#include <linux/ethtool.h>
> +#include <linux/kernel.h>
> +#include "icssg_switch_map.h"
>
>  #define STATS_TIME_LIMIT_1G_MS    25000    /* 25 seconds @ 1G */
>
> +#define ICSSG_NUM_MIIG_STATS   ARRAY_SIZE(icssg_all_miig_stats)
> +#define ICSSG_NUM_PA_STATS     ARRAY_SIZE(icssg_all_pa_stats)
> +
>  struct miig_stats_regs {
>         /* Rx */
>         u32 rx_packets;
> --
> 2.34.1
>

One thing that caught my eye: icssg_all_miig_stats[] and
  icssg_all_pa_stats[] are 'static const' arrays in icssg_stats.h with
  ETH_GSTRING_LEN name buffers per entry. Right now only icssg_stats.c
  and icssg_ethtool.c pull them in. After this patch icssg_prueth.h
  includes icssg_stats.h, so every .c in the driver (classifier,
  common, config, mii_cfg, queues, switchdev, ...) ends up with its own
  static-const copy of both tables.

  Would a static_assert() work for what you're after? Something like:

    static const struct icssg_miig_stats icssg_all_miig_stats[] =3D {
        ...
    };
    static_assert(ARRAY_SIZE(icssg_all_miig_stats) =3D=3D ICSSG_NUM_MIIG_ST=
ATS);

  next to each array, keeping the numeric #defines as-is. Then 2/2 fails
  to build the moment a new entry is added without bumping the count,
  which is the case you're guarding against =E2=80=94 without touching the
  include graph.

What do you think ?

Cheers.

