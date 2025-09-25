Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467D9CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 21:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWnxKjjg3IdFv7NXQ56rxUnSHi4RjgZEkDrUKCiu4wM=; b=DRsk9yT/G5BfQtgOLVmgeTb2th
	IFZfozE0XLu5QTBrxmrzq+7Ow32eg/6LLqa3aM4hhP1auAuwzjeE9PNaSOCVK2L5gxhykPF3ext71
	F9UppAB5JuLt5HHKaL/xulr2p7ZoDD50vDgwqyMXKLu3zzZUYkXD8iCWVrcwsptDt1mwrJuOQPaMm
	TdoPduRBQEaGvBHa2tapNNkb3lLWwqDKYemRqCa7hfS1lHuiM/vqhmXO+5SiyPc+buJlltwWxdSVF
	AKcOXiu0G8+ri8u/FJMhGMIkjMsXgTYi1hYuf1fTwa4xISjm+AhufS4GkmnUxfqW4aBWaF3Y552Om
	Bl1CJbgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1tpy-0000000DJa2-1zDD;
	Thu, 25 Sep 2025 21:49:14 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1tpw-0000000DJYb-0xDD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 21:49:13 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-8e286a1afc6so835702241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 14:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758836950; x=1759441750; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWnxKjjg3IdFv7NXQ56rxUnSHi4RjgZEkDrUKCiu4wM=;
        b=Yh8l9VVLpDvG8L1wOXDiO3Y1kki5H3tET10WhD2ixEL8he3ErYNvRjua3lId+evOhU
         /Az6xWkm0KrZ7qROnXYNX9uw7Yy3dmqG0tXeVCkS+SoUE+rSZfHTaQqBefiQ/ArSY+Bl
         E9O+Tw2kXd5XD5Ad9GEoisR2TcE8kJ2Yn7IJUsy4jiQkIf/p85fwFXa1u/8JGDL6pu2L
         yLq04usqBpV06ULH6ywQwHd6ZLjQ/UgrHNe+Wohq5wALjK1vyCAYcI/QLH2D8MhpgpD5
         xkhz08ZWDuKZrsqQQMDXWpNbHvrt5bDAasD8kU/zmiqmxdMujKwG/+ZUkjnDsGj/mGTO
         FBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758836950; x=1759441750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWnxKjjg3IdFv7NXQ56rxUnSHi4RjgZEkDrUKCiu4wM=;
        b=wv/+LkrnxFlmJZbRRogICa8207p7mXQB4/GrmA3OzgPEGDJDx1/jzk3Z3CsVTAFZGw
         gRcFL8YTxW2+VsMxYhKLyuw17vNkqCuVVXWqAirVoAvTVirCwB/E0GPlx7EfUk9+bdkx
         wuJruzWu6Qipem/uhz/Dg1P7WwDw6GtcZf3VemZi2jR7EoF1LDBtxID1wp3/gSBJ0gQH
         XcRaV/RPSp5DksW5PNPfcVYIpBF0qefvjgyj5rxOv4fURR+lljT3C0WmpryTNTLLy8to
         WybbfUn2SaLMrYtGyzdZmL1tAx+/zUq+vsuIbSK4NEGPxUGGk8Qkys+grtTCi9M19ze6
         CgHg==
X-Forwarded-Encrypted: i=1; AJvYcCWXR1m3+rETgi/L+Ss+wznHRMjIKJ9rvaGIlroWg7hncD9vTJ/7MB648LUFdY8M6rKrCu7FT7Xn7OxN+UWO7Pu2@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk56eJZslhaghDL+Ae6j5O3jv1VqCBlrqB54QvcIoBxOHcx054
	SNwFsTjublsFyucGajR9LZKTA/Imwe9+bn7d3PGAF5c0u027ta3OtK0frt9K+rOoazyUgXGfUZ2
	FNBOI1skT8N6K+k99aiDBmW375L39ox1btZyo2HO3
X-Gm-Gg: ASbGncv1hQfTlrQ6FTKZZm/3enxfnpdK743c6sH4NlxoXGUbzkj5AuTir04WV7W85Cf
	KuUisjp60af8P/dQ69P1K+4eMJFhjxOxcjw7z4gjJCo253V+2Ul41fB33LNzYwgd+GpeoG2aRzK
	dRfECtS7KqngMqkx1hRXaGVeh4+OE0tqx95T7k2ICSaiGda+Ct4YdrpvoWIvWHDungYNOtF7xP/
	qY0LljnDacxqyojYxjjw6g76yvxiDQqR6JUcC+1FUwk
X-Google-Smtp-Source: AGHT+IGW3IGcV5PFx26sBUC3o5KQKz0L+yhUmcatupyzMMfX6K50TKytxIHLN/TtYzhr65CzmVBHguoTSQdL6HZwja4=
X-Received: by 2002:a05:6102:6109:10b0:584:7aa3:a329 with SMTP id
 ada2fe7eead31-5ae1498e243mr1554315137.4.1758836949517; Thu, 25 Sep 2025
 14:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250925115924.188257-1-ulf.hansson@linaro.org>
 <DD1XOHE6P5OC.2JUQRAGAE1KTU@cknow.org> <CAPDyKFrKP2bdpKTHzqDdhEpRAjYu+PFd2Bst=-WPddByxcAX_w@mail.gmail.com>
 <DD22MGF3HNLM.Q7S70RX4NZXS@cknow.org>
In-Reply-To: <DD22MGF3HNLM.Q7S70RX4NZXS@cknow.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 25 Sep 2025 14:48:32 -0700
X-Gm-Features: AS18NWAGOAAorHTgXiAOX4nfP6hG9rqbItxzDXqOiV7WiydESLBuu8CfUToVl8g
Message-ID: <CAGETcx-WY1x_ud8Ef1jbpYQVtFv7MZHMpHfSVKA9R9tya0Lxjw@mail.gmail.com>
Subject: Re: [PATCH] driver core: fw_devlink: Don't warn in fw_devlink_dev_sync_state()
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Sebin Francis <sebin.francis@ti.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jon Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_144912_274587_535348E4 
X-CRM114-Status: GOOD (  33.10  )
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

On Thu, Sep 25, 2025 at 10:52=E2=80=AFAM Diederik de Haas <didi.debian@ckno=
w.org> wrote:
>
> On Thu Sep 25, 2025 at 4:26 PM CEST, Ulf Hansson wrote:
> > On Thu, 25 Sept 2025 at 15:59, Diederik de Haas <didi.debian@cknow.org>=
 wrote:
> >> On Thu Sep 25, 2025 at 1:59 PM CEST, Ulf Hansson wrote:
> >> > Due to the wider deployment of the ->sync_state() support, for PM do=
mains
> >> > for example, we are receiving reports about the messages that are be=
ing
> >> > logged in fw_devlink_dev_sync_state(). In particular as they are at =
the
> >> > warning level, which doesn't seem correct.
> >> >
> >> > Even if it certainly is useful to know that the ->sync_state() condi=
tion
> >> > could not be met, there may be nothing wrong with it. For example, a=
 driver
> >> > may be built as module and are still waiting to be initialized/probe=
d.
> >>
> >> "there may be nothing wrong with it" doesn't sound very convincing.
> >> So there *can* be something wrong with it, so warning sounds
> >> appropriate? If there is (certainly) something wrong with it, I expect
> >> an error.
> >
> > Sorry if I was too vague. See more below.
> >
> >> FWIW: most of my drivers/modules are built as modules.
> >> I do seem to run into 'problems' more then average because of that, bu=
t
> >> to me it just signals there is something wrong ... which should be
> >> fixed. Not silenced.
> >
> > Well, why is it wrong to have drivers being built as modules? They

IIUC/Remember Kconfig correctly, FW_DEVLINK_SYNC_STATE_TIMEOUT should
be off by default? (if I don't give any default, what ends up
happening?)

If we can assume, timeout won't happen by default, then the only
people seeing this warning are people setting the flag or setting the
command line param. So I'm okay with making it an info.

But the "sync_state() pending due to" is for the default behavior. I'm
assuming without the sync_state() supported added to power domains,
the ones getting this warning would have been powered off? But after
the sync_state() support, it's not powered off anymore. That can cause
increased power usage. Seems like something worth warning about.

Also, another thing I want to understand is, for all the reports you
are getting for "sync_state() pending due to", is it actually correct
to have them pending? Or can fw_devlink do better in those cases and
turn them off? It could be a driver fix/fw_devlink fix depending on
the issue.

TL;DR:
1. For timeout messages, since timeout isn't default behavior, I'm
okay making it an info. But
2. For pending sync state messages, I think it should remain as a warning.

Thanks,
Saravana

>
> Nothing wrong with it at all. It just means I notice issues (like [1])
> that others may not who have modules built-in.
>
> [1] a52dffaa46c2 ("drm/rockchip: vop2: make vp registers nonvolatile")
>
> > just happen to be probed at some point later, then why should we have
> > warnings printed in the log due to this?
>
> I thought the failure of the check was more important then it apparently
> is. Then warning about it does seem excessive.
>
> Cheers,
>   Diederik

