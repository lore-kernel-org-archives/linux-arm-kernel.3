Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43D2C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 09:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lSvdFS1Tmix55ChwG42rDuM5tBqKbIBiBkAZfphft8I=; b=fLhjpzrJ/5IUuS/Hzp6cHd+JNE
	JI247UBe93/cbs11RPYocAoF33wFznkC4KAbiwZOSMQQoS3m+N11zCVrsOC3FESBqdDnH6VBzhDlM
	5Fo+HUBG6Wyo7X6EPAm952I+4PYekeKvWb/32Pw/HH0yA69gTFXD9XFgelqAa+gHflNLXV/MObsCT
	p48XBB/7AY24bsGANFvSxD55AQ56Sbtb16DGQx5u91ehI5ZLSWKxY8qH7oC2h9KnxJdJgYDoxUewB
	XSx9zhYupFtS22TVhgkHdfqLgV5mcLI0S1IsGSLeSanCHQdr7+E4x4B0I6j2tZZNh9XoX1bP9jR0g
	ejgmFWsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tghBT-0000000CdZ3-3XqQ;
	Sat, 08 Feb 2025 09:31:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tghA4-0000000CdFL-03f9;
	Sat, 08 Feb 2025 09:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lSvdFS1Tmix55ChwG42rDuM5tBqKbIBiBkAZfphft8I=; b=Qz/fNv/InGvbRTlwHZhErnacK7
	Is73Z5xtxofs9nfUqTQTVi10V0sJcJQD7OmNhryXcpLJzpI2eFGe0KqJZk70BIPUD5vSThVgtSGyb
	kuAadzjdNE1XBWlQWgjKacbRPdybnZ20FwI8n8TV4sAiPyqJ2VEVumjRatcbE+wJU+o8bAe9jnGVA
	MWneI2sxi46JEGkbJj4up5zfJItCt4lcnMfRkD+DKO8DsQ9WtLfq5RsYQJWLHWQ6EcyoFhnIQsRxS
	dMp3n1+gE/9uxSntCbrJFeiZzZLXao/EivWbidVUxQrJCBPWY+V9ldRgYMAwjjsxXoNlmzDKBVt5G
	90ncmAUg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46790)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tgh9p-0000Fa-2S;
	Sat, 08 Feb 2025 09:29:49 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tgh9l-0005ME-39;
	Sat, 08 Feb 2025 09:29:46 +0000
Date: Sat, 8 Feb 2025 09:29:45 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: ethernet: mediatek: add ethtool EEE
 callbacks
Message-ID: <Z6ckCZpOo1_rvmh6@shell.armlinux.org.uk>
References: <20250208092732.3136629-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208092732.3136629-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_013004_052729_2512EAFA 
X-CRM114-Status: UNSURE (   6.66  )
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

On Sat, Feb 08, 2025 at 05:27:32PM +0800, Qingfang Deng wrote:
> Allow users to adjust the EEE settings of an attached PHY.

Why do you need to do this? Does the MAC support EEE?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

