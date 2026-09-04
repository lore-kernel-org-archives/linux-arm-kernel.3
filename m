Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BA8C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 22:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQlciG4UeR6ZpI5LegjbxAmEArAFXIkWdyeVsAKF9t8=; b=Jg1zAdqu2YwvkCGoMGnQgELRMj
	gsZrys2iCAVSogP1x6BRda3UfeQUl7hxnPOeKK+R8b88wa12WWy5fk3Q26jFbeRb94azNJobIW9S3
	Ef4AsMIvxXhUze6TqBDxLGptkbp0zEopxv4zQNLa1P8aPIKKK7Lmu/eOJbIjR8QDKJrBGmgqCEv+M
	dGfFisZLUcaTT4/+BUi5cMB0k2swq4Kuil15ShI92FMlde61oLa+6OyyGPLFKbY5qb6qG20qplkKw
	JQ2t/zuVIgZ7BuuhxjiopvcJUhF3aNygATBkf9MoxZ4a0Lp9/nQzW4JVWUXj6YfiKWY1E3cHXZ/rz
	a0kKUAxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ccu-00000003Qd3-3ZGo;
	Fri, 04 Sep 2026 22:43:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cct-00000003Qcx-2uSx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 22:43:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7515943D70
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Sep 2026 22:43:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592BF1F00ADB
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Sep 2026 22:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788561795;
	bh=yQlciG4UeR6ZpI5LegjbxAmEArAFXIkWdyeVsAKF9t8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lvZK3m739I1TAyBKURTF7/Kb+X2ZvvFj247sZaVM2Y7KEEHO6/yynk1kz7XaKQ59Q
	 ZvCVbI8+x0VTCsi57uE8TkCQukaD+TlAzX49WyMaWQcYOhfEG2nAeOldmX4fLJsqtv
	 4zERRJoM6irlSNSACUu0tj579xmg5sRMUxAWsCiUA4RiNAWBBKAmekItSw4plubse5
	 MnDvkDeFzl3+Q9bcQdKqRsJXwNy3j9e5KJklRJnrpQFdJTvBflUWTrXi2Ufll0eoz4
	 1brvORcXUrICOhRZAtNUhvHABaZTaeMOoBl6pZbSio5rADb2A6ErZ5fIkIdiwmmzDi
	 t23Pc83ITvzPw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b4ae3e201cso1405786e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 15:43:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwBHtsLbWP2KM1HdlNkXP1Ymlp1T8FA5rWbvsgwVjNxc6qs4wOTZekGa8pHkHn6lMUPbW9C2pOxSj+qtDi2JsTa@lists.infradead.org
X-Gm-Message-State: AFuF++mrZCHgrEqWG++UzknVcRP1duTUQIh3tEOi4tAMjf3DRJTiE6sp
	WRUjC/UCs/5Vx7obCSTxheyRCBsL5+yL504AVTAsbmx/bPcqcqjTRzQQynr89rvFhVdbQ4fDVkg
	VmJ6cBZ/t3fg7jthjUI7URK1pSoT49eI=
X-Received: by 2002:a05:6512:114c:b0:5b6:184c:7d9b with SMTP id
 2adb3069b0e04-5b6184c7efbmr1171058e87.36.1788561794026; Fri, 04 Sep 2026
 15:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com> <20260904-cv75-v5-v6-11-e918514cb3b1@ambarella.com>
In-Reply-To: <20260904-cv75-v5-v6-11-e918514cb3b1@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 00:43:01 +0200
X-Gmail-Original-Message-ID: <CAD++jLnxmDmDQn=gYkKMvT1GCYz50kodMTfuxEL2=7H9mKU4kA@mail.gmail.com>
X-Gm-Features: AcwNN1Vycc-Z0L8Av9C-2Ir33TDG5kELHbymgbWMx-Yh-6kR1ncYYEZ285jVOQM
Message-ID: <CAD++jLnxmDmDQn=gYkKMvT1GCYz50kodMTfuxEL2=7H9mKU4kA@mail.gmail.com>
Subject: Re: [PATCH v6 11/13] serial: 8250_dw: add Ambarella CV75 quirks
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
> The Ambarella CV75 UART is Ambarella IP, not a Synopsys DesignWare
> licensed block. At the register level it is close enough to DW APB UART
> that a full custom UART driver is unnecessary: reuse 8250_dw with a
> small platform quirk.
>
> Quirks:
> - keep IER ETOI (bit 5) set for RX timeout behaviour
> - skip set_rate; baud clock is managed outside the UART block
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

This is really nice. Compare the size of this to what was initially
submitted!

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

