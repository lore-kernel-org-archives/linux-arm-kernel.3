Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250DBCD98EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 00:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nsPimvOxFtNpOsrcCdC4WZqlfbRzu95KX1Bfdk2/Wx0=; b=tQRjcz6gq333u9zNHYcdnOWUeU
	gpK+8dbKpwaqKlEbE9Imte5CWsEK1E1xExqDXFcEMGmIfp3kDDyRnI75NnNYx+D2FrSAFIiPzEgFA
	oaTRUIGNkBO3utcTcc9GIUxEpRIecHqBbsc4dPycMsnX9WOpTNYxCjI2ZCMdCR8SKKGyQbSlOMpNr
	fIx41fn/uwAveal0GUvMtBKWgzflu7RnxvwzAmvEm3qu6pyQwgIXSAqrVBfSHjV0w7BIqP2vdZn1S
	3pfSMRHgVmvAYp5pA14RfUJbSoPjmcguVeIjYuAnu9rA1ZHU5RwljC5ml4eQ81t2qN2ucQQZFoO2O
	E65rxnpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZeKI-0000000GRK3-1SZz;
	Wed, 17 Jun 2026 00:40:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZeKH-0000000GRJs-1KdZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 00:40:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9DABD43DE1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 00:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A111F00ACF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 00:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781656816;
	bh=nsPimvOxFtNpOsrcCdC4WZqlfbRzu95KX1Bfdk2/Wx0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fjmCrLO3zbAroMhw9rZ3qKRetjFLhR5TLTnehcYYd1ttflKewxORMDBP18zJy1vLE
	 kGlrB/DYFYMJoTbLhIRFle9oZrJw9ryG00rbfgEU9rBYBD5uGA6O8eVhNc9IG/GlGR
	 BpR0N6tyICgTUdoVHJgpf9KxETMgMNYr+nTKb2ZZRVhhgvmcayvFh/QQWY17M0WUQu
	 W8Solnx3sSpaecaZJpyRMN5ijnxCVlXzGW8PuPqIcKfeXRnYfbX4MtJf8pdQdby+nM
	 zRJ9LJLMhk7VAmt+cH7qf7fTAXLfsDyqJT6prcWIR28JyiWl8K3Ov3ct2hJnWCRcLB
	 bznjnPwl5B7GQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-396669329fbso3906051fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 17:40:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Tmu5Niiferu7mbalfsdN5EMyqtMmFnjLWVAijI091VYqlDkGGXIfZ1jAPqlaX8lt8ZP2qSo+zacLibKlX5qHF@lists.infradead.org
X-Gm-Message-State: AOJu0YznGLyiLL4NRLw5jwNDqsmRp2T8qAx+gpel5zylm0guQiXN6+Qz
	oCL4PSpHzIkumJtx8NyVoE+pCAheINwy6J7QtIw2VePvYwPq7a+YkZ26+qwqWndL4yubSXWyE5s
	sYTgs5/NXsLHV5jU8eldV/sCCjML4CsM=
X-Received: by 2002:a2e:be08:0:b0:38b:dd55:b71 with SMTP id
 38308e7fff4ca-3996a322bd5mr2098101fa.20.1781656814764; Tue, 16 Jun 2026
 17:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260616111224.152140-1-senozhatsky@chromium.org> <20260616111224.152140-2-senozhatsky@chromium.org>
In-Reply-To: <20260616111224.152140-2-senozhatsky@chromium.org>
From: Sean Wang <sean.wang@kernel.org>
Date: Tue, 16 Jun 2026 19:40:01 -0500
X-Gmail-Original-Message-ID: <CAGp9LzpCMGr2hyVJRMehs_BD4Rk6mS2jAifWuCgBaANdqgtvqA@mail.gmail.com>
X-Gm-Features: AVVi8CePh02iDBIiYBUKoKLWcbC8GIPcYK15HYAKhoj7Eq4e84wo6CwYl-6iRWo
Message-ID: <CAGp9LzpCMGr2hyVJRMehs_BD4Rk6mS2jAifWuCgBaANdqgtvqA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] Bluetooth: btmtksdio: correct btmtksdio_txrx_work()
 loop timeout check
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Mark-yw Chen <mark-yw.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Tomasz Figa <tfiga@chromium.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
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

Hi,

On Tue, Jun 16, 2026 at 6:15=E2=80=AFAM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> The btmtksdio_txrx_work() loop is expected to be terminated if running
> for longer than 5*HZ.  However the timeout check is reversed:
> time_is_before_jiffies(old_jiffies + 5*HZ) evaluates to true when
> old_jiffies + 5*HZ is in the past i.e. when a timeout has occurred.
> Using OR with time_is_before_jiffies(txrx_timeout) means that:
> - before the 5-second timeout: the condition is `int_status || false`,
>   so it loops as long as there are pending interrupts.
> - after the 5-second timeout: the condition becomes `int_status || true`,
>   which is always true.
>
> Fix loop termination condition to actually enforce a 5*HZ timeout.
>
> Fixes: 26270bc189ea4 ("Bluetooth: btmtksdio: move interrupt service to wo=
rk")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/bluetooth/btmtksdio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.=
c
> index 5b0fab7b89b5..c6f80c419e90 100644
> --- a/drivers/bluetooth/btmtksdio.c
> +++ b/drivers/bluetooth/btmtksdio.c
> @@ -620,7 +620,7 @@ static void btmtksdio_txrx_work(struct work_struct *w=
ork)
>                         if (btmtksdio_rx_packet(bdev, rx_size) < 0)
>                                 bdev->hdev->stat.err_rx++;
>                 }
> -       } while (int_status || time_is_before_jiffies(txrx_timeout));
> +       } while (int_status && time_is_after_jiffies(txrx_timeout));
>

This patch has already been merged, so I think the series should be
respun based on the latest code.

>         /* Enable interrupt */
>         if (bdev->func->irq_handler)
> --
> 2.54.0.1136.gdb2ca164c4-goog
>
>

