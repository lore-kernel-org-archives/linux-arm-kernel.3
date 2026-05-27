Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9C6CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 10:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyp3LEuIpSMecSYlF89GeYwIafNLAOLt3ZDaQLTASAM=; b=LzJZRJCMovQ6VX4e53oIq4rGRD
	EyL8UxCCLI4AxnXYJfq6G6IZaNbjt1QbE9YcTMLNUDv7zw8r+FHQBMO19lIoLoLt61sfcPyo5w+bg
	epXB7V+6HiAJgwNTi9zQViEEPOss56qqixAny9QHi2V6ccgmC4eF7rYj+nrgz0IvdFqpwe1mK3yNg
	qp38E7n31Wt8EkVv0SdsDGgmmszJKxUAvBXNWq9vTNNNFk0r/QLkKuhZ3USZXahM3DbApRFgBeIFx
	3ZHc/gVsGwQTkljh0AaGx+1a2w9Mj8U/esVgKo1WYw7g8S71OpmiUHQBV6ahpsAB8IcPk89dOGoyu
	3owCsFCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBHQ-00000003ktC-0NfY;
	Wed, 27 May 2026 10:14:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBHO-00000003krf-1jt0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 10:14:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 593624365D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 10:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2AB1F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 10:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779876865;
	bh=wyp3LEuIpSMecSYlF89GeYwIafNLAOLt3ZDaQLTASAM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AgrenHeF5KNnz8Wo0H+M4M7cpFKo1CX+8UrSpHYqe6Smb2LOiSirjaEe96kqFdlWm
	 wYkuwDNi8svkRkJorERhkv2eZ5Aa4epDp3q/FpfEjM0SwwFUFx6Gwm1RSyIM4O24cu
	 59+wElnJtHBi+X//9Ns9bk3ZaYy4YXk8ltxlyWmzqCSegHbideKb/CMvWYAsyYdFCx
	 5uTkttpx5CoJqr1pPkiY/oWpQQU3B1wlzTIxPCLSrgThJd4Vqp6yu3YL+6QWgEV6Ct
	 xuog0OMR8nmTt/jluKlWVDS2UAevJB8ILsqpgS8+iGlZBKi7a9eh6Y6fqMZr4i2or+
	 1qFiOP8Vss6/A==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a8891febd2so15266458e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 03:14:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/wWorByAmjnA6qcuZgHZt4K1M0SBKk9dxp1p4q3vY7HIr5AYEhyo+xq/+nMWJ+5LKm7TGRjXapMXM/JEyQlGIY@lists.infradead.org
X-Gm-Message-State: AOJu0YxijNHNCuZ2WBgvEb+yLLYEItaup1CrBNLWAETn7fln/k+wxSbz
	dnBLE1upql+2IvD9JRmzhfdW4BZM1Pxz2yVI+7tVaLuLrIqXSNnyD/Dfv4W4bj4qWSX4o2Sf77n
	FByn5EMrOwluPJo9tDCmrf3E0nxmH7DA=
X-Received: by 2002:a05:6512:31c8:b0:5a8:71ab:294a with SMTP id
 2adb3069b0e04-5aa3237d4f9mr6996183e87.2.1779876864000; Wed, 27 May 2026
 03:14:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260526201552.13376-1-rosenp@gmail.com>
In-Reply-To: <20260526201552.13376-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 12:14:11 +0200
X-Gmail-Original-Message-ID: <CAD++jL=W-gcheTLgfJvFU4CBeHkxQ5gcwbzQA10PNE0eP0=nxw@mail.gmail.com>
X-Gm-Features: AVHnY4IhkhSPQ_Y4Fv0BX1iknBR8l12AAn8QQBDBpYk8LDuUupH4qFmIhr0E-Dk
Message-ID: <CAD++jL=W-gcheTLgfJvFU4CBeHkxQ5gcwbzQA10PNE0eP0=nxw@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: ste_dma40: turn d40_base phy_chans into a
 flexible array
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, 
	"moderated list:ARM/NOMADIK/Ux500 ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_031426_473177_E751FB9F 
X-CRM114-Status: GOOD (  12.53  )
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

Hi Rosen,

thanks for your patch!

On Tue, May 26, 2026 at 10:16=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wro=
te:

> Convert the separately-offset phy_chans pointer to a C99 flexible array
> member at the end of struct d40_base, and switch the allocation to
> struct_size(). The log_chans and memcpy_chans slots continue to live
> in the same allocation immediately after phy_chans, indexed via
> base->log_chans. This removes the hand-rolled pointer fixup that
> recomputed phy_chans from base + ALIGN(sizeof(struct d40_base), 4).
>
> Assisted-by: Claude:Opus-4.7
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

OK!

Please add

unsigned int num_phy_chans

> +       struct d40_chan                  phy_chans[];

and

phy_chans[] __counted_by(num_phy_chans);


> -       base =3D devm_kzalloc(dev,
> -               ALIGN(sizeof(struct d40_base), 4) +
> -               (num_phy_chans + num_log_chans + num_memcpy_chans) *
> -               sizeof(struct d40_chan), GFP_KERNEL);
> +       alloc_size =3D struct_size(base, phy_chans, num_phy_chans);
> +       alloc_size +=3D sizeof(*base->log_chans) * (num_log_chans + num_m=
emcpy_chans);
> +       base =3D devm_kzalloc(dev, alloc_size, GFP_KERNEL);

Please describe exactly how the ALIGN(sizeof(struct d40_base), 4) requireme=
nt
is met by the new code?

The phy_chans will be read by hardware which depends on this specific
alignment otherwise the data will be corrupted.

Yours,
Linus Walleij

