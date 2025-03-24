Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEA8C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 07:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vj0JbxrXAVA6oD7VcAtXgMKT4fAYOqVFgdHGQAEeEsQ=; b=w9dSfmDpSBM0lyQj7eDv/TkpLv
	qY9i0pHwYnwoDxN/y9UmhAWLUGQv1IaufTuRKWZVO00facZHRUPiycoxqBHQdWgBCpYFp16k55JUl
	PhRYOTtNevkZUFqRqZxHwHM5ST1kGKU3ZxOu2PSsN3M+oeZWsSJWRxznOJPA4R/i6YYf4x6es744z
	2slogb03LnpKAOVo+lGTpIJ4OTD2FwioZQl9WWRP9jY6Gk9+VY8UN9BUJd6Kt/0yEic1wzAJ65C8u
	H9T5GowD5qz+Q03lv01aCwtdpUWCKrqAW6akFrSpUnG8UkHE+tRmgLH9daj+buMelFKg/2uwqgIaG
	dhACLYmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twcPE-00000002TDG-3i8g;
	Mon, 24 Mar 2025 07:39:32 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twcBS-00000002RcT-3q4l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 07:25:20 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2279915e06eso19532935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 00:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742801118; x=1743405918; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vj0JbxrXAVA6oD7VcAtXgMKT4fAYOqVFgdHGQAEeEsQ=;
        b=u5QBfwBFiohO0ftyT1MYfnrqm54OB9aDtfA+bWbKn35PtWt2X1ObGD5q4X9DEeq8Ad
         MICPUStFH80ZQniTlU8n2i1/2rBQCLTS0l3GxXAVKqRV3xRloFSilsuVnBxgqQ2oo7a2
         3awFq2hADC8SeiLFOrUNspSLjISRrwUBmzQRa+sKJ5iBhvKeyrq4IZNmDse1b4IS7TIM
         sRySAbAmtg33bRDE9fmLOEdBpLCuxu86qRVu43SGqCxDK82Usb89PGjhmCNgmOkshnvV
         j5e7UQlUKus2ejG/EAluJ7dB3lhnkxw97E/czYUsIMbG1dDfer5h7ZneArWhV5Fu/qhZ
         0J+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742801118; x=1743405918;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vj0JbxrXAVA6oD7VcAtXgMKT4fAYOqVFgdHGQAEeEsQ=;
        b=c4J/dTOqneLriKC7CsDGvIK4GnVqqa/o+iOUDMux36DSQatMpXr1OzNDGfo96UAtwB
         Ad/esysq6VkTuyvZzXKtBNT4GFNqzM/bmcUkw1l82cxPm9Oed6lCjrqcet8hKrfoMct3
         m67oOzTlxwngySQyPbaF/sRQ2Ghf88nBrW3iELLuFc+h5dD2Ld9GQFJWjgvsXZgSKMsC
         f7gElfc7fBW67uJSKl8drTq2Bm3Kv2Pn4kf8C5YO9iD6Wysbhzwd9MQlpaRZWGup46Lh
         R8+0sZbLWR9etAOdh+5in8vEumhyp4SrLHT7/P6fxvQhbzy63TGMoVTG4teB5pr9C1e/
         Rx8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVXOgNW9tNLPEdFdM1JJ8Avm8TD3lOolXb1+e0OS9VbTe6j20SQMqBPpGs9ivIE1Gz1JDknbhnoeKNfR7ABv22j@lists.infradead.org
X-Gm-Message-State: AOJu0YzFQOZhi3H/aU6cKXzRMpsjXNpgyDil6skGo3qcrCnPyRK7MxDP
	oK7xgQSh8PwbCEQXkC9Gb+6C4P7qGXqpbAWAG3Lj136yDiFvvK5297bl0VgV1g==
X-Gm-Gg: ASbGncvkFa2PqmPo3MVpelhR5RBG78Av87F0GIowCnSwvNSLFn1ODCo/uAZlNqKAifm
	QiC5OMiC1hasP5uUdyW6DDMn5xDuoAeZEWNsgbazOkShYqxGPyG+1RhASxw2/nxnNdoN009EvT2
	padQwslXc+/7+WmuA8HCxo8KGaiO1EZmRpFglQzNQvSD0DSxr4eA6bzhbxbdbhyvmR3TTK+5wnz
	vO9I9+Y+n8wBt94PGwM6+8lFKPMTSgjJIA0Co+aHDI6/eV2o1EI13KFRYdx2qDfGObao4iZa8WM
	gteLx3WUguWxXDzAmC/ZA+DJb9qnT1p1fVKSMJgUXddqZuSV72sYqocM
X-Google-Smtp-Source: AGHT+IFkcSPlya/dghCtIGB6baE4UY9siigdCJhCAQ1aprxfhPsqNa0EHD4upA3IZyCq4ENwSZDhpA==
X-Received: by 2002:a17:90b:4d05:b0:2f1:3355:4a8f with SMTP id 98e67ed59e1d1-3030fe8d50amr13269772a91.4.1742801117734;
        Mon, 24 Mar 2025 00:25:17 -0700 (PDT)
Received: from thinkpad ([220.158.156.91])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f806fa3sm7307502a91.42.2025.03.24.00.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 00:25:17 -0700 (PDT)
Date: Mon, 24 Mar 2025 12:55:11 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Tony Lindgren <tony@atomide.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC NOT TESTED 0/2] PCI: dra7xx: Try to clean up
 dra7xx_pcie_cpu_addr_fixup()
Message-ID: <5lyvmuk7o3nj6xaozyghxnhivwcmx2yisnbhwugklx5u5sutmz@26ta4e5en2mq>
References: <20250317184427.7wkcr7jwu53r5jog@thinkpad>
 <20250317194539.GA969005@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250317194539.GA969005@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_002518_956083_73757144 
X-CRM114-Status: GOOD (  24.87  )
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

On Mon, Mar 17, 2025 at 02:45:39PM -0500, Bjorn Helgaas wrote:
> On Tue, Mar 18, 2025 at 12:14:27AM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Mar 17, 2025 at 12:30:08PM -0500, Bjorn Helgaas wrote:
> > > On Thu, Mar 13, 2025 at 11:35:21AM +0530, Manivannan Sadhasivam wrote:
> > > > On Wed, Mar 05, 2025 at 11:20:21AM -0500, Frank Li wrote:
> > > > > This patches basic on
> > > > > https://lore.kernel.org/imx/20250128-pci_fixup_addr-v9-0-3c4bb506f665@nxp.com/
> > > > > 
> > > > > I have not hardware to test.
> > > > > 
> > > > > Look for driver owner, who help test this and start move
> > > > > forward to remove cpu_addr_fixup() work.
> > > > 
> > > > If you remove cpu_addr_fixup() callback, it will break backwards
> > > > compatibility with old DTs.
> > > 
> > > Do you have any pointers to DTs that will be broken?  Or to
> > > commits where they were fixed?
> > 
> > Any patch that fixes issues in DT and then makes the required
> > changes in the driver without accounting for the old DTs will break
> > backwards compatibility.
> 
> Right, I guess the rule is that if we have patches that fix DT issues,
> we should apply them as soon as possible.
> 

Right, and those patches should not break old DTs.

> And later if we ever have confidence that unfixed DTs no longer exist
> (or if we can identify and work around them in the kernel), we can
> remove the .cpu_addr_fixup().
> 

Yeah. Unfortunately, we do not have a fixed deadline or process. Just like
supporting the legacy broken hw, we have to keep supporting the old DTs for some
time and then get rid of them.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

