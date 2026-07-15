Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590A0C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 15:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uc9ixU7mpRtpCs70jSp612g1hyAczHyKoacPjXdxzoE=; b=lG2O9F2TnB3t7J
	cGjVh6HFsMccuwomvWe8/vopnCJtI179+nUfQyLbvxvLYdHEetnhcsFitf8CNPbaW8sphGm1EgVN7
	ysXemQZ4z65HZX2vo6xdZxiDA8LaEW3bnGhC4kJTPdvBy0CJEY3eNqLqlTpInl3avuHl4PBV8gaQe
	Kw8EAduiL84HDyvmIouwlVhLB7CoEX1dvrZqtN2kxMHyRBwtLhmO5Z1dFK4vMLHMIL6pfBtKOCp0L
	P4x3mssSjtLRsDIKiS93QnQzcz9umWhOcTU1XqZ3joN3oK9fYImhxiWV6l3uNrAGEh5hg0tJ24A9T
	ca4/bJYL/8OavxDzgNbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk19h-0000000FFL6-3xzX;
	Wed, 15 Jul 2026 15:04:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk19g-0000000FFKm-0ryQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 15:04:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F122641472
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 15:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D153D1F0155B
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 15:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784127851;
	bh=Uc9ixU7mpRtpCs70jSp612g1hyAczHyKoacPjXdxzoE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=lkZrl/va3yl6Q4VJC9ZefqvyJ4sx07gRYONmK6vWlBWL8XdKuvfHMxPJdYeM4YjuX
	 GKZ4xMRJ3XfaK0LI4OM1RQe7PG5uhjgRFY0EIdDY7OFzbzMSXKZHyrOPvYurVpseMh
	 dS26ABRzLqtUAmOSFGhQcauKcuCAXsB+4u4JJ5d3uHn7KWHd/6YQducbRzIS1cuQKA
	 EBTFm3xFSb17TEacdM18qE7rmvj+RI0YAupvqoXj0nliCH291Ik1zmra1LIbTJ8ku0
	 Xg2bBohiyv4kBv6Xe0+B2JCTdqaKs9yF93n037UfBlYkVdbWq9IKrhN2EPPhAqnZXu
	 VhbeYU9pQEh3w==
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-495b98b4f6aso2031675b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 08:04:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp9xZYux3KA+IBIGGIbYSivwz8SSifmQOh0uJZGsFYIXKm9eJMQedu6lsawtUtzWVwk7/B1i0P0ujoXPyLywAwC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+lvE6ZIK6k73DO2ATGoO2y2P727sk/scX+ZaMkEq+SpBQRp6t
	ReqNtmNTiMLuyiPA+TkYsWKne7uUO1ci32yDCPkbOZzFg5cSPRHv2Dcxj3zRyLCNumYNdSq3j1q
	SbyGzd3MDNSs5bQWcDjFdS9WpfLyNefE=
X-Received: by 2002:a05:6808:1703:b0:497:e39e:a002 with SMTP id
 5614622812f47-4a47a72a883mr3694530b6e.30.1784127850988; Wed, 15 Jul 2026
 08:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260715095525.40668-1-phucduc.bui@gmail.com> <20260715095525.40668-5-phucduc.bui@gmail.com>
In-Reply-To: <20260715095525.40668-5-phucduc.bui@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 15 Jul 2026 23:03:56 +0800
X-Gmail-Original-Message-ID: <CAGb2v66nAAdni7d5-D0iT0qDaA0evzu6KdtE+BmVw=9Tw+vQ1Q@mail.gmail.com>
X-Gm-Features: AUfX_mwt_greS7zKZg9j8B0HbmtSXlCaT15WYQ9IZOCzMApLlmkpzfRkYHxh7Ko
Message-ID: <CAGb2v66nAAdni7d5-D0iT0qDaA0evzu6KdtE+BmVw=9Tw+vQ1Q@mail.gmail.com>
Subject: Re: [PATCH 4/6] ASoC: sunxi: sun4i-spdif: Use dev_err_probe() for
 probe error handling
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Chen Ni <nichen@iscas.ac.cn>, 
	Marcus Cooper <codekipper@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, u.kleine-koenig@baylibre.com, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org
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

On Wed, Jul 15, 2026 at 5:56=E2=80=AFPM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Use dev_err_probe() for probe error handling to simplify the error paths
> and handle -EPROBE_DEFER correctly.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

