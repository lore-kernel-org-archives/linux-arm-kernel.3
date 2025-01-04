Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321C0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 12:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hAfNelAexbY+CFB6MXvVBZBPJB4LR8vgcGQXD+h9DFA=; b=tuYvBc/+71w26e
	IwT73Q1Uc3TwCyrZHX2D/Yf/KG/OxbDVE7HcrtX9YVAha/9CuUz4iOZRuXD/FNqFr8Bxop9hwedCM
	UUjXNCVmUa+/BGO+e4I/bKqPH/+Y9Txv4RIrY7AkwSeUII9xA97uz1ji7I+ItAb3MzaUuUuKMMfiB
	PNE2q1MuGVZzEDqxmmmbqDSUjJdL9Z4shUGguv9nuHZHqqtIRokSs5Oc8j5qfheJPZ7b349v8vuhd
	IE8OUy895hWYzZfV0tRY9ZNfkMrjjAvpAxGJBeOsmdflw+P6cnT0ny8nwB6tLuzUF20U4uFsJ6/Qo
	1e9gEdA10XTubeB9qYFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU33v-0000000ExcS-1qGk;
	Sat, 04 Jan 2025 12:15:27 +0000
Received: from mail-lj1-f170.google.com ([209.85.208.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU32j-0000000ExQO-3jN8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 12:14:15 +0000
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3002c324e7eso149756191fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 04:14:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735992849; x=1736597649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hAfNelAexbY+CFB6MXvVBZBPJB4LR8vgcGQXD+h9DFA=;
        b=KRMzjrDoupV1LqMmvuHrtfEvHzoCOKDk50Y1eQkIKv6Azhv+5npcVy6Gkv2onZSxMe
         THCKmnNeZ1Yi93vIXVGtovxQfV2aDDNYbmhxer+FCWz1ZeHZ/TGifq361PUVZjpth04q
         9JASTnMmhI/iW9HcFA7HMrgLpVzfMuSwUQTDdYX1a+Swo/N2Rp+RlWJuPZ4ZyJvy1jcy
         azMHhchUnDG78yxYnt0GkyHbeA3XTrwtU35X2P2oVrlgBM5gcte8wftS+y3RQHI5skNO
         Lh8PmFnZrjdgyVfdRJkHg3WLTcIDmJk0mZoPC/SFNlbwei6MgCKvPscYT6nfsp2Y0Wi1
         oPrg==
X-Forwarded-Encrypted: i=1; AJvYcCW0UBmFwL5KhYHYuYi6Py11ixNTL23XOWKuIhlrVFTePctoZSk7cUgq48R6ovioKxyzKTO81Aae5ag/xZ+6QeL8@lists.infradead.org
X-Gm-Message-State: AOJu0YwEoDSyQcZ1aImHJDJXDCIgOKhDwxJaICVO8umDYKAbaEWQnqcL
	dmcFQw9tSqzBmSyRBqfcR/ldCtAhMBAp0WyYPaYLeJTiqnZ8hdz9kJcs1da2
X-Gm-Gg: ASbGncvFd4MT3XJYrnQkNKmr8yddnKQ2VJGq5j3X9Aeht9Y6PeQUYL8wB1oKFmPU22Q
	UxC69C+UIdgQMhsZDRN3ZWhf1ULdC1ob30p8mdNjFE2cEksK3sgykVmFNRfYrlnyp/fJEfWDRwr
	uuLSjAeg6dEi+4kxyc1PSbfh0XbQzW9e7SqTxEYohjPwqKgBZH37ous0tTKUKHhkoqeZI4PavgU
	gCP1KifvLELCfqbbAXZ8nmIaRQi/IGAA66OjXBEWAvJQlMrPFQqpa0miAqX4IS19ZkD90Q65rEe
	xEa5OA0kojoHZA==
X-Google-Smtp-Source: AGHT+IHuD7nz3NBldD4ERsfgSIt4v8rmyXrEb5BZmrqq9iJG0/+xmSb7vgTuSXJVwBDYWiNnnTq42A==
X-Received: by 2002:a2e:a695:0:b0:300:1c9a:80ce with SMTP id 38308e7fff4ca-3046861f158mr161691541fa.33.1735992848804;
        Sat, 04 Jan 2025 04:14:08 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c586sm48988411fa.11.2025.01.04.04.14.07
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jan 2025 04:14:07 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3011c7b39c7so154548431fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 04:14:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXct6+f2yTs+v5+63bfNZg+Icjfgywx5u01dMxPtbfSlGW9aMJwiq3JRa9+YNVakJpQ/tjru9RXAiRi+FZWRSv8@lists.infradead.org
X-Received: by 2002:a05:651c:1547:b0:302:1c90:58e5 with SMTP id
 38308e7fff4ca-3046841d378mr162276581fa.0.1735992847046; Sat, 04 Jan 2025
 04:14:07 -0800 (PST)
MIME-Version: 1.0
References: <20250104074035.1611136-1-anarsoul@gmail.com> <20250104074035.1611136-2-anarsoul@gmail.com>
 <CAGb2v66W9q-uQkepYgrD9QKnOwmpUdDakRoKjmsT_4=Adyj09Q@mail.gmail.com>
 <ca0cad16-7c39-4635-8f09-f9f3c95c9fef@kernel.org> <20250104120256.65511a28@minigeek.lan>
In-Reply-To: <20250104120256.65511a28@minigeek.lan>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 4 Jan 2025 20:13:54 +0800
X-Gmail-Original-Message-ID: <CAGb2v66h1k9Wm5Xr1NMYsOgV--2oaHrTfyVFmUisdKmsG1HBCw@mail.gmail.com>
Message-ID: <CAGb2v66h1k9Wm5Xr1NMYsOgV--2oaHrTfyVFmUisdKmsG1HBCw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
To: Andre Przywara <andre.przywara@arm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Roman Beranek <me@crly.cz>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Dragan Simic <dsimic@manjaro.org>, Frank Oltmanns <frank@oltmanns.dev>, 
	Stuart Gathman <stuart@gathman.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_041413_931420_1BB0920C 
X-CRM114-Status: GOOD (  26.09  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Jan 4, 2025 at 8:04=E2=80=AFPM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> On Sat, 4 Jan 2025 11:33:23 +0100
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> > On 04/01/2025 11:23, Chen-Yu Tsai wrote:
> > > On Sat, Jan 4, 2025 at 3:40=E2=80=AFPM Vasily Khoruzhick <anarsoul@gm=
ail.com> wrote:
> > >>
> > >> Export PLL_VIDEO_2X and PLL_MIPI, these will be used to explicitly
> > >> select TCON0 clock parent in dts
> > >>
> > >> Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in T=
CON0 mux")
> > >> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> > >> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> > >> Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on PinePhone
> > >> Tested-by: Stuart Gathman <stuart@gathman.org> # on OG Pinebook
> > >> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> > >> ---
> > >>  include/dt-bindings/clock/sun50i-a64-ccu.h | 2 ++
> > >>  1 file changed, 2 insertions(+)
> > >>
> > >> diff --git a/include/dt-bindings/clock/sun50i-a64-ccu.h b/include/dt=
-bindings/clock/sun50i-a64-ccu.h
> > >> index 175892189e9d..4f220ea7a23c 100644
> > >> --- a/include/dt-bindings/clock/sun50i-a64-ccu.h
> > >> +++ b/include/dt-bindings/clock/sun50i-a64-ccu.h
> > >> @@ -44,7 +44,9 @@
> > >>  #define _DT_BINDINGS_CLK_SUN50I_A64_H_
> > >>
> > >>  #define CLK_PLL_VIDEO0         7
> > >> +#define CLK_PLL_VIDEO0_2X      8
> > >>  #define CLK_PLL_PERIPH0                11
> > >> +#define CLK_PLL_MIPI           17
> > >
> > > You can't really split code movement into two patches.
> > >
> > > With this patch applied the clk driver will fail to build because
> > > the macros are now redefined in both header files.
> >
> > Are you sure? The values seem the same to me... I don't see how this
> > could fail.
>
> Yes, IIRC the C standard allows repeated definitions with the same
> value. And I definitely tested this before (and hence recommended this
> approach to Vasily) and it compiled without any warnings here.

Hmm. Didn't know that. Good to know, and I just tried it on my end.

Thanks
ChenYu

> Cheers,
> Andre
>
> >
> > >
> > > Barring recombining the patches, please add a patch before this
> > > adding #ifndef's around the two macros that are moved.
> > >
> >
> > No, not necessary, just churn,
> >
> >
> > Best regards,
> > Krzysztof
> >
>

