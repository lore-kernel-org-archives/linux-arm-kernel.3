Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B06FCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pe520I3fJpcCDB2BSMD7MFtkbrDxlO8z2NM7U0NQgc=; b=ro+gP3yRiRAudKjf8900GSspDQ
	p/hbR8RN2Je/ohbmCqKxECJW0i4JEjP4E6DMDWviji6ZxtSO91GARP6KQH2ptMbfN9sk9Kh3sBtX4
	UeCqstT4oSOQThYwe+0y0+vx7avtkzJXf9XxIn4Gr8YddZCDmawV6g3FRLo7rdqvb70VxUa/WlJqS
	jGf75qrfR1oLNJj2xBP/ZsRzDM830GTu59eLo7Z+EU4IgPp6J5JDcxTzeLkTUHomVD4PBjAp3B535
	zRVO4hKhgaudTw5msUV8MBXib6L/BsCYCIJ6vXIsP6ri7Yud0lTFfpW/5H1+7CLw8QDdv0tY4V4Fg
	c1xoolcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCekx-0000000Bprp-0n3l;
	Fri, 02 Oct 2026 15:01:03 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeku-0000000BpqY-0TlT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:01:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A79EA0579;
	Fri,  2 Oct 2026 17:00:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1790953257; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2pe520I3fJpcCDB2BSMD7MFtkbrDxlO8z2NM7U0NQgc=;
	b=EI6gatAeiC9jn8YoczEoSUdTmne50bONHSexQ7wuVczWqOMVwJ3zkYVcMWIyXh+vhpE0Yf
	/6bPSvkH8/9z/IgJj1+PUrP+Rp4u+a4log6u+VcS1UrGnwr2MbsSNdcArGJyvmnZBIAwaQ
	87cVEXqZ3kdwVaTSJ3Y7/4Ak2U0o7aeJR1jDERPLbJZBuqpEwe3HIN7caprsNZijPN4GVa
	Fg9g/W7akfgz0okS42rxdqWQcbcloT9gxP6wSFdP6bouyVHhZBGJHMJZsx26qljkE4i0zF
	YWxIsXSyyx9b39oEkH9CPAmmQfN1zuh4JT4Jk7b8hZlZIN0EhbOL34iI9R4+lg==
MIME-Version: 1.0
Date: Fri, 02 Oct 2026 17:00:56 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, Jitendra Vegiraju
 <jitendra.vegiraju@broadcom.com>, thomas.petazzoni@bootlin.com,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Peter Robinson
 <pbrobinson@gmail.com>, Joe Damato <joe@dama.to>
Subject: Re: [PATCH net-next v3 3/3] net: stmmac: Don't set or get RSS
 parameters when not supported
In-Reply-To: <20261002142806.1299041-4-maxime.chevallier@bootlin.com>
References: <20261002142806.1299041-1-maxime.chevallier@bootlin.com>
 <20261002142806.1299041-4-maxime.chevallier@bootlin.com>
Message-ID: <f009c8c1e2d095bbdce139d5877d300f@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_080100_643364_68B3F1A2 
X-CRM114-Status: UNSURE (   8.54  )
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

On 2.10.2026 16:28, Maxime Chevallier wrote:
> The RSS kselftests fail on stmmac, and this is partly due to the driver
> reporting bogus data for the RSS ops :
> 
>  - ethtool -x reports an indirection table and a key while the hardware
>    doesn't have any of that
>  - ethtool -X fails with -EINVAL.
> 
> Return a 0 indir size and key size when rss isn't supported, 
> effectively
> meaning we don't support RSS here.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai

