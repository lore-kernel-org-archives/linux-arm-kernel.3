Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182BFC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 10:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bI4tM5u6hlOmKAY3jmb6sm9muPDkxLfs7d3SJ5djx70=; b=PHNIRv09IbYQpbukVOvgCcIeS2
	rItyd2jqW63dakkU+VilGd3GTPeffdV1PMe2tJXv/fPNMw2porgpNrfnhzPRwUYS+L5ZEdxs6Bw/x
	yKTLtrMC17W7MJn/MlOtcAcyjDr8f+HpXKuX+bKYt8KP+funOv6omV4kgDKByLaOHGMITmaDnvglq
	pAxXL2OiG1ICHc+jGugy/v5q2DHFKSg7Bmlk+zz3is8Qcgk9pQj05TTze6rv6VBe73yG4WmAoM6/Z
	3uyl7F+hgLSvkif+ejRePW+Ev2ynl8uPXAJ0oSza2NiaUZYt+fbNw/yqZK0jceTHTPAN7wGbQi3B6
	zs2bXxng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Aje-00000006j7q-1UlR;
	Tue, 22 Apr 2025 10:20:14 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79Vj-00000006TVG-3GBX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 09:01:49 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7c9376c4bddso256991585a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 02:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745312506; x=1745917306; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bI4tM5u6hlOmKAY3jmb6sm9muPDkxLfs7d3SJ5djx70=;
        b=PYutXrT41pIdXgXg8cIE1oN7WUusUzxLgutI6O3N7a8UAk+CmoJS+Dxw47uF7p2rNn
         gzLuUzS2UsDgFPA3kTlZiowF3onu9w/rTPL+I3bwMa/qU7zem3ew4OFZ7/WhnQocUt2j
         ig0mJ7zATCtTW/LIXa8X/fzMDkvYXJ9bRfI+Gjo8FONJqJQZBA4m11OW9Mf/AYfYkVrM
         a9yChqV+L0GjoLCAS1h54RxBk0R0bq1DvT/hEUzgyIa7ZXrvzHz9U1vm7Gqje+L4BSbw
         Hn4fgkoDFGmy1AeQVtGmwSZ9RqVfeAQrv6RPWRAcsxTJvYE50NOK1fvlSX3c9PuAEAG+
         +/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745312506; x=1745917306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bI4tM5u6hlOmKAY3jmb6sm9muPDkxLfs7d3SJ5djx70=;
        b=w2Itm6l0lYENxf2miT1yXVFQTgwqm7Wm6CbdIBU7OPALvlCviDrrymiBzt+bQTucAy
         7TS0lSprW1EyNeAEn3TDubyQT1kpVKGkTDRq1UWBZzKEa/SBDM6nC0HoNnm3AMKOOhZu
         vZoxRbJ+Lw7XlmNEQPGDy4B+QMlI+bnZy6OsyelxDLGLYtbc2xL+oVVhqjOv4uprRExB
         x/UWVtqyUW04pUaWFcFYlLsxTR6pwLpXj7dBM0BO4Iesigzh6w1PnJhq8dTH4ZZT1t+G
         uLclNzWjiVAz2gScO7YlmqoQkljBBQLcXLJLct7IAG0vHFus6caU1VO/jedtBgD0MNlQ
         I+oA==
X-Forwarded-Encrypted: i=1; AJvYcCV//FAb3hFpKOZDFYcgYGc6N5vtMs8bVSEWz92/BnOmAIB3jbA4yPWeBeg+SM65KhLE26ArLY/rsFPC91Y885zQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxUfPfP6/tLUgw0+s/lrJBZL/at/zJHHTz4pLdZYlGlASIe9ojF
	oEydkELYnfBMyz7jhxj4ZARG2gzS70wLGolGG6bKWK/kjKPsZPR4o2chVhOyAncnsyQtPmv5uj4
	JJ2LlhYQr+HbgjxWytiTMszna+lI=
X-Gm-Gg: ASbGncvFGDjDP6I0SpMP0RxnGPzFkT2ebb8Y64VBSc2m8tES+Ht7OJ8pPU8P6SQCvbV
	I7cuAN+aBeT0v51M3L+/fs4wbjOcUoiWNp8HQ0lePCwNYO12HUAEpVeJ8wHkfQ1/M0H2bsC1ODV
	p9w6Z1K6IaGiqFyIQos/QyAnHI9O2z5GeIsCeLtNvxiHPdQ+9XTvDBwQ==
X-Google-Smtp-Source: AGHT+IHPgdQcr6+EJ2c2GBm62vKYoe1rNLruGx6vpyIyteGjKou1apc6OLDwP+NZ9T6S5hjDnfeJTmR8mETK+wK+bzs=
X-Received: by 2002:a05:620a:2684:b0:7c5:5909:18e5 with SMTP id
 af79cd13be357-7c927f6f84fmr1960081385a.3.1745312506200; Tue, 22 Apr 2025
 02:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-3-f9af689cdfc2@gmail.com> <20250416201407.GC3811555-robh@kernel.org>
 <CABjd4YyTKquLcYC+DVg_koi3p7AhqwBNiazCiC713DQKjCaBSA@mail.gmail.com>
 <CABjd4Yxi4SLqsAk_fb9C=1BW6XjnZ8LQ_JKYu6KZ3TtMS0fnhg@mail.gmail.com> <14de236b-e2a7-4bde-986d-1e5ffddd01b4@kernel.org>
In-Reply-To: <14de236b-e2a7-4bde-986d-1e5ffddd01b4@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 22 Apr 2025 13:01:44 +0400
X-Gm-Features: ATxdqUGmp6GiWAgqNWbO-0WSin1O6yJxUf9gHQTl5ZTyEce7EbX-dkQTVJBozo4
Message-ID: <CABjd4YwpKYr3q06E7H3upFxyUT6uGg-Jzt2_FiyfS8R=j0ye8w@mail.gmail.com>
Subject: Re: [PATCH 03/13] dt-bindings: mmc: vt8500-sdmmc: Convert to YAML
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_020147_820081_57E8AD01 
X-CRM114-Status: GOOD (  40.02  )
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

On Tue, Apr 22, 2025 at 12:08=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 18/04/2025 14:38, Alexey Charkov wrote:
> >>
> >>>> +
> >>>> +  reg:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  clocks:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  interrupts:
> >>>> +    items:
> >>>> +      - description: SDMMC controller interrupt
> >>>> +      - description: SDMMC controller DMA interrupt
> >>>> +
> >>>> +  sdon-inverted:
> >>>> +    type: boolean
> >>>> +    description: SD_ON bit is inverted on the controller
> >>>
> >>> This implies I know what the non-inverted state is. If you know, plea=
se
> >>> state that here.
> >>
> >> This is a tricky one. The only answer I have is "it's inverted in
> >> later versions vs. the first version I saw in the wild, and I'm not
> >> sure if it's board related or IP version related - nor if the original
> >> was active low or high". No docs, no schematics, no vendor left around
> >> to chase for answers.
> >>
> >> Will dig around some more and update the description if I succeed in
> >> uncovering any further clues :)
> >
> > I've found some extra clues and would like to consult on the best way f=
orward.
> >
> > It turns out (if my understanding of the decompiled binary-only WM8505
> > vendor driver is correct) that all chips before (not including) WM8505
> > rev. A2 treated their "clock stop" bit (register offset 0x08 a.k.a.
> > SDMMC_BUSMODE, bit 0x10 a.k.a. BM_CST in vendor sources, BM_SD_OFF in
> > mainline) as "set 1 to disable SD clock", while all the later versions
> > treated it as "set 0 to disable SD clock". Which means that there are
> > WM8505 based systems that rely on either of those behaviours, while
> > any later chips need "set 0 to disable". This is not a board related
> > quirk but an on-chip SDMMC controller revision related quirk.
> >
> > I'd love to switch to a compatible-based logic and drop the
> > "sdon-inverted" flag altogether from the binding I'm writing, but here
> > are my doubts where I'd love to consult.
> >
> > * Looks like WM8505 rev. A2 needs a separate compatible string vs.
> > prior WM8505. Can we have something like "wm,wm8505a2-sdhc" and
> > "wm,wm8505-sdhc" respectively? WM8505a2 not being an actual chip name,
> > but something discoverable by reading its hardware ID from a system
> > configuration register at runtime
>
> Then maybe it can be fully detected runtime? E.g. via soc_id driver (see
> drivers/soc/)?

Thanks for pointing this out! Yes, it should work. A separate
mini-driver to identify the SoC based on the system configuration
register readings and a match table on soc_device_attribute inside the
wmt-sdmmc driver to differentiate between different controller
versions which are all identified as "wm,wm8505-sdhc" in current
device trees.

> > * If I introduce new compatible strings for "wm,wm8650-sdhc",
> > "wm,wm8750-sdhc", "wm,wm8850-sdhc" and "wm,wm8880-sdhc" in bindings,
> > DTS and driver code, then the new driver and new DTB should work fine,
> > and the DTS should pass schema checks. New driver code won't work with
> > older DTB unless I keep the logic to parse "sdon-inverted" which
> > wouldn't be part of the binding. Old driver code would not work with
> > newer DTB except for pre-A2 versions of WM8505. Is that acceptable?
> > * Existing DTS doesn't differentiate between pre-A2 vs. post-A2
> > revisions of WM8505 and is bound to fail on the latter
>
> That's an old platform, so we should not break the ABI, thus drivers
> must fully support old DTBs.

Noted, thanks.

> > I realize that breaking backward/forward compatibility is undesirable,
> > but frankly these systems seem to have few mainline users, and those
> > people who do run mainline on them ought to be compiling the kernel
> > and its DTB at the same time, because the firmware doesn't know
>
> There might be other users of DTS and anyway what would be exactly the
> benefit? This hardware aspect is already documented via sdon-inverted
> property.

The benefit is rather cosmetic (to properly describe different
versions of this controller using SoC-specific compatible strings, and
to avoid defining bindings for random vendor-specific properties such
as sdon-inverted).

Best regards,
Alexey

