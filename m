Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7939AC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 22:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C0myiUlgWF0TZd8+Ku/LAy7GnzKeiD52gDwego64hj0=; b=nvYlnX087FYTF6n9zJbRjB1b4+
	rgdOXkqNVClOm4aqD/vETkmaRsCwfGOSQuupf/KjxUmuGIk74zI98ZF2c2pb6OBhPoE8M/qkGTPxJ
	ARjgFqjNVVSoKVFDXCeMR/3RJO3qUB4nXcjl3rdmcbLVb/lOSofAj+ZnJqd5XN7vVuuLT3y99KSRM
	D2BEZRs6zx7/c3bHO5CvtlEcd3wAUYpXms0xaS+Ra+uDs7k6QOjOD9GQ4jauWcDSzwzFRm4cfx0Ln
	oE7A2oQSCITqFF8KBoUWwGI/oDRrST9faePQprcvZcgt/9J3LlR0SJgpRbwRZuZIUeoUH4NfEwqQN
	2DGjkB9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cb6-00000003QRD-0Uzn;
	Fri, 04 Sep 2026 22:41:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cb5-00000003QR1-0006
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 22:41:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9721E43DD5
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Sep 2026 22:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 729481F01559
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Sep 2026 22:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788561682;
	bh=C0myiUlgWF0TZd8+Ku/LAy7GnzKeiD52gDwego64hj0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=naSfCtaR2p6Ey3hc9gr+m0RTXINQIfLmrYVBFP7Zn60Gab+HjxyVPF+1umfmk3kS5
	 Fr7wiAR8LEGRTHb3HOCmnqiyuxt3nQ/6a557N/lDr5ynq2BWNnEO/2J7W+pe7mWFOP
	 g6TP5F3+pAJfTtukPstuEhnN7TNhHLtSoab2pApfrAkX8ESqyAI/JkMUUS1Ns2iTgP
	 6mQMC+O/k3Ntc629UnIZFwKzf4rXE3tkCGbqQoaGgjmntpEpWWMXupYIEJapm38jBT
	 yvghkqGeMeXd4zVrb2u6/MVXLoCOXIPs/BJRcGhZ60zsODhI2HSEA2lrcRjAwOlrAl
	 piJ9BErTW9euQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b4ae0b3308so1089980e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 15:41:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzFKTcmifwZ4UdIxM3WvY3yefEJXl4qxOqbFldpZkJA59cvSxCItmp2/wSjcl0Jz12wp2MWvQH3zVbcmZFUzGL5@lists.infradead.org
X-Gm-Message-State: AFuF++mqu6b8cfqgQZWLW0aedf0EK/OOuPDqung7u02QnYxLuQyhjAVX
	q3H6Zbks11c1sm9UPiW/JV1I/WonDK9bPmKRO8Oj9pzSTokQyd6vJV2kXLXbr/cWZjxMZYiZq8I
	91FbAEInnKUmRbbAZnp8DSbB3fWXiCMQ=
X-Received: by 2002:a05:6512:61a7:b0:5b6:1a7c:aa19 with SMTP id
 2adb3069b0e04-5b61a7cad0dmr907279e87.49.1788561681149; Fri, 04 Sep 2026
 15:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com> <20260904-cv75-v5-v6-6-e918514cb3b1@ambarella.com>
In-Reply-To: <20260904-cv75-v5-v6-6-e918514cb3b1@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 00:41:09 +0200
X-Gmail-Original-Message-ID: <CAD++jLmnkYaXqD7T3ckO7z9g929DvHyuK04j7VKEgVrnF+1C=A@mail.gmail.com>
X-Gm-Features: AcwNN1VDId_JVjT4HuchtPhHSz9zctXg7JmJYfvX8t2TVwOBsWn_VCTazZMrhFA
Message-ID: <CAD++jLmnkYaXqD7T3ckO7z9g929DvHyuK04j7VKEgVrnF+1C=A@mail.gmail.com>
Subject: Re: [PATCH v6 06/13] dt-bindings: serial: snps-dw-apb-uart: add ambarella,cv75-uart
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
> Add the Ambarella CV75 compatible string to the Synopsys DW APB UART
> binding. The block is Ambarella IP with a DW-like register map, so it
> is described as a DW APB UART variant.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

