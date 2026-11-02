Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2807B606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 08:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PDITSRcv;
	dkim=pass (2048-bit key, unprotected) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=0RkAH+tp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dyRe6cqepbH4BcsD+uq9N3zywhn9zMc3JHjIGWA0DU0=; b=PDITSRcvKzXGWY
	/JPxHxbmRU/Ur00NAfkYNsfwQr7fd5AJUV8Ejk56pDI57rB6CPSjThzDEGytAYBHXKp558mVc11sx
	YNh9J3ceuhGZ48hU0xjB3+E+mmoO95XhsnHbHTWUWnkmaR0N/vQDsvrCiV9Nz+1KFEkDLPVOi80WO
	Yfs4G65d+SHhidZDWEXz8qgCQlLHCkTms0i85XOOwmbCMRu553WhHz2sFngM2sU68dN5ZvtHzOzEb
	1wExOwLzFfHDR2iSPn4pykHfyT4p9ELLFfm0ZuEMQS3QnzoKch261DoyjJjQV+TcrSg/ddSj7EVqP
	iLKjowoc3kgCsUjUNasw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnnp-0000000Fun7-0dsz;
	Mon, 02 Nov 2026 08:54:05 +0000
Received: from mail.kernelriot.com ([74.208.142.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnnn-0000000FumY-1W6d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 08:54:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1793609642;
	bh=dyRe6cqepbH4BcsD+uq9N3zywhn9zMc3JHjIGWA0DU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=0RkAH+tpk7+TZYfWtxox4JK5uKvPDOp9pMo7DdjLQgqRgwbhm7LoxVdURc1Ub4a77
	 byyAEWm3Xopg/G0njAmcgh8TI1gK4IfpGy1sEeB+T3Bvq2Oc6AyNBGk3lz7U74eU+r
	 yEsFzazmpjpKbkV3PjH7FXdyCWwrIRtZVodZa0Q2CHxighPM+Uc1WZstH19LmM4Q7A
	 84gxd+L7t17IQuxvTX4tMQklTtdXxEn1mJwpdXR29Uh2i88h9VFlZqVkuGQioZuG3y
	 d2zaPvzQ5RmOjbbMwxEIFPipaIbOICLAdGQmSfilBjp0Vtq+iJxvUkyPK3Ie+/oxUz
	 oVf73D2YvAEQg==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id 521EC819B6; Mon,  2 Nov 2026 08:54:02 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Nicolai Buchwitz <nb@tipi-net.de>,
	Yao Zi <me@ziyao.cc>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: dwmac-motorcomm: mask the MISC interrupt
Date: Mon,  2 Nov 2026 05:53:03 -0300
Message-ID: <20261102085303.5391-1-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20d4a3c3-99fa-4659-8d5d-eb5eefcf6545@bootlin.com>
References: <20261102080938.2955-1-magnusleatti@kernelriot.com> <20d4a3c3-99fa-4659-8d5d-eb5eefcf6545@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_005403_447147_0FF7F674 
X-CRM114-Status: GOOD (  10.25  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/2/26 09:22, Maxime Chevallier wrote:
> Can you test this, sent a few days ago ? I also saw that storm, but it didn't
> seem to be motorcomm specific :

Thanks, I missed it. It fixes the hang here with MISC left unmasked,
so masking is not needed. I replied with a Tested-by on your thread.

Please drop this patch.

For context, I ran into the hang while benchmarking the glue for a few
patches I plan to send once net-next opens, among them Wake-on-LAN from
S5, which does not work on this board today.

