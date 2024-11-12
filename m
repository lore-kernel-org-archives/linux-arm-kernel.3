Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF64D42BBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 18:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=YUsh4z+Y40xAEM/R3qZ1b3dXJFo3pPaYo3qkA1YKCaE=; b=waE4qQirxMPqfY
	Ugwd4x6/d4MntFRUk2qJxbRBLq4HmOW6EEhA7YoeZZxdUIHE9kh6OLzzpi5gs3qH+8Bsbm4azSCET
	u/4vjXOPIJldDmn2GXZ5vBvO/DtV5JQdiKsq4qoTb9PLzoU0UJmWwSNFqSQNgb21quy/kXAQIUKoq
	cmv32V9/SRsRDSDYBHx/B8e5R/z2kFqd7pmOrZt9yZFaDU7QVaw3etHD+N/kbozq2JSM/ZvxyaQDG
	D8LV3MtphlXZURMqWNUYgCQ3NN90qZSK8kLyL/In/CpdHwihmuhNXVeXvXoyp0axq4NIZiFJ7c5qv
	5nWYuBg/bDBQs9psKQQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAveO-00000004Z0i-2n7r;
	Tue, 12 Nov 2024 18:30:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvca-00000004Yk7-241m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 18:28:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6774BA422BE;
	Tue, 12 Nov 2024 18:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11ED6C4CECD;
	Tue, 12 Nov 2024 18:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731436091;
	bh=H2jCUzYK5IZCoCe/12Ednn9tkBc4SKBxPTgIjXecd/k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=EOe0pd7p2tFGaOY09OQHqQtAl685Kj8521XyjL8ay5Qpu+Ruwqyp6IaIFzzD/o78m
	 KhHkQhpmzmggVJtXTD5qUUHJdyE/9jKD7MaJunItfnHMoZRC0HDvvc0h1utVopw7Kb
	 9XsPEcvllavigmZ1drRaAGjK12HlPvUkGXXiFEecGm3+TseuNhFCWGycRMfOQftGKI
	 SRecpQDkcLc1zOw8bUvVpOZDF8ReNwh716GlysliyDd77w7/v+tyQNb/fk/IWlGUPe
	 xx2fbzF00ZVaNwHXHN7BNFbSsMNkIII/7kWfywEn9pbxIJd4htSdangQ+lXbfU4vsX
	 Nx5lm4/oyDdFw==
Date: Tue, 12 Nov 2024 12:28:09 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
	robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, p.zabel@pengutronix.de,
	cassel@kernel.org, quic_schintav@quicinc.com,
	fabrice.gasnier@foss.st.com, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: PCI: Add STM32MP25 PCIe root complex
 bindings
Message-ID: <20241112182809.GA1853254@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112161925.999196-2-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_102812_616636_62DF7BA8 
X-CRM114-Status: GOOD (  12.77  )
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

On Tue, Nov 12, 2024 at 05:19:21PM +0100, Christian Bruel wrote:
> Document the bindings for STM32MP25 PCIe Controller configured in
> root complex mode.
> Supports 4 legacy interrupts and MSI interrupts from the ARM
> GICv2m controller.
> 
> Allow tuning to change payload (default 128B) thanks to the
> st,max-payload-size entry.
> Can also limit the Maximum Read Request Size on downstream devices to the
> minimum possible value between 128B and 256B.
> 
> STM32 PCIE may be in a power domain which is the case for the STM32MP25
> based boards.
> Supports wake# from wake-gpios

> +  st,limit-mrrs:
> +    description: If present limit downstream MRRS to 256B
> +    type: boolean
> +
> +  st,max-payload-size:
> +    description: Maximum Payload size to use
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [128, 256]
> +    default: 128

MRRS and MPS are not specific to this device.  Not sure why you need
them, but if you do need them, I think they should be generic.

