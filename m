Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E70BE7719A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 00:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGALXm8cQ41qj1Mcak+BuLhxNDCTWf2912wkXyajLq4=; b=kcncqj0p7MXpJbvv6bIqOLynTB
	u6jtLz1MuQsv7IkiR95MPO2NZa/rUlwAeWEdmWlTXEEXIM3QQDWS9JBqaF5gIH5Vlx88Z/5mo7ySL
	SCB/4kD5flBl+MlbV6etQcAUou2vyCmZpRJz6gmcOXirjSMk5u2y/aJfWLKXg1md7zeJFQGkZNPF/
	3h0uMTmVoP/MxxwlBlBv+VZh0EbJ7xYCFupCSp3ZLW/6LprMzPhVTQUVboNx5tcwF7jdSBh9ugWrM
	d2pbyIQqaeaQnjbgDIx6dKdzEVDWIW7L8GMQYSn1lhY2WasLWoExetEUUPeTomlTpCKlOL9yjnU+u
	9R9g2PXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW3Jn-0000000DgUp-0Pr0;
	Fri, 10 Jan 2025 00:56:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW3IZ-0000000DgPX-2deZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 00:54:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 97BABA41631;
	Fri, 10 Jan 2025 00:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A477C4CED2;
	Fri, 10 Jan 2025 00:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736470489;
	bh=An7XqfSUMLwrY40eKxuhc/R7ct4U+ZFUuaL7mUE2bBo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aCbRiwgsgoH9GYITCVeOe1M59ZZvJNVbVpgb6KdwJaADf31LmsNnBIvPZ8i+x6dza
	 yLRbCYYMWJTjDxQJVhBbbz9j38SVdse0DgQB5Z8fMYtXZcdtHvh0AWRRF1RCH0JHnJ
	 X4HE/IoddNq5d3tFw8uGZVC6LAPMyZoNz52Uvyh0bdJZ4ZMJ+6g5px7EmajI8CyrYI
	 QlEasfKwtF9LDjoo0M+F/4mqhV0tABhGoZc8KogfpSVdiZv6lf9GaApZniVxTp1NOy
	 EF6EjPGSjZYSz6XoFNMg6UyZmC9vRWp91rv7kw5TNlSfu2+DCRxPDshcNbQDshQfvZ
	 f9ymmynN6L2IA==
Date: Thu, 9 Jan 2025 16:54:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Parker Newman <parker@finest.io>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Parker
 Newman <pnewman@connecttech.com>
Subject: Re: [PATCH net v2 1/1] net: stmmac: dwmac-tegra: Read iommu stream
 id from device tree
Message-ID: <20250109165448.53cb3e48@kernel.org>
In-Reply-To: <6fb97f32cf4accb4f7cf92846f6b60064ba0a3bd.1736284360.git.pnewman@connecttech.com>
References: <6fb97f32cf4accb4f7cf92846f6b60064ba0a3bd.1736284360.git.pnewman@connecttech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_165451_747327_FE52B6A3 
X-CRM114-Status: UNSURE (   8.84  )
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

On Tue,  7 Jan 2025 16:24:59 -0500 Parker Newman wrote:
> Nvidia's Tegra MGBE controllers require the IOMMU "Stream ID" (SID) to be
> written to the MGBE_WRAP_AXI_ASID0_CTRL register.
> 
> The current driver is hard coded to use MGBE0's SID for all controllers.
> This causes softirq time outs and kernel panics when using controllers
> other than MGBE0.

Applied, thanks!

