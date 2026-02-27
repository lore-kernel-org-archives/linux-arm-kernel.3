Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FC1104891F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 22:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSRwxud/Sjz5N6XXPU8dLJmT5Ixl2X0gYrwgt+M20jE=; b=NmYmUZASq2FuHV0rZPTkovuKJy
	UxJCsv1/LKyx/JVsv8cg+g4QMCisoWKCa1+Su2gNhE+yL6xlAk+z5xIi9cHn76AE9YPNZdyyfywzm
	kgGDyjyh3CrOlpohALr5TeraisGIvGwE9LqcGS6EZuohjMrMHQTv07eNgAHsHDBD7ivXsKZx4LE6Z
	434X5/CrCs9v3NuhRM2fXpdsc6lx0NKVfbsYcq3jKM+NS/UsB2+UlbS6NxFlEVpaycFcpl35F2Ydg
	Eg+rNit/p/qqYnid79ineCxOTXjqvDav7+gmjXgpRP9CvCFd8XIoZ8GL6aJ3pco1FcuBWsgIj68RK
	6BKcxtZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw6XF-00000009EZC-0MdI;
	Fri, 27 Feb 2026 22:42:13 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw6XB-00000009EYJ-2km5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 22:42:11 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-5ff19e7476bso819686137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 14:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772232128; x=1772836928; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mSRwxud/Sjz5N6XXPU8dLJmT5Ixl2X0gYrwgt+M20jE=;
        b=ODNmOM+BK7hv+pvQLHSDgyC0R2cAMX8SxnO7KTvke3F+bwcFzk5dVjDfQFbIW5GEFU
         29RmnivU4amuNcr6DWciwQGD3mAfbdWYa0wZOByit8MKxbblQFAzrPfdLuZTKrDyfMNR
         eW6ZvCTt+VRFouvVy5En27pjMxolekNTUkVGEAsYjw0UBv1ZmrMpbrDHQ6gA9iiSMfAW
         kOtSWah6AUS2ifUu3C+Cr1YEIOV/KT5e/7iYJuRnKhyI3Bwrl7xEDkltg9YmFasmX/LV
         tOuGIKVpf48uxZHA/7Qc1NC46UvusngLtMD98NBkAPEzFqfdjyTMJ39PPM5g+xXV4QHZ
         TSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772232128; x=1772836928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSRwxud/Sjz5N6XXPU8dLJmT5Ixl2X0gYrwgt+M20jE=;
        b=EUHQE3VW6i/eecw0qM4po35qWhHoXlSwsQ6uUJaz5lII24chzi3e3BAYn1egtCe/Jy
         aWND2KGtyY1i7WmOoP0mFMcJsBrBJjpaqMDPAKaLMXP5aY8VGKmTcP3uXsIFMpzIiwxk
         NY4TY/iYyrzckpHLhEk2X6ONDHPxqyQ3WWZzv2VAP9zbiBMWgOg7tjNErgS7/kjTE0P6
         Bk+yywqsRP+P0VJzfQYQ3CpTBk7AfjKf930IdQuEIR0LBHnqAk43Td0LSaDylb1cI6Uh
         P+Rg8d9FvKz/toKjWgf94QuQreAf8TeGcpt3AXsM0Zr8gnCIbuKx5dQ3QpU75rLmWMgr
         iItw==
X-Forwarded-Encrypted: i=1; AJvYcCWqCswSx4xRcZrplb1+Jls0i+dib1TdwdlizG8W0/1MLDlYkbzUkawQpOeAk1cfZ6HaMBeZuDSdub4ewEa5yFXs@lists.infradead.org
X-Gm-Message-State: AOJu0Ywsunz7n6IUQO15GvvnhDFGQETzo9eo7mRxt/SycTVx+GLFrIuN
	lRB0lTyVWA1R5xB5OLjAISznX2PIj66qZ213psYFgGrI6j7xLLlH9mKa
X-Gm-Gg: ATEYQzwRi0U8G6Mxx6R9ov7b981L7Bwm3TNbAFhY10DuqKRBKtNzRMm5qw7YMyUSrx9
	PyNWDhZ2lnVt7OgNGPfh2lCjB/q32MkOKal6VtpL0HqgjE6XxO2NJdK1JZ88HHPhKnlHtxbGOrf
	iX5swbc1ebElWFdItlniIyj/DEy+VoSK/DsYrJB00yvB7OvX3hm1z9cFhU6R9Cbw1s8S/H8Pe6m
	cV4fCgxsfgT111zOCWuYuzCwo9MG1p8Epo+myy7ukFQ9L3BmTCNK5GK31xo1gbNii2MiVkyBQfp
	5plec3IpnAjvIWbIq40i59QPIfwMTBT6tC1MEfTGJV1HPmDEg5lHA8z5+G/i7HJ4f0X0Rd6nq0R
	eIV23PEkAO+i4gmHfcSuEqYO9+ymURfUCUMIam8DlxyPLzBKTUVKESX+VXKbOu4hShcSzxGEmUo
	71kSUFhD9J3g==
X-Received: by 2002:a05:6102:3f42:b0:5ef:b3fa:c89a with SMTP id ada2fe7eead31-5ff32537f8amr2390137137.32.1772232128028;
        Fri, 27 Feb 2026 14:42:08 -0800 (PST)
Received: from geday ([2804:7f2:800b:feb1::dead:c001])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df6577a4fsm6403120241.10.2026.02.27.14.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:42:07 -0800 (PST)
Date: Fri, 27 Feb 2026 19:42:01 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Charalampos Mitrodimas <charmitro@posteo.net>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>,
	linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] PCI: rockchip: drop 2.5 GT/s defines
Message-ID: <aaIduRsXvcUZrj8E@geday>
References: <cover.1772169998.git.geraldogabriel@gmail.com>
 <5172389ba8d291fe05bc0887bc97fe73f110c5c0.1772169998.git.geraldogabriel@gmail.com>
 <878qceku1j.fsf@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878qceku1j.fsf@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_144209_740783_9AF20CB5 
X-CRM114-Status: GOOD (  25.47  )
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

Hi Charalampos,

On Fri, Feb 27, 2026 at 04:53:00PM +0000, Charalampos Mitrodimas wrote:
> Geraldo Nascimento <geraldogabriel@gmail.com> writes:
> 
> > Drop the 2.5 GT/s Link Speed defines from Rockchip PCIe header
> > definitions. The reason is that Shawn Lin from Rockchip has
> > reiterated that there may be danger of "catastrophic failure"
> > in using their PCIe with 5.0 GT/s speeds.
> >
> > While Rockchip has done so informally without issuing a proper
> > errata, and the particulars are thus unknown, this may cause
> > data loss or worse.
> >
> > This change is corroborated by RK3399 official datasheet [1], which
> > states maximum link speed for this platform is 2.5 GT/s.
> >
> > [1] https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf
> >
> > Fixes: 956cd99b35a8 ("PCI: rockchip: Separate common code from RC driver")
> > Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
> > Cc: stable@vger.kernel.org
> > Reported-by: Dragan Simic <dsimic@manjaro.org>
> > Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
> > Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> > ---
> >  drivers/pci/controller/pcie-rockchip.h | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
> > index 3e82a69b9c00..b5da15601b58 100644
> > --- a/drivers/pci/controller/pcie-rockchip.h
> > +++ b/drivers/pci/controller/pcie-rockchip.h
> > @@ -42,7 +42,6 @@
> >  #define   PCIE_CLIENT_MODE_RC			HWORD_SET_BIT(0x0040)
> >  #define   PCIE_CLIENT_MODE_EP			HWORD_CLR_BIT(0x0040)
> >  #define   PCIE_CLIENT_GEN_SEL_1			HWORD_CLR_BIT(0x0080)
> > -#define   PCIE_CLIENT_GEN_SEL_2			HWORD_SET_BIT(0x0080)
> 
> This commit alone won't compile right? PCIE_CLIENT_GEN_SEL_2 is still
> referenced by rockchip_pcie_init_port():

You are correct, thanks for catching it.

> 
>          if (rockchip->link_gen == 2)
>                  rockchip_pcie_write(rockchip, PCIE_CLIENT_GEN_SEL_2,
>                                      PCIE_CLIENT_CONFIG);
> 
> This reference is removed by the next patch in the series but not sure
> if we want to do it here instead.
> 
> >  #define PCIE_CLIENT_LEGACY_INT_CTRL	(PCIE_CLIENT_BASE + 0x0c)
> >  #define   PCIE_CLIENT_INT_IN_ASSERT		HWORD_SET_BIT(0x0002)
> >  #define   PCIE_CLIENT_INT_IN_DEASSERT		HWORD_CLR_BIT(0x0002)
> > @@ -197,8 +196,6 @@
> >  	(((x) & PCIE_CORE_PL_CONF_LS_MASK) == PCIE_CORE_PL_CONF_LS_READY)
> >  #define PCIE_LINK_UP(x) \
> >  	(((x) & PCIE_CLIENT_LINK_STATUS_MASK) == PCIE_CLIENT_LINK_STATUS_UP)
> > -#define PCIE_LINK_IS_GEN2(x) \
> > -	(((x) & PCIE_CORE_PL_CONF_SPEED_MASK) == PCIE_CORE_PL_CONF_SPEED_5G)
> 
> Same for this, references elsewhere tho.
> 

Thanks for pointing this out. I'll do better for v5.

Geraldo Nascimento

> >  
> >  #define RC_REGION_0_ADDR_TRANS_H		0x00000000
> >  #define RC_REGION_0_ADDR_TRANS_L		0x00000000

