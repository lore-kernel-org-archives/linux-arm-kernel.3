Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB7ECA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dCNfmYcGaMILR8c3Q+T+COx/KTeJ3JVks807vI/GCMc=; b=p4ONtaP2Kzc80kM7o/3xqFOxpt
	/Z/OLa5Ejo37QlGgDX8bl0DH7YzpzilbkglBqe/9e+RnXWvkn8jt+ZfMGx3cL1eAaUJRESASc/bsH
	CQux71ZhpMDFZHpm2B3JXpQsFPw50J5OeE8t7PbmwrLxxd87jc2elONEKHs+shigDTjUHCAasovbf
	Uzoi0SfF2onai7zF4i1QazAzdqa3LcyXwMiM2Mx9B52hIqkMljtP0M2d8wMLHlyskO10xnwJN8seS
	za1hHAltGMB3MoqYqbVtZSjdi+4B7HgQ5YH73q/thkJMgxktAHiUTN6c7LQbNZzzWLdWPjg0CGPm2
	I0QVeq/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUmm-000000034B7-3qrE;
	Tue, 29 Sep 2026 10:10:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUmk-000000034AW-47gk
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 10:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dCNfmYcGaMILR8c3Q+T+COx/KTeJ3JVks807vI/GCMc=; b=MgKegORzgUhi45mHs8EOTxp0Kb
	SazIi2n91EKDEuE2Pc5mc7VLAJEf6XEnbiSusXpyi/EcmNarSIt453Bed7viHiIuKALrEl/drgkBg
	BYwI86L8oUFUmiHErRTa9yfXCWDJaMOgl7+2KLC6+FZhGnv3dv8ULbVDezkKGQvLB3MbZy54Ar+/B
	CDI1BgHce7w6tLlLkgOaiqFj1a48yIzvHAW3o5d7j/Zd+s0KJUmdV3kCVHxrrYYrFD/m52KLVmg+q
	pLsQk8aDUfkNcQX+cCy74+UH+fr8YsKyIHvAskF2tzILYc+4V+uug+CB6zp5wklOIXy1cyGkwYd53
	3PN89HjA==;
Received: from mail-ed2-x0c.google.com ([2a00:1450:4864:33::c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBUmg-00000002SeG-0qlO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:10:05 +0000
Received: by mail-ed2-x0c.google.com with SMTP id 4fb4d7f45d1cf-6acae8342d2so947887a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 03:09:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790676598; cv=none;
        d=google.com; s=arc-20260327;
        b=Nje4vyhXDyGv5TEJJP6OVT7Yi0XArvv02iz3T48xfoTDl7X2ZPxyG9cm5nJCV3qZ7x
         42sTbM/KKRrnayifFfvbTVwh++EC41KKkKTIXLz9ZUspeVs6m47e+7c0vx5hm0qwIPWW
         7F2QDve2c0mXxuYG2QZkQtsHKdRYNApo4mT7b7hRwXfDT/3I8g7wuh/H8v1yrtuwVhPe
         O/XNSj56QOv7hLZ+gnbmR/iviaFW93yNfDkJuWtB33Ux0kRrZJpzjTIWwTe8H3REpGkK
         llJlCKjC1zBOyeO7PSsyyiypdW+K2sHt1HjQEQmwuMn3LQm8JYdHTc6xHt/O2YaU6fBR
         M78w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dCNfmYcGaMILR8c3Q+T+COx/KTeJ3JVks807vI/GCMc=;
        fh=qtNtbR/tWhaWlvG8JnNb9JKVaECVBtKWyvo6lJ+mRlk=;
        b=iOVheMk+vzPsCWBWHoG1ZWb2XvkTL+Zy3sDNhuhljreIMcpmTOK4kFNKh60qTnda1B
         z2E0o0wOsXqoM29R3/hwELK1MIc5P/1dx/m9wQyWbzgnHQ+3JjAef5g1OOMCE4yWyqa4
         M1kOd521yr8m61loMpowbTpA+DiEMeVe25mM2YDxzb9L3s6yNK0pUgDQ+FzWCtQGGzvi
         n9WrX0L3Pl++Dd+XOXRlmPpxGxco4ZAtNvaRxLGtKoYg2pMigsn80wYYdU/LaBlURmja
         +E2gBZ0hhLI8eI6IqZFSvcv0hfOcramgXem8k13YYOhy415kqPzvo79hlK+PY2p72b06
         tXQA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790676598; x=1791281398; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dCNfmYcGaMILR8c3Q+T+COx/KTeJ3JVks807vI/GCMc=;
        b=MNyonIdSz9trNGgwzy8c4r1ZAl7d+pFI3ir+ezpNdOj8ZKcEEm9zU5hBTuj6JbtXtm
         AkiA7U8zYzAgR4e/5bQArdrjMSMH46zBmOet/sbwsVt7+XUs3ylnuQzClB5+IUlUB4lX
         Sk4rx0WrNYLxS+tR0HZDN+i4tO0I++Nq7HYJx/VCxCPQmS1dk1ySU0cslMp/w3ve2fkL
         ykOwjHgukvc5/IyBzp7U8X/G7oHqyVvSA/oDBYOsiaVLPORkW9CXWst3t23HuMLamYC1
         wZQkoCUIVfREBfG/JZIWh1Gx7LFKkRcOe/uzjnaT0JXJ1Ye/QBGw6AzlW19UPr4oNG9M
         MdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790676598; x=1791281398;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dCNfmYcGaMILR8c3Q+T+COx/KTeJ3JVks807vI/GCMc=;
        b=qI7jh9EkGdDft2tjZ/E0omWp63FjiNEdxJo5pP+gM7QDNsdCHyUdJVEZ1EgLQdqMV6
         GGqJOwfahNXXHrajEwiB16opXgAqCVX19gb27SWAcnHSvWXcJWDyfrlGMUs3GqjiZQp+
         xfD2DXtRAcRcIAw86Hne1odmwjsrphKpbtnrCKIP2NW9TNJvSDjvHG/1IiCrVoJF75a5
         SJ+zhu8esNO1vKPQ/kVVNfnP7tnivCnOMsLJcyJU/fPgzNT1RQA3MtoLvQH8bXgmFWjX
         vr4mNX0Ouba89XufOvN4lmO1oa4CctBH7dCnZafZ7gyT1WOAVeTku7WHB8DsacfzoDpT
         BpKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIbTinPggFxlygP8kSBBTQiF8Qz952hnNh6w27Vnj/jfla6gY7MdBKN1+zmU70M+KJsnUc5BM2JQ9oP+/yUbnS@lists.infradead.org
X-Gm-Message-State: AFq9FYLo/UJ5ZpyRdtc+MT2hhhJ9s6zGRDKWMTFB5DhW+diE3Ycknkgm
	NS2QefcjTs5lDdzgkwg5PaF1xGxzv8rHzbphcE7FANJIFlJj1dx9vnwGO1sgux5LrHtaurvf9Z9
	UYxzQg1vtM+iBVaYnVT7107ta/b764Tf73m/Vx4b0Nw==
X-Gm-Gg: AYBFou2yZ8yWastON+CWdoXk0j98P0qgk4j6UrbcnNCtrMPKEP8EGDfxINcchTszwzq
	2kFMlf+AR+Xqo+RfDkxgn4uYlULg9Z3OQUZjt0vCY2W9r127DDoZztZtoHfMaczmqQwzuinsk0X
	tywBcCOt/Oi3oeWWL4sMXTwWJdGvemG1s/h5PF5s03FmFGNOqRjdX+69uviiMJjBvW7OuqPbjzq
	dqaIpM025dg7sQe4+HdkTw3/6a3WzpqoP/IESSUdVNFcCzShWo9v7Oh40b028njFyVo2GECGT7t
	FeNtsdooV9v3NQ0/Z70cw9gWRuwthvOHo4teIDhclyivFTV3/Krk/lqWtbmLm12eTDYFJF9jb5m
	lhtLtdB9wNZ96547L065WSCI=
X-Received: by 2002:a05:6402:3059:b0:6aa:9f53:221b with SMTP id
 4fb4d7f45d1cf-6aac8ecf650mr10133940a12.4.1790676598186; Tue, 29 Sep 2026
 03:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
 <179067486422.102650.10176830320558486814.b4-ty@b4> <550a74bc-f0b9-4141-9fc8-db175bb0b1ae@kernel.org>
In-Reply-To: <550a74bc-f0b9-4141-9fc8-db175bb0b1ae@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 29 Sep 2026 11:09:45 +0100
X-Gm-Features: AclHuK9WRHV7MmouzYCiFz5qe8OcNiIlPS3cNCTz_rrKcfw59IxyOBRtgpvUaFE
Message-ID: <CADrjBPo_V1YScLQkgbSrWCaq30k7JoF0GQQ0u5ouBiEipbEg4Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Add Laguna/Tensor G5 SoC and Frankel, Blazer &
 Mustang boards
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	Douglas Anderson <dianders@chromium.org>, Juan Yescas <jyescas@google.com>, 
	RD Babiera <rdbabiera@google.com>, Brian Norris <briannorris@google.com>, 
	William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-serial@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_111003_693229_1A1C4E2F 
X-CRM114-Status: GOOD (  17.27  )
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

Hi Krysztof,

On Tue, 29 Sept 2026 at 10:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 29/09/2026 11:41, Krzysztof Kozlowski wrote:
> >
> > On Fri, 18 Sep 2026 19:05:01 +0000, Peter Griffin wrote:
> >> This series adds initial basic support for Laguna (Tensor G5 SoC)
> >> found in Frankel (Pixel 10), Blazer (Pixel 10 Pro) and Mustang (Pixel
> >> 10 Pro XL) phones.
> >>
> >> Whilst Tensor G1 to G4 SoCs (found in Pixel 6 to Pixel 9 and Pixel
> >> 10a) were offshoots from the Samsung Exynos family. Laguna is an
> >> entirely in-house Google designed SoC.
> >>
> >> [...]
> >
> > Applied, thanks!
> >
> > [1/4] dt-bindings: arm: google: Add dt bindings for frankel/blazer/mustang
> >       https://git.kernel.org/krzk/linux/c/ecf6405fa6c503c34eb4e7e905957d70d4018e93
> > [2/4] arm64: dts: google: Add dts directory for Google-designed silicon
> >       https://git.kernel.org/krzk/linux/c/cf3df78629f24b40cd0cb2da74e3ea4a944bed82
> > [3/4] arm64: dts: google: Add initial dts for frankel/blazer/mustang
> >       https://git.kernel.org/krzk/linux/c/54edd8698bb1fb40c339d0cb2f15baad6993dd48
> > [4/4] arm64: defconfig: enable Tensor G5 SoC family
> >       https://git.kernel.org/krzk/linux/c/63f674fe8a0a8d6e4bee3e72f7ae658f0e9a0686
> >
>
> This introduces new warnings:
>
> /home/buildbot/kernel/build/arch/arm64/boot/dts/google/lga.dtsi:368.37-391.5:
> Warning (avoid_unnecessary_addr_size):
> /soc@0/interrupt-controller@5880000: unnecessary
> #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
> or "ranges" property
>
> https://krzk.eu/#/builders/28/builds/845
>
> Probably you wanted address-cells=0?

Urgh, that must have happened because I removed "ranges". Let me take
a look and get back to you.

Peter

