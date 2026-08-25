Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23728C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 11:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/oy9nzDrB7Hrtgy0TezRLVnTArl0Q/7EwuhK+CZDUE=; b=Z2h2hHY0oRpdyx5vyfZHdEirc8
	F6NO3jJ/VRF31wPqywCG7zTnylX6Q0Gbn7xEz37bFi4jyi+sj7daiHWzJfWaKYUFDkyaoq5XLGbbj
	Yh+hQQcIrVwzVK/1+n1z1GSYgtPQIPoIS7yD46fK27yttYuIKyYk3WVrgy1bBXKK+vKBVa9q6mE53
	wu+DTNaN0euGzUKBBAjnwt2SQ+T8ek5Dz2ibxwM2Kn2pZci3b8r5KD1I0bieFmqvtKd6khdkap4an
	1LO9nTraiuUfeJfKIIs8y7T86YF8V+5gccE+MHNeHpULhDreLAu0i42E8k+bUvNqrrbNA1ejrPLtM
	xsdFnUgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wypid-00000000iZC-21Rq;
	Tue, 25 Aug 2026 11:53:31 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wypia-00000000iYg-0Zdc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 11:53:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A26974E412F2;
	Tue, 25 Aug 2026 11:53:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 671DA604C4;
	Tue, 25 Aug 2026 11:53:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0718D11C79245;
	Tue, 25 Aug 2026 13:53:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787658797; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Y/oy9nzDrB7Hrtgy0TezRLVnTArl0Q/7EwuhK+CZDUE=;
	b=Lupia5lqrNdCEUgOHvh30PPbqWGwVkSPvGa6VHkkbajgyqpaDApj+l+16rCBiqtHjXOV/V
	EJwUrLI3jFzygz9VvXHnnzFrFmx6BZNR1IogaFT7nZwdb9/Ckati2A09dK/xlGV+H1bFqO
	xnT0AYg91napfNXs1jMnGG02+qHWzpl0iBReKHS2uWmlSggdcPVcVt8XV+CtNXgejaUx5S
	ucuXuW1nBy2tQvmMyOdx7mNSxAoCmpQopwyBUJKCNEj966sSLSkcVWe5cZt2joykB4wPT1
	ANYnj+QJezNG1RGedRACv7Er10u/V3khDQUyM/FolkaJzWmr5dOfvJNEQimShg==
Message-ID: <64f97732-6451-47d7-b517-922961b50071@bootlin.com>
Date: Tue, 25 Aug 2026 13:53:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: selftests: Pass the IP proto mask in the
 TC selftest
To: Paolo Abeni <pabeni@redhat.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux@armlinux.org.uk, hkallweit1@gmail.com,
 alexis.lothore@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 muhammad.nazim.amirul.nazle.asmade@altera.com
References: <20260822153245.423259-1-maxime.chevallier@bootlin.com>
 <20260825075145.34118-1-pabeni@redhat.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260825075145.34118-1-pabeni@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_045328_325460_AC8D6D2C 
X-CRM114-Status: UNSURE (   5.97  )
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

Hi,

On 8/25/26 09:51, Paolo Abeni wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at: https://netdev-ai.bots.linux.dev/sashiko/

> Would zero-initializing
> both structs ("= { }", as attr already does in the same function), and
> setting keys.bkey.n_proto = htons(ETH_P_IP) together with
> masks.bmask.n_proto = ETHER_TYPE_FULL_MASK given the injected frames are
> IPv4, make the result independent of the stack contents?

Is surely doesn't hurt to explicitely initialize these fields, will do in
V2.

Maxime

