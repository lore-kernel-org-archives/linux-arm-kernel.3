Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2697E606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XlqQRKdp;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=t+URNc/r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4i7JeNgS3PqRN89dO+cpnOVMM3es4j1AZjQVBIQdGUs=; b=XlqQRKdpqUoufR
	P4cqxWfMPFR17ls6hmh643dfPdP++G8FtcKYkESIC7LMrK0olexJV66NtepPTIBRjizwGwsJ01mvi
	yEwznQ8vzNnwdsMdmmpYfy69rkwic+2EXH+R7Pj/R7hYv3rUgN8IQVv4TsTML39QjRPs0iscxKcUp
	VXBpn0Q7l54funP85Ty/UTPmJgi7IQQBNpdSyVXPJzgztWj5jaPedAKRY4+nY7LiuEOpE+9Zc4AQt
	E0u49B2AkxdzpgpwPjN6L7jzKK95laMrGHyv3sluluNW1GRUXoY1LIBhsl+BJ7Z+IkWmqMdQXEGNe
	lGt5XacxhXq9zsfy1oig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOESO-00000002Wwn-10JA;
	Tue, 03 Nov 2026 13:21:44 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOESL-00000002Wvp-37ho
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:21:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12ECFA1648;
	Tue, 03 Nov 2026 14:21:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1793712097; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4i7JeNgS3PqRN89dO+cpnOVMM3es4j1AZjQVBIQdGUs=;
	b=t+URNc/r60MoZy96AxoqAKxv0aiqloRdmJ8e59KAjvzK44rrpCrCXMkv5SoSrCNrtzbeAa
	Vks8GVOW6j9f+vuuDEjqctWXcvSomv0vXToVIMFyptKvJQtvox49KLs9kRYFh42UsWAfSp
	Rj86BtBBuyrn1m8O29j/zUEqPgfCN/CS0yT1ia1e7HiiXMl0vlEcOs8Th2kR1Ok+sOwDnv
	BQrsLKs0luXhMQIqI3NqcpJjWvrR7fFScABtyplK2GhaWDrJ3LFYf9ikDPWcXjYQpQqKxN
	zxHfBgs9QdAF+cA+KtBYYIQtxg7o2WIATF4bMlBoejUxDN2a9ymII9qqmRRdtg==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 03 Nov 2026 14:21:32 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, Magnus Leatti
 <magnusleatti@kernelriot.com>, thomas.petazzoni@bootlin.com,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v2] net: stmmac: Clear DMA errors for multi-channel
 interrupts
In-Reply-To: <20261103125430.962715-1-maxime.chevallier@bootlin.com>
References: <20261103125430.962715-1-maxime.chevallier@bootlin.com>
Message-ID: <4ae868bcfbdbc0f74ea5a9d57094e7fe@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_052141_944139_0725BE23 
X-CRM114-Status: GOOD (  15.93  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Maxime

On 3.11.2026 13:54, Maxime Chevallier wrote:
> The Multi-MSI interrupt handler doesn't clear the DMA error interrupts,
> and this leads to interrupt storms when one of these interrupts starts
> firing :
> 
>  - The RBU (rx buff unav) which triggers under high traffic load
> 
>    This triggers easily with iperf3 and small udp packets, and shows
>    when running the netpoll kselftest
> 
>  - The RPS (rx process stop) which triggers when we stop the DMA RX.
> 
>    This one shows when restarting the RX logic without doing a down/up
>    cycle, like when attaching an XDP program. The XSK kselftests
>    triggers it.
> 
> Let's make sure we clear these interrupts for multi-MSI cases, and call
> stmmac_global_err() upon tx_hard_error to avoid possible races with
> other interrupts/napi.
> 
> For that introduce an "ERR" DMA dir, as we don't want to touch the
> RI/TI bits when handling these interrupts.
> 
> Both of the above storms have been found on dwmac-motorcomm (YT6801),
> and are triggered by the xdp.py, xsk_reconfig.py, xdp_features.py,
> ring_reconfig.py and netpoll_basic kernel selftests.
> 
> This seems to only affect dwmac4, there's no multi-msi mode on
> dwmac1000, and on dwxgmac these interrupts are masked as of today.
> 
> Fixes: 6ccf12ae111e ("net: stmmac: use interrupt mode INTM=1 for 
> multi-MSI")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai

