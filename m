Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DC5CEB2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 09:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7yRRIzPGF37+ZW/9QuVq1mSuHX636hF32XUa+RdwYXc=; b=NH9DRLK0OK9MHK8EIhFatgqyPw
	fxwflZErnEzyiXRZfOSl2uhUgO3BwCKdM7EjPfJ0Wf9rFhEaWNHKfzAcYDzMfnFZw0nK/GS5wbq3W
	XSN/h5Q2heCm8fKbdX1/iFo+CGLF975FOdo/qMdeBqupN6RtFNh/RAXxxdBOw1njRm9OlQU3ymrC/
	VK/XtgtLF/ulyYSO7XO82Uzr6vbpWBaRc4QbNDOXLiWDM2usnIAQa3Ze4O7MBTJbgkIE9iwREAZqL
	Q/yzJFRO+ac6tqKHU2hpu0UDyRepypOp1Nrg8uE3vhYqUTaZE0kAwknDAyvVbya1RPSDo0ejEj5/X
	4FE8JBzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKCwW-0000000DfTZ-1S3n;
	Sat, 15 Nov 2025 09:51:42 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKCwT-0000000DfSl-0kzH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 09:51:38 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7bb3092e4d7so1227948b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 01:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763200296; x=1763805096; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7yRRIzPGF37+ZW/9QuVq1mSuHX636hF32XUa+RdwYXc=;
        b=jiyGkYypF95th3o8rKWb3Dx8xdBr0FTz8yjWRoigduQJYtSKN5aJ67uBe2eXFIsa3J
         WP0U51E9tcMkh42Z84TZ9A2ORW1y6XOZOmT4AEKpuFACbRauL/sLvQ5EAQI+LtQuCVI9
         /NwYRld96pgbXAD3eNxbvtQsMTirG4JHAGJtqsO0oBWCvTwqmcu0i/iaxWTqT7SJ1edy
         +NDLAzBpIBD06hVQTAOp6LDTk9stUBGsxRzrCnQNZoibhDjQsQ0u+VSIOK+jEH13UCdB
         r2kdn2sQzZh+sGu0LIc1oxfVdS9WqEDFA+USx8jJUXLLAOQ3bpFYRurbupKBsZyYXE2c
         Flfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763200296; x=1763805096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7yRRIzPGF37+ZW/9QuVq1mSuHX636hF32XUa+RdwYXc=;
        b=iEx4PxvkB1hXPDbKCFlKijo7CkjH8sxbMaTYSG4Mkv5C+4/KTZunwUPK6brX72UsXE
         b0d0I01OJusDdDIv9c+BgUbOHHCAA+OkwXBZJBXNsrQL51CjqxourKaPAPKyTB+DZe7V
         /M1QJwtHKfVmb7BH++HojO32WWyAWEaTEIsdNwi+jnR9mZrWixuOaKYZyQwdWPPgia5L
         pPu6MUMOLT4fK03gPEzngcukbUx3fpAPiYP7a8Bb9sDaqSeJCj3RvW+qbwFd7qNatnFX
         T4SPbjisrd4PGcn6jwa62Vv2ZB7P0Geg5H1SVFKrf5Sli4JXGHIonh04YJP429pZeTvL
         UHQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpgncGInDK9pZLLAL91ugyy3mSY6eIw7Q4dh8Cxq+LBxLN1chlFi0SDR5/xMUWfQRZgsSrw96Ip4F1cJKdEH3e@lists.infradead.org
X-Gm-Message-State: AOJu0YxyK/dtTiYTrO7MoMVrrDejTt2VHPHu86/WtpWYSfgab2v8EC4D
	HI+iTeRW0Spyh9TOl0rB0yc1+9MCwWsEk9ct5Th3rEtyfN3mn5klPuJ9
X-Gm-Gg: ASbGncuNn5eTokz9pnFVRNl6/L/boCRkeEMKF6sHQYaMULuDeI0kXVg28SWSrbPsG3N
	G77vJytddvNjnpbi0l7fMojZOUPz7E3kZKnX/FFJTPRPHbRbnZCDtfxu3MUuVIe3l44b9oWGg5+
	iweleh9ndhtSveAvSVbkRU+TWXE5+LvCcvm59sYVU6agy98groeM0n+ZKv0JWcYjEWGwMS3T0tm
	BIGVCwtBB4rS+C+ot4fkhm0l8vbi24H74hmMNXuLafQJy0fWvtzmAZVFmPIgtRxtSA20kx9ZTAy
	P2OMz+dKSVFyaarAiy2469vN2O7J/sNb+efh8n2gyUcxvf24RokR2cam/WBMCJEJ8viCK4iJIrs
	tmG/tU5nLgEgd804TY6uviw462SoibepbzImSzn+3jxej+6hHRJFaQ0gjgfm+kQwOfv4XetiLAA
	==
X-Google-Smtp-Source: AGHT+IHDzihlPaHj5ciPC1avrMW/DUXWk3g/TfMMzpdbx9pWLRPYDr6Bl34n8EK+fex8PZCS0cSmgg==
X-Received: by 2002:a05:701b:2803:b0:119:e569:fbad with SMTP id a92af1059eb24-11b411fd316mr1430818c88.28.1763200296250;
        Sat, 15 Nov 2025 01:51:36 -0800 (PST)
Received: from geday ([2804:7f2:800b:a121::dead:c001])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49db102f5sm16211340eec.4.2025.11.15.01.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:51:35 -0800 (PST)
Date: Sat, 15 Nov 2025 06:51:29 -0300
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
Subject: Re: [PATCH 2/3] PCI: rockchip-host: comment danger of 5.0 GT/s speed
Message-ID: <aRhNIcGcQKp2ylqN@geday>
References: <cover.1763197368.git.geraldogabriel@gmail.com>
 <b04ed0deb42c914847dd28233010f9573d6b5902.1763197368.git.geraldogabriel@gmail.com>
 <c8a6d165-2cdd-cd0d-4bed-95dfa5ff30d2@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8a6d165-2cdd-cd0d-4bed-95dfa5ff30d2@manjaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_015137_241235_DA29262D 
X-CRM114-Status: GOOD (  21.44  )
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

On Sat, Nov 15, 2025 at 10:30:49AM +0100, Dragan Simic wrote:
> Hello Geraldo,
> 
> On Saturday, November 15, 2025 10:10 CET, Geraldo Nascimento <geraldogabriel@gmail.com> wrote:
> > According to Rockchip sources, there is grave danger in enabling 5.0
> > GT/s speed for this core. Add a comment documenting that danger and
> > discouraging end-users from forcing higher speed through DT changes.
> > 
> > Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
> > Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
> > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> > ---
> >  drivers/pci/controller/pcie-rockchip-host.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
> > index ee1822ca01db..7e6ff76466b7 100644
> > --- a/drivers/pci/controller/pcie-rockchip-host.c
> > +++ b/drivers/pci/controller/pcie-rockchip-host.c
> > @@ -332,6 +332,11 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
> >  		/*
> >  		 * Enable retrain for gen2. This should be configured only after
> >  		 * gen1 finished.
> > +		 *
> > +		 * According to Rockchip this path is dangerous and may lead to
> > +		 * catastrophic failure. Even if the odds are small, users are
> > +		 * still discouraged to engage the corresponding DT option.
> > +		 *
> >  		 */
> >  		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);
> >  		status &= ~PCI_EXP_LNKCTL2_TLS;
> 
> Looking good to me, thanks for this patch!  There's no need
> to emit warnings here, because they'd be emitted already in
> the rockchip_pcie_parse_dt() function.
> 
> Please feel free to include
> 
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
>

I disagree, I think the comment stands.

Even if we reduce to one line, ex:

+ May cause damage

Regards,
Geraldo Nascimento

