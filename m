Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90468C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1WzdsanpWGAxVKX7tDONARnJxB9o/95PB9+RTNsHDE8=; b=aRhYDXGp60Yygn104Gj6G+RIeJ
	lcKU/PhAUk8qSaWNuV5aTkgTy6azViDS8M/FwLkJ+AR1WVLvMjRaL5qKeoHFPbR+S87yMimZ4X+Or
	UNmqYOfH+v6XmMk4iQUZwkqtv2RnxV5xV/JOWlS9WnZ2blbgeN/QIAfoUmUoSl+VRZlZ/UAA543jI
	tzVdWA141ao+m7y4pyAlAfUHVbsVblh13rPqtflZ5qaRQ3zofTJk7Uun7Exh7BVYloE5naDTz2jSo
	mmk+ZtgacD5stbhQ6ZRakFD8Q5HrS67sSkkzKerHdIY9jCdKLE4hf9Nv6WiOuos6sCBtikmhBPmJF
	zxn/BtjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyiJ-0000000BDXD-2zYP;
	Thu, 20 Aug 2026 09:05:31 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyiG-0000000BDWq-3IQP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:05:29 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-66b32bb75beso3243757d50.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:05:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787216727; cv=none;
        d=google.com; s=arc-20260327;
        b=fG8/LzbjZx+2ipGG7hz/BZG12eRgMYg2hbSy3jGgkxD/mSQsYZgKus5AqXWGt+nddI
         S3Vtr2YIRTvVHtuvoExlblIWWqnskkNlxS2Hh/KoDeXdv2Lk9wEyHArbiVO3Hv5I3fjz
         X1mUud0PN0txMn0sS71orcVSiloHvh4yq4UkFEn50Cbqc7Wt+EP8PE/gFibIPXBQL3e3
         KtvdWXZrWBTXwGv8I2lpviIVopEDDWLdbYwScDILVtXNxN+gzb3DZLu9naxvvFMb5Dfd
         Y/BlbMRAck6VXo99KIO2rnrxYjiwN8L/77gs1rPrdPMGvZqupt7FmgYL23J12ztYQzlM
         ARYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1WzdsanpWGAxVKX7tDONARnJxB9o/95PB9+RTNsHDE8=;
        fh=uWvWe30B0odPg5zb5HQsW24Ze5HNYQlenYyBJaVhfAQ=;
        b=ErQyC6CDOMptHr2UwDNfuZzHMGh1s+sxZ5Pd/c8xIouXPgNlyJyH8NQE8YKyZgRdu0
         hRlkSWH43yWAB8G2SInYJUUh3EsgU1F0UpMX1EAKzmvBTZDkohHlpw3A6ZjRVAuxm4RD
         acY/oA0yY7avM70E/vNMn8HTYId8TMbvZjnDkdazELtG5Nx6yQR9oeQtVOYQPLmAdfXe
         HPVJs4ER8IblRmffXYjF4JLbKQyoPoK5WqokKqCM1DS089xKFjW7yONkZBbc0lTwQj0b
         E7gOLOetKLC91tU4fPxnqDaXfWqHP47vDdf/2Sl0fUXfutYvFKSqoRiRCKn5ZmYoCrFy
         ST4g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787216727; x=1787821527; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1WzdsanpWGAxVKX7tDONARnJxB9o/95PB9+RTNsHDE8=;
        b=HHt0eA2vvR9Dw0Knh/ZAAy11GpTBcUVtByo/hyniDUUHHER0AbzitRxGdccH25XLX3
         PA59HjvLYKu8FolI6gFUTHFFCWqo6ILgbKEWPskuto75YvgXxppAFgPZQed44XzL9zkQ
         r/fwLMN7XsV4TCwo5GS1lY/bX0fIYDiAbltEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787216727; x=1787821527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1WzdsanpWGAxVKX7tDONARnJxB9o/95PB9+RTNsHDE8=;
        b=mbK8DGotv0VJf9XqyEq3uaALFTEhgQQ9VmsNLrANGT2OXGVzDHbV/ZmlqIRups0BnZ
         C5MEfOlQ18yXbsacHneSmOosYrk0ukUr3bATFL5vc7Dp6DjQXpkho2DM2ahRYzTihKj1
         CSd5fZdDmRQfUnZIysqQffYIeTQWkD3mbxzZ3nv/pJG/7kHvlkDAxDbP3B/fGugBnthB
         AJ0i5r0I8rGu+/1RzJRTbV3t61VQWKRW+d5SXNx7Nw5bm1uvmj8OC42xw/hZEhYGmPqb
         VMVREehd5jrv9hQzlfpoER2pH/Va5toamtZuf8cRtXO8R10n5cp4EUxvxm/m6GqyLgWz
         VEIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrhl1zk6/9IdH5gnUWoUwTYV0njZ//YlM/dWcO3WTvjXFkemAQ5zng4amp1QNcGzeOg434NzVtHS36qqVGltJLs@lists.infradead.org
X-Gm-Message-State: AFuF++m6BPC696PeBr+CRGVysfNxBby9hAUulNvwf74NweYxh6T1avK/
	arwd2/AvhhREAeZXvFOg4/wa7A5cGSccpFGTfHjylD1rCgaL4jWYgEhDZkHLS9Wwi1BLTk0KRs2
	seos0jIIPoJljtS4zESolNE6vzcY9ixFY1WVAetkDow==
X-Gm-Gg: AR+sD11z0tIU73gmrVJAROSJ7H4nJ481MuRaAUee6rIyBE5vVPmxi66Td5RVbR1TEv2
	scNaOVQx40bSax6r3jHUjsLTFC2fLw3HL8KCGFVTP4xBXqJVylprR12LOif12kABrLDq+bf1XRA
	ZdoHiTSucKoVeyUvj238HvGe4oNpn1xVKsbQOLAkicHbjrPI33Zrh8LKmgCsA8GhUxL+bLTIRop
	WN/ZhzkTilFuaJ93LIFtEQPtlMGczxV8ea+b3khCzbKzjJPj9Z49nsP1khyIJvmof/gjQ7zOSOT
	K5fGcczM+K3bBnpDsnqpLjTxNBvEHVxvZ9YWU8YtSEB/mFszA/VqqTjAHFSpRmCsdkfkTnL77YY
	=
X-Received: by 2002:a05:690e:148a:b0:667:b314:aeb3 with SMTP id
 956f58d0204a3-66ccb6c0b96mr4398594d50.29.1787216726580; Thu, 20 Aug 2026
 02:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
 <20260715062201.3599458-16-dario.binacchi@amarulasolutions.com> <3db80a7a-e09d-40eb-b8ab-4110a5ac1f09@foss.st.com>
In-Reply-To: <3db80a7a-e09d-40eb-b8ab-4110a5ac1f09@foss.st.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 20 Aug 2026 11:05:15 +0200
X-Gm-Features: AcwNN1UE6rpOTskPjzBaU3Z5xzziH-_K90B70QxjqV9m7M7C2xCsP3OCPL3sjkU
Message-ID: <CABGWkvoX5RYN5r4DbhZ1BUXjmwp-_08HBWKMGkX6cPNcQsyakQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v7 15/16] arm64: dts: st: support Engicam
 MicroGEA-STM32MP257-RMM board
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com, 
	francesco.utel@engicam.com, domenico.acri@engicam.com, 
	linux-amarula@amarulasolutions.com, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_020528_871860_D98E2371 
X-CRM114-Status: GOOD (  17.36  )
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

Hi Alexandre,

On Mon, Aug 10, 2026 at 10:15=E2=80=AFAM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
>
> Hi Dario
>
> On 7/15/26 08:20, Dario Binacchi wrote:
> > Support for Engicam MicroGEA-STM32MP257-RMM board with:
> >
> >   - 8 GB eMMC Flash
> >   - 2 GB LPDDR4 DRAM
> >   - CAN
> >   - LEDs
> >   - LCD panel with touchscreen
> >   - Micro SD card connector
> >   - Audio codec
> >   - Buzzer
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> > ---
> >
> > (no changes since v5)
> >
> > Changes in v5:
> > - Fix touchscreen resolution to 480x854
> > - Fix SPI1 CS0 polarity to GPIO_ACTIVE_LOW
> >
> > Changes in v2:
> > - Drop the clocks property from the sai1 node in stm32mp257-engicam-mic=
rogea-rmm.dts
> >    to avoid overriding the peripheral bus clock reference defined in th=
e base
> >    SoC device tree. Suggested by Sashiko.
> > - Reference the existing labeled nodes directly at the root level using
> >    &sai1a and &sai1b in stm32mp257-engicam-microgea-rmm.dts instead of
> >    redefining the entire node structure and redeclaring the labels. Sug=
gested by Sashiko.
> > - Drop the #clock-cells property from sai1a and remove the reference to=
 sai1a from
> >    the clocks array in sai1b, relying strictly on the st,sync property =
to handle
> >    internal synchronization.
> >
> >   arch/arm64/boot/dts/st/Makefile               |   1 +
> >   .../st/stm32mp257-engicam-microgea-rmm.dts    | 319 +++++++++++++++++=
+
>
> Series is ok, I just have a question regarding board name. Why you don't =
add the "d" soc information inside the board name as it is done for others =
STM32 boards ?

You are right. I'll send v8 shortly with the "d" in the board name.

Thanks and regards,
Dario



--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com

