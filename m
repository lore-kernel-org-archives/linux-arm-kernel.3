Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4C4C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 21:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9HlBoO1uVo+EoWEjV74MOdLnBJFasfD8Z72q+y3gtk=; b=QVcRwWHLhRkosutMd2gG9v9r9Y
	X+OtVb4FhdOdz4GiCIPu8fR2FH3FPIVCRBIB0+3AHLjOTjo9lhtr0U7ypqKmITeHvIzstVkqfPHb+
	BDyLqULDrr8MaUjafaXGPXViYsAa0Z6td6WM6m91t1cmThyVgfQ+OHDrwd8MPXei6wkHLzbxB37Nc
	L4P17C4KGOY14pU1C3HV7M8RgJZ+TbgqGHfGD71ZiH2f5DNVA+bdMLUSrfX79FbyXHmuF1gwxEsD/
	ltmPdtwTkqPcVvGyHShN2W+9olC7ynv3lrsrAonpSIhtqC0FOLFajq3S+TuROxO8Cts7aPBQ/HPVL
	PMAyKpOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u44Xs-000000008ig-37c0;
	Sun, 13 Apr 2025 21:07:16 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u44W0-000000008bE-1j5S
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 21:05:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=d9HlBoO1uVo+EoWEjV74MOdLnBJFasfD8Z72q+y3gtk=; b=JIyuLOWHSshda/Ut2H8eI2plkn
	Ajpn8XkWiQAWTcHGNbtINRT998Ta74wWyWPPlZVjhyFSoMSJroqzT1BZCDjNN5dbGLJLnZniDWr7Q
	dzik3j40YEwG3/BD2YpQv4dNh55EOetRp2+WlgV5tLn6/ckeetQzA4hEu+AovLCoYtVA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u44Vs-0096Fm-76; Sun, 13 Apr 2025 23:05:12 +0200
Date: Sun, 13 Apr 2025 23:05:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 1/4] net: stmmac: qcom-ethqos: set serdes speed
 using serdes_speed
Message-ID: <d50d1c98-6077-4c92-a3d3-7c3cb9cab0c8@lunn.ch>
References: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
 <E1u3bYL-000EcE-5c@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u3bYL-000EcE-5c@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_140520_463940_B3E9035F 
X-CRM114-Status: UNSURE (   8.48  )
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

On Sat, Apr 12, 2025 at 03:09:49PM +0100, Russell King (Oracle) wrote:
> ethqos->serdes_speed represents the current speed the serdes was
> configured for, which should be the same as ethqos->speed. Since we
> wish to remove ethqos->speed to simplify the code, switch to using the
> serdes_speed instead.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

