Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB87C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 19:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OD4Lo67S9frh/bFzs0ODT/uCFExNx9+MNFdXvKnz0+s=; b=eazC0dzGnjlBpCyp9rM9mIigPB
	21SUye6D5RZfd0X4INv77dNi2VBQVX5OlGbiGgt89kMAYFXi7Ig7zjbofRX+W8caBw2u2AfXH/LTo
	1p/fqbuQQO8OZFkgW6Ovqq5nS5nQ4Ys4dNc557otkJTbZ5TufUrK8DxKyF84Eo6GOn5KN9p1XR4S/
	BA5AtdbhjGb87rwuvrpFfNjg1r26q9w4xbWERgrGHl4t0oN0cXcUqjteqw+OYASPOjTtafKkP1TY3
	0RU+SZg0DMGNoA9MHBd1T1YoD7loqiC61NivubepwAmrR00MpzjpA+wUVTLJWJeuDPzSeQ0/jTmza
	AP/zhzDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qOr-0000000AdiX-1njw;
	Tue, 29 Apr 2025 19:13:49 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qM9-0000000AdP4-0gW8;
	Tue, 29 Apr 2025 19:11:02 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43d0618746bso46413905e9.2;
        Tue, 29 Apr 2025 12:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745953859; x=1746558659; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OD4Lo67S9frh/bFzs0ODT/uCFExNx9+MNFdXvKnz0+s=;
        b=LnXsHXBnhY/AHf0lEjripmy9UtwX2lsN63qWiSrkXNTBgN0qWHIowalemfqUZA2a9w
         Pj1wptQoFzucKL2Z+tIP+Q1xWTTlDFYZK7WLknqk7CYIDLprXjbJiaMQZN8bb53zLJeP
         IABoUvkNyFDlu1BQDI0Bxw90z58IQMPkE42kBzIWJEXLnVu6ARS6Iky0hhVg8EaZ1hxc
         afxsI1oQ7/aR8uAoOiXSXTBYmvA8ikkwy5B4AgGOzzUGTi7B8QmS63Aay6muPOpWsNAc
         axv85ck/Fr13TSRddxte65DTZVEtpeEK6t0xnPTQTOpPH0bnljs5WnPPUXexmWjs4iCa
         zZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745953859; x=1746558659;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OD4Lo67S9frh/bFzs0ODT/uCFExNx9+MNFdXvKnz0+s=;
        b=FBMTTHindP7dIGzFQ7yjNhqlLcvUzhmAfIJNamOFwhzBbaTvdpK0+6aG0bXzBc0AVI
         bgrR5RJSOM8iFtndlGfAxti4IoBUdD2dPSAD1rmDav9PT/Q3hcv5zmHgWU4qPLxXVQqj
         H06q7RofCxuKP5PSaxsa5mE7ngNavRm+rzHGGHlCBe8AdYwNviegxHyR+IcYOoh345r6
         DJyUdeYwQtB3cPSFpppa/1io5OhjBfIl9aZLnJLHb925fEfbeYP8VdZglviI3LelffBm
         VtKvdr4OkwgQ/pNWggOeFIGtUp7uiSf3BxiRN9FSwl0HfwHEY5rDPzINIMMkDXWbWCOg
         fzQA==
X-Forwarded-Encrypted: i=1; AJvYcCWBffemKPir8rD9nAipgS/KcvhyxH7Xa/rLMndaetpSO8lUIyTDyfc0ga1cgK2058k1Fws2uT3kzhwrVsA=@lists.infradead.org, AJvYcCWavFC/BCTdZM7RNdnd9TvXlAlry6YcQSZbXkS3ntTfInH6pTOx4V4t9u/AXsvzSOhA2Bm0pOrb2A43px+jJ3s6@lists.infradead.org
X-Gm-Message-State: AOJu0Yys1o7hCrsL/1NuILD4SG7kYjk/G4ByAihLbyxxPLqmGnMdS+yO
	ln/Igbk1x71yJ20u+XF3uURwaPlt8Y8ot/+Vj2/N8wdhWBMXvqlh
X-Gm-Gg: ASbGncuIsoY8+6WOWU4xXQMh6UVL7DHxKh/QSZix2u0tM40CYaEtUTCEqE5BxHaYbR8
	rpr601FEAc8IK1UtrGEhcWLClqrRKnRDsD/IhuXHg2dzokHC7zpcw7fk7jo1UdSNWYRjWrFfMSm
	l9GRWOnwdm77kj3+CKSAHKe2EbqLX2+4hBhIlVutz71SM+VdKrDeTinT5AZok+n3ge2Cdni1gsx
	k6MDLTMF+Ks+SvyilUG3hlvKzvgGkmuoWDTWU5MWNEF7hTxBd9I2Un4nnmLO4JLEZx1naCFlzaj
	XjOim3AOV01C269kx3cyXbWxrRudehKPbPRtEj6Y8cC2AUGV8ZEFmEMlgbTq
X-Google-Smtp-Source: AGHT+IFDM8GNhhU5MZTnxhWi/Kr9STxCFjfV24N4ph+Q2bcawdkL0CkLdq/mOuAXOM7SHwbKD72ZOA==
X-Received: by 2002:a05:600c:3b88:b0:43c:f597:d584 with SMTP id 5b1f17b1804b1-441b1f60890mr3087145e9.29.1745953858483;
        Tue, 29 Apr 2025 12:10:58 -0700 (PDT)
Received: from giga-mm-3.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cc180bsm14985601f8f.53.2025.04.29.12.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 12:10:58 -0700 (PDT)
Message-ID: <70bc994b1e79c8d0d4c0010611c2e65042cff74f.camel@gmail.com>
Subject: Re: [PATCH v5 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific
 part into SoCs' .dtsi files
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, 
	soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Jisheng Zhang
 <jszhang@kernel.org>,  Haylen Chu <heylenay@outlook.com>, Chao Wei
 <chao.wei@sophgo.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Date: Tue, 29 Apr 2025 21:10:57 +0200
In-Reply-To: <6wlgfvc3rkhv4s3ou67fjl6j4a26vocqck5727cg6muxlz2erj@kivndcjcqc7m>
References: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
	 <20250316185640.3750873-2-alexander.sverdlin@gmail.com>
	 <6wlgfvc3rkhv4s3ou67fjl6j4a26vocqck5727cg6muxlz2erj@kivndcjcqc7m>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_121101_200026_FDB6BC8E 
X-CRM114-Status: GOOD (  19.50  )
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

Hi Inochi,

On Tue, 2025-04-29 at 06:35 +0800, Inochi Amaoto wrote:
> > Make the peripheral device tree re-usable on ARM64 platform by moving C=
PU
> > core and interrupt controllers' parts into new cv18xx-cpu.dtsi and
> > cv18xx-intc.dtsi.
> >=20
> > Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nuberin=
g
> > into "plic" interrupt-controller numbering.
> >=20
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > ---
> > Changelog:
> > v5:
> > v4:
> > - cleanups dropped
> > - cv18xx-cpu-intc.dtsi instead of cv18xx-cpu.dtsi+cv18xx-intc.dtsi
> > v3:
> > - &cpus node has been moved into cv18xx-cpu.dtsi, &plic and &clint node=
s
> > were moved into cv18xx-intc.dtsi to reduce code duplication;
> > v2:
> > - instead of carving out peripherals' part, carve out ARCH-specifics (C=
PU
> > core, interrupt controllers) and spread them among 3 SoC .dtsi files wh=
ich
> > included cv18xx.dtsi;
> > - define a label for the "soc" node and use it in the newly introduced =
DTs;
> >=20
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv1800b.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 5 +
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv1812h.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 5 +
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv181x.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0 .../boot/dts/sophgo/cv18xx-cpu-intc.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 54 +++++++++++
> > =C2=A0 arch/riscv/boot/dts/sophgo/cv18xx.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 91 +++++--------------
> > =C2=A0 arch/riscv/boot/dts/sophgo/sg2002.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +
> > =C2=A0 6 files changed, 93 insertions(+), 69 deletions(-)
> > =C2=A0 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu-intc.dt=
si
> >=20
>=20
> It is a hard time for now to do some change across the cv18xx=20
> series, and it has become a mess. Due to the fact, I think it
> is time to do some work like split some device (clk, pinctrl,
> plic, intc) from cv18xx.dtsi to avoid override, and make room
> for arm64 device.
>=20
> Since this change contains some change similar to this patch.=20
> Would you mind me to take content of this patch, and add you
> as the a co-author?

thanks for looking into this!
Either way is good for me!

--=20
Alexander Sverdlin.

