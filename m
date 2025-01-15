Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B0DC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 13:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxMT+EOt+oUhVHlzI0Dq3TZpbOPTDPRyYDcoR3J5gYw=; b=n56MOGowGn4Mve4DbFM/6XZXC8
	w8YrW+73Zfd+C2l0DLXOe4gkKKQgTL7bdXDkmQggzdAUFeOibzdpWSrLpE5MgAFCe48Qne6cIPb24
	LNA8CBy7/yxTkueQoY2R+2xai2cZNfjODyImkkVbLFLV1aw2R2psuVwbx0B4XPWkxaD0MfFXvdMCE
	cg/EZv4SuQ8HWyn/X0x+i0o1Gmjj5z7WT1YxikthFv6njeUoaVIo6iJC1o8Tbh4vaFzsETcpNX2pW
	brgeqNQbPSuhZ80Nh5UGaESJeAzVm+d6QvCQfZJWQ7oGu5UF4C2Pyr+A89c0JPsI+XKr3r9ShcbwR
	jcC932Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3HM-0000000BxDV-2E4d;
	Wed, 15 Jan 2025 13:17:52 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3Fl-0000000Bwyr-18VC;
	Wed, 15 Jan 2025 13:16:14 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5d3d143376dso9623452a12.3;
        Wed, 15 Jan 2025 05:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736946971; x=1737551771; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxMT+EOt+oUhVHlzI0Dq3TZpbOPTDPRyYDcoR3J5gYw=;
        b=flJIOM2zLH5cIjOiz9OyBjfDQ/XeHkozEpTIe7gHYkGqLWTV5EH/LUFQ9eO02OqXmj
         R399PD3M3sZ/aN1iHSDGxd36/aJDQIjHUcXpDJlXywaLxwy+n3qK/DP74wlYXY7xLBDs
         q6vVPqtmwBARei+LGx2yBQ+hPhoK9hBhwD+5EVn8LUosve6/pIJzKRCJqpp9HY3hqaDq
         S9ajAKgmWxju7ICbegiEioocdTYD5BRl0HT8hfTpjLKRJ5MOClL8zwF6q5zyX9jK3tDq
         yYx+s2txf/70HnVfInfqsmVtk0hC1s66ah0WHFG2iwEJM01JBypYF6xlbSLNK1ZGGotY
         2QTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736946971; x=1737551771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxMT+EOt+oUhVHlzI0Dq3TZpbOPTDPRyYDcoR3J5gYw=;
        b=BFu0YTQFIqkUSpNnZFxjVUJZC91F5DhjSsbWnN0J00gQIQjMh9Ax0iAvX3O/pOyV/O
         DA/4458EqIBwJFgG37s4u10k79eQQONOXJKfELAgLJQmCrLpRFFcYUqoWIaDxfejDc0h
         HbLJr4SnGsHX/ljBEcnU+FWfPJIGLuizr/cbeflyn3PG3d1SpOIWORTyewnX7q7S0ip2
         0TUxncONDm5WkGv01qY+xcDspVibUxxaLjV++p6GvgIXR6ElIzZ6yr1bF3MEYd/qOEg3
         gmcBi3162Aii9XYfxAhNoAWcqoJK8w0R8RsKZbpAN5dqWVUC4oQ0IhjDOQmerJj3RoJT
         oxYg==
X-Forwarded-Encrypted: i=1; AJvYcCVuE43F9aUEfKVJjYB9/RJB+A5D3b96Ov9gT0AGG5kkkw6EPUipLAOstsyR2XPHtuY+DDbgkNQ3TsSNJrE7b1Go@lists.infradead.org, AJvYcCX2fz3OT1e3YIUAur5ieGXLn99jQvR8xBzDrXTQrzKaH99ZWQSC8Kddk4ABURgod5PO7jNTgVzkPDl3@lists.infradead.org, AJvYcCXVSNWH/TlqEF5h9ttORjTqijrz1hUeGX4Hb81hY9K36SR/JkD4Gx5+fKFwbsie4zpzIOtycaggS7yMXEyabiU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxYaHho4ICgL2US71dgiupLwEhIvL28UrP3DUmbWXLK+xBrPGxY
	ps00IosJ4biHgJZfbnXn52wAQGqDt1diVuJ/B/aAqooInwrLymgWzndnS8/9/6SMambso6A82bN
	rv6YDxhtqQ2vDob9qlv3OzlB3vaY=
X-Gm-Gg: ASbGnctS8Xkh0SgUI+1koUQTAWTS6XHGzCNqMhDbB3MMZA75wXOVBuE56JdxiQE3Ge6
	/zSJAT604gBsmDT+IwAzjvGH/bteZEsvgeGQNgdE=
X-Google-Smtp-Source: AGHT+IGqNgQvNCqEhSn4YPN8QYtdlQn700LKTgmmyFE9sPXhQKin9LB7OlqDrLmstSu/qLY63i7jMpGdi0qWOY4oHGg=
X-Received: by 2002:a05:6402:1e90:b0:5d0:88da:c235 with SMTP id
 4fb4d7f45d1cf-5d972e6e4d8mr24223573a12.31.1736946971366; Wed, 15 Jan 2025
 05:16:11 -0800 (PST)
MIME-Version: 1.0
References: <20250115012628.1035928-1-pgwipeout@gmail.com> <2EEA8028-8E4A-4588-A480-E5FF0F7BE82E@gmail.com>
 <CAMdYzYo2W1hLgiH697AdRSUbhBU4rU2uB=N6EMWMD2-0R+VLBA@mail.gmail.com> <B1C9DA16-F285-4AD0-AE4E-AF1A5CA20932@gmail.com>
In-Reply-To: <B1C9DA16-F285-4AD0-AE4E-AF1A5CA20932@gmail.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Wed, 15 Jan 2025 08:15:57 -0500
X-Gm-Features: AbW1kvY4MkGurzp0mS0S6CqMjSh_jTqZIAme4zVrx6Zwh3T6atp_XNIcYllHFX0
Message-ID: <CAMdYzYrxX=RsSZja-3+zLZUSpyLoRz8Zm0w0hTfL3RQ9cjqgOw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/6] rockchip: add a functional usb3 phy driver for rk3328
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
	Michael Turquette <mturquette@baylibre.com>, kever.yang@rock-chips.com, 
	linux-phy@lists.infradead.org, wulf@rock-chips.com, zyw@rock-chips.com, 
	Dragan Simic <dsimic@manjaro.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-clk@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>, frank.wang@rock-chips.com, 
	Elaine Zhang <zhangqing@rock-chips.com>, Alex Bee <knaerzche@gmail.com>, 
	william.wu@rock-chips.com, Zhang Yubing <yubing.zhang@rock-chips.com>, 
	Johan Jonker <jbx6244@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	Trevor Woerner <twoerner@gmail.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	Vinod Koul <vkoul@kernel.org>, FUKAUMI Naoki <naoki@radxa.com>, 
	Diederik de Haas <didi.debian@cknow.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_051613_304321_9E2BD5F8 
X-CRM114-Status: GOOD (  14.45  )
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

On Wed, Jan 15, 2025 at 7:35=E2=80=AFAM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
>
>
> > Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w d=
niu 15 sty 2025, o godz. 13:25:
> >
> >>
> >>
> >> Do I miss something?
> >>
> >
> > Good Morning,
> >
> > That is an interesting failure. The simplest answer is the
> > `clock-names =3D "refclk-usb3otg", "usb3phy-otg", "usb3phy-pipe";` line
> > was corrupted. Please check that when applied it matches the patch
> > exactly. If you are still having problems, you can send me the
> > compiled DTB and I'll take a look.
> >
>
> oh - this check i done as first thing to look on :-)
>
> pls find:
>
> dtsi: https://gist.github.com/warpme/6af9e2778fb06bfb47b64f98fe79d678
> and dt: https://gist.github.com/warpme/79340c54c87b2b1e52f2a146461d8c9f
>
>
> and compiled .dtb

It all looks good.
Do you have any CRU errors in the boot log?
Can you check for the presence of clk_ref_usb3otg in
/sys/kernel/debug/clk/clk_summary?

>

