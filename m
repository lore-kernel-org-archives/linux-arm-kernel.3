Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63B4E77171
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 09:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/1+AiVhiUv+sExiwJYXTkMxRtDVn8b9sUGT3Jo3lP4=; b=M/d4YzJfwBU/Ihs+6n0O3H1RBS
	v0sHULcW4uBqdTL20DM/UgVnmQV2ax/WqgOF+8lQqE4sir+hbptBQH4jwhUOz/gH9/u8x3RIZh71V
	RQsw8C12h6skKgBsf0F0DAaaW0SQILJpRdBaHPkpYbj1BFoc+tnZ4y3trj3IVjorLWmG3+ejTjcCb
	9VKahyp3BBc4tvbCyqDcC6XzHD2ZU1xI8EV1Q79in8S3Gkr7FZcD2zUQvcSVuUZTZU9InDeMLNjQo
	dzjiU+g/2K3ZJIytQLkY/g0zUlJBusP4a7diaWxvs0q7qKKOUOLGMPBHNBrp1GDGfYbXBeeFVQwXm
	Flh2WgyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7qx-0000000FIVg-4A7z;
	Thu, 05 Dec 2024 09:08:55 +0000
Received: from mail-ua1-f52.google.com ([209.85.222.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7pw-0000000FIHp-2m5F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 09:07:53 +0000
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-85b95896cefso151423241.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 01:07:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733389670; x=1733994470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/1+AiVhiUv+sExiwJYXTkMxRtDVn8b9sUGT3Jo3lP4=;
        b=DD/Y9NSAcDaqwXmaQtF2qCKsZiDGhy8e0IlQ/MJi2/qSuBX1aw+fz2UijPWq5czWm3
         vz2rkFXn0dthyigie7C0ooQKo3m3Kg3Zxs2rvlG89od5QnBMQbWLGsGDtjldarfLb1N1
         iRjr0HbmOvt578BB50OzAvhWsa7z9vcCalAplvg6WeuFq7Cf89Uuk329//ekqB91+2bW
         a9AgvHbvdAkj3MZSrqTgNUCLU8HkKk6Wd3OdL95KMWWDZuMoN6xvgDUCGqAL6lNCjYUl
         6EtdfjY8rzggi392TjzchzDRiKaLqE1RqiO87eymNBi08etxquvga3WrIbe5zn7Obut0
         dUdg==
X-Forwarded-Encrypted: i=1; AJvYcCVMO1hTXZQsBNMoNWxmxd3kasvKgXJlKv7n4Uf6WlcUCOHARHMrNrpDMK/JUdcXzznsLIfr1lbnUvpiu69UDwMB@lists.infradead.org
X-Gm-Message-State: AOJu0YzGIvgaxgqVLNftE59uRkJX9z8QsrqW67VvS0IaMd9t1rCUUb3J
	z8jV/Rmcbqo1vKlDxDLACsrQSIGuqpSCS3NtHCUD1mZnAsAWVUG77W/Crlsd
X-Gm-Gg: ASbGncsmVk6BWS5vgtdoNrwfAdqTBFVIhdYXeqsyKNmo40ZlOMeAhTgjty84CI4kL/Y
	INU14B4MAkEylLYDooPbM1XKMlABh505e90RhWGUcdeJgW2li80mAeG2d2AeNOSFJyhay1usJ4b
	L2ghI5kVdYxFHQHpKl1l8S8/0SXRdZuLzF45fqtlGsPQ6ExY7GfbRBpowBGeYt4rB36yyIRTM5U
	ivYvokA6C7YS9nwFAue8BqBeQss6PlbR1haTlkUDZMF70UKY8pWYdM7/X5JlS6FCGKL0DdRG03p
	4nJOWBS0ogKu
X-Google-Smtp-Source: AGHT+IFVpALUHz/CbysbJKQev6eGarP7j4CZqr1fafDkXUcHH9BKIW7r92E9/CK+JTG9yilbtgaWAg==
X-Received: by 2002:a05:6102:50a2:b0:4af:abee:74db with SMTP id ada2fe7eead31-4afabee86ffmr5674624137.23.1733389670085;
        Thu, 05 Dec 2024 01:07:50 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c2b964991sm133170241.2.2024.12.05.01.07.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 01:07:49 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4afbaf7612cso171013137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 01:07:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWT2Wxbl5dsFFVhsXCvgNdpJ42ctQ6Xi2a4kIQyFTt0roj5KOCs3OfzHC10ry8eCJakjG1ElHTUgn/vnGnQP4DI@lists.infradead.org
X-Received: by 2002:a05:6102:3707:b0:4af:ae02:d3ba with SMTP id
 ada2fe7eead31-4afae02d7d0mr5814131137.16.1733389669526; Thu, 05 Dec 2024
 01:07:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1733156661.git.geert+renesas@glider.be> <87jzcg1d2f.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87jzcg1d2f.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Dec 2024 10:07:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWF7NcmKYzvF4Dfjh3S5MccbJrpSphK5BhxXNnhxgtmYQ@mail.gmail.com>
Message-ID: <CAMuHMdWF7NcmKYzvF4Dfjh3S5MccbJrpSphK5BhxXNnhxgtmYQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] arm64: renesas: Add R8A779G3 White Hawk Single support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_010752_696957_C6531AE9 
X-CRM114-Status: GOOD (  22.68  )
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

Hi Morimoto-san,

On Wed, Dec 4, 2024 at 1:56=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > This patch series adds support for the Renesas R-Car V4H ES3.0 (R8A779G=
3)
> > SoC on the Renesas White Hawk Single board.  R-Car V4H ES3.0 (R8A779G3)
> > is an updated version of R-Car V4H (R8A779G0).
> >
> > I intend to queue these in renesas-devel for v6.14.
> > Thanks for your comments!
>
> Thank you for the patch-set. For all patches
>
> Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> But small nitpick is that R8A779G2 is not only for ES2.0 but for ES2.x

I didn't add any occurrences of "ES2.0" in this series ;-)

I did consider adding comments to the SoC-specific compatible values
in Documentation/devicetree/bindings/soc/renesas/renesas.yaml

-              - renesas,r8a779g2
-              - renesas,r8a779g3
+              - renesas,r8a779g2 # ES2.x
+              - renesas,r8a779g3 # ES3.0

but decided against doing so, as "ES3.0" would become stale as soon
as Renesas releases "ES3.1". Alternatively, I could use "ES3.x"
immediately.

What do you think?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

