Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D381D42B82
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 14:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ql5/OKsbhCRGC+TjvKU6nz87yy/8T4b/JQ6aAxR4uXU=; b=xEqtn7JBAnoM0//l1YM3ncHsmW
	PZKd9mu4S5eakLg1Z3WIYikdwn/85k+8d9cU09BQ4R0pe0IJk/0su8ot1FulIU11Voi2J4OV/wdmI
	R9gMWC2kolMHCZCZ+Vi9gxSdV1DqQym6viaOYpPvAT7wYIKN86VERaZgnJM5Zjsf82PaVJOmQw/QF
	qFYZ/doP/S7S+SN/TIAe64XysmpGIO7DIeRhYiOQ6HNhUkSL2i8g1LSS9cLJtk5HR1jZXoFTArVSA
	kOZZw0rrvf+FoaDQM8c9yT954tp9/Q3L76K+kcO9/P1tVAzfmeZR7K7ROLj8EYTXlLj2LBhwVhpdc
	59NR/7HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tArTQ-00000003gMy-2q8W;
	Tue, 12 Nov 2024 14:02:28 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tArPh-00000003fjs-0InR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 14:00:35 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2fb5740a03bso50376291fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 05:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731419915; x=1732024715; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ql5/OKsbhCRGC+TjvKU6nz87yy/8T4b/JQ6aAxR4uXU=;
        b=LgLNFg4q8e9etMZai+cv0bFAJKb4od+A65o8OH73GFr4xJVNm2g1aFxWArna6xc5U1
         ZCzdPnYL3a8X1a+O6QrrXBgOlSkO+yO+sIM0fRENadukMYBPbrzvNo07p82tHbPSDR3B
         ZEy30G+4PbYV8Bm0XYB4Dw9fwoACLOht8ySKr9NQDIjWPAefqL81EfVMpfxd26zblIcS
         zTDZS+RovGpwfoQ2rdiPOR1XFwAZ0C6MpHf406rWI8kgLt2sgUgoQNGbwnSiyqyPVlPd
         DfUO9BzC2KlT3qVUUf+Fuy5cER/5S6BYEDRo/cYw0NWkspQAYs86+Oayp3T3pXcd4qHr
         AsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731419915; x=1732024715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ql5/OKsbhCRGC+TjvKU6nz87yy/8T4b/JQ6aAxR4uXU=;
        b=pwpRnWCYTXyjfgT6cllaC+S9yejUvjtCm6mJ8D8gZ1XeVRXeJaYpz7wUE7+x/uJreT
         gguD/HWsAvoBfo+8Z9KnaNrml/NX36ueKDymUyBMjnXr5vm3Il2GCHiOzX6L+9dpARvo
         WV7DRDbTI62mDb8jzo0/vqSg1MySZ98HR3i7TjhdS3ft2hiY8nR2zdIRPQH/jfFiIl5T
         bhZF1YXPLvvPQdpLKydmOH+20Efy6RUh+YOt2WJYk/hPR/MwbGJhu/exnpeY+NiyblU4
         Ar8KkawJ5I7+jYj9tRga1/eoWYLSaskvB9tZVWjq9OG0fdFbmy+LTIRq2P7/S9CdhO4z
         dJbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPPQndDSiosC63Mg1PA7olO4LrofhS97lR/dOhWZF36UHPQkremKhfBsT7Ko4/ZyMmnCkK9Y/PX8NJeRUlEcDo@lists.infradead.org
X-Gm-Message-State: AOJu0YwdnEcXHZL7l+9MoaiQpl33rirCuIWF0KU2I+ScUFgFdELRTbH/
	sbIoHREchMYcVZdGPwbFbDTuzkPlhBcKf5nqE8E0pozd+Gz/1sTpiO0N7BUmHtsupTcrATbrbPR
	eokoWjaNBf7RpnpIRkQcoU0dEKPt6zkYs8Ck69Q==
X-Google-Smtp-Source: AGHT+IF5ZzhSMHo7roWblINijOdf+VrBxTtf6EBdrhI3dsu83qIH6XMVm44eCyZHBj8qKx7cg0CTQJ+sicXK9UTgJwE=
X-Received: by 2002:a05:651c:b2a:b0:2f3:b71a:1e91 with SMTP id
 38308e7fff4ca-2ff426ba42bmr12432921fa.17.1731419914734; Tue, 12 Nov 2024
 05:58:34 -0800 (PST)
MIME-Version: 1.0
References: <20241111233817.2f824c19@foxbook> <ZzMsMFNSHLOKEeEW@shell.armlinux.org.uk>
 <20241112114556.11abb7c2@foxbook>
In-Reply-To: <20241112114556.11abb7c2@foxbook>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Nov 2024 14:58:23 +0100
Message-ID: <CACRpkdZsS3jHoX06F_-_PaQuxLqyYM+VmfwJ1dkYob1O406emA@mail.gmail.com>
Subject: Re: cacheflush completely broken, suspecting PAN+LPAE
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_055837_136126_016D30D3 
X-CRM114-Status: GOOD (  10.21  )
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

On Tue, Nov 12, 2024 at 11:46=E2=80=AFAM Micha=C5=82 Pecio <michal.pecio@gm=
ail.com> wrote:

> By the way, do you know why it wasn't broken without LPAE? It looks
> like either those specific coprocessor operations somehow bypass the
> protection, or maybe all of PAN is a big, expensive no-op...

PAN is supposed to stop the kernel from reading or writing into
userspace memory and that works.

Nobody really said we can't flush caches for some random
userspace memory, and so, that works.

It's what we call a grey area.

But with the TTBR0 thing for PAN on LPAE we completely
disable the page walks on userspace pages from the kernel
(unless explicitly allowed) and that means this now also blocks
cacheflush, because we can't flush caches for a piece of memory
we don't even map.

Russell's patch looks like it fixes the issue, I was gonna write
something similar but he quickly beat me to it, so test that!

Yours,
Linus Walleij

