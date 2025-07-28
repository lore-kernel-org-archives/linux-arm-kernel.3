Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D246C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 17:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+d2rcREysRXtKARHFsAr2HZDjswTxp4mAu7WVwQcLQ=; b=kM3iBXH5y3tGmGQWxZ+MPzWR1+
	heWetg15KEDmPlKsiXTf0y47RNHfX1Ns8bzeQivXOmCDQrPre55WwDMQYfhJyLeHNMlL6BXNOJ6H5
	eLhp9zftc3XDbm5LCHlPLnFusaUmNtpptuVHh82AdSJbt4zluz+f5YVjbNj4L+heGdlEV1NhgnpnJ
	ED9ij1GzQZi4U80ys812okb8z1JSCRrWr8skixsTo5pzY67cXJZKLvVgDDx5LjY/KyH+fHlvM67cD
	vbCDeMwz2y3IahnNzeLUjQ/kDvOF43++b0MyOWZhQTbrPWEDWHJL5LFGm+fx0RwQvy4ORXeGfAk8P
	h1d6Gwlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRGj-0000000F3nL-47B3;
	Mon, 28 Jul 2025 17:04:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQF2-0000000Eu8Y-3VrV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 15:58:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EFB6760007;
	Mon, 28 Jul 2025 15:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4379EC4CEE7;
	Mon, 28 Jul 2025 15:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753718299;
	bh=V+d2rcREysRXtKARHFsAr2HZDjswTxp4mAu7WVwQcLQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FsFU/0l0JhHv3KnAnvGh9cpDYQdde/ZjdI3aAicUrmd3JLMO9kvxN2dnUFGVg0nb6
	 hwT1GRV+wSWcnTNqtXJT6NqIcKUVqyD09yR6V7inanEVa5Tyl9FVxqlTZyb0sRB8Iw
	 0LkJepsCP/izOEN+2HGU/elG6XQ7moL86xFYwSbRxQmYZswsXEK2zrsVcKhMvPmt2X
	 SXgDWQzWx/r010pE96+/oMBHaXLVkhE3D4N2grCCJ3At2BOdRwbn1O+WvkO6XNmAqg
	 MEJbJDImzWSQzN3NeoodWSvXhEn/8yn/3zB6u9cx8s36tkXFHMBRmYird8o5GOgq+A
	 jNm9g6/zcDC5Q==
Date: Mon, 28 Jul 2025 08:58:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Richard Cochran
 <richardcochran@gmail.com>, <netdev@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next 0/2] net: stmmac: allow generation of flexible
 PPS relative to MAC time
Message-ID: <20250728085818.5c7a1e45@kernel.org>
In-Reply-To: <424f8bbd-10b2-468c-aac8-edc71296dabb@foss.st.com>
References: <20250724-relative_flex_pps-v1-0-37ca65773369@foss.st.com>
	<20250725172547.13d550a4@kernel.org>
	<424f8bbd-10b2-468c-aac8-edc71296dabb@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 28 Jul 2025 10:15:07 +0200 Gatien CHEVALLIER wrote:
> Maybe we could compare the time to the current MAC system
> time and, if the start time is in the past, consider the
> value to be an offset. Therefore, any value set in the past
> would be considered as an offset. I see some implementations
> doing either that or replacing any value set in the past to
> a safe start + a fixed offset.

Let's try this.

