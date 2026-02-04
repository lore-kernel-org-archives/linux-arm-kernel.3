Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC673EA7947
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 19:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dt3Z/Cgo0Nl3MpY57b0JubP2dxKNjWvqAO/32zYPcho=; b=omyMGsPVGAYpBQOorc8PbwyOib
	cEeTz32ZLqbFGH1d0vqgnetIPn5aJo7Wie4i8wm8kIiAru0kJgWwPOHz8TlttFWD9KdWg4CcBEPlE
	up5ZsBk9WqHhzpyYHQmWMfoPQ8vwpqce6sJgqVQKwGazFtVGIFsqYql7GtwMoIXWfDRaKPwEkyP3b
	h5YGOYXZSQTpsrJmZgXcf54C8DI38HLUxl7QhzRDocF1AsC7WNTLHdmT0KoT9DlzQ0wGTeYCLEHFG
	0EXukHevrJK5B7KRBFkk5HKR1Mq7QsZ9TQA0B61arTG+BjEgmdB1oFWlXypeXJoW0XqG4UDQ6R8p3
	Maj/ue6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnj1C-000000090Og-1NIL;
	Wed, 04 Feb 2026 19:58:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnj19-000000090Nx-2Tcg;
	Wed, 04 Feb 2026 19:58:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=dt3Z/Cgo0Nl3MpY57b0JubP2dxKNjWvqAO/32zYPcho=; b=U7bu5OUniqo6Olu36IlqocMsH+
	262O4zregLAcmwC6jveuusa2Sc8guXWhDH8ABrJctf3y7GAfRJCxxbghqzBQENbXev8sms9d0t5kG
	Cnlxo7V8hE/KFlAhN13b70IQ+wP5H08DYcN8UNXGiINPhJK7mHlKgLQref/mYUAKKca+dCkwLzgAI
	5bvsB4emNIkMJjpF66WesCuWhU/HYV41NDr5oufKN+RcfTdQjPj1E8wRPTqcHULOl4USJmN1L+9jI
	PrbfS4kax2fHuEhMdkSPeTQgShNLgYJzSyAzMlWWmQCtKzDgscEwjWJHPUNKOcc7okFqe4pwAZsqQ
	6D7Oasow==;
Received: from i53875ac7.versanet.de ([83.135.90.199] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vnj12-0070vf-PN; Wed, 04 Feb 2026 20:58:21 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andrew Lunn <andrew@lunn.ch>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 2/6] net: stmmac: rk: replace empty set_to_rmii() with
 supports_rmii
Date: Wed, 04 Feb 2026 20:58:20 +0100
Message-ID: <10482755.VV5PYv0bhD@diego>
In-Reply-To: <E1vnYxq-00000007hor-3yXt@rmk-PC.armlinux.org.uk>
References: <aYMN2gZMfLPKuukG@shell.armlinux.org.uk>
 <E1vnYxq-00000007hor-3yXt@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_115827_624213_3F1B1D9B 
X-CRM114-Status: UNSURE (   8.51  )
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

Am Mittwoch, 4. Februar 2026, 10:14:22 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Russell King (Oracle):
> Rather than providing a now-empty set_to_rmii() method to indicate
> that RMII is supported, switch to setting ops->supports_rmii instead.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de> #px30,rk3328,rk3568,rk3588




