Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50F3CAC5BC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 23:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYuGJU4VUHZh3LQSBZZJ1m72z3IXmhn5eD65/qtg9hg=; b=0DjjbX0JTpK3WJo+sH7vyoqdsD
	6FiwK6jB7o/s3prPaVVUdwrhALkmWEvnWyXj5LZEGWyAaiDcFb9tGFXV7s7kbwfyuiQWiEc/oBxZs
	ImjzNTJtmJ/ab15GsSwl1gyCD39n9U3pa0Mwxbbmzci5NPX8rONz3HCsYVS9DvcJe8GrVXnZt7/Uu
	IaWHpVdacn0m3yIFptwPvuydj3RzPwD0QwEf3pdTVbtEgQUW3GPWbg71V0EHeQvA809iOzyc8ToZ2
	IfwwCqSq+4i1hwC5cASNRVTPPnQbJOn8GN0Tuahy2k632aSmNyjaIHtosrbLqteJFBlBry5j7cKGT
	Xy9wTNDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v313T-00000000ZCC-29N6;
	Sun, 28 Sep 2025 23:43:47 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v313Q-00000000ZAp-2qHl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 23:43:45 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5688ac2f39dso4763969e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 16:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759103022; x=1759707822; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYuGJU4VUHZh3LQSBZZJ1m72z3IXmhn5eD65/qtg9hg=;
        b=eZztA+/+iVrUgcO5ix58IVcLWXT0r+L4ebTNaVsM3H6IBc/8BonldiHZXOOq49LY6/
         3yvLZMLd6ojmHMq4hT9EbPudBksWcjSloCtrhrBXdBQFaJ29ha77mSIFoHrnOuil4LRQ
         Y79ZWR8selgylTkC6tbVIir/mOICNiaeei26EuAFNJFj3Jzuehv6c+U5SpYDYucc7nuY
         vUDDEa4IQV+HWoaFRvXkDxsIkLubrleJXt5lA9TYQnICiHxVPqhwgHPSl/x1BysTWMWd
         xmBgh5ZTy5Dfbi55XKQHW4PEm6w0ivl7P72TQFbdJ7fqFmbXED3AT0C6DKYcfU0h9eBg
         jAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759103022; x=1759707822;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYuGJU4VUHZh3LQSBZZJ1m72z3IXmhn5eD65/qtg9hg=;
        b=hW5i/crNO3B53vCnSplPzrQCcZCsQYPd7GNv2JzsjY+qW80nvNW/2h7Nf4Tpk4mhrQ
         K7WgL/mIVunKJ0Zy9U4eijFDtBOX+4dhKwBY1aBUjSOhLZE79kyZ/JLPWBVuuEz+bhQh
         Y4B/npT/KVZD4jjvmQgFDQWg+V7ltHWKV2I23/DH6toztjuiNwaq73YC9VRPs3K89yVf
         cQJxAH4LGv6Y9ccMFZp6e4EnFx8/ngs8r6Jfi/vx8QbAa0MS9rul+0VZG8dO+5zrJS3J
         EUBQDZF0OVyj2ohrPwS8sTvacMCULFubQ2KUqU8UYZFQvw26IRdjGpDz/tDaXH2DjD8V
         6uUw==
X-Forwarded-Encrypted: i=1; AJvYcCWIl7VkLxL7YmLgpEntUoUVMNKnRMOfWg/fxUGVgWHM6bU8aFRasU7DOQAKxG1oF2prUKCTHPrYMYhAiOsSJSBJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8z2OrntGh+ofD2z2nCLjC1LB5ZchfJ//3GTR2rsJfgoxd1Ilf
	4DzkSKn40AKvoa2prkJ0iVB7SmmfSVmOp2xo+kMepAUpVQpPBuXlkgeMcqqCWA==
X-Gm-Gg: ASbGncs1IMFBxiRSXy1BtFFHiA0I21z4r3K7284LC7YTxpK4qZ7Nd8H2Q0gCLQ9Tszv
	aEOdHois6c2oFiLakskQimgHJKDuGq20XY0ealQ3WtxMMWgyXLo/cXbojwfGrkULe6MIrTrpep7
	nOYHQw851vtfWeAiK2xTVfe7T1B+f+2ieCSTqJi/Uf5WmrgV+mDDIY6vhamXPyMSVJ7txNyFwJ/
	okI20zOH5zhNv52GBc0X4UR9tlRATMYRmieP5qYBEfjfm0oB1+AcH0ff2wByMmzuumS9ZO+YTnV
	/NxTYj7BI09jjwTzydme36d5D+nhJ+3wHDWDx4FaWKK4eGJFP/0xa9uoyJEfY1uwQVeohta2ldM
	uLZoIRL+QNx6sUzvXTqTNgvs4lIyTGDRRSZYXAd6hrtExxdHYdO9sASP4wQ==
X-Google-Smtp-Source: AGHT+IHR/3oBhcou/nqFCZJEmzF9GzjQUOYYNk7PFauGlRhY9drF2R0iP+r/p0o6ucZSI3AqqdXoWQ==
X-Received: by 2002:a05:6512:3ca2:b0:55f:6adb:b867 with SMTP id 2adb3069b0e04-582d3111187mr4279256e87.45.1759103021915;
        Sun, 28 Sep 2025 16:43:41 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5879e9b80cesm512772e87.112.2025.09.28.16.43.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Sep 2025 16:43:41 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 2/2] arm64: dts: meson: add initial device-tree for Tanix
 TX9 Pro
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CAFBinCDQc=2xrKbGunSKJjLhGd0bCGN+3oYd_bg0ySs+WHxZjA@mail.gmail.com>
Date: Mon, 29 Sep 2025 03:43:26 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6B97C24A-A1C0-46F9-BC74-3E7D2119B6D6@gmail.com>
References: <20250927125006.824293-1-christianshewitt@gmail.com>
 <20250927125006.824293-2-christianshewitt@gmail.com>
 <CAFBinCDQc=2xrKbGunSKJjLhGd0bCGN+3oYd_bg0ySs+WHxZjA@mail.gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_164344_727489_4CF635AB 
X-CRM114-Status: GOOD (  13.93  )
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

> On 29 Sep 2025, at 1:12=E2=80=AFam, Martin Blumenstingl =
<martin.blumenstingl@googlemail.com> wrote:
>=20
> Hi Christian,
>=20
> thank you for the patch!
>=20
> On Sat, Sep 27, 2025 at 2:50=E2=80=AFPM Christian Hewitt
> <christianshewitt@gmail.com> wrote:
> [...]
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-tx9-pro.dts
>> @@ -0,0 +1,90 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (c) 2016 Endless Computers, Inc.
>> + * Author: Carlo Caione <carlo@endlessm.com>
> Is Carlo really the author?

He=E2=80=99s the author of the original device tree that 95%
of the content for this one is taken from; as is the
case for most older Amlogic hardware. The decision
on which bits to copy and paste was all mine, but I=E2=80=99m
not  sure that skill deserves too much credit :)

I can resend with my own name (or mine appended) if
that would be preferred?

Christian=

