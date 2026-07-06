Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD77C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 17:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6SzTceFp/6u/0U2ZsHukaDCb4DvB8gNfQxW2S2HmJSM=; b=cOTVzmB0gbducJ
	vBtIUWYJujWuvfQlgtibb2oQNqyLKb1L7pCn2i8Zc7sltFT1IV4r5otqgizc9x4xsT36fZAmbDJXv
	EkF9ODjNagt75NXZZsyIJ1zZy7nKqSaelm1sQ+A23NSNX0B1xl2bHUYRuOgXUBG5fDDKZd4KoS7Bq
	33Yz17IcwDvLD/TljR8aziWDYG613xA1XsSMH9wb+bN7zEypwxFv55pw+oRv3tHqAv8Q4Xc6hJjPF
	ya35KO1gxP2ms8bpJ9dewVE83VBTuHjEuLovxW5H1rTwRadcfeDFJzGLtpkgHUSRYgp+RuJyiEwCV
	512B+krpDWuu5yH8XTGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmxJ-0000000DBIl-0YIr;
	Mon, 06 Jul 2026 17:18:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmxI-0000000DBIX-2AwK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:18:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AA1F1600AE
	for <linux-arm-kernel@lists.infradead.org>; Mon,  6 Jul 2026 17:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE021F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Mon,  6 Jul 2026 17:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783358282;
	bh=6SzTceFp/6u/0U2ZsHukaDCb4DvB8gNfQxW2S2HmJSM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=BwY1eDXK2casDflWj7FpxvSTaOUpF6I6RaUtfHX7uDXoOmvURB5vkHOFZ3pHN4mYY
	 YSGGZqwOvbbnTMbL4JbqmeosKm3zElo1oh74xaK2cuIPRsJrRkelv0KgiuijDYQDgk
	 jgkYTEOpsGsJKokmMJTN1q62s5tlSsBGpk+W8KAwQb+UN/LjcAfyhblYIeGfZWFvTR
	 sbwG67ET6OUBfimy9x3NQAU/oXqkl5hFQGoxEbLS3JhRqqidEAQlkCbmy/TtOZqqjw
	 mkqCCDLRDVkIqJHK62uiDjZ+hSojZjY67Rp5rHGYmscPI7iUW7H3YtnulR/weGeQvB
	 rh6bbe2+N/ipg==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39b26e2ad5eso27852881fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:18:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rox+5QuNB+olAsCS9R0FMqPhJFYvFjbHcUC9XWKnPhohHlqL4/WuMDBpJGV+OkA4nDGunRAbZ0Yap+S75UdSR3n@lists.infradead.org
X-Gm-Message-State: AOJu0YxNdfsCCpzHqg4NiyKiWtDlz0Ylw0Jy8YXs17ep9l+SeOf5OSbJ
	uFkHeUStmgrjXC7g2lqVY53kZk0yXXvTTv18Suyi08enaZ4M9fzv16bkLemSWQ4qAdHw5fejCJh
	X90FDuZU7i9aspjCx77zm0Y0ytHgdcYs=
X-Received: by 2002:a2e:a99d:0:b0:39a:fec6:efd0 with SMTP id
 38308e7fff4ca-39c5ffae1cfmr4021431fa.23.1783358280803; Mon, 06 Jul 2026
 10:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260606205452.2386930-1-lukas.schmid@netcube.li> <178335762241.4010120.15331558144606875972.b4-ty@kernel.org>
In-Reply-To: <178335762241.4010120.15331558144606875972.b4-ty@kernel.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 7 Jul 2026 01:17:45 +0800
X-Gmail-Original-Message-ID: <CAGb2v66nsmz63tMUpkb_p6nXGCtvVSX4z8tJ0Ojg_6md0sY=KA@mail.gmail.com>
X-Gm-Features: AVVi8Cfs5u3u3Le8rfmIs2akFxo6f5Cg5zKm8U8X3Ch8xkPrjuDD5gQk7w4gesM
Message-ID: <CAGb2v66nsmz63tMUpkb_p6nXGCtvVSX4z8tJ0Ojg_6md0sY=KA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add support for NetCube Systems OpenNMC (dobermann)
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>, 
	Lukas Schmid <lukas.schmid@netcube.li>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jul 7, 2026 at 1:07=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrote=
:
>
> On Sat, 06 Jun 2026 22:54:40 +0200, Lukas Schmid wrote:
> > This series adds support for the NetCube Systems OpenNMC.
> >
> > Sorry for the quick resend. This v4 includes the corrected Makefile
> > target name.
> >
> > Changes in v4:
> >  - fix the ARM Makefile target name for the new board
> >
> > [...]
>
> Applied to sunxi/dt-for-7.3 in sunxi, thanks!
>
> [1/3] dt-bindings: arm: sunxi: Add NetCube Systems OpenNMC (dobermann)
>       https://git.kernel.org/sunxi/linux/c/9995c8146bb9
> [2/3] riscv: dts: allwinner: d1s-t113: Add uart4 pinctrl required by NetC=
ube Systems OpenNMC
>       https://git.kernel.org/sunxi/linux/c/5b0fd777eb34
> [3/3] ARM: dts: sunxi: add support for NetCube Systems OpenNMC (dobermann=
)
>       https://git.kernel.org/sunxi/linux/c/9dc45b17fb85

Force pushed this one to change "sunxi" to "allwinner".

>
> Best regards,
> --
> Chen-Yu Tsai <wens@kernel.org>
>
>

