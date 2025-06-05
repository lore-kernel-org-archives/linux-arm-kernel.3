Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B53C5B559
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 07:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xVNbV2XHvQT3/8z4B+RVq7tYXw6lKXe0E7JWahAFCMk=; b=Z1ttu7ZEjjDi3ysY5p1x8ZnywW
	LGyEPvvyNatzygsE7pPaLkJ/m+/wAM50ZItKGnlRyYK40aMJLuqV0LlA23JlrJKJHpAfQiowijs90
	ZGxG+CmZWjRnX+7t3FNnErliqV3XBAb6jAnXH5kPfzryNJryK+aoClSmP/EOSoFVm6rgCF+E+RjTQ
	EIkFSvE228uJtd1WUqvopqmWFONM7RKzYybEqCKgWyqayD6AzbNQtdcwnIoaskyTXRymv5sYFllZo
	nwzXlsCeIGqRPsHLkMbt6nCfZq5JJVapzZJOf5uRUYXqgWWHrtrsx3ktUuUmeW9t9MBPdRA/7o/je
	VL7au2/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5GJ-0000000Ey9o-3EmF;
	Thu, 05 Jun 2025 07:43:43 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN49L-0000000ErJc-2APY;
	Thu, 05 Jun 2025 06:32:33 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-af6a315b491so482891a12.1;
        Wed, 04 Jun 2025 23:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749105146; x=1749709946; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVNbV2XHvQT3/8z4B+RVq7tYXw6lKXe0E7JWahAFCMk=;
        b=EeOxBeMlEsaS2bK06bmrfzed7qNMib+94A89ms7EN9ygQZXedKg/9OjeXqOvGzYpPL
         1OkhMAtUI0Mgqm3nm4FH6q57BhDAKSyrKEqFTaaU8iRfpRRxPwmuaBsJP8M1Gbxy9RXN
         +ZMRIT/Zr31SlyO70kcc3M81WWASmGGYz9Ll/Th31t29Z3459s+T6IiDQqZx1Cj/HY92
         /aVj6Ntxl3XwIcbCaLq4AJ19gpjBkdfWBpvQJjERUxXBaIETlrwXwOf/5dXJYmgNxl8+
         ugvjY+QmIaXi0hNQMhGHs0z9DKlMF7mIZXPQZKgxc4dXbBUuknPyPlrgPv5IgaEQbeVY
         oy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749105146; x=1749709946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVNbV2XHvQT3/8z4B+RVq7tYXw6lKXe0E7JWahAFCMk=;
        b=U8TFYv/n3v7NdHFWj7HzHwM50iQ1THjV2jNd1QTN1AcGejxHCHFbW57CKdvno78Xu5
         bDNqOL0YUfi3wmWn1qGLGf0e96+iJzOFph7JfMAgbF94EUOpSS0DR4ctwGN/dg//2GVx
         cU8nyrNt72neCBlNpibC9ZI8fYJ+hFOdk4ESYmvht8EWHlDG17HyNV/aOVFDyzhrDolx
         upWZR7g9VvTIqi9uLPCUT3EN2mw2PW0kMglah4PrYEqEnrVQAlQ+immCO18fXmvz9Jo/
         gGWTOpw48LO7JhSIGKQGL/19jasFG1DsY5o8kowJ/XTTJx/QZwDALveI7myt6vUwnxmM
         MdSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUs9sGu7JHYSiw2e8JaE8DR0Ke1p71uSfNKTGQAU0Nf7qhaYWcdX/OVwYMANBJ55dZhMtILQGO29Kb6f53y7OI@lists.infradead.org, AJvYcCWuxOda1bero9hT/XBlEINmXA9rs/+t5temmD4job9o2i8vl7DMpOMLgyiAmG+5s8DHkZhDNBG9Rk5Zqb4ipVM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzXrcO1lr9KsrlZTm5TGD41QTNQNiEU1F+w52lvez3sr23ugvGX
	hO0FFykKqmkevxFMoqKYwmKOmBmSE8HJ5zaSRAEQAvOtz6AAekNJcJ2BXfqpZ4KNOXWE9biygZ9
	VJkCYi0RKSIkTSxaLZz+w/sXbJp7oKjNXZjg3zJy/iprM
X-Gm-Gg: ASbGnctltw4pwa9ZHZhsD3naF5cRfZbSfdPmf62Z8NpiCE7WprksvryRawwetg4UJ/B
	To0/5zhAC0abKowp/6+uvtuA+LEDzg2X1cfpcRpAjDAGB/yaT3VRFBV9DMa684EIrd6cVSO4HXx
	SJhzbwGFATgdir+45C7CML43Si0mSEzdrT69y6iwMvufhV318iTINb1AgmJVKeAuT3Xw==
X-Google-Smtp-Source: AGHT+IH4DMJVVSc23A8ySI5zWwdnqMPJwI4JcymO9uLuxpbdW2R54hTNG5gzhmW7FhrMsuuLb3uqrUpjAv6uXp6wyzs=
X-Received: by 2002:a05:622a:578f:b0:4a4:3c3e:5754 with SMTP id
 d75a77b69052e-4a5a587c45emr97845681cf.32.1749105134671; Wed, 04 Jun 2025
 23:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-3-717e8ce4ab77@gmail.com> <CALWfF7JOJSihtfqrFiZtTxnzvoU6FP3WXuWjYOVaAvjPJZWWgg@mail.gmail.com>
In-Reply-To: <CALWfF7JOJSihtfqrFiZtTxnzvoU6FP3WXuWjYOVaAvjPJZWWgg@mail.gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 5 Jun 2025 10:32:06 +0400
X-Gm-Features: AX0GCFuUQCw_ESq8wm50RxhnfDipXmHgsUt5otEO_3lzHNgvENZEo2Fw1AWJjAY
Message-ID: <CABjd4Yyw5xStJYU5c5snUGpBjEYL8=qoj=bWYLnuzSWzr8shaA@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: enable wifi on ArmSoM Sige5
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_233227_558100_15149B4B 
X-CRM114-Status: GOOD (  11.43  )
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

On Thu, Jun 5, 2025 at 6:43=E2=80=AFAM Jimmy Hon <honyuenkwun@gmail.com> wr=
ote:
>
> >
> > +&sdio {
> > +       bus-width =3D <4>;
> > +       cap-sdio-irq;
> > +       disable-wp;
> > +       keep-power-in-suspend;
> > +       mmc-pwrseq =3D <&sdio_pwrseq>;
> > +       no-sd;
> > +       no-mmc;
> > +       non-removable;
> > +       sd-uhs-sdr50;
> > +       sd-uhs-sdr104;
> > +       vmmc-supply =3D <&vcc_3v3_s3>;
> > +       vqmmc-supply =3D <&vcc_1v8_s3>;
> > +       wakeup-source;
> > +       status =3D "okay";
> > +};
>
> When you enable the sdio node on your v1.2 board with the broadcom
> chip (using SYN43752), does the btsdio.ko bind to the device and
> create an extra rfkill bluetooth node?

Good question, I didn't have it enabled in my build:

# CONFIG_BT_HCIBTSDIO is not set

Let me add it and report back.

> If so, you'll want to blacklist the SYN43752 chip in the btsdio.ko.
> Similar to https://github.com/jimmyhon/linux/commit/81c14dc2dea2ceaea8d39=
0188b352d32e278abc8
> The original logic was introduced in
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/drivers/bluetooth/btsdio.c?id=3Db4cdaba274247c9c841c6a682c08fa91fb3aa549

I will check, thank you for the pointers!

Best regards,
Alexey

