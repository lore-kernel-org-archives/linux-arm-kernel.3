Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE8CCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 23:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jebPbjme7P2kWR8ZBbngJLly0Zj7VzPVjORl20HOTyo=; b=faHhw65XzeRZQjRCp1ko+IN0ke
	Zch6DNvLAQXYc7wFaeCA+v5USyc33LnZfH0e6xm6ZRhGvnK/jDBiWrqpQwtZjcxGpkX0T711gprV2
	NlWnRHu79+AqLPi1Jl+zwCePobDuzFNTzSybnSAtKRBa6UlBl2fWWQzPTpsKVDUyIOT1mZIZfWdhZ
	8N/X5kxrvoeSBO2ARb1laRYhvF3lose2YdI1P110jcUw+/XbH0452j61RB9uCRmbdLYetCnm12tcR
	9ECicD3qdsWq/IvMDSYi6T8JPVlt7aUXHUbV++fmdRgvoIDX6qP6163anluIWdtsMF1Z1hEPIyfJs
	vSj0vB9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBLN3-00000000seG-3SKu;
	Tue, 21 Oct 2025 23:02:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBLN1-00000000sdu-3toV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 23:02:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B5DB43AFD;
	Tue, 21 Oct 2025 23:02:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD849C4CEF1;
	Tue, 21 Oct 2025 23:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761087743;
	bh=jebPbjme7P2kWR8ZBbngJLly0Zj7VzPVjORl20HOTyo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=o+Z/ffp++yk1l4a4ImWFacO3Xbayi82Qa014hran1qQITfIuDpVRQHXPUH//jEK3O
	 Sp3sfTP6wr+Aq1Y1W+iTY7TZbNXdQXYG9LoZtDrQ9IR+/y0Il/eHNiT+l9EPyUYdxy
	 bTWaa0VSOGq7xbLOXAehLsVxJjpdLj6DF2ea17J0pknwn7+CX0FrpuMcDUgAWRL6th
	 2240836ngUv8ifxU/sqBRS23QAaocFlMDL9Hk80q3kleFhRCiz5XQXrXxWO2YPP7mM
	 n0v4HGJlMLWsFe+cNsQ8CwNcColVc8bCLgNmjYkH0fYa+V48CZoJUETSScLnKaFwGB
	 yC6c2+d6T9+zg==
Date: Tue, 21 Oct 2025 16:02:21 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Richard
 Cochran <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Alexis
 =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] net: stmmac: Allow supporting coarse
 adjustment mode
Message-ID: <20251021160221.4021a302@kernel.org>
In-Reply-To: <911372f3-d941-44a8-bec2-dcc1c14d53dd@bootlin.com>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
	<20251015102725.1297985-3-maxime.chevallier@bootlin.com>
	<20251017182358.42f76387@kernel.org>
	<d40cbc17-22fa-4829-8eb0-e9fd26fc54b1@bootlin.com>
	<20251020180309.5e283d90@kernel.org>
	<911372f3-d941-44a8-bec2-dcc1c14d53dd@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_160223_995609_92453F4D 
X-CRM114-Status: UNSURE (   7.77  )
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

On Tue, 21 Oct 2025 10:02:01 +0200 Maxime Chevallier wrote:
> Let me know if you need more clarifications on this

The explanation was excellent, thank you. I wonder why it's designed
in such an odd way, instead of just having current_time with some
extra/fractional bits not visible in the timestamp. Sigh.

In any case, I don't feel strongly but it definitely seems to me like
the crucial distinction here is not the precision of the timestamp but
whether the user intends to dial the frequency.

