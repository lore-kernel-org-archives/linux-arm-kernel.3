Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11189CEB2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Vqb7SuC6LdXp/wdF4JsayTM+a28625NUpBifotjx9o=; b=IiPeKxCWUoDmgr9WQZbu9OmKnT
	IKmKm+o0v4utg4lT8JyDtLIWocRKgHeFW749y9sM9+npRYrt3aeXBqJdYVWUl0UL5I1F0ZC0MgX9c
	57eMmBPQnCwms+TCryC3mj6ef/fM0LKAIiqWUn8pS48itBQ+fXxJSWLhth+/m2ppdOxZsgEjVY4fF
	AzC6fJ4aKIq44IbAnTeq36qHuD790cJ/V2i5YnMVvEVg80x/ExupiL8h6M01NfUosUc5Wo05FtM2+
	V6rj6Xhe+mH2gjpH4Ztr94TWJzHyrc8Pd0EgWi0RMsbAEWdntdcAjz1Fhv57iN6okbtVjf73Gk6+2
	FHDwfCGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKCy7-0000000Dfrc-04AY;
	Sat, 15 Nov 2025 09:53:19 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKCy3-0000000Dfqv-3rVx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 09:53:17 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-343806688c5so2672864a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 01:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763200395; x=1763805195; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Vqb7SuC6LdXp/wdF4JsayTM+a28625NUpBifotjx9o=;
        b=abe3YKyu8BUWxKYmY5bZk8WIIfyGT+tCVWuu2qkSsSOOkxqmIWXu9930Of1AS6SBwt
         CYAQuGR4PYOvkNFITCoJsjQQcLXeDx5hTerTec/6QbYsmtX841VNFUde622KQoiEv23I
         VNG9ZVUsCEVajCI7P+uHJ0UjnKcQSyZcEAwzuMxZMuvW+Fsb4KGTH/zbdWDHYlWckthc
         vukv+cCLefyRC2UdQYVS0MastmQRNXIx2+wtEx3tXw+C2a4GJT8DUhAcpprmx4ixmnIE
         qhtH9vs0V5FaELQJnMhPWFMFValFnMAV+x0qZq/jWSHyliAY539spLkgMjZ1ZtDkrF0l
         yoXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763200395; x=1763805195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Vqb7SuC6LdXp/wdF4JsayTM+a28625NUpBifotjx9o=;
        b=s43QhwOsjQWpWrpUBHMRMbFeZQklACrXzHQz1X9BBXNY4Cjo19rHtexKdvINTo9Jb/
         oAUyoi8AIpbH/Npj4jBWyyMH0h9HN0YcDwyYBjVxE9QeXGYkHRZRrrUR4Tle4zq9mE4+
         WiIQ4AaKB5JEK17JCqLNKuk1pj/psQFPEf9WV6fe7NXTX5S1AEGxjLEx2LqzYRKb0El5
         Ri8fUxjnRquGiTfH58X9Oph0I0udE1lsWZXaenSVoOrGlZEslgTkOkLd42lNQ0GIg9bf
         Am9Jx0lvPgI6+VfEXvYywgI2b0ejRoi0EfTaDL4ClpHIIF0YKffJ789qWXq7JhY0MoM2
         2iHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5x9kx5xkmJoWqUMy0UZPU3GW9Z528cTe5akDyk5nIxvA8I8xjAecbHXaFOcIqTy9koDaMtyDjv63LawaB5e7h@lists.infradead.org
X-Gm-Message-State: AOJu0YyjKaHFNGUb/HeJb/uYaLCmwoeswBIZY7tXviVnhHu1dTM0bmey
	QJp5WgnB04fRTaiAq1sMknebF5x1fk+cTGJZOp0MtOM3/EgK6COSuPRE
X-Gm-Gg: ASbGnctEXtVnrONuLESuEPiDxBFNvAKs+IZBbrh4ABsW4qoRU0F3tL9O4RxhhxQSCta
	jxy7DMX29I9kNFuQRfdiuW00I34vX5uDS0u8UESZS32ktzuKCHNqL6XC008p0R2oc71oICqlYg4
	xxrolMV322S4FZt6x7lc9ia3WA2h38J7ozX26ec3SLqk8FZ8lz2TEcIoUyoinDLGiPo8Ev1zFR2
	4loxc53YVeB+fMEtGSxfk++53qdrKWKgSAppXVECjCj7/6x1vCW4e8ROvlvjF0NgIX4ufTL3L02
	EyJ0V6lx4tLScUFaOHhIK8gf3n0u4cD+v1miiwqQS30T873bikn1r+ot9Je7SLFmy1ejePBMAbo
	gp65wrGH9JXImv1S4aWXlNPT5ORPYex3vnBN8ZmNf8vL+SK76vISQitHbr7WDrgWbggJLOTWqbw
	==
X-Google-Smtp-Source: AGHT+IEYodkeyJHv+xttwJ6T2c5dA0IZP7idIsWFckZLeRS6DJQ3X3PmhrR/pJfn24PkyDvZSHZZRg==
X-Received: by 2002:a05:7022:5f14:b0:119:e55a:9bff with SMTP id a92af1059eb24-11b4120001bmr1447186c88.27.1763200394907;
        Sat, 15 Nov 2025 01:53:14 -0800 (PST)
Received: from geday ([2804:7f2:800b:a121::dead:c001])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b06088625sm20242225c88.8.2025.11.15.01.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:53:14 -0800 (PST)
Date: Sat, 15 Nov 2025 06:53:08 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: drop max-link-speed = <2> in
 helios64 PCIe
Message-ID: <aRhNhKjneo1Ny0O6@geday>
References: <cover.1763197368.git.geraldogabriel@gmail.com>
 <53332edec449b84d8a962f2b5995667766359772.1763197368.git.geraldogabriel@gmail.com>
 <3f13841d-030b-0202-61be-412c0ab9df6b@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f13841d-030b-0202-61be-412c0ab9df6b@manjaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_015315_981251_AAC17BDF 
X-CRM114-Status: GOOD (  22.11  )
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

On Sat, Nov 15, 2025 at 10:36:17AM +0100, Dragan Simic wrote:
> Hello Geraldo,
> 
> On Saturday, November 15, 2025 10:10 CET, Geraldo Nascimento <geraldogabriel@gmail.com> wrote:
> > Shawn Lin from Rockchip strongly discourages attempts to use their
> > RK3399 PCIe core at 5.0 GT/s speed, citing concerns about catastrophic
> > failures that may happen. Even if the odds are low, drop from last user
> > of this property for the RK3399 platform, helios64.
> > 
> > Fixes: 755fff528b1b ("arm64: dts: rockchip: add variables for pcie completion to helios64")
> > Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
> > Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
> > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> > index e7d4a2f9a95e..78a7775c3b22 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> > @@ -424,7 +424,6 @@ &pcie_phy {
> >  
> >  &pcie0 {
> >  	ep-gpios = <&gpio2 RK_PD4 GPIO_ACTIVE_HIGH>;
> > -	max-link-speed = <2>;
> >  	num-lanes = <2>;
> >  	pinctrl-names = "default";
> >  	status = "okay";
> 
> Looking good to me, this rounds up the prevention of issues
> coming from buggy PCIe Gen2 on RK3399.
> 
> Please feel free to include
> 
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> 
> Though, could you, please, add patch 4/3 to this series, which
> would remove the redundant parameter "max-link-speed = <1>" from
> rk3399-nanopi-r4s.dtsi?
>

Thanks for catch, will certainly be included in v2 after I get a few
more reviews.

Geraldo Nascimento

