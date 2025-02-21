Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94ACDC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 16:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRTsnqJOcW9dv6K1o7IPoOwJKef7SDuchvpYt2J5j+s=; b=WyDgn3Lfjm2G/zDl+HFcI/whgy
	hKc8r8EpUZnMhnpzO5weqm3dqgnRl6CMptnfg145G77NoaRotoaHScagR4+y3yD9TrskMngjqivuw
	fqeYwFm5xcNcV395Q3Dw9r1ZyC7MSYBhIqJvfxyfJBqlhu4qskbBMCykP9rGRhnYlTcHdYaAuDll/
	9rAViZwt2k23U0dOO+d9coq2mnWwSoG2NPFCA3q6PMubLkMN3Dh90jEkTiw5+sdTbDpu52v6B7yYl
	UrdMQQSITQq2A2xjsuCQJ56L2RNGabYyYNTfaFd/faNJXHHAPQMsxSm16Nz03XslxIGECiGpBH0I+
	2ZV6xmng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWG3-00000006GCO-3m34;
	Fri, 21 Feb 2025 16:52:11 +0000
Received: from mail-pl1-f175.google.com ([209.85.214.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWEZ-00000006Fwd-1tTi;
	Fri, 21 Feb 2025 16:50:41 +0000
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22104c4de96so41889665ad.3;
        Fri, 21 Feb 2025 08:50:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740156638; x=1740761438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRTsnqJOcW9dv6K1o7IPoOwJKef7SDuchvpYt2J5j+s=;
        b=qRjEL3ienCkI+Qil7l6t2lmTMHicjLSHXO9oSGzTaPDj9zuQNJCRekuLQkdPxiopcV
         NVVVXiaaLSNXnkjaR91pnq+/ymWHfNrbTrRLafWqI8wON/8DjAaiATHRCtO1gRdCJQrH
         3XJcrJQwV94GhuP+vhBxMVnaRIlkYkgWpLhD/etSU3zZcGXzhEMmhv5jYjaTLrhFqtrU
         70z0FxtUHRyZ+XwaKSZp+X7P79u/o/x8TFYG83hXOYOLbFmBhU3kkvG1T3HOwK00Zqk5
         xV+1Q3dr6KQW3UkRCEtcQDLGM606w1MJ309MAqPb1NeykmWd0cxfSaGvX9Vq5c/jqU3j
         P8xA==
X-Forwarded-Encrypted: i=1; AJvYcCUP4rIjL+JQqNvqn8PosUJmUnLokjMfXxGci0LVcsVAAAGr0jWC4lbyrSgB+GaXpv0mXCmm6fkAJ5WLOV3hp+wwqw==@lists.infradead.org, AJvYcCXk43hxNP72shpWyd4/CubTfkJwS7FkO5nDDO3PDt0Oq1B+jGci78X3R5GrA0jkr2sUwkuFHiSpwQ6fTTxygNqi@lists.infradead.org
X-Gm-Message-State: AOJu0YzgA09Bvc/Y8ox9hYed/Sfi07OfZiWUOhy+OHBBYv2W6yqEEsgS
	bCl1pA/J7xeP53CRmnK1mq/1Q6Ziy18CcIW3J9R6xsqg0AntIe/0
X-Gm-Gg: ASbGncuDBQfOBqVTaDeLi6gZpTP6j3ilIg9bV71o0AgeSOR3EijjoRu0dMFBNyJPcXM
	jxuf3bYocaVa6+/korjTLKgyI1luLqgJBV6wpsJSeRTOjY5dnuf708MCzTZbtm4q24kp96wj/TE
	mM7YAtpu1Z1xUdFh0be7+1dQPiBJqf0Xv26eP3GOeAqEcKj8P2i62uxFMy3rCnHSWuJ0hJ8ab+L
	FpCQyzuPdXWMZ8aME4KQvxpI3eZNPSmN8RerBmkKYIcZ6b445LsLF3kjA5w85kSVraICZH6exsr
	JVu6/fYF+040XjqVgdW/hTvG/X+UoUkfFmqw0X9MDf0cZo7AtpulL2KKyE3Z
X-Google-Smtp-Source: AGHT+IFBRf1rTI77c48n4yI4p8/OZKA2ivHDEkKmOMpEqskAZG83w/3TIK2ogD7dfLzN3Nx/aKujfw==
X-Received: by 2002:a05:6a20:8426:b0:1ee:ab62:c37 with SMTP id adf61e73a8af0-1eef3c88ae2mr6789123637.11.1740156637946;
        Fri, 21 Feb 2025 08:50:37 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-add21f2149fsm12375099a12.1.2025.02.21.08.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:50:37 -0800 (PST)
Date: Sat, 22 Feb 2025 01:50:35 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: Jim Quinlan <jim2101024@gmail.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v5 -next 04/11] PCI: brcmstb: Reuse config structure
Message-ID: <20250221165035.GA3992086@rocinante>
References: <20250120130119.671119-1-svarbanov@suse.de>
 <20250120130119.671119-5-svarbanov@suse.de>
 <CANCKTBsm6o9yaSenj-wft+n0uX-HNRjpJjkZaQcn4t474fXtow@mail.gmail.com>
 <CANCKTBuMOk9ASfPydcKHQgaQF4p7m7ryYezcLPdBEM2ao3LY3g@mail.gmail.com>
 <a2f6ab00-7b51-483e-ad10-0ea7ef9bfd90@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2f6ab00-7b51-483e-ad10-0ea7ef9bfd90@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_085039_497200_C5388970 
X-CRM114-Status: GOOD (  17.01  )
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

Hello,

> > Sorry for the late notice but I get a compilation error on this commit:
> > 
> > drivers/pci/controller/pcie-brcmstb.c: In function 'brcm_pcie_turn_off':
> > drivers/pci/controller/pcie-brcmstb.c:1492:14: error: 'struct
> > brcm_pcie' has no member named 'bridge_sw_init_set'; did you mean
> > 'bridge_reset'?
> >   ret = pcie->bridge_sw_init_set(pcie, 1);
> >               ^~~~~~~~~~~~~~~~~~
> >               bridge_reset
> > make[5]: *** [scripts/Makefile.build:194:
> > drivers/pci/controller/pcie-brcmstb.o] Error 1
> > 
> > It appears to be fixed with the subsequent commit "PCI: brcmstb: Add
> > bcm2712 support".
> > 
> > Can you please look into this and see if you get the same results?
> 
> Ah, it is my fault. Thanks for spotting this. This must have happened
> when moving this patch earlier in the series.

No worries.  Things happen.  We can fix everything. :)

> Krzystof,
> 
> I could send a new version of the series or the other option could be to
> rework those two patches in controller/brcmstb?

Happy to modify things on the branch directly.  But if it's easier to send
a new version, then feel free.  Either approach would work. :)

> I will post later the fixes here if you choose the second option.

Thank you, sir, for a prompt reply!  Appreciated.

	Krzysztof

