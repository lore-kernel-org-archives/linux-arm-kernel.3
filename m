Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CC1CD6E41
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 13:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vL4NlyK6MPiwhS/+QILyLISkt+l2RWDPpZ3wIG7sAs0=; b=YwFOasQKIU2h+1yKg03XSBV0RM
	7s2/AjrvHSRvRlBn81uejRLtxfeb0T7Yn27Jzy3Vqpihvte7QILnsnt88raTANPV8ZLkFHtlBhvs9
	dHbH7GQSZbCpMyMmI19xA4CWMMYWCqzr0j4och+1A3vITkXmWbhxVqcOQDlObNzz1A1pX60FfA+sr
	MK3NDM843PvhJg9dQpyhzB5PrmmCiTlZJpzbb8vWoCW5Nlwnu5BdMGLx3bGlLCyY7YMWjKwKckt3H
	JkZcGnA6cidAd+sb8ziFjFvRJwblot+mfulfaeozW3eHCp6UELUMziDt+GqvwkxNGwBMbx5JGhS2c
	/ZYTem4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSE7f-00000004AbH-2EU2;
	Wed, 27 May 2026 13:16:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSE7e-00000004Aaz-41jd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 13:16:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 68B036012B
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 13:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E861F00ACF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 13:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779887794;
	bh=vL4NlyK6MPiwhS/+QILyLISkt+l2RWDPpZ3wIG7sAs0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=h7WnMQxXODnPy8Wm6rKm/4cpE+nxrmmZUQjVuXFnmZWOmIygeMf6qRYtSRXIycAvC
	 D7k5T1hyoJ6Fk4iHvcq4r+d1exmr9bAXWDT03VpBJDKHqkMSor9QguN17ci5lPGV8d
	 OeDNdQhf9wdJDtecUlcqIziAfQvaClC80pimY5+WhufVTGK2jhYm+DP+y/qK9SbGGW
	 ANdJ017mux9kVOcS4EBpF4qEBzr4pFsRSDZJOzS6s1bKB4FblqbrYLLEyuPwffsw3Q
	 SjWzzySe6Uot57sCW4J/rmHC55UvnPKlxjeea+38mY785Bn8In/X0Rn9fs1vUqZRxz
	 fW//eLd4HdSMA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a40d02b58bso7939804e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 06:16:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ95xS5FXiJJ4gp+IdZKYRhDsCDEEDW1sp61RkweW748v3Jyin90L9Tbz2PZDFdPpi9uzWUYIkjID/EbG/rtXo/g@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxwl+dwHVCeV6AS3aLH9GVLpv2mACeTcwe/A1KK1DTtwa5dhCR
	HjTJCIvb9rT9HXQRvld+NONDLY4EXLuUEcZFesJpk8gd+ftLuN5oZmEvX03FGuE9hqUj0vbqxXH
	y0/0iTaz7wsMy+kWvqtFZdLeWH943ME0=
X-Received: by 2002:ac2:4435:0:b0:5a8:e61c:371c with SMTP id
 2adb3069b0e04-5aa32377c91mr6204628e87.26.1779887792892; Wed, 27 May 2026
 06:16:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260511183017.228595-1-kmayur809@gmail.com>
In-Reply-To: <20260511183017.228595-1-kmayur809@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 15:16:18 +0200
X-Gmail-Original-Message-ID: <CAD++jLkTW4R=d0Kb-8zVtGLRHW2xi-6Ya0ii86njQyO1Us5xpw@mail.gmail.com>
X-Gm-Features: AVHnY4LXQhHna9KsXNe5wSmgS-A9cyLoUH6bq0dDmcU4a9FEAF7f5O6WXxdpc3g
Message-ID: <CAD++jLkTW4R=d0Kb-8zVtGLRHW2xi-6Ya0ii86njQyO1Us5xpw@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: mediatek: fix SPDX comment style in header
To: Mayur Kumar <kmayur809@gmail.com>
Cc: sean.wang@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
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

On Mon, May 11, 2026 at 8:30=E2=80=AFPM Mayur Kumar <kmayur809@gmail.com> w=
rote:

> Header files should use the C-style '/*' block comment for SPDX
> license identifiers. Correct the style in pinctrl-mtk-mt8365.h
> to satisfy checkpatch requirements.
>
> Signed-off-by: Mayur Kumar <kmayur809@gmail.com>

Patch applied!

Yours,
Linus Walleij

