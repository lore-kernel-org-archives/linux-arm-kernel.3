Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8FAF3D605
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 16:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WxRWrohRC+fNvhhMsjBNKWfMlLneWiOcUehlHfN3ctw=; b=ofCRShwsduYpg7my/Wz88/UyaH
	Vx887u/Om/kRUu54rfILMe0NhMjN8Hgh/CLpbf9P7V9NGpJ2vkHy8nTT8DX1b8FkFrYU5mk6deHr0
	TUQesAmsP2bTx17a7vhOLDL54pU7vkV/j8zDneykIMTRNoRQjTaF1wGplrFluiT3mmnt+G5Nt1eT/
	+lEt5jLfk0sNINPhSruPMtMPPq9OSPxV43hsG+7SAKcIscPm99ThDOdM/I1JEGn6c272X/V3lNn7G
	ULPLRbmBHSFxssDs+jKOCASnL9KAj91HEm+V1P9kEA2K2tUt6ttxpT1Yn4dnFWsf3MqHyL4cOPVT1
	atYzdqzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6sqg-0000000A6SX-49fv;
	Sun, 29 Mar 2026 16:18:51 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6sqe-0000000A6Ry-2zFh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 16:18:50 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-467161c4a1cso1132941b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 09:18:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774801127; cv=none;
        d=google.com; s=arc-20240605;
        b=guiMtbkHJ0XSsCXQPLOeaQV7cUlQzVc0IGTbhU9KaTJQatqopqPW2MWM/fAyffpmZX
         p+LE6j0K+5WMpHhqtv1WnT8VgGVTRUoW8L+lAMoicuLMn3W0VPn1OH6LmKV4ffai/kbt
         6G9rKmDBMrNY60fCqfDtlJzSL1yzovpHl4LwGJIS7H34iuT/DzdsiWay3X+TcqzoZ7Ew
         hQpii+5sFpu8tPN+o4Qkl8aZVnJzkIRNu4ETCOCOj6XsFO2rC6G4e01hjOxyh6nwLqqe
         RTcqqrC6KT/YWtR1KM1jkBkQcwCw2rtmbMDdugL5j5xNhq7FoAL5SHSP6OaIxkxmyaLT
         r46g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WxRWrohRC+fNvhhMsjBNKWfMlLneWiOcUehlHfN3ctw=;
        fh=8elmKl0GbyI50izrEuumPj9Z5ur+V3fnB3HhnZAHGsA=;
        b=Kbu2fzUAC7y99j9ijUPEPSHenOI4VBE8v9gZiD7AUu3jw0rlFgiTY9Kvdi9mE0My1R
         ZcAbdkns68cipv+oClgbmK3GW5MJzRHnAdh0sCIgLOkgbmZ3mp1qQRM520SfKiJJeb5A
         aYVumMhXFiWXbsx53Kb5U9FM3gcOjnLMUU9Yr7lsTHIU3C7NRw1QY3O3jasXShUqRShZ
         eAStjB6+iiEikmv9RPVOx/1hK+qGfiVJAbvN+vfjGyjvInBxDqvksYwFx9Gy0ohQUR4R
         JlWi9zNePosZKdVDk7kK4mFhhmHkxMwm7zhFyPVNiBbnjFffwY+lH4q0m1P8HC31lRdF
         bS0A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774801127; x=1775405927; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WxRWrohRC+fNvhhMsjBNKWfMlLneWiOcUehlHfN3ctw=;
        b=Rut/HWfig/cc1Ipr7TVcuvR3LSnQPWagOAb9SP/RPNnVJrXFXJLXDmCKk2F/Te/ZKx
         I6k71d/ZkAwFoJnK0qePdbntAP+899caA+1RtHYbGelewpzZHYv2N4PlGdDgUAVkPmqa
         +R7/NSQmQZmGr3Ku7njfD7QQfiJyS4yFHINfX0nZqAZneR/EIDAnTS1Bs/yQEvX6ftfZ
         buPUoSa7YSqflJcs8aFNpnSSFqGCz0TK+HiEp5rm3dNwR5VomuV555NT/mNO29UPiuoT
         LPJ1g5TjkAFBfZ8mh2Q1CtCsCTEf9Dt99Cua1E+92fLQ+Djcro6D1YLaZvprwI4Z9XuO
         xO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774801127; x=1775405927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WxRWrohRC+fNvhhMsjBNKWfMlLneWiOcUehlHfN3ctw=;
        b=OkeB1wMfhlN3wJqnEdsP/cApEuAzvby4C1TUc6nNK7PAoNNQW3glDYJPnAg4otW3Vy
         A1XXUvdY0VPpr7z0WsiMROheIr/DbhNvrf4i+q9wDggT6xDankEmooDjRyQy58l72ZiX
         yw5foX5gxiJALgg737jkYGSkDyJwN7or6yG4Mq8OY1IOsoB9n9ykoJ14IZCa8ubNFbyg
         ZExipL2EpTZAh4yztpBk2yeqsDWONio2WnFLJX6tduyYzue+w+vdVjO0dJpmG9Q3qCqe
         ArS5kuMWeU2VwnWYW43AN5Bru1U9G6NngDbv+Obt9IkZ2pwSuFzEZai4ssKoRLVWJT9H
         3SWg==
X-Forwarded-Encrypted: i=1; AJvYcCVyGtz1NRe+7GB3LT9GzxYXaXO8PmXj1gIzKs4gPyB1cKILczmNe80ExGbT2iaQ7fIE7l7B+KumjD+ltpIwcdq9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7M6e4pTS2GJQ+MEBagd1fcBGhcIrfto7lL2pSgPKSR3y0syW8
	RfwKdh+OJQ4dEzSgaMzjKgKGM5jSPBldJb3a4r8mz+NdDihsCdE1zVR5YcFKFevx6LjC04/dH/L
	MTyGsUIcOe6oliCGjjLPdm8dpbL/kaFY=
X-Gm-Gg: ATEYQzw0WrFqCz8be/e33Ggb0LZmhNLZcNJtqFEve4d1q8eHfxRKlwwqmK6VzzHblmu
	m1UtSBHAOQYT3yG+MmqN5xhILwA92+1FPCr32z6C7SjLuvhbNiDfcoHAA5DSppl7e9F8ukE6UWc
	Lg1VC8J35zjQ9soN6e1Gx47sAr9we0XOJ0J/EmukclNz1vnfCTi1tji0xT9kwx52YkGORNcXtdI
	78cIo7YPLBUvkHQAWz3lrTEd/yaafImNS8PRPexi18AtucNsP9kasn8Jr38R7l8h2yXyNK1OtYB
	G+8CgYrs
X-Received: by 2002:a05:6808:1909:b0:466:f25d:3281 with SMTP id
 5614622812f47-46a8a535f24mr4527393b6e.29.1774801127539; Sun, 29 Mar 2026
 09:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260327151112.5202-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260327151112.5202-2-wsa+renesas@sang-engineering.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 29 Mar 2026 11:18:36 -0500
X-Gm-Features: AQROBzAT0Y7MQA0Vu0exbVKBXS_ASbnND8ZlhVVTpfO0frVJ0Okq55qzNtMBYvo
Message-ID: <CABb+yY3J2T5c4=dGaqPYi3L=88zgTqRn6AJwxBJ9Sqx6aDH8jw@mail.gmail.com>
Subject: Re: [PATCH v3] mailbox: remove superfluous internal header
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Peter Chen <peter.chen@cixtech.com>, 
	Fugang Duan <fugang.duan@cixtech.com>, 
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_091848_921983_01F860AC 
X-CRM114-Status: GOOD (  21.30  )
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

On Fri, Mar 27, 2026 at 10:11=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Quite some controller drivers use the defines from the internal header
> already. This prevents controller drivers outside the mailbox directory.
> Move the defines to the public controller header to allow this again as
> the defines are not strictly internal anyhow.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>
> Changes since v2:
> * rebased to 7.0-rc5
> * add tag (Thanks, Daniel!)
>
>  drivers/mailbox/cix-mailbox.c      |  2 --
>  drivers/mailbox/hi3660-mailbox.c   |  2 --
>  drivers/mailbox/imx-mailbox.c      |  2 --
>  drivers/mailbox/mailbox-sti.c      |  2 --
>  drivers/mailbox/mailbox.c          |  2 --
>  drivers/mailbox/mailbox.h          | 12 ------------
>  drivers/mailbox/omap-mailbox.c     |  2 --
>  drivers/mailbox/pcc.c              |  2 --
>  drivers/mailbox/tegra-hsp.c        |  2 --
>  include/linux/mailbox_controller.h |  5 +++++
>  10 files changed, 5 insertions(+), 28 deletions(-)
>  delete mode 100644 drivers/mailbox/mailbox.h
>
> diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.=
c
> index 443620e8ae37..864f98f21fc3 100644
> --- a/drivers/mailbox/cix-mailbox.c
> +++ b/drivers/mailbox/cix-mailbox.c
> @@ -12,8 +12,6 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>
> -#include "mailbox.h"
> -
>  /*
>   * The maximum transmission size is 32 words or 128 bytes.
>   */
> diff --git a/drivers/mailbox/hi3660-mailbox.c b/drivers/mailbox/hi3660-ma=
ilbox.c
> index 17c29e960fbf..9b727a2b54a5 100644
> --- a/drivers/mailbox/hi3660-mailbox.c
> +++ b/drivers/mailbox/hi3660-mailbox.c
> @@ -15,8 +15,6 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>
> -#include "mailbox.h"
> -
>  #define MBOX_CHAN_MAX                  32
>
>  #define MBOX_RX                                0x0
> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.=
c
> index 003f9236c35e..22331b579489 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
> @@ -23,8 +23,6 @@
>  #include <linux/slab.h>
>  #include <linux/workqueue.h>
>
> -#include "mailbox.h"
> -
>  #define IMX_MU_CHANS           24
>  /* TX0/RX0/RXDB[0-3] */
>  #define IMX_MU_SCU_CHANS       6
> diff --git a/drivers/mailbox/mailbox-sti.c b/drivers/mailbox/mailbox-sti.=
c
> index b4b5bdd503cf..b6c9ecbbc8ec 100644
> --- a/drivers/mailbox/mailbox-sti.c
> +++ b/drivers/mailbox/mailbox-sti.c
> @@ -21,8 +21,6 @@
>  #include <linux/property.h>
>  #include <linux/slab.h>
>
> -#include "mailbox.h"
> -
>  #define STI_MBOX_INST_MAX      4      /* RAM saving: Max supported insta=
nces */
>  #define STI_MBOX_CHAN_MAX      20     /* RAM saving: Max supported chann=
els  */
>
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index e63b2292ee7a..9d41a1ab9018 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -18,8 +18,6 @@
>  #include <linux/property.h>
>  #include <linux/spinlock.h>
>
> -#include "mailbox.h"
> -
>  static LIST_HEAD(mbox_cons);
>  static DEFINE_MUTEX(con_mutex);
>
> diff --git a/drivers/mailbox/mailbox.h b/drivers/mailbox/mailbox.h
> deleted file mode 100644
> index e1ec4efab693..000000000000
> --- a/drivers/mailbox/mailbox.h
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -
> -#ifndef __MAILBOX_H
> -#define __MAILBOX_H
> -
> -#include <linux/bits.h>
> -
> -#define TXDONE_BY_IRQ  BIT(0) /* controller has remote RTR irq */
> -#define TXDONE_BY_POLL BIT(1) /* controller can read status of last TX *=
/
> -#define TXDONE_BY_ACK  BIT(2) /* S/W ACK received by Client ticks the TX=
 */
> -
> -#endif /* __MAILBOX_H */
> diff --git a/drivers/mailbox/omap-mailbox.c b/drivers/mailbox/omap-mailbo=
x.c
> index d9f100c18895..5772c6b9886a 100644
> --- a/drivers/mailbox/omap-mailbox.c
> +++ b/drivers/mailbox/omap-mailbox.c
> @@ -22,8 +22,6 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/mailbox_controller.h>
>
> -#include "mailbox.h"
> -
>  #define MAILBOX_REVISION               0x000
>  #define MAILBOX_MESSAGE(m)             (0x040 + 4 * (m))
>  #define MAILBOX_FIFOSTATUS(m)          (0x080 + 4 * (m))
> diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
> index 22e70af1ae5d..636879ae1db7 100644
> --- a/drivers/mailbox/pcc.c
> +++ b/drivers/mailbox/pcc.c
> @@ -59,8 +59,6 @@
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  #include <acpi/pcc.h>
>
> -#include "mailbox.h"
> -
>  #define MBOX_IRQ_NAME          "pcc-mbox"
>
>  /**
> diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
> index ed9a0bb2bcd8..2231050bb5a9 100644
> --- a/drivers/mailbox/tegra-hsp.c
> +++ b/drivers/mailbox/tegra-hsp.c
> @@ -16,8 +16,6 @@
>
>  #include <dt-bindings/mailbox/tegra186-hsp.h>
>
> -#include "mailbox.h"
> -
>  #define HSP_INT_IE(x)          (0x100 + ((x) * 4))
>  #define HSP_INT_IV             0x300
>  #define HSP_INT_IR             0x304
> diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_c=
ontroller.h
> index 80a427c7ca29..16fef421c30c 100644
> --- a/include/linux/mailbox_controller.h
> +++ b/include/linux/mailbox_controller.h
> @@ -3,6 +3,7 @@
>  #ifndef __MAILBOX_CONTROLLER_H
>  #define __MAILBOX_CONTROLLER_H
>
> +#include <linux/bits.h>
>  #include <linux/completion.h>
>  #include <linux/device.h>
>  #include <linux/hrtimer.h>
> @@ -11,6 +12,10 @@
>
>  struct mbox_chan;
>
> +#define TXDONE_BY_IRQ  BIT(0) /* controller has remote RTR irq */
> +#define TXDONE_BY_POLL BIT(1) /* controller can read status of last TX *=
/
> +#define TXDONE_BY_ACK  BIT(2) /* S/W ACK received by Client ticks the TX=
 */
> +
>  /**
>   * struct mbox_chan_ops - methods to control mailbox channels
>   * @send_data: The API asks the MBOX controller driver, in atomic
> --
> 2.51.0
>
Applied to mailbox/for-next
Thanks
Jassi

