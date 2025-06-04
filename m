Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50CAC61DB8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 18:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRFhhLJjI4zA7koH9NNbXkaz3+o0i9nOOHT1b6Am9B4=; b=wSL42OBBlBTZieBQqtQQHsBryg
	3KB8UenIZFO/xPBXWucRdozokGzvWhkoUYHqL/qgd1zyZeoajcAD1hV5DABi0RYGCcA+FScWStQca
	amGhFxKD+jfFiWkQk67g5iuCmHmjqLFewNBFKMN9LEkTRLPdVNenRzk9zhLbcnPzA6BVQNCdxGHP2
	CGvTiIujJSPC18zteBfr3LPdAzhAGrVHmU7bQObjWS5XxL/iTP95VIrdxt575JO6xJCg3vhpUcvvm
	mWijp971IcM9PYY4wihlix5eOS5ADxTzCy5cTxe8zhqPwP+uEacqvQ77HnczY2252JH40e+Ijd4R/
	LsQUxkPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMsqy-0000000E12F-1pMq;
	Wed, 04 Jun 2025 18:28:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMroo-0000000DvLm-09qV
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Jun 2025 17:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eRFhhLJjI4zA7koH9NNbXkaz3+o0i9nOOHT1b6Am9B4=; b=qHOSBJZ5/FvMNa3QF+hzjTaszd
	+tjO4DIvEIwBMoeC+K1UFcl10up72fQPId9VWQ0+aD+XUF/58/XBW7CXYG83DNOOl0es8duF1Wv6e
	8ip8Ng7YZj+uQ92OoswOm8RXxDt7rDHuW71TBQVVp99GaRM7p4TEHoHCd71PSj8Fk2KKEq8I53zNj
	Ok+ITGNGNh3LjJb0hTNCcvY5aF/2lsy3Gbe2ZIL76b2Qr+jD8hGMRbq+sEAdOkwzoFQq88ZRPlkqr
	J6+NNlhPmLk/oZQPIAVFPc683nts1f+f1xl73PdDEMAaYcX6UKRUbQptq4pXMIEBUIK37Fsh92VqO
	ZT25i91g==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrol-00000000w0S-0D8Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 17:22:24 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so133216b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 10:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749057739; x=1749662539; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eRFhhLJjI4zA7koH9NNbXkaz3+o0i9nOOHT1b6Am9B4=;
        b=FC2/4oVKsUtQRq12M8Dn+gC24Ok/4tZZ74cI9B9BTziVVS5flwJ6a6XeEFZeBMymm0
         9ESVEpVnqTd7I03rIFngnC9srIy1GG6pFdJE3Olv+0c+7prRmktcHo5dSVArNQD7rN6P
         A5nWPh4ChKR4j0k8hrU/Qe4/MzFfqrdA3im4Sw0ZuxtMi+M5UvhQPc5sHP/0K2U+2abj
         utCbCGR556Ol+oZu4OYHAawZtTUVH69y+dn304+L2vYFfgXx9woKb/sfYBi2fAMsAvIy
         cbqoG20L1AIMwHjP0rArVLjA5kysE9BMOPegzw1OwOLLLiJMsZF0Zci/EVJObtc/xbB2
         7Ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057739; x=1749662539;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eRFhhLJjI4zA7koH9NNbXkaz3+o0i9nOOHT1b6Am9B4=;
        b=MyWLNVVOJX+6tZ2FqiTkBnqw3D8dXHlBCSzhXns6inhV6rOzU1NEbUJ40h5aoVIFX+
         EwgXJwQcnJpScb+35O1ecpULJJHdbjsHJT4yeODtirLKwT1irpdHREw6Yjm0nscIaEfN
         FE5VHr9aOhwjdwZ8nZ2EAcL/nYZhtveZPj0CuAVgaKgsWLmuTyPcCFlxmh3CvPpPKtMQ
         5cKV0MaCiCYqJaYQ8di+EMyb4yq1YF7SaqvQxtge/2uytLB+buxxya4mfBDjUzd+aqnv
         2sGEbuy3aj3ULYilg9MctkBEdMgXUuQrLb3uBW8S5S2bz1EmT09wo369LpQlbKvbCUJu
         ml/A==
X-Forwarded-Encrypted: i=1; AJvYcCXlcNi0sBkRKmD4HHmFm4rALHywfnr8ttJYSZ+aIDUD/zTnQyT1F/7zzcHnucijMptNIB6tPh/ZtMyBy/5vS1mG@lists.infradead.org
X-Gm-Message-State: AOJu0YzRv+6ZlvT71nSJPoO+xYqR171hrCrU755JwN3thpC47VBe8OF0
	dsdeEfdsvOaJYlgMh2ZVSEZ1u8u3LczF2Qc9+/D+AScc7NMlrZJRi6yUBYHOdAs4Iw==
X-Gm-Gg: ASbGncujyUFFocQJ3wC6SRk1DfQ0sqPTsvpjUIQRWbzTAxkpyinj2x+LM+v7lVnS3cI
	JhVrbbj2JkfEYNpmRDFkyg4XGJp6fOQYAzTkY5hrLVPNDbrWoGTOKWiTL9QupT3zAcXGDbWxknJ
	bqm67s8YRwrG55evgy0/vGZlt5Pa+FwFQb0NedRNWKNlth2SCMiEpuBl9kZdgQytN8HiPa8jb9O
	b05Kh6Lbf494RSrY096R2ed46bKHQ9XFTi+9Z6BSdrG4WZlRHS/R91NSiormzFVp2DnNMWPj8EO
	xXUWqOyM2gkZ5MCqIp8Yg5Afhonw/kEFXhkndg0Q9dFHr6NPMDL1812SRYcLyw==
X-Google-Smtp-Source: AGHT+IEfy4DmIHTrKSJlkqSXJHSlJ3gLkmiP8MmaPN6LL/v90GBnAH1FIJiiM09/woNRLt0+WHE+iQ==
X-Received: by 2002:a05:6a00:3b0d:b0:736:b400:b58f with SMTP id d2e1a72fcca58-7481814420fmr375938b3a.0.1749057738824;
        Wed, 04 Jun 2025 10:22:18 -0700 (PDT)
Received: from thinkpad ([120.60.60.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afff7e3bsm11735265b3a.175.2025.06.04.10.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:22:18 -0700 (PDT)
Date: Wed, 4 Jun 2025 22:52:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 1/3] PCI/pwrctrl: Add optional slot clock to pwrctrl
 driver for PCI slots
Message-ID: <zzm2nyrm4nw5di7afe5nxte3hxbx3dvorjg74rsjhl3jlaywp4@x7icn3epnh67>
References: <20250530225504.55042-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUFHKHKfymqa6jwfNnxZTAuH3kbj5WL+-zN=TR6XGd0eA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUFHKHKfymqa6jwfNnxZTAuH3kbj5WL+-zN=TR6XGd0eA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_182223_235953_08AF8F93 
X-CRM114-Status: GOOD (  27.15  )
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
Cc: Rob Herring <robh@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Magnus Damm <magnus.damm@gmail.com>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jun 04, 2025 at 10:40:25AM +0200, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> Thanks for your patch!
> 
> On Sat, 31 May 2025 at 00:55, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
> > Add the ability to enable optional slot clock into the pwrctrl driver.
> > This is used to enable slot clock in split-clock topologies, where the
> > PCIe host/controller supply and PCIe slot supply are not provided by
> > the same clock. The PCIe host/controller clock should be described in
> > the controller node as the controller clock, while the slot clock should
> > be described in controller bridge/slot subnode.
> >
> > Example DT snippet:
> > &pcicontroller {
> >     clocks = <&clk_dif 0>;             /* PCIe controller clock */
> >
> >     pci@0,0 {
> >         #address-cells = <3>;
> >         #size-cells = <2>;
> >         reg = <0x0 0x0 0x0 0x0 0x0>;
> >         compatible = "pciclass,0604";
> >         device_type = "pci";
> >         clocks = <&clk_dif 1>;         /* PCIe slot clock */
> 
> I assume this should be documented in
> dtschema/schemas/pci/pci-bus-common.yaml, too?

You are right.

> 
> >         vpcie3v3-supply = <&reg_3p3v>;
> >         ranges;
> >     };
> > };
> >
> > Example clock topology:
> >  ____________                    ____________
> > |  PCIe host |                  | PCIe slot  |
> > |            |                  |            |
> > |    PCIe RX<|==================|>PCIe TX    |
> > |    PCIe TX<|==================|>PCIe RX    |
> > |            |                  |            |
> > |   PCIe CLK<|======..  ..======|>PCIe CLK   |
> > '------------'      ||  ||      '------------'
> >                     ||  ||
> >  ____________       ||  ||
> > |  9FGV0441  |      ||  ||
> > |            |      ||  ||
> > |   CLK DIF0<|======''  ||
> > |   CLK DIF1<|==========''
> > |   CLK DIF2<|
> > |   CLK DIF3<|
> > '------------'
> >
> > Reviewed-by: Anand Moon <linux.amoon@gmail.com>
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> > --- a/drivers/pci/pwrctrl/slot.c
> > +++ b/drivers/pci/pwrctrl/slot.c
> 
> > @@ -30,6 +31,7 @@ static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
> >  {
> >         struct pci_pwrctrl_slot_data *slot;
> >         struct device *dev = &pdev->dev;
> > +       struct clk *clk;
> >         int ret;
> >
> >         slot = devm_kzalloc(dev, sizeof(*slot), GFP_KERNEL);
> > @@ -50,6 +52,13 @@ static int pci_pwrctrl_slot_probe(struct platform_device *pdev)
> >                 goto err_regulator_free;
> >         }
> >
> > +       clk = devm_clk_get_optional_enabled(dev, NULL);
> > +       if (IS_ERR(clk)) {
> > +               ret = dev_err_probe(dev, PTR_ERR(clk),
> > +                                   "Failed to enable slot clock\n");
> > +               goto err_regulator_disable;
> > +       }
> 
> You are adding this block in the middle of the regulator handling.
> Please move it below, under the devm_add_action_or_reset() call
> (which is handled wrong, I have sent a patch[1]).
> 

Good catch!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

