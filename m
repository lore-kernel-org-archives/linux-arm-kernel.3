Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433F8F3D605
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 16:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2D8AAIpYTEqtmnoIx+/keabARVU/LrRLPgvcgxmZAZ8=; b=Bg/53flSGyxstHbZtNX1qXzmN4
	Jvqfg1L4Zqp3qt/zhhxzKMpv6mLa8/i0cax+fg2ETZzQdTlJhrR2hft1GeFXHRtJHd2VSuYLr42Ax
	jeC5EnoupXRQcv1ygYFZzyaA5QkhkkyYZNu7+A/Q4bgKtmRZ7JlztDu/kPnxFHWpE7YT0oiFuxMuK
	acZun9RI4EmIASxnKMKZJc/vJjqxWBdCX0OqQ7VUtK4gDd5JM67otZRDcw7axHqdiAKwu1vM3WmPe
	0su0HCWsU0GI72rRpzBxjzaKibInc4B1D/BA0bLgQg4+dtqsj7pOdFXU08Tu20XBtnOQrxUobii+0
	gUQa+q+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t55-0000000A7hY-19RO;
	Sun, 29 Mar 2026 16:33:43 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t52-0000000A7gL-2KaA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 16:33:41 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7d7eb85fb81so3726373a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 09:33:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774802019; cv=none;
        d=google.com; s=arc-20240605;
        b=a+q3HwHqNr5jI5c+367YyibPliP+0wDahX15Vx4JDd8YltCPrKI1kwnLhOrZpm5Blf
         njA9kSrb1/ntgLi7ogLeEswtMOuILWn7SBBTv7PABH5YOrBjqXHQ7l26q6I9i/FteDCs
         NyS59rsRjzJ1EUKSfu2yq4ZopJ2x4PJT7D0mc7V5isAeEXHGeQr22QpTqxQ9/iYhvz6Q
         Gsl536fSfDptSv/alJtllo1M4LBJcL2dhcCipOlHrB5JuzE/ufoefmF3fsXAY0X0wdEw
         Zo+2NtzsMotJ+owiFJSH3ulhD1GsaU+zl7ycH4kVtZK4OiIX0wEs5eKfx811Ezss1o9R
         L2+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2D8AAIpYTEqtmnoIx+/keabARVU/LrRLPgvcgxmZAZ8=;
        fh=O3jZJrwTysSrCpnrZjYtbnk33GrqHZgT54H6fn8w32Y=;
        b=FoKdKaV58PKE8oJc/SRwtU8EVSvGTlDWcGrLOj27r81x5KgidCrYtCk/aD5Mh7fW6w
         U59GWe8o78i/rzvoES/ZxboiCkjWrbMtPPlKHvOIQ39+HdbPSdNUzAeF22XJ3YIaliWD
         M9c/71CeFE0hrDNQVJdVOzSWIlZG7JyljNp4w5/co9dccvKJtUnq4FPIWhAoVC1igLYi
         52bxjQwNpgSIxy+Jwx/IJeAZNZSr2ss0tEzCCeuOlmWFNOCHlJoLxIQPUTxHhLUlyuS1
         WF6X1KlsJpGijjEX57xttvWkoA2WT25SWoKgpWzEoCDWZ6w7ofrCfchqh17RcMKEFh26
         fHJg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774802019; x=1775406819; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2D8AAIpYTEqtmnoIx+/keabARVU/LrRLPgvcgxmZAZ8=;
        b=mEv62bCeQOiKsMP5+msbvKY4+SZNlzLKN/vDUn9ZT4QiZqXr23LM1DKmw6slAhLWLR
         v9a0rrAdlmqn3Nmj3QoyOafXTcf+0wXF6WrVvKZsGFbMnpt/rmJ8Jq7pcibyLRxYLBQb
         ScGCjbBhfz8afYTdMdx6kV/4NIJTJY2r1s3eIyls1NCApC31hw3UUtTWy5PoOWOHYNmv
         pIYAy/pCuxtmxlBW2uKfqV+wri8wv02LHZ4n1VjTor9zNMPysqd73/8fZOzU6w0vS0tD
         51jNwNu70KveEscg56z5YG8JoX1TKBIdxFZIkkOwQVrVZMi9KwTD/wxnR4l55X3M/nEL
         ESVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774802019; x=1775406819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2D8AAIpYTEqtmnoIx+/keabARVU/LrRLPgvcgxmZAZ8=;
        b=sMrV89h8dF4OsEBlkUGTGSpv94SctXEweVNW/ZSweOhKNYjxIwcjs06mf7eWml7JTo
         5pEP+nz+PJpasV27u9DW1IV99lYE1d2b4Nva2YG/fUSorxtkLSR12+P+dH9Mner87nL9
         lknpUCd2ngRvJHvcC7ognAtixE+eCV38hIafBBbZ7Dda/E9Ttz1O9ulFlKXeRtnNmapu
         4M1fWU8DHHh+oHr1lZsO9eEzxdaz0H78NrOBwKqu7suNtk3froyZk+ISUKJgubHi3hAP
         JpKKcFV+m2jZ6BtfCukBMF+epfmazZyEElcz283ExlJvyuKVbDR41j7KTPZMy4X2X8n/
         68gg==
X-Forwarded-Encrypted: i=1; AJvYcCUCN1SoDvpW0QjoYD33rfHL4rcTf9h+uIPLgWylG+gKZ4vdUXozxiBwohaoHXfayGnxPmjErZd4Hy/AL586hlpx@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6dOCIzaP2oAbeBzGY5QkQ7nlyU3Dk8J0+U7mcYiwAVq1ClWtl
	DoMAniEZgE3+C+yxLIGmG5YvQ4bnxePTUA/zHo3sZcmdqeJVdfycSZSirGqqXwVp5TTTPsSF7dg
	+TyP38cp+YAkxZZaEVd++ErS0trwcCoc=
X-Gm-Gg: ATEYQzzVWkwqu0GyCfOLn1DDtH28eddP4bOwrW586PP/KllijOGLXQ8Ou4EILtqEEHh
	4ZB5ruwKbqWuJrYCApkutxBhGoR/x50BPN91fkH0F+f0550238LXRhoUUeqiNTyDTElNDVv00xM
	/p39vQOmn5WtuOY7B4eYNy0YvZORM5494pnJA2uBjcpza3uNBc9qqG4m7Jco7ZGIlOixzLPNueA
	LrJna3fQFLHyXdaC6MFfAFpwx9PzBWSn+GCoDeVuhhbNXH4jG/YVyXW2fsUeDUTyl57djpSLB+L
	+gL5Z9bQ
X-Received: by 2002:a05:6820:2005:b0:67e:33a0:3dcc with SMTP id
 006d021491bc7-67e33a046d9mr37979eaf.22.1774802019433; Sun, 29 Mar 2026
 09:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260327220040.53326-1-jassisinghbrar@gmail.com>
In-Reply-To: <20260327220040.53326-1-jassisinghbrar@gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 29 Mar 2026 11:33:27 -0500
X-Gm-Features: AQROBzCJaBkenSWLbaMyUjoFd9_w00TbalFjVQHSf34AKH29U6wEB1C9m4WLVwM
Message-ID: <CABb+yY3KC5UqDTBxetQK44+GXsRE2bg6tdCtmbe0_v=c=x_Emw@mail.gmail.com>
Subject: Re: [PATCH] mailbox: Fix NULL message support in mbox_send_message()
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: dianders@chromium.org, shawn.guo@linaro.org, maz@kernel.org, 
	andersson@kernel.org, tglx@kernel.org, joonwonkang@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_093340_605394_3C1FB27B 
X-CRM114-Status: GOOD (  32.90  )
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

On Fri, Mar 27, 2026 at 5:00=E2=80=AFPM <jassisinghbrar@gmail.com> wrote:
>
> From: Jassi Brar <jassisinghbrar@gmail.com>
>
> The active_req field serves double duty as both the "is a TX in
> flight" flag (NULL means idle) and the storage for the in-flight
> message pointer. When a client sends NULL via mbox_send_message(),
> active_req is set to NULL, which the framework misinterprets as
> "no active request". This breaks the TX state machine by:
>
>  - tx_tick() short-circuits on (!mssg), skipping the tx_done
>    callback and the tx_complete completion
>  - txdone_hrtimer() skips the channel entirely since active_req
>    is NULL, so poll-based TX-done detection never fires.
>
> Fix this by introducing a MBOX_NO_MSG sentinel value that means
> "no active request," freeing NULL to be valid message data. The
> sentinel is defined in the subsystem-internal mailbox.h so that
> controller drivers within drivers/mailbox/ can reference it, but
> it is not exposed to clients outside the subsystem.
>
> Fifteen in-tree callers send NULL (doorbell-style IPCs on Qualcomm,
> Tegra, TI, Xilinx, i.MX, SCMI, and PCC platforms). All were
> audited for regression:
>
>  - Most already work around the bug via knows_txdone=3Dtrue with a
>    manual mbox_client_txdone() call, making the framework's
>    tracking irrelevant. These are unaffected.
>
>  - Poll-based callers (Xilinx zynqmp/r5) are strictly better off:
>    the poll timer now correctly detects NULL-active channels
>    instead of silently skipping them.
>
>  - irq-qcom-mpm.c was a pre-existing bug -- the only Qualcomm
>    caller that omitted the knows_txdone + mbox_client_txdone()
>    pattern. Fixed in a companion commit ("irqchip/qcom-mpm: Fix
>    missing mailbox TX done acknowledgment").
>
>  - No caller sets both a tx_done callback and sends NULL, nor
>    combines tx_block=3Dtrue with NULL sends, so the newly reachable
>    callback/completion paths are never exercised.
>
> Also update tegra-hsp's flush callback, which directly inspects
> active_req to wait for the channel to drain: the old "!=3D NULL"
> check becomes "!=3D MBOX_NO_MSG", otherwise flush spins until
> timeout since the sentinel is non-NULL.
>
> The only tradeoff is that 'MBOX_NO_MSG' can not be used as a message
> by clients.
>
> Reported-by: Joonwon Kang <joonwonkang@google.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Jassi Brar <jassisinghbrar@gmail.com>
> ---
>  drivers/mailbox/mailbox.c   | 15 ++++++++-------
>  drivers/mailbox/mailbox.h   |  3 +++
>  drivers/mailbox/tegra-hsp.c |  2 +-
>  3 files changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index 617ba505691d..9622369cab66 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -52,7 +52,7 @@ static void msg_submit(struct mbox_chan *chan)
>         int err =3D -EBUSY;
>
>         scoped_guard(spinlock_irqsave, &chan->lock) {
> -               if (!chan->msg_count || chan->active_req)
> +               if (!chan->msg_count || chan->active_req !=3D MBOX_NO_MSG=
)
>                         break;
>
>                 count =3D chan->msg_count;
> @@ -87,13 +87,13 @@ static void tx_tick(struct mbox_chan *chan, int r)
>
>         scoped_guard(spinlock_irqsave, &chan->lock) {
>                 mssg =3D chan->active_req;
> -               chan->active_req =3D NULL;
> +               chan->active_req =3D MBOX_NO_MSG;
>         }
>
>         /* Submit next message */
>         msg_submit(chan);
>
> -       if (!mssg)
> +       if (mssg =3D=3D MBOX_NO_MSG)
>                 return;
>
>         /* Notify the client */
> @@ -114,7 +114,7 @@ static enum hrtimer_restart txdone_hrtimer(struct hrt=
imer *hrtimer)
>         for (i =3D 0; i < mbox->num_chans; i++) {
>                 struct mbox_chan *chan =3D &mbox->chans[i];
>
> -               if (chan->active_req && chan->cl) {
> +               if (chan->active_req !=3D MBOX_NO_MSG && chan->cl) {
>                         txdone =3D chan->mbox->ops->last_tx_done(chan);
>                         if (txdone)
>                                 tx_tick(chan, 0);
> @@ -246,7 +246,7 @@ int mbox_send_message(struct mbox_chan *chan, void *m=
ssg)
>  {
>         int t;
>
> -       if (!chan || !chan->cl)
> +       if (!chan || !chan->cl || mssg =3D=3D MBOX_NO_MSG)
>                 return -EINVAL;
>
>         t =3D add_to_rbuf(chan, mssg);
> @@ -319,7 +319,7 @@ static int __mbox_bind_client(struct mbox_chan *chan,=
 struct mbox_client *cl)
>         scoped_guard(spinlock_irqsave, &chan->lock) {
>                 chan->msg_free =3D 0;
>                 chan->msg_count =3D 0;
> -               chan->active_req =3D NULL;
> +               chan->active_req =3D MBOX_NO_MSG;
>                 chan->cl =3D cl;
>                 init_completion(&chan->tx_complete);
>
> @@ -477,7 +477,7 @@ void mbox_free_channel(struct mbox_chan *chan)
>         /* The queued TX requests are simply aborted, no callbacks are ma=
de */
>         scoped_guard(spinlock_irqsave, &chan->lock) {
>                 chan->cl =3D NULL;
> -               chan->active_req =3D NULL;
> +               chan->active_req =3D MBOX_NO_MSG;
>                 if (chan->txdone_method =3D=3D TXDONE_BY_ACK)
>                         chan->txdone_method =3D TXDONE_BY_POLL;
>         }
> @@ -532,6 +532,7 @@ int mbox_controller_register(struct mbox_controller *=
mbox)
>
>                 chan->cl =3D NULL;
>                 chan->mbox =3D mbox;
> +               chan->active_req =3D MBOX_NO_MSG;
>                 chan->txdone_method =3D txdone;
>                 spin_lock_init(&chan->lock);
>         }
> diff --git a/drivers/mailbox/mailbox.h b/drivers/mailbox/mailbox.h
> index e1ec4efab693..c77dd6fc5b8a 100644
> --- a/drivers/mailbox/mailbox.h
> +++ b/drivers/mailbox/mailbox.h
> @@ -5,6 +5,9 @@
>
>  #include <linux/bits.h>
>
> +/* Sentinel value distinguishing "no active request" from "NULL message =
data" */
> +#define MBOX_NO_MSG    ((void *)-1)
> +
>  #define TXDONE_BY_IRQ  BIT(0) /* controller has remote RTR irq */
>  #define TXDONE_BY_POLL BIT(1) /* controller can read status of last TX *=
/
>  #define TXDONE_BY_ACK  BIT(2) /* S/W ACK received by Client ticks the TX=
 */
> diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
> index ed9a0bb2bcd8..7991e8dba579 100644
> --- a/drivers/mailbox/tegra-hsp.c
> +++ b/drivers/mailbox/tegra-hsp.c
> @@ -497,7 +497,7 @@ static int tegra_hsp_mailbox_flush(struct mbox_chan *=
chan,
>                         mbox_chan_txdone(chan, 0);
>
>                         /* Wait until channel is empty */
> -                       if (chan->active_req !=3D NULL)
> +                       if (chan->active_req !=3D MBOX_NO_MSG)
>                                 continue;
>
>                         return 0;
> --
> 2.52.0
>
Applied to mailbox/for-next

