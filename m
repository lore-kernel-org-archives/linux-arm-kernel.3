Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01870CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZF5lLMA7h2yx16E/Z/NbIZblFHx04/IPYs+dkVSu0nM=; b=CC61PjUGkcEJ7pPa6POEGzJiXY
	OFfg91kdyxo9HsxgET5IF+jjpp1MxTXC9MegD/fZFu1T3CGHRFf8JLlzPwQfflTwMgt4V7I5uqBdF
	ft/8xN5ZA2bMJJk92YUdDkDxa5hs0yjjrOWsXUiXZ3PrVAWoSe31JHu2OpQ+P7cmLbmO2BeYNPXMk
	qVHUlWppfZO1nQ3u4ekY7NiuqLBCvPFpb161izg/sNJ/Nh9r+6fwlzn3b/gV/dGVpKg6SRNy505l/
	E/S1F2FE9Z9Pppg5e6xyI+xLgwP5gIJ90gxFERY8P71lomaXtUAm+PvnRtjf6+D+m96+5MMpSFZIB
	ULiNySlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM1y-0000000G01q-44EO;
	Fri, 05 Sep 2025 02:18:26 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFTB-0000000Drli-03I0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 19:18:06 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-336b071e806so12794421fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 12:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757013483; x=1757618283; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZF5lLMA7h2yx16E/Z/NbIZblFHx04/IPYs+dkVSu0nM=;
        b=xi1PXEtXfnHxb6mBclYU5RAcMbxgPDPZ5MoQnlH3tPT8qRik8aWXWkRMZPYvzd9Eth
         7C0ULSwAuScpoLFb20J6Q6nZyy7/CqIg/TtqY9VuGjdb3dyF+TvadxgchXmFI1QIaTXU
         rKvy2L2pIkd3IHayXF0UA2s39kMzA6+I3HyiFufNcdyWdtHCw64XqGLTT2bIMgmvog6E
         fCxKBAc+44sZmLwTiR99afIoS97YMN5QaVeimeA9jHBbIhNg5E+N5q2XNUQAsikb3gXC
         v3jsjZ/Q651JOPb/Avskrl856/AHFo4pfX9Yrh8UwdvkAhdswoVvsPWDcnC42tvZrXzs
         hHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757013483; x=1757618283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZF5lLMA7h2yx16E/Z/NbIZblFHx04/IPYs+dkVSu0nM=;
        b=Stqqp+h8LZmB9o2PIyXW1QQdUm5UKuOt5WlP8OkgXBFt+O5e6gAO2xn9FLdUHhikwi
         KqNSaPV3HnZYUQ2kfiiwUSQMdwCqASmoGeNwRPHw5jnEZrlLJLr1SCcnOmdSkale57R9
         yLffePJuITwF0OEbTX/72EJC9IgeVDLdwVY7nzPXDJLaHMKxLt/23K0vQg7W2Zf3KTK+
         Rqariq+5hwsl9zKiIemLX4brBunUAw4BySj56+QsmIntxIeXKS75QS61NUQoR5R3vBoM
         toNftm++Nws4DSYj7+gY92WY/7WkVniOTLMYH4EZebssQHltY0XSKF6caJqHvOQ0Frc3
         Aytw==
X-Forwarded-Encrypted: i=1; AJvYcCXF6RbrHeIGAKCgVYipq1rp3GJ7J6OaL/f/ZHmeF7Naz2uxw9SvxirDWN3yccEnZpwmvpmbxHpiov76tbtm1NGI@lists.infradead.org
X-Gm-Message-State: AOJu0YzGqqfaMwGL1+sQ3D5/g9FeBBZ0tlsDdLh9k8Kv3pD3Q73UEckZ
	D9L9q7EuuGCxagqrvSKNsdf3Zar/uqNWv2ELN7zz64CMVqspJ2PdgfpQunz+ysyboEzvFYRtKD2
	f6ZamK8ydY9CKnTSvzcpyX96MYg74GanHYSIo51pFlA==
X-Gm-Gg: ASbGncsNWPcJGXYfiwmXCSV04l+O+mJgYXpb+hoiOsarkJcEnvDViguZnkHLlICHfAb
	OsgNzlBG/2rb0oFrwKl2fmv+Psdbju3Bksmwl05vtjr/U7czOLQetwy2G9HTcugoTTkl2jl4ANA
	+X0bxmaU6kRBG5wBJmDBkUOvviM957VErXNk5P4IdWnFKi/B+q+0kBtVxGDWg8NUbMATLGVeIp2
	gnm5kSuovysJ8yKsA==
X-Google-Smtp-Source: AGHT+IE5rwrhvv5qZHz6lW/fqD0gYW2CFROKD+rC1PEOKV3cpUw2gd7Ym9I+S+hnXU1PgSDTxTy2pPIOFXTSby/SrY4=
X-Received: by 2002:a05:651c:b13:b0:337:e8cf:f049 with SMTP id
 38308e7fff4ca-337e8cff1b1mr41377231fa.32.1757013483147; Thu, 04 Sep 2025
 12:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756372805.git.andrea.porta@suse.com> <CACRpkdb8fFvgyWPAaP6AumwHUYhnvc7BXX0V5kwO4sts6zSGUA@mail.gmail.com>
 <aLf1nc20SRkWJW51@apocalypse>
In-Reply-To: <aLf1nc20SRkWJW51@apocalypse>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Sep 2025 21:17:52 +0200
X-Gm-Features: Ac12FXwADs87l60RXY9dk-u4dU-hiNHF0BGDc7fS0K4iRh-4CbDl_UBjzeodFfo
Message-ID: <CACRpkdYNaVQ+NgAhZCiKmU16jf6rtGL02JOJk0w=kezz=YRbTA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add pin control driver for BCM2712 SoC
To: Andrea della Porta <andrea.porta@suse.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	florian.fainelli@broadcom.com, wahrenst@gmx.net, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, iivanov@suse.de, 
	svarbanov@suse.de, mbrugger@suse.com, 
	Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_121805_053059_995C07BE 
X-CRM114-Status: GOOD (  16.28  )
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

On Wed, Sep 3, 2025 at 9:58=E2=80=AFAM Andrea della Porta <andrea.porta@sus=
e.com> wrote:
> On 08:58 Wed 03 Sep     , Linus Walleij wrote:
> > On Thu, Aug 28, 2025 at 2:45=E2=80=AFPM Andrea della Porta
> > <andrea.porta@suse.com> wrote:
> >
> > > The following patches add a pin control driver for the BCM2712 SoC.
> >
> > I have merged the prerequisites providing .function_is_gpio(),
> > do you want to do any last minute changes or shall I just apply
> > the v4 version and fix up anything minor in the process?
>
> No further changes from my side, please go ahead with V4.

I applied patches 1 & 2 now, please apply patch 3 to the
BCM SoC tree (Florian handles this I guess?)

Yours,
Linus Walleij

