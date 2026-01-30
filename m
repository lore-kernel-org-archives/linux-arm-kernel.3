Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637C1D49C7B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 08:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSzFXN53vplKWS6PnrB53pSwv37woM51TQmZ/gIlzlU=; b=VxQC+TUmF1hBibW1ciAjpgR2EN
	bqSUFMG+8Gncs9pYA7XKQLUk2MxVMZ1RTQ7zfchTj5Pz7fYw2+5ga7RxwOMShTCKaWGTg0Bym7k5T
	+o1N4d5zbunDYJr0liLEWV0M4/FnZvMnC+RtWscY2bVe3zyQCWmghvELagduYZmuVVLJq8mqtjUAg
	SyvU3KdX/ezO0CxATuFTfpMM9nCPfS2i/OD1aDFdHTrJ2PDxkEf2+QJ/Yl7E7GwmHYsraozUgKMe1
	U1CCEmYmyju9nFxIe4EJbOniYTRlNk7ZB7wjgaEwXzsqjk9gPYhvh1b8NFRlrTLvqLhFyKZMB6mQS
	i5GWu6OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlk39-00000001EHe-1LD3;
	Fri, 30 Jan 2026 08:40:19 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlk35-00000001EGR-1lhy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 08:40:18 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-34c3259da34so1219015a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 00:40:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769762414; cv=none;
        d=google.com; s=arc-20240605;
        b=HihuVM63H7bZ1M9So5Z3yUwuOoI+KkvEROaP6p++Igu5VVlhZ9MLWAeLLWS72U+eKO
         a4am8Stq5heeneewtiwuEFVbEnj3VPINzL58U2qSEdStazYdRRu6AvNQWtMqo1f6v6IJ
         Kq9d6QmzsGSMDXa7D+g+MAMFtiGBxAz4IC3Fa5qKOL1VIl6rkZALUdIxFQ4lBtfIP5en
         J7XV1PNbc3Q2M7i8fb3rtyVkT6kAaqeOhYWwJPkgjccFPKoxEOGVu6ev7vxP7XQk351c
         RldSVw8Ebf2I1STaUTiCSTNQGaDpREqyhE1/UOlCBLWT0YPz1g3PtTSWTEiKC2fbh6nk
         ZFcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bSzFXN53vplKWS6PnrB53pSwv37woM51TQmZ/gIlzlU=;
        fh=mJ6zg5S14LN1dFCSm0mfIV2zcaaHc+0kr3F3mUSuwxM=;
        b=bBJzP1tYUvcuyXuMQIggT8gSm0KfkJUqPvyFBjKOTGHfRHNOGI+y5DrUT2bklzcjV4
         YgQLyVddFw71Xc5P7Ovj0NnBILoM6QbsHXU4t/pYtrU2D/CmYU81TSyf4CFF0JM8xzUS
         2eMiogwMP1XAFqIrfdfR19h8qrtMyTI1syhCupfRpKgLNJ1o7XN/Lren/q3kM1QcdwfM
         tNq8/itp+p0evJfYwpSbA7AERPWVjCAqDiXS5oeEA5GKlAb8/ymzyqp1SD3wTru57drr
         tN5IrgazpcJ7k77SlLP6eot6T2s8ff6tGn8nYphCpYkPvbXh+NLNaIwL9x1wncgC6rPU
         sETQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769762414; x=1770367214; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSzFXN53vplKWS6PnrB53pSwv37woM51TQmZ/gIlzlU=;
        b=Sghk8rZd36n2vDAe5+vyCKEv3Pm+qYoB+ASX6qaVSBIMiQ61iW0ANMCzxzw3qWvhtg
         VU1UItEZ5Y8FpkySwgttqWGCv4Fx+jc8mHh0LDZgpalMOPico4gN93E0rjILxtsDh3/y
         SniljW2vDa/AEU6Swn3XIBfmAdPeLYmu1D4N8o/GXSOJIPREQOH/3skG42ZioryiXzuB
         gvo4Ontid000kgKKCZTAjZ0mamAT7zRkW0ZT7xjrGeRoXgQIAyx4ugELVU74b1TaNFrs
         djRBzEFtEGk+nMoOALzbMSZNtElGUytki41xSWbAUnfSwDj+pItXiVKUfEar4CTzuMNE
         pQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769762414; x=1770367214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bSzFXN53vplKWS6PnrB53pSwv37woM51TQmZ/gIlzlU=;
        b=sFCkXuEUudo41B9ycj2wbkRX/Tt1hk2omvT0Kmx32UGOACVzuN/1ZF58Rs+cDlFSkG
         53tEx/R5bjLkUWFBIt1Ce9Q02GJm9YQErfuzgsU77UEVW5J4BE+S85OzFLcFUtbSLABv
         qjh4AunlHCmDsYjWuBiPdJriTv3BdRMOpj4UL0wiZhD4QfGKVP31F8fb2e8WC3ccG1gg
         epOIf0xnED2qW5C2891Z76Qofqxh8yOrqwRD9qbdSIOzljKOfY+t4Uvo9C9pkfyvS/I5
         ymtSUMVmv0nBrp6US64H4ES+vdnv9EhyLPAI0w19CkgekOOsQof6/vM/mofpG4nizRyR
         rqDA==
X-Forwarded-Encrypted: i=1; AJvYcCXYTSo+pKhDeWA5s4OCoYJL0NoTt48w7o79ZnjS8wY9Q1RqKZ9B5+lXuNsZdiuOPwa9G9jFG2q+dh7/4vAzkVSb@lists.infradead.org
X-Gm-Message-State: AOJu0YydXFUIqfinCI6ErEpcAsJcSDiW/FIjf+1yxCeUUPxo+esvH+Rl
	jWmcRbSOfArep6O+sszl1DWv/Pv90ekSNFq9Zg2M+ZEzV6xUyRMnePEIHFTurjN6HGE4rdNeJ0p
	GgGK3fWnnVTVB0YFBZqzgjewDBefJTXevntm1mAw=
X-Gm-Gg: AZuq6aLHKVWmeudGvySm8f8fNqw6Ik65NTs0yTbSEMFTZMzV2LryzaIHyNn3tU7Yaks
	mhrFuY8oQgPsOqHAr93WCC/2/VeteO1LMBq6wB7h+YXjRb7KsUBan9Pk8g/+AkwAUhrOPBnsqz1
	LhCYRB7HBqZ4IYA3LvWqhhh/lPVtpKfOMERr9Ot0J/wNSEo690WqP0BFZH7g4UdXVbvl6UulIE5
	xxUODHBPO89Vr00+ABh2zz0ppQPJkrIfVE/7mGl6dDympXrP42aKWV/B+uzjuK4DmlOIETe
X-Received: by 2002:a17:90b:270d:b0:353:39bd:3ad2 with SMTP id
 98e67ed59e1d1-3543b305623mr1811680a91.5.1769762414422; Fri, 30 Jan 2026
 00:40:14 -0800 (PST)
MIME-Version: 1.0
References: <20251222-yv5_add_dvt_e1s_ioexp-v1-1-25ad202d2681@gmail.com> <a0d802a1e450860a9859ce3d456fcce81dde8ba3.camel@codeconstruct.com.au>
In-Reply-To: <a0d802a1e450860a9859ce3d456fcce81dde8ba3.camel@codeconstruct.com.au>
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Fri, 30 Jan 2026 16:40:03 +0800
X-Gm-Features: AZwV_Qh0YugKL7P5Qp4faBa4pFcAFafyTEwBvU80qMkiPLr1D8_zLD6pOGbecE0
Message-ID: <CABh9gBfdNnWVUy2+pdMZWjt+mgKCV3TxZei3V_cPTp1z1fguEw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: yosemite5: add x4 E1.S expansion board
 I2C mux
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Amithash Prasasd <amithash@meta.com>, 
	Kevin Tung <Kevin.Tung@quantatw.com>, Ken Chen <Ken.Chen@quantatw.com>, 
	Leo Yang <Leo-Yang@quantatw.com>, Jackson Liu <Jackson.Liu@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_004015_465859_6A5622C0 
X-CRM114-Status: GOOD (  12.17  )
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

On Thu, Jan 8, 2026 at 12:46=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Mon, 2025-12-22 at 19:25 +0800, Kevin Tung wrote:
> > The new hardware design adds two additional E1.S devices behind an
> > I2C mux at address 0x73 on bus 10. Add support for this mux in the
> > DTS device tree.
>
> Out of curiosity, you're monitoring them with the NVMe-MI basic
> management command and not NVMe-MI over MCTP, or is there something
> else going on which motivates describing empty mux legs?
>
> Andrew

Hi Andrew,

We=E2=80=99re monitoring them using the NVMe-MI basic management commands
directly, which is why the empty mux legs are described.

Kevin

