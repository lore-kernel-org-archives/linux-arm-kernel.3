Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD49AC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 12:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CvYaTbwQSK0LJJBsjgTm93gEm5vYJxmimJC+fF1vySM=; b=rt5L/QLyeXQCvKCUvXM99zN5uC
	0qG64dfZyuApVzoc4wKem8oDOop8SjdVPuhrlDsDm5IKza34iGyMcljlbhl/LEB8Wt9kno+QIt5uV
	j9XCzeOdWAroLmwkZ8DPpal364K0yRjoRRocya2qnIqxtGcLqZyWad5RBW9gxI39fRJLsG5fkbIgC
	/+F8vrduHKo5wuqMzRKFUjwy8EUVkBXOwm9sOAWilraQf3K5TAYb3X2EwTtVsId+wArGANWvv9W/M
	+rpDJTnw1Yy5hi/TymyvWhDi2l+Kq2UbtqplDcv+iOZMfTGTdm8iQ986DTQJu43loIXMIR2EsyvKJ
	ONs0b9Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10m9-00000009GMA-190b;
	Mon, 31 Aug 2026 12:06:09 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10m4-00000009GIv-0JjL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 12:06:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59B95A418E;
	Mon, 31 Aug 2026 14:06:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1788177961; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CvYaTbwQSK0LJJBsjgTm93gEm5vYJxmimJC+fF1vySM=;
	b=unIdRtVlp19MCSQglFCY+aKbD1azbCpssbH2o0lKAgQROidOe4hlT5RStr4i1+MTGX/ZR4
	tHHXCKruj+bRyL0smyVl8KEeoZ4dV/u2ZzEumfLIwEOPp2CyFPCGksEIkciDGsUqiVH3jj
	5/oIyfPpBDiZSIm3YT6eUEidzIGLo83+EKA2PBvBDaXXFNdjjzcJn59lOLLcU9SEIBAZn/
	7JpYElUB3myI6he74j1ImqjgPgrErGJITR23BgE0emhn/+zE/lfZVqPc9pE8U5qF8kM478
	QSW0NQIr9Nmp30N3h0S/ElQK19JGGA2xxnyqCMmOmM861gfjRL7pQkWhpSJqNQ==
MIME-Version: 1.0
Date: Mon, 31 Aug 2026 14:06:01 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac4: Use the full perfect
 filter ability for UC filter
In-Reply-To: <20260831070121.349778-3-maxime.chevallier@bootlin.com>
References: <20260831070121.349778-1-maxime.chevallier@bootlin.com>
 <20260831070121.349778-3-maxime.chevallier@bootlin.com>
Message-ID: <04156e434531ec68e8862e23bd84bc20@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_050604_276845_FC558C44 
X-CRM114-Status: GOOD (  18.34  )
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

Hi Maxime

On 31.8.2026 09:01, Maxime Chevallier wrote:
> Contrary to dwmac1000 that gets its number of perfect filter entries
> through the 'snps,perfect-filter-entries' property, dwmac4 allows
> reading the filter size from the HW features registers.
> 
> Perfect filter is used for Unicast filtering, and can contain up to 128
> entries, each having its own set of registers to access it.
> 
> The registers are always at the same location in the map, regardless
> whether or not the entry is implemented in hardware. Accessing a 
> register
> for an un-implemented entry just doesn't do anything.
> 
> The filter is made of one always-available entry, and 3 configurable
> banks :
> 
>  Entry 0 : Always implemented, stores the primary MAC address
> 
>  Entry 1  \
>   ...     + -- Can contain between 0 and 31 entries. Number of 
> available
>  Entry 31 /    entries in HW_Features0[18:22].
> 
>  Entry 32 \
>   ...     + -- Additional 32 entries, all or nothing. Availability is
>  Entry 63 /    specified by HW_Features0[23]
> 
>  Entry 64  \
>   ...      + - Additional 64 entries, all or nothing. Availability is
>  Entry 127 /   specified by HW_Features0[24].
> 
> Each of the 3 configurable banks are independently selectable, meaning
> we can have gaps in the register banks.
> 
> For instance, a setup with 50 addresses enabled will have 17 entries in
> the first bank and the additional 32 bank enabled (50 = 32 + 17 + 1).
> 
> Another example with 70 addresses : 64 addr bank on, 5 addresses in the
> first bank (70 = 64 + 5 + 1).
> 
> While I haven't seen HW with gaps in the banks, Synopsys confirmed this
> is a real possibility.
> 
> Let's therefore introduce a dwmac4 helper to get the physical slot
> number of a given entry, allowing to configure the correct bank when
> populating the filter. As we need the HW feature-set to compute the
> index, store the bank info in the mac_device_info struct.
> 
> The total number of available entries is computed based on the
> discovered parameters, instead of using the default value of 1.
> 
> Results on HW that uses dwmac4 :
> 
>  - imx8mp   : goes from 1 entry to 64 (1 + 31 + 32)
>  - stm32mp1 : goes from 1 entry to 4 (1 + 3)
>  - jh7110   : goes from 1 entry to 9 (1 + 8)
>  - yt6801   : goes from 1 entry to hum, 1 entry (no extra addresses)
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai

