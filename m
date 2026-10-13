Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C99CC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 16:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aoc8nug3Q5d4idvy+yC0Mx43dQ2bXsa5/t1xC0cav2Y=; b=yxRSzZCDrSm8KivdBKTKbwQjIq
	g1gRAaZC7MNaRzcj7Vj3x/8rOo/Oi7boqBplcGZhfMXqMShatyqeUk6yaMdurb/qMPXnJHa1pfuvc
	iHBH8RQkoEEmEFm43KlgFNlJob6l459kxMn1/0DPd6Qgt19AULWl00NrW2DhdVgDAgvNoDEqFTPCU
	5Sf45cnhQ4H79uW1AKIxO35ixe32WtnkXlDZTFmEjEhUds8ggpvPw3EJjT0bMp31V/MC5fFnJpyzW
	WpYsW+fiAN40HO6cNb2cbGSa9FnNf1DPMdrM47vHDY+l2hkkaNv9AgBw689RFuGepZchrkX7B95pY
	ynM+Qkzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfWl-0000000DYnj-1cqJ;
	Tue, 13 Oct 2026 16:38:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfWj-0000000DYmT-18My
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 16:38:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C41260A59
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 16:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22ECB1F000FF
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 16:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791909536;
	bh=aoc8nug3Q5d4idvy+yC0Mx43dQ2bXsa5/t1xC0cav2Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EIXr0/NqPFBPFbx1LaDsMXlKsGpxcyH5MhiMvJJEZ0hq0e0/HC3jK3AP1NrWRjgJ0
	 9d+nW7mdbCZJFLBgvbC5gEY/xtmIeMTs8CfOlk1pibY1P/VXzO6VDvkSex+a/sQXwN
	 JnsYAeNzc+oKZ6PMto84QQDBwMXAHAxm5+0qr302BxdESzqlPu72UGNyXChQ4ZYlW7
	 TBEzkfcGSCutzCxu3ePjH/mnwPyN0Z2BazHlesETGhJDeapcn82BQpOxKPnbkJzAYZ
	 54GU+w60CWQYtSjOWvzvxPPDu7y+qTe8EdOGslq1DfkZhUdWbgDnzizxDKE5xj+M/q
	 q9MeRX/XD/Ewg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso1653202e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:38:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxVxbvlv28e9/FCpNm9VWNzdR5qA6ss+1hNkiBZhAsRZUKX3uTToE0Avb2t2kx/ynQPCJ071GKNRbszIQnF8CUi@lists.infradead.org
X-Gm-Message-State: AFq9FYIP2JKId8N3pamsZ7De6cyTBjfSfd9hLUb/vQMxpvr5i9TChGa7
	En2NATMR2oasbwEeQFJLQXjEZiWTOYM+Vei5VHBCSORza4MjVe6vsHVSM7hgK2DT2sOULbl893h
	3aI6MLdhCWmuG41ED+tpRQgevG8WUZpk=
X-Received: by 2002:ac2:4e0c:0:b0:5ba:3b49:1ed4 with SMTP id
 2adb3069b0e04-5bcde8be31dmr4294291e87.44.1791909534950; Tue, 13 Oct 2026
 09:38:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com>
 <20260921-cv75-v5-v8-4-282ff5d98dda@ambarella.com> <CAD++jLmKF5XxHsJX29sdXC_6JHKn-7HkE=N+TKtk5xODtQj3_w@mail.gmail.com>
 <b2256847-3ec1-47e8-ac79-ceca86eb09e7@kernel.org> <CAD++jLkrXXg9xrhAZ8HETc5Qcv5BbkY-ibjvzBmE5WZVqDEGWQ@mail.gmail.com>
 <a0eca34d-5eb2-4730-b8c7-0f2302bcf265@kernel.org> <CAD++jLm=T-U07vAVCogMnfOfkDf=i9QhGGc8ok2N-ZUh50WLNA@mail.gmail.com>
 <56dc6c05-7fd6-43de-bc62-c353ae1dbcc3@kernel.org> <54b55ad7.9d3a.1a135b09587.Coremail.zl020895@163.com>
In-Reply-To: <54b55ad7.9d3a.1a135b09587.Coremail.zl020895@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 13 Oct 2026 18:38:40 +0200
X-Gmail-Original-Message-ID: <CAD++jLmrQwAT1Sb8HGgoM8x48rN9-pPT2RB1GE18h5YA7c4CwQ@mail.gmail.com>
X-Gm-Features: AclHuK-C40htUqR0sQkUyvXzKiDDbUaAdB38TRfKZGEWECC-r-8bfyITN0j8-AE
Message-ID: <CAD++jLmrQwAT1Sb8HGgoM8x48rN9-pPT2RB1GE18h5YA7c4CwQ@mail.gmail.com>
Subject: Re: Re: [PATCH v8 04/18] dt-bindings: pinctrl: add Ambarella CV75 pinctrl
To: zl020895 <zl020895@163.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, longzhao@ambarella.com, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Lee Jones <lee@kernel.org>, 
	mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Oct 13, 2026 at 4:36=E2=80=AFPM zl020895 <zl020895@163.com> wrote:

> Would this work?: I send a standalone
> "dt-bindings: vendor-prefixes: add Ambarella" patch to Rob with only
> the two lines in vendor-prefixes.yaml, and drop that hunk from the
> SoC series. Once the prefix is in linux-next, the vendor-prefix
> warnings should be fixed. The remaining example matches, such as
> ambarella,drive-strength-syscon, still need the separate
> GPIO/UART/pinctrl bindings.

That works for me and solves my problem so go ahead.

Yours,
Linus Walleij

