Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0654BCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 02:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DevKPTwMgnfMY33tLxNP7YJQ+kh/p8Il+2rzMT1+A4=; b=lWMqbCNgmYRmvFk4bN/LEBc3qs
	GA6oEme4Da2uFg022XsJobzs1WzbPnJU1cN+xzHloTbA+VGXr+W1hiB4gySSVAnvjnFmeVA3Ue/RC
	042O8d4nv2KvM3nq4G62Iu7yVmqNI1R8nqsg6It0dp70/ljui3sCKdP/j/4uaTu5S/wtjiQ2ahQzx
	se2qdFf7sbyyhRyMBCZGSheH9+LkIcBtuHbCMYZgZ6xVRZsldfL7h5VwN0lo2EAxEsh/ObFhJ1RdQ
	2smMBShuonBcIlGlNZk9HfhqkJfElCmawMzsN+Uv25GCsw312mRjCIAMf8S8/eoqOsxAhZzCjkd+k
	v75hlV8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2KgS-00000006Mtj-44Ew;
	Sat, 27 Sep 2025 02:29:12 +0000
Received: from mail-ej1-f51.google.com ([209.85.218.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2KgQ-00000006MrF-27tY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 02:29:11 +0000
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b3727611d76so337964266b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 19:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758940147; x=1759544947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+DevKPTwMgnfMY33tLxNP7YJQ+kh/p8Il+2rzMT1+A4=;
        b=PFLsoQwUmkz9ytxJVPbXD7sXthzSvTn+Q/oXw7iLkP23mXhVXXfx0LJJjIO0pNqaCJ
         SKAVhwFviL1rPYwF0Hc58lj0AhrlwQvqryJVWTWYKmEdUAa613wAsMX6Rq81NObgM7JG
         bDaZetwG2X+CirUdFnGHO7WrR9b7z3HYzTdf3cciHf97ZYMYcAh+BHe4GlaZ2ePPceYw
         VPMh3Uspq8oGC3rqQF/yorRykUkw1+szrfy5h2QSl7ZZ5lTIQ+tUnv4pPesiFqS0j9Ey
         ZzT7m86QLdXr7wLNuTBg77Ivt+rLrAqYIpIE1rOPaNwPta+38JCddYRyHKTIwwAyeNYk
         08Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXaw4hO4SPyBZW1coc9WvrBzluWJZFjxxBoqPmsFPFb7J3PNdxXfCZ9ZUqfbRnE23hZKV2pqlfWlr6tfVJNiOzw@lists.infradead.org
X-Gm-Message-State: AOJu0YxtK6XBsLx0K590HASs14FF+2mVWHOtuvQMzgtfA81VGh054sw4
	xGZlyDa4n5a1FJZ1zuoTk87wtZh4urZElPWjL9rtKIaGzdj57RxKJz3gIz6p097H
X-Gm-Gg: ASbGncs+mnT0h9KIoYqKUENjHZ/2B/k6G9Lnz/fwuU2akgjzXDdr62twahIuY5D5/SQ
	p1cPgnBoXYbUYvlFv1Mz9KAI7bEfV4RGaiBHih+/UO58u+CB/eJbeJRT+6qm8Vrc0/tj81Wz8/a
	dfkVB/Ohyq5ceU4GCnuG0Xudz2m1RIuMQ3mpWOG9WC+RbVPGBk5gqGAiiGFirmdkM+Zug5x+rqc
	tnWVj93RTKsNbMQBSOHZJt8+rtquD048B85KKoaR75k5kXarBqydD+wf/zVrGuNec67EcDX96M7
	RzFHocbKD1s3TQPGtCPW/kOOMvXcYe7pZyNKpxiqMQCkox+mWQg4xe1VDIcaGUi1L5UCP7c2hwd
	1vLqQhs/QfKLr2GrgPOvsz4SX7wjnYCPY+ajoecitwxD1Y/qqo1TmQiKn1SrihRJ9N7xhh2HKZ1
	AUZWWP37bj
X-Google-Smtp-Source: AGHT+IGfLuHvvFVqFIaWhywgb38lyTlrLP/fMbgBuqeVL3OaFvfmngeoCdFCUuTedyFkQc/GLlsv4A==
X-Received: by 2002:a17:907:2d1e:b0:b2f:963:1d2f with SMTP id a640c23a62f3a-b34bef98b74mr1061776866b.51.1758940147522;
        Fri, 26 Sep 2025 19:29:07 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b37b3b46ba0sm275143466b.2.2025.09.26.19.29.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 19:29:07 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b38e5c2e055so194119466b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 19:29:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW9XZnUHIyvJKqCw1Hlg7UC9aPb53R9+OrT9XcQsCWIMDqOYUrJ6dFBlZsefd4/60AUq5RKKkbZxn+V080j3rI5@lists.infradead.org
X-Received: by 2002:a17:907:2d1e:b0:b2f:963:1d2f with SMTP id
 a640c23a62f3a-b34bef98b74mr1061773766b.51.1758940146614; Fri, 26 Sep 2025
 19:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250925-macsmc-mutex_init-v1-1-416e9e644735@jannau.net>
In-Reply-To: <20250925-macsmc-mutex_init-v1-1-416e9e644735@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 26 Sep 2025 22:28:30 -0400
X-Gmail-Original-Message-ID: <CAEg-Je-+dK+Weixf1iP7hn6dt_CXWTYraA=TSr=rMPkyoJVHbg@mail.gmail.com>
X-Gm-Features: AS18NWD9i2Ce3lSv7X8ID-5SK3bN9ENqRcod81yTbnB7Qdrfx1pZRHR_ctdLGks
Message-ID: <CAEg-Je-+dK+Weixf1iP7hn6dt_CXWTYraA=TSr=rMPkyoJVHbg@mail.gmail.com>
Subject: Re: [PATCH] mfd: macsmc: Initialize mutex
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Lee Jones <lee@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_192910_553499_5CAAF865 
X-CRM114-Status: GOOD (  10.95  )
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

On Thu, Sep 25, 2025 at 4:33=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:
>
> Struct apple_smc's mutex was not initialized before use. Surprisingly
> this only resulted in occasional NULL pointer dereferences in
> apple_smc_read() calls from the probe() functions of sub devices.
>
> Fixes: e038d985c9823 ("mfd: Add Apple Silicon System Management Controlle=
r")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/mfd/macsmc.c | 1 +
>  1 file changed, 1 insertion(+)
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

