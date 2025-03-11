Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A737C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 07:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amwnjhquihQlw3rFST7jVWbfUF1Yah8j1kpH8njxrZY=; b=EOrhOdlaOnMNuC+1Lti0Vw1LDK
	l/mT3Ezc3uaYvBlwxoV+gkPk+JlOmu+d21JSlvWpmAJfHiBHY4UO+j0vb6DwkReKksaqO1g8egVuo
	ubLDRxS/NAQP0YDhbpSQidM1o1hvpSk+6WVux2TaHrAXN94ZfBitLKU/Ogg9NJViZgs4Xf7AX0raU
	t5H6VVWa3GIW8O5uZ515tgyZoUP1ln8XbHgfE1p1TSJGGckFyOkXAzMH48zeC0fvY6V1g9ZuPEOP7
	xPplxobmJm6uigqNsI0gU8r8Rg/algsc3P5tmG/5HjWWJvaMU415itTtiyPvIMwCa2UXMlE1nxwxQ
	gbTxI2Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tru2e-00000004piM-1Ggl;
	Tue, 11 Mar 2025 07:28:44 +0000
Received: from mail-pj1-f50.google.com ([209.85.216.50])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trtzp-00000004pIw-1HVT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 07:25:50 +0000
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso7330447a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 00:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741677948; x=1742282748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amwnjhquihQlw3rFST7jVWbfUF1Yah8j1kpH8njxrZY=;
        b=ZtcWjzgGNQk0OSFCkUE+9LcL7v0Njf6Ju9x+bxgDwIukOrdRuEew4VFe6O4B+mAFda
         /wNJQXwvK5R29OUl1ZxSNdYNTqSxqpX3jxz+LvEHvE8rfJB+U/gOip6uGx5lxTs96P2L
         zsg+/O3nNvSSuz6jFt5qgjYkEL/nSF1m/gqobG8pnydLT7oRQbpI7tzEQlYJxSAqGJEi
         NlG5DjWtemNwcPFApUVNjFYQi+fib+GYFK6tOd+EG5ceNxLtRuB0htsxvaY3sqR5UcJ0
         v0KVzYaNUtAAMgISrcSox+ZRaj5WLcWp45O57GEiOf+E2ILiGMuv95CLkbeKBtz6lDEk
         StUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoBl1viFiPJuykgsk6jQV83upv45gJUbYD6uUdPpCdGG9GslWEs7ZgRC6z0MBs2wg+rUKfWf9h/kUQmN+4/LpN@lists.infradead.org
X-Gm-Message-State: AOJu0Yz72IaYoq31NzHaKDrroFPcX2Mu+PgMtN3TlQqY/SZk6saZfQm+
	Y5rj5oHvbgzRQ14XYGXR5nG7Ym4RMDCLJrPkwATUFGS8/1f5GymHeoAoyzf2xDw=
X-Gm-Gg: ASbGnctO/kw/1DJFkZmSr3prb/vm6vOzyu/NwveZEQ8FlCtXz7qQdVrUq5E6ezF1SRU
	oiTfUjVCyzRR0solqx0R+zSjyu/o93cDA2dRRO3uTcNU+be67tA/pW3uFyZIQ39Z9L1d9S0VQHl
	fmRzjPI1QZ4J6fzMpZWAotcpgmRJDK27BJdtn/7t/dWQmb6XdtHd2ww7Wsuz/clK7GirDG7o4ix
	kpaR28ZwPPInnVvuuhGWRIctU9TfsO6bOpGI9cDwdexhw8rkotiYyVFt5tRFwEe2EBmUxrNg80x
	58eu0rzEE+/UOSQ8gZW20IfpEhbyjr5bqCL3aYQcqqXHulXRpn+e/spY+eYpo0jWnZECqcLd8jf
	eJk0=
X-Google-Smtp-Source: AGHT+IFHY5f+4sJatR6BI17Adi4AuhVFX9pxsgEfHSvv5C3l/7gBr81/pwoEGMGBCuJ7SqKtWyZgYw==
X-Received: by 2002:a17:90a:d450:b0:2ff:5ed8:83d0 with SMTP id 98e67ed59e1d1-2ff7ce91ff0mr28909573a91.16.1741677948459;
        Tue, 11 Mar 2025 00:25:48 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-301034433e9sm909027a91.1.2025.03.11.00.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 00:25:48 -0700 (PDT)
Date: Tue, 11 Mar 2025 16:25:46 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, vigneshr@ti.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	bhelgaas@google.com, rogerq@kernel.org, linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH] PCI: j721e: Fix the value of linkdown_irq_regfield for
 J784S4
Message-ID: <20250311072546.GA277060@rocinante>
References: <20250305132018.2260771-1-s-vadapalli@ti.com>
 <20250310210746.GA2377483@rocinante>
 <20250311051806.smcu4o4dxpngimth@uda0492258>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311051806.smcu4o4dxpngimth@uda0492258>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_002549_342330_37A6AD52 
X-CRM114-Status: GOOD (  21.67  )
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

> > > Hence, set 'linkdown_irq_regfield' to the macro 'J7200_LINK_DOWN' which
> > > expands to BIT(10) and was first defined for the J7200 SoC. Other SoCs
> > > already reuse this macro since it accurately represents the link-state
> > > field in their respective "PCIE_INTD_ENABLE_REG_SYS_2" register.
> > 
> > Can you confirm for me that the following use the correct macro?
> > 
> >   333-static const struct j721e_pcie_data j721e_pcie_rc_data = {
> >   337:	.linkdown_irq_regfield = LINK_DOWN,
> >   
> >   341-static const struct j721e_pcie_data j721e_pcie_ep_data = {
> >   343:	.linkdown_irq_regfield = LINK_DOWN,
> >   
> >   347-static const struct j721e_pcie_data j7200_pcie_rc_data = {
> >   350:	.linkdown_irq_regfield = J7200_LINK_DOWN,
> >   
> >   362-static const struct j721e_pcie_data am64_pcie_rc_data = {
> >   364:	.linkdown_irq_regfield = J7200_LINK_DOWN,
> >   
> >   369-static const struct j721e_pcie_data am64_pcie_ep_data = {
> >   371:	.linkdown_irq_regfield = J7200_LINK_DOWN,
> >   
> >   375-static const struct j721e_pcie_data j784s4_pcie_rc_data = {
> >   379:	.linkdown_irq_regfield = LINK_DOWN,
> >   
> >   383-static const struct j721e_pcie_data j784s4_pcie_ep_data = {
> >   385:	.linkdown_irq_regfield = LINK_DOWN,
> >   
> >   389-static const struct j721e_pcie_data j722s_pcie_rc_data = {
> >   391:	.linkdown_irq_regfield = J7200_LINK_DOWN,
> > 
> > I am asking as some use LINK_DOWN, so I wanted to make sure.
> 
> Yes, the above are accurate except for J784S4 which is fixed by this
> patch. LINK_DOWN i.e. BIT(1) is applicable only to J721E which was the
> first SoC after which the driver has been named. For all other SoCs, the
> integration of the PCIe Controller into the SoC led to BIT(10) of the
> register being used to indicate the link status.

Sounds good!  Thank you for letting me know.

> > Tht said, the following has no .linkdown_irq_regfield property set:
> > 
> >   355-static const struct j721e_pcie_data j7200_pcie_ep_data = {
> >   356-	.mode = PCI_MODE_EP,
> >   357-	.quirk_detect_quiet_flag = true,
> >   358-	.quirk_disable_flr = true,
> >   359-	.max_lanes = 2,
> >   360-};
> > 
> > Would this be a problem?  Or is this as expected?
> 
> Thank you for pointing this out. This has to be fixed and the
> "linkdown_irq_regfield" member has to be added to match
> j7200_pcie_rc_data. I will post the fix for this.

No need to send a new version.

I will update the branch directly when I pull the patch.  Not to worry.

Thank you!

	Krzysztof

