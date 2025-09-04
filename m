Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7F5CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8MjxXtUVklH0dAHWxRN1vQ8ydXwrQhADRfamwWuTLM=; b=eCXXWKFNl5NjYnbFATNROU4wa8
	TPV23L/JtKh/OwlQ3yewI3NOCtj1PWMR1dwgfs7dDfmlYY2ZgOhQ619ml++jWRHk6HE/GFgo97pJU
	ZpJR1HARZLOGjzUw7PNF+lWKj2NcDvHqvhRjc0joGWQJzsxC4FPDaaEL+hsnZsxSgW3v/89V1MujV
	M1JZdwB+Z6Gz3qU49CflUeOQ25P+ZDtxaUOmZXJVm+cVaKlatZ1KQkcdW4xZj4b6tUR0zTvG0fYjW
	tU7HzEC0e4bSsCBAmn88jiRDDxZVkAQfsmW4OrPkcNRVfvrrjlVJL2O/+ZtcRA1iGHeY3lxVMxrDH
	JIM7X6Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM1k-0000000FzcE-2naU;
	Fri, 05 Sep 2025 02:18:12 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFI0-0000000Doed-3NZ5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 19:06:34 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-336b071e7e5so11925241fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 12:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757012791; x=1757617591; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8MjxXtUVklH0dAHWxRN1vQ8ydXwrQhADRfamwWuTLM=;
        b=Sgx/+hpPfpEGOkO93uh9lxSfhmcEqu2ipjTK4rrTDb2Cn3mKYZC+h2HZGssdJWxi2D
         5jP/NMJ9NJbzytM28KMw09NzTjvudJ3WN/zI3Ut7CrtSSnfneyPYLQYUGTlrv4spRuTd
         rntlzssAwOm9bPJiJ0AwaFbmWodfwDRSG0kehcCuiZvWwdtB9Hkoztdg0rLh1ICFR+nn
         OMS3VMOD4Aw0gPtiheT3+k0buz2EF6hwVBE8LvlX6AHJORXMOokjad0E5fqfWH7lxDPP
         U10fY6DfJdO0pNavmR5TpaNFpvtWm/4fcijOw3N1mh7M4aYXsJKlThK22gYPEKC21G8i
         W5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757012791; x=1757617591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8MjxXtUVklH0dAHWxRN1vQ8ydXwrQhADRfamwWuTLM=;
        b=FGeU9bL70rRLpWDUfdcb7A1I+GVuq8FUTO2r1dhCE54nUOQZGmnbs8AvOTIK9zU7jh
         d8GYXxeIaxQemqBkWZwfhbrLCtntq8oYuuFt6DsF4ojr5Z3HIhhnecQDhe2t5MZNx+8V
         O1uV/aEazkB9hMDIRvBdJWEIOnJ846+LafF6a1NI580RKH9l3HKd41pyO5vu6SHOukKT
         OpdbVpMk+6dA4v4zGVYr3PdRHVBW8icyJpt/cbP2L517a6+/z+VyHRdy8K9tXNhNuyhF
         KoiWR8hxjOhV5ZRGfuBJrTINSzFdjCA47sj1pJhIpsIqbtj8HAq+n6EqPU5gsirsuR6k
         i2sg==
X-Forwarded-Encrypted: i=1; AJvYcCVYcOPhyu4K0nTfFFqFmeQWOdNT7TwenT4PLAawS7EvcxAhVKjJNY1UDPsO564vv7a7zYpPIroP4Aufd/ECgB8N@lists.infradead.org
X-Gm-Message-State: AOJu0YzwRxYHlkLMDhxH530wu9Z4z4nEIVCcqqqn0R41/6EFVYT3QfzQ
	6Z/VzLQ1SkMfh28s/5rLtMIAph8ZD1IrEBwEMnaoAV5CMLVhYXbpCteB3SUCKmIJb1S6nbmpUlH
	2BfemPw+faaxOA6VrGMhnUf0NyGcigMHPl4VoHl/OD/7sSWz1soTV4T8=
X-Gm-Gg: ASbGncsQWD9dsi8hld3j+bVOOUCy4mzKgi3urpVEf70io411QIl4KGopCkziWMvxs9g
	VgjbS+sUeeTwmsaJIfkFOKXcbI6PC+o1eoohqaZTh6OcfjSjvCrT6eFPeO42KJdxkGgp5OV0ZDK
	IRoquKnD/+IKmErvn0HBXX+IamYHkoeHVO0F+S711wQgfrAVfxuddqS0CkWPcIja1zN/FQv3PgK
	8+9bgE=
X-Google-Smtp-Source: AGHT+IGQH/PqV73GnQj1gc78jLR55x1NcYKC9gSDDsK05XB+udjTt+5qVTTdpbxwzQgx75sT54Y3S3UlxUpqsaEdbyw=
X-Received: by 2002:a05:651c:30b:b0:332:57b8:92e1 with SMTP id
 38308e7fff4ca-336ca91f4b7mr45915291fa.11.1757012790724; Thu, 04 Sep 2025
 12:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756372805.git.andrea.porta@suse.com> <bee7c98a96c7000db32495b94ebae2ea06fe0e77.1756372805.git.andrea.porta@suse.com>
In-Reply-To: <bee7c98a96c7000db32495b94ebae2ea06fe0e77.1756372805.git.andrea.porta@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Sep 2025 21:06:19 +0200
X-Gm-Features: Ac12FXxjoi1bttOCqRb5EV_-cdL8742aaHKH_Qm1fm-mp06Nu2uHA3wUPt3kP7M
Message-ID: <CACRpkdY82ohgX_7YP16DJrzDvxMHcSu3rW+UtEmrP0AQiD_Exg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] pinctrl: bcm: Add STB family pin controller driver
To: Andrea della Porta <andrea.porta@suse.com>, Peter Robinson <pbrobinson@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	florian.fainelli@broadcom.com, wahrenst@gmx.net, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, iivanov@suse.de, 
	svarbanov@suse.de, mbrugger@suse.com, 
	Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_120632_843854_6A761D91 
X-CRM114-Status: GOOD (  11.14  )
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

On Thu, Aug 28, 2025 at 2:45=E2=80=AFPM Andrea della Porta
<andrea.porta@suse.com> wrote:

> From: "Ivan T. Ivanov" <iivanov@suse.de>
>
> This driver provide pin muxing and configuration functionality
> for BCM2712 SoC used by RPi5. According to [1] this chip is an
> instance of the one used in Broadcom STB  product line.
>
> [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@bro=
adcom.com/
>
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> Reviewed-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Patch applied!

> +config PINCTRL_BRCMSTB
> +        tristate "Broadcom STB product line pin controller driver"
> +        depends on OF && (ARCH_BRCMSTB || COMPILE_TEST)

I changed this to (ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST)
because Peter Robinson told me the Pi5 needs this driver too.
See commit 1d99f92f71b6b4b2eee776562c991428490f71ef for details.

Yours,
Linus Walleij

