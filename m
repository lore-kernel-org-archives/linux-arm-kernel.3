Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43F8CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 21:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1z3g8uO8esjL15niBFprIu3tR1dbGidMoV9Pvac7pvo=; b=P4mAfrRb8GLl2G51WmbEeSCc0v
	axwkWW/Zg0LcV2SvzgaVg+SVKtJZ6THpu8MnUK48rOWnJzcQlzoi30a+MHtLG3hqLnRSKKUwsqGC8
	ZDodBnqzLbGZhGasn/gRIglLwkoscGtqBKJ0wM2YwHvZxfNextU3E6paXwwtHKzbXVFNXwcTQCMuy
	GGjx36H6v3PBlhUpm1TWaPPRUy4RCddjIIR64vBgDAVtLy9/YvEPl7fKF3SOXMRct9V3ERpaY6NIb
	JFqc79xI7sztBPTWPTgs6UwCpDCxpI2D5Sa+QXEbySrBxwxnTEMiUDsR5btyOL5yUXoCbfTYwTRqI
	0vj24j2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBfnZ-00000004eBd-2SbL;
	Tue, 29 Sep 2026 21:55:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBfnX-00000004eBF-02Gl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 21:55:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B46643774
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 21:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8481F0089C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 21:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790718938;
	bh=1z3g8uO8esjL15niBFprIu3tR1dbGidMoV9Pvac7pvo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QW8xiWrSFtSEtFMM6SrWrY/dNJi6s6JFc1yOypboboiiUOBgwagPlTjEy2MVNrHrE
	 u1Xo4HoksZCS5V+MB9UoKJj8lQUJfO4zYuDfFYp5+ypmlYjqzXkRUJ5cN3Y8oxDf6P
	 /+APvPott0EFX9qKhaTvvqQm5OcTd/uLHfC1rwKKOknKPbZXJl45ktfe3nvpKS6Oy1
	 lR2D3t7BOITDNxWFyBSCaTD5hCM8pkPXFioNDSadm0UZ4SjTSDgVOVri6XxXBPUELA
	 uE0f2CVCxg62/vFE/EWmHRNW8FtG0XxBbMUWqvwGU7kHWO3RSf2PE0UqE+6kVloSAm
	 OZ1r4CHe6ODbw==
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c293c683202so685509866b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 14:55:38 -0700 (PDT)
X-Gm-Message-State: AFuF++n6+5yqVsv+hkKrzljcWjM7ikY1wAZniAbXuHOK/dJgqHn53//h
	hd6JHc07fPpcTQtcaW5dMHH5sEt54L38tkbq/gOuFnm2DkvhxT2vq87Ndos2CD8FnbJVIORpo5o
	XdGb4gLLGOJQNs+WK9Tu//AJqNMp6Zg==
X-Received: by 2002:a17:907:6d14:b0:c2d:c414:904a with SMTP id
 a640c23a62f3a-c2e15e9addbmr58187966b.17.1790718936887; Tue, 29 Sep 2026
 14:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260902124018.606544-1-marex@nabladev.com>
In-Reply-To: <20260902124018.606544-1-marex@nabladev.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 29 Sep 2026 16:55:25 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKDniU3VYaOuF-OA2_JmOaKEtdOtxGAtyJfFCLnT=LjSw@mail.gmail.com>
X-Gm-Features: AclHuK-k3vl-Wx1oL4KqfwQ_ykCOdKhQDjWBszDB17DIngfFFXqkn-ItikX0PVg
Message-ID: <CAL_JsqKDniU3VYaOuF-OA2_JmOaKEtdOtxGAtyJfFCLnT=LjSw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: stm32: Document
 st,stm32mp23/25-syscfg subnodes and cells
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, fabrice.gasnier@foss.st.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
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

On Wed, Sep 2, 2026 at 7:40=E2=80=AFAM Marek Vasut <marex@nabladev.com> wro=
te:
>
> The st,stm32mp23-syscfg and st,stm32mp25-syscfg can have subnodes, which
> represent the USB 2.0 FEMTO-PHY. Document subnodes pattern properties and
> address/size cells.

ST folks,

Can you please pick this up. It is introducing warnings due to .dts
changes you already picked up:

      8 syscon@44230000 (st,stm32mp25-syscfg): '#address-cells',
'#size-cells', 'phy@2400', 'phy@2800' do not match any of the regexes:
'^pinctrl-[0-9]+$'
      2 syscon@44230000 (st,stm32mp23-syscfg): '#address-cells',
'#size-cells', 'phy@2400', 'phy@2800' do not match any of the regexes:
'^pinctrl-[0-9]+$'


Rob

