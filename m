Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BAEC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 18:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMCnbrJiSVgsnlnzip6/crB87NSMbiRPqYzRRrVE8XU=; b=Bo01iEsnnqZGCorVCsWIbdgLEA
	PpJlfsF/3NlYHgDvxSNRNMvFQSMhtUZRHyGqkCN7xbF1kwk8BmaVl865ML4m0cPLb/zbVse5L2vaQ
	tWQVQx5Q2slzHeLyTzMDn9+pEdMclmhj1neO1VfHXDCQ8dD3dcPEO7P/TUBcN+dLUl5w4cqqRjizs
	wz4Ub5xhQYrteuFJrx2PevmhCpB8EzH3V6UcIVLIXMGf3Ws+yQ9ztNpdpHAkqhd2YpY23yKgxc71L
	JEHcQvEwHC5IRHqLbGquuQCr7nV4HXciySIGQYLyRQo9qX1oqKkGvJ+BlnEHVAuuHWuxvvKt0xLwe
	jL1yM+wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4OhL-000000038YT-1e3M;
	Mon, 14 Apr 2025 18:38:23 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Oa5-000000036az-1Bbe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 18:30:54 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-30bef9b04adso49422771fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 11:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744655451; x=1745260251; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMCnbrJiSVgsnlnzip6/crB87NSMbiRPqYzRRrVE8XU=;
        b=n20W4ZkeYIqyMr0r19eUttrbTAFfE2M/PQgPZJyfV67rUWsqZFTwSXCTS0LnX4idGF
         5x07OfmeZY5jSjA+JT021NXBam0dJBvpQX1Rj7eerBNyiJOlPUvDntTd5/VTB/Y9oSue
         OP2O+s4I3+X3dHD8i4KQTgpHU1XkFfWkdKt4lWLM/HeoNjO3FWAjEf1H/BfkPILwCqrj
         OAY+UmtjjfIQIYRfXJWOCu3OUBfkcT+bs5x4xHLUoV6U4cBJbHFuP3+ruwHvkjq8DmLP
         yMdyMFy6m63NvmqG964WEgRRixQXNVj3MiJ+0PK2Yl4rwGIXqmEqgfNVfnsA1SKGEvRC
         LjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744655451; x=1745260251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMCnbrJiSVgsnlnzip6/crB87NSMbiRPqYzRRrVE8XU=;
        b=DGFgx5GkJ5C3w2Pw7E/PT6MDBG+TmsS8OXdEqwDFG5YkPFL1ZT1v4TX2UDC4ArA2RF
         PvqzPDw3AcKnro8GIUo5N+0noHZDdj48F4tBN6mre2bfEnTOT+Mlqlqb2/U/7O6BVDhZ
         TXZQyeTD8WQe8rb9N2nTo4EeMrsR0zPwvy0sMzU+nfQkkbvANW6+t1vVb9OwB5CbAWfs
         Ua/iKHF3iCETKj4RcSTZA4QALQZcA1oXwT4rhjziVUdPG49HDN1QBVhVkmYQfvweoig4
         MaBaLYYIh6+EGY8UbE7t7oQGyZ2/KK+HlRtO75OvTWL9qBukcEmuZwqvULzHp3oSlgH8
         G/eg==
X-Forwarded-Encrypted: i=1; AJvYcCXIM/iIKXliNZHNPpROf8kh6+6Gy0eST/0iP6HWNb0Vc95qgPvr7JUES8Ykx+R+G9KE6TBCKwpF5eR41O+hJGmm@lists.infradead.org
X-Gm-Message-State: AOJu0YwkEK2mmAmnm8AHOhXRxak+xcyV1lYKSSO/By1x4nVfM3L1Mbs8
	f1WpU9xzaSTDJIDR6Pgg5XjsKpvHROYt/zfkCRr+iRoecOGmLNIEhEjInmXyO4dpMPnYA9YjNVI
	X15frCAIpcvnZj13fl/+RWgGMneLdVx6MVO2UAw==
X-Gm-Gg: ASbGncvOBmLB6j/D5euixGz/MYCvxoOWsZYmD0+R5/jsCPmCfWDb+RKmuYuYwTaN7PA
	vV11HyYIOd4+WCNhTdqfz0MJ0nJKAtowhpgbBwC4dKTdloU252dBasxLxjaHmepW6r+AdIL4pch
	W774asFJnOte6INY/Raog4fj4UBj9ZfyejVUOOs6zUZPo/3Ddha4lxoPxSlkqQDVU=
X-Google-Smtp-Source: AGHT+IGG6HfO0a687DQ2ObWoW5dsDkKpKT5mJSVYkj4mYbmZ4ySEjWG7K8FyQL0/ZDaad7PXpi1Rz3cQhvFr0qElIMU=
X-Received: by 2002:a05:651c:1597:b0:30c:160b:c76c with SMTP id
 38308e7fff4ca-31049a1c6d6mr38019201fa.17.1744655451082; Mon, 14 Apr 2025
 11:30:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250412193153.49138-1-chenyuan0y@gmail.com> <D9694O0MKV31.3SY6ZCTSKXWI9@bootlin.com>
 <CALGdzurLWayryjUEdSy4iuHAgFO=RA=HN=u+BZY96JqESKvi+A@mail.gmail.com>
In-Reply-To: <CALGdzurLWayryjUEdSy4iuHAgFO=RA=HN=u+BZY96JqESKvi+A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 14 Apr 2025 20:30:40 +0200
X-Gm-Features: ATxdqUHR3IF_jBbcAtQS5Mjt4i90SIKTxCncQEK71lUbbQWQS1vGZ6vrZEF8J6s
Message-ID: <CAMRc=Md+w7Wp8gS=PvpYkz6z4y45z6QiO7A0i24ESSa8N_byeg@mail.gmail.com>
Subject: Re: [PATCH] gpio: nomadik: Add check for clk_enable()
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_113053_584893_5207B409 
X-CRM114-Status: GOOD (  13.96  )
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

On Mon, Apr 14, 2025 at 2:11=E2=80=AFPM Chenyuan Yang <chenyuan0y@gmail.com=
> wrote:
>
> On Mon, Apr 14, 2025 at 4:24=E2=80=AFAM Th=C3=A9o Lebrun <theo.lebrun@boo=
tlin.com> wrote:
> >
> > As for why irq_startup returns an unsigned int, I am unsure. The kernel
> > Git history isn't enough to know more. The startup field in struct
> > hw_interrupt_type appeared on v2.3.14 [2], so no commit message to
> > explain decisions.
> >
> > Seeing the __irq_startup() code, my proposal would be to turn the retur=
n
> > value to a signed int, but I haven't exhaustively checked codepaths.
>
> Good catch! I agree that using a signed int could be a better option.
>
> Dear Linus and Bartosz, could you please share your thoughts? If
> you=E2=80=99re on board with the change, I=E2=80=99ll go ahead and send a=
 new patch.
>

Ok, I'm backing out this one then.

Bartosz

