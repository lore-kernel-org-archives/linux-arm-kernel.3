Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D039C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 00:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2j24uR53myLlOiaaOFp2jANncIBqbH1glkadxcFqx0=; b=TLzskNhECRT89kNuj02+3TTiSi
	oKKJUYUzRtsvfLCO9ulbvISCzb+vQZ+n20ccu33yRaLPS29A3VFkkIyljkNMHual3PpJxbu/EHj6F
	JDq2kSHqYVPTV1vMdXLMOyD7MuVttzsY/tqZhXIhGprNYXJUt7/hfMupJ5sQDX5CxmRHdrH8bY3ux
	+64L1lBKxOX3nqYfSqLqrEdxhM6Rl80Fnf1Af35J6GPLi9zresI9PbuIm+h9yNKSmWkknXto6kf8x
	31SsPgyImGA1RhgWS/CDOZ8TW2GONFCeHFXDeR9kEkegumMLRoOvWEJcH62dwFYN+XlsMPBIwEkvi
	q1N2qp0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufSnE-0000000Axbv-3Out;
	Sat, 26 Jul 2025 00:29:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufSjV-0000000AxOP-19VM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 00:25:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ABAF3418C0;
	Sat, 26 Jul 2025 00:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4FDC4CEE7;
	Sat, 26 Jul 2025 00:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753489548;
	bh=Dko3kWgCT0Ys++R7H9KuFtq5eskVkBM8MOSnrUZdmSM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Yexe2ilWaZpg4EONL/tBPagglcnpt1t2mC9YTEcUOirFA4Vjm4ooF6XzXKBMUZQy9
	 e2gZLxn6Co3PeNaQ0UipNCoc2PI93Jj8A/gkcq7IQ6DMgssqfM6JIThKV52QPiU/Vd
	 FgVV5nQVPFRRXoZEJw6rQFPy104fmqwxEdk+NKJcbAH6JbAC8gdpGrhzJCsaY08bUr
	 l5njw75dvCUEP8KWSrqLiS60IJ2TxwiFhme/Zn+9uqm2mZ3q4sWr/InoxUxsXEdpzo
	 geQAjruPoUDFOv+QCfwiC641tZFmFBgG9vj3uiRAWFna8d6J5vEedJkNhIRhsa6SJn
	 ROuZXyfueL8Zg==
Date: Fri, 25 Jul 2025 17:25:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Richard Cochran
 <richardcochran@gmail.com>, <netdev@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next 0/2] net: stmmac: allow generation of flexible
 PPS relative to MAC time
Message-ID: <20250725172547.13d550a4@kernel.org>
In-Reply-To: <20250724-relative_flex_pps-v1-0-37ca65773369@foss.st.com>
References: <20250724-relative_flex_pps-v1-0-37ca65773369@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_172549_340004_969617BB 
X-CRM114-Status: GOOD (  15.68  )
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

On Thu, 24 Jul 2025 14:31:17 +0200 Gatien Chevallier wrote:
> When doing some testing on stm32mp2x platforms(MACv5), I noticed that
> the command previously used with a MACv4 for genering a PPS signal:
> echo "0 0 0 1 1" > /sys/class/ptp/ptp0/period
> did not work.
> 
> This is because the arguments passed through this command must contain
> the start time at which the PPS should be generated, relative to the
> MAC system time. For some reason, a time set in the past seems to work
> with a MACv4.
> 
> Because passing such an argument is tedious, introduce
> STMMAC_RELATIVE_FLEX_PPS config switch so that the MAC system time
> is added to the args to the stmmac_ptp driver.
> 
> Example to generate a flexible PPS signal that has a 1s period 3s
> relative to when the command was entered before and after setting
> STMMAC_RELATIVE_FLEX_PPS:
> 
> Before: echo "0 175xxxxxxx 0 1 1" > /sys/class/ptp/ptp0/period
> 
> After: echo "0 3 0 1 1" > /sys/class/ptp/ptp0/period

Kconfig doesn't seem like a great way of achieving the outcome.
Some per-platform knob would be better.
But ideally we wouldn't do either. Could we possibly guess which
format user has chosen based on the values, at runtime?

