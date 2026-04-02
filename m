Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78DDD6AAEC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 18:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0TW/KELxmP6HAx/s1ZGX6uuibSSGSUbIAcodT49xPg=; b=vUReG8+rLxLD4TgZSpoGq3ZcD6
	1pVFHYEgn+GZOTEu8u4Ecap9wCTGFqebO1O0bgJq4dvQ/vHuvhEky3qVNK5AwCjqdYR7CeBuzmivS
	qclWcoJkY20ruskvLkHEa3uolBo1e5hrMHir/JcQnVZPLpjM6W96IVYn/pXBVRKSK/vim/J8OG/ca
	NkXvfbh8H0wQa7OOsWpm3g/PUVZX9PJEwD9pFpCFoTRbL9S4SCVYmGcFcpeWMawyb+TuYQ2h6mEMQ
	zxpprFRDf+xzsvMLe15X7DZHwdjsMZDTWvOkbl6tYI2Rp6YMOZJL61BA6A/2RNJgmxz015f8SnOom
	I8AC51pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8MO0-00000000cz2-3rUV;
	Thu, 02 Apr 2026 18:03:20 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8MNx-00000000cyL-3z0t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 18:03:20 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7d9bba96f7dso634458a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 11:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775152997; cv=none;
        d=google.com; s=arc-20240605;
        b=O+G7vkgLTzCt+ybsXUOhIgVQWh3d6vg7uhbHCHl/ASCypbMGHPqr+Af/T04nkBcNah
         MCP0PaoU2cmxFQ9QVgsu+meQWqAb5TU5kz/KyA2xbcgfnK72TUGirvmL9naz0Z8gXZyB
         37GjMMMeVrWuVnxfcO/hn/D7eS4rV5+7M2F2uZQc0FiDJsN43yJe9V0Wa7aILcjL95Sx
         jLLm1jt/Zezusn8gJ+M1FYnE0gvPonibMBLNuu9mTwPijWJKtb6r3JZxCrDfBp/8dkGU
         /7zw+CKNCGTFckiJQnK9GbH1PNXFU6OTILwia5e2GBPNz8x2/pmmG2V/PL3P0KQRYtaH
         JQgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M0TW/KELxmP6HAx/s1ZGX6uuibSSGSUbIAcodT49xPg=;
        fh=59tdp2hxMOcawRdmMYwI5RjWmR6o2ihgzmH3nMl3xfw=;
        b=BRpQQug0zVX15weH76joWSCRar1BPMeIJrBfJz4N9gfG/aOHHqfD2KO+TnRiiX6SNp
         GWNde6jQeU0jgH5h7kcdm/6Fd9l0t9YJ56InQP9arP3nquQCKXGiQLG4Md9sYo9xD8da
         wuXbqB73bMmoSt2jgFkG74nFGV+L+CdSIm9SL0zaH+ybiy9zdhWIfSo5Y0h0lNZm7MYV
         JyXodDkvIJ6SgaAzaAJBxxuJZAJ+sRLwkv/L5Q+TLMEPARoJbXqA7dJs/Ptscxqs+t95
         t2EHfT7dyb2jDrZkiQzfQV9HlhJV4rMsOyXxkwiAGMAhIOlZTFU8Wh6vRwv3kAu0yzPb
         mUUA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775152997; x=1775757797; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0TW/KELxmP6HAx/s1ZGX6uuibSSGSUbIAcodT49xPg=;
        b=QXd4MwR2bxRVxN9h6LhCc1ep+Ivt7/e5xN9nEDGngzHFbbfauBwLi8UUABag5Xp4vZ
         hbfwseQWbJX9jWRrv6QRVRpU5CsVOTqIylwi+/TR9fr7YA6U1ftEcrDlRkWbNVDKMn2o
         yKIMDmMMHbEXaUxsEMcq2iWa9W1bAh0AHPD0LJcnQfaNL2HZP6GGk9AxMJq0ughleq5Z
         oIuPhbe5Jhv9hoU1cCcErp4vG7dJWlOwjuXbN1EMyIz2ieAh6CzE7sxWgmudLDU0n8Um
         ceTq6386FKoYDWNEeFClJ0pQsFl3mNyMu01azXLAyIPQkjVbEFqI6/opd1FknMbrB3/V
         S93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775152997; x=1775757797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M0TW/KELxmP6HAx/s1ZGX6uuibSSGSUbIAcodT49xPg=;
        b=GCeoNR6ylk3tPW8lw2vjUiJh24xHVIcloUdjWI0ADds3YnDHp2TrDl6TelKbwAU9ZP
         bGZAFYlwTdSrRAwwdZQ536gydtSFoFG+hCaEP2l6Smp78pZHDMBja89dCNLKUJavvrk0
         X8kLQ2fTJ8pR2+WTV7dbuaDKoTV+6sy16ZUjR7oSzeRBVDKpm5OglJbbTnEreQOqc48i
         Mg8I+uPtR2Qo3+lKTmFOeyDk3r8RLIfmhRHwitjQJL/UmXGS4cYlA/7PS1UJCIqjtc0i
         Xk2Zeop0vcHSr71qGZ4U83iI3NtZg7mwBCCrnoU2GDiDjwmqZS0bRa9SZ0XlG6zhXFIj
         CGkg==
X-Forwarded-Encrypted: i=1; AJvYcCU20XXJQHvEJNTW8X1JyGBubPGq4SDzm4k0YkpI2FdLJslJezfxEPMRe+af/1S0RpE79RXmYmn98TwLkvLUzsGV@lists.infradead.org
X-Gm-Message-State: AOJu0YyUGjxtQmkRXVW3q8j9ioXdFSBRYQyDpRW4sklLgZ32O75o1meb
	a1EqMzpunfLps0fVkH+6u5zyqaepmRrDhpvctD/xwgn/R+5CFlellIB9ogaRKvbUnIFzy2oWjit
	2+g9MSU8l8CXhgGFzODVOM9LkDCN3ELM=
X-Gm-Gg: ATEYQzyNWOP2plX2EpNslHRePDIJw0H/gGO4Af0sccIs/9AUeX8CPmrG6ACejQKp06O
	Z/SzXPOCtlg7gMJeygTTCbBsg3hVOkGPD/CK9GZ+wUOLx++fnnk2AnFAHv7FuvEcgCssg252P9M
	FFlFefWZWeCCJIDJwgn1DQak133vs7TyMImTubs+0tzmLsX1pwpOWprrE60HKkVPm8OXwMqhBu4
	CbVJZIgnBTNUfsX6O+G5l/3QEdQSiYvQ39KxTraw9+99mjAqMoBrddCvHbQaiGMUr9i2aj9oaNz
	p0eFh2/y
X-Received: by 2002:a05:6830:611b:b0:7d7:c96c:c5d6 with SMTP id
 46e09a7af769-7dbb6f1aea6mr240409a34.1.1775152996668; Thu, 02 Apr 2026
 11:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260402170641.2082547-1-joonwonkang@google.com> <20260402170641.2082547-3-joonwonkang@google.com>
In-Reply-To: <20260402170641.2082547-3-joonwonkang@google.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 2 Apr 2026 13:03:05 -0500
X-Gm-Features: AQROBzCl5IvjHSRY9VamVjuRyy3ZLLYtLTcWUCKJtq-4tAuHHgLfoU-JXy74tSw
Message-ID: <CABb+yY3hYcJ82QGor3w5KKHUGz9Pc1k64Jdf-94E4Yvv0DTeyQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mailbox: Make mbox_send_message() return error
 code when tx fails
To: Joonwon Kang <joonwonkang@google.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	thierry.reding@gmail.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_110318_022113_B8620D3F 
X-CRM114-Status: GOOD (  27.04  )
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

On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang@google.co=
m> wrote:
>
> When the mailbox controller failed transmitting message, the error code
> was only passed to the client's tx done handler and not to
> mbox_send_message(). For this reason, the function could return a false
> success. This commit resolves the issue by introducing the tx status and
> checking it before mbox_send_message() returns.
>
Can you please share the scenario when this becomes necessary? This
can potentially change the ground underneath some clients, so we have
to be sure this is really useful.

Thanks
Jassi


> Cc: stable@vger.kernel.org
> Signed-off-by: Joonwon Kang <joonwonkang@google.com>
> ---
>  drivers/mailbox/mailbox.c          | 20 +++++++++++++++-----
>  include/linux/mailbox_controller.h |  2 ++
>  2 files changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index d63386468982..ea9aec9dc947 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -21,7 +21,10 @@
>  static LIST_HEAD(mbox_cons);
>  static DEFINE_MUTEX(con_mutex);
>
> -static int add_to_rbuf(struct mbox_chan *chan, void *mssg, struct comple=
tion *tx_complete)
> +static int add_to_rbuf(struct mbox_chan *chan,
> +                      void *mssg,
> +                      struct completion *tx_complete,
> +                      int *tx_status)
>  {
>         int idx;
>
> @@ -34,6 +37,7 @@ static int add_to_rbuf(struct mbox_chan *chan, void *ms=
sg, struct completion *tx
>         idx =3D chan->msg_free;
>         chan->msg_data[idx].data =3D mssg;
>         chan->msg_data[idx].tx_complete =3D tx_complete;
> +       chan->msg_data[idx].tx_status =3D tx_status;
>         chan->msg_count++;
>
>         if (idx =3D=3D MBOX_TX_QUEUE_LEN - 1)
> @@ -91,12 +95,13 @@ static void msg_submit(struct mbox_chan *chan)
>
>  static void tx_tick(struct mbox_chan *chan, int r, int idx)
>  {
> -       struct mbox_message mssg =3D {MBOX_NO_MSG, NULL};
> +       struct mbox_message mssg =3D {MBOX_NO_MSG, NULL, NULL};
>
>         scoped_guard(spinlock_irqsave, &chan->lock) {
>                 if (idx >=3D 0 && idx !=3D chan->active_req) {
>                         chan->msg_data[idx].data =3D MBOX_NO_MSG;
>                         chan->msg_data[idx].tx_complete =3D NULL;
> +                       chan->msg_data[idx].tx_status =3D NULL;
>                         return;
>                 }
>
> @@ -116,8 +121,10 @@ static void tx_tick(struct mbox_chan *chan, int r, i=
nt idx)
>         if (chan->cl->tx_done)
>                 chan->cl->tx_done(chan->cl, mssg.data, r);
>
> -       if (r !=3D -ETIME && chan->cl->tx_block)
> +       if (r !=3D -ETIME && chan->cl->tx_block) {
> +               *mssg.tx_status =3D r;
>                 complete(mssg.tx_complete);
> +       }
>  }
>
>  static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
> @@ -286,15 +293,16 @@ int mbox_send_message(struct mbox_chan *chan, void =
*mssg)
>         int t;
>         int idx;
>         struct completion tx_complete;
> +       int tx_status =3D 0;
>
>         if (!chan || !chan->cl || mssg =3D=3D MBOX_NO_MSG)
>                 return -EINVAL;
>
>         if (chan->cl->tx_block) {
>                 init_completion(&tx_complete);
> -               t =3D add_to_rbuf(chan, mssg, &tx_complete);
> +               t =3D add_to_rbuf(chan, mssg, &tx_complete, &tx_status);
>         } else {
> -               t =3D add_to_rbuf(chan, mssg, NULL);
> +               t =3D add_to_rbuf(chan, mssg, NULL, NULL);
>         }
>
>         if (t < 0) {
> @@ -318,6 +326,8 @@ int mbox_send_message(struct mbox_chan *chan, void *m=
ssg)
>                         idx =3D t;
>                         t =3D -ETIME;
>                         tx_tick(chan, t, idx);
> +               } else if (tx_status < 0) {
> +                       t =3D tx_status;
>                 }
>         }
>
> diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_c=
ontroller.h
> index 912499ad08ed..890da97bcb50 100644
> --- a/include/linux/mailbox_controller.h
> +++ b/include/linux/mailbox_controller.h
> @@ -117,10 +117,12 @@ struct mbox_controller {
>   * struct mbox_message - Internal representation of a mailbox message
>   * @data:              Data packet
>   * @tx_complete:       Pointer to the transmission completion
> + * @tx_status:         Pointer to the transmission status
>   */
>  struct mbox_message {
>         void *data;
>         struct completion *tx_complete;
> +       int *tx_status;
>  };
>
>  /**
> --
> 2.53.0.1185.g05d4b7b318-goog
>

