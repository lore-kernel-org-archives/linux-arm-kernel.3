Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15678CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+Zpwgdt2K7ODmUmZFs5PwxiVXXn3j6xqLkF3qLtEWc=; b=xax7f0qCkXbCOQn8Bgz456unyu
	rR8Bh7FJ5KeX67agbEzuFPuorzEYDb7EvmYI2NCs0715DbHgMNn4rOJkUPwZX7PYR/xJsV8Gu2kwh
	mvjXETnvPsaa5HTNxtfP2eRzjeP7Be9fihKX9aXllvKQlvAwp4QO6oYQGEYgn3XTRa4NRK6ziHe3N
	Z3jcfF4/Lw+Y1iLdCy6Qg9ftvmZ4+FXJP5RGROt19zQ5Lhj7U8mrVyT/FKUQ73JfxSeEiALfppJtI
	2CVhIH8zloT35C5bfaP5n0xQTyZJ6IqNjEfP4yvAujFduj4fQzcOQbN0rhFBCEAZBRt8O96QOZLdk
	HEvPwpIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPtk-00000002KPS-2Ik9;
	Wed, 07 Oct 2026 11:33:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPtj-00000002KP9-1UGD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:33:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B18E601FF
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 11:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E88D1F008A2
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 11:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791372802;
	bh=C+Zpwgdt2K7ODmUmZFs5PwxiVXXn3j6xqLkF3qLtEWc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EF1IhK10+TdbgSIO5BEmOvdVr+uHDAeUgGSTYKcKhp3K/ZQQu6pXQGlJ82L3L7B5/
	 jDMo8dEO/uz9E01XGEYcmE/4DcVeCtX+OEV86++o5M62UTd07n8L1KhYbc0REstoTo
	 fflBncixe4+w5KfOrzpuPE+9zsp42n3YdzKPALi6QmM/NDT8+l8rc9MlxVQiyV5Opu
	 vr/0ELwk+eBhhDHYhK+7O56gfZXYk9HutKSeOU5zzYBqqKMhzlbS+6tTvrarTcO9XS
	 OvyE4WyPzyiTJWDtbwKmyZ5pzeMa8Jv/j0uGx7tFuffs5UR16fGVTWm7Ww4orPl0sj
	 z12QACh60/VJw==
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-49e53ba03f5so474392fac.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:33:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzkhPDYpTA6NyGlHBPpyurqRFCIBwDHVevEjk4P7TbZ0jwgairF87s39/Tjc7itI1DNRp6aws1jq/OKadb64Ro4@lists.infradead.org
X-Gm-Message-State: AFuF++mpLjUYPb8pA805qSgxmvxbtCdg98STC4DCRHUV2jYO1wZU92Fz
	2Unj4kzl+3KwEEAMrvWw8Cq40ehCpSSsSzzZRICDpnWCyO5P8HA92XKtwTeMxOKlwYc9y5hA++I
	NowDowXL+8diVay4AyF/6veY/EBWDV58=
X-Received: by 2002:a05:6870:7097:b0:48f:e25e:e202 with SMTP id
 586e51a60fabf-4a2597a4240mr1680070fac.61.1791372801479; Wed, 07 Oct 2026
 04:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260925-mt6735-pinctrl-v9-v10-3-cc042983c565@protonmail.com>
In-Reply-To: <20260925-mt6735-pinctrl-v9-v10-3-cc042983c565@protonmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:33:04 +0200
X-Gmail-Original-Message-ID: <CAD++jL=gUxYXUs3TcMmFtqX-81MSTc_DRb9Cj3J7kGD3YcEeow@mail.gmail.com>
X-Gm-Features: AclHuK8mhGzFYpQCWb4ENMapNoQMf3mkG190Ia_Evk22K6ygvYZyvphqkH7y2y8
Message-ID: <CAD++jL=gUxYXUs3TcMmFtqX-81MSTc_DRb9Cj3J7kGD3YcEeow@mail.gmail.com>
Subject: Re: [PATCH v10 3/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Add MT6795
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org, 
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

On Fri, Sep 25, 2026 at 8:53=E2=80=AFPM Yassine Oudjana
<y.oudjana@protonmail.com> wrote:

> Combine MT6795 pin controller document into MT6779 one. In the
> process, amend the example with comments and additional pinctrl
> nodes from the MT6795 example, replace the current interrupts
> property description with the one from the MT6795 document since
> it makes more sense and define its items using conditionals
> as they now vary between variants. Also use conditionals to define
> valid values for the drive-strength property as well as items of
> the interrupts property for each variant since they are different
> on MT6795.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Patch applied.

Yours,
Linus Walleij

