Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CECC531D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 14:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSnnUvI2mi0NCU23ygzDYKRZyp/HiDYy1Aw3/z9yIt0=; b=qtpiZdzMF5aLxXYQ91X8hQeeGr
	AmiEnjGUj0wIeioYnOEEAaI7AVD03scJgjfI1WRnM2a7sJTwzCt/faVG6E0hwpOIJpf6VZxt2pTYs
	glF4J64uyCcK1vxTOXSasNMqDQh63ee7A1KMVqZ8bWJYaDQEma1elGCLwdnt7OJMSQ6qQ4efYOeN3
	FpPRdEPJlpR5Tbw8AyJh8+kGchj1gcbwhtPRXMEiO0ucf5LTUW9QsCoJuKLx6QRg17TkBlzitlD/O
	jjDv9ld5qaheGVb/TXqzLcGiJSJBW2M3RJDe60dIVk2To2C9R5JjvXYG/iANxZ7qI+jIaU7aUC8xK
	QAmQ+QtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmu0l-0000000ERqD-0doU;
	Thu, 23 Jul 2026 14:02:55 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmu0g-0000000ERoY-3D1S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 14:02:54 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5b013084dc2so597023e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 07:02:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784815367; cv=none;
        d=google.com; s=arc-20260327;
        b=VaYPDrbxOMVO5Vz8dsptRrkgazMiopdXBxqckbGhoRXtxhbVTXQ4wAEM6HIJQRo57l
         6T+oC97pFk9H1iWAmcGQxFJUJtoGo3mEEmAXlxFSGoZT5wnG/n2mzy1O+r+XEidDoVeY
         5lPHujeJZGbPPPuxRs/4QbcCAwQYoahyG3zbHDgBtZIhUO3wdlaVNjOUArZL9uB0d4xj
         GZmWc+cBKCJ28IX7mEjPSeJPQ4cGOFHzpo7xIaRwGzDFntmertk38qTFhVls+YIuX036
         s02P6Aeipc17pwm0GIvgWH4FMuClr4ULG8f2MHMtqA/1jDDQdeKlp86tr4y/3HNKUeA6
         QV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aSnnUvI2mi0NCU23ygzDYKRZyp/HiDYy1Aw3/z9yIt0=;
        fh=UQV6rL+5gEIEeXam35kY0ZpryDHjCZlJzj7djxrYp70=;
        b=HW0AyVvBQi/cbZ5XtVoSonhYiGPBHKC71o8xg3k+cxsHFj6CQAM4LGslEQXlGwjc8r
         fYgvZivS2dlEKu5LRw3qIgNsiSsPHpoCteJqE68sm1Aw50YynLYbiiTiUkzkYiZLlGYS
         Ni3Kwn6XSioYUFkwi+S9az7NX89PSjA3o985C8Xq4C9iA4q0uJqBcHgs9QTdWVwBobTc
         f3MNy/cH6dVwm+sd3Q2XKgyLvDzqpKKDLpikdJDSu6TdOuMKAbZC2o6fioKZnog0T338
         AxzberB+eK5ht2tHZynVyYLlKjyHPkWRHUHDVzHng7FBBY7ZZ8PLqCQ0K/p2ZfQn+qZs
         3L/w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784815367; x=1785420167; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aSnnUvI2mi0NCU23ygzDYKRZyp/HiDYy1Aw3/z9yIt0=;
        b=aOPpRBPPK7jC7YswsroLneGxXNZj/YZiaZxYNXcNOANAuzYTgczj8jvuEyzo5/V4bN
         8VV+CRxo3kHXT9Vl+tzL0VyjoXcHW06YiEfSvcmMx6JewsckA29vGfeos+s0yXg/WNVQ
         yLp6lXkzYuTpbghTuhtUAgzc+G9CZoLKEQ63e7RNibrmwlxGJzqbylTndid1LTyT5k+Q
         SDAhrZ2GWaWrXGUIXLaBnfro+LC52s1mi+oCHNqvG4ZhfZfJnFPVqIn9UQc9eSINJ0xc
         d+h9d2LWYZmt6IoP/vkRa9cE8KvFV7F+/q69lFyy9KF0zRuYmsoRJ6iMoePUBpbnn+1X
         srZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784815367; x=1785420167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSnnUvI2mi0NCU23ygzDYKRZyp/HiDYy1Aw3/z9yIt0=;
        b=fO+JSnM+Hb/Pd1sTrRe+gVmdydI7DYYXis0qI0cbnKPiLzK8rSyk5/HcEb8kgXdRnM
         RXfWh/dEMFEpBNmLdGufRayUF8SueQEOIkC6wpDbappHooSMoikVh1++RLKvmSxJnI64
         P0PbHy0ArZgOkBkZApigRbv2i96d90oYRZB6X4sJRfK8nh2VTcwXAYGn1UKmbTH6WxFe
         Ef4knQ4C166Du4cMpP97Wzza+iWJP0A6Jm0gL6vswPN2hpTQdZNPutEhJZCOqrGhaK1G
         IWoDQUOvfKaO2Lj0d2NhqD1Al+UWRtnihgMs4zULtEnHZazV2at+ocBKDecVw0SeyScU
         goNg==
X-Forwarded-Encrypted: i=1; AHgh+RqnwzjNqsB9+gZ1aOVW2boB5vpw1XaH3LNJfU7aJ+eRR8OELJ3rddRGbtB8CLxChphCYlcmMgCygu3JTevYJkrL@lists.infradead.org
X-Gm-Message-State: AOJu0YyLjNAVCnOS+LrBaf5K8DQU0jwQpkaZlpfOsLxIf4mvLOz2cNH0
	4w48J1QOZNv9ypsG1B5K8lpaFh6CBTujZbNJDL0lltGq8YpY4DxQqLXaoY2YJS16G3uzdsp0Yxg
	hnb+kiAusNi6Ntag3aHKiGRNGcxbfQ5LQ3pqiPBK9
X-Gm-Gg: AR+sD110FUxpAIV5jk5UUqevxBQNZepCclZZEjoCoAZI6z/tXcc8k4rr3ZyMXiIndP2
	YObLVkB3sIFWapgFN5uNNIZwIkFQvcpQpWNa1QhxmRn91BZYguA/MXPvZK+EpUoUjJq3VJrGAX0
	YD0SneRT/SkdRg6BgVxh3sNjdy0GqjB5wIzXH4EIi1zIFg5YL3xI8NlV6BF/TRDzZjjkQNGzeMp
	HQm40JSzDpc2bxvT0D5VySsfO3lqfiZyT+RJThnNP9sohux8As8KqrchuGm7bXwW9LVufkn2BAH
	5ypZvLdlJ8svFxI89ZjGTBOXCqktUHzNv4VgNGkvknnvMlI=
X-Received: by 2002:a05:6512:6c9:b0:5b0:1dd0:f20b with SMTP id
 2adb3069b0e04-5b2b2e4b2d4mr696890e87.6.1784815366922; Thu, 23 Jul 2026
 07:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260723091601.72103-1-zhaoping.shu@mediatek.com> <20260723063935.75bf55e3@kernel.org>
In-Reply-To: <20260723063935.75bf55e3@kernel.org>
From: Willem de Bruijn <willemb@google.com>
Date: Thu, 23 Jul 2026 16:02:09 +0200
X-Gm-Features: AUfX_mzhMSefwo5xw0q7T6LspWMg8-GnaTmUAQUYLYyQ56qOjHskx1_zLVTsEoY
Message-ID: <CA+FuTSfgBbPkdLanqEgbDq-jLVQJax4fUxQ-tuzTuFwQANwxBA@mail.gmail.com>
Subject: Re: [PATCH net v2] net: gro: avoid nesting TCP GSO skbs in skb_gro_receive_list()
To: Jakub Kicinski <kuba@kernel.org>
Cc: zhaoping.shu@mediatek.com, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, horms@kernel.org, ncardwell@google.com, kuniyu@google.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	alice@isovalent.com, sd@queasysnail.net, eilaimemedsnaimel@gmail.com, 
	imv4bel@gmail.com, hw.he@mediatek.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, haijun.liu@mediatek.com, 
	xiayu.zhang@mediatek.com, lambert.wang@mediatek.com, Iven.Yang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_070250_823836_0F27D2F2 
X-CRM114-Status: GOOD (  19.48  )
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

On Thu, Jul 23, 2026 at 3:39=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 23 Jul 2026 17:16:01 +0800 zhaoping.shu@mediatek.com wrote:
> > From: HW He <hw.he@mediatek.com>
> >
> > On devices that support both NETIF_F_GRO_HW and NETIF_F_GRO_FRAGLIST,
>
> "devices that support FRAGLIST"? Isn't it a software feature?
>
> > the hardware or driver may deliver packets that have already been
>
> If you have a driver in mind please name it.
>
> > aggregated into a TCP GSO skb with frags[]. GRO may then
> > aggregate the skb again in skb_gro_receive_list().
> >
> > This can create a nested GSO skb, which is not handled correctly by the
> > later GSO segmentation paths. When the skb is segmented by
> > skb_segment_list(), it not be fully restored to the original packets.
> >
> > Avoid this by setting NAPI_GRO_CB(skb)->flush for GSO skbs before
> > aggregation.
>
> I don't think we can do this. For GRO_HW devices re-aggregating
> in SW is quite helpful, HW often runs out of contexts or times
> out too soon, generating skbs with 16kB..32kB of data, the SW
> can help bring it up to full TSO.

Also, after e751256486d0 ("net: gro: fix double aggregation of
flush-marked skbs"), it's not clear an another bug remains.

If it is: as said "nested GRO" of hw + sw GRO is intentional, e.g., for BIG=
-TCP.

But it may not be anticipated for skb_gro_receive_list. One option
would be to skip the fraglist GSO optimization for such packets.

First I'd like to understand better what exact bug remains.

