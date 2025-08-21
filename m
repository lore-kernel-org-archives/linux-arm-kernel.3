Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA82ECA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 19:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNeH8jwIaMIahWPVnKl5loQQejVbwxs7rBb60S32DBI=; b=0B7rLLrTAUrZyNT85LYk0yqJUq
	Mv60Elj4oscC9o8uwNDZCnKMsiTtIjFxanlTvc9Nr/8aNjIm/EiAo8KuizbMBIg5KS2i2GXW9mU1R
	15ifgIp6GCTV2rnhE/1szrl1plY9TFGcGHJfoZR9X4W0Ws5odOjMVvoPELXbCvfHCpBaskHnTvNI3
	Tnli3tUd5m83VYASyQBpXmOHt5HMNuUs0ne9LXSPrjj9wpYC5DcrIDpol1srJKX02aDd7nsICbC4g
	kyFJoybMEmKtensdZo/CpGZ7syxp6vFFIFgY0DgkaGrzGlHGgzRS/4zABHNrESuczL6ESEEH1Stzt
	qSPGfLcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upB2Z-00000000JUU-2b1k;
	Thu, 21 Aug 2025 19:33:39 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up75L-0000000HKoM-0BDj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 15:20:16 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-3bb30c72433so400976f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 08:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755789613; x=1756394413; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xNeH8jwIaMIahWPVnKl5loQQejVbwxs7rBb60S32DBI=;
        b=B/7UJq2TG54zih5pWG+zIt0+V9lC5G3XB956FWCn3oX4syqpaNm1XIYCqwz18iWOKH
         ReuKt6Twt/zjVRpQyTY46k+1LA+VOf6V8mQNBHqd2ZMTPsTfRhNz630WkA5OjA/wydP4
         xIc3ZPkgByTXPjr1ygtDNOC0Lf8Fp1gkWDBSDIkege47S7CYk697KN9xomeBeesmW+yx
         ctqs3TDKMlN+dXsdxRlVnNvH7pMqOJk6Mzw9X/X/lnGNCVjWchfYcOTxGCTrCdghtE8N
         6Y8ZxajQOc0xK14byq75ILWg7GVy7FWlZYsDehth8UTZ+oRm4BVy4Z7zzL4BmuwkCd6s
         Z4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755789613; x=1756394413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNeH8jwIaMIahWPVnKl5loQQejVbwxs7rBb60S32DBI=;
        b=RHSb8Iv90hISGBz80qnmEuTtaUbWH5jL04NYzXqJV0V5a1x+qbflCI3IHaA/g00GKz
         Ado4oErdH6pqvCn74wWNp/aBLRZlqBjrUVyR31w8CrFCH67g3j+bGrX6OKmmjN6FJtdK
         FkCoBfmZsYdG2x4oAAJxxm8aKNTgJp7UVF0dpdBfMfZU512QvlaXSx7VWazLkhGvtjyF
         PrtvFm5dP1BIfZoNjBvQALO9mvAjhoDBwq8aXrLY5Zrx79eY/sx+dUwAbiP6e1WIz8oO
         Kxqdscwd3sknKUajLA1SAdY/3lhTbyixFpIZ8pPEaneE2xAbMvhdk2E5aqctBt3TIQVJ
         d7Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVGaLFdYJxMGN1JKkLOf111ouvdQZdurqHE0oemsk/09qs7Sal2pEICKQaT1rHLTtye6jIMvDcfSaDvSV6FMkdJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3VR0lR8KQRXtMA1jH4VFlXiuY4OicTCWvIj85vehN/Y6MUvOI
	hChYEWb+p9XXNFP07j6MZHItwicLmLaaKRLZaPQtBLhwwitw5f6giVus/MIQD83rO1A=
X-Gm-Gg: ASbGncs4X4roCBRNz3lrxYBb/vDAbMqdXE9PQzQ5oAfZ8qG8tNyHjGPV1RIaOjUGMtH
	MzdYcEzSw0Hzv79gP2oVgcZOpJXb8R2ehuTAFGwsLkMsbh4US8dXmU8FNQI3F+tXc886+Jb1+nq
	QEFqRZJPtZBf1ozWDJY0LAiSZyRtFgTOelRZLcTG0uDtUNAuZTxKhcm0lZQxNLwIuCUtmkkxjI8
	4OCVbm/sE/QxpXqzZb2fItgHe9K+XS7/A+QOJp8hhbyQhI213Jfn3aBi8hxR8TwKlLdLW+9oT5L
	JLkDtlgV4P6dsQDBa0c400SY0A8Xhe5Bax3NmD1YtrbweKO4wlkFcySPnQUtxV7iS+HhhPupxlt
	P0s/G2C4MGusCdfFcXHxTZrCzWLXU8Zuh8FgPNXQx377yZDjygTRk6aJvNvd5D3E+hPpVoOQ=
X-Google-Smtp-Source: AGHT+IHDN8OczdJt+JNi7lF2guoFhCWb2f4SvtjNNXIrg4sA//TwST6NTNw7zh3uRT3ZYvRmUOk3qA==
X-Received: by 2002:a05:6000:288b:b0:3b8:893f:a17d with SMTP id ffacd0b85a97d-3c497274347mr2450727f8f.49.1755789613394;
        Thu, 21 Aug 2025 08:20:13 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba9077520sm105918256d6.21.2025.08.21.08.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:20:12 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 21 Aug 2025 17:22:04 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, kwilczynski@kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] dt-bindings: pci: brcmstb: Add rp1-nexus node to fix DTC
 warning
Message-ID: <aKc5nMT1xXpY03ip@apocalypse>
References: <20250812085037.13517-1-andrea.porta@suse.com>
 <4fee3870-f9d5-48e3-a5be-6df581d3e296@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fee3870-f9d5-48e3-a5be-6df581d3e296@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_082015_092985_3542DE01 
X-CRM114-Status: GOOD (  23.47  )
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

Hi Krzysztof,

On 10:55 Tue 12 Aug     , Krzysztof Kozlowski wrote:
> On 12/08/2025 10:50, Andrea della Porta wrote:
> > The devicetree compiler is complaining as follows:
> > 
> > arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi:3.11-14.3: Warning (unit_address_vs_reg): /axi/pcie@1000120000/rp1_nexus: node has a reg or ranges property, but no unit name
> > /home/andrea/linux-torvalds/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: pcie@1000120000: Unevaluated properties are not allowed ('rp1_nexus' was unexpected)
> 
> Please trim the paths.

Ack.

> 
> > 
> > Add the optional node that fix this to the DT binding.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202506041952.baJDYBT4-lkp@intel.com/
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> > index 812ef5957cfc..7d8ba920b652 100644
> > --- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> > +++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
> > @@ -126,6 +126,15 @@ required:
> >  allOf:
> >    - $ref: /schemas/pci/pci-host-bridge.yaml#
> >    - $ref: /schemas/interrupt-controller/msi-controller.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: brcm,bcm2712-pcie
> > +    then:
> > +      properties:
> > +        rp1_nexus:
> 
> No, you cannot document post-factum... This does not follow DTS coding
> style.

I think I didn't catch what you mean here: would that mean that
we cannot resolve that warning since we cannot add anything to the
binding?

Regarding rp1_nexus, you're right I guess it should be
rp1-nexus as per DTS coding style.

> 
> Also:
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

In this case it could be difficult: we need to search for a DT node
starting from the DT root and using generic names like pci@0,0 or
dev@0,0 could possibly led to conflicts with other peripherals.
That's why I chose a specific name.

Many thanks,
Andrea

> 
> ... and nodes should be anyway defined in top-level and only customized
> per variant. I am surprised that DTS patch carries a reviewed tag,
> because it was never checked/tested :/
> 
> > +          $ref: /schemas/misc/pci1de4,1.yaml
> >    - if:
> >        properties:
> >          compatible:
> 
> 
> Best regards,
> Krzysztof

