Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF6FCD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 22:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3T4j7OBsymsUW8sk7AIgEhfmNfH3xykTHDf4YdxftU=; b=vHsTK6lYDSIJmEHutu02emu2Jt
	6ZMyzzD0trIzotDpBe5UL7p64DeFaLgqoxp+vGSK04whpQH+p43E8wYcT9nlo91icNDWg8Y6Md9CW
	GFpXi5cd1GpsDF2JKWw9c/QIc6F8E6Kc1WbnRDz9SC4sMSB+m6I1wBPGTKQXhrwfeBJYHFDU+72uC
	aOMzCviqk2LnXKIuGBty/7jNJ/hGMOkWkjSyi4Ok+UkS37LabpTJ1I4KavQDOd937Zcau2EmxDjeo
	JY9c8CsIsWEugejE/mQJn2mP+qglcGVIHPBrxENWqSXzaGKpX78ehTh+Ah0uzD5vjpgtAIL05Tqt0
	afwm9k0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWijn-00000004VUw-19Pc;
	Mon, 08 Jun 2026 22:46:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWijl-00000004VUH-2f3a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 22:46:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B1FF5601D8
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 22:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648111F00899
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 22:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780958788;
	bh=B3T4j7OBsymsUW8sk7AIgEhfmNfH3xykTHDf4YdxftU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SPcmg9gSpqzLhPQ4DUxzeLr6C6gvQ+2sHHktTS9Sq3n8C9ba1o423+s2T+OkBEwee
	 NSQhMGqUYw0rMBAxx6zzm+3AvPSldX5QtCcGfRRWGN4JyDAEvCCSLm9fXFa8YO3I1j
	 IEUGelLtoIcqdmVt5XMkMY+qWrxP+xt+QR8Ez5I3Unk3FYBCWZNiEaP2Ul6eI7EtVX
	 boGc/VxU6fOvh4VTJ3kMyrBFktC1OmwKyMhVu5iXK5JqpCo/nNIXbqYkO4uEW/Cacr
	 3kDyx/ZB0e4gD6WlcKK3mmzmWoMB3VedIKGX7OCznQL8kMlssvJFRnRH8l43cEBW8r
	 J8Pp2U7c1fD6w==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa68d9dc18so4802243e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 15:46:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/zKNgvIuumRzggkMVKDhB/lz6/lSEPibXp3ZV2VnW5MGApW7fi376o6bYW6IcPrtekss/qYGKogyRK4VkNuLuV@lists.infradead.org
X-Gm-Message-State: AOJu0YxmKh7IdCrVpBWniz8h++IKZ5rcdZKbxXiYb9x3FX83uHd8eUAM
	3FRgmzGZkHkbVmzaoDoc1etVxxFJaoVR3UBTM/ElVul5VXMUngQqp3W8i1jhsB3unIrgnRJVjG+
	FpJZ0yZgnZ2rrIY3LpgYbS4A2Okm6S8k=
X-Received: by 2002:a05:6512:15a4:b0:5aa:6eca:f382 with SMTP id
 2adb3069b0e04-5aa87b76dc4mr5708333e87.11.1780958787136; Mon, 08 Jun 2026
 15:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260601152707.29039-1-l.scorcia@gmail.com>
In-Reply-To: <20260601152707.29039-1-l.scorcia@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 9 Jun 2026 00:46:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLkFGZ4YYwDrtWsirRF238+K5TiDBeczz-FOZtq-MBA3Kw@mail.gmail.com>
X-Gm-Features: AVVi8Cdb81KyiQYHN3WaKg4cCLnATFx4zGUZo2-MGBsT-bnCL_TrgRbJJGbJYZo
Message-ID: <CAD++jLkFGZ4YYwDrtWsirRF238+K5TiDBeczz-FOZtq-MBA3Kw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mediatek: mt6795: document the
 slew-rate property
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Mon, Jun 1, 2026 at 5:27=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:

> The driver for MT6795 pinctrl already supports the slew-rate property.
> Add its description to the documentation.
>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Patch applied!

Yours,
Linus Walleij

