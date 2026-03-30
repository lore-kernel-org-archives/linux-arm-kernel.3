Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4842B10F3DCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSbGB/eDWH+4zMIXetev5vgwGRXfeqVkDaG1KtmfhAo=; b=LdMO1JBAgAs5+7ML0BQlnk8ZZi
	4n9uyruU27TyUi8xk1pG2ppKGeRyUpj2qjQk/SypOaE3piMSO0aTpsb4uid8DKLbaBKjKfnaRtBKi
	0dzs2tKQkLWiJ+HtkiJ3kUM4lFxgkrj1B1SGSsUAhBjb8JqTD0AjQamizuF1jhjERiLiLXY9xlryl
	gZsHX9OFSYG4409kplbQbdf6g8/OGR9x8yVext4BRSCPAHyCbQ/bsCjbi4Fd4getv9d9MGlDt2N5t
	O/6V9soZFYdcPLe12oAc6TlbtXXGC0QlcMXq/ppMZxcUk2DUY/DGFt/UbyItgjwN4z56eH+GYmDyg
	SvUhzsmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DSg-0000000BPHZ-0Wyd;
	Mon, 30 Mar 2026 14:19:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DSd-0000000BPHO-3kHX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:19:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 04E3460054
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 14:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5E2C2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 14:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774880362;
	bh=jKPl7vLvqPt4L8fZQsfb39R9t7tBQznk82n5HFjIulw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BL25BcqCDMG25fw/wVsiojhvGXgPIqTZWewqcjhAAxT3uAzbAkj7BZBpbIdLjl4sR
	 rCPNnZDrLQqnjaLrfZVVQlBLzW/VimcouO8ihTGQrD3NIfEX83Nw/Cya1TO7XgnxIz
	 Q6FQ00ZD9Fu/sK2YoNhgTInSQgBsXuFdYC5OWTAOsCw1nkTq0nX65W2gDY/fiPgPTR
	 ogUNAlH86GJd0zm7kTkvf20W0yHCCPlwDUj/0ZmdhZCM3WjZSC2NZu9ZiSwH7V9D0A
	 8i84wUpKG7pbL0IcouaHmXJwa33t2NX208fzkdmaspWP48Lj7jI9uc3FS08O05QM5w
	 9hk2SJWlpiisA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38a42a0d7f7so44510381fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 07:19:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUV8WaivqyEYg5Hl9hs4quX6QdZAlWfafYXyToDLzuVm8KOhaua2g9PGLwMrcqgtijPNLQCQ3cnMzmosZk+/JCD@lists.infradead.org
X-Gm-Message-State: AOJu0YxAP1/2ciQDXyTYOmSIHeXgkuRFCEjvsdCopNJKKyhntMBxHRPx
	hLaGOx3G9ViMo3a8DQBO0qq3UH5mWtmUBAxT8VNg9STgaiy1CKeILKJQRDYmQwbemgouSEB+TY0
	kckXfDBb7onIQlB9Hd87ZXsAOSpGpfR1ofJMcy1vy6w==
X-Received: by 2002:a05:651c:1b12:b0:38b:f0f0:e39b with SMTP id
 38308e7fff4ca-38c75c5ef7emr42861941fa.10.1774880361407; Mon, 30 Mar 2026
 07:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260330-nokia770-gpio-swnodes-v4-0-b68592e977d0@oss.qualcomm.com>
 <20260330-nokia770-gpio-swnodes-v4-1-b68592e977d0@oss.qualcomm.com> <DHG5WQI26R5U.WTZW61VKJHF5@kernel.org>
In-Reply-To: <DHG5WQI26R5U.WTZW61VKJHF5@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 30 Mar 2026 16:19:08 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mf3oWtrcdR+g69b8y4K-gwfMe+3LNMYQ6c6M-hw3Nh+Hw@mail.gmail.com>
X-Gm-Features: AQROBzCFGjEJDyJGQ7QpuD7sAKfwUgETi1l52lFJ9qTeAWzKycqIShS33NqMS2A
Message-ID: <CAMRc=Mf3oWtrcdR+g69b8y4K-gwfMe+3LNMYQ6c6M-hw3Nh+Hw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] kernel: ksysfs: initialize kernel_kobj earlier
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

On Mon, Mar 30, 2026 at 3:47=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Mon Mar 30, 2026 at 2:40 PM CEST, Bartosz Golaszewski wrote:
> > diff --git a/include/linux/kobject.h b/include/linux/kobject.h
> > index c8219505a79f98bc370e52997efc8af51833cfda..71b9086621c35b7e4ef99b9=
d3b6707db23faf58c 100644
> > --- a/include/linux/kobject.h
> > +++ b/include/linux/kobject.h
> > @@ -219,4 +219,6 @@ int kobject_synth_uevent(struct kobject *kobj, cons=
t char *buf, size_t count);
> >  __printf(2, 3)
> >  int add_uevent_var(struct kobj_uevent_env *env, const char *format, ..=
.);
> >
> > +void ksysfs_init(void);
>
> NIT: I'm aware there's also all the core kobjects in include/linux/kobjec=
t.h,
> but maybe a separate header would be a better fit.

Do you mean moving all the top-level kobject declarations
(kernel_kobj, firmware_kobj, etc.) out of kobject.h into this new
header (ksysfs.h?) along with their init functions?

Bart

