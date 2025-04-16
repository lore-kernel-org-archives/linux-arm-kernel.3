Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A4CC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 12:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLeqxcCuX3BoT7U+FhDZa/UKFjGcWR5LVHuvgMXj9MA=; b=GMYPSyd+I+PpCLVXakBQozWOpS
	TrkaI9a5PkFPpkflccEUpll+TTOzRixpRW53BcCuOimtRTPKuCOLiHQNwtTyEDcnCSoK43tArTRPd
	OBgDie2+TfE9a5gDMUSeUB3cLEBF+qSahFsRo41jUo/7+aSIl7v4m1ntikzoEcdfY3Renr4hXkDx0
	rlsyxvBktfdFc42A62NTARzhBP42+mhjZvDnj5Bw7jjARjkwCenKMJvqXdwl0ZTVXNoDZX/Ov4svL
	60kcO2N2kCrpUypCJh56sZRWGr5OCSUMnJSzx7OsmRWgi0ZHPa46J1v61bOtDWcW75ZNrloI1Wkxh
	PsULMFJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51yh-00000009X8T-2jmJ;
	Wed, 16 Apr 2025 12:34:55 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51sQ-00000009Vv2-0IFL;
	Wed, 16 Apr 2025 12:28:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MLeqxcCuX3BoT7U+FhDZa/UKFjGcWR5LVHuvgMXj9MA=; b=iqLfqMOPWoffq199Gd/V5c66wg
	CBrB0Kj4NnLc4sKIpIgvttRQfduIi4E9m4MKJjBijUcIl6btI73w5wN8VacxCEkuOvYI1c7JgEVMx
	S6Umj5FJcBENd8Y5GmjAUnLN7m85/3sIlyEv8qKq4B+MOi6xcwiX4dXew97/tZpNq0eU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u51sK-009cLA-2K; Wed, 16 Apr 2025 14:28:20 +0200
Date: Wed, 16 Apr 2025 14:28:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: mediatek: stop initialising
 plat->mac_interface
Message-ID: <c952e3ac-58d2-4913-a006-c8e9215e9d2e@lunn.ch>
References: <E1u4zyh-000xVE-PG@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u4zyh-000xVE-PG@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_052826_106189_0A9885FF 
X-CRM114-Status: UNSURE (   7.18  )
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

On Wed, Apr 16, 2025 at 11:26:47AM +0100, Russell King (Oracle) wrote:
> Mediatek doesn't make use of mac_interface, and none of the in-tree
> DT files use the mac-mode property. Therefore, mac_interface already
> follows phy_interface. Remove this unnecessary assignment.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

