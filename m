Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40A5C5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 10:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHXxQrdPyMQV1j9h53mmteeq4E6nsKAgQweLk1l7yi8=; b=O87QQWM+UDveEm/pFy43Tyqn6u
	sMcLN6NceUqoQfrDK/3h1pNuSUTpbEgWE+dJr6Eb5Rj3gLKCDYEjwKBIiq3WwdzglfwWT3zzM14Ix
	c4puHj9iewqkRd43DaLGY8VK9t7tQYIds78J+V1gAgpWEiO5blIEJnrWE4PESGWRp8IslHWLC+YkA
	uemsnPojD0CF6g2aFoIkGsW+Pz4Lctps6j5x9zeqYZJD32ZmxKuHq/sqq1hK9cqeQgjtkvm9ivwE0
	e/a8apPVQ7m48W6yd/cwPmA0VJBL29NIJWa5ZfrzAiVMvzSHqbAqVcAeFo7+2IZtJJGKh8ZLkV610
	qJhsEPNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwd8I-00000009TFu-2Azi;
	Wed, 19 Aug 2026 10:02:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwd8H-00000009TFR-0b0J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 10:02:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 70BE743F39
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 10:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A281F000E9
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 10:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787133772;
	bh=KHXxQrdPyMQV1j9h53mmteeq4E6nsKAgQweLk1l7yi8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iTsQ7SVDmjpOMkJyIMV0UDO+IqH4FuS7KPhqaAa4SYZimwGrefrY7KS5h1KnX5p37
	 TGAiiFqPjHXrrez4p0hcfEvh9qKS/YfLTgb1/QygVgsvPDAdkkkZuWl9cFjhh3jjdC
	 twFSyAkhjdCw3zdHtHpwSg+SJOev8Ini1WxjcUVzgcesTpJQhvfuaxbPuwUDGa6q3R
	 601HeuqK60qAETdXnyz8jtYvOP9nnlY1qrW47rs1isnZaXD8RWKWUE62v/7CaMd6wY
	 EAEAXhcAeBceiRdbxXT+Y3hAgM8c5w9KHrG2i9eA4Wgs/F9eSOGkcrnBlcZrCLCCLb
	 1F8TWAyZ1aMqw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b00d083818so1926467e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 03:02:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoBrniGGmCLSvW70ketT+UN2YRpUc7+PuuWL81u4mkvyHaBY90HFTF69H9vOxfGysNg3bKlUbyCeZR72hJaZwm3@lists.infradead.org
X-Gm-Message-State: AOJu0YwBHrYDjYDdevzY9G8qTtIOod4INJuoCayAV3ryIPzkeQeWbqI8
	IdD99tSTYM9fIjuuEYcuXhHY4y+RC+nBkv1T2UPg69GT3ZC3Rul7BC0Jni25FnE+wSUaMP0yV92
	65bzcwgWcqrUfEDN++QSvvvNe9XTi7xk=
X-Received: by 2002:a05:6512:1284:b0:5b4:5a41:a8e6 with SMTP id
 2adb3069b0e04-5b47868ba2fmr768992e87.12.1787133770878; Wed, 19 Aug 2026
 03:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
 <20260818-cv75-v5-v5-5-7bbb12f0360f@ambarella.com> <CAD++jLngqGzethEG5Hx+oAPzZoV6rvWNGXYaycFFkDz_dXFz=g@mail.gmail.com>
 <7b258258.6f41.1a01943e97e.Coremail.zl020895@163.com>
In-Reply-To: <7b258258.6f41.1a01943e97e.Coremail.zl020895@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 19 Aug 2026 12:02:38 +0200
X-Gmail-Original-Message-ID: <CAD++jLmf9_kp6b_eL0hedyhZLvzdVTXNDe_AtTf1pyhojdhTmA@mail.gmail.com>
X-Gm-Features: AcwNN1X8jEhwleIm8t1lo_bZxTU0D9zLfJvN6rMgb_5K_Wo4kFGRz26QFUIrtQY
Message-ID: <CAD++jLmf9_kp6b_eL0hedyhZLvzdVTXNDe_AtTf1pyhojdhTmA@mail.gmail.com>
Subject: Re: Re: [PATCH v5 05/12] dt-bindings: gpio: pl061: add Ambarella CV75 variant
To: zl020895 <zl020895@163.com>
Cc: longzhao@ambarella.com, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Brian Masney <bmasney@redhat.com>, Lee Jones <lee@kernel.org>, mfd@lists.linux.dev
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

Hi Long,

On Wed, Aug 19, 2026 at 11:05=E2=80=AFAM zl020895 <zl020895@163.com> wrote:

> I checked it just now, Ambarella is in JEP106BN as bank 16 / identity 0x6=
8.
> Per include/linux/amba/bus.h I plan to use periphid 0x000e8061
> (designer 0xe8 =3D JEP106 0x68 with bit7 set, part 0x061).
> The continuation bank is not representable in the classic
> 8-bit designer field; please tell me if you prefer a different
> encoding.

This sounds good, make sure to patch your designer ID into
include/linux/amba/bus.h enum amba_vendor maybe as a separate
patch if nothing really make use of it right now.

Yours,
Linus Walleij

