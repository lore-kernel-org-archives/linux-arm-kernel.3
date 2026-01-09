Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D876D26D6A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 15:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SpPrLFd5v/6zJO4WFk35tcM0BKmalPeYgZG+F55tnbQ=; b=Hd6LHmiHzJfqJAJHt5gYBc2GMA
	lN7Fs9aYungE53GMOJzdhpazzndNnY+ksCcicDNOctoj8GUO0nkdufnbZUU+cOChh5u0FLancbygf
	FqQVqY0/EyqILM7paPA84NGmLkoLzD7cWfIT5R3bi3dNIdqIwZqvBzynoYiA+VYezIwlMmd9Jnj43
	X2iXP023LaaBHtpPA8a6R4qcG7+gD0G1b9MS0qlDI9UlUkqUlOS3jd5c293arnDlinQY5N9T5nrnt
	O/rGCH+7e1pIjbvr2ergdKjVRnXuiy5ml/M5Sf54lQltfiEcMWcDss0TrvwAbyvOWYcktZ8bOdCCH
	UCxtQGQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEZY-00000002W0k-2wIV;
	Fri, 09 Jan 2026 15:38:44 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEZV-00000002W03-3dwN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 15:38:43 +0000
Received: by mail-oi1-f194.google.com with SMTP id 5614622812f47-45a84c6746cso535741b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 07:38:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767973120; x=1768577920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SpPrLFd5v/6zJO4WFk35tcM0BKmalPeYgZG+F55tnbQ=;
        b=dmM0+ImjwPDqnWDivas0SOkJ/XKGBP2rmNztC85Ey9paYA9qSBY6zXzPv8QkDM7jqe
         se8Q9eoXnrM6dtOg6YHLQDg75bOKhqLuePpty8bvXJAdsT+nKnUGSKzdq2oYiEFJQWNC
         tODf/tiS+A+qTpoFefUPSLRnM3zXmi8Vc+UuqU3lHl+ya6a0ECuCR7ELfnrEM8FDIY9K
         mIjYmYQNwn8SR963dNAEQculDc3M7i08alJlg6kQWtpQBhmd++e8MgPbuDU+eerREeU3
         GVZXqZM9f7a3Lg6miwKnp2gwxTXG0t8GYPbmoYQZdIAUsQ1+BEQWFnOpw+sPWbaMQUBl
         e1Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVhQ7lRRP5wk6xaOeEhQQoVYARfybW6BGP/wDCpDQE7NAEcBlWEHwZeeHszcd3UHRRdU8tq6780bMsAgWsoA+eA@lists.infradead.org
X-Gm-Message-State: AOJu0YyEfiAmJXyWLyt2GKIiT2+Cf6ULBoOj0w70sIRJaknM//XTDUxn
	soHceMP6K781IDKwHYkCzAVZRA6n9WD7oI4LJljlGt/IzhSHWCfcw6cd1yUYZKyP
X-Gm-Gg: AY/fxX6wMj2NDMUf5nYdy1+XZNO+2/3sEbFp26jbKroS5QAHXFzK+aoHecoTUn0C42z
	rUX6S9qlAp2RYJz6UTBAOCf8FRFrkPTaUM/IbmrNsxQPE8dR0umFBpZW9D/3F5A1PedxyoTjBjq
	ET+M7SyOUADF0oKGkaSNoNMuYpQGGzEUNmvliQYlFuo+EYebiXHvPcnXGRdDOWXaBGVcam/uZeM
	d2Y5uYXZGQdl1HIcuE0i80tWdBD/P+JlDYOASvtv6cuAI+Occ7M8cAg74UXzor8bMCdNBoDcSPX
	LgAhCsfckSB3wILDmqtGWbc9dNgiOySSBbOMBlB6a0q+VdHHqT3bqgXskU2WanBadiB5KiIq2JN
	/zYX/IHQk+fJtY9ADlAi8JfMwaZSPoZstku7+aZjfcveEpZnRntPsOhvEAGavmN9EvUh3KSB9zB
	Xt5fIqAEyqlDkO6jxshseTOeIxYn11QvzGSqJ8cVt7To4rN9yo+wvVoUtQl7T+LRilBmb8+Gp3
X-Google-Smtp-Source: AGHT+IGja6jqFZ8J6QYJRT7g6KaRbTvc4GHCKHlWHqkkApgpqjXoHK10je6F3xQ+/EjLgCMQ4mhQhw==
X-Received: by 2002:a05:6808:4f22:b0:44f:79de:1981 with SMTP id 5614622812f47-45a6bede0f9mr6189693b6e.39.1767973120075;
        Fri, 09 Jan 2026 07:38:40 -0800 (PST)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa4e3a7bfsm7048050fac.8.2026.01.09.07.38.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 07:38:39 -0800 (PST)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7c6cc366884so2331580a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 07:38:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVue5aJddmhaRTVgDsU5/fex168FeIEAfSnRvbHC3wFrCzITfFZAMligvEL4s1mPQ8xV8IkBJQ3OTBA1919blDf@lists.infradead.org
X-Received: by 2002:a05:6830:1cc2:b0:7c5:3045:6c6f with SMTP id
 46e09a7af769-7ce50a28c93mr6289620a34.20.1767973119475; Fri, 09 Jan 2026
 07:38:39 -0800 (PST)
MIME-Version: 1.0
References: <20260109-apple-dt-usb-c-atc-dwc3-v1-0-ce0e92c1a016@jannau.net>
In-Reply-To: <20260109-apple-dt-usb-c-atc-dwc3-v1-0-ce0e92c1a016@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 9 Jan 2026 10:38:02 -0500
X-Gmail-Original-Message-ID: <CAEg-Je9Df0XkVUBmy1DV98VOaHT1tZR3kgPQGupViR-z_0TsYw@mail.gmail.com>
X-Gm-Features: AQt7F2rwR9BSvl9s1TsweiM258RIcrVrEtCNI80i8QBJax18vd1G319kNAidJ6o
Message-ID: <CAEg-Je9Df0XkVUBmy1DV98VOaHT1tZR3kgPQGupViR-z_0TsYw@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: apple: Add integrated USB Type-C ports
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>, R <rqou@berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_073841_919468_9688E1C4 
X-CRM114-Status: GOOD (  21.79  )
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

On Fri, Jan 9, 2026 at 9:07=E2=80=AFAM Janne Grunau <j@jannau.net> wrote:
>
> Now that all dependencies for USB 2.0 and 3.x support are either merged
> (tipd changes in v6.18, dwc3-apple in v6.19-rc1) or in linux-next (Apple
> Type-C PHY) prepare device tree changes to expose the ports.
>
> Each port on Apple silicon devices is driven by a separate collection of
> hardware blocks. For USB 2.0 and 3.x the collection consists of:
> - Apple Type-C PHY, combo PHY for USB 2.0, USB 3.x, USB4/Thunderbolt and
>   DisplayPort
> - Synopsys Designware dwc3 USB controller
> - two DART iommu instances for dwc3
> - CD321x USB PD controller (similar to Ti's TPS6598x series)
>
> The CD321x nodes are already present so this series add the remaining
> devices nodes, typec connector nodes and connections between all
> components.
>
> The devices expose except for a few exceptions noted below all ports. M1
> and M2 have two ports, M1 and M2 Pro and Max have four ports and
> M1 and M2 Ultra have eight ports.
> The Pro and Max based Macbook Pros use only three ports. The fourth port
> is used as DisplayPort PHY to drive a HDMI output via an integrated
> DP to HDMI converter.
> The Ultra based Mac studio devices only use six ports. The third and
> fourth port on the second die is completely fused off.
>
> The changes for t600x and t602x are in a single commit since the devices
> share .dtsi files across SoC generations due to their similarity.
>
> Depends on commit c1538b87caef ("dt-bindings: phy: Add Apple Type-C
> PHY") in linux-phy's [1] next branch for `make dtbs_check` to pass.
> checkpatch warns about the undocumented DT compatible strings
> "apple,t8112-atcphy", "apple,t6000-atcphy" and "apple,t6020-atcphy" but
> not about "apple,t8103-atcphy". I don't under why it doesn't warn about
> the last. "apple,t8103-atcphy" is only found in the added devicetree
> files and nowhere else in v6.19-rc1.
>
> Tested on top of next-20260106 on M1, M2, M1 Max and M2 Pro Mac mini /
> Mac studio and a few fixes for dwc3-apple and atc [2, 3, 4, 5].
>
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/ =
[1]
> Link: https://lore.kernel.org/asahi/20260104-atcphy-tunable-fix-v2-1-84e5=
c2a57aaa@kernel.org/ [2]
> Link: https://lore.kernel.org/asahi/20260108-atcphy-coldboot-fix-v1-1-01c=
41c6e84f2@kernel.org/ [3]
> Link: https://lore.kernel.org/asahi/20260108-dwc3-apple-usb2phy-fix-v1-1-=
5dd7bc642040@kernel.org/ [4]
> Link: https://lore.kernel.org/asahi/20260109-apple-dwc3-role-switch-v1-1-=
11623b0f6222@jannau.net/ [5]
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Hector Martin (2):
>       arm64: dts: apple: t8103: Add nodes for integrated USB Type-C ports
>       arm64: dts: apple: t8112: Add nodes for integrated USB Type-C ports
>
> Janne Grunau (1):
>       arm64: dts: apple: t60xx: Add nodes for integrated USB Type-C ports
>
>  arch/arm64/boot/dts/apple/t6001.dtsi           |   1 +
>  arch/arm64/boot/dts/apple/t6002-j375d.dts      | 150 +++++++++
>  arch/arm64/boot/dts/apple/t6002.dtsi           |   1 +
>  arch/arm64/boot/dts/apple/t600x-dieX.dtsi      | 212 +++++++++++++
>  arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 234 ++++++++++++++
>  arch/arm64/boot/dts/apple/t600x-j375.dtsi      | 270 ++++++++++++++++
>  arch/arm64/boot/dts/apple/t6022-j180d.dts      | 415 +++++++++++++++++++=
++++++
>  arch/arm64/boot/dts/apple/t6022-j475d.dts      |  31 ++
>  arch/arm64/boot/dts/apple/t6022-jxxxd.dtsi     | 133 ++++++++
>  arch/arm64/boot/dts/apple/t602x-dieX.dtsi      | 212 +++++++++++++
>  arch/arm64/boot/dts/apple/t8103-j274.dts       |  12 +
>  arch/arm64/boot/dts/apple/t8103-j293.dts       |  12 +
>  arch/arm64/boot/dts/apple/t8103-j313.dts       |  12 +
>  arch/arm64/boot/dts/apple/t8103-j456.dts       |  12 +
>  arch/arm64/boot/dts/apple/t8103-j457.dts       |  12 +
>  arch/arm64/boot/dts/apple/t8103-jxxx.dtsi      | 134 ++++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi           | 105 +++++++
>  arch/arm64/boot/dts/apple/t8112-j413.dts       |  12 +
>  arch/arm64/boot/dts/apple/t8112-j415.dts       |  12 +
>  arch/arm64/boot/dts/apple/t8112-j473.dts       |  12 +
>  arch/arm64/boot/dts/apple/t8112-j493.dts       |  12 +
>  arch/arm64/boot/dts/apple/t8112-jxxx.dtsi      | 134 ++++++++
>  arch/arm64/boot/dts/apple/t8112.dtsi           | 105 +++++++
>  23 files changed, 2245 insertions(+)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20260109-apple-dt-usb-c-atc-dwc3-c4f7853c85e2
>


LGTM, thanks for this!

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

