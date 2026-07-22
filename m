Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D101AC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUDdFmL3+NA+J1/tlIoHIkJZpryeycSZRENBb+lv4ow=; b=ODW3g5td4qnKVfmHhqHkxy8bXI
	nlgb0TFfr/udd6ujgLSMvJLlZUEcDf/FxmevZyRmfB3aKsLGSU3eclmGPCKAW7A8mQjTawq5jS/72
	XhIBlzjYQbhCdSlCPRed1mnuzFuZzQXt53D6eElI8k767zzcxVoUJo8ACNKVRIcvK78QC4JfSfUr0
	kfot1lo2oqQm4HQrPrPLmhtl8TlnEsuBw5BedteyRkyJwv3LDZNdV2DlzKGZwQhDyjQXBwKocLD7F
	cKnssFDXV73CTvLmIp+GqoqWeRlOxJHCG7O95CXyQgUT7B3dxN0tLghaQXopFBYfWuRQk2RhSDMFm
	bPkjHV4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYRq-0000000C6Cn-2aLe;
	Wed, 22 Jul 2026 15:01:26 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYRo-0000000C6CM-038U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 15:01:25 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-51c10ed63c0so1669511cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 08:01:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784732482; cv=none;
        d=google.com; s=arc-20260327;
        b=eCwuyUPIB+U/Mei+x0nA/AxfHUJ+YL4UIxHKVmGEhbV8z0dED4/K/vthp3uHE0ELGd
         fZs2V/dNCBb0SC41FM2Cd9hNXscTDj3CMsgQTh20PwAyoCIZnE9wp5SJGUYyuP+a0j7H
         jFnh969FTFPywhgGvoZ+c4elYOVsM9jIA20B1+P131FBULagiJKYb4XcRn/dm6BJeWyL
         DqXx/Msh1BEJKH6WYd1sI/e6KWx4suQxrwLyI8Z69YQKISPY4NURZ3ItN/nb1oXIMH3i
         00BfeWy/s7vnwOGUtsLKDwbIB2D8oPnuYYG32uRGpZ6x/XlT09H0i2iJ+rHVteMpaq0G
         UuUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IUDdFmL3+NA+J1/tlIoHIkJZpryeycSZRENBb+lv4ow=;
        fh=rMWK2k+8UzlvUNFD8/n7hQFE8Xc4ZUZ1vBWhfFaKDCQ=;
        b=dug+m91+E9ZZWG1OpAXC/NZKLXDzYLZ48Khf/4FSkM880UVAhO6Xc14bzy5WtjLGw4
         k64Jl1kCp6EjN2GwI71d34tGcOlF/P4nZjHFfmJGzUnFz5ev+HYTHVjbJGdD6pYLs4Xb
         HqGgOYieEpCpvceWVjGJyazLW67U1d4NbIHZGkqSEbGByWksCAJuLYq2XuFkmAVNZuij
         RL2vdeSua9uCuZi121TEAu5rx30kzu2VM3WLwqcI6CRFjLWrNWet/BnJq9yyzQ11Kn6a
         pyppOc2Pn/JlFjDLhXmK/HtT8eWnaCtfiE7/iy4/hKGkPGkCCwGnlAp9G1+QC4jyEScR
         F22w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784732482; x=1785337282; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IUDdFmL3+NA+J1/tlIoHIkJZpryeycSZRENBb+lv4ow=;
        b=Z+hzALDIcjHPX0pegAfSlsTnsEX+FRcgx7Q/X3tm5BTySC+oPiSrc9Lso8apVZkVND
         6Q1VtlVJSJh9ZBwe/fIHAraWlFGjqSLM5ATwGl5pbZBak2nb5bhbJDDHrIMIx7kxaIMU
         qHkBSlygw9XO9bHSlzeK0CgLlXl41l8YBPwrMCQAz4ifzWfewIvi0nh8z6BSPY72ufP9
         Whln/GoDJFzzyNT2/5j6Sx5tb6x2MRKhHb4PNPCpF7uKwgdqD6WuQO6XjPvHkSt5qNYq
         gHn0yrKNTRrACmfiMLSlTfu/PyOxyDs1TNCJHJB7f8l3hXHoHLBkFG8TdoDPZMlBL3q2
         R2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784732482; x=1785337282;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IUDdFmL3+NA+J1/tlIoHIkJZpryeycSZRENBb+lv4ow=;
        b=V/A/DZOd0ck6MSMPeLIbahXD1Gi76RZkyjnbaed1QHP0MiMeYHJB9hEoYQaHnKTVuJ
         IUcqUMi2A134aG0Hwefqo/SCrrOdJ9kU+Ls72xC5KMLNMXVKG6qqOef1BCeq38Qau6Ux
         X3zd/7V6c+DKZoIHDK64J+TM16To1HNwq27zNiw6QXe/42DAk54c3F+9YY1rsCrBgIHJ
         E6xtsf5ElLHo7RiKxxhnBrS+dymkbQIvEQ4VNtGW1yRpL5nJB1FHf8IA/skvy4MX6YpH
         6MOaA/V8aZvoJXRn6OLawvdGPcTEiEC0KGI0wgven50AYW3b433WOo3aINKfRNOZpNcL
         jeKg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6VsFft/U5/W9n5i5H/6YzFHzSuR84SRgmve4geE6rLLgLU3KRo+6jVLWDSXKJFsm4VO/sLFdgcdTbSWUKQapA@lists.infradead.org
X-Gm-Message-State: AOJu0YyZfWFh3UYf1YxgFQec3ptIEJ8v1XYDpVl0ONRQYBQVCCYFxzOz
	LB7nbFK6ylQ8bfqs1Xf55cyfLGhd6L+O0a5DKhVcGs45QOo2ps29oaQeBM+Y291YBW2KTBT4r9x
	ynlLJNkjfbfawrZWzpvSo3V5EMBrR36x3LTFxYevw
X-Gm-Gg: AR+sD11WvYklFEfGCb8sm5LVSoLtI1ZcGBtSooNYa6oS5ROa2oiynEFyObJjrlCwcB0
	2C09naFNYUWIULdXo+eW2Mtcv9FpGU8x1sOAAsJSoRLIJNa/Op73VnxmBvQ9jZ0RjXxpxlrnipK
	2Z2Y1jdVo1t2XBGE5o/4UnPZWt76YawZ/qvZvsP9+QiccdVDR1Qzq3/imkPHxhWEgp+6VHyiqqy
	eWboTb+xhMhrIB8/ueOJ/tDUiUjyrLxj3Kg4TAgJxdWfyHkq+8g3dEI289ugy9vuzxgqA==
X-Received: by 2002:ac8:5fcc:0:b0:50f:b69a:f4a8 with SMTP id
 d75a77b69052e-527ef057dc5mr8866391cf.7.1784732480733; Wed, 22 Jul 2026
 08:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
 <3046e60d-509f-471f-bd15-3ce78c87500b@yoavmoshe.com> <20260721180950.GA3684684@ax162>
 <180001f5-bddd-4e58-8442-f7ef3c979500@yoavmoshe.com>
In-Reply-To: <180001f5-bddd-4e58-8442-f7ef3c979500@yoavmoshe.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 22 Jul 2026 08:00:44 -0700
X-Gm-Features: AUfX_myRDvh7sB8bTl-K_5M53o7Jc2MxCOtToMgfXS4NBIZfb2fG6H4OMTOIhfE
Message-ID: <CABCJKufhvTxmVm8y7xr4RWWKsoZk0h8UGBnem+F5fknnimaqPA@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_080124_108000_29B2977D 
X-CRM114-Status: GOOD (  18.28  )
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

On Wed, Jul 22, 2026 at 5:54=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> On 2026-07-21 8:09 PM, Nathan Chancellor wrote:
> > Does using SYM_TYPED_FUNC_START for imx6_suspend() make that work?
> > Something like this builds fine for me and I see
> > __kcfi_typeid_imx6_suspend generated by Clang.
> Hi Nathan,
>
> Thanks for the suggestion!
>
> Unfortunately my physical board died, so I couldn't test this on hardware=
.
> However, I gave your patch a try under QEMU emulation (with CONFIG_CFI=3D=
y
> and copying the 4-byte hash into OCRAM before fncpy), and it still
> triggered a CFI panic when suspending:
>
>     __und_svc_finish from imx6q_suspend_finish+0x78/0xd0
>
> It seems like the hash generated for assembly doesn't match what the C co=
de
> expects at the call site.

Are relocations applied to this code before the function is copied?
Because SYM_TYPED_FUNC_START doesn't embed the actual CFI hash in the
binary, just a reference to a symbol that contains the hash, and it
relies on the kernel to apply relocations before indirect calls are
made to the function.

Sami

