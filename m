Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB87C44525
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 12:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxOrB8wfEeC2m9GMBQa+QZHxO/B1NDwQHQf6JSIEBVs=; b=rrODw0PGwbGnEDiHvYKR97hH0s
	Ny6Cqvtgyow1uxOw7AgGTptjMFG4kBYJ4MEJ0h4TPU7JniDuGVKvIfHVM8Bxc5Wy1zXzn1N2GCXqc
	9EOa+l6ysr4J3TcI5ibH/HsNCGvciGbu+fwxm9TL4gpsCYcle7XCUYixu5B+HTSqEzoczwyMbcPKc
	7owfDOjXdO7nDus9iuCp1XokXC7TF2S/E3vbb/r21SVuP8uFAQk3yLBTKze8+NUHr3hVzCCB+q0el
	usPdnfP1LUZ/NVsltcrUdncOZtc2BhP5ZJnidSMGSE4cvbcstEjrOPt2vpZiEtgCCjhjqC6HTmPlL
	Xf0BM7Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viXZd-00000005Rxl-08go;
	Wed, 21 Jan 2026 12:44:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viXZb-00000005RxT-06hy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 12:44:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C8F6B4431C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 12:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E2DC19421
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 12:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768999473;
	bh=jxOrB8wfEeC2m9GMBQa+QZHxO/B1NDwQHQf6JSIEBVs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tSkBcFaBbZKibs5kVPOyBS2H8PmTauBESCSL+Uwgla7l1IPLG7ugTJqOT/c7/WJED
	 z2PgR6Cqiho3fzbKqjLPG1QL7BK6p+Em96KUWf6DOiI+5VC+oQZNvgo9ScF/NeYq0W
	 nmQPcl97qd3txxyvjCF1Oua5hmkG+gruuC2O20O4qrxV5vncGLiCz4IRK0hgyuetg5
	 OSPC1T1fxTDD9PtM5sVB2uXqjQ5k8EocivxTTjqh1fCSj0veoZmjnKP+ieppSU/y3u
	 YdnmilYNvb2Z5M+1ZdUUCqK+VWzaIC5vcamTTMZm2OsGLrtbUSdHp4GS0MrSx93bSV
	 GG4dHr5OW5+4g==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-649389b1cc5so2137548d50.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 04:44:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU06nTYJwr/t9asQN5KEzL010GE57EICxhhxnsQGNUXN2+hyBXlqW28mMHLgTiRYJ67ZFNEvecUUohJeJiZgzFF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8l21Wc8i7uX3JKgjUx/J+e2j+35OgvorxDzYd3OTemYvpbb7X
	24c+BjFyFJ94r4OWgxlY6vXPbj31DNAD1yepauZCVcsuzkEqIVv8iY+KtmrsmZ9RxVQn6LUqMkn
	fAUmrKoO6aEYyBrEk4APYepp5nZDEFP0=
X-Received: by 2002:a05:690e:12cc:b0:649:40f7:f20e with SMTP id
 956f58d0204a3-64940f7fb03mr3287094d50.46.1768999472553; Wed, 21 Jan 2026
 04:44:32 -0800 (PST)
MIME-Version: 1.0
References: <20260115114021.111324-1-robert.marko@sartura.hr> <20260115114021.111324-7-robert.marko@sartura.hr>
In-Reply-To: <20260115114021.111324-7-robert.marko@sartura.hr>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 21 Jan 2026 13:44:21 +0100
X-Gmail-Original-Message-ID: <CAD++jLmitNVhWmUf9BBqLR2_WsAR7V-+ykVJsLK3MuOSUKQF0A@mail.gmail.com>
X-Gm-Features: AZwV_Qgthmlr5E7M3bcNO1COpCtqKG_0WAWJfZBTcClME9lzo2DlyQIrR9yT_Bs
Message-ID: <CAD++jLmitNVhWmUf9BBqLR2_WsAR7V-+ykVJsLK3MuOSUKQF0A@mail.gmail.com>
Subject: Re: [PATCH v5 06/11] dt-bindings: pinctrl: pinctrl-microchip-sgpio:
 add LAN969x
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au, davem@davemloft.net, 
	lee@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, olivia@selenic.com, richard.genoud@bootlin.com, 
	radu_nicolae.pirea@upb.ro, gregkh@linuxfoundation.org, 
	richardcochran@gmail.com, horatiu.vultur@microchip.com, 
	Ryan.Wanner@microchip.com, tudor.ambarus@linaro.org, 
	kavyasree.kotagiri@microchip.com, lars.povlsen@microchip.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-serial@vger.kernel.org, luka.perkov@sartura.hr, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_044435_082265_36A00EA0 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
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

Hi Robert,

On Thu, Jan 15, 2026 at 12:41=E2=80=AFPM Robert Marko <robert.marko@sartura=
.hr> wrote:

> Document LAN969x compatibles for SGPIO.
>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Should I just merge this one patch to the pinctrl tree?
Looks good to me.

Yours,
Linus Walleij

