Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171FC103D959
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 13:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0TLneAIRRHpFFLon9EOXWlj6EQWjhrH7PDC/Rcpt/I4=; b=wdlRGv2mBB7rERVMkg8Qqczrgv
	ua6v38dyaCpelF1/6WdT5gxavnlfmMv2BHpCkPYg06yzMcA65hLqEqCHK6tkWHFlrqRAwauKpNwxf
	SGuVZypP2SMbpOX2Wgiuahy+eMiMpHePiqM+FBmrYh10LlkTzmRWJuOCx2kWhhYwGPOXtIVim4y4e
	g7oeZnZkzx14p7koSsbvcbLetcimhpeCqJ8I5dPQUBzZooP9tTm/6DVxg1O5ydLnVzSWj6qIWeHgo
	9l7TcaJT04eL4bjuil4WIekdb5uZwoqx+9VTbdwOwwGo8CsUv/CcNJDMhGnvK9nXK31k3v+tpCa6O
	vppm/6yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7D2Y-0000000BNQi-0gZZ;
	Mon, 30 Mar 2026 13:52:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7D2V-0000000BNQM-1cjO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 13:52:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 951D644401
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 13:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FDA1C2BCC9
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 13:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774878742;
	bh=L3VXBQUY2/EFN+ebLxUXYbj0kJUaO8DCP5kVnC5RKr0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kkA7JSdcoHzcBOhLsyqSCdNSyjvMqP0zCSOe2nolL88XiL2Dge3SDpLlwXmkiz3NL
	 bt6hmbuFf3pnyvIIbQUp7U4euzasvd5MHt1JRSHBWf5nwJdrH6JmNdGQiQiMWr+FEK
	 uG/uq45gW7jrJb11uLo8V8+FjotGddogMfNROXCj0q9sUeeFmClucjx0ReAaj1yJAI
	 bXzJrDAwNQ+ztdRAbr8hRL3ox9wKG/3yrEOweFpSrXEqIcCtxfF0lBk8bDsbyrhb8v
	 ZbMNjKuZtofDP6qS4qjL4QZj7Q0oB9mngMlYBzreWKZoNrOcbiAscfRpjimX7PeXSh
	 9w+5t09NHTzdw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-386b553c70eso36090151fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 06:52:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXYFBBIZP7byhLvLliKkdi80kmNchVBHv1IA2JMcg8Z9/2AB5rok5v/bPPGbJcKObtlfN+Yy3+3Lhe8CW7Mz8kO@lists.infradead.org
X-Gm-Message-State: AOJu0YxVVsrQFsxoFWQVz3qpUTuJk+1duQJI/T6o+SVb6bVshi4Ld5P6
	ti10l1E0KAvxqpeQ9jLEBZmfGKKj2Il2BT5r9xcVATxjwTthy0HmzlWWcZ2Y5tx7Xi6OdwfDSBw
	jO0s4sC5EgYLaMYRmvgMn1srAzBUBslfLw7f0ay34UA==
X-Received: by 2002:a2e:9a11:0:b0:38b:f0f0:e3f7 with SMTP id
 38308e7fff4ca-38c7310232cmr39514361fa.7.1774878740944; Mon, 30 Mar 2026
 06:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260330-nokia770-gpio-swnodes-v4-0-b68592e977d0@oss.qualcomm.com>
 <DHG5OX85I4LL.39U0RRBS0JXFP@kernel.org>
In-Reply-To: <DHG5OX85I4LL.39U0RRBS0JXFP@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 30 Mar 2026 15:52:08 +0200
X-Gmail-Original-Message-ID: <CAMRc=MfG1ZF=4T2WAw71Zb+4BFD2_4VSNRQZQsoGLE8gZxWcHg@mail.gmail.com>
X-Gm-Features: AQROBzBsrEPDG8YUUE_t5P-kX_9D2aMQwVqcM1UV6Hiu3mOg0TdUxoDMofvLMMA
Message-ID: <CAMRc=MfG1ZF=4T2WAw71Zb+4BFD2_4VSNRQZQsoGLE8gZxWcHg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] ARM: omap1: use real firmware node lookup for
 GPIOs on Nokia 770
To: Danilo Krummrich <dakr@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_065223_471032_8CE48220 
X-CRM114-Status: GOOD (  13.05  )
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

On Mon, Mar 30, 2026 at 3:37=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Mon Mar 30, 2026 at 2:40 PM CEST, Bartosz Golaszewski wrote:
> > Bartosz Golaszewski (3):
> >       kernel: ksysfs: initialize kernel_kobj earlier
> >       driver core: make software nodes available earlier
> >       ARM: omap1: enable real software node lookup of GPIOs on Nokia 77=
0
>
> Looks good to me overall (one minor nit in the first patch); which tree s=
hould
> this go through?

If the first two patches can make v7.1 then I'm fine with postponing
patch 3 until v7.2. Maybe Dmitry's changes allowing passing
unregistered software nodes to new platform devices (where are we with
this?) would also make it in and patch 3/3 could be smaller as a
result.

Bart

