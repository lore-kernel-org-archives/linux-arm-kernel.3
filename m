Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA90C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 07:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zX3SXc9F5y9akHBalpx7JJ69F5zZLipJTmxPwy4j2uA=; b=Qk/XF4B9iY7YFez9FFD+zI/5Vd
	PpP5ZT2dO1SgOb349Rks4nBRuzQZQDIrfP5j5xZpn4Dqd6F0TaY8u2xfRB1Glf2Rywubgz4W6Pk51
	ouW9vUimoAiUo3Vnd88aa52f6hZhrUic+AJeK5eIl7Q0AVYl1Yk5GCcPX3pI45t3UNpah0DH9+3D7
	9v2+5JBoda7/6NZX2+/vyxMPpDzqzZfzOUhfagfzMkJIsNxMMiOZOvSV9f5DiUPb4RHbC8BCLInWK
	mWwiJjgm1ox+ydQsBrgHH+jU07hvc+Lrn43joUhYFgiGpK+puieeRGPVBh5DaKSPd98KwGb4Q4Wt/
	zujXoLhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hFx-0000000GrQr-31tN;
	Mon, 07 Apr 2025 07:50:57 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gpS-0000000GkK9-2wP2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 07:23:37 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 6320B1F91A;
	Mon,  7 Apr 2025 09:23:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1744010608;
	bh=zX3SXc9F5y9akHBalpx7JJ69F5zZLipJTmxPwy4j2uA=;
	h=Received:From:To:Subject;
	b=lq3Af87W53fGWbfZKcvotScickDanNLw7phSBvWfVDpC6qnYeKFfSeyzAwajL5VSK
	 P2EZYKKQ+aUOzSMnx3ZS7cwPbLj3yupC+QdfPUbd/vOYUsliKLl3l7K/HSFpDYb0HM
	 Zmblnh85Ule4w24dU3wpwgQPOlBnxErplu970LypcB3adKqJaPgJ7kkGW3tSA8FHWo
	 DPWkayO7avEgjDY30vN5JT7Yf69yC8eHcindRRgMOjfZNM8yr6HxtBR+HEkLLmU6u9
	 Z3o/oqtlKT45GG+pLjLqmyiNY0ozlycr9FBk7QaB7TwTxFD2UqXoErLlQHSW5PV/dX
	 vBB6ZXYAVRxXw==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id 1F94E7F8D5; Mon,  7 Apr 2025 09:23:28 +0200 (CEST)
Date: Mon, 7 Apr 2025 09:23:28 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Hongxing Zhu <hongxing.zhu@nxp.com>,
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	dl-linux-imx <linux-imx@nxp.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2 2/4] dt-bindings: imx6q-pcie: Add wake-gpios property
Message-ID: <Z_N9cO64FZwONcK9@gaggiata.pivistrello.it>
References: <20231213092850.1706042-1-sherry.sun@nxp.com>
 <20231213092850.1706042-3-sherry.sun@nxp.com>
 <20250404094130.GA35433@francesco-nb>
 <DB9PR04MB8429588E7CF00BDC9CDA863F92AA2@DB9PR04MB8429.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB9PR04MB8429588E7CF00BDC9CDA863F92AA2@DB9PR04MB8429.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_002335_810855_E784F463 
X-CRM114-Status: GOOD (  26.40  )
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

On Mon, Apr 07, 2025 at 07:18:32AM +0000, Sherry Sun wrote:
> 
> 
> > -----Original Message-----
> > From: Francesco Dolcini <francesco@dolcini.it>
> > Sent: Friday, April 4, 2025 5:42 PM
> > To: Sherry Sun <sherry.sun@nxp.com>
> > Cc: Hongxing Zhu <hongxing.zhu@nxp.com>; l.stach@pengutronix.de;
> > lpieralisi@kernel.org; kw@linux.com; robh@kernel.org;
> > bhelgaas@google.com; krzysztof.kozlowski+dt@linaro.org;
> > conor+dt@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > kernel@pengutronix.de; festevam@gmail.com; dl-linux-imx <linux-
> > imx@nxp.com>; linux-pci@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; devicetree@vger.kernel.org; linux-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH V2 2/4] dt-bindings: imx6q-pcie: Add wake-gpios property
> > 
> > Hello
> > 
> > On Wed, Dec 13, 2023 at 05:28:48PM +0800, Sherry Sun wrote:
> > > Add wake-gpios property that can be used to wakeup the host processor.
> > >
> > > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > > Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> > > b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> > > index 81bbb8728f0f..fba757d937e1 100644
> > > --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> > > +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> > > @@ -72,6 +72,12 @@ properties:
> > >        L=operation state) (optional required).
> > >      type: boolean
> > >
> > > +  wake-gpios:
> > > +    description: If present this property specifies WAKE# sideband signaling
> > > +      to implement wakeup functionality. This is an input GPIO pin for the
> > Root
> > > +      Port mode here. Host drivers will wakeup the host using the IRQ
> > > +      corresponding to the passed GPIO.
> > > +
> > 
> > From what I know it is possible to share the same WAKE# signal for multiple
> > root ports. Is this going to work fine with this binding? Same question on the
> > driver.
> > 
> > We do have design exactly like that, so it's not a theoretical question.
> > 
> The current design doesn't support such case, maybe some changes in the
> driver could achieve that (mark the wake-gpio as GPIOD_FLAGS_BIT_NONEXCLUSIVE
> and the interrupt as IRQF_SHARED, etc.).

Can you consider implementing this?

> But usually each RC has its own WAKE# pin assigned. We have not come across a
> case where multiple RC share the same WAKE# pin.

We do have such design, with an NXP iMX95 SoC, available now.

Francesco


