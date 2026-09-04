Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2B8C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 22:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJucLNzd0P6My3KuoiulrhmQdmIkKxbJHUvOKpe0+No=; b=RGIo86rX8CWaAFw1RIvjhmnphO
	yTZx2fDQkfog1D9Hz57SknVHjFWsvd7K8j42UA+EsTrTU4bXnU4gXdYJzboAQ9Hsbw2aDMSF8U9s1
	wn50eKCKpj307cRquBbXElixCY8aVjAERN5dAVc6V7R+Xn6hsBZofb0L7xpqwgtSZzLaFA0Onc9hS
	yxI+nTZgJLinQU3jpa3z+4nLqI7STIoqsLLGTI09PPOXbSuXGTV4IKr6ICp9ojsbVLhS1xUPp1nNc
	l/ERnIgbZ4R/k5bR92EGVq0s97r89b4DcDjfr84eU7y3YojdeqOLoQBwVjoFqEOj30qXm7N0WfRum
	93rwGdzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cfO-00000003Qoi-0akl;
	Fri, 04 Sep 2026 22:45:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cfM-00000003Qob-1SdP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 22:45:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B41B56025B
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Sep 2026 22:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9211F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Sep 2026 22:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788561947;
	bh=OJucLNzd0P6My3KuoiulrhmQdmIkKxbJHUvOKpe0+No=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jVI/mE/rXo+KMPVG8eTlFteEXlYEFcXnEpCGJYUJ0OeuSkQzhlR5GBgQJoj0jpPSJ
	 nfjXuO6zPB6jjmxStvbvSzObckbu3lUSpjgzITpfsiL9pVRujBZmQW1qnAdatWO5XW
	 cngHWOc4Jb7QkUHa/2uts9Y8tHkZVlUvsRkR45YkzXkXMx8SHQKaZrs7ruVevXxgej
	 0S7NcZtz8gGLh/tUW3eAUUIDPchoNezybVQByX22dHYPX5jFRgm5y23DOzfvwkRDNI
	 t8SDwlMBTOS/YNXDbIjXuGFJXOKxxUXDp8Gv5ZF3gRAuy8QoSWHvfJ1GA99znB5+FM
	 OZBTTZux/TgZA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aec201b582so1860763e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 15:45:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByKd1czOwLTyxzaPQjRjHkvzoMhRcL71T4uJiPH+ft41sFlVJ1w2Q9OJ06rV6L2OMH7mo3YQtySiGdi53tFS1BL@lists.infradead.org
X-Gm-Message-State: AFuF++kIpZ9xjbhXJjaGVpwR4COK4bBfp9leduSio9agXUHDl8w/j63O
	MHAIn6IVm+ksJBj3LcZhy6UhTshXDdbJQSQcSJbsSedwkcNZpKC/83kkiA//b5P/b066aa+Y14I
	9GJ+pAjEoZOfNmCcs9w8c+GvMvDewvrA=
X-Received: by 2002:a05:6512:a84:b0:5b0:eda:de26 with SMTP id
 2adb3069b0e04-5b616f2f892mr1623422e87.16.1788561946156; Fri, 04 Sep 2026
 15:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com> <20260904-cv75-v5-v6-12-e918514cb3b1@ambarella.com>
In-Reply-To: <20260904-cv75-v5-v6-12-e918514cb3b1@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 00:45:31 +0200
X-Gmail-Original-Message-ID: <CAD++jL=fcS5UpomVcAyg1KXCXFxyQCUG2Mbqj4XG4kCYQS4tdQ@mail.gmail.com>
X-Gm-Features: AcwNN1V7OH90tc_RzF9sI6MD1gO6FdJaYJCKQoqZfbOtKCReNgI1EwM-3lb0Rkg
Message-ID: <CAD++jL=fcS5UpomVcAyg1KXCXFxyQCUG2Mbqj4XG4kCYQS4tdQ@mail.gmail.com>
Subject: Re: [PATCH v6 12/13] arm64: ambarella: add ARCH_AMBARELLA and CV75
 EVK DT
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, Sep 4, 2026 at 8:39=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Enable ARCH_AMBARELLA and add a minimal CV75 SoC / EVK device tree for
> console bring-up with the RCT clocks, UART, pinctrl and GPIO banks.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

