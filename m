Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77B1CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 08:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vxqqcKeLdquDIj2KN23L6bIhx0QnUrefdPPqJUxyJLc=; b=3LO6RZ6rmKdc+bbm9ydP+pkXKm
	/+BWhpMXkfL1EgYggF0X8pBJBg8sGix4spiSyG9GQFuXB0+NA8kLH8yFsgeH6slLetO9efHfpBjn6
	bUnNkJjgRFftxYpdTv3VIKhb2ihp1QZw1W8VHospMF15dcD2UAYWdRWZ1P7JzhOJ4h3EuxmNPr4gU
	I3lzQeV3hZ1Jy676xCeQnyoswLUrbMbXLlBmIltZq/YtQ0OoWxqxZncdflapgmyx2NJt2WHKUakX9
	yIpqgYE6p3klR0cJjvfrkcZz1c2mgSxM2RMjnhzSopqPuGFzJGpkRb33nXh4AX1GYEDV+fDBAMcO6
	+VZktgcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGY7r-0000000CMbK-1BBE;
	Tue, 13 Oct 2026 08:44:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGY7p-0000000CMae-1mQy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 08:44:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 312DC444F2
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 183E21F00899
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791881085;
	bh=vxqqcKeLdquDIj2KN23L6bIhx0QnUrefdPPqJUxyJLc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JBJto5vs6Ta5E/laTRijxncLWHwZSeMl1+SClQ5oFUvXM0v718q+e20I6pYu0DfxG
	 w/4fRxhonEgkDArXFln4ElPzOKrrcRqsZSUYu2sA4YrUbFnUE9/8M2Nfq3o4T30bj7
	 7Y/IEqCfZlmcDKyap6K5e9RbVvosULTeXnkkcS9NSDl/k8EL2VWgbiClg+50O+sqBQ
	 R9LHUbOIC2nEqLkWIQaNSlkAAQhg8DxTJuWeCljZPmF27WHT31I3sJvHfnzrf0STWR
	 7qmGGRHb0aHs5PSjp7DSOsNQ+xxCV5dpANwf8GOPmcxRC8w8SM1S/g8H3NMfkwoXCw
	 cjAe+fGH6sbBQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so19656091fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 01:44:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwaKgzKDavwEPirsUk2PoXIsg+/IbjAmeHIsZ3XOBHEpRsBoH6BVxImjFoUbw7YmcydbEpojvxSrCvLAdGLb8Bq@lists.infradead.org
X-Gm-Message-State: AFq9FYLUB54KUvadhn0UAilIDtBBRqR+B8lzXQVj2PlFABGZgzxBuVcf
	bEWwZJ/bR4rtuQj3EXNYzmLeS2MmgVRVT9VHDik5WDAnnY3M9oe9cWQFNkdT7OYinST3BvJe4u9
	7N5cFfFVGONCg0gK40KI1JzThuDYgZ3g=
X-Received: by 2002:a2e:be0b:0:b0:3a9:abd6:1ab9 with SMTP id
 38308e7fff4ca-3a9c514fd25mr26402801fa.8.1791881083577; Tue, 13 Oct 2026
 01:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com>
 <20260921-cv75-v5-v8-4-282ff5d98dda@ambarella.com> <CAD++jLmKF5XxHsJX29sdXC_6JHKn-7HkE=N+TKtk5xODtQj3_w@mail.gmail.com>
 <b2256847-3ec1-47e8-ac79-ceca86eb09e7@kernel.org> <CAD++jLkrXXg9xrhAZ8HETc5Qcv5BbkY-ibjvzBmE5WZVqDEGWQ@mail.gmail.com>
 <a0eca34d-5eb2-4730-b8c7-0f2302bcf265@kernel.org>
In-Reply-To: <a0eca34d-5eb2-4730-b8c7-0f2302bcf265@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 13 Oct 2026 10:44:31 +0200
X-Gmail-Original-Message-ID: <CAD++jLm=T-U07vAVCogMnfOfkDf=i9QhGGc8ok2N-ZUh50WLNA@mail.gmail.com>
X-Gm-Features: AclHuK8uOkUyYpjHvZrw-87c6Tq4ZbkYSTxyMDm1V9n2PMOjyOCFsNCXto0ZE_s
Message-ID: <CAD++jLm=T-U07vAVCogMnfOfkDf=i9QhGGc8ok2N-ZUh50WLNA@mail.gmail.com>
Subject: Re: [PATCH v8 04/18] dt-bindings: pinctrl: add Ambarella CV75 pinctrl
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: longzhao@ambarella.com, Arnd Bergmann <arnd@arndb.de>, 
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
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

On Mon, Oct 12, 2026 at 9:08=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On 12/10/2026 09:06, Linus Walleij wrote:
> > On Fri, Oct 9, 2026 at 8:17=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >> On 01/10/2026 09:03, Linus Walleij wrote:
> >
> >>> On Mon, Sep 21, 2026 at 6:23=E2=80=AFAM Long Zhao via B4 Relay
> >>> <devnull+longzhao.ambarella.com@kernel.org> wrote:
> >>>
> >>>> From: Long Zhao <longzhao@ambarella.com>
> >>>>
> >>>> Document the CV75 pin controller binding using generic function and
> >>>> groups properties for pinmux configuration.
> >>>>
> >>>> Reviewed-by: Linus Walleij <linusw@kernel.org>
> >>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.c=
om>
> >>>> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> >>>
> >>> This patch 4/18 applied to the pinctrl tree.
> >>
> >> There is a dependency, you cannot take this patch alone.
> >
> > Oops, but is it a DTS dependency so if none of the other patches go in =
through
>
> No, it is a bindings dependency, introducing new DT bindings warning for
> both your tree and next.

Is there a problem with the bindings patch itself?

In that case Long can just send an incremental patch to
fix it right?

> Your tree is fine in this case as long as next
> is also fine... but next is not, because that patch did not make it there=
.

But the patch is in -next?

~/linux-next$ ls
Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml
Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml

> We cannot have any new DT bindings warnings in next.

I guess I just don't get it :D

To me it seems like a fairly normal situation: ACKed bindings merged
together with the driver, no dependence on anything.

But if you tell me "revert the patch" I will simply revert the patch
because I trust you, it doesn't really matter why.

Yours,
Linus Walleij

