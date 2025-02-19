Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4354C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 07:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9sOSWz9/b/A8wxbS7QG6N98UoPE8+0el0tVSZ986HeU=; b=W28jZT6D9JtzCx621OnpR/7Y1s
	nAz8gwmyyyvbzaykeHUjd9Bu/U82si51Yox/JduT9RW0ftvN5eSG2FbPshLcmvPVB9x7WJKTfehBl
	pb0AN07JcrHeRNnammS8qot3N/SzMULZTp+1p5JmQywN/3Xn+syLCh0QSKbfGMxqw5UyyvVMJi2RR
	E7S8e8DKpy1l6XqXfWK4nOE1/u4Ng2Psnrzbqxhmwoe2cT92KGnehRCLGiEKPWt70nlTDtGi8zOm0
	BuTfQY3+kAhdICvzF/HTdkuPmSEOxoDpdagIyauBCQd5c3sdcXelFc819XuYZX6XASReRM+dfJkRW
	pED2vsow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tker6-0000000BLNe-3lAZ;
	Wed, 19 Feb 2025 07:50:52 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkepd-0000000BL2p-2M1T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 07:49:22 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2210d92292eso102555015ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 23:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739951360; x=1740556160; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9sOSWz9/b/A8wxbS7QG6N98UoPE8+0el0tVSZ986HeU=;
        b=NBN+dAGzhpWO8IgxvWw7Tl56MgmXB6HT+Q6MPxMxq87Tz0Z7ri1s5VmpwgLkc67x7Y
         ZI00rfvuV4bozWop6NrPH5olgJMNl+4fXgt4RjcpkQy7sv2+mK9XAHGTDCj6IuHLb2rt
         13UK+MFRhdoW0j9v4lUOLUCsc0myMUliXh634YOw2gpRITA11Qntx3t07MLxcTbeUSM2
         /Eeb6DHKC5R4FwjMj6Wc3KxRMmL7XKJyJZKC8oDXMLlfLqCWejQ8z3qMoPlEpg9m+NnK
         giOO7+MUxrHwxLzVVO5jBGHk76NwyVlK0+aa4f/lffswgME5JofpABuFVX6lEaPdmrV1
         z68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739951360; x=1740556160;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9sOSWz9/b/A8wxbS7QG6N98UoPE8+0el0tVSZ986HeU=;
        b=ZDWDM2fd0YDdjc4Ojf5zvpl0PMfkE01+4s49Iz7UlHXv17kYBivh8ovQzr64/i1B06
         JIRfSbF8zWC7MuUzdOeR33+NZt+acJFd29atuHpj6nAOmlcAP1I5Nifp1tG61NfNaD92
         SQdBUCwnsrwcFduRm8oO9aJtCoGUNtziXec7ebdni/hyRfUyTxcEdHFmeenKZ91PJBBq
         iL/jTSfb4zxsLr9YcDnOx0b7/7SClSOiJOtE/7CG1N/x1kWS6ywULHH+cp31t9vb4FLu
         gq0KNiu1Wj/UARUgyRDkotXnGgtwIg7+HK9DbNtOVEzoDiIyVm3zIXla0ocEO7H0ZS7S
         gBHw==
X-Forwarded-Encrypted: i=1; AJvYcCXwZXmNGsSkvvvk4g7pTMRR3zC1say+ro1+rJadYaoqbtFzLFk4Q3KMHGopYOD1E09dWLIT/XzPVYW0t4BRXB5o@lists.infradead.org
X-Gm-Message-State: AOJu0YwZdKAojlOniAE40rRm0t/0GSDryBWkADs0/DgbIMJ7lER+jp6T
	zdoRjkuX92e8gtp2RiDp+DMs0GiBUNlIvcGgt8/ni8LrUVkSyfI/XlRfTDnhfw==
X-Gm-Gg: ASbGncsU4ieN6VArY1YxIwHx8gF+oH/Gm1ePY6XzZgOX1M45C/DRbpUH7POCDhqem6a
	DKswvvXXrCPZfWS85BN6hSUrAHOGbrQh73alNERW0QaP9Cdt1LN4D9ECZUsW/e+fX4MgMbXqzmy
	6XGaZVHito2XTU3Eh8BLipivjs4wmwfmHDhxkA36GjrmS4wtbGvar37P3SDN1RxR1/veRDNeNT3
	IFUC7rpRCTSWXcNVJr2a3rDySj+ncFpZwbRbbaRY0U8B021W5wHv9p2PpbnD95nsJyZ0KwDX1xI
	cjvroiprNOd/FyGjdO2zdcL/5kI=
X-Google-Smtp-Source: AGHT+IFoGyzNx30oj5QPZ8kXyITKzcMTpTQ6sfoOeGpNaqW8WOSxc+hSdJl3P3R9gIDdbaeQkXzR7w==
X-Received: by 2002:a05:6a21:103:b0:1ee:c7c8:c9e with SMTP id adf61e73a8af0-1eed4e5240fmr4788072637.2.1739951360379;
        Tue, 18 Feb 2025 23:49:20 -0800 (PST)
Received: from thinkpad ([120.56.197.245])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-732425467d1sm11672713b3a.12.2025.02.18.23.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 23:49:20 -0800 (PST)
Date: Wed, 19 Feb 2025 13:19:13 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Shradha Todi <shradha.t@samsung.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/4] PCI: dwc: Add PTM sysfs support
Message-ID: <20250219074913.e4rtyup3m3yv66po@thinkpad>
References: <20250218-pcie-qcom-ptm-v1-0-16d7e480d73e@linaro.org>
 <Z7Syf2LXEuKFToV4@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7Syf2LXEuKFToV4@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_234921_607051_DA137642 
X-CRM114-Status: GOOD (  31.44  )
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

On Tue, Feb 18, 2025 at 11:17:03AM -0500, Frank Li wrote:
> On Tue, Feb 18, 2025 at 08:06:39PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > Hi,
> >
> > This series adds sysfs support for PCIe PTM in Synopsys Designware IPs.
> >
> > First patch moves the common DWC struct definitions (dwc_pcie_vsec_id) to
> > include/pci/pcie-dwc.h from dwc-pcie-pmu driver. This allows reusing the same
> > definitions in pcie-designware-sysfs driver introduced in this series and also
> > in the debugfs series by Shradha [1].
> >
> > Second patch adds support for searching the Vendor Specific Extended Capability
> > (VSEC) in the pcie-designware driver. This patch was originally based on
> > Shradha's patch [2], but modified to accept 'struct dwc_pcie_vsec_id' to avoid
> > iterating through the vsec_ids in the driver.
> >
> > Third patch adds the actual sysfs support for PTM in a new file
> > pcie-designware-sysfs.c built along with pcie-designware.c.
> >
> > Finally, fourth patch masks the PTM_UPDATING interrupt in the pcie-qcom-ep
> > driver to avoid processing the interrupt for each PTM context update.
> >
> > Testing
> > =======
> >
> > This series is tested on Qcom SA8775p Ride Mx platform where one SA8775p acts as
> > RC and another as EP with following instructions:
> >
> > RC
> > --
> >
> > $ echo 1 > /sys/devices/platform/1c10000.pcie/dwc/ptm/ptm_context_valid
> >
> > EP
> > --
> >
> > $ echo auto > /sys/devices/platform/1c10000.pcie-ep/dwc/ptm/ptm_context_update
> >
> > $ cat /sys/devices/platform/1c10000.pcie-ep/dwc/ptm/ptm_local_clock
> > 159612570424
> >
> > $ cat /sys/devices/platform/1c10000.pcie-ep/dwc/ptm/ptm_master_clock
> > 159609466232
> >
> > $ cat /sys/devices/platform/1c10000.pcie-ep/dwc/ptm/ptm_t1
> > 159609466112
> >
> > $ cat /sys/devices/platform/1c10000.pcie-ep/dwc/ptm/ptm_t4
> > 159609466518
> 
> 
> I am not sure what real means by only show these number.

These values are supposed to be consumed by the userspace applications to make
sure that whether the PTM feature is working as expected or not. For instance,
once the PTM dialog is established with PTM root, PTM requester's local clock
should be synchronized with PTM master clock. And these can be verified using
these sysfs attributes.

> It is quite
> similar to network 1588, ptp. There were already linux-ptp
> https://www.kernel.org/doc/html/v5.5/driver-api/ptp.html
> 

PTP and PTM are different even though both are meant to synchronize times across
devices. PTM is limited to PCIe hierarchy and the actual synchronization is
performed at the hw level, limited to PCIe clock source (core_clk in DWC terms).

> Can we use similar method to sync local timer to master? I think it is real
> purpuse of PTM.
> 

Actual synchronization happens in the hardware itself as I explained above.
Software is not intended to do anything (if not using any external master clock
source) to synchronize the clocks.

I think you are referring to synchronizing the global clock source (the one used
by the kernel) of the endpoint based on PTM. But I don't think that is what
intended by this feature.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

