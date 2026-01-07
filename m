Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F75ECFD642
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 14:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vPUhQO/bJfTutZapkC7lSFc2q9gKbGxYafUo+Xs/Plc=; b=chJTtyUypAeMan4S2m1Max/+Et
	+KEh3zzMbY2MKsR1+FSRKXsi9CJ4GF7sHXHZtemD0FFmXOgzhklNJw1ZCt0dna8YB0x+okK1FP2J0
	qbJ1djU9a/9qYyV+RzyHwTs03BqShLl9VGXXh7cGHSbN8k0TWHEcC3mGewd0bQQxAPOEKz7DJF71G
	FbbVk/DLHA7cZmjI8w+hbRPrdqEP54wygK+9vZc7Gur2wsRYjDAlhZI6MpBAby2Pwbn1prY8eiqjY
	eMzDyxBTpOYZmYwnbxI94fiR+KaRcSz1SgL78O8tmgkm1rOzYsRkmYUzOee1sjbppmEop9skRHmsF
	Lu+akdqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUI1-0000000F4Br-2N7z;
	Wed, 07 Jan 2026 14:13:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUI0-0000000F4Bk-2gUv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 14:13:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 05B8660145
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Jan 2026 14:13:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8190CC2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Jan 2026 14:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767795211;
	bh=vPUhQO/bJfTutZapkC7lSFc2q9gKbGxYafUo+Xs/Plc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LxpUqBSCaEAFNHV6ZR13Wn3sVba/mylY/cSyRWIVNUjJyQ/RoL2O7Frk4XVnmTaI6
	 vpd/fm7mnx9aKY8DUWFStsaVx96N3/iN7XssR5fP01+onZCKHcsqc59yZblqX9pgV4
	 Xex8vwgsTKZ3+SE9L71+KngoiVZDI22HXt12ahm2rPXifUB8KukHkK5H2stkGnlQQz
	 +FyfSWpuD9PRg78RPTSKUxL8KPaFOEICqu1pGmm7sYCQbyJ/EfmiLFvmft1A4YMDzM
	 nO4jM4arQQtOSNxk9ykJ3we4r3oSkwD95uoSJNoq8dXTHJb+akI9ZpTQyCGGtUdjrF
	 7D7vZG0+yHHTQ==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6446fcddf2fso2293906d50.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 06:13:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWqk7gHTRDLnuKO2DIBLv5vYF3RApkOeCfGqkggHGFnx7j2c0eGUo0U88f6ESnfsYV7iM17U1O3chQyycmU0Gna@lists.infradead.org
X-Gm-Message-State: AOJu0YxI27iawDp/R1bPQ83O2AlG2YgHfBc0n+eCZRqcTBo0i8FIObRs
	FeJv0q/oc11nC30DSW7ENJGm4yEJOaPFTdYcNkVp6CSe2LbkUnmF9p2fUpkKJ3XGRBfTPHYPiPe
	NMEoXBsdqSUMvFc2pRwKiFWaUdwNOfZs=
X-Google-Smtp-Source: AGHT+IFpGRYBSvGge8PYFsRHSqJMEhcXggZW3h16GPs6+Lt8GMfLw75OX8+1p8hq0kvPo80jSxwj1LTh08lAgBDlaLw=
X-Received: by 2002:a05:690e:1248:b0:645:581a:df8c with SMTP id
 956f58d0204a3-64716c4dfb6mr2253264d50.91.1767795210728; Wed, 07 Jan 2026
 06:13:30 -0800 (PST)
MIME-Version: 1.0
References: <20251225103616.3203473-1-wens@kernel.org> <20251225103616.3203473-3-wens@kernel.org>
In-Reply-To: <20251225103616.3203473-3-wens@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Jan 2026 15:13:19 +0100
X-Gmail-Original-Message-ID: <CAD++jLku5_fyDXw+uJ8Gj_1nQxjq8egOh60X1ARGC5dmFAcV+g@mail.gmail.com>
X-Gm-Features: AQt7F2rAHH3lL_5LalTawPfcgjclmbR9cTZKvz98Rqt4039YJlca5QQ3lCXU-dQ
Message-ID: <CAD++jLku5_fyDXw+uJ8Gj_1nQxjq8egOh60X1ARGC5dmFAcV+g@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: pinctrl: sunxi: Allow pinmux sub-pattern
 with leading numbers
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

On Thu, Dec 25, 2025 at 11:36=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wro=
te:

> The pattern for pinmux node names is typically the peripheral name and
> instance number, followed by pingroup name if there are multiple options.
>
> Normally the instance number is directly appended to the peripheral
> name, like "mmc0" or "i2c2". But if the peripheral name ends with a
> number, then it becomes confusing.
>
> On the A20, the PS2 interface controller has two instances. This
> produces pinmux node names like "ps2-0-pins". Make the sub-pattern
> "[0-9]-" valid to fit this pattern. Avoid having to confusing "ps20-pins"
> name.
>
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

This patch 2/4 applied to the pin control tree.

Yours,
Linus Walleij

