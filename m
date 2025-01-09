Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8983E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 19:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4WzP5HtNir+r7CeRdJh0bMItnEqgcGYq4xqfQEUm3Y=; b=L7UzM9OHotXu3rX9BfVImfkcMZ
	D8woJ6uibbEm6LB/tkhjIcToUgPvCYSwsAVPsxbG/mzTY+jxxXYvgz1rgFtyovlGcwYXSjFHEIavw
	wV6PU7j4BziohMuqwpA4a+WHip6CAVsQ6rxw/qW1/Rr765b1aHTKYEc6vMx6lxx4KxwQ57kaUtOcW
	lx1IF3t5gA7ZsJbbaOX0OAqytdRZ1WSBumV9amclwq0GKHAMaTsvdY5MT3EWljw3sOowRAAOatmX3
	VSJ6KiwAD8sXDWbEgD6Uh0ke2KELNNIMl98EXNtvVGjykN8oDo2ppm8Hv4rYfD32L4yP5V0oW86h/
	N9LiNW0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxzZ-0000000D4cj-3su1;
	Thu, 09 Jan 2025 19:14:53 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVxyM-0000000D4TQ-3om7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 19:13:40 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3a777958043so4126295ab.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 11:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736450017; x=1737054817; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4WzP5HtNir+r7CeRdJh0bMItnEqgcGYq4xqfQEUm3Y=;
        b=unUvyDFzWlvZjDbAor6LzL3KSiYHt+Za6W356dmKj6qWWx0PTGiM3DjMAXFm63JV2D
         nqZwxEho+jfwV78ozvX950gVFgnuQ5Cz9YykYaV6VPcOCHTbEssXdnjGd54FpWs84NAS
         TuUO2qxllD2BWSLv6a0xf47bR03GPbkr7fiAfwvotfp/qeFgIplhBeY2c3ZVTh/CfqQF
         oJESJoZKoSPcWVZyu+a4dp7NpVRMZsgrbTCYWF0Vgt1TbdGteGFt5zZBVxdv1G4IQVRD
         7e0/QH8/Z/pbsddOzfwSYw3aADnqsc/B4k7pcMBY7LfMgPyJasAaI9QGJdRVztS4V1x9
         +cfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736450017; x=1737054817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4WzP5HtNir+r7CeRdJh0bMItnEqgcGYq4xqfQEUm3Y=;
        b=tBDyKHQKE9Enzq6F3p48UE/eDf1t21mbgXXSfWahq0ZeN8loYAIuon2RqsCbweZCz4
         GEIhtgkwHsb1eQovOo7XLsejAKBo9LI3FXK4dR/bworXFuqyQYGMyQ+NtQEYX0sc9x3v
         bc5WRrDTDgsS6mimhDbt/e5OSVyoLQ0kmVWGKhmlWFrtOIQOJzNxpU9NiiviRVGYtwP6
         uwAyGStM+vL+XlSolGprrAHXzpFwdxdVT1WJ0gywBqPVKvdtTdSU+zsr6NaKkyuEPvM5
         RhJKILJovo6LTREbqkqItfgd1vXfMZ970LU929yiVoPTIaLPLowX/ZXV/n7xZSN+t/Si
         Wk3A==
X-Forwarded-Encrypted: i=1; AJvYcCW95ljDzVbuwAhdEua0LV7DBL0whqaS3ssyusBEfETxvJM4k/tychklbABpsVsvSSP8jn6hUINqnGf7YdMFAnmt@lists.infradead.org
X-Gm-Message-State: AOJu0YyA5+MEWFLXZWeD8Z3NhfWytB+XqC3dJaX9mMyzD/IFn/7iEWlX
	O+ymr0UMBaFQ564ti64R5QWyDifI3O7vWra/uY0Ed+QuCfzumr8vfxgzcSrXLXxVInNAtc+M/ev
	xrflvlyrel0yZ4ax+YLe/w8AfRUgYtd6wCgKB
X-Gm-Gg: ASbGncvT+XkyzS/fVxeIiv7IHpqJQHFzXtqUwVRc5s7ZMvczGftuCupOE9VOJGpJFs4
	M+K173rq1Vf9UWgOwjwKvkVx7QpeEjBaefvqXtw==
X-Google-Smtp-Source: AGHT+IGsSvBb5NeTFEFieuFRV5HyhLeE2dx52X87sfKenFd+NyMxsYAEvI/Og3agTmlQN/UhBYvd4ItQLKLRn+UdUns=
X-Received: by 2002:a05:6e02:160e:b0:3a7:e86a:e80f with SMTP id
 e9e14a558f8ab-3ce3a9a5b0cmr70579085ab.3.1736450017111; Thu, 09 Jan 2025
 11:13:37 -0800 (PST)
MIME-Version: 1.0
References: <20250109-sparx5-lan969x-switch-driver-5-v1-0-13d6d8451e63@microchip.com>
 <20250109-sparx5-lan969x-switch-driver-5-v1-4-13d6d8451e63@microchip.com>
In-Reply-To: <20250109-sparx5-lan969x-switch-driver-5-v1-4-13d6d8451e63@microchip.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 9 Jan 2025 20:13:24 +0100
X-Gm-Features: AbW1kvY541xsGK3VQ1Tx1nbW1TdevUEFbMVaEmv3muHe44ALUjGSOGu6eh99ALk
Message-ID: <CANn89iKA=ha6y0_UHUp6Pjkf0H4RevRbD-CHswdBqk0O=KkNqg@mail.gmail.com>
Subject: Re: [PATCH net-next 4/6] net: sparx5: move SKB consumption to xmit()
To: Daniel Machon <daniel.machon@microchip.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Lars Povlsen <lars.povlsen@microchip.com>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, UNGLinuxDriver@microchip.com, 
	Richard Cochran <richardcochran@gmail.com>, jensemil.schulzostergaard@microchip.com, 
	horatiu.vultur@microchip.com, jacob.e.keller@intel.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_111338_951257_A22AA073 
X-CRM114-Status: GOOD (  16.42  )
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

On Thu, Jan 9, 2025 at 7:38=E2=80=AFPM Daniel Machon
<daniel.machon@microchip.com> wrote:
>
> Currently, SKB's are consumed in sparx5_port_xmit_impl(), if the FDMA
> xmit() function returns NETDEV_TX_OK. In a following commit, we will ops
> out the xmit() function for lan969x support, and since lan969x is going
> to consume SKB's asynchronously, in the NAPI poll loop, we cannot
> consume SKB's in sparx5_port_xmit_impl() anymore. Therefore, move the
> call of dev_consume_skb_any() to the xmit() function.
>
> Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> ---
>  drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c   | 2 ++
>  drivers/net/ethernet/microchip/sparx5/sparx5_packet.c | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c b/driver=
s/net/ethernet/microchip/sparx5/sparx5_fdma.c
> index fdae62f557ce..cb78acd356d2 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
> @@ -239,6 +239,8 @@ int sparx5_fdma_xmit(struct sparx5 *sparx5, u32 *ifh,=
 struct sk_buff *skb)
>
>         sparx5_fdma_reload(sparx5, fdma);
>
> +       dev_consume_skb_any(skb);
> +
>         return NETDEV_TX_OK;
>  }
>
> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c b/driv=
ers/net/ethernet/microchip/sparx5/sparx5_packet.c
> index b6f635d85820..e776fa0845c6 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c
> @@ -272,7 +272,6 @@ netdev_tx_t sparx5_port_xmit_impl(struct sk_buff *skb=
, struct net_device *dev)
>             SPARX5_SKB_CB(skb)->rew_op =3D=3D IFH_REW_OP_TWO_STEP_PTP)
>                 return NETDEV_TX_OK;

If packet is freed earlier in sparx5_fdma_xmit(), you have UAF few
lines above here ..

stats->tx_bytes +=3D skb->len; // UAF
...
if (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP &&   // UAF
SPARX5_SKB_CB(skb)->rew_op =3D=3D IFH_REW_OP_TWO_STEP_PTP)   // UAF


>
> -       dev_consume_skb_any(skb);
>         return NETDEV_TX_OK;
>  drop:
>         stats->tx_dropped++;
>
> --
> 2.34.1
>

