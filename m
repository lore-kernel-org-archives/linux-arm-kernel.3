Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E927AEB3644
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 00:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MtmLSqZKYSvx3l/kYXGcZs/FVR2WInBHJjB79pptmzo=; b=mPvfGE/E8V5WAm48gUJCO/mf7y
	aTuvmsoiNyqks9LBZ1das414X4bPR0Lcvhqp4lSno5V/hTj9N0dww4tZBo9kjMtzbQ9ymOv1D4mvV
	eYIJ1heuVPgiXfbFOxMmuwbKaGPMo6JGPwuIVM291OUE+vXZxmbIGfvOB3fQzP21G6zi60wSSgX/e
	dECSnthP7NGll12Pt21WRCpynEERwWB1sviDRpN4NXQ7AUDGiO5RPcxzMmSRI7A4qEU7pbdHE//VN
	ACJLy3lk2t6D2KnD7xmIBS+UJvrKkGqU2D9yPiDy8V55y4Dzyap7Vp1Gr6X05WF+VYwECWMKhykYW
	3NS3aa7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxDJv-0000000EFKU-2Kmp;
	Tue, 03 Mar 2026 00:09:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxDJt-0000000EFJj-26WT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 00:09:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 363564054A;
	Tue,  3 Mar 2026 00:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 484D8C19423;
	Tue,  3 Mar 2026 00:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772496540;
	bh=Z7qzH+D+x67to5sjz18CPohudnWYBfSkLMEK4/Me4F0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WFrjQ/5kV8TOTrHmKgXNQTQUMy/UkeRyUyE2IFWAdlTmOlpJbQiz658attUr4F6Bq
	 gDYAJ+RWG80dC2BGEBS3VSN1UPvs/orq0XSoy45j8LuzhiXPJqHVzblZAIT7o+nRQA
	 jcWXgYAW4dPfjJzh6MfHbm4DEKsLjVuRtDXJBjJPAsUmG7X4mVpMFN04zY9EDCNvKX
	 BugFfMHWV2ub1B4bU1MSIzaaEw7LK0AuYl1LtQzu+0oChW72UtdThQHpud1b5HopLW
	 T7Vx/n4KSI18dfpe8MFU/mhM5pYs0slgEdpk6mJC2e6izNI4p+gj7+/EaXEJZVH8P4
	 bd6tWDwBX7DIw==
Date: Mon, 2 Mar 2026 16:08:58 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
 <davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
 "pabeni@redhat.com" <pabeni@redhat.com>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, "alexandre.torgue@foss.st.com"
 <alexandre.torgue@foss.st.com>, "linux@armlinux.org.uk"
 <linux@armlinux.org.uk>, "rmk+kernel@armlinux.org.uk"
 <rmk+kernel@armlinux.org.uk>, "maxime.chevallier@bootlin.com"
 <maxime.chevallier@bootlin.com>, "boon.khai.ng@altera.com"
 <boon.khai.ng@altera.com>, "rohan.g.thomas@altera.com"
 <rohan.g.thomas@altera.com>, "vladimir.oltean@nxp.com"
 <vladimir.oltean@nxp.com>, "hayashi.kunihiko@socionext.com"
 <hayashi.kunihiko@socionext.com>, "boon.leong.ong@intel.com"
 <boon.leong.ong@intel.com>, "kim.tatt.chuah@intel.com"
 <kim.tatt.chuah@intel.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v2 4/5] net: stmmac: Add write_hw parameter to
 VLAN filter operations
Message-ID: <20260302160858.2fe0fa3b@kernel.org>
In-Reply-To: <TY7P301MB1984067560FD51D7E2424CA2D37EA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
References: <20260225142414.130144-1-ovidiu.panait.rb@renesas.com>
	<20260225142414.130144-5-ovidiu.panait.rb@renesas.com>
	<20260228110408.384420e1@kernel.org>
	<TY7P301MB1984067560FD51D7E2424CA2D37EA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_160901_569654_EA3DF8DF 
X-CRM114-Status: UNSURE (   9.79  )
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

On Mon, 2 Mar 2026 21:59:00 +0000 Ovidiu Panait wrote:
> > I wonder if instead of passing attributes like this around the driver
> > shouldn't simply maintain a flag (or have other way to test) whether
> > the clock to block X is currently enabled? It feels more like a global
> > state / property than trickiness directly related to VLAN config.
> 
> I'll drop the write_hw logic and instead just check netif_running()
> directly, to avoid passing attributes around.

SG, tho - be careful with netif_running() in context of open / close 
code paths.

