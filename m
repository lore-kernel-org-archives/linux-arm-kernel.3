Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873DACA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 07:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rHRhyeJJgvjTRWFM2lkaFF4bn6Y6uY9RdWmXZLzzy/U=; b=Be3DlcDv8uoAmH
	RXBTlLeojwm9xC5b/VHcBhQS2QfPbWZnUoAeYbUaQxJugrq8nheROA0txZyYRUbesGxlXJ7VqgtRS
	VP/JEEzbptTH1yGrMUz9HywC7WDbVQZn5K13tKAAuKreatbr+ZkbnhBKokt/92saADdJ+CZ7eWKS0
	4//EEU/QIqWqlhXfkzzp0v+hgy+W103rhgtYUQEcvb+683jGwt2KVrp0D6VSQQ5jk0W4H4bi9RS/L
	noTwUy0O2W4qa8Z38isxO5F3K46+LMTrk3Zgqv69cpJpuHOf9qD4niR8KuQKrsmlzwYzzYLnYEIsN
	OyEcgDSwFCI4UbtwzmDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9mw-00000009lco-3c3R;
	Mon, 12 Oct 2026 06:45:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9mv-00000009lbK-2GU1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 06:45:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0266060D94
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 06:45:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF2A1F00A18
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 06:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791787532;
	bh=rHRhyeJJgvjTRWFM2lkaFF4bn6Y6uY9RdWmXZLzzy/U=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=IhaLhiZJo9uS26VlKwLdvMYpJNCGYxtG2z0r3xBmjd7Mo1MuDBAjKSECWVysHGagh
	 saiS6x/+gr9rkZNvYRkjEyM6maTZJz6qchu2g+BR1QoFWyaqWIF6qPJi5gj+Se0u2/
	 HHGH1BlHIW7fPs3HfJnbG9ocW7DQXRiiDuroRnuMB1BEF1jWy4xJWzCaQHuOkpE8xU
	 m95V7oX4N3uUI4ZOMIMis4gQVmUXO03EQA0WElLvIQcVwZRpWz0d31fba9tXPRNo2N
	 lbD0OgP6bpIeg0ABs04yrMlHF6m3xcllHpzjEJYO404NAIlujApGh+H89jFInYOY5z
	 6mtuWAuAJtCzQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a75f960be3so13512081fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 23:45:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz08HB0DJ6yYNjYwoKvOmGU1mACn/SXI8DIm1L+2R0RjwJUsf+/8620ECReKxmAboCPkZOTNGl6gBqpC8FNmsHC@lists.infradead.org
X-Gm-Message-State: AFq9FYK8bmYFFRALvowkf8PSHR9OloxoWDX59Mz4hCdGz8zD826/duk8
	MNxLwmt2PVM9otd2eAwi+E9TAK4XuuDhXKRwusmFYZ+GTgSPHWFQqoRkemkdvjpK0dD1sVMDy3s
	1TGdVN9uOKt1CN2eErlVYsBuXWjnxvgM=
X-Received: by 2002:a05:651c:a38e:20b0:3a9:f132:11ae with SMTP id
 38308e7fff4ca-3a9f1321220mr164111fa.22.1791787531105; Sun, 11 Oct 2026
 23:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <20261001022415.913959-1-iuncuim@gmail.com> <20261001022415.913959-2-iuncuim@gmail.com>
 <20261012-worthy-terrific-sunfish-3acbab@quoll>
In-Reply-To: <20261012-worthy-terrific-sunfish-3acbab@quoll>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 12 Oct 2026 14:45:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v67qkWscB2peNoY=ruhRPEpFd1pXVdbR4pJcpGfv4ZPurA@mail.gmail.com>
X-Gm-Features: AclHuK9HAKGtAlKRnjyjmrvJQfRp1uKpd11aie7YIZiINEatGkmlqkHIIaIp89A
Message-ID: <CAGb2v67qkWscB2peNoY=ruhRPEpFd1pXVdbR4pJcpGfv4ZPurA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add vendor prefix
 for Teclast
To: Krzysztof Kozlowski <krzk@kernel.org>, Mikhail Kalashnikov <iuncuim@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andre Przywara <andre.przywara@arm.com>
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

On Mon, Oct 12, 2026 at 2:43=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Thu, Oct 01, 2026 at 10:24:12AM +0800, Mikhail Kalashnikov wrote:
> > Teclast is a Chinese consumer-electronics brand. Add its vendor prefix
> > so that board compatible strings can use it.
> >
> > Assisted-by: OpenCode:DeepSeek-V4.1-Flash
> > Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

I have the same change from Andre already merged. It should be visible
in -next.

