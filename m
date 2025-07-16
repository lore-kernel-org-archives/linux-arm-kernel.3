Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F065C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 07:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2mQSIMibFZ/TMYlkn3NP86VdyjZyUtByzAEI5AQ5uT8=; b=zgI6qrOMJWuqsvQnj3R+2vL/i2
	cSxoXCGzMY8j9abStTl+xHDoA/Bn/P806f9v+bYHQyuC9FxlD4QHhQ3pV1wf27Ne62N9qwEUgGu8Z
	TEqxQrQg8Ob8IpHXTKF43Mr3/aGHhAD/UfeU9MXkMYe3J96TJLtUA/C6bejYuauWCXCg2Kao48xE8
	Z8W2p6UJMhEyKoqhnu1mKYAVpZC2rHiZ6I1oQBGJaHRJDYfrVs7GPUK8BIfohCHUne1BiJa5JZa+s
	yebuJ6f59b/kaTTs1eF+wwjYdITe0mkrq682zb4r2oJjMpE6pRbvEh7pfUWeCY5GcVExmKyNggGrh
	6TMciCfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubx3B-000000076FO-3Daj;
	Wed, 16 Jul 2025 07:59:37 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwxU-000000074v7-3xHW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 07:53:45 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so7380780a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 00:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752652424; x=1753257224; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mQSIMibFZ/TMYlkn3NP86VdyjZyUtByzAEI5AQ5uT8=;
        b=DBzQ66QmOEwcdETl9M4tICdnogwbWeVEsBA6NQTqrYIWAuBTaFD9/agYTCUwwE3KIt
         kra34BXT/18LVAKGBJgyuX9ebM2gf1bDvMUFFz6RuQf4szH7/u6A9+p29BlDxLOzW3hc
         6prDHZsfo4VyEcsEemlkd7ckqk3OXHyHqOY3up7MeuZh/wtIBJuRDvuPIy53A5+hlR/A
         34YwBJY/ZQXKEXW5DFQR8ntaxiSsgDu/BTEn9JGl9c9SUteFrBrPjcB6+JD51OuAW+0a
         cBbuBJ0HKq/eP7mvWmgJQFdI6gfEL8OU2qPS0dOPj79IEizlP+Edht+wcrvbKyK+tAyP
         8Ruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752652424; x=1753257224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mQSIMibFZ/TMYlkn3NP86VdyjZyUtByzAEI5AQ5uT8=;
        b=h9olSf+N/y0lgwQH3IucHTCmxNX20LrIhS/XDjPkNzaPEISVd023PNRz2GAOGDS6/Z
         5xQV53Ipz5ipTw0xl5KzIkLuPCSZoNyQ4BeLg++fFKRxE0rGMyMk+ZfX7hEyB0CmGCHA
         NJD9qARWkd4Iq1yV7Z69MVdh8WmgeeTS1njkG+E5Llnt1gEWedBJxXDYLox3ESHoUhmJ
         5nXEWTK+AwxxCVJTKVcyQ8CmM3wgfJ6HD88YcFb47Gx9eAEzmZOKgl95xg1X7ymtLPyt
         Sal9iJ1mwjPb6nvKl9nYFCIP7B3+rSuP1iMPQZXodAw8tjTbsLOdhESclYBKcfpndJ8o
         pb5w==
X-Forwarded-Encrypted: i=1; AJvYcCWw6zRI2GeaG/izRBzE/FPGiqxFMY51JcVHrBcSNTdfoFiuckSuaK5CspFJzsNhi3LwwCGrUE5qcvlU1LVVPdIo@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr/Guov5WCeezgVtKpCvJFqprsFHGYlylqfi29vLR5gPFJRWpA
	QW24YRBm5nPNWLmS7FbOhbTHQR27BygU9Q7aN+rEGcQz/ACyVtkNtMwaUFK2WByScTuFNtJl3ZS
	nNBUpkbhRue/Z3XsfhDX07lYSQbj8mww=
X-Gm-Gg: ASbGnctUMrPsj5Kyl7SrrGEGA+VOQ5AVgfoCkpUXS+gF9CmbZgcNiq3Bhd+Vg69LzrX
	vFko4/TNrqN3PaSr49R+0oW836SqFHUVqQd0oHQu1/6Ql8EMHeF5hJMzRdQrAZYej/TxAI+7l45
	SRRnNVInPnBdqOi39AhnD4Avm8tB9iyxPCFuL1OUU9hzcUdDWsSwZDD02n5JRbu+EQdfVpSkIGq
	R2K
X-Google-Smtp-Source: AGHT+IEXwgMmdV6xEntZIOiDCK4p/KU6t+w3ykBD7q7iq7lKJ8kq6kVxuuaWbxPblQ1N02rsyHmz1iURll1P3lWiuoI=
X-Received: by 2002:a17:90b:1fc3:b0:311:e5b2:356b with SMTP id
 98e67ed59e1d1-31c9f3fbc0emr2790269a91.11.1752652423706; Wed, 16 Jul 2025
 00:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250716061114.2405272-1-shengjiu.wang@nxp.com>
In-Reply-To: <20250716061114.2405272-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 16 Jul 2025 10:55:49 +0300
X-Gm-Features: Ac12FXz2s0GqTrCwZD5uR0yMTDXd0dpIYCyNX1v8FM1fPc4DXQYF5RSC8ANNnPs
Message-ID: <CAEnQRZC=qApo9C0zBDQoxpV56atLeXpoxZdyBuQ=o2y59YJEqA@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: imx8m: support more sample rates
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shengjiu.wang@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_005344_978702_68D46F7B 
X-CRM114-Status: GOOD (  10.91  )
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

On Wed, Jul 16, 2025 at 9:11=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> The wm8524 codec is connected to the SAI interface. There are two audio
> plls on i.MX8MQ, i.MX8MM, i.MX8MN, one pll can be the clock source of
> 44kHz series rates, another pll can be clock source of 48kHz series rates=
.
>
> Shengjiu Wang (3):
>   arm64: dts: imx8mm-evk: support more sample rates for wm8524 card
>   arm64: dts: imx8mq-evk: support more sample rates for wm8524 card
>   arm64: dts: imx8mn-evk: support more sample rates for wm8524 card

Hi Shengjiu,

I think it would be useful to specify which are the current supported rates
and which will be the ones supported after your patch  (in the commit messa=
ges).

On NXP BSP you can run:

../../unit_tests/Audio/mxc_alsa_hw_params.out hw:X,Y p r

to get the rates.

