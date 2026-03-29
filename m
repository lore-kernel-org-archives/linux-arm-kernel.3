Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D60F3D60A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 16:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iuRiB7kx80/hvjqFvrfisUx6wOU49zwzAkhJWuxRZrs=; b=3MC6gUQFUS3ftZUJ9BlJ2jvFNQ
	NWCNmtr5LDMpbp28GFpe0G40Nayc/uqj86Ro/dnPko37dyKfcfBm9HAL1brLDGzWhRUdO6GIgQZR5
	5W9gR6qoQ67F6BVIQ+jQXMg6AlhyVhJVQsRTqGwKgPYQrKFIZ4mnLZSjqjsApulWJBkqJOm5pVGkF
	5Q2Us632XAh2K4s7pv7JOh4NeVYPFVGU+Mzpz4g9iry6xzpLnHWBSdF7HVGONnR01ePvX/OR6x7IS
	eIMIApFREb18STD5ryeLKyHh7wXbi+D6d5dbLtn30bU/CHBt7IJGQl/SV32KAz+Ng9D2D5Y/sLAbZ
	FUAg7tWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6scC-0000000A5aI-3SHA;
	Sun, 29 Mar 2026 16:03:53 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6sc9-0000000A5ZI-0B97
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 16:03:50 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7d7447778b9so1905035a34.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 09:03:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774800227; cv=none;
        d=google.com; s=arc-20240605;
        b=JM7dF3uXFmi78UYtNKu4+6g3McJfZikXm481Si5L3kdscYLYIVhFwkxoNPg4Ob/qec
         wYPgv4fBBIUWD5blel4l4YA89IWnDW4quhCOopOkMXbGaeCOiG0WWlPlp3Kd6GjgW0KL
         4w1Vp2riWCmGN5l81kICRgl61mB/UnTK9NsrL9WLS1WpmGsgzZZXxUKCquzj1B2Park7
         V9KN1fFJHuptPbaqIZ7Pv0K50UgRAgqJZS+3Ld34aq/elyiKYIH7b2o4kz5vmFj8FX3Y
         /dhFFt9phmqgksOQLKH4OtgrOK1gGzDZl1PTj2qhRM6Wc+2a87SL5QkPQWQordPZFwRq
         UJ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iuRiB7kx80/hvjqFvrfisUx6wOU49zwzAkhJWuxRZrs=;
        fh=M2d/hbSd9CcrL6dvoZfjUYtz/3Eww/5o8ip6E4u10GU=;
        b=hrxTZ5vkgMLy5P9YUL74arfwcllv/wQZLFFEthA033bx+QAHV/2VGus+thUAbMB9R+
         msOpK6DaeB9IaWT3SFwqpLgYLOn94MK/rsDmlyZpCiQBYOQwMGq6mmVKP8KkmTZvPYSf
         X5w1+8NOxkrdIsIof/yKMtzCnxi07/+p4GkX8nzmveQ8qzRj/MjemxG2RNk9ImqD8WvG
         EagqLe4rEZv5jhYUVvC75Qv4PhESirqd3jQuVDrME9fA632ovIGasNSbBQFwfMTsT32l
         D06oRNKKx6dddzES6ZL8708vOsH+ZcCFpjUZvODISpwGSHqZVBeTXsUe2bEOsX41m3om
         f/kg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774800227; x=1775405027; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuRiB7kx80/hvjqFvrfisUx6wOU49zwzAkhJWuxRZrs=;
        b=hmuuR7TiJdGZqATGtQRKQMKBgg7OkaveSd8HWVs9wLmQZLPRuSlWhwzsySJzGE4QQv
         p8HpP0E5YltjiegxH5EI64lBJXnU7rFmJNvUfK7JHl0Qa1QdMeWLEL3ajZC00Mmm36hW
         mA4hNcHh8+vLn0CkNn5WstYgMfUK9z9R7qwHBI23J6cUnijT8oacSUqLv1NGW1nziaRM
         FhkGHAWXndoriJqjQmcSH6ImyXjiO/5ivZ93fo5rY9L2uqLKiS7tus6HVPYgxaCAgQmG
         /GB3Sh/ZvFtpOFjeg6128JG7ykWcL42iyqwMpKC8TDc/R51TykQEZM3aHcMPvas1dsIk
         umDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774800227; x=1775405027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iuRiB7kx80/hvjqFvrfisUx6wOU49zwzAkhJWuxRZrs=;
        b=mX4DrpkUXOQIgg1FtMd9636edQQW2FIJVyKMzFMuAsaVVazCxXZ76TO0Ns4ltn91MS
         D8wMIKFzKzm+aXG2OI2Ji7F6U47tWDTrctdBAU23uqeiwqQYZxk1fWp4E0NoIOpjjoln
         JipN6lwiknCvEIuY5yZdodOvMSkbfyukYXNNJRsZhPvsPFEs8mhlW7ejpJIOquQkp9K/
         DzO3sVBQSGrAUwL2Og6AxAj24FfznW5tl7dGys6MyoA2nTTRMjdzuC3l60U29veAexJb
         vg6ZKukcgS5Q8nVh3M7ZHGOILgUegMd7HPJJSWYgQ+KMJJHp/b70V8qv3HUzWiQ+lCJo
         KF0g==
X-Forwarded-Encrypted: i=1; AJvYcCUmFqOBHBrtltDec0T3RbV1yz+hkaCoh9g0ekqrBqUzx/GNxhvADKG+f4hL13btWRxTOtHB1Lw6zl4o3mzBFJk7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/V5OCxtedmQPJqT8pOLoAXFtMLQglxFLM+uyWT/+d7LlqtVnO
	LwzUVD8xXz6Hp7VhUX3y516VOWVJOXQAQJpjZYY0cOmqC47OkFXt82jf7iNVAfDXu84fqIJZhq4
	3HUGpt3s4/ayz7ncaEkLCVqW/1JjgNJg=
X-Gm-Gg: ATEYQzxGRmH/hnJog7L7rF5lR9H0veNDjIjOyboCbcOC+WYNf9FqulNK72V94/NrU9c
	AowEl02TmOT/XHrJTcXjBOGyhTJcyt6LFUnuJyL5Np492cuue3gz7uopfWH8y9oWa/XXx1E9AFI
	bmqhyN1AvyI/AIlOD2MaVMZYzYX9XMzOsnfwCLcPeKzBy9NPkZ9Hb1alxgTzSIyeZ5tqrf6RcWM
	Db/4diB2YxIuXLK4aOUMLwi0/K2NFN9WhxvBsr+8EGNwtKHhnxeW5jQQ/AnlQMWSVJMjMxDPqLo
	TysfmUGz
X-Received: by 2002:a05:6808:1a1c:b0:466:ff3a:c745 with SMTP id
 5614622812f47-46a8a3eb1b4mr4305468b6e.21.1774800227277; Sun, 29 Mar 2026
 09:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260325040457.2113120-1-jason-jh.lin@mediatek.com> <20260325040457.2113120-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20260325040457.2113120-4-jason-jh.lin@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 29 Mar 2026 11:03:36 -0500
X-Gm-Features: AQROBzDYnGEvrmF9Nv8aKI46KCu4qNGcGl029nctsf-3ar7uJysAlIX7PTC3c6A
Message-ID: <CABb+yY2cjMskJeXsn8+hZj2DcFs05yabHbSaGT5XSi0fn45zCQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mailbox: mtk-cmdq: Remove unsued cmdq_get_shift_pa()
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Nicolas Dufresne <nicolas@ndufresne.ca>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Singo Chang <singo.chang@mediatek.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, 
	Moudy Ho <moudy.ho@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>, 
	Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>, 
	Chen-yu Tsai <wenst@chromium.org>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_090349_102816_0E1E5D15 
X-CRM114-Status: GOOD (  19.73  )
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

On Tue, Mar 24, 2026 at 11:05=E2=80=AFPM Jason-JH Lin <jason-jh.lin@mediate=
k.com> wrote:
>
> Since the mailbox driver data can be obtained using cmdq_get_mbox_priv()
> and all CMDQ users have transitioned to cmdq_get_mbox_priv(),
> cmdq_get_shift_pa() can be removed.
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c       |  8 --------
>  include/linux/mailbox/mtk-cmdq-mailbox.h | 12 ------------
>  2 files changed, 20 deletions(-)
>
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmd=
q-mailbox.c
> index d7c6b38888a3..f463f443e834 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -123,14 +123,6 @@ void cmdq_get_mbox_priv(struct mbox_chan *chan, stru=
ct cmdq_mbox_priv *priv)
>  }
>  EXPORT_SYMBOL(cmdq_get_mbox_priv);
>
> -u8 cmdq_get_shift_pa(struct mbox_chan *chan)
> -{
> -       struct cmdq *cmdq =3D container_of(chan->mbox, struct cmdq, mbox)=
;
> -
> -       return cmdq->pdata->shift;
> -}
> -EXPORT_SYMBOL(cmdq_get_shift_pa);
> -
>  static void cmdq_vm_init(struct cmdq *cmdq)
>  {
>         int i;
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mai=
lbox/mtk-cmdq-mailbox.h
> index 07c1bfbdb8c4..a42b44d5fd49 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -96,16 +96,4 @@ struct cmdq_pkt {
>   */
>  void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *p=
riv);
>
> -/**
> - * cmdq_get_shift_pa() - get the shift bits of physical address
> - * @chan: mailbox channel
> - *
> - * GCE can only fetch the command buffer address from a 32-bit register.
> - * Some SOCs support more than 32-bit command buffer address for GCE, wh=
ich
> - * requires some shift bits to make the address fit into the 32-bit regi=
ster.
> - *
> - * Return: the shift bits of physical address
> - */
> -u8 cmdq_get_shift_pa(struct mbox_chan *chan);
> -
>  #endif /* __MTK_CMDQ_MAILBOX_H__ */

I think the simplest would be to take this with the other two
predecessor patches.
Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

