Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2334BC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JPe2T4C9FGoAfSm2OSn/uy+LGFjAoZJob/kwp689UMw=; b=awBOV7QazV6POzgA7vu8oasYc7
	k2kO09zaYPDJ13F6r6bsX3q3/Iyiv5jhmlJYX2KGl17peiI2jgZ63xSGFmtZTaXb0a8LRAMoF3JYL
	zA6B1x7v/J3zbMxf9WOqBzB2KeHOZsm5toAiKwdqwSeAc7AwGjIiRCvKVbsMddZy6rRpzcMciuaOs
	iBM0K/kwb9zWoscd/X6CnKiNUt4rDwbGtFwH0GsvW/Jwm/M6jzBy1d+KSJecVoMDq2QEBI6eJU0gc
	PVXRFi52M+y0OjXuk2MxA7piM5cQmJ/Q+VpZli7r7N89FsGVF/9R1Qr1Kwwd2OCzjD4OSTrKPiBb7
	fmwHORTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsN9d-00000008Oxf-1pTu;
	Fri, 07 Aug 2026 16:10:41 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsN9a-00000008Oww-0pSt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 16:10:39 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-81e8fa1b8d6so49225967b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 09:10:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786119036; cv=none;
        d=google.com; s=arc-20260327;
        b=shehTEuhMV5VZniuF9oniulaJguSkRnVO7EJaDF+rZ5OTxDvM3To+E69D8JVvNPk6u
         L2H2CTBWe0sFEDd4w8AqIoFHITgZUGyRlbazVvR83PEItlZAy/iugm8Doi12QLWTuy0c
         /tGUJhEKNBBRtYL25Vaujee3Hi7eaCctLLFrmpb+m/VY1og5tfJVNdWLemYHqhk8QvR9
         WGcBgc2oPTHfldg9h+FwpnF17njN5HLWpmWNwGx/SVRm9LXLhAa6sb3IMkVLG9PdWGpc
         4YJ+U4K/r4G9sQyPk4SbhDmoW2QgDaax0du40Se0vTZ8kcplGMuubpyD0KaXmX8nJONy
         5xRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JPe2T4C9FGoAfSm2OSn/uy+LGFjAoZJob/kwp689UMw=;
        fh=EQUTXlOOln/JN9zqi+g4zSHkRYy24MLzWhGclrYFmaM=;
        b=MhfEUeK0o9X4i9Ld6o8StiFtpXgixwVlmgpFWnOGnbPF1vNULr5wk4t4+UloIcVOjr
         LcyHzvjuH+0bI120SgIVxX5d63dMkl+BxLOHxunJxuu+4Oz4u8xr7M36qq8kmoUKgo0b
         /FrA90mxeQjSQGay+cejSCG/3W5q+qo5ZXuAR7ZCwuWdzvWTWm8n70SgZZ1oxtsRheIV
         JGKFrBhOLbO+NZ7skgXM9TXVNwdD2uGB8lknKc9Wp4a1bRHDQf2jRM5cBTycwYkIA33u
         QOMZpUSTLOz4mJINWm9RJLj8vkDo2NDDA8g8YtHqXvn9jldF1diHWm2NZhzECpPKblWD
         +hxQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786119036; x=1786723836; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JPe2T4C9FGoAfSm2OSn/uy+LGFjAoZJob/kwp689UMw=;
        b=kGB8PAzRadVpyF+KRUAWQsiAaeSmtzMZrF9cJZvcotkTgdKwDb5Lf4t31cUuZwojXJ
         ysyQSnfP3HMSq/0HpM9HLYto8h52mB9nQJwUb7gRDVXPq6/zQPCYwruCgHEKAYELeVco
         dYkx+k/TN2OpEGx/wK8JnGnwCyf+Ou2zrtJtvW1vMtA3wrE25bIMWpQ/UepkzZ/0SDfz
         i0xEsJdgZEMRcWnYznUUlnemUn7VWCyWo8KHR139mZ36WH4Kze14ZUACeD/3s6ImcoDL
         SM14m9wJNLoaWXt/j5Z4y8u4MytmVNkPbUAZNUJxBAcD6V2F0GBUWLQMlLyoJAXnR7cF
         /KrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786119036; x=1786723836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JPe2T4C9FGoAfSm2OSn/uy+LGFjAoZJob/kwp689UMw=;
        b=TdxTuikmPg879FySi9Bw4XU1KllNKm1QGrfm1x4jGtEI0MJb2MvnxvjR89c0Y/dgYT
         MrhIr8UdG1UrG0bRl8AcW2+O7Iz+HV7DvTMm+UckrwjQfbsqimcFFXegEznsGuYVH26h
         h+w4kk9waZ0KNoIUpLYJx3xmev/SNd2swCAUs73yqD5cvxMqcLCjOn4mZFqJ+/lY3ePD
         8ye1ysJlUR3p2t2eDuUQxQmWd1PXSr36N9ue3AWlg2AFpOD2lPw7R6PN/O2omYzTyiXI
         cytSFRdK2YYZowSmpE+BASTORHXVxJG96XtMxe/N4dwTdhemRsvz6QTRmMNrtf7+0NSe
         JCSg==
X-Forwarded-Encrypted: i=1; AHgh+RqHcNufb4W3grHizbsroVuTDNvxeGafBeBXWaUF9NQSKE/hzHcUzFdRx1SgiJvHTd8H5e0i9FK0mNddKFuOz7vW@lists.infradead.org
X-Gm-Message-State: AOJu0YxYbsPMLDRhAksJ8OoyCYjCE8xV/dc5kZ4Y5h+q28a1rUUvL8zu
	VA1LkZnYXWaiOYx5TYx9L58DvrzP3+0FsKBKAYg5eaa2KJaXVEEIchcjFN3LdawNTLBQS/wH8u2
	3Xv219Zs0p5TBhEND1stXWvldTy0X6ZY=
X-Gm-Gg: AR+sD12z9wL7CqASSa3/j9gw68zjYA4fywtks1gyNs5ie6DC4k58jdZiLLSwPzoWBwh
	+kd9N2kI5yx5PLbQL9rrnH1TQeG4rRjC2C3VG/ox0U9UbjNR2ALmmDXNHWf1MqVRqrrYuVMK0p9
	aFLDOrTpzMcD1lp7uracflY2aDy+Ci5Dj4yANnrCh2V5yLG8KrR0O8Jt1InudN+1J4sa7lI0Vvy
	AyB2H1d9vr2nesfcRUcaQ8gCi6QnElw1tJOjXyy4nbV/HPFreI79MaFwRbiR13H3nl0hXHpvPRe
	hoAj0xZsqGn4lfH5B4stazuiWwBqhkTF/AymlKdi12YQWdJ2QQXYgWHLR6g9dFq8HIvKQMt/rYm
	GJCF0lPZjNTOjMdANCw0wmVduVVkyhVQ=
X-Received: by 2002:a05:690c:6512:b0:81e:deab:43af with SMTP id
 00721157ae682-8201f0c1456mr166289867b3.4.1786119035967; Fri, 07 Aug 2026
 09:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <FD5D03449312D17C+20260806-btmtksdio-deadlock-fix-v1-1-3a2d4392d117@uniontech.com>
In-Reply-To: <FD5D03449312D17C+20260806-btmtksdio-deadlock-fix-v1-1-3a2d4392d117@uniontech.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 7 Aug 2026 12:10:23 -0400
X-Gm-Features: AUfX_mwnlvEBqaHq9pVkwxhN2lM7dsClJAMMw8cY-68R6f3NS5GmuPRzCsMKyAE
Message-ID: <CABBYNZK1VKSthhfEi_BRJSX90W_c3sAqCSdsFm3Z6wXYDcWaVA@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btmtksdio: fix deadlock in close and reset paths
To: ZhaoJinming <zhaojinming@uniontech.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_091038_261884_FC919F28 
X-CRM114-Status: GOOD (  27.69  )
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

Hi ZhaoJinming,

On Thu, Aug 6, 2026 at 2:36=E2=80=AFAM ZhaoJinming <zhaojinming@uniontech.c=
om> wrote:
>
> btmtksdio_close() and btmtksdio_reset() call cancel_work_sync() on
> bdev->txrx_work while holding the sdio host lock, which is also acquired
> by btmtksdio_txrx_work().  If txrx_work is queued when close/reset runs,
> a worker thread may start it after the host lock is taken and block in
> sdio_claim_host(), while cancel_work_sync() waits for the work to
> finish.  The host lock is only released after cancel_work_sync()
> returns, so both sides wait forever, deadlocking close/reset.
>
> Fix this by releasing the sdio host lock before calling
> cancel_work_sync(), then re-acquiring it afterwards.  The interrupt is
> already disabled (sdio_release_irq() in close, C_INT_EN_CLR in reset)
> before the work is cancelled, so no new work can be scheduled and
> cancel_work_sync() fully quiesces txrx_work before the device is torn
> down.  This mirrors the pattern already used by btmtksdio_flush(),
> which cancels the work without holding the host lock.
>
> Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>
> ---
> btmtksdio_close() and btmtksdio_reset() call cancel_work_sync() on
> bdev->txrx_work while holding the sdio host lock that
> btmtksdio_txrx_work() also acquires. If txrx_work is queued at that
> point, a worker thread can start it and block in sdio_claim_host(),
> while cancel_work_sync() waits for the work to finish and the host lock
> is only released afterwards - a deadlock.
>
> This series releases the host lock around cancel_work_sync() so the work
> can always complete, mirroring the pattern already used by
> btmtksdio_flush().
> ---
>
> ---
>  drivers/bluetooth/btmtksdio.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.=
c
> index c6f80c419e901e71b21e550449250a5a6755d100..879d580226d25ad398105a158=
de1545dace33718 100644
> --- a/drivers/bluetooth/btmtksdio.c
> +++ b/drivers/bluetooth/btmtksdio.c
> @@ -746,8 +746,16 @@ static int btmtksdio_close(struct hci_dev *hdev)
>
>         sdio_release_irq(bdev->func);
>
> +       /* No new work can be scheduled after sdio_release_irq(), so canc=
el the
> +        * work outside the sdio host lock. btmtksdio_txrx_work() also cl=
aims
> +        * the host, so canceling it while holding the lock would deadloc=
k.
> +        */
> +       sdio_release_host(bdev->func);
> +
>         cancel_work_sync(&bdev->txrx_work);
>
> +       sdio_claim_host(bdev->func);
> +
>         btmtksdio_fw_pmctrl(bdev);
>
>         clear_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state);
> @@ -1293,8 +1301,18 @@ static void btmtksdio_reset(struct hci_dev *hdev)
>
>         sdio_writel(bdev->func, C_INT_EN_CLR, MTK_REG_CHLPCR, NULL);
>         skb_queue_purge(&bdev->txq);
> +
> +       /* With the interrupt disabled, the SDIO IRQ handler can no longe=
r
> +        * schedule txrx_work. Cancel the work outside the sdio host lock=
;
> +        * btmtksdio_txrx_work() also claims the host, so canceling it wh=
ile
> +        * holding the lock would deadlock.
> +        */
> +       sdio_release_host(bdev->func);
> +
>         cancel_work_sync(&bdev->txrx_work);
>
> +       sdio_claim_host(bdev->func);
> +
>         gpiod_set_value_cansleep(bdev->reset, 1);
>         msleep(100);
>         gpiod_set_value_cansleep(bdev->reset, 0);
>
> ---
> base-commit: 0d839570765118029aa8bf4a95444c6a11aacf85
> change-id: 20260806-btmtksdio-deadlock-fix-f9421f1a7879
>
> Best regards,
> --
> ZhaoJinming <zhaojinming@uniontech.com>

Sashiko found a problem:

https://sashiko.dev/#/patchset/FD5D03449312D17C%2B20260806-btmtksdio-deadlo=
ck-fix-v1-1-3a2d4392d117%40uniontech.com

--=20
Luiz Augusto von Dentz

