Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883FCCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFVno9Nsq/hvsU0eZZtsglitWo5gwSvgnKfW0LBnyoY=; b=LFJH9XTURQXEpQGzl1VPyESARd
	kWXEZXK5ulG+Bn4azoyjAmtkzqBSrfqjDkyqfVh3duDzGyzZTGfAcgLvaONPPJUgN3cTBtAU0tKtU
	5vysUzOybSRz1DkoLIL1Je4XscATTxA2pJMytYRbSIPNc/yca34k8yTt+ytx/iykczrFJmSEEbcVO
	WWxpbQPfZCW+v8gnD9Jd7wHQYIOAimSKkls1CD6AcSYYaL7oMp32dcxR7sdbmbhYketXJ9f7gDg80
	xXJHs5dO3GpxNwBFgnQDmWVqI6M7YBkb/IrchGWAHEkEaqdr1SUKu1Ha6Fi4GbuzGqEGxzE894iHj
	SN5F/VaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMV0-0000000CpPr-20os;
	Mon, 11 May 2026 09:00:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMUz-0000000CpPA-0jdN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:00:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6357D600CB
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 09:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AFC6C2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 09:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778490024;
	bh=CFVno9Nsq/hvsU0eZZtsglitWo5gwSvgnKfW0LBnyoY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=adBQELrjXkDuujWs40KxsrFPAbdty+DWYgu39WdyuJG4GC7oVoivxsJh6+6T9uyUG
	 sMHKYx9RR0GTBuqVzz4QiFCR2/pIYTQI1ojDAZ/ayjTiE7y2JgPqN5QFcqpUfWNMx5
	 pKEtGRvH5xmgYxaNRiPVnM0bp2Z8obBpkSbCOMdZ+/j+Z9uromqBoJGYIg1SyD4dB5
	 3FXoxyeXanWVmIFvQdBROjRPHuPJGETkDaOLBiyDqnIqtps98BPJLMRaoi2DnZ6f9y
	 Vg68VW5w5KR7GO3O3fGMT17IQqIuwg2ZA9lxTq3b4KxjD/PfWzMUzSUg6Y01++2rIV
	 r+nW/BO136GNQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38ea6a5a0b3so33276731fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 02:00:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/0n1FOxhsNixMAVGE/xWF7p7QInXK8I0yk4cs/MKN04uipHY4LV1wAuIL0N8bWmtA0QRlKJOC5CnP0jORfJjxU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1CeMsZ1vw2hyk/gt9M+dEoY2t8NFK/vQVC5HtIg3P1k5Uq1cM
	9GL6K4PqzUUcO7O8E7Ho3D4n5inys/lSRPF3t5Ntzo8Uc6YS5g35A10HyMNbucu/g6E+7WHt0Iw
	s2ECjwni6WDvYgKpeFN6AS49UGjjVvPY=
X-Received: by 2002:a05:6512:6181:b0:5a8:d1f3:4f8 with SMTP id
 2adb3069b0e04-5a8d1f30770mr777984e87.26.1778490022755; Mon, 11 May 2026
 02:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260429-send-v7-0-b432e00d2db8@gmail.com> <5379905.31r3eYUQgx@strix>
 <CAD++jLk02QnkXYwJ0b6x=qw9stR4nPrjD3sYPOvWAQz8t9OsUA@mail.gmail.com> <23095518.EfDdHjke4D@silicon.doe.home>
In-Reply-To: <23095518.EfDdHjke4D@silicon.doe.home>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 11:00:10 +0200
X-Gmail-Original-Message-ID: <CAD++jLniQfWXGe3dK=StOGv62mi_3fEHVdipUavsFGSrNm6cLw@mail.gmail.com>
X-Gm-Features: AVHnY4KhmRCq90-NzUXRaDHZYtk0xNB10BVaq7CG7fH-NLC_5K23qELlHwCuUpk
Message-ID: <CAD++jLniQfWXGe3dK=StOGv62mi_3fEHVdipUavsFGSrNm6cLw@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] ARM: zte: defconfig: Add a zx29 defconfig file
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org
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

On Fri, May 8, 2026 at 12:09=E2=80=AFAM Stefan D=C3=B6singer
<stefandoesinger@gmail.com> wrote:

> So I read https://docs.kernel.org/process/maintainer-soc.html a few times=
. If
> I understand it correctly at this point "pull request" still means emails=
 sent
> with p4, correct?

No it's the contents of an
git request-pull v7.1-rc1 git://..... tags/my-soc

put into a regular email and sent to soc@kernel.org.

I'm sorry if the terminology isn't always clear on what a pull request
actually is in the kernel world (as opposed to e.g. github). It's just
an email with request-pull contents and some cover letter.

> Or does someone create a git repository on git.kernel.org
> for me that I can use to send actual pull requests?

We can pull from wherever as long as you can sign your tag
with a GPG key that we can (in best cases) trust. We can also
just inspect the result of a pull request from a branch (no tag)
if we wanna, it just involves more inspection and trust.

> As I understand it, my 6 patches then go to the 4 corners of the kernel:
>
> Patch 1 (dt binding) to devicetree@vger.kernel.org

Nah as long as the DT maintianers ACK it (i.e. Reviewed-by) we
can merge that to the SoC tree.

> Patches 2 (platform), 5 (DTS) and 6 (defconfig) to soc@kernel.org, but no=
t in
> one series but 3 independent ones

In an ideal world.

> Patches 3 and 4 (UART) to linux-serial@vger.kernel.org. I think this can =
and
> should be a series of both patches belonging together

Yups. Greg merges those.

Yours,
Linus Walleij

