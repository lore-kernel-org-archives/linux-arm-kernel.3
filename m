Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AF5C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 00:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBfuehwXuYhvd62sof+pq+FLDnLYUXIU4YI6SF56HJE=; b=qJhwXUdy/NSJZU42bGCpHr5Kde
	PU5QuNEwTPMT/Cz4xTRGXc2k2mUgK2S2ZoMc/7y4VUMPZqMM+X3etVxBY2gsj5iz7Gj1j3XuJDHID
	NPURpF91IA0c608Dqxlq62YWXIHx/yxo/5xKFbHwjT4bdDuCpcH+y00eqzvJrKh025vNM9O+5S0uy
	nFDVFielPUpieEZG1w9rgkp8d6p60A2QWqobydCngBCWIfjo+LXTJDKY6lrqe0jNqYXuP0H2eaC9/
	qoxfeYx33S6XBu8FtHP/udi+yKV3HVUJ0DlHfiFG+d1CZQFAPBSCaf3U0AbP1cu3N+H2BJ5AstgFA
	s2F4PIuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4UZw-000000043nY-0iQi;
	Tue, 15 Apr 2025 00:55:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4UY6-000000043cJ-2wX6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 00:53:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 61D7644AB3
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 00:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40890C4CEEB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 00:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744678394;
	bh=rpcRVsmZpP1OTfgBK0pVQa/BNowodj/ZTEugq8lgEHk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n+Wyy6N6IcDOdsdf//4vJ3ol8RWOp12oQ0G4XNvCV3m29Z1NziZjpmYtNGIf0DPvV
	 S0OTCHeej+biO7N7WtGMkqwWR58/fapqmPuTPH3N+ehV7JTlV3tZxh0IlvFHOmh4Ys
	 1CR+dmOOt9jK/0K4vHulpPH+cEkd0qIrAZAhidNS1UXV5gtX/RrBGLA939nw5GNs+z
	 HFQS1RNNM/nvucPHUThM2tBk8h427ROKjepMQLWMyJtSNHRIYpdGq9l+zEvzqWYTnX
	 Mu/sqH5SnOy0VhOcy40W57MktIAGWg+HnacS/hZE/4JbuVbt3r+c8p0yuQ1upyN0Eq
	 J9fk2szY0WcSw==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e673822f76so8779682a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 17:53:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfs6/r1Aae6F2nOSzNmfSjHqTLJVHITZwfQ/Fd1naKmEEoMm+EjG8IFpQmAyp1up/QbAhQbKx+UluhMRy8/hXU@lists.infradead.org
X-Gm-Message-State: AOJu0YxwMvsdAAo9KVG9xJiO+wKHarnuLIc1rr+WNZENBEwDJc+/gf7u
	D0fanMnTzdztBOptm0wwGYK86ZlUIOhhq1OmFXAYoCbScETt7oiTECGx0flesCUDpoqsrldGLs+
	sEOBY7Fr3bq7BWOYvptWu8PGwdA==
X-Google-Smtp-Source: AGHT+IHmZnqswUI6HY4X7lhwWG4IXdrIAQ98ELXwpAIik5dZKiLq3R4+YKd0t7tRwsYVN1y86TzHYWW3TmgHsiWOsdY=
X-Received: by 2002:a17:906:f585:b0:ac7:3912:5ea8 with SMTP id
 a640c23a62f3a-acad371af0amr1293247866b.61.1744678392821; Mon, 14 Apr 2025
 17:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250414214135.1680076-1-robh@kernel.org> <174466977142.1877467.9140482106900041765.robh@kernel.org>
In-Reply-To: <174466977142.1877467.9140482106900041765.robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 14 Apr 2025 19:53:01 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK40++GbHbsXc2M2Q=wDv86=41kQrp=VJ-1nfMQN6rXng@mail.gmail.com>
X-Gm-Features: ATxdqUGgBWF_RyIbWCm1WwHPzqKVexIxZ_OM52tDjGnbjYrGcxtLD8az7H9x9DA
Message-ID: <CAL_JsqK40++GbHbsXc2M2Q=wDv86=41kQrp=VJ-1nfMQN6rXng@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: PCI: Convert marvell,armada8k-pcie to schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
	linux-kernel@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_175314_780364_42F67954 
X-CRM114-Status: GOOD (  16.46  )
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

On Mon, Apr 14, 2025 at 5:29=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Mon, 14 Apr 2025 16:41:33 -0500, Rob Herring (Arm) wrote:
> > Convert the marvell,armada8k-pcie binding to DT schema. The binding
> > uses different names for reg, clocks, and phys which have to be added
> > to the common Synopsys DWC binding.
> >
> > The "marvell,reset-gpio" property was not documented. Mark it deprecate=
d
> > as the "reset-gpios" property can be used instead. The "msi-parent"
> > property was also not documented.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  .../bindings/pci/marvell,armada8k-pcie.yaml   | 100 ++++++++++++++++++
> >  .../devicetree/bindings/pci/pci-armada8k.txt  |  48 ---------
> >  .../bindings/pci/snps,dw-pcie-common.yaml     |   3 +-
> >  .../devicetree/bindings/pci/snps,dw-pcie.yaml |   4 +-
> >  MAINTAINERS                                   |   2 +-
> >  5 files changed, 106 insertions(+), 51 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/pci/marvell,armad=
a8k-pcie.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/pci/pci-armada8k.=
txt
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/p=
ci/marvell,armada8k-pcie.example.dtb: pcie@f2600000 (marvell,armada8k-pcie)=
: interrupts: [[0], [32], [4]] is too long
>         from schema $id: http://devicetree.org/schemas/pci/marvell,armada=
8k-pcie.yaml#

This is a bug in dtschema which I've now fixed.

Rob

