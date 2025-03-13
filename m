Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04B1C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 06:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECQXFTKYOwgoxNWOGHysFhcD6t84a8REZICN/4jtZ5M=; b=3JKanbFy7xw3oaIEx22TUj22rv
	HXeV8PxWmMMDc87W8mneLMMh2JkP3TEL6yz182PB9bFCSdDgL/yNrfo/UR/CHiv7d3697reWF3v2H
	4wrmwBtNAlEzY1Yii47VOip2fJPcoKx8oOpONEuJP2abVUEtIIXqLdEeXqNVcXv6qyiLkq9QqceuR
	MvDjMYlwTSQy31hssfn9SObN+jxs/KcRjDJiER3Zs6LJFztchLclQLBgC0U479xneTU6ElFy/BOVE
	uY9gCAAi7WZCsN3QkDQp2Jw24+TTxeNnU5w783Kj0TUoxfAiseJJN+WzipAU6KCPDEtza9wJknPc4
	7ze7SR2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsbip-0000000ABuc-3OcY;
	Thu, 13 Mar 2025 06:07:11 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsbh9-0000000ABk9-3JMi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 06:05:29 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2255003f4c6so10582915ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 23:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741845926; x=1742450726; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ECQXFTKYOwgoxNWOGHysFhcD6t84a8REZICN/4jtZ5M=;
        b=cS2EMdR7CClbmRYhgZLFusKEfu9McUMuNeylW/bM5njd6mchcdmf7Riswo9XfevQRm
         afLGsefHYCFftNrBEQhqx9xfKRyRQRXyF4Zs8w7Sl7609ED1NEsIS9jG5AMwL2+zeuZU
         jfekOAJNl1LX428yRU0PtQ6Ep3xQZAoVopOxcF67FdkWHOAPQOjC0OsoCmR16bKZua3c
         qXZwxPrazf5p77rIq1UxNpeYahH6biEW6SYgbCtAX/j93wenHJwM2W1yK6VoMFxm5oUx
         v5Xfb44whGLYwD3WITdvXTvRY4iHzo9sYf0hNXBFwLhKYSYw41WyETJBJV2Seefe94lv
         CRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741845926; x=1742450726;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ECQXFTKYOwgoxNWOGHysFhcD6t84a8REZICN/4jtZ5M=;
        b=SEKNECguDozfZHMDi0FAPlXRMAdKsqjYCOUfm1J8TEy32YtQuuaKfqLPmYr4/acnml
         HQLhUiplWX3I9IioHyhO1+JAKtgs5VfHSbtpCTEguK86h0tlMspmgTTmgGy5LdjsLG6D
         CcRWhbQ1+O3mPP6X0CvZvHNTPw/ngkKQmyrFJATP0EsURoCAqowGzzGAPW04uAY7fvEr
         evFG6n6QRVh9HYFqBRKTo1TpvbpiPh45DGKsS9m0jacAjGBDnYOYGiW5dG6rmR1RJOMD
         2NVE7dHxMO89fUoSCyJpA/uzWYiURfkSHrQVoFKkiAmMmGXHCR6DcliRTKtaHLKSO6Ag
         LTeg==
X-Forwarded-Encrypted: i=1; AJvYcCWDt5PfOVsvSb7/F+kPu8uutssnjeFoxiSm26ATwbiZ1np1BtF73T3uYE0lWqQaqLmTHOMDbtbvbsMonENs8VDz@lists.infradead.org
X-Gm-Message-State: AOJu0YyvJgE3BNgkxTv+0rQ9E6KhzR2Bs2HuwMbZpR/+1Pxw5ukCKxeJ
	wwMgXbdFvy/XcFy55dr0l/VFp+wOoKRKmXFI80MIITmfkWEVzFVVlIvnW5BIyw==
X-Gm-Gg: ASbGnctq4EthVXzoCpep4qIZvgQ2gFlELk3zXWJCs08kTQfj2O1sBjMIgUegdgolL38
	OX+yvvuaq4YfNaeyQF7cg7u3RtFaekd2JrsVunSDnqG2bSuFkNi1h2+yKDBub/ySrv1/F3L1TeJ
	grTfLQT7VGJ2VZhpq27hUUsGzUhObtNsZVSJ4xvnRbpV+0SsfuP7b6+syisx+wAcRsXcDjvvMRS
	h171MCfUXkrMJZlTv956YZO453Ht/dwcFQnRJHZCi9pbziHQLEH02WFNUlTr3u7j7dGpqzAh8ua
	+hyzpt3SdQAvcLhid9KGtXNB8LzADNEqTHCBxf5zYAzjvpfzY0JW4w==
X-Google-Smtp-Source: AGHT+IHNYbI7b2RsxEIqYIkLTAuLCtKd3n8R178hhBoO3FhGxq8OJi1CT08xESSMe4ltVJpCSclHjw==
X-Received: by 2002:a17:902:ec92:b0:220:fce7:d3a6 with SMTP id d9443c01a7336-22592e44a09mr126226875ad.23.1741845926623;
        Wed, 12 Mar 2025 23:05:26 -0700 (PDT)
Received: from thinkpad ([120.60.60.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737115781f3sm534483b3a.76.2025.03.12.23.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 23:05:26 -0700 (PDT)
Date: Thu, 13 Mar 2025 11:35:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC NOT TESTED 0/2] PCI: dra7xx: Try to clean up
 dra7xx_pcie_cpu_addr_fixup()
Message-ID: <20250313060521.kjue4la47xd7g4te@thinkpad>
References: <20250305-dra-v1-0-8dc6d9a0e1c0@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250305-dra-v1-0-8dc6d9a0e1c0@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_230527_941154_AB1811D9 
X-CRM114-Status: GOOD (  11.17  )
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

On Wed, Mar 05, 2025 at 11:20:21AM -0500, Frank Li wrote:
> This patches basic on
> https://lore.kernel.org/imx/20250128-pci_fixup_addr-v9-0-3c4bb506f665@nxp.com/
> 
> I have not hardware to test.
> 
> Look for driver owner, who help test this and start move forward to remove
> cpu_addr_fixup() work.
> 

If you remove cpu_addr_fixup() callback, it will break backwards compatibility
with old DTs.

You should fix the existing DTs and continue carrying the callback for a while.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

