Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C510C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 06:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvHQjz4HS8/DEysD7sahuDq0tXzHbdDL9Q/cpJ25zAY=; b=2nJ+QCBI5DOXAqbwUKFTzIWgk3
	D4gDrV7Hm7tjlOwc+5U/AjeUnEawKDaLYGhBbDY4L6XuIne4hXAKjYec7xG4Z1QK0RpztCBnCF8N8
	9Z53vDjUKFJ0TSv70JC2Mlei/aeScOX9D0SD3LiFBI80DmHfBLLc33u+7G6RHDILbe6pNj24ZGAAF
	alIpjglaYCvb67+niQbPwMpOgm5qQcdTS839s7HWFGvzLvAnRwSr1RCGiv8NndH/YUuJ/WC3HE2pM
	M0ZwTYvFwBBjW+mRa0cT1DiKukyIucIXdGYWfb4apr41gzBkBTy813RBOpjcd16euCOZV/y8gHB9+
	NeOD+ECQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTb3a-00000001oZc-1cqE;
	Mon, 23 Jun 2025 06:53:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTazg-00000001nqO-45w1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 06:49:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C4B26114D;
	Mon, 23 Jun 2025 06:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1310C4CEEF;
	Mon, 23 Jun 2025 06:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750661368;
	bh=r9Scpc1y8oJqW4ki1b+GiwK273muM/HU6bqva5wjWW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Reo5hLSe/U1rF9RuZzNW2HAPmWlHsw75zDA4E9EJZ4CHd1N6CD0yi1jYLiIWjjjZg
	 cS5or16waGa2Abl8GElKRO34Nvj0oBa1vVkX8OpIgZv8CpiUc/Go3s+Bw1FsDTBOC9
	 IJMjK8F3vkEYzed9jRWeIFyTrqBiaUsb5tPNuCf5CpKe0xJ+JaGD7l7osRt4CLdWGF
	 06VNojU6DZZV4Se9G6Z7OQ3jTfkOz8FofW6jMjxBhziH3qVB7UlVQ6PTWx3wXdDdiy
	 tumRgV0cTeXEYZtIDL49sxr9SmCr6aDoxZpkA8pPq0VoOnnQe+J47AVXS3Jp1fBmKB
	 Fl8U4or6V6aZQ==
Date: Mon, 23 Jun 2025 08:49:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Hongxing Zhu <hongxing.zhu@nxp.com>, 
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "mani@kernel.org" <mani@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] dt-binding: pci-imx6: Add external reference
 clock mode support
Message-ID: <6ojwsgzi4rrn7zoiktiutdjgaly4uhbe7xc35lafyxgl5yacwv@oajobetnqsps>
References: <20250620031350.674442-1-hongxing.zhu@nxp.com>
 <20250620031350.674442-2-hongxing.zhu@nxp.com>
 <20250620-honored-versed-donkey-6d7ef4@kuoka>
 <AS8PR04MB8676FBE47C2ECE074E5B14768C7CA@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <130fe1fc-913b-48cf-b2a4-e9c4952354fd@kernel.org>
 <aFVy9OMxL4WXEOzz@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aFVy9OMxL4WXEOzz@lizhi-Precision-Tower-5810>
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

On Fri, Jun 20, 2025 at 10:40:52AM -0400, Frank Li wrote:
> On Fri, Jun 20, 2025 at 03:08:16PM +0200, Krzysztof Kozlowski wrote:
> > On 20/06/2025 10:26, Hongxing Zhu wrote:
> > >> -----Original Message-----
> > >> From: Krzysztof Kozlowski <krzk@kernel.org>
> > >> Sent: 2025=E5=B9=B46=E6=9C=8820=E6=97=A5 15:53
> > >> To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > >> Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de;
> > >> lpieralisi@kernel.org; kwilczynski@kernel.org; mani@kernel.org;
> > >> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > >> bhelgaas@google.com; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > >> kernel@pengutronix.de; festevam@gmail.com; linux-pci@vger.kernel.org;
> > >> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> > >> imx@lists.linux.dev; linux-kernel@vger.kernel.org
> > >> Subject: Re: [PATCH v3 1/2] dt-binding: pci-imx6: Add external refer=
ence clock
> > >> mode support
> > >>
> > >> On Fri, Jun 20, 2025 at 11:13:49AM GMT, Richard Zhu wrote:
> > >>> On i.MX, the PCIe reference clock might come from either internal
> > >>> system PLL or external clock source.
> > >>> Add the external reference clock source for reference clock.
> > >>>
> > >>> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > >>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > >>> ---
> > >>>  Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 7 ++++=
++-
> > >>>  1 file changed, 6 insertions(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.y=
aml
> > >>> b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> > >>> index ca5f2970f217..c472a5daae6e 100644
> > >>> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> > >>> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> > >>> @@ -219,7 +219,12 @@ allOf:
> > >>>              - const: pcie_bus
> > >>>              - const: pcie_phy
> > >>>              - const: pcie_aux
> > >>> -            - const: ref
> > >>> +            - description: PCIe reference clock.
> > >>> +              oneOf:
> > >>> +                - description: The controller might be configured
> > >> clocking
> > >>> +                    coming in from either an internal system PLL or
> > >> an
> > >>> +                    external clock source.
> > >>> +                  enum: [ref, gio]
> > >>
> > >> Internal like within PCIe or coming from other SoC block? What does =
"gio"
> > >> mean?
> > > Internal means that the PCIe reference clock is coming from other
> > >  internal SoC block, such as system PLL. "gio" is on behalf that the
> > > reference clock comes form external crystal oscillator.
> >
> > Then what does "ref" mean, if gio is the clock supplied externally?
>=20
> In snps,dw-pcie-common.yaml
>=20
> 	- description:
>             Generic reference clock. In case if there are several
>             interfaces fed up with a common clock source it's advisable to
>             define it with this name (for instance pipe, core and aux can
>             be connected to a single source of the periodic signal).
>           const: ref
>=20
>         - description: See native 'ref' clock for details.
>           enum: [ gio ]

=2E.. ok, but the rest of description is saying: don't use it.

Best regards,
Krzysztof


