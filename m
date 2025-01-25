Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79A5C0218C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 13:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9w/182ECZVPmRavMFGQ5pT+3mapjwFmkPCGbm41FWo=; b=umFsguuXSXDPQMMI/AePHidKGF
	EJgm82Chkul/9gOk6hdXuXTnmv6cSMWPykcc9W4ySuwLkNYG0Ekn+QOL0ESISpHQVqYl2WeO1ItNc
	b9rdowRtwMVdl4Jp5X+t31cjbrxt2CWXIbk/5uraoII0vGxATi1COnQNKF4nqNCP2Q0DUqKDRBFdg
	Am6P+4sWGctLt2HWUYxfn4PClpUuM7nTrtgTcQPS7VhNprpsaxWvcdQtein8miT1BSI4ePxy+fRe6
	Wt4dh0bJFm1YK4ftm8SeC7rlUQZPaHyROuB0Nwy9KLHFQxWEdf8iIKZ91A1ZJoqN7a2X6TTg2J2oi
	0/SjdI7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbfy7-0000000GQOM-1CWs;
	Sat, 25 Jan 2025 13:12:59 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbfwn-0000000GQKv-2Cea
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 13:11:38 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e4a6b978283so6665182276.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jan 2025 05:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737810696; x=1738415496; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9w/182ECZVPmRavMFGQ5pT+3mapjwFmkPCGbm41FWo=;
        b=XuT17bDG/mBhE041d2ykO1QL0Nm3gee7nAjx2LOKhTSHLH8Byuxr+NdYgHoxt2/Rv+
         reSF0fi6+oidnfXDOZppCsPVzJDvhoFZCe1P8Xzeb5sZ3SveUcfMgOqDJ0khCC8QnH8u
         LsHapivnh4YKHFT4gt/1TeG58KqPO8pHX8bOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737810696; x=1738415496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9w/182ECZVPmRavMFGQ5pT+3mapjwFmkPCGbm41FWo=;
        b=ij5+7gR1bEhZsorhxcczQd/3HlY3bFPopsFq3NjJdZKDYsm3U2s2oziI0rO63j2ZcW
         felFRJCA7zqqMjva9TChamsVNfEllB20zsB5dlaogw2WoJXwOcWcpZWtEEKlp27SDfzz
         PKBDFFZ5CwLs4YAk2rKQaP3+C5y0aiP27buvEfuA2YTagLBq85eDDYfx1WTL6sBfSqaO
         GFWsysRQmyOn1SwfbQ/c2PJi86HEfxwiAMX1D5AYS/wouqbLm95dpLjh0lJo9fik+l+q
         kn67KSPX1q/ObyhiVaTw3GX6TASemgAXwxXRCRsKyWPqGnqZB2sMOiyi/l6nf8/bXCyI
         hGhw==
X-Forwarded-Encrypted: i=1; AJvYcCUoYIYL8RindrbP1CuZ3qUqMS6H+VuGoRJP1IXYl6YE04i/LjLdmkTgYpequM/4IMHhdXu3ndtmeYZa7G7ML6i3@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgo5jAaGXVqqmh9dt5DhBPg2zjsX+kmtYgqVIJD3z6DBWADFAJ
	UHGoVUzRamQCGJKeqGzIs4laSUtGz8m5fQdXQa0kF+kTq52MJU4XXtjWgwUuvx91n9+cutxc0MO
	3N2ZkSZcWzxPF7tHQpVEJIKGSgbhDY+GIzxpjog==
X-Gm-Gg: ASbGncsy+lSNHcINI5fPxyNRQPE6ORfGUwW1+HRjJlJYzQ+cHdIjdojvElV4L2FdAJQ
	A0dqbS5rEegGOTsQF637Th0WmQ21uGYfPZ2Oru+XYcqlZPp9g4UktVQeY2c6G
X-Google-Smtp-Source: AGHT+IFVT+av7DVOjmbZvLFF9xaahV6NF4A2ll6W9sj4bZrkAo2BEsKYGC6Vyjk/Y1UoxEutVGm/TOioJhjYJCJ3h5c=
X-Received: by 2002:a05:690c:6612:b0:6ea:6644:ddf8 with SMTP id
 00721157ae682-6f75829ae26mr50723297b3.0.1737810696019; Sat, 25 Jan 2025
 05:11:36 -0800 (PST)
MIME-Version: 1.0
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
 <e2de94ab-82ea-4d36-a9dc-75f6891d8927@kernel.org> <PAXPR04MB8459537D7D2A49221D0E890D88E32@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8459537D7D2A49221D0E890D88E32@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 25 Jan 2025 14:11:25 +0100
X-Gm-Features: AWEUYZmjhh81tIBZTP5C0Ax6XsZDjPG7rmhj0pU30KKvTD1HwU7fFDBX6Eu8t4k
Message-ID: <CABGWkvoKV6dv1sHXJ1AZz7byp2ibh5uzLx9knF01HrcJLJyzCg@mail.gmail.com>
Subject: Re: [PATCH v9 00/23] Support spread spectrum clocking for i.MX8M PLLs
To: Peng Fan <peng.fan@nxp.com>, Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-amarula@amarulasolutions.com" <linux-amarula@amarulasolutions.com>, Conor Dooley <conor+dt@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_051137_569030_7953E914 
X-CRM114-Status: GOOD (  22.55  )
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

Hi Peng and Abel,

On Sat, Jan 25, 2025 at 12:47=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: Re: [PATCH v9 00/23] Support spread spectrum clocking for
> > i.MX8M PLLs
> >
> > On 18/01/2025 13:39, Dario Binacchi wrote:
> > > The series adds support for spread spectrum clocking for
> > i.MX8M{M,N,P}
> > > PLLs (audio, video and DRAM). It has been tested for the video PLL on
> > > boards using i.MX8MN and i.MX8MP.
> > >
> > > Changes in v9:
> > > - Add 'Reviewed-by' tag of Peng Fan for imx8mn platform patches
> > > - Fix building warning raised by the kernel test robot for patch
> > >   v8, 11/18 clk: imx: add support for i.MX8MN anatop clock driver
> > > - Add patches for imx8m{m,p} platforms:
> > >   - 23/23 clk: imx8mm: support spread spectrum clock generation
> > >   - 22/23 clk: imx: add support for i.MX8MM anatop clock driver
> > >   - 21/23 clk: imx8mp: support spread spectrum clock generation
> > >   - 20/23 clk: imx8mp: rename ccm_base to base
> > >   - 19/23 clk: imx: add support for i.MX8MP anatop clock driver
> > I responded in particular patch, but let's respond for formality to cov=
er
> > letter as well.
>
> Sorry to come into the binding part at so late stage. I just
> got a request for i.MX95 SCMI CLK a few days ago which is impossible
> for vendor specific properties.
>
> But I am not sure "assigned-clock-sscs" is welcomed by maintainers.
> Please also help to check whether this is usable for your patches
> to enable SSC for i.MX8M PLL.
>
> >
> > The bindings here might get obsolete already with work:
> > https://github.com/devicetree-org/dt-schema/pull/154
>
> Not intend to waste to your effort.
> I also replied in the PR to express my apologize.

Please let me know clearly how you intend to proceed with this
series in light of Peng's series and PR. My team and I, along
with my company, have been working on this series for three months
now. We do not intend to stop, but we are requesting feedback from
the maintainer on the quality of the work and guidance on how to
address the next steps.

Thanks and regards,
Dario

>
> Thanks,
> Peng.
>
> >
> > Best regards,
> > Krzysztof



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

