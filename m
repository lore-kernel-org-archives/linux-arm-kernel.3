Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6DACA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 09:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JcOgKF4XM/l9A+xkMjDxwLxSXbEYIbrK+MMKAo104Mo=; b=U5d48EvYA4cgAZ1UTUrT1iCgkq
	AK9blO3mRegQSmOsy050Oi0k8SU4Amj5USGmKULBWd/Oyp4atEL0j0aBGgmPKj5uJb3hqag/NSP1d
	HaghuZvMHrACoARDg3WfFLBKbQy7df1N2iThRLMohM/XxX0M4mhRV7NFt1ywTTOV8S2Mf+3TYOKfk
	BCRjs6cjVNxGWxHoJ99dGmlA30WHySJPFAdyag25QoyzR3QBsZ7oHY6y5RGitho9dkQY9J2LxoWrs
	1owyWlAVbemp5AlrvHV5RG3OY9PLdblV/7irdLU1IKjM9eDjubTTPhzGZ7JTv5AXmZ8vmkkXAdERe
	8haCEVuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCN3-0000000A412-1zUq;
	Mon, 12 Oct 2026 09:31:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCMu-0000000A3y7-3KIJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 09:30:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3646843B70
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 09:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ACDA1F008A1
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 09:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791797452;
	bh=JcOgKF4XM/l9A+xkMjDxwLxSXbEYIbrK+MMKAo104Mo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Y0RiYvbbyQjLEt9FzUTJMM8Ke7og2fwaGtrMdHSeL0MMJbsKO3JmoIbOXz58033pV
	 3l1KyJx/foVS8pHbPVTnGUB6kh1D5LVTL6LcNzURvkolpFl3HmxRLF7CPu/Va7N5R6
	 wCVD3zYPx6v5mmWxtP8qAhJ1LxlrJNh5+mC21vD8x2KlUMtCAKhPEImaMUpjWp/Ble
	 VbAzrViPrm1/hMcSxKQuactdtNPnofxbeJ5ZBb+X48/772/fISYDW0mPl7HU0ha0bc
	 Y5C/WUlk6Gda1kRmAmEKayCNdpMv/DKhf1S2GrPPOotX70oa862QNIHwAbWhDmSnvy
	 EmWuJD7nVEZ8A==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5ba328513b9so1236337e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 02:30:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzTanwbuOAenKRUuITh8OrZSzKmfjzgFjzU7Y22y6mj6cptrUMbQ96VyYONpZlejquTvyY1mQq/zM6vBNBqxCLC@lists.infradead.org
X-Gm-Message-State: AFq9FYKvzJl1IhaOZQ8QL084evwspFOK6RjypWmWEdjSL+noEl2qvZ/m
	uH1+QAKDYJPpSyxuJzxFiGRerU8XdfWYh2YbwtFddF9femwAzVrg+8f1RDlkShd9Gd++3ZMu/Wx
	3U1IQSs2FWTtSKbbrgsjqpHdlEeBWV90=
X-Received: by 2002:a05:6512:6882:10b0:5bc:e45b:bec9 with SMTP id
 2adb3069b0e04-5bce45bc053mr1468335e87.35.1791797450757; Mon, 12 Oct 2026
 02:30:50 -0700 (PDT)
MIME-Version: 1.0
References: <20261007060107.62221-1-pmazzini@gmail.com>
In-Reply-To: <20261007060107.62221-1-pmazzini@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Oct 2026 11:30:38 +0200
X-Gmail-Original-Message-ID: <CAD++jL=ooz2tMZFrZ_ssH15QSf-hxJJ7kGhRxhBFRx9QAdhNtA@mail.gmail.com>
X-Gm-Features: AclHuK_cjy8EpD9hefzb7XTUyJ7Wfeeo56o29JsaDB2w0FmhBq4yW8z0mIp2Xg0
Message-ID: <CAD++jL=ooz2tMZFrZ_ssH15QSf-hxJJ7kGhRxhBFRx9QAdhNtA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sunxi: dt: do not accumulate npins across
 probe attempts
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
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

On Wed, Oct 7, 2026 at 8:01=E2=80=AFAM Pablo Mazzini <pmazzini@gmail.com> w=
rote:

> init_pins_table() adds to npins in the driver's static descriptor, so
> after a probe deferral the count doubles and the next probe fails with
> "pin 0 already registered". Reset it first.
>
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
> v2: reset npins instead of counting into a local (Andre)

Patch applied for fixes!

Yours,
Linus Walleij

