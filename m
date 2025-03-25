Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBB0C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 15:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Subject:
	In-Reply-To:Cc:To:From:Message-Id:Date:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/iyKBpZ/gMwDbddEXmZk60octJQNxxEQdaCmJAOFkuk=; b=urxnFRoRjAAZYvEUR1di0L/odC
	Vta1u3Z2ap2AxbSEKuxfFIrpqQpWFlkWchQQrkNcAlzKH6CIl17HJKkIxramjWZhdJdwo6cJqD2oR
	y2UJEuDwYEIO0AbDX0JHt+pbDngHmbjDqs8k4BwLnIE6d/qxBbagcEpmR0JZu08GDLZuUqByutDoF
	VmD8twgcEEtR6hufP8/5Dii+oFPEvh04+3yQR3pRprlOg+8MLvTxZw2x1sfO88j1um0Jjj54f1y5I
	JYZjuq81Ffu8nLdiUH1CsdoLZGN3yzww265C/iF+eXyqbvhgh6Yj/KKClsCz3BtFXYUCmci9nvXsF
	Jg6fHF5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6R1-00000006MlN-49QW;
	Tue, 25 Mar 2025 15:43:23 +0000
Received: from ewsoutbound.kpnmail.nl ([195.121.94.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6P2-00000006MWs-2mQn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 15:41:22 +0000
X-KPN-MessageId: 9bb3b1c3-098f-11f0-b8e6-005056999439
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 9bb3b1c3-098f-11f0-b8e6-005056999439;
	Tue, 25 Mar 2025 16:41:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=/iyKBpZ/gMwDbddEXmZk60octJQNxxEQdaCmJAOFkuk=;
	b=CMynezLyzHjdxNUe01pPVrV1lbaQ19c/IKefNy0VhdLrl33n8fZnUqe6Krjznw6wRfunerYNhzeCr
	 ZBTi3XX6RrOmG48v9got9i7Yuun1otwlTTGJ5+atsSNodf+c5Nb81Wq8DYFHlEWj6C9ZMQUlkmxexC
	 EhJDockh+DK7Mxvfy/KQtVfy+2enTr1ho6OzJcUqTAp4TyaLwlZAlKwbflOlUTYLeVzAqOKWC/4cAU
	 i4ECWxIGFChcFlZ4B/cndB6aoIwbVEY8uyXp/rg5CQnQTSMtfjscnDLCmJ5H9W1QnNtparzzyREmJ0
	 4Ti8yAP41aJdzZ06gc9kqLncQ8ySrtg==
X-KPN-MID: 33|H4S3zKKDt/kSIctmlzwBbCj8TIujoseVgICSqUP1S8csdBVtOswMNX53d4JhC3b
 J+D5VZcpacU2gX1KCl77mckmkrx5gxY3FO7WLbxtGj5A=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|qkclhlP8gXsHt11V+3wWMyEYiW5D9cl8yFDpUObYky/bnyXgCJbIksIxwb0kULm
 R0HKCIMMJF4wdYpefApOzNg==
X-Originating-IP: 80.61.163.207
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 968f98cb-098f-11f0-af94-005056998788;
	Tue, 25 Mar 2025 16:41:16 +0100 (CET)
Date: Tue, 25 Mar 2025 16:41:15 +0100
Message-Id: <87ecyl6rtw.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, alyssa@rosenzweig.io, j@jannau.net,
	marcan@marcan.st, sven@svenpeter.dev, bhelgaas@google.com,
	lpieralisi@kernel.org, kw@linux.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org
In-Reply-To: <864izhmkzd.wl-maz@kernel.org> (message from Marc Zyngier on Tue,
	25 Mar 2025 11:02:30 +0000)
Subject: Re: [PATCH v2 01/13] dt-bindings: pci: apple,pcie: Add t6020 compatible string
References: <20250325102610.2073863-1-maz@kernel.org>
	<20250325102610.2073863-2-maz@kernel.org>
	<87iknx75at.fsf@bloch.sibelius.xs4all.nl> <864izhmkzd.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_084121_111602_78DB6B5E 
X-CRM114-Status: GOOD (  33.53  )
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

> Date: Tue, 25 Mar 2025 11:02:30 +0000
> From: Marc Zyngier <maz@kernel.org>

Hi Marc,

> Hi Mark,
> 
> On Tue, 25 Mar 2025 10:50:18 +0000,
> Mark Kettenis <mark.kettenis@xs4all.nl> wrote:
> > 
> > > From: Marc Zyngier <maz@kernel.org>
> > > Date: Tue, 25 Mar 2025 10:25:58 +0000
> > 
> > Hi Marc,
> > 
> > Sorry for not spotting this in the earlier versions, but:
> 
> No worries -- I expected issues in that department.
> 
> >
> > > From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> > > 
> > > t6020 adds some register ranges compared to t8103, so requires
> > > a new compatible as well as the new PHY registers themselves.
> > > 
> > > Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> > > [maz: added PHY registers]
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > ---
> > >  Documentation/devicetree/bindings/pci/apple,pcie.yaml | 11 ++++++++++-
> > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/pci/apple,pcie.yaml b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
> > > index c8775f9cb0713..77554899b9420 100644
> > > --- a/Documentation/devicetree/bindings/pci/apple,pcie.yaml
> > > +++ b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
> > > @@ -17,6 +17,10 @@ description: |
> > >    implements its root ports.  But the ATU found on most DesignWare
> > >    PCIe host bridges is absent.
> > >  
> > > +  On systems derived from T602x, the PHY registers are in a region
> > > +  separate from the port registers. In that case, there is one PHY
> > > +  register range per port register range.
> > > +
> > >    All root ports share a single ECAM space, but separate GPIOs are
> > >    used to take the PCI devices on those ports out of reset.  Therefore
> > >    the standard "reset-gpios" and "max-link-speed" properties appear on
> > > @@ -35,11 +39,12 @@ properties:
> > >            - apple,t8103-pcie
> > >            - apple,t8112-pcie
> > >            - apple,t6000-pcie
> > > +          - apple,t6020-pcie
> > >        - const: apple,pcie
> > 
> > Since the T602x PCIe controller has a different register layout, it
> > isn't compatible with the others, so it should not include the
> > "apple,pcie" compatible.  The "downstream" device trees for
> > T602x-based devices do indeed not list "apple,pcie" as a compatible.
> > So I think this needs to be written as:
> > 
> >   compatible:
> >     oneOf:
> >       - items:
> >           - enum:
> >               - apple,t8103-pcie
> >               - apple,t8112-pcie
> >               - apple,t6000-pcie
> >           - const: apple,pcie
> >       - const: apple,t6020-pcie
> 
> Ah, indeed, that's a good point. Thanks for that.
> 
> Whilst I have your attention, how about my question below:
> 
> >
> > >  
> > >    reg:
> > >      minItems: 3
> > > -    maxItems: 6
> > > +    maxItems: 10
> > >  
> > >    reg-names:
> > >      minItems: 3
> > > @@ -50,6 +55,10 @@ properties:
> > >        - const: port1
> > >        - const: port2
> > >        - const: port3
> > > +      - const: phy0
> > > +      - const: phy1
> > > +      - const: phy2
> > > +      - const: phy3
> 
> Do we need to make this t6020 specific?
> 
> Obviously, separate PHY registers do not make much sense before t6020,
> but I couldn't find a way to describe that. I don't even know if
> that's a desirable outcome.

I don't think there is a way to do that other than creating a separate
binding for t6020.  But I'm far from a dt-schema expert.  Maybe robh
has some advice here.

