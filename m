Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C0FC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 08:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O6sRao24T5NMDYQzrO24ScZHs2OAYhD3pljdxfPJbSU=; b=BTe/VlgU7l+dqGOTl/IahMPX/k
	wdsdkI64REB3/Eq3/Y8KpmskBVn+9uTa7lkFvXYz/5EM70JudIIxdcNeAtvMMT5dNQLrjayuAZxOl
	mtNKZmc7TIfh0WvsNSTFX30Tvy8zMQQFX/qmdvvXn91RDSnn2tqUi2J8MRtb2CsAS5z3BGZgcQG1i
	cdZ0Gzp66diljUl9bXxx0dfL2ncy66mGe1IeGvYWVgAu88q0lpwwsp7bOybB+dSeTAqkW63h+ZVkG
	cOXPopF9s9bSsLEH+lyZppYOp2VKil3jo/33hLAJXnX+0s3NhX73ChCODR89odPrNQ0d23Zvj6Bnl
	yOSeQRwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Q8V-00000002MmK-1GtI;
	Sun, 20 Apr 2025 08:34:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Q6b-00000002MXW-21y4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Apr 2025 08:32:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D48FDA46DE2;
	Sun, 20 Apr 2025 08:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A49FBC4CEE9;
	Sun, 20 Apr 2025 08:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745137967;
	bh=kAmsi9vTZz9AUiyiRwQ3MR3WqPY6jashPoegxjXEDQY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DKEcs2kwrzlBJsO7VUvTe2aQA8KXyJjyftpIOqKWU/GiO6ixfYLiIaZ94DYhOXl6g
	 Cu1rr4/wtzqQF9dDHu7oD1FAuQgfJIXpOkR8dXg9b6Rh6YPwCYHTh8Y8mHVaKjTBwN
	 8Nfzv8vp+dvRQeq533NVdSbKCI5OoHG6oU4vNmOWmMkVE4ty7r/GV8HfYKgs/9iztA
	 /MARa+CxO/Xt4icMksK9Cpp0y6q0fWB6FiqCDaYVokMf6DKzQVfCNqTtG43QbHDdtr
	 s4ehE/IvoAj8Ia2eXXnFMD3ROPv2FCo/rjGg2C4DtpxxhWz/VCW96yTd19CnUKsCvB
	 HH6WVi/McvbzQ==
Received: from disco-boy.misterjones.org ([217.182.43.188] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u6Q6X-0075f9-1p;
	Sun, 20 Apr 2025 09:32:45 +0100
MIME-Version: 1.0
Date: Sun, 20 Apr 2025 09:32:44 +0100
From: Marc Zyngier <maz@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne
 Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, Sven Peter
 <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kw@linux.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 00/13] PCI: apple: Add support for t6020
In-Reply-To: <174507447951.53343.12422475035572217541.b4-ty@linaro.org>
References: <20250401091713.2765724-1-maz@kernel.org>
 <174507447951.53343.12422475035572217541.b4-ty@linaro.org>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <8be207b47f7e0f2d5e6381c74b0f4a6c@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 217.182.43.188
X-SA-Exim-Rcpt-To: manivannan.sadhasivam@linaro.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, alyssa@rosenzweig.io, j@jannau.net, marcan@marcan.st, sven@svenpeter.dev, bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, krzk+dt@kernel.org, mark.kettenis@xs4all.nl
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_013249_658962_0AF26A54 
X-CRM114-Status: GOOD (  16.51  )
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

On 2025-04-19 15:59, Manivannan Sadhasivam wrote:
> On Tue, 01 Apr 2025 10:17:00 +0100, Marc Zyngier wrote:
>> As Alyssa didn't have the bandwidth to deal with this series, I have
>> taken it over. All bugs are therefore mine.
>> 
>> The initial series [1] stated:
>> 
>> "This series adds T6020 support to the Apple PCIe controller. Mostly
>>  Apple shuffled registers around (presumably to accommodate the larger
>>  configurations on those machines). So there's a bit of churn here but
>>  not too much in the way of functional changes."
>> 
>> [...]
> 
> Applied, thanks!
> 
> [01/13] PCI: apple: Set only available ports up
>         commit: 751bec089c4eed486578994abd2c5395f08d0302
> [02/13] dt-bindings: pci: apple,pcie: Add t6020 compatible string
>         commit: 6b7f49be74758a60b760d6c19a48f65a23511dbe
> [03/13] PCI: host-generic: Extract an ecam bridge creation helper from
> pci_host_common_probe()
>         commit: 03d6077605a24f6097681f7938820ac93068115e
> [04/13] PCI: ecam: Allow cfg->priv to be pre-populated from the root 
> port device
>         commit: f998e79b80da3d4f1756d3289f63289fb833f860
> [05/13] PCI: apple: Move over to standalone probing
>         commit: cf3120fe852f5a5ff896aa3b2b6a0dfd9676ac31
> [06/13] PCI: apple: Dynamically allocate RID-to_SID bitmap
>         commit: d5d64a71ec55235810b4ef8256c7f400b24d7ce8
> [07/13] PCI: apple: Move away from INTMSK{SET,CLR} for INTx and
> private interrupts
>         commit: 0dcb32f3e12e56f5f3bc659195e5691acbfb299d
> [08/13] PCI: apple: Fix missing OF node reference in 
> apple_pcie_setup_port
>         commit: 02a982baee109180da03bb8e7e89cf63f0232f93
> [09/13] PCI: apple: Move port PHY registers to their own reg items
>         commit: 5da38e665ad59b15e4b8788d4c695c64f13a53e7
> [10/13] PCI: apple: Drop poll for CORE_RC_PHYIF_STAT_REFCLK
>         commit: 3add0420d2574344fc2b29d70cfde25bd9d67d47
> [11/13] PCI: apple: Use gpiod_set_value_cansleep in probe flow
>         commit: 484af093984c35773ee01067b8cea440c5d7e78c
> [12/13] PCI: apple: Abstract register offsets via a SoC-specific 
> structure
>         commit: 0643c963ed0f902e94b813fdcbf97cbea48a6d1a
> [13/13] PCI: apple: Add T602x PCIe support
>         commit: f80bfbf4f11758c9e1817f543cd97e66c449d1b4
> 
> I've fixed some trivial conflicts while applying. But please check the 
> end
> result to make sure I didn't mess up:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=controller/apple

I did my own rebase and came up with similar resolutions. The result
booted on my M2-pro mini without issue, so it looks OK to me.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

