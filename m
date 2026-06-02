Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE80CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 15:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XwIHfh84CVCmmZSgMIfKRu78vSsVBQrQxj9tsie8akg=; b=3N/BOsx7SsFp1FXtgE7Ev/ZuYB
	G1838lh3w6RfyBsMXX42y3eDg9tEAUm1BXIOOuPsqCmKNQXf1Re2lLzDxPsztJFYW8w4pn96ydLgf
	NRsE/5DaX2E7SlSFUMjzNdAdflYvdzgW2JaUmJw/R6Pc6YN3OCAHLm4Y6wPL6b/+6fuch4Tc+Bgcw
	+bn12Ie2n0pObVNKnCNcXbR2KHnWNcPsyp0FTZvnUxLc617fFVmsFs9hpj6BjAOhkmXv7hJ6gyayZ
	E0q9L7v02onv4bKfjhU/fuXn9p3IwrNdVtATdxAMCVbR358GXpIJ20iU0PmEPcqvoCzUlw4OQQcJ+
	TSuJgN9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURDw-0000000DLtE-2RA0;
	Tue, 02 Jun 2026 15:40:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURDu-0000000DLsf-1SPo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 15:40:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A13C42AD2;
	Tue,  2 Jun 2026 15:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EDC91F00893;
	Tue,  2 Jun 2026 15:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780414809;
	bh=XwIHfh84CVCmmZSgMIfKRu78vSsVBQrQxj9tsie8akg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FE6GfdYwE5QtQPOD68lh1a4gGQbnW5I+zpJ/VY0+MmKcFBKBnXrNVNDU0f7sV+VIx
	 SFMd3uddjTFAxhxyJ9wiSuH1Y4F3rh9afJM9Db5Iq4Kj7q4e2FzPo807ytrtIs51qr
	 6A+EzjjBVcM0NVqe/ZY7Nlns5+Q2QlD62yTQKSpKR0XO8I3Mula7JNpRyhrnho/TOr
	 amSdfDCrEc4SS7QMd/izMj40+ORlC9cx+ZXulrUzgWJ2ZShCQHmok8JsbLX8/OWRLm
	 XS3wTDcUPPFoMQzvP3ZZ0lfDFEeR5Dupk8MVWzNVNM3nKBDJH1D/crwZCVMgmem7l+
	 HR4fL3wTdAOOw==
Date: Tue, 2 Jun 2026 10:40:08 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Kevin Xie <kevin.xie@starfivetech.com>, Aksh Garg <a-garg7@ti.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: pci: Strictly distinguish C0 from
 C1-C5
Message-ID: <20260602154008.GA362770-robh@kernel.org>
References: <20260602-tegra264-pcie-v6-0-edbcfa7a78fe@nvidia.com>
 <20260602-tegra264-pcie-v6-1-edbcfa7a78fe@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-tegra264-pcie-v6-1-edbcfa7a78fe@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_084010_412606_2D12DCCF 
X-CRM114-Status: GOOD (  12.38  )
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

On Tue, Jun 02, 2026 at 01:33:23PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Instead of using the ECAM registers as the first entry, strictly make a
> distinction between C0 and C1-C5. This is needed because otherwise the
> unit address doesn't match the first "reg" entry. We also cannot change
> the ordering of these nodes to follow the ECAM addresses because that
> would put them outside of their "control bus" hierarchy since the ECAM
> address space is a global one outside of any of the control busses.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v6:
> - add maxItems as suggested by Sashiko

Sashiko was wrong here. While the analysis was correct for json schema, 
it didn't account for DT schema's processing of the schemas to the final 
json schema. In this case, this:

items:
 - {}
 - {}

is transformed to:

type: array
additionalItems: false
minItems: 2
maxItems: 2
items:
 - {}
 - {}

The reason is a fixed, defined length list is the rule, not the 
exception for DT.

Rob

