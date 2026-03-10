Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5C1FD4F31
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 19:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G9cvfhQ10wrUSRJrtkOFBxOyryXSPxDYuWfwuNkixhs=; b=HVHJJrQxdUm6ZB
	nArqooIqLkvfj/9jlyAnIi2TWVgj5pE1JvnepeabrydDzWqTLfQBx0o73vJRWcCwNqfkBm/OT+8Pc
	L7U019mwRUa16OXBC3z7jjEWurPSnx7B9khnar1AHIM4zYrrF+i1U8y2ULOo7n+GCxXj+fIRaMqp5
	7HDVDYhKJfu7TiNXYH4trgkztj1qqr/j8f8hxJjNUC18FZ2FoRyGEDRhFM2gaZpBoOMnijzR3eLQ9
	/vnU0BiYi51I/GhPGc9xZd/D0aFoDyYp0hzuSZlGH52CKUYxhm1II01s5xgjTVvrQxmbRzKY3Dz7C
	nK/3THr9ERS5347Zo1zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w035h-0000000ACRC-1TPG;
	Tue, 10 Mar 2026 19:50:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w035f-0000000ACQq-21DJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 19:50:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D64DD44036
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 19:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B520CC2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 19:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773172202;
	bh=61cOWIluLg/ri0kKZLFIWkcAPP0PDIF1kYNAbzD/75Y=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=aUVPnUpuvlUwp4RHysc462fQn4me0YVYvbhbzJufggMjzp05DwUo5Qkp7Wnx+cQvK
	 ZhoJcPCgtP3AtMoj8k9wCEHYI9AeYbRnakHmhpYubM6zpJ03fP+iCtIlZciP7P597P
	 3dkzQ01jsxTBzXl1lVB2umzWj51J1FlWQ0p2kNsRmgyo8p6i4NPV6RZ2GIqTWB/bJQ
	 hsoc5MXiNbZzGTnA+vlUNX9cgWmcAwFhje3e+eUbWYR1iNzWmm6qrTRplr/Sa/m6NX
	 ssO2aSr4IGGkqfc7pvg89RUi6tqQoKAQake9wsSg4Mk6MaxUBAXRorURuIOkZRIKk/
	 Iq+HqbfTdXs5Q==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38a38ccc217so43181561fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 12:50:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUo1KWj9jybsk9yu1sMLJMdFVgwOQv+gobum3kpH+q3622S3KKDBcK+hg+VTZWqAqOa55jSETimPW3lP8+JOmSE@lists.infradead.org
X-Gm-Message-State: AOJu0YwWInP0H3zvynFvIrizvA3nDkadLvV3dvKboKBgaHQZUK7DCXzh
	fyzElwr+CZ7zs6gYZ1ygjIt7kVq8sWF1h7AVZuBPCl776V1KEpUQeCJChjQlYG8mWoH4D4hUh+P
	eHPERcHX18aA0BAJuPQsnTgDazAvxlfU=
X-Received: by 2002:a2e:a54e:0:b0:38a:5402:a9e9 with SMTP id
 38308e7fff4ca-38a67dc914bmr84071fa.5.1773172201072; Tue, 10 Mar 2026 12:50:01
 -0700 (PDT)
MIME-Version: 1.0
References: <20260302153559.3199783-1-wens@kernel.org> <177317166704.379398.1719490251066452420.b4-ty@kernel.org>
 <f3ed7b81-4e43-4baa-8a56-b18fa7f56436@sirena.org.uk> <CAGb2v65TyEkirWpfynKnSCiuOAyTW1FZQyXncnTFEHGGOQr_Fw@mail.gmail.com>
 <33204e68-5e65-4486-a473-79d09def88a8@sirena.org.uk>
In-Reply-To: <33204e68-5e65-4486-a473-79d09def88a8@sirena.org.uk>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 11 Mar 2026 03:49:47 +0800
X-Gmail-Original-Message-ID: <CAGb2v67N3svujuzPZ7uwv7kYbiah2iJFW3jZS2kmMmRvV92L9w@mail.gmail.com>
X-Gm-Features: AaiRm53gGy9JdNfY71v2inWqDsCjb0-wpAlLC2cqpxhEcDisNL_wKASMji7aaAA
Message-ID: <CAGb2v67N3svujuzPZ7uwv7kYbiah2iJFW3jZS2kmMmRvV92L9w@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] arm64: allwinner: sun55i-t527: avaota-a1: Add SPI NAND
To: Mark Brown <broonie@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_125003_541176_13FFD40A 
X-CRM114-Status: GOOD (  14.99  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Mar 11, 2026 at 3:48=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Mar 11, 2026 at 03:44:01AM +0800, Chen-Yu Tsai wrote:
> > On Wed, Mar 11, 2026 at 3:42=E2=80=AFAM Mark Brown <broonie@kernel.org>=
 wrote:
> > > On Wed, Mar 11, 2026 at 03:41:07AM +0800, Chen-Yu Tsai wrote:
>
> > > > [1/3] spi: dt-bindings: sun6i: Allow Dual SPI and Quad SPI for newe=
r SoCs
> > > >       commit: e2f93f45d38f7b6dacb44203cfc7bb5d7e287b8e
>
> > > I'd have expected to take this one?
>
> > Normally you merge patches pretty quickly, so I thought maybe you weren=
't
> > going to take this one.
>
> I tend to leave a week or two if I think it's likely someone's going to
> review.
>
> > I can back it out if you want to take it through the SPI tree.
>
> Probably safer for conflicts.

Now backed out.

