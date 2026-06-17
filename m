Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C84CD98EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 00:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LrsbCJurtBL+CteEOzn5l5Hh4zAzpSug07wS9GG8znY=; b=vwKCn3sv4JCc9NF5556xPuQytM
	UUTMe6Td+bt4TJf5pW6FmE0VrCAuX7Vv7zE/xPRxg0JRhr6GBR8okTlfj7rHD/Dta/JqRuozqfI/y
	wwHds7EkIpMV7btU8JlwbYtyLl1rqO11LiDasJPTMPP/VPFsXixLyWuBPHSMhKw7sg3Wd5TD14n7a
	it5Dj3OIaErQoMZCpQxd9ymaHoDHwlfvPAiJI3gKtgOMhVMPb1Sd+WTvqJhThQy6BYLjfzK1roIO1
	ZJGtX7RliVXs8kBRXTaNwDfrLLUZgyqThySW25iYUrJxKOn8n0KpflgxyjpObnZqmjVhytSc0BWNY
	lkVZT4WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZeaF-0000000GS2a-0meN;
	Wed, 17 Jun 2026 00:56:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZeaE-0000000GS2G-15GD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 00:56:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CBDC600AB
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 00:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B28E11F00ACA
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 00:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781657804;
	bh=LrsbCJurtBL+CteEOzn5l5Hh4zAzpSug07wS9GG8znY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BjK2uID/sv/OnPsaa+R9u3+QPDHQnLdh1Ux9BFsUeoiK7FV5Eex0ZeH8abjpoRo9K
	 M+/aL/WmhwhAbzNl1cXoJjoQJq9Y+zHPrt57BJXpE6xLxuujPqBHojd0jG7lq9cjnl
	 440uoREV3sR7jQq0gkd5Tcu+Mxx0liZfcuSdeionJk4XjdMRvPwq+P+x4LsaYnDrh9
	 1y/cslLBpmxEAcG5v2Vfa+w8Amcu7KYIGLshvnroMb9u5vLhhJbJaqXUtn506mbShr
	 0S3OJLrCB+Jn02duxJiITn4GPDTuItdh/dtD35mfsfh8O4c99mToSscJVocAmtODA4
	 Py13bU3fqOYCw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-399389dae7fso4363851fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 17:56:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Lba0TPbr3wYSrmrC1K6VUJmuDIAj6RP9L1CSJ4dTZ8oVmZxXP3wSRqUmoN65SGLhJdXft4MU4VpqvJSkHvIHu@lists.infradead.org
X-Gm-Message-State: AOJu0YywM/0/O13rWLvQAp4cX+bYUjhGAfYb3QJgcH5i2wJB6QftoGHB
	Oh0GgBDh6TWK/mw+jS22I+Wph2TvwUdHz4tu7B6iYwP0X+9hsjYWboGAEcN372CUJdfJ7jbGD8p
	ryIYVE4lGS8A2r/ps6RT5HmjMwH6VSsY=
X-Received: by 2002:a2e:bc10:0:b0:38e:96c4:9244 with SMTP id
 38308e7fff4ca-3996a04c609mr2491451fa.9.1781657803142; Tue, 16 Jun 2026
 17:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260616111224.152140-1-senozhatsky@chromium.org> <20260616111224.152140-4-senozhatsky@chromium.org>
In-Reply-To: <20260616111224.152140-4-senozhatsky@chromium.org>
From: Sean Wang <sean.wang@kernel.org>
Date: Tue, 16 Jun 2026 19:56:31 -0500
X-Gmail-Original-Message-ID: <CAGp9LzqT4knwk9hONu43cGDr005Phs3xw6T+YexXa3X6JEBOpA@mail.gmail.com>
X-Gm-Features: AVVi8CdiIxEmti2SA6GEHnRDGJT8WXA1KiLzwBTTnsex_dP2qM2eKK-VJ13FtyE
Message-ID: <CAGp9LzqT4knwk9hONu43cGDr005Phs3xw6T+YexXa3X6JEBOpA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] Bluetooth: btmtksdio: call cancel_work_sync()
 outside of host lock scope
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
> cancel_work_sync() should be called outside of host lock scope
> in order to avoid circular locking scenario:
>
> CPU0                                    CPU1
>                                         close()/reset()
>                                         sdio_claim_host()
> txrx_work
>   sdio_claim_host() // sleeps
>                                         cancel_work_sync() // sleeps
>
> In addition, when txrx_work() runs concurrently with close()/reset()
> it better not to re-enable interrupts by testing for BTMTKSDIO_FUNC_ENABL=
ED
> and not BTMTKSDIO_HW_RESET_ACTIVE before C_INT_EN_SET write.  However,
> btmtksdio_close() clears the BTMTKSDIO_FUNC_ENABLED too late (after
> cancel_work_sync() call).  Move BTMTKSDIO_FUNC_ENABLED bit-clear earlier
> so that txrx_work can see concurrent close().
>
> Fixes: 26270bc189ea4 ("Bluetooth: btmtksdio: move interrupt service to wo=
rk")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/bluetooth/btmtksdio.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.=
c
> index d8c8d2857527..207d04cc2282 100644
> --- a/drivers/bluetooth/btmtksdio.c
> +++ b/drivers/bluetooth/btmtksdio.c
> @@ -625,7 +625,9 @@ static void btmtksdio_txrx_work(struct work_struct *w=
ork)
>         } while (int_status && time_is_after_jiffies(txrx_timeout));
>
>         /* Enable interrupt */
> -       if (bdev->func->irq_handler)
> +       if (bdev->func->irq_handler &&
> +           test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state) &&
> +           !test_bit(BTMTKSDIO_HW_RESET_ACTIVE, &bdev->tx_state))
>                 sdio_writel(bdev->func, C_INT_EN_SET, MTK_REG_CHLPCR, NUL=
L);
>
>         sdio_release_host(bdev->func);
> @@ -741,6 +743,8 @@ static int btmtksdio_close(struct hci_dev *hdev)
>         if (!test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state))
>                 return 0;
>
> +       clear_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state);
> +
>         sdio_claim_host(bdev->func);
>
>         /* Disable interrupt */
> @@ -748,11 +752,12 @@ static int btmtksdio_close(struct hci_dev *hdev)
>
>         sdio_release_irq(bdev->func);
>
> +       sdio_release_host(bdev->func);
>         cancel_work_sync(&bdev->txrx_work);
> +       sdio_claim_host(bdev->func);
>
>         btmtksdio_fw_pmctrl(bdev);
>
> -       clear_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state);
>         sdio_disable_func(bdev->func);
>
>         sdio_release_host(bdev->func);
> @@ -1295,7 +1300,10 @@ static void btmtksdio_reset(struct hci_dev *hdev)
>
>         sdio_writel(bdev->func, C_INT_EN_CLR, MTK_REG_CHLPCR, NULL);
>         skb_queue_purge(&bdev->txq);
> +
> +       sdio_release_host(bdev->func);
>         cancel_work_sync(&bdev->txrx_work);
> +       sdio_claim_host(bdev->func);
>
>         gpiod_set_value_cansleep(bdev->reset, 1);
>         msleep(100);

The patch looks good to me. Inspired by your patch,
do you think should we add another patch to keep txrx_work out of the
reset window by rejecting TX during reset,
ignoring reset-time interrupts, and making queued workers exit early?

Some code like:

--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -567,6 +567,8 @@ static void btmtksdio_txrx_work(struct work_struct *wor=
k)
        pm_runtime_get_sync(bdev->dev);

        sdio_claim_host(bdev->func);
+       if (test_bit(BTMTKSDIO_HW_RESET_ACTIVE, &bdev->tx_state))
+               goto out;

        /* Disable interrupt */
        sdio_writel(bdev->func, C_INT_EN_CLR, MTK_REG_CHLPCR, NULL);
@@ -628,6 +630,7 @@ static void btmtksdio_txrx_work(struct work_struct *wor=
k)
            !test_bit(BTMTKSDIO_HW_RESET_ACTIVE, &bdev->tx_state))
                sdio_writel(bdev->func, C_INT_EN_SET, MTK_REG_CHLPCR, NULL)=
;

+out:
        sdio_release_host(bdev->func);

        pm_runtime_put_autosuspend(bdev->dev);
@@ -646,6 +649,9 @@ static void btmtksdio_interrupt(struct sdio_func *func)
        /* Disable interrupt */
        sdio_writel(bdev->func, C_INT_EN_CLR, MTK_REG_CHLPCR, NULL);

+       if (test_bit(BTMTKSDIO_HW_RESET_ACTIVE, &bdev->tx_state))
+               return;
+
        schedule_work(&bdev->txrx_work);
 }

@@ -1250,6 +1256,9 @@ static int btmtksdio_send_frame(struct hci_dev
*hdev, struct sk_buff *skb)
 {
        struct btmtksdio_dev *bdev =3D hci_get_drvdata(hdev);

+       if (test_bit(BTMTKSDIO_HW_RESET_ACTIVE, &bdev->tx_state))
+               return -EBUSY;
+
        switch (hci_skb_pkt_type(skb)) {
        case HCI_COMMAND_PKT:
                hdev->stat.cmd_tx++;

> --
> 2.54.0.1136.gdb2ca164c4-goog
>
>

