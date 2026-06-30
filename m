Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A36CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 20:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=PZYf4Vwez8GJq9I3WvAYOkbLhk26eGFt/+e8TLUuyHw=; b=aGi7uVb16zfgoo
	mkXrMUyCmjfW7C8+ztjhMD3Y4eEx3ByNaNMb58uRhyhMxuS4B5KcT2F0OsgCCSmaqNPXGnFaWk3XP
	VxSAcI3rtoR7WLYEELfE4ilmvGauTolQJmZYpioO16qtqUNStV/NL4obVJTbht1t0vsHrWJA+vA07
	kVTFC6ZbaeKrdH62tO9jYNQMZElIxvWzSMRzL3psEIGMEWVlW6QdmcA17VnP2+TTDEcm+8VLwyhr4
	fzy7nFSnelpfFhFCPEc4jgKZg67+bA+CmaHi8L79Zfc0r1weOFzeXFpVstp56NyW1qn4Y4NWRgApD
	sHTshN0JL0b96ciSO/rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weeqF-00000000AN5-30Wh;
	Tue, 30 Jun 2026 20:13:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weeqE-00000000AMx-1iEr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 20:13:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F238D60120;
	Tue, 30 Jun 2026 20:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 725461F000E9;
	Tue, 30 Jun 2026 20:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782850436;
	bh=PZYf4Vwez8GJq9I3WvAYOkbLhk26eGFt/+e8TLUuyHw=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=lhIeJz3JM3MkT3jBMvoqFKIRXj5FP1wYrEj3ZP7Vrox3COPzDuXJ3H2ApcqemT6C5
	 slYah7vEgTxLHPww06byXICKKx6ktkXyNpJ6tLQQyWs5Om/6FC1xuo4AUWTLr36eR6
	 aizxrASoQDiTyzlnpi+zJWBplWpp2cQl5KqVCrF75ZrkJ3ecD8EyEYmszYrCQ6g0jz
	 P7CNaQFyBKvv6frhy2SfwOKi1YzanVJLE0GMsL2JAENxq4vOjCQXOrBsE8xOFBRRy+
	 POjUiwzfWlRiaIjwr5E/X8/vn8e1EcHCdmv2Hgz7qnYKHw0xGmGD2+QIQQ7mdR9iki
	 n/rXaVx23zhhQ==
Date: Tue, 30 Jun 2026 15:13:55 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Kevin Xie <kevin.xie@starfivetech.com>, Aksh Garg <a-garg7@ti.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v7 1/4] dt-bindings: pci: Strictly distinguish C0 from
 C1-C5
Message-ID: <20260630201355.GA233513@bhelgaas>
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

On Wed, Jun 17, 2026 at 06:01:28PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Instead of using the ECAM registers as the first entry, strictly make a
> distinction between C0 and C1-C5. This is needed because otherwise the
> unit address doesn't match the first "reg" entry. We also cannot change
> the ordering of these nodes to follow the ECAM addresses because that
> would put them outside of their "control bus" hierarchy since the ECAM
> address space is a global one outside of any of the control busses.

Can you make the subject line a little more specific?  Something like:

  dt-bindings: PCI: tegra264: Strictly ...

would match the history of
Documentation/devicetree/bindings/pci/nvidia*

We can do while merging if there's no v8.

