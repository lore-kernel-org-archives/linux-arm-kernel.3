Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5C7C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 10:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/sqyq/N0S+vrqZhURmiXH//1HHfZWh7QUV5WIVAK484=; b=dfYNDPmEpnQiADJyri9TgzShqW
	XLYDgmVSy7MVF8wniq1z8CwLqUHsjEUYo+4VKY6I62NQLd/xvaf0GKCHGYQt6GL6LOsH9gRGBxSUD
	wgEsijKFzqYCkevlTpJYdkejLEXsEVaaPlw63CauvZmObCdEpn1genunYF4n5I+MMtZX3XgBQKCd8
	FE2dJ3yHLc4IjuPfW6qv1Hi8pqeV4AnOGeeXPJNUfbjAeA5DQdFhM5IbR9zN2d0V0/o8WRSiyI8hF
	NosOftP8Z4iYTPXhTjr0gQuhTECMTgriZNUPd7cHSsVei3prMUj/j17BetyJvdBTe40Rsq1CIQywT
	Ulcv/V5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZS4o-00000008JJ0-2ic7;
	Wed, 09 Jul 2025 10:30:58 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQIa-00000007zHy-30C9;
	Wed, 09 Jul 2025 08:37:05 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ae0bc7aa21bso1131185866b.2;
        Wed, 09 Jul 2025 01:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752050223; x=1752655023; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sqyq/N0S+vrqZhURmiXH//1HHfZWh7QUV5WIVAK484=;
        b=TMClPiSesO+NwMXNZnnYAUNfKo0e81Ja3hpYgAM1mxaoeGTxJNKUVP0VzaQljm3waw
         yvA9gbmYhsR/6gZ89oLuBmPVNzNIlCc9krCZHoKWYJpWuUnHI2OgjejadXlvYIVl0Av7
         f26G9Q/6drWhPTzt3TiL6zRvnYSqv42IntQM/hZiJgHxAw7BSGluCbub6Dds5MKSaT22
         L9n/l3Vzat4zpUwwYhhPXNRYryalCS6WBSAXwXQEYHgC93YYV/x3ofotxib+hd1HFnCq
         fuF+sSzHR7xT05FWRCOPmJNQPbjX6gPk/zmTT+QskDymRCBuXRwK9HFdTsWao9Xp/9Ox
         5Xyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752050223; x=1752655023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sqyq/N0S+vrqZhURmiXH//1HHfZWh7QUV5WIVAK484=;
        b=hFUU6myQdx+Qfj95ehD3Z1Vh94b4cqXI/ZE04o5ogzjcBBR5Em7koJ6sSpb9/XurFQ
         qwbo23FjCFKSjPAqbMNwYNeXt41CTtTV5ypbDEEzpo+EvtrENE+kUFfm0wQ6U4WoXE9V
         oz5Buw5ZIP2ytW8wRMLLgxOzGPA+v5DihvNO7pBlaA2IB9Ax/m9z5Ve+u2Tb9Iy2PIir
         WqjShIrk71BPBpE45d8li9GwZSyomZ+OoUbUzmvmJbvBBnf/165FWc3EG9c4cdNteVuL
         cCmIEeKIpC+Y8kBkJxhbJkkKbJILKzBP9+bJCG4JcM7MxuU8ugegMJEyQLyALGa+wNUA
         jcmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnoN/dTTqC2gKoDz0CJp0zzrNgAsCB/1ignY2FXiywr2qze7w1vEwUGVn1o082BC07XRHL1aWtNm6CGGxPDTI=@lists.infradead.org, AJvYcCVzR7qNi0wTNorJLh0oHx5cR4bayMJ98b7NXvOfDdnlVjmquZd+v/Zg7oS/hqIwV0q+pEFtbDLZ3awUJeBY2zUi@lists.infradead.org
X-Gm-Message-State: AOJu0YwSjcvFX6x05zaU/z1sEUVwf5QaTcSj8cO69/+mjysnuiZdhi7b
	QQDw+3/JUU9IangbM+Qse6KqwYw79X0R8DOcBh0wHQuW0y8SyXXvP3+t+QXQBCiYwlIzH/z9tyN
	QhCDyadwRk/4E05Lwv3qti5tRPrxFDyE=
X-Gm-Gg: ASbGnct8Hip5kQxLLszU8C+5839moyzHgrgTvEdr+kQQk1vaGqpCFphW0H6ZDI/clf7
	wZdyVxICln/z+KP5LT8OSqAoxqFST+EXxsvQzomMgyPf2f3vgfNf77pRA6KqEhrv+1kO41kr/qf
	2G2qsyFzL17gY2Kszpb8Vc1yCQ+TpqCQwb+6ExZV6/Fr6JQQ==
X-Google-Smtp-Source: AGHT+IFarB/pAhthZGxSmaigTl2Ns6OchHfYde2Yzn0xyUq9bfdzMcRihHWLHDvkY8Gvv6JTCGCQcfx1A2RnI4cRCV8=
X-Received: by 2002:a17:906:9fd1:b0:ae3:c610:d4f8 with SMTP id
 a640c23a62f3a-ae6cfc833eemr154726466b.56.1752050222797; Wed, 09 Jul 2025
 01:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <a6ab943f4660e39b8112ff58fa97af0507cd89e9.1752026324.git.cy_huang@richtek.com>
In-Reply-To: <a6ab943f4660e39b8112ff58fa97af0507cd89e9.1752026324.git.cy_huang@richtek.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 9 Jul 2025 11:36:25 +0300
X-Gm-Features: Ac12FXx6YH-CdoPfxUdo-nUC4uLppBywrRRRss5w3iOnMSu9H6ystcaHXc03s6o
Message-ID: <CAHp75VdXjXgdoZBgKHc-YcGFR-voPboXK8DHbN3ztWuf5jKigA@mail.gmail.com>
Subject: Re: [PATCH] mfd: mt6370: Fix the interrupt naming typo
To: cy_huang@richtek.com
Cc: Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, ChiaEn Wu <chiaen_wu@richtek.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_013704_754205_E5379376 
X-CRM114-Status: UNSURE (   7.20  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jul 9, 2025 at 5:00=E2=80=AFAM <cy_huang@richtek.com> wrote:
>
> Modify the lowercase character to uppercase.

...

> Fixes: b2adf788e603 ("mfd: mt6370: Add MediaTek MT6370 support")

Doesn't look like a real fix to me, although code looks good.

--=20
With Best Regards,
Andy Shevchenko

