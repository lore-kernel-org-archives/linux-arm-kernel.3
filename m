Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE43CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 13:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lBwJjKIl2g6UF0VMhS59pfFS4rpMrtKUF/lmDHhe/0=; b=SwJaxPCALnp/BISKA3N0a4o4qj
	a/7Q3H9X4f7ClELfCf4DmiSlQTrFxpFcTEhDYbnfvj7AWxOvHc7nYSyVUpzs4pMqxnto15/nULY5v
	NN9v+qpaX5E0XKG86WSZJhnXAdR0YfZtVLu6LEOCx6v8M/dkIITxrBUcXoJ0gBBqQK9yFtsh08UHe
	0mzSWliU6Sm8bUnaGfd6YtVwnjBI+XCtEKT8UW7oAsQDBdtwzNtEwjTKxk49z4kpfkAHHJN6eJm3d
	iCvNw38jzzCi8aIHOw3jgMHeTQXup6rqLQZDjh6uAjiUC+K6da+0H/EMnKnDayXasPCSkoTJCPE38
	flqCcbYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQnH-0000000DlLz-3MGK;
	Mon, 11 May 2026 13:35:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQnF-0000000DlLF-2FRT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 13:35:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A48DC6001A
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 13:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E191C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 13:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778506532;
	bh=/lBwJjKIl2g6UF0VMhS59pfFS4rpMrtKUF/lmDHhe/0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FypKc4F0AdJbhKfUPhAN/OTZKDVXKaSRqUkZs9Fn7aVx3nxTYJi3iyZ+c6xXI5Dro
	 VTIRso8DloSd4az8g2MdlqJPLmWl9lCMxiMvDDft60htW8agWjVKQEbE6mlFSktyLw
	 l6hGVY/ikLYz3ZpMySXVg9ObVrcOaJTqyGqpfvSQyeOOBwX2Bn7sbEPe4KDDMJSNDM
	 2wORACkObXO5uySV4iD0IqTIl+oFnUlBVFJ6cTtj8w3vaDN37OiCt0fL007EJnvCoZ
	 Tbu3mvz6s6arN1RVSN8P1A2jqyJCum5loWyapag1Q8SzrGvEvL/zJm6JMHOcwECXMp
	 saBICzU13xJFw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-392445f11c5so42756121fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 06:35:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/KsQsRuyU68sPzp3fhUoPWc/fmtjNYOYkujA+zjFYDuep2ZRzk8Mv/yldNjW9TEfDwCB8lhg3BnNRpPbTW4jVo@lists.infradead.org
X-Gm-Message-State: AOJu0YwsROtD3W+KWNdI18jAOF+tVgrRwW3sUY7kK29eRdUUnVumVFMi
	kENalhQsqgeiY3YCekgDOEvXJX6eq8udo83uooMYO7F8f/JGPY5HTNAySs4JwkfcmD6BozYLhMQ
	RS7FYDE82h8IzyzmMeQTgeQVi3RoVXlLhbdo1wKVLUg==
X-Received: by 2002:a05:651c:25c9:10b0:393:aa48:8243 with SMTP id
 38308e7fff4ca-393db0aa0a0mr39373091fa.18.1778506531112; Mon, 11 May 2026
 06:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260430-pxa-gpio-swnodes-v3-0-5142e95f0eca@oss.qualcomm.com>
In-Reply-To: <20260430-pxa-gpio-swnodes-v3-0-5142e95f0eca@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 11 May 2026 15:35:18 +0200
X-Gmail-Original-Message-ID: <CAMRc=Md7EdfvNV+6NRZK0UkNXcYp3uR4N4buKH6NeKKg_rnt-w@mail.gmail.com>
X-Gm-Features: AVHnY4KVYQLNTX-bwgopKPbxO_uksCzXvDF2gr-UH6aomroXQBQsEy6ffPhZrLU
Message-ID: <CAMRc=Md7EdfvNV+6NRZK0UkNXcYp3uR4N4buKH6NeKKg_rnt-w@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] ARM: pxa: attach software nodes to the GPIO controllers
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, Apr 30, 2026 at 2:57=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Convert GPIO controllers and their consumers on the PXA platform to using
> "attached" software nodes. Since everything happens in a bord-file, it's
> quite straightforward. We technically now have a way of passing an
> unregistered software node to platform_device_register_full() but that
> requires using struct platform_device_info and since the existing
> platform devices are either referenced from other places or defined in a
> different compilation unit, I wanted to reduce the impact of the changes
> I can't test and went with the older method.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

If there are no other comments, can this be queued for v7.2?

Thanks,
Bartosz

