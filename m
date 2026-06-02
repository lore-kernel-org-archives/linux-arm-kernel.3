Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C391CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 08:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQremWpHulJgA0xC8GSKmqUNN54WassWQxieEBKaLLg=; b=kakmk4SQKGFnAsFP3GNf7vIW6a
	ZPgv/X+Q0qPR1V+sij2bRKd52RAYuzq9jK+wQCo43paPQhEwBiEZHQjr7YS62/oXIQZ66jXfGbnmW
	vO8bMeiRgxqCEYAqX02MiZDrshg6zpz58Lqbq0D+NEzjuwn3xSbEk6G9g6GrEBI+18k/feMBF3W2U
	M58KRXmgBSOtv8/2ftM1jLts6o4pAZ5BBJdw6pEtbHHBTrZ0sqLTyeSsYILg2iE+WopMRqpvs3LbC
	zH5pvXl63/j4HTgTCKstRuJ5EZmAFhbRPFxPG62oiidDDHEQQ8GpXl2EJFcky7yxK/840qBuM5gBg
	WJkRofOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKnM-0000000CbA7-3dwr;
	Tue, 02 Jun 2026 08:48:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKnM-0000000Cb9y-0JLQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 08:48:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E14D60126
	for <linux-arm-kernel@lists.infradead.org>; Tue,  2 Jun 2026 08:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBDBE1F0089A
	for <linux-arm-kernel@lists.infradead.org>; Tue,  2 Jun 2026 08:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780390099;
	bh=TQremWpHulJgA0xC8GSKmqUNN54WassWQxieEBKaLLg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CriX9yZMrlWbbMCO4OGOj9hb1zc1jzbOGRQqIHPYwVhbSc3iCfZ44gkJP781UnyhC
	 b53iKrtZODPXLiOm0VBe//FWhNFgBVZ1w+jjT85A8phdi7ZgS1l9PPxrD6FT/YGRGJ
	 4qovy+zAdjciDRwwOB5dGigOORfauhv8ypWPP/PlT04frThefM2HRgOg6doMD5tsIP
	 M93uc+qAhnmmPtNe9WaamSYm6nUVOsIHEIRfhxA6XkYUFGVyqmi32NNRt3RQ4knBLl
	 jEXp+raygM8GEeVj9L0b+9zDCiBSVbuViA7XXSTv4hvepkgpDHKsk+BvzIL0/l5XIc
	 ABiLaEhrCW51w==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aa5f06b16cso2888744e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 01:48:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+TGJ2exqV8y7UICTs/9N/cTg7EBFnSJYLLf9rKXQeh0MbdJkmYdggUa16vTpqhq4uuoviGDY8dq01gZsVLayMm@lists.infradead.org
X-Gm-Message-State: AOJu0YxjEbyFNzx26NWkX0MDCx2aqYKByRu7LyShtaC3pjuzMvkG+nts
	FN3lc+LhgHLouqmVdJKNVS0ajzhHpg9qUpXTVNtlZF7n1l4RjhggeDu1Vtuo/wCQODc7Vkw/256
	FcYIhfs1T4ucrS8iU4q66WzcDbEGX1fc=
X-Received: by 2002:a05:6512:3d08:b0:5aa:6d0f:1dd3 with SMTP id
 2adb3069b0e04-5aa6d0f1e9amr2405110e87.20.1780390097725; Tue, 02 Jun 2026
 01:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260531210747.11401-1-rosenp@gmail.com>
In-Reply-To: <20260531210747.11401-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 2 Jun 2026 10:48:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLk3HmmTBfjLaVKBcRi87EmAdzs9BGy6teerJ-rN92MtCg@mail.gmail.com>
X-Gm-Features: AVHnY4KpUZtZBbTRTEr9Tn5IC1OGG9aYmmZvoErnhrvt_7GfLjmo4gWCXcriDrE
Message-ID: <CAD++jLk3HmmTBfjLaVKBcRi87EmAdzs9BGy6teerJ-rN92MtCg@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: ste_dma40: fix out-of-bounds access from D40_MEMCPY_MAX_CHANS
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	"moderated list:ARM/NOMADIK/Ux500 ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
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

On Sun, May 31, 2026 at 11:08=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wro=
te:

> D40_MEMCPY_MAX_CHANS is defined as 8, but the dma40_memcpy_channels[]
> array only has 6 elements. This mismatch causes an out-of-bounds
> issue:
>
> 1. d40_of_probe() accepts up to 8 memcpy channels from DT
>    (num_memcpy > D40_MEMCPY_MAX_CHANS allows 7-8), then writes them
>    into the 6-element dma40_memcpy_channels[], corrupting adjacent
>    stack memory.
>
> Fix by defining D40_MEMCPY_MAX_CHANS as 6 to match the array size.
>
> Fixes: a7dacb68b35a ("dmaengine: ste_dma40: Allow memcpy channels to be c=
onfigured from DT")
> Assisted-by: Opencode:Big-Pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Excellent find Rosen!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

