Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D604AC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 07:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jv6MlIuZXXaVscNrKeKjACmCF9DaajcuzQUfRu2mAFE=; b=EFnRx/FOrYew+VsnBrDSK+6V+N
	5TlhpI4X+nrx9PuMBCc5mJJMlstBXgeATqRNtuGEL5OI9WhX4FOF85O/aQMR6cNuDq04I2W1Ez4t7
	4JYLjC8P/fkjyn0neKCXDr9RG2eiy5unJvjnyD21J7ezdFhHU3+bcRGDO/VIKmTo/h250JZLqVWWi
	YFhMulrUgA5qvd+86DgA0CuJD4cTuuoap9ji/KWNGvhtUIRSawFsSIzV1qv9ERS5bUbTJNqp/7yfd
	xOPiUXeNkM5hYXVXkQMd57jqdi+oSniXRP0TTJKb7BvXCyMY7nu5DyEu0XE0LG2F5dd0+e1FPaYq+
	5z+g3LTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8urz-00000004V9i-2hBO;
	Tue, 22 Sep 2026 07:24:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8urx-00000004V9X-3wfq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 07:24:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B1542449B5
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 07:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 976D51F00900
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 07:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790061889;
	bh=jv6MlIuZXXaVscNrKeKjACmCF9DaajcuzQUfRu2mAFE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=a5byt1AG2ujcSfM+RR7j9cz1KjAzXibSWOuFJQ/0h/JQpfaz04mxmXP61RUh/aVXy
	 vo1byg+7aGrWooKr9mk5fUUXnHTgA6UgYcPHOPiUrOi+vrQRC+4eD9uZtGKyjEm4Jz
	 i0JBxBub7tvduMTaeuK11Mv3KE1yHrO1C+nY+vAY17a81Lmdz0ol3+6GdWRvEcaPY2
	 JiuKq6V6Ve0DV3k6Fl4ntpxBZqKj9wEw1LGAT9rldh97KmTeW6FmPrbWkFpQQqrNJs
	 e5XXfqwVZrw2FtbY2L8ECFoO7dMl0B4jxHMhggQSG29ZcIZxRCHbTjJhcHoUKmpSy7
	 Yw81U2cuHJaJA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16c81so3247940e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 00:24:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw0J81zX9KQZm0VumY2+U1aGb9WO0m966y9QiJIrWhOkrkYXxwlXbExh1EdCH8ENQ9rOmaIVRcfOiH4/t0wJ5xN@lists.infradead.org
X-Gm-Message-State: AFuF++nRTJrE14xUnHoNBfvt94zWKX/GqLQ/yLXump9952A65XsDl84d
	ep9zdPimkx7cYA+v5m94/wexce2dgWEulvQvyJNVnkpG/eEJpAKBr0XrBMsV9Ec+3OzZKNDz+lu
	tIpwUDJLNn6nuIjzE0xRF8n2W/2ZKkXY=
X-Received: by 2002:a05:6512:23a2:b0:5b6:6b8:1fc5 with SMTP id
 2adb3069b0e04-5b8c18226eamr4364173e87.17.1790061888255; Tue, 22 Sep 2026
 00:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com> <20260921-cv75-v5-v8-12-282ff5d98dda@ambarella.com>
In-Reply-To: <20260921-cv75-v5-v8-12-282ff5d98dda@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 22 Sep 2026 09:24:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLkDOPyStRwtoeUysCCXxOFUs142xw8Cdcm2CCo5MghP7g@mail.gmail.com>
X-Gm-Features: AclHuK_MFbUz-mrJnpdTRjizQpZ1o1JRe1ZMXbr4OoxUHWYI1Yt8b8NWQaKPwv4
Message-ID: <CAD++jLkDOPyStRwtoeUysCCXxOFUs142xw8Cdcm2CCo5MghP7g@mail.gmail.com>
Subject: Re: [PATCH v8 12/18] gpio: pl061: use cleanup helpers for locks
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
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

On Mon, Sep 21, 2026 at 6:23=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Convert raw_spinlock critical sections to guard() from cleanup.h.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

