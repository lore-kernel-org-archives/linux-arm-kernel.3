Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F8CCA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 20:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/u5AQIai1HRb95AsGPoewpc6br1Ojaok+gPX0CM2nPk=; b=dwSgxIIe6YjFNr8fVe9fGRPByG
	acgNfwKNspPP/KINIpjuukO4pG0WGV55bLG/2Zk/u8cf+3iuRC6DletYyqoGzdMI2YAlDG91jkrVz
	X4qlToK2oGrRF4IGvuhaeHSxDVzQ0yxi8jlUxfHY81SaOKd4Wo0I+ZdEMj8Hakhh3tJWTvfoVdcfr
	dlrWXxDdNV9omxjRpgv4nRRbl8cPhk51Lj2x1Fd1M0BMG2vQbGLXFpBgFgawieHnkNX96KMcXKXN1
	3Oxlqkjwww6detlN1X40nX+rtVYdBC/yv2hNrJixVUcLDnj8KdwSZr7taPDdOqBzX1zdAhzQ2ghOC
	9RAqjx+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uviTT-00000002BuQ-2l43;
	Mon, 08 Sep 2025 20:28:27 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvf1m-00000000r8g-3wxW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 16:47:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/u5AQIai1HRb95AsGPoewpc6br1Ojaok+gPX0CM2nPk=; b=XDx42iKzbJgFG3SaKLMOrBIAxg
	tF3l44SeFJoymz52z7ZeoAUiGqJ/PHjQ5zGYCfDA+3ESGhX+X7TPT0Q0HWVmhZxE0/RHYe9RRoWvk
	txvOed+HKGL1WO2knB5FIYLdzGzAmTAPg0Fa31UH0Cu8yqTMyvTWjtmM39hXUw7hTgbc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uvf1a-007gqz-2I; Mon, 08 Sep 2025 18:47:26 +0200
Date: Mon, 8 Sep 2025 18:47:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: prevent division by 0 in
 stmmac_init_tstamp_counter()
Message-ID: <c3183a23-21da-435d-b599-7003ae7ba79b@lunn.ch>
References: <58116e65-1bca-4d87-b165-78989e1aa195@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58116e65-1bca-4d87-b165-78989e1aa195@omp.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_094738_977320_17C13567 
X-CRM114-Status: GOOD (  15.01  )
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

On Fri, Sep 05, 2025 at 07:06:50PM +0300, Sergey Shtylyov wrote:
> In stmmac_init_tstamp_counter(), the sec_inc variable is initialized to 0,
> and if stmmac_config_sub_second_increment() fails to set it to some non-0
> value, the following div_u64() call would cause a kernel oops (because of
> the divide error exception).  Let's check sec_inc for 0 before dividing by
> it and just return -EINVAL if so...
> 
> Found by Linux Verification Center (linuxtesting.org) with the Svace static
> analysis tool.
> 
> Fixes: df103170854e ("net: stmmac: Avoid sometimes uninitialized Clang warnings")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---
> The patch is against the master branch of Linus Torvalds' linux.git repo.

Wrong tree. Please see:

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

This also needs reviewing by somebody who know the STMMAC
hardware. There is a comment:

	/* For GMAC3.x, 4.x versions, in "fine adjustement mode" set sub-second
	 * increment to twice the number of nanoseconds of a clock cycle.
	 * The calculation of the default_addend value by the caller will set it
	 * to mid-range = 2^31 when the remainder of this division is zero,
	 * which will make the accumulator overflow once every 2 ptp_clock
	 * cycles, adding twice the number of nanoseconds of a clock cycle :
	 * 2000000000ULL / ptp_clock.

So i'm wondering if the subsecond adjustment is sufficient, the
sec_inc might be zero, and rather than returning an error, the
hardware just needs programming differently?

    Andrew

---
pw-bot: cr

