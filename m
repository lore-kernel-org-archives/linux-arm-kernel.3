Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C1BC021A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hw1hJQCbl8Z4ry3SD9KqSPmH+QbC3B7QYj7POJLYcWI=; b=gnHWdngbdkRjTPH5ctz7tf/u6l
	3Cn2asybq2HB7xGguk01U4kvZlw9XYE4qxfFBnFGH37pbUtMn9/ptHs47idm01gaSFsHgzRzbbi/U
	YOkIOFAMYWP6FhlKq5/SXJZJeu42ER8Q7CYaue5m//IESdXjPuB+o+g3A8sGUYtZf3MmLnPS8abDR
	zGfsspAKkuDDJ4DAqfA4D6QFoS2UqEggbr9MgUIcn9DZd+oWlfTdPsQcTMGp/HwSDGtulG7LWjjB8
	K446wCSv2JJkpws2HcfJ2njSkUAgBo6If4AwDJn2ZetLevqo6YeQ6Vytw4PPDw5HIO5W3wPuwfyWA
	b5KXEstA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyke-00000004AjE-3r03;
	Mon, 17 Feb 2025 10:53:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjy2v-000000043OP-45Ui;
	Mon, 17 Feb 2025 10:08:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Hw1hJQCbl8Z4ry3SD9KqSPmH+QbC3B7QYj7POJLYcWI=; b=DOf0OuFbIVh5MtbmOHngba6QPq
	5YEy2aTZMacwyGrR4qAwdfFeVd+EUNPBsQNMO3kJybjmunT3URm1zZfqyZcnh951R+YASaSQTA0NZ
	wQAfMwm+mwM+846S4drYIDbXmUqTawnjZ/rtgXW7s1cPIly0BzdvkrU65Tok3bZty2jG9/v8+GGFI
	D5v4ZrbAD7u74k/ieqMdLLo+4umR/oHCwamvY19vm5c9+Q4LIfnFUVtK70bTJstZqg/NqpRjoSXOn
	Xp2sI9NkzMIsbtr/Be7lB4XUXHNeYbGeUaQtYFkXrRHvzcjbGDfDZTfzn4XUnc62ssFFBHB9FWKRO
	0XnCe6CA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41180)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tjy2e-00067U-2a;
	Mon, 17 Feb 2025 10:07:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tjy2a-00067e-1i;
	Mon, 17 Feb 2025 10:07:52 +0000
Date: Mon, 17 Feb 2025 10:07:52 +0000
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
Subject: Re: [PATCH net-next v4] net: ethernet: mediatek: add EEE support
Message-ID: <Z7MKeEKOzmA5JEjU@shell.armlinux.org.uk>
References: <20250217094022.1065436-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217094022.1065436-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_020814_008714_56FE2105 
X-CRM114-Status: UNSURE (   8.68  )
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

On Mon, Feb 17, 2025 at 05:40:21PM +0800, Qingfang Deng wrote:
> Add EEE support to MediaTek SoC Ethernet. The register fields are
> similar to the ones in MT7531, except that the LPI threshold is in
> milliseconds.
> 
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>

Thanks for reworking this.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

