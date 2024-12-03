Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F2AE74AC1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 16:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RbkegQEjWqxbEPHewAWlZuLvIFMHjFQ/a1uprEJuQrc=; b=M6T/o6a+VrlnWlsBY0DRwJSFcm
	efU70l1oe49a717bIz3y9nlBOIfiD8N2TpZ5Pyyq/OIzu/X4pdonqZtynV6w7CPRK/5YleBO+wXs0
	8Y0IpJyMDUZG35C5NbZ4wOI7jU27EvyfuE27bQGrlfdYW7CLmEh7ELrY2VbktHQ7tjRpobQN9MftT
	aX6ukVCgm/wcWUoEVpGlt9NKhTIZN/gEBEiXTR8dUe362Lm6/JwW0fANjdtMNYe94PuR7tPFa85FM
	EDUuh5uUfOSjDIni85FVpcPbXu9yYKiFB2GHNkDUQA0fh/jKJhThCZmhM5lwdCYaUjMEQT11P2OPp
	cQPBYchA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVPn-0000000A2gg-0Y2O;
	Tue, 03 Dec 2024 16:06:19 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVOl-0000000A2Wt-0wWX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 16:05:17 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43494a20379so47052875e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 08:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733241913; x=1733846713; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RbkegQEjWqxbEPHewAWlZuLvIFMHjFQ/a1uprEJuQrc=;
        b=K8Ds7p1NJ9F0aXBxGWEsy0VjKvLaCfLflckLvqppVPw9WDUjwLPmKFZqbXtR54xVsG
         Ar0PJ3A7dgUZvTvbb4c9G5B/61thESkVlmSYwLUsA6byH5Sr8lHCqWOYGB8W0biKNZDE
         wA7Xrb9vD4wsdaeBTnQbWiHvqBxAvK4K3CdPM3DzGZJE54Vc6o6R188wv0qO3nJ6CW+t
         Wqh5VPB4gpGxYgsACIKnnBXkCF6H2iiadaP4LZil4yra7VZRQCn37NwoLEWBZN66yKlH
         Q1S4cTYca24U45wVDtKNBpUMRkVzzeTUJEooDB/M7PwS1swnEhWhcdNrCJm2gNFuTdV2
         Twsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733241913; x=1733846713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbkegQEjWqxbEPHewAWlZuLvIFMHjFQ/a1uprEJuQrc=;
        b=mDwS7fG/3j6qUpmzMURzBIPS68q8IZSqaAXexhtvvoHDOrzdXF4FiO0xVA5J81RvLN
         v5wD1lEeXDW06Cms1Itw+3REH4VK4vLRSfZgTh0beXHIYX/4uLpxetc2l0EYUudTOhz/
         eKrV4tyiulNgS39pr5ST60EBSsKVRmeUhpMFLI+qQJy8dPyiI7OJa+KK8NLQJKiV7z/R
         QKUedzx1zX+DzLt+hs0cpCUcNPsQp1wGZ2+OLwy5TwJc7rJ3X6kDYTnihiLZv4jbrSAO
         n0aQ+c7DgLwhnDg/OjjmXOHJ9ThK2JQ/GZOA1R1EEk15UsnAOwMMzOZNiOYdd0zNlx4q
         0XyA==
X-Forwarded-Encrypted: i=1; AJvYcCWF/1hP/cZVuok/kuu9MzP1BaCurvjWaejX3fHzYM0stsy/RKsK6SBfPkJthvi9e01HNuVlLLpG70trhpW25rof@lists.infradead.org
X-Gm-Message-State: AOJu0YyhEvl6Z/TNi/4SdGwX6NIjYQmZvTojALq6Tmvmwj3kFQFKxmgY
	/JCEn56eQg6LIMiIkUMr+nDHvmVGnfVWnS7iKBLZ1syZR06mRuQNGqvEYwCnYbc=
X-Gm-Gg: ASbGncuBl+XrDipK6y0mlvJVN0MoRUW1iSNzo0txLVKzA8SBcnIYcZExLWwYaOu/PFR
	xf7g0N9J9Tdaywk6UsQO5L9avm1k7TJm+vHl+9LagENyRFiHONM7/inCeAj3Tl5z1MwIux6NLX3
	GqozPkecOjnjxBC5lWxyUxUjK6lzGdOHce78ZoOFqzEMbWQ2uokyl+4eUWo9YkeEdkm5UyQgBSy
	p3dJTfKX9pE7ARfAlIdC2fY8NUqt8i0uL837SQt5VMpQSZ8fwL6nWv+B3YHQw==
X-Google-Smtp-Source: AGHT+IFBeGxc9ewKOyLt6K1s6+sAqOV/yQmsHZjqJ5HZW1/QpKIblYPp2E3dP2IzrA43ijCRwjHlqQ==
X-Received: by 2002:a05:600c:4708:b0:434:a555:d0d with SMTP id 5b1f17b1804b1-434d0a15333mr27229125e9.29.1733241913233;
        Tue, 03 Dec 2024 08:05:13 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef80:41ad:5703:2486:8f59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa74f05asm224377395e9.1.2024.12.03.08.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 08:05:12 -0800 (PST)
Date: Tue, 3 Dec 2024 17:05:06 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Johan Hovold <johan@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Add USB multiport
 fingerprint readery
Message-ID: <Z08sMkbLF0b1DZTp@linaro.org>
References: <20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org>
 <20241118-x1e80100-crd-fp-v1-1-ec6b553a2e53@linaro.org>
 <Z07bgH5vVk44zuEH@hovoldconsulting.com>
 <Z07r3Upr50vLluyn@linaro.org>
 <41106fd7-5348-4d21-9ae7-8466f5634b4c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41106fd7-5348-4d21-9ae7-8466f5634b4c@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_080516_077824_B5CF0043 
X-CRM114-Status: GOOD (  47.27  )
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

On Tue, Dec 03, 2024 at 09:07:22PM +0530, Krishna Kurapati wrote:
> On 12/3/2024 5:00 PM, Stephan Gerhold wrote:
> > On Tue, Dec 03, 2024 at 11:20:48AM +0100, Johan Hovold wrote:
> > > [ +CC: Krishna, Thinh and the USB list ]
> > > 
> > > On Mon, Nov 18, 2024 at 11:34:29AM +0100, Stephan Gerhold wrote:
> > > > The X1E80100 CRD has a Goodix fingerprint reader connected to the USB
> > > > multiport controller on eUSB6. All other ports (including USB super-speed
> > > > pins) are unused.
> > > > 
> > > > Set it up in the device tree together with the NXP PTN3222 repeater.
> > > > 
> > > > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > > > ---
> > > >   arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 48 +++++++++++++++++++++++++++++++
> > > >   1 file changed, 48 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > > > index 39f9d9cdc10d..44942931c18f 100644
> > > > --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > > > +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > > > @@ -735,6 +735,26 @@ keyboard@3a {
> > > > [...]
> > > > @@ -1260,3 +1288,23 @@ &usb_1_ss2_dwc3_hs {
> > > >   &usb_1_ss2_qmpphy_out {
> > > >   	remote-endpoint = <&pmic_glink_ss2_ss_in>;
> > > >   };
> > > > +
> > > > +&usb_mp {
> > > > +	status = "okay";
> > > > +};
> > > > +
> > > > +&usb_mp_dwc3 {
> > > > +	/* Limit to USB 2.0 and single port */
> > > > +	maximum-speed = "high-speed";
> > > > +	phys = <&usb_mp_hsphy1>;
> > > > +	phy-names = "usb2-1";
> > > > +};
> > > 
> > > The dwc3 driver determines (and acts on) the number of ports based on
> > > the port interrupts in DT and controller capabilities.
> > > 
> > > I'm not sure we can (should) just drop the other HS PHY and the SS PHYs
> > > that would still be there in the SoC (possibly initialised by the boot
> > > firmware).
> > > 
> > > I had a local patch to enable the multiport controller (for the suspend
> > > work) and I realise that you'd currently need to specify a repeater also
> > > for the HS PHY which does not have one, but that should be possible to
> > > fix somehow.
> > > 
> > 
> > I think there are two separate questions here:
> > 
> >   1. Should we (or do we even need to) enable unused PHYs?
> >   2. Do we need to power off unused PHYs left enabled by the firmware?
> > 
> > For (1), I'm not not sure if there is a technical reason that requires
> > us to. And given that PHYs typically consume quite a bit of power, I'm
> > not sure if we should. Perhaps it's not worth spending effort on this
> > minor optimization now, but then the device tree would ideally still
> > tell us which PHYs are actually used (for future optimizations).
> > 
> > For (2), yes, we probably need to. But my impression so far is that this
> > might be a larger problem that we need to handle on the SoC level. I
> > have seen some firmware versions that blindly power up all USB
> > controllers, even completely unused ones. Ideally we would power down
> > unused components during startup and then leave them off.
> > 
> 
> This question might be a dumb one, if so please ignore it.
> 
> But if we skip adding unused phys in DTS node, the core driver wouldn't have
> access to all phys and we wouldn't be able to get references to unused ones
> (un-mentioned ones in DTS). So how can we power them off from core driver if
> we don't have reference to them ?
> 

The question is not dumb at all, it's a very valid one. :-)

Perhaps it's easier if we keep them all listed on the USB controllers
and have something else to mark them as unused. The downside of that
option is that we might not be able to have a complete description of
the PHY with all resources. For example on the CRD there is no eUSB
repeater we could model for the first USB port (usb2-0), but it's needed
to enable the qcom,x1e80100-snps-eusb2-phy.

Thanks,
Stephan

