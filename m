Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9ABAC83029
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 19:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beR3gBnMegNXmfOxcSKlnP3s1NNAUYnmJTdUmJfeEZ0=; b=w9HXyrvQxMnU7lm6vSu347Wqu/
	Plu5KLWg180hwkbHKqVgx/p1iJrYfgQnBYeFrycBPQpFftKiQHt1C59HQG3a4vkAR1U/ndOp6Jvzi
	BiWr8nvKXgD0+8efxR9xkHhH7TBQ/j5ngIIp8VdH0Reck33Z9bQ7/hP0FjcfpeG+DYBkicJNTVklN
	sirZTwdX3un1/vYOG1nsAPCO9GfwzaZltQ5CCu+Wp2jl3tMIkSUNkNuO/9dyKbea4WwDPDtyj+BdR
	gQxyYTi9ogRxK0EBdfZafe0RTVtPUvOpY0KxoMPULbTF/h+y1kLEMev2/Md6ogvdJWkAy8ks7IkaF
	XnpG1bXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWKIu-00000003JHe-2ZiN;
	Mon, 30 Jun 2025 19:36:36 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWKGY-00000003IgD-2GAJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 19:34:11 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-553b16a0e38so5278096e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 12:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751312048; x=1751916848; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beR3gBnMegNXmfOxcSKlnP3s1NNAUYnmJTdUmJfeEZ0=;
        b=Jmi4Ju7KsFbTWOEp8MYzOoOzLpGG72YskmdSZuxSftjymfg8XX2vk9SNFxn6GCOXVw
         5azcwBDEjbAKbJeCo5ppN5P5259+HexO9ePmH7IKeqZnTn8LsJGIRqlYJtMcX2Bg293y
         h7K3EVKeoiZbj0LNenJvQEgiJIHIlNZkrHTICFEvz72Ts3Gar6XMPepHedrW/LFnZ/42
         R5JUZqmrVK6IMcSF37bAuTFVbi9xfRFMVKXJ7SSBw9eGAuewJSEidrkitXrFN1Ipg+eu
         eCvqtd+U/jUrQyBnjT4pjJjlCLnHg/s1I0PynYIzXi3OM2Td9JDdjMLfe33Nyw6TUcko
         WGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751312048; x=1751916848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=beR3gBnMegNXmfOxcSKlnP3s1NNAUYnmJTdUmJfeEZ0=;
        b=jsAyUXZ9CAF5VmaDwjDOw/Al/8AmPDmhciqAd31gx+ClOTqyL9RS3Mci2NqMVBEtkX
         kM7oxhD9JOl2ZqfmerAE1hPI6G3DpAeeLsl5/dCVUTjdJmiRPBAQq38c61s+9FOYsv7I
         NUm6NoSMEuWC/m8prKTw9PYtKRWh2isAoYqoCVoX+oHHCw1xe6SY0sr8D+xXkynhfARJ
         Df5RxCuUAIHQtKNpiFMhMVIfR5Zmn6oVrZNCXBqYnUZn1HK5yjCn6H1F4kG96ji2t/Mt
         w83SF6sNkoD1kpjcJGc2JPdsQr9iAuTgtsfcMJoXBjmb7CTg+++a5OSahKVL4f84NAoX
         kWXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVb/lVpmmjcT04B1jyz5kIeGboN97e/y1OUEnttJ9mC2T4bNPCJDiMbJ5i0kqe+LSHcpYWlcibWKyqOKUACuZl@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1pIFB4NZ8uz54Ea2pxNH6Y4xLtY2iiEJ2XnIY331cDO40frYd
	AwXxjsxj+ztAEKP+8K3YV/g4FmDPsjRZN9M+kHQJtflz1FDMbTTHva0HNnNbJC6qIC38jbCjdpe
	p3o7gk2D+5UUaAt9O/XFZSeV8zUX1/44=
X-Gm-Gg: ASbGnct002OGxQDnPBFLUdTVRBjmy8bqPZIJOF6kXokuYHlToQKco64oSOXy9vdlNwa
	xnG+8vn6tp/bMsw9TfdCTAixAhFdJ2k0t933Sr+TraZfjH8triRWUw3wrDX/27aLSVoWUnFuLvd
	1cMp5/uq4GVWuubceyAD2S9o9VHO4wwrZXCu9Y/b0K+zE=
X-Google-Smtp-Source: AGHT+IEcZloFG6l4jJ8cgNCYeXgOddz00TihtZjrzR3EcWyur1s6dsDtIuhCgF2HuMdXrYLuOyWPUJEpBwohJWSq4fs=
X-Received: by 2002:a05:6512:3ba5:b0:553:d444:d4c4 with SMTP id
 2adb3069b0e04-5550b9ee2b5mr5103562e87.50.1751312048082; Mon, 30 Jun 2025
 12:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-mach-tegra-kasan-v1-1-419041b8addb@gmail.com> <CALHNRZ_7Yv98v83JvYLP2MmUZj+EDPwk7dDDArN4_U5docbRCw@mail.gmail.com>
In-Reply-To: <CALHNRZ_7Yv98v83JvYLP2MmUZj+EDPwk7dDDArN4_U5docbRCw@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 30 Jun 2025 14:33:56 -0500
X-Gm-Features: Ac12FXw5JMTdMU1UgcC1jxmIMzSdOncHyLMk8rYWZi1A362LpDpLt0LTHSI3GJQ
Message-ID: <CALHNRZ-nCGyYTndv=o1NBvL=zH6Pbp=Jkj2CHXtNgwcFzudYgg@mail.gmail.com>
Subject: Re: [PATCH] ARM: tegra: Use io memcpy to write to iram
To: webgeek1234@gmail.com
Cc: Russell King <linux@armlinux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_123410_575869_483C7770 
X-CRM114-Status: GOOD (  18.96  )
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

On Wed, May 28, 2025 at 12:45=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com=
> wrote:
>
> On Thu, May 22, 2025 at 11:11=E2=80=AFAM Aaron Kling via B4 Relay
> <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> >
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > Kasan crashes the kernel trying to check boundaries when using the
> > normal memcpy.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > Change-Id: I27714f45aa6aea6a7bee048f706b14b8c7535164
> > ---
> >  arch/arm/mach-tegra/reset.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/mach-tegra/reset.c b/arch/arm/mach-tegra/reset.c
> > index d5c805adf7a82b938bebd8941eae974cf6bcdbe3..ea706fac63587a393a17fe0=
f1c2ad69d6e5c14f2 100644
> > --- a/arch/arm/mach-tegra/reset.c
> > +++ b/arch/arm/mach-tegra/reset.c
> > @@ -63,7 +63,7 @@ static void __init tegra_cpu_reset_handler_enable(voi=
d)
> >         BUG_ON(is_enabled);
> >         BUG_ON(tegra_cpu_reset_handler_size > TEGRA_IRAM_RESET_HANDLER_=
SIZE);
> >
> > -       memcpy(iram_base, (void *)__tegra_cpu_reset_handler_start,
> > +       memcpy_toio(iram_base, (void *)__tegra_cpu_reset_handler_start,
> >                         tegra_cpu_reset_handler_size);
> >
> >         err =3D call_firmware_op(set_cpu_boot_addr, 0, reset_address);
> >
> > ---
> > base-commit: d608703fcdd9e9538f6c7a0fcf98bf79b1375b60
> > change-id: 20250522-mach-tegra-kasan-fabd0253f268
> >
> > Best regards,
> > --
> > Aaron Kling <webgeek1234@gmail.com>
> >
> >
>
> Friendly reminder about this patch.

Re-reminder about this patch.

Aaron

