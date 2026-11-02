Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AADD606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 08:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YU7hJKSk;
	dkim=pass (2048-bit key, unprotected) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=Z1HGC3Hk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yuiWaWQDrq0Vg9DrcjhhGqt3JHN8TGxGS0CrvgppQHM=; b=YU7hJKSknGaSyn
	93Dq4iEy5H+BTKRSA71wAwUfQiQnRaUIJ0PQyXCR6n9e8O7kBWZ2GP8JTG56PjteCiIQGe0GzPl4a
	KudaKQNJIGGov9eQmDr4Ka3kHt3V7ewTYXP+wF0QL24WwlG6J64s778VdPRXVRL5Bqzxcc7xBRxuI
	yV949UTCCyQfTRLNhU6KTxuy475ccNz5YEoR/XSpSnzZtcGjJMKP9ZikzcG5IEknEGEx0cn+kBOMi
	9YjKsBs/PzssPY32uT8lk1qcJp+UIQS74qe5cnidECmpzmes0YQlOGTpSan/DXmtA+80a1RIKhh7F
	Z+nx9u9CyGAb8XjMV5CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnh3-0000000FuNH-0ZVr;
	Mon, 02 Nov 2026 08:47:05 +0000
Received: from mail.kernelriot.com ([74.208.142.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnh1-0000000FuMi-0ppx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 08:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1793609222;
	bh=yuiWaWQDrq0Vg9DrcjhhGqt3JHN8TGxGS0CrvgppQHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=Z1HGC3HkR8D00Uh0FiLWurch+GQd10bwl2o2HDqhQXQmKVZsWi2pnIo94j6nTnyWI
	 TePKg9UI0on9soMqJYZ2ICUTB36Ii7//aTV+5o5DRK54lTOlYvhqAfbIgo9+RlVUUh
	 vXMW9ff3cdv1Jb8B1C8oAJw0+AFj+IvCiYR6Zra9xCqFH+Im3iei2uXeYIlafn+hz5
	 7/xaJcTPgVCNaaUzNFGJxOQL540GjMq2Xol/1KYHRCGo4Z6ovG5ogoLfPVpTQArYAg
	 tSDTMGktKaG+xIgwD+RxTVMYCExwE6jmkcCKDjFhRBN3r0PjsfvpyY0xO+mXfMnIvX
	 5lWwKAUA9c+OA==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id 22D0F81455; Mon,  2 Nov 2026 08:47:02 +0000 (UTC)
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
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	thomas.petazzoni@bootlin.com,
	alexis.lothore@bootlin.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: Clear DMA errors for multi-channel interrupts
Date: Mon,  2 Nov 2026 05:45:58 -0300
Message-ID: <20261102084558.5105-1-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030102251.208929-1-maxime.chevallier@bootlin.com>
References: <20261030102251.208929-1-maxime.chevallier@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_004703_293534_B778E108 
X-CRM114-Status: UNSURE (   8.63  )
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

On 10/30/26 11:22, Maxime Chevallier wrote:
> The Multi-MSI interrupt handler doesn't clear the DMA error interrupts,
> and this leads to interrupt storms when one of these interrupts starts
> firing :

Tested on a YT6801 (dwmac-motorcomm) with net at cb284914e749 and the
glue unmodified. Without this patch, a 64-byte UDP flood
(iperf3 -u -b 0 -l 64 -R -P 4) hangs the machine. On this board the
stuck RBU also keeps the MISC bit in MGMT_INT_CTRL0 set, so vector 5
fires about 120k times per second. With the patch, the MAC interrupt
only fires while the flood runs, about 1k/s, and stops afterwards;
same with eight streams plus a TX flood for 30 s. Throughput is
the same.

Tested-by: Magnus Leatti <magnusleatti@kernelriot.com>

nit: "YT8601" in the commit message should be YT6801.

