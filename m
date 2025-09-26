Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DEACAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 12:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0TP+8hdoSAkERstQA78VRAN5sTgbvs3RBPr5mvjNn7k=; b=VeBExKvIfJ/5bz2O4cM9fsto+d
	otvGF2/S7gaRLYnevC7Nr7R81s+E4dJPNgF9NuovTfe7xmeewAau7+BZzKTr2eXXb7boKa5GeITGc
	+R0MrP/T3IyeklBZuMWFXMNc9m8ucznr0AQoielKfXb7+pWlPOdRetEWuEN2qFFgL0kydOfjMjZmA
	nNf+MUxVVQ/iRje6DgqE1vgef/HHd8Er+19WguE/pfDVj39aKG/CiDAeZn+RH0VvuK4BIkBxN0QD3
	TK8IBLfN57i3I2DPszbZLKLKGc5jpRTS2PVpbuaM228vNO7HgG1gkgV1M6B09B2hUXq6J1mJaN+I7
	Yoqd51aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v27Cs-000000010nJ-1nMG;
	Fri, 26 Sep 2025 12:05:46 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v27Cq-000000010m1-2eo6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 12:05:45 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-74f6974175dso29463067b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 05:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758888343; x=1759493143; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TP+8hdoSAkERstQA78VRAN5sTgbvs3RBPr5mvjNn7k=;
        b=Yw5raDhhZJnUKI2zkeWA0EFIeXw3spw6K9QwnFiAEDioG7IuORczj0KQ7H62SSamtH
         WhfqS8nsPEBll2zHC7ofiEKO8qjkkaFR0vvZ+BaUUu7+kf2OTMw/zTZZ9MtTuMcQ+XR/
         ooJniCVIsH9hoMr7eZrGe1vYAYfoEGbTLAtcOS3ozVI1LljRFMzVVkKIaAqkfjXAhkvK
         e8RD64DOyek1kiIkrQya4wBsRVt0e69K6xtY26+bGl55cuLJeucdOb9ySbaFS9csYitU
         Pca8LWTcQYrMh5njZWw80PzGYiBWd3OFz07s4ibSmOYQJKyS0K2UtzwoC+d7Hkm0SZQW
         VRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758888343; x=1759493143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0TP+8hdoSAkERstQA78VRAN5sTgbvs3RBPr5mvjNn7k=;
        b=XC+3expobxJbVkH829hQ2XnXx3ecUPKNbUhAK74uJuhD3mqu9Agbe2w2mqkeU7mOd/
         9EWRxJX6W0h7GRzB5CW/ElBBgwwQH7x6zQsiZSmyZnZmTRWnkkkVb6gc3Qw9/XfFf++W
         F8gHKna+yzVED1Ua/jWduHJYRFODfUHVqJpU5tUttNb8W1Iz3Pho97+uXjgDefwo9Z/7
         WOILwQrzmD1Z3UeocT9F4zGy1/69a0caB2T9ls78cbNEpSy0ZKleKlwHP1iPyxkbLKmj
         x7nPk/m0zw+dfV18nSOm7ooB1cqJhlE53VTwJIRK2JvBz5tShQ6kCfON/GvalKDYrlYK
         kbuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1hk+dJVi5jBfLw5N4m4Ku9R/OeO2PiHr6oU0LJZys8PgGteFHIpj7G3dZdfY9uZb/4x0VyrUEdR+8JVZCxfus@lists.infradead.org
X-Gm-Message-State: AOJu0YwgWvIKFzF56xRZU5uC0faNPVjp+iuX4T/3EeFmXCiBW4uM3282
	9zZQmtQ4aZIe/VaMoXw3OUHkW8ti2mDvYMgoOxPgvV04xiRSZ8a35j91XOlqs05iBOkHnasQ1P6
	pdT/yWHqbcSlGZOXwJkWgFYfHkIdAyw1Fdp4ZS5Rtng==
X-Gm-Gg: ASbGnctiHdgd7bP8NWa8Ixz/fUA+HnjdJ4jZ7LexvTEiblYYtzxVIxav98L5QNo4Ok1
	fyFEPL/t6mS/QnFGXz2ollmfsN7X+PvMGMDHFJOWh29zSzsI3z1PQmdKsMiYUiiE2qaR6kqhN1d
	wkmT36Q7oG9bxBgQyDfMSZ4XtdkvMR9RTPwvpWIWfekuEGwrq6aJuSmo7l4EnWkEPC7JFbDcnW2
	Xj3dVCr
X-Google-Smtp-Source: AGHT+IFpst3LXzx1Tq4PLgIty1+eS+58cwQoh3HNSZyTfCuJz5+TvVyNnNmlTvzX9guzqldlM2Jv1pKgKvuJHT5Cmj4=
X-Received: by 2002:a05:690e:165a:b0:633:a95e:ef08 with SMTP id
 956f58d0204a3-6361a6e6c15mr5078517d50.5.1758888341664; Fri, 26 Sep 2025
 05:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250925115924.188257-1-ulf.hansson@linaro.org>
 <DD1XOHE6P5OC.2JUQRAGAE1KTU@cknow.org> <CAPDyKFrKP2bdpKTHzqDdhEpRAjYu+PFd2Bst=-WPddByxcAX_w@mail.gmail.com>
 <DD22MGF3HNLM.Q7S70RX4NZXS@cknow.org> <CAGETcx-WY1x_ud8Ef1jbpYQVtFv7MZHMpHfSVKA9R9tya0Lxjw@mail.gmail.com>
In-Reply-To: <CAGETcx-WY1x_ud8Ef1jbpYQVtFv7MZHMpHfSVKA9R9tya0Lxjw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 26 Sep 2025 14:05:05 +0200
X-Gm-Features: AS18NWAKTgOg0DoWt4DwiJMugagxp-PZXuEf5kMf0e6fNFZs94EGFqwIW10RP38
Message-ID: <CAPDyKFp0uV2WaQGjwsO8JG1zF_1oXj7-GVnaejih+dN9RAdykg@mail.gmail.com>
Subject: Re: [PATCH] driver core: fw_devlink: Don't warn in fw_devlink_dev_sync_state()
To: Saravana Kannan <saravanak@google.com>
Cc: Diederik de Haas <didi.debian@cknow.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Sebin Francis <sebin.francis@ti.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jon Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_050544_692906_4C22FFF2 
X-CRM114-Status: GOOD (  37.50  )
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

On Thu, 25 Sept 2025 at 23:49, Saravana Kannan <saravanak@google.com> wrote=
:
>
> On Thu, Sep 25, 2025 at 10:52=E2=80=AFAM Diederik de Haas <didi.debian@ck=
now.org> wrote:
> >
> > On Thu Sep 25, 2025 at 4:26 PM CEST, Ulf Hansson wrote:
> > > On Thu, 25 Sept 2025 at 15:59, Diederik de Haas <didi.debian@cknow.or=
g> wrote:
> > >> On Thu Sep 25, 2025 at 1:59 PM CEST, Ulf Hansson wrote:
> > >> > Due to the wider deployment of the ->sync_state() support, for PM =
domains
> > >> > for example, we are receiving reports about the messages that are =
being
> > >> > logged in fw_devlink_dev_sync_state(). In particular as they are a=
t the
> > >> > warning level, which doesn't seem correct.
> > >> >
> > >> > Even if it certainly is useful to know that the ->sync_state() con=
dition
> > >> > could not be met, there may be nothing wrong with it. For example,=
 a driver
> > >> > may be built as module and are still waiting to be initialized/pro=
bed.
> > >>
> > >> "there may be nothing wrong with it" doesn't sound very convincing.
> > >> So there *can* be something wrong with it, so warning sounds
> > >> appropriate? If there is (certainly) something wrong with it, I expe=
ct
> > >> an error.
> > >
> > > Sorry if I was too vague. See more below.
> > >
> > >> FWIW: most of my drivers/modules are built as modules.
> > >> I do seem to run into 'problems' more then average because of that, =
but
> > >> to me it just signals there is something wrong ... which should be
> > >> fixed. Not silenced.
> > >
> > > Well, why is it wrong to have drivers being built as modules? They
>
> IIUC/Remember Kconfig correctly, FW_DEVLINK_SYNC_STATE_TIMEOUT should
> be off by default? (if I don't give any default, what ends up
> happening?)

As "FW_DEVLINK_SYNC_STATE_STRICT" is default, the "sync_state()
pending due..." print gets printed for a lot of consumer devices that
have not been probed yet.

>
> If we can assume, timeout won't happen by default, then the only
> people seeing this warning are people setting the flag or setting the
> command line param. So I'm okay with making it an info.

I think you got this wrong. It's the default behaviour that triggers
lots of prints.

>
> But the "sync_state() pending due to" is for the default behavior. I'm
> assuming without the sync_state() supported added to power domains,
> the ones getting this warning would have been powered off? But after
> the sync_state() support, it's not powered off anymore. That can cause
> increased power usage. Seems like something worth warning about.

Yes, I certainly agree, but...

To me, it kind of sounds like we should change to use
FW_DEVLINK_SYNC_STATE_TIMEOUT as the default behaviour. In that case,
I don't think there is a need to change the log-level for
"sync_state() pending due to..".

>
> Also, another thing I want to understand is, for all the reports you
> are getting for "sync_state() pending due to", is it actually correct
> to have them pending? Or can fw_devlink do better in those cases and
> turn them off? It could be a driver fix/fw_devlink fix depending on
> the issue.

There are some cases that we potentially could fix, in particular for
when a genpd-provider, provides multiple power-domains per device-node
(#power-domain-cells =3D <1>;). But let's discuss that separately.

>
> TL;DR:
> 1. For timeout messages, since timeout isn't default behavior, I'm
> okay making it an info. But
> 2. For pending sync state messages, I think it should remain as a warning=
.

See above.

This means drivers being built as modules will trigger a lot of
warnings, in the default behavior. Is this really what we want?

[...]

Kind regards
Uffe

