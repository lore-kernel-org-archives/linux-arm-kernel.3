Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99073C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 19:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+T85xG7RFn5rLmFPcEnHN9rx8p/ELEmXn/p/BMRsk4=; b=oUaRxfSsalIfL0kbKHHhwP3HDQ
	5LO7/sbKlsHBkBd2GdKXE8no6URwBX92qAHXOq8w81TVr3ZL4nivJ7UlS71QhJFwrqSO8PJ8sbOOC
	0W7vaZIixSanmwNFGL74jSSeuCw7Dk3pD9hgtmJKhuP9mCnbZrG44/W0EF397vSnftu8tT/Dn738G
	zXFpz2f9MOXxGRiAZu39P9q/UQkJBH9P1NALvpKwP39FoYr+MVodesoPWjHKuJ7bd03qmgT77dLwq
	rUHPlsx06OKZAVNr3DkcSQT270q1O3SLUWLfRpzFErjWNbTvMgLt5/O9KnKVeNX0wbmYUKtjeVhDA
	xSaCOcTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcptB-0000000Bx4w-1ZAS;
	Mon, 05 Jan 2026 19:05:13 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcpt5-0000000Bx47-3bDv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 19:05:11 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4775895d69cso1431055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 11:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767639906; x=1768244706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+T85xG7RFn5rLmFPcEnHN9rx8p/ELEmXn/p/BMRsk4=;
        b=cf82Qq/iLJzlOFNCojcZ1HQ8f70Ag3LGC5bXN22WjDRIwj9cS+0jC8yJ0FGStdWZnf
         RTmkCtlNheqMz8xfawzOnBSRcNFxYmnyg10KLIobwYodBnUAyMheOUhqNJq5XCdJC5c/
         IkAYdeJNbyJV82+8ziZDhDAzRmlUBG0/RHwMTasNrt2+RWcg1SFgSZhBDv/s2zvQpWQq
         n5RonQD0zB+V+kJlaC7p6nck6grv4YvQdmxYbRju47nDuRbjeeBT3Tr0YxLbcdLoVjlD
         s3xPjtkJy7QERDBc2Kd8gD69M19LjVVof4FS/iBGbA++dUswG7kKrIJ00E3fEx1Pz0Ns
         dRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767639906; x=1768244706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l+T85xG7RFn5rLmFPcEnHN9rx8p/ELEmXn/p/BMRsk4=;
        b=rMLcsJ6NVqw0UIy5j3Ez3gR7bayJf70zl9PI4cX7d1MkkcyUuW0fROrkYy3wReG1ZA
         1G8Hkfvf2+gmHMo9GkAJA+6qPo+uKppgN90sNG4wUpTFPvSD7ae16vkbP7mJ6U2g4pYQ
         Ixk4o7oAyUJlx3zD0/qLvUrMSzefrjg9GS/T47hpO7TFM//NE1kZ6Rod1phlIXNCYn6Z
         hVqOS1rO44nQFzXhLXOYF69pG4i+2ASl5H2BOAqQQIfkG8plJ+IXo81g6lLOlZYR2Vvn
         7EZ1m4v+iMcLIGgJormqL0s97/zNgKg6+TwNQiOC6c2BBbG7vvq7Vlb5q4wpg9jxdoNc
         7WgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeY2+GTDheqkAO/xEwIOLWG111vNHxy0vK9bit2T1U4Gc30x+r6WdHU1SiJ5EWOnU49LaiF2vUzK8uF4qU/3bc@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+ARp2akjPYU8SRLaAfNalvY1ZWmW6s+UTdfePyDkkRAHoK00a
	JBYQgHgK3T9ylhby1pZrzy7ImwBc2Tp/MliDXLG9nU9lny+IQsZTihyx
X-Gm-Gg: AY/fxX7uw8Epuk3rf+B7QsvVF7LCRUddPf3oafFk9u6lSXlG/fNpxBKULf4MiI5eXku
	aEtrQNNeJN1tMaKWOcn7YCMTeBbVlmJmhsazDuAnRKFGpzEhn4qajFcp2xBbOQ6KhFCCNVEPKoH
	SpB5hcRHQEdpKx+coAozqlHbvLeya0yy81lpeQZBt8JXAh96rkB14xFGbOoxTlY2yP2M3fSPEjK
	9TBMIJcp5bgD19+l6ENUQxgK/Tzz+6RbApLeJ9v4NDpT6TOH1Fc9VnE99we7O79S321E5tRpTXS
	SRkOFYySRzIV7wcT0GXxjbR6tO5OU2cgY+zAVfecVIRUl8sC05HNK2Umi7EnPRtIWfUY9Kyo4YJ
	2Hk6TFNbx26Ipu9YfLGDFsjAINHWLAKcf6rNmW3k8fRYq9hSj9dhJ40chCA1d7wp4nEHMG16UP+
	mngT3eVNFqcLjWba2cD6XyKGJDF/DoqSE5A1fD/GLzlvfQinC04Qm90JMWXNLKpfI=
X-Google-Smtp-Source: AGHT+IGlHrTGN9QhI9D4GcPAN0WpXBCiJkY6o1Su8HuTrk460ua/0mSfGa1CiVo2PPimvYizFp7ESg==
X-Received: by 2002:a05:600c:4f93:b0:46e:53cb:9e7f with SMTP id 5b1f17b1804b1-47d7f0929c2mr4085365e9.18.1767639905594;
        Mon, 05 Jan 2026 11:05:05 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f41eb3bsm2991115e9.7.2026.01.05.11.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 11:05:05 -0800 (PST)
Date: Mon, 5 Jan 2026 19:05:03 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: ebiggers@kernel.org, Jason@zx2c4.com, ardb@kernel.org,
 dengler@linux.ibm.com, freude@linux.ibm.com, herbert@gondor.apana.org.au,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 19/36] Bluetooth: SMP: Use new AES library API
Message-ID: <20260105190503.53cc31dd@pumpkin>
In-Reply-To: <859377de-cb72-4e87-8ee5-97f8c58a5720@citrix.com>
References: <20260105051311.1607207-20-ebiggers@kernel.org>
	<859377de-cb72-4e87-8ee5-97f8c58a5720@citrix.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_110507_914746_D09C4209 
X-CRM114-Status: GOOD (  12.07  )
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

On Mon, 5 Jan 2026 15:40:22 +0000
Andrew Cooper <andrew.cooper3@citrix.com> wrote:

> >  	/* Most significant octet of plaintextData corresponds to data[0] */
> >  	swap_buf(r, data, 16);
> > =20
> > - aes_encrypt(&ctx, data, data); + aes_encrypt_new(&aes, data, data); =
=20
>=20
> One thing you might want to consider, which reduces the churn in the seri=
es.
>=20
> You can use _Generic() to do type-based dispatch on the first pointer.=C2=
=A0
> Something like this:
>=20
> void aes_encrypt(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *in);
> void aes_encrypt_new(aes_encrypt_arg key, u8 out[at_least AES_BLOCK_SIZE],
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
const u8 in[at_least AES_BLOCK_SIZE]);
>=20
> #define aes_encrypt(ctx, out, in)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0 _Generic(ctx,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
const struct crypto_aes_ctx *: aes_encrypt(ctx, out, in),=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
aes_encrypt_arg: aes_encrypt_new(ctx, out, in))
>=20
>=20
> i.e. it keeps the _new()-ism in a single header, without needing to
> change the drivers a second time.

You'll need to cast the 'ctx' argument in both calls.
All the code in an _Generic() must compile cleanly in all the cases.
(Totally annoying....)

	David

>=20
> ~Andrew
>=20


