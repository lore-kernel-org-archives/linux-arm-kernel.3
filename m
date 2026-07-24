Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71400C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 14:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4N3ItXJXlLDuayGvYw0Er4J15YWZM3U77r1bMBZFL+E=; b=TjkVxp+HIk1Nyf8km/D6yNaV4P
	w1Ihlf+HGHzQGYC65i1yFwedx3085eMZKlAmgxBDjZJNu7jSMw41oSkuIlrk8kEGmafHurX+BwQRr
	+6sn8FQVLAoOhsZDU/tDGEaUdwmHZNyBN8/1Qq/RWtAH0CIUi0/6tSU3PFe4n9tlG7yTrQ9yrary3
	oDnUIeUQgRTv64HYtFhZQl16J+5c5ai0DYglAr3BGhlfm4lGh7aY6t78hRFEjLxHnotkv56dgRFtO
	I/U9iJ40w8+QYGJWi/bShhq0VBsaHJF1XwQ1wdYcsDXs7+4//NREiy8c5+A1RlP4xd4yl4/SLHqmW
	Z/wbqQgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHBp-0000000GbVS-1jie;
	Fri, 24 Jul 2026 14:47:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHBo-0000000GbU9-2gDA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 14:47:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 81D85601E0
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 14:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0991F00ADF
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 14:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784904471;
	bh=4N3ItXJXlLDuayGvYw0Er4J15YWZM3U77r1bMBZFL+E=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=OfK87MoDdjrotp6ryPlAZygKzf5nIWwm60SCflXHoHGwny/QrFQbBzkeoNd73WhJR
	 EopYxg0SW8RMTehc6eJu+9Ou8JAEcacMVIeZexz2R5MkYcn6NNF95lPnLBK9wJ5ph7
	 HBnbvSL34A1H/t7jFTGIroVk1d5eTsNxyMTKPmOnDoN/OkYWdnkjS69c6XhyL2F5N8
	 b0ZyM/QnM2GGkW4CjZN9ym7a85K/joSxD6pSJSDakUrjvX8vL25b6tbzUcoscCaWlV
	 3fbYC6M2p/sBB0Hs412n9+fdJyvJ7/l8E7hoGTc/vOq+keftvVFhM25td/1+qwKaoF
	 IUwBX91VVAJEw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b29599b81cso573088e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 07:47:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq6RAzU0IIgoDhgSGz17If+SXaAcsXXx55it4HGvtbcob5agpW3mAMjYzqH9hJhzylWH5X3nF8n3vo8fj1941ku@lists.infradead.org
X-Gm-Message-State: AOJu0YxlhFWVExHLwOygXzNgzx6BmmR90RRqK/HUNPa79Ntk6vNq2Dov
	9b7GV168iFoMz1m8J0UaeL1jsThruX0W2iZpYdhJfejwWraJ+ARD6qxp4Pb+nDbnfzfAOgueadw
	h6RBx+gMXWBLKjlp3zNpD0juNR100Io8C4UvcRxF19w==
X-Received: by 2002:a05:6512:3706:b0:5ae:af9c:c064 with SMTP id
 2adb3069b0e04-5b2b2f77e76mr1176358e87.60.1784904469670; Fri, 24 Jul 2026
 07:47:49 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jul 2026 14:47:48 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jul 2026 14:47:48 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260724141414.GB1876@sol>
MIME-Version: 1.0
References: <20260724050645.223799-1-ebiggers@kernel.org> <2026072410-drained-acts-3502@gregkh>
 <CAMRc=MdJTFokXLEbJMQW3V4FAMQid50Vx3fDB+CaNGUrzX-Pwg@mail.gmail.com>
 <2026072412-decrease-sandbag-70a1@gregkh> <CAMRc=MeFoG0UXYOAqYhCiKBTs12EjX2-Bz4wDnbeYXmQA3-OaQ@mail.gmail.com>
 <20260724141414.GB1876@sol>
Date: Fri, 24 Jul 2026 14:47:48 +0000
X-Gmail-Original-Message-ID: <CAMRc=MfU1egvJwmgPEN-GXPbz8_JL2XnP-LV0T2+jG-drfXYwg@mail.gmail.com>
X-Gm-Features: AUfX_mxiLdlLDPuAY8bGYAp0jB_4PqlJMNgcVDkjsy6Zb-mnOtnr1gmlaGXjefg
Message-ID: <CAMRc=MfU1egvJwmgPEN-GXPbz8_JL2XnP-LV0T2+jG-drfXYwg@mail.gmail.com>
Subject: Re: [PATCH] crypto: qce - Remove driver
To: Eric Biggers <ebiggers@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-crypto@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Demi Marie Obenour <demiobenour@gmail.com>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 24 Jul 2026 16:14:14 +0200, Eric Biggers <ebiggers@kernel.org> said:
>
> And with the defaults QCE is *never* used.
>

It's almost EOD here and I'm going to disconnect for the weekend but I just
wanted to say before I leave: this has never been a reason for an aggresive
removal of any driver. We remove drivers when we stop supporting entire
platforms, not mostly unused drivers on actively *supported* platforms where
they can still be used for experimentation and testing. I'm fine with dropping
this from arm64 defconfig but with fixes, the BROKEN tag should be removed
and I definitely object to removing it from the tree. How many people still
use greybus? Should we drop it from the kernel too? And I'm saying it as
a project ARA alumni. :)

Let's pick it up next week.

Thanks,
Bartosz

