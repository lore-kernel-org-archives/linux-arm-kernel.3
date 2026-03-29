Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E521FC97E2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 18:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3wmbf9tm5RXC/WGt+I4vjYVYl+x1YeILsU8zuhzL8Xk=; b=fFlAkVuqcb9kQNZR+EUMQP5Dg6
	kdaoHak6BveCK4Aw79KEKXdAZ9c/NfqeeY+emHiRZMh1W5w6Ln3p4np6MfMvJMLbbtZ80lrNBnma8
	B+FjFRGnvi3gUt+QhTOM/m6DXiHhr8Du4t0ic45OQZNz5uSoZFOEiv/c76hbI5o5C1R3QPRAr64IN
	91TY1uMXdGY4CNAsog4D7Orf3Tykq3dRGKg6HZ01Rd56fnKANg48ZFq2BADYazM6uTcZOnerWzHhJ
	DC0gA2vgg4QHmrijuoOCy1siKoYeCZbtKHH9gefGjuE6pwIUgXdnIG7B6pzXvQadVdcEd2ekUL3/3
	j4qGzGjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6vHK-0000000AFx7-0rr7;
	Sun, 29 Mar 2026 18:54:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6vHJ-0000000AFx1-0Q9T
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 18:54:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D07E60054
	for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 18:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C956FC19424
	for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 18:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774810467;
	bh=66KjTJzNiXmuWoSceuOnIwFQktqQGfH0rkdDPurwLKk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nZMQBIWjozKv7/RhCABCiXhtchvW4e8zMIU4M4qKfQfUhS3ORr/4AqIPGH/5boAVZ
	 Eyy6o//wGoQfSbc3NR69UCCNJGoS2cTr597ba0t9VDfMiiXQlysciUTH6gRQ7UUWbY
	 bQVSFpIjfQ4kuAAfW9VUoSPGaf2v/hMddiZBEwqf6z5l3z8AJOYM0lcIdesLZkZICu
	 j772m8MnkGz8/kM0KrfZhAz3GV+gg7Txvqk+RhWQgoL/SS5Kb0rl0gRQ0cO15ZDh0F
	 CaE6C/TnKwqnnLP7Pb17oCk5tSI5YsPY9rLbwV1SfFtMneumqVYHblNO0sYl0PpKdj
	 fL+T1bq8oC3zg==
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-65009bfdcfdso1876680d50.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 11:54:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLhmlp4xgHW9xU5itvQSX7XF0fIv1BDEtg9++uBTtXxSyVJGAfm8IFOV3ab3EpNnjOzqq/u0B+fXDhAYmA5hTH@lists.infradead.org
X-Gm-Message-State: AOJu0YyS+IMwPY9MwTIwQzRyIu6iJzXPkQZ4Ld9MlRv7uFz3LDHWhbFZ
	5CmqIimAPgK0ReEjpEZdZkYaREfFetykFuLGGUK47fUEmvQZMOIhymFYUQNIIddX8ycmaiLdyU6
	4LXWIfFCJzsAXQZXFG9ahsOAf9y2Eq/w=
X-Received: by 2002:a05:690c:c18e:b0:79d:67bd:53f2 with SMTP id
 00721157ae682-79d67bd75aemr40153927b3.51.1774810467206; Sun, 29 Mar 2026
 11:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <006201dcbf63$84593aa0$8d0bafe0$@nebelreich.de>
In-Reply-To: <006201dcbf63$84593aa0$8d0bafe0$@nebelreich.de>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 29 Mar 2026 20:54:16 +0200
X-Gmail-Original-Message-ID: <CAD++jLmVPCL6p3jcdg1y_w=Zij6oVdWTvSmQFjWLn4yRJL4g=w@mail.gmail.com>
X-Gm-Features: AQROBzBBA7NHtbwkD4nxw1mFUd50TSaoSDvNC9g2lmV_5g7RV3sq05aU7XGFQy4
Message-ID: <CAD++jLmVPCL6p3jcdg1y_w=Zij6oVdWTvSmQFjWLn4yRJL4g=w@mail.gmail.com>
Subject: Re: [BUG] net: ethernet: cortina: gemini: skb leak in gmac_rx()
 causes kernel lockup under sustained RX load
To: Andreas Haarmann-Thiemann <eitschman@nebelreich.de>
Cc: ulli.kroll@googlemail.com, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
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

Hi Andreas,

thanks for digging into this, I have wondered why this happens for a long
time but I'm not the best net developer myself.

On Sun, Mar 29, 2026 at 12:05=E2=80=AFPM Andreas Haarmann-Thiemann
<eitschman@nebelreich.de> wrote:

> diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet=
/cortina/gemini.c
> --- a/drivers/net/ethernet/cortina/gemini.c
> +++ b/drivers/net/ethernet/cortina/gemini.c
>
> @@ -1491,6 +1491,10 @@ static int gmac_rx(struct napi_struct *napi, int b=
udget)
>                               gpage =3D gmac_get_queue_page(geth, port, m=
apping + PAGE_SIZE);
>                               if (!gpage) {
>                                               dev_err(geth->dev, "could n=
ot find mapping\n");
> +                                             if (skb) {
> +                                                            napi_free_fr=
ags(&port->napi);
> +                                                            skb =3D NULL=
;
> +                                             }
>                                               port->stats.rx_dropped++;
>                                               continue;
>                               }

This looks right to me, can you send a proper patch, or provide your
Signed-off-by in this thread so I can create a patch from this inline code?

The kernel process requires a "certificate of origin" i.e. Signed-off-by,
described a bit down in this document:
https://docs.kernel.org/process/submitting-patches.html

Yours,
Linus Walleij

