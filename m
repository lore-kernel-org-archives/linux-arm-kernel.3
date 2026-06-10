Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA28CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 06:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gp7gs+XC0EzFwQ29+WJ2/FdyGtwF8lME7kmYDPgSmxU=; b=Xmp1RC88jzMB6nzr4Z33xRr++Y
	GmR2rxHFL0MYKwrhurh6K76gnP99xwlAiVnVnTB09V8i4qVXShYUytWmB0CS8Hwcp0qWuzAKw+y+p
	Y+gtEk4Lz239QuZ6z3hkAbHv0C1w5OBh0BZ2nOhOLSdMThFnvSlUiCVmUWWzm3yLAf5ppL/3oKkyR
	kN6Gi3hEy69+yoMqqmPYBe2X/HffneXgygzCm8UAWnlTvafWyqjZy0Ee0kAmGhar3l5UIx32aCTJ/
	wo7DkQEmw8oW0zY7mgh2OgOA77r2vB8+RZ4nv7cUuTl2CF+z+fbOexSAroqynIhFmJItr34Zor6aA
	R4F1z7ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXCnv-00000006vPZ-2OIX;
	Wed, 10 Jun 2026 06:52:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXCnu-00000006vPJ-2EKc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 06:52:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 85285602C5
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 06:52:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371AC1F008A1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 06:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781074365;
	bh=gp7gs+XC0EzFwQ29+WJ2/FdyGtwF8lME7kmYDPgSmxU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lw/Zxtk/uYBjSvZYWFj6HdIOEj+NSHDSM7Z42xZclJNvYzAOKkJlN3S4ZX1iYYLfa
	 xQ7XK3CCGbC0AAf5fQOPf5l4kbcwJkt5J3000ORpx7Kt0Kvnm+nAOnnF7t/dZbioAv
	 v8B+ewve1MWTUuFEejffYYPdmStl0WBwgRTir9pfL96l7yR5cu4oStHagQ+Im6O/yS
	 o20fgBTPEBAmVnXV1dy15i5M2RxfJuzkXgW/FGjJXfhyvLQKdsZOUoItpXu5HxCjn8
	 Y56NYqxRGpOvv2o2dMebqi+y/CEIuH9KHZAK2TmrWgZMUhfUPWbSq4GvH9M4UxcSBS
	 c97GPUlCxoz8g==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39676ff4674so58762071fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 23:52:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Qp+4E4BvMalhWaXKdFa94Re8bi7dBITwaStuY4sk6+PyHSPUUKyZm0gg8IpDFaMPHFJoI3oZm1OozNq4S0eI1@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4CPhZ54ApfdVUwq3g7wxs7Ng1LDEsHrYMNFdN2SQrI4S4GQGi
	Si2eDNBniZREfQInx6MVBRYnNssIPbj44AypXr+JyBvym4pcgJ+DUfUVZ2eJn1o1zREduGbULp/
	iZd7eqfdqZkoiwBSaljCQlJAS9FgGa78=
X-Received: by 2002:a05:651c:2116:b0:396:71a5:783 with SMTP id
 38308e7fff4ca-396d08af1c7mr65181281fa.10.1781074363645; Tue, 09 Jun 2026
 23:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260609121329.1262170-1-senozhatsky@chromium.org>
In-Reply-To: <20260609121329.1262170-1-senozhatsky@chromium.org>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 10 Jun 2026 01:52:31 -0500
X-Gmail-Original-Message-ID: <CAGp9LzpBUReZtrTEKgUr-+yvB+3tcs5hw7ziC4WaMRFNa2AYpg@mail.gmail.com>
X-Gm-Features: AVVi8CfFDZy0_kkkc64au-27MTcEf01nNZPOagVpGocBD_aPXkss6uRWyZD9Xok
Message-ID: <CAGp9LzpBUReZtrTEKgUr-+yvB+3tcs5hw7ziC4WaMRFNa2AYpg@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btmtksdio: fix infinite loop in btmtksdio_txrx_work()
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

On Tue, Jun 9, 2026 at 7:19=E2=80=AFAM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> Every once in a while we see a hung btmtksdio_flush() task:
>
>  INFO: task kworker/u17:0:189 blocked for more than 122 seconds.
>  __cancel_work_timer+0x3f4/0x460
>  cancel_work_sync+0x1c/0x2c
>  btmtksdio_flush+0x2c/0x40
>  hci_dev_open_sync+0x10c4/0x2190
>  [..]
>
> It all boils down to incorrect time_is_before_jiffies() usage in
> btmtksdio_txrx_work().  The btmtksdio_txrx_work() loop is expected
> to be terminated if running for longer than 5*HZ.  However the
> timeout check is twisted:  time_is_before_jiffies(old_jiffies + 5*HZ)
> evaluates to true when old_jiffies + 5*HZ is in the past i.e. when a
> timeout has occurred.  Using OR with time_is_before_jiffies(txrx_timeout)
> means that:
> - before the 5-second timeout: the condition is `int_status || false`,
>   so it loops as long as there are pending interrupts.
> - after the 5-second timeout: the condition becomes `int_status || true`,
>   which is always true.
>
> When the loop becomes infinite btmtksdio_txrx_work() loop never
> terminates and never releases the SDIO host.
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

yes, loop continues only while there is interrupt work and the timeout
deadline is still in the future

Reviewed-by: Sean Wang <sean.wang@mediatek.com>

Thanks for fixing this long-standing  issue.

>
>         /* Enable interrupt */
>         if (bdev->func->irq_handler)
> --
> 2.54.0.1064.gd145956f57-goog
>
>

