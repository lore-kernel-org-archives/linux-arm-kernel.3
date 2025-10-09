Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99B2CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 08:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7z3HsSENHtLBs81iROjgJgytmIxb+jEUUPbgM1LeHQ=; b=ylYCwIUtiG7f6FZ95jIn3a+y03
	imY1hPsC5nN1cqGjg09VUF3OhclslRZp/js68NJsYIMPbaeAMbZ7huyVWGnuAm2iT6p1xCCdpnrhG
	OQigaMcLDLnwEXv5jAkz+S7+mkxsON4sEZPsDQEDCBOubBzn+KF9o06/VddSYMiNXVRTibaKAkatL
	FtXgMf5BPjzgJhlxQ93XsTpM9PuWtnpU6TiTT3hX4+NaoIq1FaQYpRR52BNHp9wXCZblXC/1zRzcc
	kb1BHmt3d64Sld0pp+YPcyMAFN6SvIlivoEM7yRIsWyZUuZTy3efDf/ESimZAx3OLKoR6A/OR2c9g
	d7VzQ34A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mJS-00000005Ysy-3JjA;
	Thu, 09 Oct 2025 08:47:50 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mJQ-00000005YsF-0QD1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 08:47:49 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4dfb1f481ecso9433731cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 01:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759999665; x=1760604465; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7z3HsSENHtLBs81iROjgJgytmIxb+jEUUPbgM1LeHQ=;
        b=hCx9Obo0m17/1vRQsiuLRkhnIR7Z7a4wlfMJ6Z3n8gmGYpirMCS/Dr2mqVRHLeuuRT
         Q74eM0RAQkbCmgJ6t18qxm4rQ7WRBaszuhaL9R5TwIqQKxhzuS83VOu94hmThu6umPDf
         6rgjYBbBUPXxMDIrQYU/SrQqlIY5DKrJcBzOMujGHwFyFrX2VqcucE8SHu2el9iw5DJM
         pjGUZLsn12YDrTnGAOYzBsZxBOUrSXTsrlIoJS5ftgmVMYxSIPJMnttPZCD1zkyv2T32
         NqNBWuyvWr59ZQiVrFvRmsdiZd885s9vhj2GIjkIVZ2TjtYBBQe1HS5csQK1j08yJWf8
         wrog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759999665; x=1760604465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7z3HsSENHtLBs81iROjgJgytmIxb+jEUUPbgM1LeHQ=;
        b=gVMtFaLrHD76VsoOR/zwu0EAlrAygvBg49phDhE/zypJ3jf5YzZhHPF3EVD1zbFDwB
         f0TAYkOb+FlNye3sJnssnp8QpSWiTsBj37W9HW3qN+0T+30buZGLQHAGFU5gc4sFbXZi
         nEwFnT/XOFSmqDG3dOUsuTRQtgiHwQhBGEe4jN7niRlXJnck2kphZ0wHZT/bR9ihYDLR
         +FoPLXV9vb1m8AOT/Rw4bDSZENFCX70N8111apoEgOFVEV7+dH+OIb6HihpleUlZjhm5
         V9N1X+NzWpz6iCbZfT30t18BsLHWX4qrcm8v32tDvAZ3GtgaIFU6W50TR5kPFTPf2tUk
         77ug==
X-Forwarded-Encrypted: i=1; AJvYcCWdRqrmvUdtfBijSA8x5exq4xH2nsBT8pVw88vEWWuclQ1a9h4T518ypKtLuTXkw+NjoLKYBTVcUyxoMLAO9UJw@lists.infradead.org
X-Gm-Message-State: AOJu0YzEdu8BZOtbR3zk7YMn0KeVIWfQD7XPE5Vt8YqaG5ua8ijmjCk+
	qlDbhv3UPJkxPh3h+KekG/oFoICccpbdvCmPrLN5FBsIOB8ay68F0tQtsl6p1hbSOUqf/XL34Ve
	T/5uksno3s4mp4VDfNdxMDx6xrLJ3cSA=
X-Gm-Gg: ASbGnculXIm83y1NnOPT2VydxOkHfQCH+6VYGAe4kij+c4737fa01UQHNfRkCclBt/G
	iyzC3BzgIxhoQ8ShCkOrNIQaGi2rrU3jq/XAohPyUmWYneEAqoV58Dn2fG96Yiveyce4Zk3Sl2y
	HenkLlUwoJNZMR0XM3mgSf+txOEez4k84WyX4w7hsf11xr4n6VZDnfRJ/JwYuPrI6r3RnhEkoJ7
	DCNUx+lgUp98jpQXz6BaWY3dx++zA7amLesJcTr7NKFy+kpP7Odg7CSL/8GTrXx
X-Google-Smtp-Source: AGHT+IHZCtZVjbJCuCzfkElGQPsDTCoF7VlhCNJzNSACyEYAtAeKcSTNYi1LVTtefd/CGrEn+damOcQNkjX8el2dbLs=
X-Received: by 2002:a05:622a:315:b0:4e0:3cdb:d1df with SMTP id
 d75a77b69052e-4e6ead5c32bmr79013101cf.61.1759999665491; Thu, 09 Oct 2025
 01:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250929065714.27741-1-jjm2473@gmail.com> <20250929065714.27741-4-jjm2473@gmail.com>
 <d8ad476c-d0c7-4e97-9e76-540a539ffb52@lunn.ch> <CAP_9mL4ofig-X-w9wx1A5D_eVXROo6AVFBSwp4mh=kj7webpPA@mail.gmail.com>
 <7e219aef-88a0-4184-9553-30dcbc8dbd79@lunn.ch> <CAP_9mL6utQjN_2EZ4vs3K8jzcxHxvKWNTNEXZ9fAx4HuA=DNXA@mail.gmail.com>
 <a0501abe-d86d-4f3a-9d55-c842bfafc190@lunn.ch>
In-Reply-To: <a0501abe-d86d-4f3a-9d55-c842bfafc190@lunn.ch>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 9 Oct 2025 12:47:36 +0400
X-Gm-Features: AS18NWC2IGY_8LtLG8W701XYpA8RXhJynROI-cfRLT0k9gdCMgBYHBHaIfR9D_Y
Message-ID: <CABjd4YyqL1YouMt97MA=CLWJmcFMMr+=xpOKOd6YtAC6jQAO=Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: rockchip: add LinkEase EasePi R1
To: Andrew Lunn <andrew@lunn.ch>
Cc: jjm2473 <jjm2473@gmail.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, heiko@sntech.de, quentin.schulz@cherry.de, 
	kever.yang@rock-chips.com, naoki@radxa.com, honyuenkwun@gmail.com, 
	inindev@gmail.com, ivan8215145640@gmail.com, neil.armstrong@linaro.org, 
	mani@kernel.org, dsimic@manjaro.org, pbrobinson@gmail.com, 
	didi.debian@cknow.org, jbx6244@gmail.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_014748_140955_88E54329 
X-CRM114-Status: GOOD (  12.71  )
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

On Tue, Oct 7, 2025 at 10:32=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > I also notice that you suggest use {tx|rx}-internal-delay-ps instead
> > of  {tx|rx}_delay in
> > https://lore.kernel.org/all/e4d3127b-c879-4931-9ea0-de7449bc508c@lunn.c=
h/ ,
> > but I think this depends on stmmac driver.
>
> It depends on the driver implementing those standard properties. But
> as pointed out elsewhere, tx|rx-delay are magic, nobody knows what
> they do, so it is hard to implement the standard properties to replace
> them.

FWIW, the TRM for Rockchip RK3576 specifies that the values in
tx|rx-delay control the number of delay elements in the internal
delayline on the transmit and receive clocks, respectively (up to 200
each). There is no mention of the actual delay each delay element
introduces, though, so that doesn't get us much closer.

Best regards,
Alexey

