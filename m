Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76C5C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 15:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Ivmc+JejguiY/KKIcD3QDZJHkOsUoQCH4PPRA9dXW8=; b=YvMercmpWHctWOZ+or18P98udI
	XSzbf1YcOFMKqpBQH3FQlUci8qIR6tbfxZY1A0Hj0QsZEXmjhgt0FwMWmzFvclmRpAzz8Fb+bChbE
	BvP6/0OxLJvwbXFyMcGKIsE4w9/7Zyvf+vReQ4vz0ey4yb9Ctdr8jhpiym/1Muirp7pJKDb1GcnMf
	6Szyl6ajz6fg/wkmOpXicB0m2UTRMroI2koDTUomDB/i4r2GgW2ovUMRoqJ3UhYo16JVcPVkSwjdT
	Pe7LkvrxK5Iix4sfZ1Qm/xlVy8cpmzDDla9+EWH+eq+JzMLVSzPa4htN67eE6iU+2Fa0cc5AjtrZm
	XBUJIXSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjB3-00000003Fj5-49yR;
	Mon, 23 Jun 2025 15:33:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTg2v-00000002dR5-2OjB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 12:13:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0251060EDF;
	Mon, 23 Jun 2025 12:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7C3C4CEEA;
	Mon, 23 Jun 2025 12:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750680788;
	bh=2PC+knTY5x5lOCBbzbS0Ubx+8aVrsaLIP9Mh9VLPrJo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VA4AwAHWOkFYBn7OH625vRsz3hViv53X4iPL6X6ZiITzC8cKgpkQK/0N75a4eIYz7
	 rGoK9Bm+IUHpFrSnnlZrKXR9n91QeliX2c5WbEp5ZMHMMcSeRAPyWVePkC0VZF/agE
	 4mqlNTtRYJbBV9uNyasd0fE+Qg+HV4lgnhS5Ag1x4yTNtgamHyRUARGgbcpw0hJrtx
	 YkHKHu0gISdZgToGUUXUCp4UCDdzzL9BwSCnaoTqPeKEbOp+/cwxOeOzYjdJuELU+u
	 yZzeLm3SHx7igvbAPpW9J38/Q0i9T4ksvwZuFtNZ7O4xUkdEmxwUiqzAWwKYdy+W3Y
	 Ewfiui5D3qUCQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
 bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
 p.zabel@pengutronix.de, johan+linaro@kernel.org, cassel@kernel.org, 
 shradha.t@samsung.com, thippeswamy.havalige@amd.com, 
 quic_schintav@quicinc.com, Christian Bruel <christian.bruel@foss.st.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250610090714.3321129-1-christian.bruel@foss.st.com>
References: <20250610090714.3321129-1-christian.bruel@foss.st.com>
Subject: Re: (subset) [PATCH v12 0/9] Add STM32MP25 PCIe drivers
Message-Id: <175068078778.15794.15418191733712827693.b4-ty@kernel.org>
Date: Mon, 23 Jun 2025 06:13:07 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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


On Tue, 10 Jun 2025 11:07:05 +0200, Christian Bruel wrote:
> Changes in v12;
>    Fix warning reported by kernel test robot <lkp@intel.com>
> 
> Changes in v11;
>    Address comments from Manivanna:
>    - RC driver: Do not call pm_runtime_get_noresume in probe
>                 More uses of dev_err_probe
>    - EP driver: Use level triggered PERST# irq
> 
> [...]

Applied, thanks!

[1/9] dt-bindings: PCI: Add STM32MP25 PCIe Root Complex bindings
      commit: 41d5cfbdda7a61c5d646a54035b697205cff1cf0
[2/9] PCI: stm32: Add PCIe host support for STM32MP25
      commit: f6111bc2d8fe6ffc741661126a2174523124dc11
[3/9] dt-bindings: PCI: Add STM32MP25 PCIe Endpoint bindings
      commit: 203cfc4a23506ffb9c48d1300348c290dbf9368e
[4/9] PCI: stm32: Add PCIe Endpoint support for STM32MP25
      commit: 8869fb36a107a9ff18dab8c224de6afff1e81dec
[5/9] MAINTAINERS: add entry for ST STM32MP25 PCIe drivers
      commit: 003902ed7778d62083120253cd282a9112674986

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


