Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BB4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 13:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ENHSujfSW+4v2CmIMIlvxia/sjQrFFZFjN+o8GUkyIY=; b=YWqnbCqQKncrriLwitILm01MAI
	uGZcU6AFK4ttpE9Lc9ouBmDLJT5f9tb4Lly1yw2adw9PZNplJws1zqaXlTuapvoU4PpSR2XAx8vK/
	+ufeg2UwCamdJ9CPgb2lmhh7YTpkksZ/pwhuFVIpmjlbg4Oo2MeAYXef7mBbkkvD40MnC+rjE3h0M
	StCW2JVp2OlkzsYMJhAcFSmrCsHF9ACDmvmKmNEfT+06LHXKuCyx2AHjqoo5/ErcoNdt0rY7lXXZ6
	FjwnnZVxOBdChvEVs7tPOwE2yK8Zm4bREwr05VJTEhZe8g/23BrO6Y4D6RDmBNfu8N2MZGHJSodch
	4u2eLLKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYuj-0000000HDaQ-1u6d;
	Tue, 30 Jun 2026 13:54:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weYui-0000000HDaD-2MHa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 13:54:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 75CF5601EB;
	Tue, 30 Jun 2026 13:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0625D1F00A3A;
	Tue, 30 Jun 2026 13:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782827651;
	bh=ENHSujfSW+4v2CmIMIlvxia/sjQrFFZFjN+o8GUkyIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JxGtVFxEw8vaMhnYcCm+Cuq5e5W2cCsEJv7juEB5WY3jF7MEuDgDFV5eOxo+/XeFz
	 ZLv7D8eIpZCd2z14gLGNUzLnGi8UcT+WVI/A/UPlaNoZjtnWaZTRlQ0gPpMNZtmJGy
	 HgYnLXoRggBGE8lSDrlwb9eyJpsImD8KYjUl4uBOCEdq50OZ/hYpElxnGiXHM4vWaj
	 UEvTRTvJix5t2my6yHIsHifqnjUm2UUANKAyUUuWYfirY5u/XaBjYVhKgvFEm9azwP
	 EpgWQM6wMVAggjhqkSlZxs1mhWQq4DDPDhb2h6Ad3HjP0dhI3aTfZsQsFuctlD4MQO
	 2Rrxlpk9MOMcA==
Date: Tue, 30 Jun 2026 08:54:10 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-tegra@vger.kernel.org,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	devicetree@vger.kernel.org,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Aksh Garg <a-garg7@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kevin Xie <kevin.xie@starfivetech.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Subject: Re: [PATCH v7 1/4] dt-bindings: pci: Strictly distinguish C0 from
 C1-C5
Message-ID: <178282764964.2982344.701815323079264876.robh@kernel.org>
References: <20260617-tegra264-pcie-v7-0-eae7ae964629@nvidia.com>
 <20260617-tegra264-pcie-v7-1-eae7ae964629@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617-tegra264-pcie-v7-1-eae7ae964629@nvidia.com>
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


On Wed, 17 Jun 2026 18:01:28 +0200, Thierry Reding wrote:
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
> Changes in v7:
> - undo changes suggested by Sashiko, should've trust the dedicated tool
>   rather than the AI
> 
> Changes in v6:
> - add maxItems as suggested by Sashiko
> 
> Changes in v5:
> - rebase on top of v7.1-rc1, make it into a fix
> 
> Changes in v4:
> - ECAM is outside of the controller's region, so it cannot be the first
>   reg entry, otherwise we get warnings because it doesn't match the
>   unit-address, so revert back to oneOf construct
> 
> Changes in v2:
> - move ECAM region first and unify C0 vs. C1-C5
> - move unevaluatedProperties to right before the examples
> - add description to clarify the two types of controllers
> - add examples for C0 and C1-C5
> ---
>  .../bindings/pci/nvidia,tegra264-pcie.yaml         | 75 ++++++++++++++--------
>  1 file changed, 50 insertions(+), 25 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


