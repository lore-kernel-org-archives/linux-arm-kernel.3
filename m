Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A01DC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 07:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkxwTHhpX690h2pXqhYY+zmBovwI3C9WHSBD9ryCt6I=; b=Ru8wr0i4DNEDEh1WDBJi/esd7E
	VWKqxfEra0OF4FaN71Krnu9Nb58GJYN9LGbvN3L7iyLg7AWy7ax4cLhAsUL3jFc1HZ29kX6rkMrNN
	+sNk2Thg68nFtLP2kBEClQ6ZP8ZnzdStGreP8/Ja5OY7EoXOXqUnfrcCsDLZQHkuoWPSpVEElUf3s
	F9E7SN32z+Lq6w+TkxS0/CBIW6YdJC+YYyF/QxVSOOvfyQm53ntAQyC0tHhHV6TqtS4jHZukTO79o
	3azhD1Goc3Nf7hfyx4u/rt6ShiuYXLOnX7HB6YRoUhIsM+s5Q8lMNI3H/p4WZXFL0vz4XkVksdq/4
	ujJxzhXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwanL-00000009CbD-0a6y;
	Wed, 19 Aug 2026 07:33:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwanJ-00000009Cb1-2qe5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 07:33:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 42F77431D7
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 07:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24FDD1F00ADE
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 07:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787124785;
	bh=VkxwTHhpX690h2pXqhYY+zmBovwI3C9WHSBD9ryCt6I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dpOjroIGI85uGUmiGJs9drYoXJhWNmVi4Uu3qGsw/NyvsqnuNvUgi89N9RNfPYAWP
	 AEgu6FA3sfYXpsYY+Wr9HXu2c8CUR44guutkanr8ETQ64s6zPs4Fh46HEBjo8TPYvD
	 jjXR4/BaPP1E02MEgaQLgH9LhmetQeGWQMYLdCcKPn1/lPeuo0vL87iviG8vq5aFMT
	 7BUbcYev20AFu3U5/liiINcqpf2o06mkh1Gpk22RTGdfBkWjXs6MZ2GSuVFHiDCubn
	 dJzb1UguVvNUKib86ajaYHZEAOcpz6oxmJS6n2q77Tm19iJyblR4R/XacjfhHp7Blg
	 IdoWLK+59joQA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b021916bd3so1029161e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 00:33:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrBVzCu1AQXI77E1ciAdiudbN+wx8jTSIY8VpqhGWYktW8re+Ir+xi19OIgZuUgffqVJ2bn77kZQVSTL1XT03qt@lists.infradead.org
X-Gm-Message-State: AOJu0YyexD57UyPyvUxH+4ZWxp7SdI5yefmbG4lSJCA3oQWZJdIP7Ku+
	GOm/GOT7QTq+s7eoShM+QsQaa31zDoPassoeNjC47z7LnTX2A5SirWZsOoPdMNzkGkMjhHK2VrZ
	PnCaWBG+7lvsvmZBadLuG94fp9afwNXo=
X-Received: by 2002:a05:6512:3d86:b0:5ae:a702:6528 with SMTP id
 2adb3069b0e04-5b478bdc331mr681671e87.26.1787124783764; Wed, 19 Aug 2026
 00:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com> <20260818-cv75-v5-v5-6-7bbb12f0360f@ambarella.com>
In-Reply-To: <20260818-cv75-v5-v5-6-7bbb12f0360f@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 19 Aug 2026 09:32:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLnsyZDBixXMDFUf1+i0ZtYkmzpc+kggn9bx7=8W-gZHSw@mail.gmail.com>
X-Gm-Features: AcwNN1WedvW-uebjWVm_0ycL6wQEG6qNIR9PZrbwX20kSbc79ar1YheT6gV97uE
Message-ID: <CAD++jLnsyZDBixXMDFUf1+i0ZtYkmzpc+kggn9bx7=8W-gZHSw@mail.gmail.com>
Subject: Re: [PATCH v5 06/12] dt-bindings: serial: add Ambarella CV75 UART
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Brian Masney <bmasney@redhat.com>, Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, 
	Long Zhao <zl020895@163.com>
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

On Tue, Aug 18, 2026 at 12:32=E2=80=AFPM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Document the Ambarella CV75 on-chip UART controller binding for early
> console bring-up. The binding requires a single RCT clock input and
> fixed 32-bit register access via reg-shift and reg-io-width.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Looks good to me!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

