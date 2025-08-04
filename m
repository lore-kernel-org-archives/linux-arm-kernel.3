Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21953C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 13:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXG9AGrFinYmMiROAAb115udLcWZgKrApUBxNgWLPeU=; b=lMD53o+rDbujAa+jUO/HsZAylT
	64PGqETUXIiQVwjzER7tpOIynJTKDY8OxjPhdtsa48S1l+O2BPSoe3PSzIQO75bHL3cSKDsYo8pSI
	tRfcFgnGN5p5h+q6/3XzmKGGk7fqQ/yH5mhxyWEjH791n8oyadm2CGFO6Sa3ffCuXbyMY5DWK/97t
	AVw5gw/cC1/FOpxLMBGYfH/3Qwwr8RTTWoBhdwMdIbJEEvJD8aez7Kpz35+gluuIFtYn3Ex82VTyz
	kv0eHVeadtyN7Ww2AvvvktUbJN6O6oJ8x4t+XyDwzhQfZjBhMMgHGkI9fcliOxduWUx7hmRjAsSf7
	7Ej195ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivEL-0000000AX99-3Yk6;
	Mon, 04 Aug 2025 13:27:57 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiutR-0000000ATsP-1Dep
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 13:06:22 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-af910372ab3so850047366b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 06:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754312779; x=1754917579; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXG9AGrFinYmMiROAAb115udLcWZgKrApUBxNgWLPeU=;
        b=nFzasmKZKhnF4l1Z+T1Lpu/cLDCLEZAArrs/HM6qRMFAehohYZiCMsd7DnIFiEQUTz
         yUGjBwOHkuEx1QEaYmexD2+7O0/koj76gT57xo+w/2LcAiti8EVu6k+RenUf3BVErenk
         WxABKGgxpUIeQKeQf4/+ff8CEbbQwROF5hdiyabcjz+g/g/lh/zqno9RZeoeFFb83P3k
         kYVgIO35pko1vOFWdEzPPHZQdJUR7SZHkpLHS1YGcqBUCttoXm5ReulKq6LsGVkWRO0o
         cJ/sWdsxrAsTNipIBr4vt/VmpcyljA7i6DpdWvMonZCwWVFfWiFO62/A6wVY3CHsLt2e
         uovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754312779; x=1754917579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXG9AGrFinYmMiROAAb115udLcWZgKrApUBxNgWLPeU=;
        b=fBx9PvGtR6SGRYCNXFTRB+3gDmG2heOEv6tiBmGYDa8tx6byqrNpa9Wn5L0zjpRcaE
         IjkkdYmf3MKKVtrO1YSHes3KAhmaSCgCjui4CWcVNz+SYjHa33HApSBl7YZoZUasW+Ze
         XsnfLEEQONXHP2IRQ2hx9P6qhI0/f3BHbfFSy1RiHhfvncu2tmpGI4nEYwA0YpH66wNZ
         OD1k09/TV4f3c/NZMAUrQl7mYoyDXFo8qXNNDNGUvyTL4UODJJ/fqm6T/2whmVHeWY0y
         nJnO5Mop6gOKDpqmsrfpRQ3J1B32lsLXNYOkRnsFtfvB+xOehBdufDHwPmFQMdtUq3em
         p/0g==
X-Forwarded-Encrypted: i=1; AJvYcCVd7W+MeJ5DiqUN3C44k3U+FIkmvevHvLvAMsUiouTW6oUVtwRb9rk4TIAGA4uNFcnoUjdDoK5pFDAw8YC9yZaE@lists.infradead.org
X-Gm-Message-State: AOJu0YyzS1+LtVUO3SWZKc6r2jhCvvZQ/zZXq6rl6RVJedJicL7rYxt4
	vY9R8kaxC11DpnlVe7hmK38hOZXt7sN6TRJYT/O4e5W0jPCH1rDtzS8DtUIpzOlWE9r9YeoMzTx
	CKc4ZeldtFZstjLLy/uLPkfr9R86wO8k=
X-Gm-Gg: ASbGnctB+iJJ9RmC7Vl2NWKTopOxcrW1X+7XG1VGkJrLGN0NDsRrz1z3rMYyfmsBbUm
	3yNrzQhueTEHPP5z8VbnVUhR34LfF7p3Ss1UaQ+jdSoWBM4b+UcY6MjUiGxWkuxTMkN0JMxB2kv
	8AapnpdB6wJQWcN2c/WkWjC5OnESRQUvQwKz0RGqi4L4eOtL2MGoYcyu3T63F3VA1SK1sSoOenB
	7d5rOWmGA==
X-Google-Smtp-Source: AGHT+IHaNA7ufYU5FGCTtMM+oPSCdoPGzfWaTkq5/1dcIXFW8X4peIybcOF0xM7Krq4hTjQcrGB4SCyrnLvydlfHGoI=
X-Received: by 2002:a17:907:1b25:b0:ae7:73b6:19a5 with SMTP id
 a640c23a62f3a-af91bc5f255mr1632375366b.10.1754312778465; Mon, 04 Aug 2025
 06:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250804100219.63325-1-varshini.rajendran@microchip.com> <20250804100219.63325-3-varshini.rajendran@microchip.com>
In-Reply-To: <20250804100219.63325-3-varshini.rajendran@microchip.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Aug 2025 15:05:42 +0200
X-Gm-Features: Ac12FXwsws8uL2WACME0UJrimsaN3CYrhO21JJ9_MU4uMd-Fpc3BM8qrxFMwToo
Message-ID: <CAHp75VffH+tpqP3J+x-ybiwe2O6Mqm6PkaxTrVBgByMpS4Q26w@mail.gmail.com>
Subject: Re: [PATCH 02/15] nvmem: microchip-otpc: rework to access packets
 based on tag
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: eugen.hristev@linaro.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, srini@kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_060621_328216_56FE16BB 
X-CRM114-Status: GOOD (  24.55  )
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

On Mon, Aug 4, 2025 at 12:03=E2=80=AFPM Varshini Rajendran
<varshini.rajendran@microchip.com> wrote:
>
> Rework the driver to change the packet access technique based on the TAG
> instead of the currently in use "id".
>
> Since there is no way of knowing the OTP memory mapping in advance or the
> changes it can go through with time, the id based approach is not reliabl=
e.
> Accessing the packets based on the associated tags is a fail-proof
> approach. This method is aided by adding a table of contents to store the
> payload information which makes it easier to traverse through the OTP
> memory and read the data of the intended packet. The stride of the nvmem
> device is adjusted to 1 to support the TAG being treated as an offset.
> The only reliable way to recognize a packet without being aware of the
> flashed contents of the OTP memory is the TAG of the packet.

...

> +struct mchp_otpc_payload_info {
> +       u32 id;
> +       u32 packet_offset;
> +       u32 payload_length;
> +       u32 packet_type;
> +       u32 packet_tag;

Just wondering if these are okay to be in CPU endianess, i.o.w. is
this part of the protocol to HW, or is it simply Linux driver holding
values?

> +};

...

> +/**
> + * mchp_otpc_read() - Read the OTP packets and fill the buffer based on =
the TAG
> + *                   of the packet treated as the offset.
> + * @priv: Pointer to device structure.
> + * @off: offset of the OTP packet to be read. In this case, the TAG of t=
he
> + *      corresponding packet.
> + * @val: Pointer to data buffer
> + * @bytes: length of the buffer
> + *
> + * A value of zero will be returned on success, a negative errno will be
> + * returned in error cases.

kernel-doc validator is not happy: Missing Return section.

>   */

...

> -       packet =3D mchp_otpc_id_to_packet(otpc, off / 4);
> +

Seems like a stray change (adding a blank line).

> +       packet =3D mchp_otpc_tag_to_packet(otpc, off);
>         if (!packet)
>                 return -EINVAL;

...

> +       writel_relaxed(0UL, otpc->base + MCHP_OTPC_AR);

Does UL give any value  / make any sense here?

...

> +       if (size =3D=3D 0) {
> +               dev_err(otpc->dev, "Cannot access OTP memory !\n");
> +               if (!emul_enable)
> +                       dev_err(otpc->dev, "Boot packet not configured & =
Emulation mode not enabled !\n");

Stray space before the exclamation mark in both messages.

> +       }

--=20
With Best Regards,
Andy Shevchenko

