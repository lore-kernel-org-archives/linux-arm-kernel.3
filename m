Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540A1CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 22:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TINJvfi+w1Dn/tkBlwCk9cUaKMPh76yUWPggzDlrv+k=; b=fygiP3UdiSsqOHnryFrXpjX3BL
	Bh+mrHZw2VVJg2KCXo/mLLcM8wy2jltbsYuAwraYHVMDqL+/f0/KLG0XIXtFnkGoVYpp60wbprrUz
	vBGYw2bNoSVakxfO0UE5L9e0WMW7TyEFte5eAdwY3hG5XvTO6q2ONkXpDuETr9d6s5sS55mR93o5n
	WL6FRPSBItNb/uJyN6fDwlGb7j5w1s/D4x4/J3lqzg9hJLZRMIiSdt9rHSsHOivv56ykK3e2We+wo
	6lFFkcvL32YSbUWD4Wlc8BRyBJuW8SgD7hTjVDRybyvYbdDEVjHlEv3Dt4tiPD+3Qtd7yZLW5CwqU
	C99vRNfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEDNw-00000001R6E-2BGQ;
	Tue, 06 Oct 2026 22:11:48 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEDNt-00000001R5o-1dut
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 22:11:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B1E92A0F62;
	Wed,  7 Oct 2026 00:11:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1791324696; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TINJvfi+w1Dn/tkBlwCk9cUaKMPh76yUWPggzDlrv+k=;
	b=YV9FIN5izh5LrdM/k4F+25mHY/dLJTGAYCAicxUI2d3By7f9HYy9YudHQDEv9jdmwzJ+8i
	u0B16BU7cXeXxehUzWjxqHmOAMJU+BXJXP9V5GFHF7AflUDAYAsIGVRPzhkP5eF0J3dN2S
	9/ymPM8J5/pk8ChfEitJ6gxY4hl7ano3B0lx9dEEO8BoQvjU1xhT9n+7IyQjaSdcs7gSnx
	LuJAz3Oc6Jgdp2D07iOalCoyEoSr69MYUywHXODEBk7iXqq9KtJHiyhvPYvyTZ0BAQq2zG
	HOrb4Ju26sXixVYIIOAwuqFM5qmpWxXci21RZtiACN0gm7mbaMeeldympbSHCQ==
MIME-Version: 1.0
Date: Wed, 07 Oct 2026 00:11:32 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: James Clark <jjc@jclark.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran
 <richardcochran@gmail.com>, Miroslav Lichvar <mlichvar@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: stmmac: ptp: switch to gettimex64()
 interface
In-Reply-To: <20261006103610.98277-1-jjc@jclark.com>
References: <20261006103610.98277-1-jjc@jclark.com>
Message-ID: <d1f539343b3f3b495253f9043b899875@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_151141_589139_3CEBDEC7 
X-CRM114-Status: GOOD (  12.13  )
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

Hi James

On 6.10.2026 12:36, James Clark wrote:
> The stmmac PTP support currently implements the gettime64 callback to
> retrieve the hardware clock time. Update the implementation to provide
> the gettimex64 callback instead, adding support for the
> PTP_SYS_OFFSET_EXTENDED ioctl.
> 
> The system clock readings are taken around the read of the nanoseconds
> register in get_systime(), so get_systime() gains a 
> ptp_system_timestamp
> argument. rmb() is used to ensure proper ordering on weakly ordered
> architectures.
> 
> Assisted-by: LLM
> Signed-off-by: James Clark <jjc@jclark.com>
> ---
> Tested on a Radxa ZERO 3E (RK3566, DWMAC 4/5) running net-next.
> Width of the interval between the two system clock readings
> bracketing each PHC read (2000 calls of 25 samples each):
> 
>                                          min      median
> Before patch (PTP_SYS_OFFSET):           875 ns   1167 ns
> After patch (PTP_SYS_OFFSET_EXTENDED):   291 ns    584 ns
> 
> On this board the 24 MHz arch timer counter advances in steps of 7
> (~292 ns), so all intervals are multiples of that.

> [...]

(for the other patches you have prepared I will have a look later this 
week)

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai

