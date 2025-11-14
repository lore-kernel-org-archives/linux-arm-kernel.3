Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BBFCE7AFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 18:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8qQzZhIWGCLSP8vPQOtc5NmHuw015KgkUf4oeB0WMc=; b=liauhR+Dr3fdy5EFOBT7U+xaKJ
	2LRgbrrGJTWEaSVgPherbIn9mm/dcw07shFOE0SLOStA6rBpKopVCXqxNo5+FC8nzY15DIZtNBx5H
	kQnqQbHP3O7cKz2LT9QTyM2B87lKq3jbjNh7IxYAx2Y0tqm/ScOakTW4uGvWT+wiXIuz2kxJCggVQ
	egT0HpRDdSUfdTtUBJZTul0pfsU5/hklblJPNNEIphwssYhUA9+Z6aWCfpge8kQ4R5QT0PUgX6qjA
	BDNL8pBEVB3UiqyziEtFQen0+HFpPUsVb0okMBDPXkivzxGeWfOQ3fmc9MdpsFIgl0BFjhc5lME33
	Wos67wpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyFH-0000000Cw8N-1X3W;
	Fri, 14 Nov 2025 18:10:03 +0000
Received: from mail-ej1-f46.google.com ([209.85.218.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJyFF-0000000Cw7d-17Ja
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 18:10:02 +0000
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b7359b03878so300744366b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 10:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763143799; x=1763748599; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R8qQzZhIWGCLSP8vPQOtc5NmHuw015KgkUf4oeB0WMc=;
        b=NUyaj7hrrBRni0mV3KImUywOBAz+PhpKfemfZH7lrGfBqEdqFaKd9QGVqp+c3BvbGZ
         D9HROvk1JEg0XNnmy3R5Ld5i2NqeebjRb3ePeZP4Rwf3EsVhko98mLQs2wmaDrZasJzn
         vetOjt6vV5QrVEbOcUCJcNKx7sDxxNqnn1+/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763143799; x=1763748599;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8qQzZhIWGCLSP8vPQOtc5NmHuw015KgkUf4oeB0WMc=;
        b=KCLXP/WnUyqAspC0ysdEWFHTXRSgvr6O4cjlAT4Xr3Zr9JrioZeJFFv/R0guZAyXur
         sCbcOP6BlgvpMCNkc7mVOOmwyrcbuQL54V1ZM7AMQjqIaxfBanHuNxhkYTZlA2H8uvkX
         8pegDkhTxG13GrbX/43nl4syFwsQq0y9DiWEkUApPB+CSpZoJPBt2xfwl98vPUtmg6iX
         Wdl+nV0EsHt2PLyp+dlQ0ozZsVDhEtcbk3lOKZuBw518ozKUR3K45DBUS43AEwDGGTXM
         GeVZ/ZO+drh5GOeS6PYYpUXHs4it7OlrVs6ZenWgPQDjaqjnq0oDbA32amHiMmuMU7vy
         mkPQ==
X-Gm-Message-State: AOJu0YwQ73t1sNNnLptwwNHf+McvWwO0h5HFioWZgHfy2lJrU6SZ152n
	7NFS29OraxV658pA/A0f95rbioGZJD6P6HITi/axh/R+MXCIaMHfjn7yu43120UpKXvQzdj19om
	1bDDMs4WuxfB0WvFO3wVsQlwXFmeX5pDS5DXyHUbM
X-Gm-Gg: ASbGncuDFfaSOV/bUKEfJFNWut8uaXPsLGMjwwzEhHX1D16OnQLEVfVUgDnl2qNoxI1
	R1izF0SLmh27pU16w8wR/c0ngFVvDAdfSok8ISz1RTBjElq5MpK6UPSn9C99O66rELOCgAzvxER
	QOTmpV81DktWOhRZCZ4YiRitob72pD9TdNop169QdscwwUKPkSb+/DvnC/6pLl2Z6VN32QxeknT
	21loe4POhXgs5hbxBjLDiMMRlLxSs7NS7P/LKpK3hPixuXs7IFwgzo+oQ4fHiGLZbb8t8c/BJ9U
	uA5e
X-Google-Smtp-Source: AGHT+IExxhygUk184s9UEYnGIp0Y7VKAW16mQXGNIivL6M30ouE5Dlc7H2XC+tXQUb8E7Bxe3ZgisHnxvpUyi0cdpJI=
X-Received: by 2002:a17:907:3f1d:b0:b72:b7cd:f59e with SMTP id
 a640c23a62f3a-b73658aa141mr469517066b.8.1763143798910; Fri, 14 Nov 2025
 10:09:58 -0800 (PST)
MIME-Version: 1.0
References: <20251006230205.521341-1-sjg@chromium.org> <20251006230205.521341-5-sjg@chromium.org>
 <aQ-zE_EmoPbgCItD@levanger>
In-Reply-To: <aQ-zE_EmoPbgCItD@levanger>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 14 Nov 2025 11:09:46 -0700
X-Gm-Features: AWmQ_bn3YwxAZejq6GcqYY3-aXpCr2hDyUvCmW-Ly8TyOSurBWad8qFguf92KZc
Message-ID: <CAFLszThNq4Yr=uoEXjt_xsvXZRNBPqmm9wX+SwLJMfeMKenNfQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] scripts/make_fit: Provide a way to add built modules
To: Nicolas Schier <nsc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Masahiro Yamada <masahiroy@kernel.org>, 
	=?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>, 
	Tom Rini <trini@konsulko.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_101001_360031_2CD26DB1 
X-CRM114-Status: GOOD (  17.38  )
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

Hi Nicolas,

On Sat, 8 Nov 2025 at 22:19, Nicolas Schier <nsc@kernel.org> wrote:
>
> On Mon, Oct 06, 2025 at 05:01:55PM -0600, Simon Glass wrote:
> > Provide arguments to support building a ramdisk from a directory tree of
> > modules. This is a convenient way to try out a kernel with its modules.
> >
> > This makes use of the cpio tool rather than attempting to use a python
> > module or our own code. The list of modules is provided in a file.
>
> The list of modules is provided via command line option/arguments,
> isn't it?

The argument list ends up being too long, so it uses a file. The file
name is provided using an @filename argument.

>
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > ---
> >
> > Changes in v4:
> > - Provide the list of modules from the Makefile
> > - Reduce verbosity (don't print every module filename)
>
> Reviewed-by: Nicolas Schier <nsc@kernel.org>

Thanks for looking at these.

Regards,
Simon

