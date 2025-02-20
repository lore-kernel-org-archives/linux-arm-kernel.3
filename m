Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C71C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 16:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xjApu7wvR6RLPV6pa18bAu5v7DCmsJtT4U5G+lnbPN4=; b=4r48kuy818eYGEMkv/IfD3ahnR
	AdkvHxQfaUAd8b6tAkyynjbA54E2PN2t7XD2OTAF1adLUfa+KKBoL79wmK5/qAEMHoHV8blsxECGs
	jrkTzzcJcyLMFBam7c28Cga8I9MkmobUbahkz4SwgLWgzdNcf7LSKfFtTp8lTOYxNE6JcxrY6EH+C
	fh6Ht4YNheh4TjMaoTLJK/L/mt1LxRT79miAPS803b1CVawReyRh/rR7BDv1F7J+J0PTkblz3lLWR
	W+ugr0yNSSlg10cgpEgwS+cZ1T65HvHnv4gugKr4Shl7W8x2lq2eTScT1CbE+gaKeXnHjoqoKa9ed
	mTDj4eTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9JW-00000001plU-42VK;
	Thu, 20 Feb 2025 16:22:14 +0000
Received: from mail-pj1-f44.google.com ([209.85.216.44])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9C1-00000001nS8-0lOY;
	Thu, 20 Feb 2025 16:14:30 +0000
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2fc3027c7aeso2349054a91.0;
        Thu, 20 Feb 2025 08:14:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740068068; x=1740672868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjApu7wvR6RLPV6pa18bAu5v7DCmsJtT4U5G+lnbPN4=;
        b=sOj4TdgH6uVb4TW7DTiUkP7xcKWqSNzvWa9kVCrxHMHQWLc7UxPNbhDhzwBY4CFbj+
         B7tGAW3mBooRRgl9rdT+OHjkjFui4yTVqQ7/IbgsoAfoQcDbQh2+gPv0e65CTSyoeRCe
         tKHMtaZ7wyRb3/p8Vties82khcSzErLUSnMUVc7OUY5/tK3VraoyCFhF5cIOdVM+Fquv
         /MacSUhc561JuVX9dz737oIxxWGDqLww2HZ+vJhNyV9FxhbsyhgjMW12AXiYtZ0wBUjP
         VdC8cxQ6PKu3xJqCFLrvZv1cLERhqx+JA/VV7JyCAQtqCSnWTa3sCzJWTn+ExHGPur1U
         omgw==
X-Forwarded-Encrypted: i=1; AJvYcCUp36oNlMFu31S9o+iBE0C1TZMnMUSXzeQN4yhiNQbbVdtUJLAOsInQW9scYc0oYhtZXmcXk5YYKhODkXXc+xlJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyJDoYlMpKzBaugYO0YGXOgIR1gEQQWA37oXDoNAUwri7j2mFxq
	hJvKexJR56J58FRNozPJPtDLU6d+Tf6+xtQ+63Me/o/kifnwPFEV
X-Gm-Gg: ASbGncsCYY8eWRl/5hqfJygKUJF11kUOEm9gsBw+1gaSGs7+Lv0hTj7B3Ic0IWyjPzC
	8+tc4Zk4HnM6kgmTTDW7lbtyWE7WP7M+4DHrloYDdYSMpKZ8YE2JNfdgxMhQrqq9hoN91xxHBm2
	ncduOSkUsJYA/fsS8oevAUsgu+JFxPWuiJaFz3yvZy+qpD+T9OdoiOKFKM2KK8pQMBsNrDud5xI
	/xlSQRCtHDt3X0grl8UblF87+FlKg8g1Jvk3tNtUHdpXJnfCjwxqTLY3CEykvQ2P7Vk8JpaqSzT
	C7N4nL9Bk4xyuLpaurTvZn+S8oyE2KBtWWca/bKKqDOQy2Bm5w==
X-Google-Smtp-Source: AGHT+IE5g92tymOpqjZljOvL+f+6fyGVJuuKsTsrji+yeU7rzJLwpLIQ+0QHK60yLpl/epYrNk3qgA==
X-Received: by 2002:a17:90b:1e46:b0:2ee:fdf3:38ea with SMTP id 98e67ed59e1d1-2fc4104051emr28560885a91.23.1740068068277;
        Thu, 20 Feb 2025 08:14:28 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2fc13aafebesm13935035a91.4.2025.02.20.08.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 08:14:27 -0800 (PST)
Date: Fri, 21 Feb 2025 01:14:25 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] PCI: brcmstb: Fix for missing of_node_put
Message-ID: <20250220161425.GC2510987@rocinante>
References: <20250122222955.1752778-1-svarbanov@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122222955.1752778-1-svarbanov@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_081429_219010_28933663 
X-CRM114-Status: UNSURE (   6.97  )
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

> A call to of_parse_phandle() is incrementing the refcount, of_node_put
> must be called when done the work on it. Add missing of_node_put() after
> the check for msi_np == np and MSI initialization.

Applied to controller/brcmstb, thank you!

	Krzysztof

