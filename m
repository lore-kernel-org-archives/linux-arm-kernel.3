Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCB3606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1nWN2ssz;
	dkim=pass (2048-bit key, unprotected) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=h69B8+/y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZMykjE/7l/jsGdfR+n3nXl+yG8LC3pOXTPVPEB8YOmA=; b=1nWN2sszx0ZFob
	slBLwLYkQMmH6jtcCK2Zuf8dSvkizmPMcVOOi+Z78zvRcA0ZxqJiSY2WrLh/a0YPUAMdJ7mp2W3Sc
	y+uDOw9yHWxfJk5Ygz+lLy3s6gB8/yymLeD0OJ1/US7P+fVrPMKaJfcQVfHEAedfr1UUhcTVZ3pXp
	P8Rog0ucxUvjgSi7j4daz7dE94xuelkzUkavbKpuyo1RsoOZGX1iYeaYDAUXn21CMFgbEp1iYrPG+
	1ppwiYwj+3d/eGeWLqdbAT4+CgS6wRgGbOoTCdnKuuDL6u6RErJ/r0JZwkJSz6/t4sSwXPbE3nH4G
	2moY706vwtzsDkCCaSGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHqU-00000003F9J-36kt;
	Tue, 03 Nov 2026 16:58:50 +0000
Received: from mail.kernelriot.com ([74.208.142.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHqQ-00000003F7O-0XD9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1793725122;
	bh=kLOhx7Xp1VWwEDJ5YlOdluqX5Krp+Iu/TEbVQCaGCzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=h69B8+/yiPfxJltzpSCRsWhjrdhAv1T1htNv6JY8a6Fi7iWIr+n5mGw5eV5u4fhiZ
	 U3rTaOac/nhkUE941dJOI5Wwa9vi68uz1fQUFg6tALuvD9cG6DFrDjXfjR3zb+65TP
	 KyNroY/vhYWr0jIoX10WYzLdmlF/zDgX9VclOUAae32i1d6MNU0Vowj/Qeu1FJih1+
	 mRpfEYu8m2RtOWbDrPWGCYTkVKDFqXVXsLu7WyIuWH/TBQnvgLbtHVVSfdl/fwxu2d
	 SFMv1wqhU5fBsK1Qku6vTDyqz2lfTwH9ntoebpcxNXx+TA39XytP9M1PADd2RLuR3F
	 +EwdBgYwNj9mg==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id C0587819E3; Tue,  3 Nov 2026 16:58:42 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v2] net: stmmac: Clear DMA errors for multi-channel interrupts
Date: Tue,  3 Nov 2026 13:58:08 -0300
Message-ID: <20261103165808.72113-1-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103125430.962715-1-maxime.chevallier@bootlin.com>
References: <20261103125430.962715-1-maxime.chevallier@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_085846_227498_E0912823 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/3/26 13:54, Maxime Chevallier wrote:
> The Multi-MSI interrupt handler doesn't clear the DMA error interrupts,
> and this leads to interrupt storms when one of these interrupts starts
> firing :

Retested v2 on the YT6801, same setup as v1: net at cb284914e749, glue
unmodified, so the MISC interrupt stays unmasked.

4x 64-byte UDP RX flood for 10 s, same kernel:

  without the patch: the MAC interrupt hits about 93k/s within 4 s,
  stays at about 122k/s after the flood stops, and the machine stops
  responding.

  with v2: about 300/s during the flood, 0 after.

8x 64-byte UDP RX plus TCP TX for 30 s: about 25/s during, 0 after,
with TX at 744 Mbit/s alongside.

The 4x flood also runs clean after link down/up, ring resize, an MTU
change, a 100/1000 speed change and a module reload. Throughput is the
same as with v1 (TCP RX 941, TCP TX 825 Mbit/s).

Tested-by: Magnus Leatti <magnusleatti@kernelriot.com>

