Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56063C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 19:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CoouUmz+XC3EQlrGmRNSU994C1trZiX7VGKkB+/ruC0=; b=wQf14k9dqX/kXGkEweSiY9aUQV
	7MQMZTtfZ/Vc/DxdifevzWRPzz5s8gnCSdxbXNInNitignq0hFWIWUK6RMHNaw7iSSEvcUlP+jS73
	/1oNHIiEyGwpmE+JM0Z/zGf5S4IY4a8Nw6ja/umlbHWdNXf9/OjdSbFVSz574DvWVRSRxqcbUoOE4
	gOCMY0s2OdQ2zaIr4lYWDLZ507I6LwbWUMURlGLT0tM35RB0TVWejiaRvi83jLMmkC2OawFZsO4pw
	EFlK7Sm+aBDx/bJK20mugqmqGQTD4auxC0/lBsK1JC5PJXHHrbVTAGjkH0jgUPKCzGimWv83yw3yC
	Yi2oQeKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKMT0-0000000Dzi5-2T85;
	Wed, 28 May 2025 19:29:34 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKMQp-0000000DzWe-1Khx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 19:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=CoouUmz+XC3EQlrGmRNSU994C1trZiX7VGKkB+/ruC0=; b=itXftLqjzzGvQRqc8R+esdPMgF
	cTXsVm4EHLsn4IzKEgvTjlaUcQHfQrn+M9yivjSvqAhrZ2R01Uk26xcdM9074aSbwIErU4IAu7sDY
	YjSvg215Cxg2KAeWJpWXFsTwXcMs4vNaGAfgILrh1/nfzNJsVf/MLkKlclRzD6ikHSSI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uKMQN-00ECio-7r; Wed, 28 May 2025 21:26:51 +0200
Date: Wed, 28 May 2025 21:26:51 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, wens@csie.org,
	netdev@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Furong Xu <0x1207@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
Message-ID: <8306dac8-3a0e-4e79-938a-10e9ee38e325@lunn.ch>
References: <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
 <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch>
 <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
 <aDbA5l5iXNntTN6n@shell.armlinux.org.uk>
 <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
 <f915a0ca-35c9-4a95-8274-8215a9a3e8f5@lunn.ch>
 <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
 <CADvTj4qyRRCSnvvYHLvTq73P0YOjqZ=Z7kyjPMm206ezMePTpQ@mail.gmail.com>
 <aDdXRPD2NpiZMsfZ@shell.armlinux.org.uk>
 <CADvTj4pKsAYsm6pm0sgZgQ+AxriXH5_DLmF30g8rFd0FewGG6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADvTj4pKsAYsm6pm0sgZgQ+AxriXH5_DLmF30g8rFd0FewGG6w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_122719_352312_80CC6E4A 
X-CRM114-Status: UNSURE (   9.06  )
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

> I think a lot of ethernet drivers use phy_find_first() for phy scanning
> as well so it's not limited to just stmmac AFAIU.

You need to differentiate by time. It has become a lot less used in
the last decade. DT describes the PHY, so there is no need to hunt
around for it. The only real use case now a days is USB dongles, which
don't have DT, and maybe PCIe devices without ACPI support.

I suggest you give up pushing this. You have two Maintainers saying no
to this, so it is very unlikely you are going to succeed.

   Andrew

