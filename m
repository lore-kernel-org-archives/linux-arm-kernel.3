Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA84AE77184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 03:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w68OVCNKDRUYLbgJOcwMFHEvgy4OB2hhFbrartVXJTg=; b=CUlUkmlkYAN9f4hPPjfOe/2PMF
	GPBSCtasydsx1gBC5r9aYCq+0Q4vYZ8E4eYTjIX4FIrB4gBegckTv8MeodrqpLwKG2FExXW5RfpBz
	tUbyRQTE7U+o7uf57ddxwgNy6TYjzSl17BYQcuxAo+BvhT9C7XnsVseYWrrCFg2x94FwuC2v/TRSL
	AyB42OgFYDvhLouqvt+i6AdEUBSIF+F6JL0dxprgKM92D+Ya4HNFDDXDrB8a0mtBEQEVONcCsGPAP
	o6y/SXHe2zRIxMZd9Hu58mB7hGTY/znqHEdLCPV7iEjbqxhFCzezvA1ps6KFm759qpAbS1KbzRwEd
	r97u9t4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOTPF-00000003mJJ-1REb;
	Fri, 20 Dec 2024 03:10:25 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOSJ2-00000003gUZ-3Me7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 01:59:57 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3a8c7b02d68so10407625ab.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 17:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734659995; x=1735264795; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w68OVCNKDRUYLbgJOcwMFHEvgy4OB2hhFbrartVXJTg=;
        b=d+CkOtPo0DhZQ6p8QqZ4uFLMMJDqWK6mUeXJrPt0ApGHyjSQVosTJ8vcV414jh9dQm
         qZlC6mH7MQfgNdOESPuRXt7LvLEN2dHgp8GOcYUEtbvATxiOh0WFl6JZdzagrXVvKP1H
         l8M7Qpaqxng8+nTdlqFvAdUBDnTasDZGtPB6+g6Wej/dWZ69OKEFUAfguiAKf0AqWzXS
         5pfJeh4fr3Vw2rZ5o5J0YWQcojWmD3vBAwvRVdMWujqQWj3UZe0ZSonE5g22flbnHeYi
         tLXRcIMpNEm5ANx9bUkF1g1xHNMBGKGoXFOCb5ELhoWS+oYVV9Yr+yf4j2uu+ZddEfw2
         6tNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734659995; x=1735264795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w68OVCNKDRUYLbgJOcwMFHEvgy4OB2hhFbrartVXJTg=;
        b=AIZRnB40aZ8O/HUgPFgNJvngMadCwL1nT5sM7d8ZnjPxmdGft6ohzmhFiMGQ9vSksU
         xc0eALwS7KDUsW0uiI/n0EW4L7w+FptTFP9VIzpJRwIJURw1VQaBlQk0/ftEiZX7kGxp
         cN/DVvn6iR4NKXPUTFduKk0iwgAqzQvhQZWLYnRYbKBvV0TEzd2R/w87/ZV/7NeE9MWf
         ewNd+6o0UD7+teyCS4RNXkULMUonRUnGYoXgpsaN2IzyMrfe2QCwP7yq9BUL3H/FVt9r
         wkkqv4D5mmLEYAxERI42DXXpZI1RIQcIqHMI/rnJXNgl29kHHf2RK5KVhHO6jH7SKv3p
         v2ng==
X-Forwarded-Encrypted: i=1; AJvYcCWCrlrvBtIzlcI7IKgAOTsSyKmK6Ktf7G2ShgJi0d/GC8aqAxQN+ZqWjEK6af0FHQtaHqUN/FpWntgcrw3fOblk@lists.infradead.org
X-Gm-Message-State: AOJu0YxbTa7SNSKzaswn+HNriebZC0sAVckkQwQYL55Fs15ou7ZFbDfo
	NodR3Hz4S8+9DJPSy1VrZHno0NZCUoG1EUEuNTdjci+Tc97rLabJmMdvZAJov/cItDeuJFXgatW
	V0nXy1zarlJDT7Jyx+gvZYZh+9+o=
X-Gm-Gg: ASbGncvGU4LbbcHVj3Zk/6iz+lGhpmPZ0JZbPF97fGCs3aITB/FttGetw/U20ncLQvn
	GiLXHzDjSeetKtUEJBUghuBZtQq3u/xi50kH2Qw==
X-Google-Smtp-Source: AGHT+IGGWwEgfDagGWdRJ2sz9qd4EJDpuuMO//PocPQVWC4Le5q0Eh1GxoTcg1NZhKqs+MDGDTNUymTHBZPUut5L6BE=
X-Received: by 2002:a05:6e02:2687:b0:3a7:e83c:2d10 with SMTP id
 e9e14a558f8ab-3c2d5b37857mr16006015ab.24.1734659995420; Thu, 19 Dec 2024
 17:59:55 -0800 (PST)
MIME-Version: 1.0
References: <20241219105447.889CB11FE@mail.steuer-voss.de>
In-Reply-To: <20241219105447.889CB11FE@mail.steuer-voss.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 20 Dec 2024 09:59:44 +0800
Message-ID: <CAA+D8AMO+ia5ztD8Z97TOn-NBbXKHfd+T65zBc6vJuNkeVdVhQ@mail.gmail.com>
Subject: Re: [PATCH] clk: clk-imx8mp-audiomix: fix function signature
To: Nikolaus Voss <nv@vosn.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_175956_839823_77A7A573 
X-CRM114-Status: GOOD (  16.82  )
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

On Thu, Dec 19, 2024 at 6:55=E2=80=AFPM Nikolaus Voss <nv@vosn.de> wrote:
>
> clk_imx8mp_audiomix_reset_controller_register() in the
> "if !CONFIG_RESET_CONTROLLER" branch had the first
> argument missing. It is an empty function for this branch
> so it wasn't immediately apparent.
>
> Fixes: 6f0e817175c5 ("clk: imx: clk-audiomix: Add reset controller")
> Cc: <stable@vger.kernel.org> # 6.12.x
> Signed-off-by: Nikolaus Voss <nv@vosn.de>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  drivers/clk/imx/clk-imx8mp-audiomix.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-=
imx8mp-audiomix.c
> index b2cb157703c57..c409fc7e06186 100644
> --- a/drivers/clk/imx/clk-imx8mp-audiomix.c
> +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
> @@ -278,7 +278,8 @@ static int clk_imx8mp_audiomix_reset_controller_regis=
ter(struct device *dev,
>
>  #else /* !CONFIG_RESET_CONTROLLER */
>
> -static int clk_imx8mp_audiomix_reset_controller_register(struct clk_imx8=
mp_audiomix_priv *priv)
> +static int clk_imx8mp_audiomix_reset_controller_register(struct device *=
dev,
> +                                                        struct clk_imx8m=
p_audiomix_priv *priv)
>  {
>         return 0;
>  }
> --
> 2.43.0
>
>

