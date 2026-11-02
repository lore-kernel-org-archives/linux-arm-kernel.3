Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F76606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TZ4D5qD+;
	dkim=pass (2048-bit key, unprotected) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=EYZv+AQP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dzgmecBVachGINg3yF3uYgoPmBMO2/R7Vya4aZJJS/o=; b=TZ4D5qD+nS2ewO
	oSqmX+G55RxEzmZUKJk3P/RoQKm03+6o7yt4aVtiwbjuyrWMVQp/UdubY/0EfCWOA3c7noPbai9lW
	Vfcqw/8vBD2dKC+Nd86CYhc80ifct3QOseYSTpxE3j8DulgCnuyy7ebUMvg3TDJ9XtjrckSk9pDci
	v8EtHji8PSqDACGUNkuKTzttXGQpDq5/FO9NikYKzTkLC6kUAfgSfSckICdxtTVnHBuN/P5mRRFGc
	xc7IWz8nbx0iZTfCjbB1d0yWfpcwVj3A7RIpzjcVgtzT4/FjNNjuZIOMrhuerEHs8+4a5zjwwfNiD
	X5N5nSzTtiJdT19k2wQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnwm-0000000FvF6-0CAB;
	Mon, 02 Nov 2026 09:03:20 +0000
Received: from mail.kernelriot.com ([74.208.142.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnwj-0000000FvEk-2kM8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1793610196;
	bh=TBb/GsUsOb/1xhSwjR7HNDvxrH90IM0dwt3lhowgT5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=EYZv+AQPRMIjgOOoVuctoIf7/3Cc/VK9FrUWQCLvmPx9BOgesu8Q4KdBfYIbhfAO9
	 H/0Eeemb0vR9sM6FGkbAUDmP2X30EZPfOqYbFt1nq6DrcGyXIieuAKQmd5Wwo40ITT
	 a3STA24Y1BshPbVXGqQV6QHLZVk07q75w6Wh6Q1kKYv8D2pSwKlBy+9wIxHRW0jJro
	 FUfa1H0pOEHn7UhYyY3nSE8fT/zjs4O1LBHSMoZfUlvMWdAkdUPfTUrro14sbTrkPU
	 qC0s2ElIj8K0A3F3wwzGsIE3fWrRP+S4u0ZoxlpIEkLDJhWDzVBBb/dil1GwoNb4yr
	 7bSGN2ajdvyKg==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id 9486F819CD; Mon,  2 Nov 2026 09:03:16 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
Date: Mon,  2 Nov 2026 06:02:41 -0300
Message-ID: <20261102090241.5862-1-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <805aeb73d9e32b237bcb30c8fd44ffed@tipi-net.de>
References: <20261102080938.2955-1-magnusleatti@kernelriot.com> <805aeb73d9e32b237bcb30c8fd44ffed@tipi-net.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_010317_772692_A4F51B4A 
X-CRM114-Status: GOOD (  10.55  )
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

Hi Nicolai,

On 11/2/26 09:29, Nicolai Buchwitz wrote:
>> +#define  MGMT_INT_CTRL0_MASK_MISC		BIT(21)
> 
> Where is this bit documented? The vendor driver?

Yes. The vendor driver writes 0x00200000 there unless it services MISC
itself, and the yt6801 driver Motorcomm posted in 2025 defines the mask
field as bits 16-31 of MGMT_INT_CTRL0, with MISC as status bit 5.

>> +	writel(MGMT_INT_CTRL0_MASK_MISC, priv->base + MGMT_INT_CTRL0);
> 
> Doesn't this turn off the stmmac MAC irq on vector 5 completely? If so,
> please mention it in the comment.

Yes. On this device vector 5 only carries MISC. I should have said so.

> Also, does the MSI fallback still get RX/TX interrupts with MISC masked?

RX and TX have their own mask bits, but I did not test the single-MSI
path.

Maxime's patch fixes the hang here without the mask, so I have asked
for this one to be dropped.

Thanks for jumping on this so quickly, Maxime and Nicolai! I really
appreciate it. Have a good Monday :)

Magnus

