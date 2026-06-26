Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE9BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 23:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CASER/cI9b9IcBcUdv5RWilxLQkJ9A/bPWjit9BYmok=; b=LtvdrcFlcFwCnbfzlfNWp1xaR5
	caaAtn0U0uuOSl0vdPm/g1tfvO4/iJnIr878azNrQsPJZhwGv1QLUdj061t3JQoQ0UTnfF1iTvhs6
	HW+NpV39GvhmiNCdnXQzxyLQaLXdg/zUEQkl0fffQiHe1xREWtzFSnvIPqa7rel8SXqAuetGZCxhE
	FAIKqtpftojGcjQCx9A+QoKveLhN/pnT5X2/+sVLnxuygWZjSUKY3yGmjqp1S77n0q8xRWP5DOedy
	gpgdGCDMW1TlKy6ZQ+Xn/wjeR3Ikh38ZpGy6ciea+t7GGLIdOszB+idnC4yI73VK27PUsaEVUnvLX
	cJfegAyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdFcF-0000000C0A6-3gGs;
	Fri, 26 Jun 2026 23:05:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdFcE-0000000C09u-3U0Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 23:05:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 80EC1600DA
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 23:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277CA1F000E9
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 23:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782515141;
	bh=CASER/cI9b9IcBcUdv5RWilxLQkJ9A/bPWjit9BYmok=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nYxRBYz2anD9ShSO7oDshQQwChbWmVCxYdnfHnb7G+x2PQRXsCtDBY/C5wQLtSE13
	 FwdnJsi5Fqa2Y6+NvysaWxqd6DcCjALSXRG4+PX9zB7esE/PPWF0VMr0Kp+708WaWm
	 N7O2IeV1w0VWvVSKAsqnwQZ4Gn/6klIm7+geKLdX+l+WF9hYcg2GfCRNabW5kYqixZ
	 sG8fkavFkE34hnnrUkwNf9G26Z+mdMRBLwiA1yykwqjo3B2ecBrAS6AykTlD4iHJ1q
	 MrElwu+8qgZBQj0FAtfpwsT4kglvPaWgKD/aBbjRgd0tc2fTuyZJPbMFV3fnB6w7+x
	 DYIa0Th8oKcxA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39664fe2dd8so8207071fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 16:05:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpAhoFUYss1HHysk8MaQM3rit8//GK72arpvzqLRqsMyvB57lD1rLEMPSciXY497waAYFJSfqco8HloEyx/7Dvv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3zLRAAaNm0TycYSk0dTz37+3WIU0+iwxtfhRMKd0GADri3olv
	c2hu1hq7hy/QUaIrpPLLnx0YaN9M76UsjO0K3XTeMQP81Ty1IPFwUYB2YXVS+wrUymACI7xTsXk
	Eb/EFEleBndwCZCnXWXw9viZwrjXVqQE=
X-Received: by 2002:a05:6512:2c05:b0:5ae:a9ec:bb38 with SMTP id
 2adb3069b0e04-5aea9ecbc48mr295117e87.64.1782515139887; Fri, 26 Jun 2026
 16:05:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260626183140.3499179-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260626183140.3499179-1-Frank.Li@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 27 Jun 2026 01:05:26 +0200
X-Gmail-Original-Message-ID: <CAD++jLks=LP73virVRs+9pF76R9qv0Ccgq7k7YUbptN4gHt8Lw@mail.gmail.com>
X-Gm-Features: AVVi8CcD2cFZ0DbaMYH43Hl9zilL9SByXS-2f9JIaqrnE4P2JDWL4l6YJSprn1k
Message-ID: <CAD++jLks=LP73virVRs+9pF76R9qv0Ccgq7k7YUbptN4gHt8Lw@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: mfd: st,stmpe: document st,stmpe610 compatible
To: Frank.Li@oss.nxp.com
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev, 
	Frank Li <Frank.Li@nxp.com>
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

Hi Frank,

thanks for your patch!

On Fri, Jun 26, 2026 at 8:31=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:

> From: Frank Li <Frank.Li@nxp.com>
>
> The STMPE610 has long been supported by the STMPE I2C MFD driver, but its
> compatible string was never documented.
>
> Add the missing st,stmpe610 compatible string to fix below CHECK_DTBS
> warnings:
>   imx53-m53evk.dtb: /soc/bus@60000000/i2c@63fc4000/touchscreen@41: failed=
 to match any schema with compatible: ['st,stmpe610']
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
(...)

>    compatible:
>      enum:
>        - st,stmpe601
> +      - st,stmpe610

There is no STMPE601.

It's a mis-spelled STMPE610, so please delete the row above and
edit the committ message accordingly.

Yours,
Linus Walleij

