Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A92C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 21:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KUmT5HMoGiak2FyyfKrfZlJKbyNJNTNogw0QxKEjjE=; b=Qmu2bqpQqlVURiDagnmOEQ6o/+
	IWfRedLRs0b1+0aAQHMOwAyjs1ORvD1CXiHxETQrw/NbTLTynMi7taEXLeQUyPfcsu8Nf/1Kq5lq1
	0Fs5Bz1BjbWNEaUzczfoQXAF4w5iPmegIapsi2JRiTLwNO5rCagZXFBPIwYdi8Qyh9owwaeq1SRUD
	K2XbmJXkLzI4nYgF9GkH+oQXG1/i06Gds+HU0YPv7POY30A2P6XYcZwmdVcE9gxiG1oN9/IHdByO2
	4pENisvaTgLSFuQo8jmUZDOLvJQbVTanC9wgSFSjD2842gOMhE2BftR0Hso8WlaQn65x69Tcpgt3K
	07yLIalg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcWI9-00000003GMw-2gPs;
	Mon, 27 Jan 2025 21:05:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcWGn-00000003GFT-2BxN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 21:03:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D6555C5959;
	Mon, 27 Jan 2025 21:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6DFFC4CED2;
	Mon, 27 Jan 2025 21:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738011824;
	bh=WVG1MPhd1HOw3Gt5nUM041Hsql8yO2/kRnMQw0w2s+g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pkaE2m9IYX3BiHqcBoFLWU4//r7Wjk8TGvMJ92/b51qrSj02gFTXn+H1tmtfaCvON
	 az4e9drcle1/kXlP4KKGiG5Da4zjh0KxAhxn1HPEMdDv78oVpa4Bb9HqeOj+bpQDBM
	 C7AiBzDupLGTGePtkfanyUrmCKEJKjvXPoeZkAvkqQ5h/rsoZ1VG/jmvGCioT4znJ1
	 bKrkqoumWFBJ7OB03jR3gR9o+xIl6yTR4okl/ToDpwfzfsKisKRiLYSPTfqaIiJyT3
	 QdLw1u0nzKqxNdLF15EMevuQTiIRRTOk55tN6lk9a7w4OXXoosUVEPFGtR7EOZRn58
	 LJywnw+L9rMaw==
Date: Mon, 27 Jan 2025 13:03:42 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, "Russell King (Oracle)"
 <linux@armlinux.org.uk>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 0/3] net: stmmac: Fix usage of maximum queue number
 macros
Message-ID: <20250127130342.4e5d1f9e@kernel.org>
In-Reply-To: <CAAhV-H73FNTzhjwkZwO4RAZFF1Ri6EzpJL3jnWW4rPRFZQRZZA@mail.gmail.com>
References: <20250127092450.2945611-1-hayashi.kunihiko@socionext.com>
	<Z5dXJ1EIUx8DAh6J@shell.armlinux.org.uk>
	<CAAhV-H78fbK+jAsootOaZW=eQ3RPna3VQTxHd33vDSueYkyYtA@mail.gmail.com>
	<f1912a83-0840-4e82-9a60-9a59f1657694@lunn.ch>
	<CAAhV-H73FNTzhjwkZwO4RAZFF1Ri6EzpJL3jnWW4rPRFZQRZZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_130345_612691_EC44B327 
X-CRM114-Status: GOOD (  14.13  )
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

On Mon, 27 Jan 2025 21:47:29 +0800 Huacai Chen wrote:
> > There is another aspect to this. We are adding warnings saying that
> > the device tree blob is broken. That should encourage users to upgrade
> > their device tree blob. But most won't find any newer version. If this
> > goes into net-next, the roll out will be a lot slower, developers on
> > the leading edge will find the DT issue and submit a DT patch. By the
> > time this is in a distro kernel, maybe most of the DT issues will
> > already be fixed?  
> Goto net or goto net-next are both fine to me, I just think this
> series should be backported to stable branches. There are lots of
> patches backported even though they are less important than this
> series (maybe not in the network subsystem).

Please remove the Fixes tags when reposting.
-- 
pw-bot: defer

