Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A015D42B85
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 14:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/b6whg1Fuu9dsUqH1kstDqi5ac2SXC82I/0cqQa6CQ=; b=TCahfI/5vMOQdILKqrsCYejyyV
	Eui6oXXZDJjgxfHy+CuDeP5HcrttuAjQE4Lx5p09vuC7RPT7iGu2oTdTqxgDn4lIxIOua8Q2nehQd
	IkM/9r84Tgs1ayTccFxBNWYy7Tgb1088VVBLqCvOepe+/OsL0U+m/t6ZgUQdLgx5X6DXCP0FVT/+T
	22G5J0alT+u8Czujv5wiRetM8AKy0XiF/QXueZfb50BW44J5Y36452t3bytjY0cugPzvGswMV2sV6
	EO3vNa+U/zpl+mhX9Qnc7vuOFND9oFQSMp7aPcJVReuDq9CpA4SN0jle0jvXZWzTmdcd4mnJFr/Dc
	FczVkNEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAs5B-00000003nGb-1HWz;
	Tue, 12 Nov 2024 14:41:29 +0000
Received: from mail-pf1-f180.google.com ([209.85.210.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tArzu-00000003m6X-1hBP;
	Tue, 12 Nov 2024 14:36:03 +0000
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e953f4e7cso4379991b3a.3;
        Tue, 12 Nov 2024 06:36:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731422161; x=1732026961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/b6whg1Fuu9dsUqH1kstDqi5ac2SXC82I/0cqQa6CQ=;
        b=HLpTGKt9fVoto+9whvljYwn5ezasAVH7RMivMKkQOd/W1qqvz6KWbb30t3/IE5eNBe
         Bc9od440gQQ3/v5soQRrOkudX5bLVsLxkNmbexTzGwQlJ29TSySm3W3GphaZ2qD/9O39
         I6K3pBkFSwe2CYAplo8TeDM4DLWufDp5IAkWPjKpb1hk0cdG1DEzxaruwhPVhrT78wcP
         4Y3W49UDZ/f0pn6xRk5D6U6EG0s7D/XtB81Trb6QvzMkwPqa8pBsXOW6xcHB+RZs80d+
         Qgewrhvt6EtsTKU8TAt5q5AtrU+Wz4dtJ3xWTeDKPtJAogWaWXu7dJ9AQGLTSxRcBwIg
         Sqqw==
X-Forwarded-Encrypted: i=1; AJvYcCVtO02GHo9MFaGvlUI8j6boamuAT85yH4R/L5MUXrM5HNA8mDrgPLFTIqXztX6xSR7r3Ngit37X6/bXlltD+MAY@lists.infradead.org, AJvYcCW0/g2OQA1UCoeD2vvhWHlavrmZkD2GKWQM01lCGmGWIc6k3yu1vXq0vDFXI8Onv6QukRiBTq8vwZxGqazFf28=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb6KecJbD71q2w9awlIk3bxln4H572zs9cdMfuzFa/Wssz2tco
	UFUX/clPmrdx5rrXoETMec4h2aYHlho5QvSo6brj6c7rNZckeRIl67DybVoC8XtjEw==
X-Google-Smtp-Source: AGHT+IFk3Es/5pU7djjsXy8BnvP/1IJe9Bt7hIiMgVVA052I2EzvhuJJx6hY/VTv9eXnyI7SevO6Lg==
X-Received: by 2002:a05:6a21:880a:b0:1db:e8dc:4ae1 with SMTP id adf61e73a8af0-1dc2292f715mr17110712637.17.1731422161360;
        Tue, 12 Nov 2024 06:36:01 -0800 (PST)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com. [209.85.216.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7240786281asm11234305b3a.12.2024.11.12.06.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 06:36:00 -0800 (PST)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e2c6bc4840so4554378a91.2;
        Tue, 12 Nov 2024 06:36:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXiOzXQAIhThbYfWaB+4HndezZ9lwA+TrLoroJyO0JxW8Ifbhub6N+iTHqe/j+tzKsvu2Vbvr1AEJOMsLRKl0I=@lists.infradead.org, AJvYcCXpUlXMgejV4NvnQIT+SV2z4xVC338z62Vc2f324+M4WIt2EuMHmCQWLz3SgBuDk5WUngA+cWs91XW0dfJzTQZI@lists.infradead.org
X-Received: by 2002:a17:90b:4b84:b0:2cf:c9ab:e747 with SMTP id
 98e67ed59e1d1-2e9b16e26b2mr24419741a91.1.1731422160606; Tue, 12 Nov 2024
 06:36:00 -0800 (PST)
MIME-Version: 1.0
References: <20241111181807.13211-1-tszucs@linux.com> <20241111181807.13211-4-tszucs@linux.com>
 <4ba81dfa-f276-4e05-b46b-92f50dbcfcc4@kwiboo.se>
In-Reply-To: <4ba81dfa-f276-4e05-b46b-92f50dbcfcc4@kwiboo.se>
From: =?UTF-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@linux.com>
Date: Tue, 12 Nov 2024 15:35:49 +0100
X-Gmail-Original-Message-ID: <CA+GksrJLpeU8x-kjR1Ng3ySf+giiufCsJuBssng9qoX1PjAunA@mail.gmail.com>
Message-ID: <CA+GksrJLpeU8x-kjR1Ng3ySf+giiufCsJuBssng9qoX1PjAunA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Enable UART8 on rock-3b
To: Jonas Karlman <jonas@kwiboo.se>
Cc: =?UTF-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, Dragan Simic <dsimic@manjaro.org>, 
	Chukun Pan <amadeus@jmu.edu.cn>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_063602_517054_F59A2303 
X-CRM114-Status: GOOD (  20.75  )
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

Hi Jonas,

I agree; it's not possible to tell if the user will use a PCIe/USB,
PCIe/UART, SDIO/UART, perhaps USB/UART device, or any other HIF
combination. The way I see it is UART8 is hardwired to the M2E, so
there is a reasonable expectation that it should work too if need be.

Kind regards,
Tamas



Tam=C3=A1s Sz=C5=B1cs
tszucs@linux.com

On Mon, Nov 11, 2024 at 8:12=E2=80=AFPM Jonas Karlman <jonas@kwiboo.se> wro=
te:
>
> Hi Tam=C3=A1s,
>
> On 2024-11-11 19:17, Tam=C3=A1s Sz=C5=B1cs wrote:
> > Enable UART lines on Radxa ROCK 3 Model B M.2 Key E.
> >
> > Signed-off-by: Tam=C3=A1s Sz=C5=B1cs <tszucs@linux.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm=
64/boot/dts/rockchip/rk3568-rock-3b.dts
> > index b7527ba418f7..61d4ba2d312a 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> > @@ -732,7 +732,7 @@ &uart8 {
> >       pinctrl-names =3D "default";
> >       pinctrl-0 =3D <&uart8m0_xfer &uart8m0_ctsn &uart8m0_rtsn>;
> >       uart-has-rtscts;
> > -     status =3D "disabled";
> > +     status =3D "okay";
>
> This should probably be enabled using an dt-overlay, there is no UART
> device embedded on the board and the reason I left it disabled in
> original board DT submission.
>
> On second thought maybe they should be enabled, think PCIe and USB lines
> on the M.2 Key E is already enabled by default. I probably only tested
> with a pcie/usb wifi/bt card and not a sido/uart wifi/bt card.
>
> Regards,
> Jonas
>
> >  };
> >
> >  &usb_host0_ehci {
>

