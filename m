Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFABC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 13:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ftfht9dESKSAPnwFSJWWBdA4NbYVeXe2TbeMTZhp/yw=; b=n89MBQPSDVlZsO
	wKoB8gZZ2rFtshZ3vRRSEsaDwS7TUZ/vRnermJv74GfvBJfw/au3L9HDjG3xV5xlE4d7X5Q0YW0mB
	BdkFV00ugEQHKsa2gunmHufNJWvdL0SliV91xTy6LHWsRkWLABDZnslt0XDXDlgjOuJcl2tKiliwd
	vyllRhyRWFP5iggzJ9WZaY9PpRYtT/i9riP8wmrhVtaWoS4p8idqrfVDDpRHj5cREyPnUdBKyE2KH
	StlXBuui0oxI7+Tt8BLKGxy1yU7KRuh7v/ksmLb+UcxuGODK2lHfo/Tn39MON4kGWNeXS1k/7c7l3
	LfWkS+bzLUZiw49EInPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHOM-00000004VvQ-29N3;
	Thu, 02 Jul 2026 13:23:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHOL-00000004Vuu-0mfF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 13:23:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 966CF43E0E
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 13:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D5A1F0155B
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 13:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782998624;
	bh=Ftfht9dESKSAPnwFSJWWBdA4NbYVeXe2TbeMTZhp/yw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=kyB1Hces0wWh7ITVH83tofR1cvz9azT2RIgKhMZiUHOLi76dxMGG4pz4f4qxpNFFl
	 YW+ZD1uKlxOMP03k5feVx2bhrvLpKyiPOl3rkc6UXDAGAmZ8AKsVtnS96fvY+ZeKq3
	 9BBZnsysjR5jMg8Vxsr/LsUJ0mkMwOTFsqN60/IB0ELV95lgjUAfrytOd60+Ubhl97
	 axTfYyy6qBtwXCaxQKpIIIcFlytA7UJhzTfo0xVlYDFFoo6HxiKR2rgfOXj+HODlE7
	 SnVjsX0vfhO99nYiUtak/RjJCwtQxjmaYcpnCU8Wq0VoFU+VaLpDW7Z8ZI41yqfXqS
	 SMkdtLYVGmo8w==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39957d210f4so17477781fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 06:23:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RobgqyPuD/bnKcQYdzG6rg0muZr5ubphN9hqwLFLB9Yx1oy0IdgZUqdb36mtRIUYs3BqgywftOBGcLMI5TTeBoN@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb2yTazD/+HCWILwP+T+JLpSy45EAVttfpJ7jb7Fs4tj5peEpL
	u0oK9Z0V2xecsma9Db21eA2mkdC6irfIz2igUCTD5YRD4T4sSaNDy0o5arSOIZh+cwJHaHTF64g
	6NQS9qL4J3dcLE6hDEG670UXG2n6ey18=
X-Received: by 2002:a2e:ad13:0:b0:393:a31a:ab3c with SMTP id
 38308e7fff4ca-39b34044d9cmr12431061fa.25.1782998622933; Thu, 02 Jul 2026
 06:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com> <20260702-a733-rtc-v3-1-eb2580374de6@baylibre.com>
In-Reply-To: <20260702-a733-rtc-v3-1-eb2580374de6@baylibre.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 2 Jul 2026 21:23:30 +0800
X-Gmail-Original-Message-ID: <CAGb2v66YUmQNwRG_WtL_2NQTOyLFQD8=q0bZ+Gs_-aKQ4FhsDg@mail.gmail.com>
X-Gm-Features: AVVi8CdgR5HOst5qEMn_2lQsiwLdv5IzTcHwmWkZLAYWxm6nynDQErb8y43I3bQ
Message-ID: <CAGb2v66YUmQNwRG_WtL_2NQTOyLFQD8=q0bZ+Gs_-aKQ4FhsDg@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: rtc: sun6i: no clock-output-names on h616/r329
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
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

On Thu, Jul 2, 2026 at 4:10=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com>=
 wrote:
>
> On h616 and r329 chips, clock output names are never defined through DT a=
nd
> are not meant to be. Just disallow the property for those chips.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: http://lore.kernel.org/r/20260629125305.0DF981F000E9@smtp.kernel.=
org
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

