Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2CBC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 12:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3F2htAaSgkkxvZ/5MPPccMC2gln25kjMNeYIdiRBb0=; b=bhb6eE35p46SeWgEXX1ySfccwR
	ik0mqGIXnxGXUloYHheNwG9ovVerWMa+qtK/kAht1fthl7T4bHBQ/pfO3jYLawrHiVjdXWx06dGbr
	6yFt94G9brRXcBLjm52Erh+YL5J5XNr6dbZRLwdT2RMFFCIBk6fWaXugoQkMmIVYQc8QlVtw/u0Ci
	hVFaO0COTLqMxCeidHw8bbLaeY0/hgCOgBcNT4MAQuGHbEOdKEPIIRCN6wbuYWRw0CWlL3tdsfDpf
	0l6zvCAl5t0cBQKKJzU/FDYOdW1i/9J5RmUZ7ZU6ZUnpBG7t3eg3AZM40IqzMLNtqHYBiaSVRLge9
	RoPRSJyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrMN-0000000Gyxs-3nFo;
	Mon, 03 Aug 2026 12:01:35 +0000
Received: from mail-vk1-f181.google.com ([209.85.221.181])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrML-0000000GyxQ-2t87
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 12:01:35 +0000
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c2c96286f0so1595962e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 05:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785758492; x=1786363292;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/3F2htAaSgkkxvZ/5MPPccMC2gln25kjMNeYIdiRBb0=;
        b=pNkRO9dimvwsG7+rFd2cB8VNDZgtat912rcOi32q+EfnhA5HhI7tCMyWDpr8UDjycb
         VIBlyh17iXzSjaV2PbUtFKGdWzS9qDP2czYtreG8X9GHg/TVWwPHywr6NeDNl5a+teB6
         LH4xuwcUrvHzIBAPI30U8n0DN0J4iyfK2wyLWUr4MH77bEE4jZYdl7GH7XUVLjnnxIfb
         NThaEnXvqWwRLBYWsW9GJN1tiSi3j4wlICuT5JsQ9RYKGQ1OloW6u4ZsKMOua7uIv2om
         yXi68UhXIwyqs/X+S+um+IKrHnhzgNRuryc7ttKHLqplb8dAX4KXabRWHM9bNuJpQGTR
         24Gw==
X-Forwarded-Encrypted: i=1; AHgh+RrHnxevRjkNUkUAszoR3RBoy9aE5xJVxGAkvE9Xe1yEEnuopMoBAys6WqhcE4hox6wkxzTJMuAyLUePKQ2zieSW@lists.infradead.org
X-Gm-Message-State: AOJu0YybvUCloRjgyalt9Y3zfZNyh2dZYPyJKCPgt48nUUFGg06Z+Q1W
	tKqHgybkUGyk7bBZtFzNabo0Wt4MDjcVbPkDcKaWTdq8YXKk3oFgS1lt1RechT6P
X-Gm-Gg: AR+sD13r/+lfZNEAoaleC1awYokOY/1qWfWTRWH+UCnJiXf1mz3gUoJ64nPxIf8YuOW
	3edu5dtN2pP2ZPgCzsBDdKByUMNiQvml5lfnKeUEr9t5wLXqhohz/M1mCi/OSfUbOdrWgyRLuTt
	IVPYDW16SbPXAXxlDdnSvQBBCUXTvI02Y7e+Elqbz3dwJy5O/M6CJIPAVpecVwW3d68MLLw6kzE
	/H/Nh6Zi53V4qFuV1EiXNBIPoss3NxgPJ7BAH3iFpKUe+S6FGJYWrebqKI+X6EK/m4gdORuED24
	GkQKRwCRNyJoZEyEtGV0r/j3TRMfoKaPBcghLX32XCgE8SERIPreiVncbH9fQ6XTxqkbJM/wqGa
	9jdh1blf2GnH5NzWPVq75EMLYZ9o557IrIbC6dQJl3EQE/jWJ2AINoMH6KlHjSL1EFpFS5Cop8f
	gZFXuSg57DETysYq4/W2hNRwtKdIEsiRJfcTI3zt5kkUpr8V7wbWC5E3f+V+QTY/w5X2oZi9CSD
	eucb2+eo+Y/Yg8HMWCTNfsGRWQSRg==
X-Received: by 2002:a05:6122:208b:b0:5c2:c0ae:a2e8 with SMTP id 71dfb90a1353d-5c3876fb5dcmr2284308e0c.7.1785758491300;
        Mon, 03 Aug 2026 05:01:31 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c37eb2a833sm8537733e0c.6.2026.08.03.05.01.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 05:01:30 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bf95ade656so1282245e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 05:01:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp51QjEAqtK/+vGxwBZv3aEbyk6ySM4YimttfCLe5qHkpzCtGLRv4HMkS02C253ZqGZMawBx6IQt1vsQYZc/J+K@lists.infradead.org
X-Received: by 2002:a05:6122:c94:b0:5a0:370:f12c with SMTP id
 71dfb90a1353d-5c3877ee9a2mr2551587e0c.11.1785758489767; Mon, 03 Aug 2026
 05:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
 <20260710-adventurous-burgundy-chimera-b2fff9@quoll> <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
 <20260716214924.GA1477674-robh@kernel.org>
In-Reply-To: <20260716214924.GA1477674-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Aug 2026 14:01:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU0ss6wUEdjC+OYa3iQS439aJ8b_d9M2ws7Ayn4_kOyMQ@mail.gmail.com>
X-Gm-Features: AUfX_mxcGqdlDliYxmfdCYiKuiCZlBR4i5y6ZczTyLGv0wHHqfKRM8R7C8jMMeU
Message-ID: <CAMuHMdU0ss6wUEdjC+OYa3iQS439aJ8b_d9M2ws7Ayn4_kOyMQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 firmware property
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_050133_734428_C50895F4 
X-CRM114-Status: GOOD (  32.27  )
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

Hi Rob,

On Thu, 16 Jul 2026 at 23:49, Rob Herring <robh@kernel.org> wrote:
> On Fri, Jul 10, 2026 at 01:02:39PM +0200, Geert Uytterhoeven wrote:
> > On Fri, 10 Jul 2026 at 12:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > On Wed, Jul 08, 2026 at 12:16:23PM +0200, Geert Uytterhoeven wrote:
> > > > Add a firmware property, for systems where SCMI must be used instead of
> > > > direct hardware access.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > v2:
> > > >   - Spin off from "dt-bindings: clock: Document Renesas R-Car X5H Clock
> > > >     Pulse Generator".
> > > > ---
> > > >  .../devicetree/bindings/clock/renesas,r8a78000-cpg.yaml    | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > index 4e23bba334382346..fc499e7cf52e4f0c 100644
> > > > --- a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > +++ b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > @@ -35,6 +35,12 @@ properties:
> > > >        <dt-bindings/clock/renesas,r8a78000-cpg.h>.
> > > >      const: 1
> > > >
> > > > +  firmware:
> > >
> > > RPi is doing similar, but I have doubts. It looks way too close to
> > > generic "syscon" which is disallowed.
> > >
> > > I think this should be vendor+purpose specific, e.g.:
> > > "renesas,scmi-transport" or "renesas,scmi-firmware"
>
> If you can tell me the resource that a 'firmware' provider provides then
> it is fine, but you can't.

It provides a firmware API, which is not available until the firmware
provider is initialized.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

