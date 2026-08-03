Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1625C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 17:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/iOnG2AgOH05ZK960YynpPzVU3vp84xiLR+imEY/xU=; b=fXVp9BpWe2fs+u
	MNmBQAcz6vZS6OsMQINZji8JyC0VhH6Z/c044v9fRrFWVRrKYh2Pi9o6Dw+Eh13cltgNMCiUJm58f
	6/AD7kNkK8zc12Ap14slZv8mpZfGtJPchUP41fpGyrS/NPGAzuvfnIvMxrQIJEIS+ZYKhJGeUL7h4
	V5LHeRx8ql6TcCjTNCc1c1JmLolE81bKwWuiD87hoYla+Z/iIgR+A39afJFyOV6sJfGWikb6m8SMl
	Mm7RkBJDXHyoG2HheI3fNr7wS35/0y9zhWITx3ugC9hfUpbGeHxk18urgbCC2eBT8LgYhnDvOzrdw
	kNMG7EIVG7YwSIMqUjBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqw5i-00000000Ape-1VeI;
	Mon, 03 Aug 2026 17:04:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqw5g-00000000ApU-2Sdv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 17:04:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B90842B00
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 17:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A1A1F00AC4
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 17:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785776680;
	bh=n/iOnG2AgOH05ZK960YynpPzVU3vp84xiLR+imEY/xU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=ilTz7EDFtHNfXmhP/huN5N3HdbumDZlyjG48BjpB0rHnz+2bHocp9RaYN5/k0mvv+
	 /RpCo6h94xPzJDdW6dsL0/F7v6ZlGg071Adj9WrXCLBjHEerHHzGMqXOR6RymX4CLA
	 MVZ2ixLXG97fZHiSD4BgmMAHviwcSrpBGPjwGss1YwXOCHpOs5T5kfHU7crMrS8Jsb
	 zK5NqGgx1jDRnhh8xWeaq0w7eJVPpJNNj0qY8Db70C5K8jF6KYtGGUFSNgBf83J1nn
	 B/cudKs2WY5dMxxrqQ/Mu8Gvt3MtRlb91sv+3kzur2ZtGcdmBWuzVTDrIrHlw8nlKN
	 30fx4qTuaQ6bQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39c9bb9d2fbso31656881fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 10:04:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpH1tg6kglgt7p02uhVqfHKkl6T+7HQZSGtVc2C/GHFY+HdUR6NyAyCBQ5JMNCQ0JkJv2a5CTqGeHM+PIv+5SH+@lists.infradead.org
X-Gm-Message-State: AOJu0Yykrlgd3Kg7WUokumiqotRlyrNg5CvnZ1QpZ2BFR2R86VRIb/qH
	OJ01IKeornJeYL0tGVxxxFCA95j+ol1n8+mlL5nWTiZZH1JvE9wXqhMMo/+JmIpBDQTpr9IhXfX
	dtYHnvPnioI5pdpVnfjzyJ7cfhCj+3X8=
X-Received: by 2002:a2e:a593:0:b0:39b:4371:dbe6 with SMTP id
 38308e7fff4ca-39f8616c4d5mr23211641fa.16.1785776678644; Mon, 03 Aug 2026
 10:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <3f5ec952ad80cb51efebf2fe230df50259041a23.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <3f5ec952ad80cb51efebf2fe230df50259041a23.1785772659.git.jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 01:04:24 +0800
X-Gmail-Original-Message-ID: <CAGb2v672PXcS7zLtGLrVQs0D00Pvh97pUo=tgPMCswJMbg7=Rg@mail.gmail.com>
X-Gm-Features: AUfX_mx02KEK-kEu0E0pYT9Oatt7b9Hz1g3PJFr357J8Y3_fc2ljcAF3lcI4DE0
Message-ID: <CAGb2v672PXcS7zLtGLrVQs0D00Pvh97pUo=tgPMCswJMbg7=Rg@mail.gmail.com>
Subject: Re: [PATCH 09/13] drm/sun4i: tcon: Drop remote endpoint reference
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Aug 4, 2026 at 12:11=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> sun4i_tcon_of_get_id_from_port() never drops the reference taken by
> of_graph_get_remote_endpoint(). The function is not only called during
> bind, but also on every mode set through sun8i_r40_tcon_tv_set_mux(),
> so the leak accumulates.
>
> Fixes: e8d5bbf7f4c4 ("drm/sun4i: tcon: get TCON ID and matching engine wi=
th remote endpoint ID")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/s=
un4i_tcon.c
> index de2d66623f7a..67047e3b657f 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -972,6 +972,7 @@ static int sun4i_tcon_of_get_id_from_port(struct devi=
ce_node *port)
>                         continue;
>
>                 ret =3D of_property_read_u32(remote, "reg", &reg);
> +               of_node_put(remote);
>                 if (ret)
>                         continue;
>
> --
> 2.43.0
>
>

