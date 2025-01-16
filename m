Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EF0C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 01:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QNPVQXecLokCMBNU0Zpch+WkI0Q+RjsM7OPeRvuUd8=; b=OBUtDI6JCqqF810FMzG4GBVpgA
	euFhuSAkWsFMetanFP+d1w5DGnA+Ib/ain+RHsYZfy9SLa/KRn0Qdbtcc2jLA/V27H7tWZuN78O9A
	XvAZ+jxftdzZP3fJT7iCdhutIWZkIOkhCpnjOdIOrse9DZdCy7alnMeHP7qJMiQNps85C3jsIfyam
	rWeRdLH52ynoX0ZSdV4OPT6pHck2agfiEZjE3iRp9AxBsoNovlKZikCBoiQ+HhzENQF/BZUSWFzOv
	auV2cnEV2j7nuSYOzA+SiqDlhbAa1BF+f3dYhY5JVzmTAEBe01EWpobErBNhuIn77gsKJ2MCiv6no
	LeSlV6EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYF0N-0000000DZsq-42h9;
	Thu, 16 Jan 2025 01:49:07 +0000
Received: from mail-pj1-f54.google.com ([209.85.216.54])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYEz8-0000000DZly-1IM0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 01:47:51 +0000
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ef28f07dbaso635710a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 17:47:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736992069; x=1737596869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QNPVQXecLokCMBNU0Zpch+WkI0Q+RjsM7OPeRvuUd8=;
        b=mP1VTEdWB/EZJzFp9XlgVkTMQu+bc19gP4YpPFgzDih77hv7EIzEzGOGDnUJKhRawe
         EZl3zskUGKttmtfoq3fPLXHZtuH867c+T07r6mB6xbeWK1C6t6RkNsm8++g7xWoviKwA
         Q8tklzisGXDZZI+2PlMWxkwdtJfRUjzOXS+AZds1Y1ZzcDEDshWGFuMSk1nEkcB+h66e
         CEwU5D7s9d0nNAuAKxh/6YVDDZTTZ2VXVEUTifJnm5RIP/BUpXZha8OKNC2fU4kynobv
         Qp8MvuDcegU389sZovEARvy8vFy+PmI8cX0gJ56PbVfsDGbpbQG0/gGl21e9l35nkhVV
         qlGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbVzxi7zYDVZKl3NoHtPNW3z3oK5piqN2ZnHsR49ej//PR6hP+t8g1poDVGpra9iOD2XmoTRDRhNnoqfhGGDUT@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc5WA7Gxh8stxotj4bvj5nWOHjrTD9NtbB1MJfqN6WzJlfPvzh
	P8f6nZxCdROYvfU8S1R5FmyLj8PYw6ZgrSfx5amyR76FVc6wBtQE
X-Gm-Gg: ASbGncuwahmd1YgX7o2/hq93aDapnL8KTF48hlcJgHxtrAAOQzIEMrgyTABIgEBFIw9
	jmTv5B7Q9PXxpg8vdvzgCISe4qF76+k3d2TYlHVH2F/WKi3lFvl9PxsoPGXzzZ76dIZIZ/205/J
	VqCFOWmVRFfG4S2WxeucLU0M9Hl7Q5K7uKJYXMfzCWZrMOm516Gb1Bn1eDYShUWo8xiquKrFz3J
	EPHpes5OQufiTu7KZO1Id9VdKwlLnMtc6f/sI743ojFCXU9cSwyKGto/chGs0J9Z643ejDB+IBP
	PBs2IyHF0VhsqSM=
X-Google-Smtp-Source: AGHT+IHIPg+1+HCTsuijQC+DWu9OaoAsxoCVaqGsJ9zBPENZpCBH7mo8AWX3+7KImg14FW/XnuOBQg==
X-Received: by 2002:a17:90b:2642:b0:2ea:aa56:499 with SMTP id 98e67ed59e1d1-2f548e9aed3mr41058488a91.1.1736992069406;
        Wed, 15 Jan 2025 17:47:49 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c1ccf46sm2071655a91.22.2025.01.15.17.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 17:47:48 -0800 (PST)
Date: Thu, 16 Jan 2025 10:47:47 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v8 2/7] PCI: dwc: Use devicetree 'ranges' property to get
 rid of cpu_addr_fixup() callback
Message-ID: <20250116014747.GB2111792@rocinante>
References: <20241119-pci_fixup_addr-v8-0-c4bfa5193288@nxp.com>
 <20241119-pci_fixup_addr-v8-2-c4bfa5193288@nxp.com>
 <20241124143327.6cuxrw76pr6olfor@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241124143327.6cuxrw76pr6olfor@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_174750_347385_7D1FCD1D 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

> The newly added warning should be mentioned in the commit message. But no need
> to respin just for this. I hope Krzysztof can add it while applying.

The commit message will include the following:

  To expedite deprecation of the cpu_addr_fixup() callback, warn its users
  if the 'ranges' property is missing from the Devicetree or the address
  translation information is somewhat incorrect.

Let me know if anything needs to be changed.

	Krzysztof

