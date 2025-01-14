Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F42C02185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 00:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7Lgxko9uVGZsuMx2gafWthQbaIDbF0yPzFdPsX8fXI=; b=KMIMcXVBKwKPhiRpN1na6PPLvD
	giM1a2dSpoiSeAxOlq9sOzLW0RKeOtG6lmGBoMkbsTzm9PGvwCvcnj8/Hl+n1FMFT3GcVvlHxtxOe
	M26EIW6N5HM4pNk7AybJqlu4+TQdM0+EkER77zCq4RaHG2I9wppN4PN63v4ZKchb/LBx8/5XY3qCg
	5atZ2Hd5Kq/GAww6SqSakpTN9j+qs7F7Y0tx+yGlC/W7HhgpnSHP0r8hSyZvc0IaGYDxAa6YFEMNZ
	rgoIXPFSlRO/dG7IxuHT0mhfHHWH0Jsc24JTevzhgGM5KMLg//nom6jigfqYk7Ja8hv+5WixVDArQ
	32JJ4GtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXrKl-0000000AD01-0y85;
	Wed, 15 Jan 2025 00:32:35 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqFM-0000000A5fD-2QRo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 23:22:57 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6d8f99cb0d9so43277286d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 15:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736896975; x=1737501775; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C7Lgxko9uVGZsuMx2gafWthQbaIDbF0yPzFdPsX8fXI=;
        b=AxwDF4eaLzH64FVIV2AmDafSQ123EXoct/PcS6EicUclmzV7aFqohIHt15EudgsWyE
         vt+pcQ/cr2uaTWOTUOigUsx1Vzx8KaNrn0GIDpAbyNRtEzNmAL/oHjpzaCuhoRfEnpNu
         wOJYT3FIV+oLndGw7TGeZA9dV5YvFblkeK5aA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736896975; x=1737501775;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7Lgxko9uVGZsuMx2gafWthQbaIDbF0yPzFdPsX8fXI=;
        b=o2uaocYt22I4hB/xM32pUf7hP7mhE1IqQL0d5KP0sfknLlLAU85BDY0KbQWuCloCgG
         pgjA7b5RaFXHEOTbXNOs+e+he4TyxydMDsqMCwqsoZxOcC7+phphBjq1XdKjuDfu45Yf
         HeBIAsZ4lVWNe2N0Ii0t8AwxEcX44UsewG6tuMyxPz/UqwhbvgVIKVZAnLoEzHJgnRL6
         Bnm8Pme9Zvclq9NYf5gFLe4zB+dFUCpwfr8G/vm+TGBVrPiYf0ibpEenZJcCkrNB3KzL
         vjtzO8ZirZTgb+Jhyir5dG0dnS6wXxKn/FH5hO9GbU4nZBTvdZ/CYo9L7ESFQL4xLtxA
         ANew==
X-Forwarded-Encrypted: i=1; AJvYcCXatSCBc+xXZr4AVtr1Y0Lv0y4DubU98A7PPjSUaDTF0LXlqskJ9DX/RDpMhDF5xr2dVfufi9Y8VNNMu+QeUkNE@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7CnFjAkIFBTxNqUU1hiZQX98L+y4LaKnPNRFVJ6BSpjNNjyfk
	Dx3Cqqr4BPrTSgDo6nURZaQZpYOt+SE7DmM+fIrumHpDbsCkURr+f+jmGSUelaHfDKdInT2AHMh
	7WHE7Adu8HcfaGFxlr3XxTOgjjToQHJaEv/ve
X-Gm-Gg: ASbGnctXPaxIgxqnnHzoqbTZYVi+xO41kbjmzTM0/24LN4hY66a7uIh2evuyCeWbdEW
	f/dME6eM8N8C0ddTJWA5AQ2fKnZ02LbSaUUXTPYpIuUkidT0+zxYupJh89LOkqh6BTQ==
X-Google-Smtp-Source: AGHT+IH1kgTUMPnbtiGBciMBLmycdZKmyXxo9rET57i4jmCQr51jzLWHtQ8uJQmtzyihKUb4hk4pgWE1ZPT8zcHMCVw=
X-Received: by 2002:ad4:5c68:0:b0:6dd:4c5f:b3d1 with SMTP id
 6a1803df08f44-6df9b1f6e3amr412156276d6.3.1736896975019; Tue, 14 Jan 2025
 15:22:55 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 14 Jan 2025 15:22:54 -0800
MIME-Version: 1.0
In-Reply-To: <20250110135843.GA2630182-robh@kernel.org>
References: <20250108012846.3275443-1-swboyd@chromium.org> <20250108012846.3275443-3-swboyd@chromium.org>
 <7a64e927-235b-4d63-af59-f2c80464a9a1@oss.qualcomm.com> <CAE-0n53wX99ry88zOOuq6SPVpraiENheJ1T+HZri82x4gqZJ_w@mail.gmail.com>
 <20250110135843.GA2630182-robh@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Tue, 14 Jan 2025 15:22:53 -0800
X-Gm-Features: AbW1kvZZEICi_ElffHdcdM5qCntX3rhUy_7MsF-zN--bVSuif1_AJXoaGEXBpfg
Message-ID: <CAE-0n50yP2qwvC6nWph4XT2bvDmd4rwrC-Omx33Q4z96r1bmoQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/6] dt-bindings: bus: Add qcom,soc-sc7180 SoC
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, devicetree@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_152256_644530_1CE3FBCF 
X-CRM114-Status: GOOD (  29.00  )
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

Quoting Rob Herring (2025-01-10 05:58:43)
> On Thu, Jan 09, 2025 at 01:51:12PM -0800, Stephen Boyd wrote:
> > Quoting Konrad Dybcio (2025-01-09 06:05:14)
> > > On 8.01.2025 2:28 AM, Stephen Boyd wrote:
> > > > +
> > > > +  '#size-cells':
> > > > +    const: 2
> > > > +
> > > > +  clock-controller@100000:
> > > > +    $ref: /schemas/clock/qcom,gcc-sc7180.yaml#
>
> This makes the above schema be applied twice. Once here and then when
> the compatible matches. That can be avoided by just listing a
> compatible. The QCom display bindings follow that style.

Cool thanks!

>
> > > > +
> > > > +  watchdog@17c10000:
> > > > +    $ref: /schemas/watchdog/qcom-wdt.yaml#
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - '#address-cells'
> > > > +  - '#size-cells'
> > > > +  - clock-controller@100000
> > > > +  - watchdog@17c10000
> > > > +
> > > > +additionalProperties: false
> > >
> > > ..this approach will make any dt node addition under /soc require
> > > an additional bindings change, which sounds like absolute madness
> >
> > We should pretty much know what nodes go under here though, because it's
> > a chip that exists and doesn't change after the fact. I agree that it
> > will be annoying during early development when everyone is modifying the
> > same file to add their node, but that problem also exists with the dts
> > files today so it doesn't seem like total madness. It's also nice to be
> > able to look at one file and quickly find all the schemas for the SoC
> > used, like a table of contents almost or a memory map for the chip.
>
> I don't really care for listing everything either.
>
> We could just generate all the schemas used. Either "give me all the
> schemas matching some compatible patter" or "give me all the schemas
> used to validate the DTB". The latter was possible on a per node basis,
> but I think I dropped that when I changed how we select schemas to
> apply.

It is good enough to list compatible and properties like address-cells
and size-cells and then have patternProperties requiring '@' in the
name?

>
> Speaking of memory maps, I would like a tool which could dump memory map
> from .dts. My primary reason is to find overlapping regions.

Sounds cool. I don't have any need for that though so I'm not going to
jump at writing such a tool.

>
> > One thing that I find annoying is that you have to put the whole soc
> > node and child nodes in the example. Maybe we can omit the example
> > because there are so many child nodes.
> >
> > >
> > > I think additionalProperties: true would be sufficient here, like in
> > > Documentation/devicetree/bindings/soc/imx/imx8m-soc.yaml
> > >
>
> No. You can do:
>
> additionalProperties:
>   type: object
>
> Or a patternProperties entry requiring '@' in the name.

This is to make sure only child nodes can be added, right? I like
checking for '@' in the name so that random nodes can't be added that
don't have a reg property.

