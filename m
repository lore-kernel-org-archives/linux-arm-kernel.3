Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A7DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MuUmGqSSA58rP0nRidv37IIoymAVqS6FDOb1XQHbyds=; b=SdTmA3K75gYKfGaN2kWmWxuFKw
	lg+dPi00D7LMRPaNd44oQrP1gjobffxsHQ1LsXMfgs5kIyycXPL2u8yaeFbRNv6tHdv/15qkLo8pG
	BSMFpKETj5OwLEy+A1RRdeV44DDpC1tPZNzb3HcTfxBz78p0xPR/GcB/tGKug5KLxoBnQdcjMbAss
	9lWee2TXeGTV7wwdB2T6m8/BxxwRTPEg4gKFIiiim1EwYl4Gm2Xzt7sI6CV28nMlbKpdOqHty4R6j
	V3qktEid/lowkA05pN0KGRZdoj9oTWXaPRU7ENiMK6WoL1YGF90JJQeBtgi896r5pRBDadjinvzJd
	qtFM9PjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi90S-00000004lqg-10OS;
	Fri, 10 Jul 2026 11:02:56 +0000
Received: from mail-ua1-f42.google.com ([209.85.222.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi90Q-00000004lpb-23yY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:02:55 +0000
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9690c99c917so242261241.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 04:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783681373; x=1784286173;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MuUmGqSSA58rP0nRidv37IIoymAVqS6FDOb1XQHbyds=;
        b=s+vAAfmUepk8R5Jam7YTf7ZGV5aH9RI1l4qEeTJTJ6UVKFTihsNHn9b78Xe8LTF13E
         I2QrIDKeBvsDwc3/mCCW2BvVhxIo2FXVO2vqgVCv7vvEZJpP4w9BNUlf91vYLi9pJzE6
         ubgKranpnZP5ZatBhDsLEbbfpNxN5cu1zsmjTq1uuneI+dWUkqXs9fGVKCuSt2E76EEk
         G90NfSPBnS3ovnobv0Vxrcv6EK0xhEgpqgKG4ooRK80gNIdtRKsfYhI1I5Yj8Ue7X9pY
         9ZnrkeAv3M8RKvDgy7GfV2wWNBli1ZzWsyudYsbvH6q2oYKszaXMWS0mtLuzn7d9Uqwk
         wEYQ==
X-Forwarded-Encrypted: i=1; AHgh+RovrFr+wKrZro+wovFib4u9GsKv1VTfS5M0Z2yZz3ONG8AUUuC7kX7UVkXBbZYLaPyzTRFdazTYxotFF5M4Pu3n@lists.infradead.org
X-Gm-Message-State: AOJu0YygE67CuITCGmkmXPT/jruyQeKL9viBr88Z9Xi7M5wDHVBingOH
	CNjCqdQdhCQ16YV3G6V0Om/bwyAFWkmwZlbW7THQjPlqCYKvxzbM1BX/CdYYRjcxb1Y=
X-Gm-Gg: AfdE7cml2rcXRjX64M2+sQMUPvF4Wj0zHQCizeSE6d3GZXJPVHLK8Wk4mrJANIXIvQc
	BK+ihHkOfMDV0ZLLx80oumdgsJMnE+EhewulIjXCbTbtptRnPjb7c9rYAu8PM1fyB1VGf3U2ecS
	bQSgefPi3G/jqP0yHFbESrWr0smFkuzpxn7LL0OKSxHxmZs4CvthfG+hJEfDZexte7q0l0fY+NT
	d8FkMiOGV8n6Ipx7V4oKIVEytYwi4JMivvije05jrpMzgXNAIgiARoISAo7BzUwhPc0qLykmrRr
	VpqqejYDUcKv0OMFTAny1BjU/nEcGw7UemHl1av+6Mu/BNO2XkRhyJ/C6kKmJ2k0KguUAlW5No7
	hVLN97YpiZog9ij+CfiPXHL0FLMYiL3UfKyuzSrAp39KDfyUVQC+XYQ75HCMQ+77oUwUBYDSfUR
	z4D9p8xa+cZinplZvstRiEK0H6M17PRwf6gsOyimTJ0aVT+IbApg==
X-Received: by 2002:a05:6122:885:b0:5bf:ab99:ea89 with SMTP id 71dfb90a1353d-5bfab99ecbcmr1013262e0c.12.1783681372974;
        Fri, 10 Jul 2026 04:02:52 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f66eb74sm4853887e0c.7.2026.07.10.04.02.51
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 04:02:51 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9696319e14dso303529241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 04:02:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoHg17SbgoFsHeSLv9DHMN4i3QzNiC+yubesmEJGPRQT+B3OqKPQk0oGj61gwv1g9xZn+NSq3f34D5KxUgbSAgg@lists.infradead.org
X-Received: by 2002:a05:6102:5789:b0:73e:9fae:5844 with SMTP id
 ada2fe7eead31-744e0426fd6mr5821388137.27.1783681371174; Fri, 10 Jul 2026
 04:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
 <20260710-adventurous-burgundy-chimera-b2fff9@quoll>
In-Reply-To: <20260710-adventurous-burgundy-chimera-b2fff9@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 13:02:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
X-Gm-Features: AUfX_mypDnJ4qFpPLK-a5R1Mbwkbc6yQr178xDsRkCp5yARGuoX_7FuK_KFx-r8
Message-ID: <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 firmware property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, 
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
X-CRM114-CacheID: sfid-20260710_040254_541486_38AABE25 
X-CRM114-Status: GOOD (  29.70  )
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

Hi Krzysztof,

On Fri, 10 Jul 2026 at 12:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Wed, Jul 08, 2026 at 12:16:23PM +0200, Geert Uytterhoeven wrote:
> > Add a firmware property, for systems where SCMI must be used instead of
> > direct hardware access.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v2:
> >   - Spin off from "dt-bindings: clock: Document Renesas R-Car X5H Clock
> >     Pulse Generator".
> > ---
> >  .../devicetree/bindings/clock/renesas,r8a78000-cpg.yaml    | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > index 4e23bba334382346..fc499e7cf52e4f0c 100644
> > --- a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > +++ b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > @@ -35,6 +35,12 @@ properties:
> >        <dt-bindings/clock/renesas,r8a78000-cpg.h>.
> >      const: 1
> >
> > +  firmware:
>
> RPi is doing similar, but I have doubts. It looks way too close to
> generic "syscon" which is disallowed.
>
> I think this should be vendor+purpose specific, e.g.:
> "renesas,scmi-transport" or "renesas,scmi-firmware"

The disadvantage of a vendor-specific property is that there are more
cases to handle for fw_devlink, cfr. "[PATCH v2 02/10] of: property:
fw_devlink: Add support for firmware"[1].

> Also we have "firmware" nodes, so this might cause conflicts in dtschema
> validation.  Anyway, the phandle itself is fine for me, just the naming.
>
> I'll ping also Rob to chime in.

Thanks!

[1] https://lore.kernel.org/de34ac0c52695d92c67cf950b3d8e9b30095d305.1783505329.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

