Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FC5CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 17:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qk5OSgpm2QKOum3ErlbYh3UpTiSxTWavV2qBzb8WH/o=; b=bSLkNU6+U4r2zjYPfncde+nvIg
	WJ+w6KFe52rL+umF91RA/2byU+zcMFDQnbOZaUFOl++alSQUtW+T3obSidCPwQg7oeBvwSjWw4iV7
	m5XrpwauPDr29TUBkECTfif/UQJ/uttkHphK184M1dwblRPO7HmqXxCUJBvnwWNBhqrreRhB3kOxJ
	DtwvrSU/hXVW+CD1Kq5Z3pEZZYwIupW/RfleEd0VyaRO7vfeTJGkVr62sGBopHqZv1EFeDhTabsYG
	aYO4Vz3fFF8yUxR4NisQhXvwF/vJD5/b6TiA4YAsCW9SL15B4sv7YfIii2rHvZqzNmj/J4pOEndCE
	Tg3Yzi2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0KG-000000067zr-0MLh;
	Tue, 09 Jun 2026 17:33:20 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0KD-000000067zS-1Lhe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 17:33:19 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-68852b58d87so10797516a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 10:33:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781026394; cv=none;
        d=google.com; s=arc-20240605;
        b=Mgtr/weOWaT8b7P6XbzHlvbKnjoSg31ZxF1koejw4gvxtAC/YseQmiMAuy6lxCs5ng
         pbK8XorSujN5oKBezM8xa47xATcsJf/H5TBnTAoaQ3YeHKQp5AvShcsEJeRSqMT7FZCG
         jsSzU4cIrRY45G5h5CwLvTVGA3qRU0B21xBrIB8OCuBxvgOSGhkDXq2UImq2oKmUdJ5+
         SEGacmftkop2bY64i/A77CV30GCTmq0DckodFuZXllQz3Pd6d21Lk53oOg9i+urzDjP6
         ouBdQ1h3anKF0Sty/lbl757/JqSBp/o1JYf6O39Be3JUuAH710MO4iKU9s2C+8YFxqdD
         Gj3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qk5OSgpm2QKOum3ErlbYh3UpTiSxTWavV2qBzb8WH/o=;
        fh=bWggSvVG0AOhqIOxAiTuqkiFldjLm4vadFpE6MiSsSo=;
        b=X5t4FIZ/30fEE1vB98bGXufwP3xOMQTu+XnYNpsjTH+dQeXbodUf7xflrYL3X7mVJU
         yBfhhB0l1Nvdiwbzoea/2vECnpWIWiJLK9z2gauY73ZjG6LZPsc3ZmNbTeAbi2vRwQxR
         1jbdQZWZ4u7j57H2U2KlZl/xHKnPx2oaX6ExGKnitbI+EsjjSHA/zrcEt2WdHKDL4jvi
         9qNBXVDUhiLV5rhXvm3HTWkW+i9PTCo4ATpTHs8TGp9oCqmb3QiZKHByx+T7tCjlgNc9
         4UwaP1Jx5+JUk1kEq1H0qSzEUWa5SCevlfO2wkY3zJSyFPgP6UTYJp5sFJdsu7WLuTFP
         VUAA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781026394; x=1781631194; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qk5OSgpm2QKOum3ErlbYh3UpTiSxTWavV2qBzb8WH/o=;
        b=ZgMZbI88sXaejLSf0R2k5fWctW2adMorozUaG036fWJQwPqMaiVJ30bNQRlob8byuz
         njd1EeY2G3dT9dFMQTo2FYxJRXWJyNY8bsfqGqnpqoPd9FH/aSAjKY+x91heoVB5DAx3
         vSIqV/37UL8mL4dUoyfqsX/tCA3YcqtIg/E/9FYRRV4ooZlYE0mUgLnCwgMoqSl26Lzo
         D3x7cEiBhWv+Ik+g5dGl9ThBYdLOTbSYPnaXOJVlN08PCQISlQc3P1YQn34dJ5Rsjiph
         iOnwsxZzr7okTXWt8TmlIbjOyM8S0B0DbHu5rbdhWKyZjw7Z56y/AuCJcOD89FOWzKV8
         OGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026394; x=1781631194;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qk5OSgpm2QKOum3ErlbYh3UpTiSxTWavV2qBzb8WH/o=;
        b=oh7AozYQx14kRnYpP3MAEW40qelrtS1IiuDpEX++3DCbX/m42FpeoDfjQefKi/wH8I
         0/yYR0bz4olY6rcn5DPPQtGqU94AlmK+aIOZNbvlxkkD6+fvnNkrBHTfmEBN/b0fe9n9
         mX5Azt5Xqb4DGILHFQb8NYdPfTydiSVoL2DgMg6LmUXNfAS3YoxoPSFKlo5t2NKlPvCb
         D5cwSVtc+PklTUaAH+LQ5A1bcwvuS5NZJ7HYHNrpLGIxPhAe2PFm+mACWKfIJt+Ef8Ww
         7bCoLQkHnZIc3VfRIAqQ8qFGwh+B4jCArs8boihwxfE+l3PqeUwwVThD6IjI5frbfWP0
         7dkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Q6gxmzNfT1U/bkrCD8AXH+Rwc1T6Cj44MKkv+vRYIdgfkMIXqhKIjlDZscvRWvRdLrKuij6eTX8bycGDwFeTR@lists.infradead.org
X-Gm-Message-State: AOJu0Yx28R4uAUpIajvHRrkZFVupwuGL+hkiuolsNXBZ9HjROPVXpidi
	9s/I108JOydWE3TNTBT9oCmfP4wvh8usH9sn4rs7p5rgmCnPiXYw1suUwpVxbDC+coEga2yTS2T
	hKX6umHtSgRKwy1/RourwxaOMejknmaCpzYDQpsQJHA==
X-Gm-Gg: Acq92OH4s9MpcyF/HiwJ75d2OkqaB9jpv9T1vQTbPGr91aEN/R+hqvfI7L5OoiZuRkv
	L7K52z97NLXoIxzsI5ySDADrcDA5uwcUBFOdoJ7166X8ft+5MpuWkKle2KIfn0qGW1BDo/7u5CN
	+PgUa7vFm1vpMtroPnYeV1rC1JuM+iLGZQsj3OF6OVqdIig++uDNOXGCP3tl51qc8vQZfSY/5sX
	q0UVl5Hgg9vJoJpnxk/Tf+9uzwm7d1g4ae5Al5kUjWLVkvJ1+d+gi4lYVwyGKpsR/nMi43TejOg
	WDBqx+BcVVnogxvTQWXbx+eTQHdzX28SN8D00GHvse4ZuqKQH/qH
X-Received: by 2002:a05:6402:2686:b0:68c:3994:45f2 with SMTP id
 4fb4d7f45d1cf-68fa503fde8mr10046906a12.19.1781026394348; Tue, 09 Jun 2026
 10:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
 <20260605113621.1479-2-laurentiumihalcea111@gmail.com> <aihB5rVLsVqzg6cb@p14s>
 <aihIIwt_9T7yYxP3@SMW015318>
In-Reply-To: <aihIIwt_9T7yYxP3@SMW015318>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 9 Jun 2026 11:33:03 -0600
X-Gm-Features: AVVi8CfajwXrk0zh9dxoFsW97FohDkxe-xDUhgkWnVGwuNvfV4UW4Y-xjQ1W9M4
Message-ID: <CANLsYkxw6rbWNom8rNfKurKAXKpihqV1LTd51D5YXG4oFP6-wg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@oss.nxp.com>, 
	Francesco Dolcini <francesco@dolcini.it>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_103318_078121_5DB1E219 
X-CRM114-Status: GOOD (  30.56  )
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

On Tue, 9 Jun 2026 at 11:06, Frank Li <Frank.li@oss.nxp.com> wrote:
>
> On Tue, Jun 09, 2026 at 10:40:06AM -0600, Mathieu Poirier wrote:
> > [You don't often get email from mathieu.poirier@linaro.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > On Fri, Jun 05, 2026 at 04:36:18AM -0700, Laurentiu Mihalcea wrote:
> > > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > >
> > > The names of the carveout regions are derived using the names of the
> > > reserved memory devicetree nodes, which are referenced using the
> > > "memory-region" property. This adds a restriction on the names of said
> > > devicetree nodes, often bearing specific names such as: "vdevbuffer",
> > > "vdev0vring0", "rsc-table", etc... This goes against the devicetree
> > > specification's recommendation, which states that the devicetree node
> > > names should be generic.
> >
> > I don't see what is so restrictive in using the node name of the reserved-memory
> > regions.  Function of_reserved_mem_region_to_resource() is already doing all the
> > parsing, packaging everything in a neat and easy to use "struct resource".  What
> > will you gain with this new "memory-region-names" that can't be done with the
> > current solution?
>
> DT Binding check can't find such wrong if node name is not what expected.
> Binding can't restrict memory's node name because there ware not specific
> compatible string for it.
>

But what "wrong" could that be, and what kind of restriction are you
hoping to enforce?  What specific problem are you hoping to solve?

I'll wait to see what the DT people think about this - I personally
don't see the value in it.

> Frank
>
> >
> > >
> > > Fix this by documenting an additional, optional property:
> > > "memory-region-names". This way, the carveout names can use the values
> > > passed via "memory-region-names", while keeping the devicetree node
> > > names of the reserved memory regions generic.
> > >
> > > There are no restrictions imposed on the values of the strings passed via
> > > the new property since the software allows any name to be used, with some
> > > names (e.g. "vdev%dbuffer", "vdev%dvring%d", "rsc-table") bearing a
> > > special meaning.
> > >
> > > Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > > ---
> > >  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > > index c18f71b64889..8e3e6676a95e 100644
> > > --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > > +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > > @@ -62,6 +62,10 @@ properties:
> > >      minItems: 1
> > >      maxItems: 32
> > >
> > > +  memory-region-names:
> > > +    minItems: 1
> > > +    maxItems: 32
> > > +
> > >    power-domains:
> > >      minItems: 2
> > >      maxItems: 8
> > > --
> > > 2.43.0
> > >
> >

