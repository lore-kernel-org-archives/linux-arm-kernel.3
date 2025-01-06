Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFDCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 17:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uR83ZQY2JorQdRsksaSEreSd1nBld6M8x11g1V8kzYc=; b=o3JM5haBKno03AG5DIF9bzHktn
	ECZGozETbddecxvU8YndJJ8+KUdJUhlzph1fP46D55hZgNiif9HWHQpCYmGM+f/VCcS6yB/ST83tu
	8e1vfOZc9uV3b7pRw15Ae+PD8KGZHgxqvPs5ghEubTK2a+gGXLPlmvPmpc6XsqhlLt5R5SQXh7x8+
	viXF62jxy1hEtx9ZDZWxOwdtEuPtXIhc/xiDF0Zq3ZPAFeycqYRgQSqMblzdJJyM2E8qCAPzXfWmX
	kgZl62e2+/hQrkk45363LrwxwGgNeZIfr2idAc+l62Fl/JpxaZHDMM/zk81w8tV+yaljJu1VkY0cM
	pKsUGibQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqf0-000000024xf-36Pb;
	Mon, 06 Jan 2025 17:13:02 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqaS-000000024Qe-3POM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 17:08:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uR83ZQY2JorQdRsksaSEreSd1nBld6M8x11g1V8kzYc=; b=J3/Z2c2kzweO/0Ytn4k/MBs3Nw
	HS5oFmINvDhYCKt+644a289nHAVJl5bRdWMVtSqAEjB3xIXWvUnVMaBDRhKFodwziblGQ3gAJ4cCt
	S7LXBRe3ZPJcKyFTV+IYHszk6T2J7VGOOWSW0x/86p6zrqoCagwibNUTtiMNOAtQntdM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tUqaL-001wTU-Fh; Mon, 06 Jan 2025 18:08:13 +0100
Date: Mon, 6 Jan 2025 18:08:13 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 17/17] net: stmmac: remove
 stmmac_lpi_entry_timer_config()
Message-ID: <60abc93e-35f9-4e99-93bf-177c9545bdcc@lunn.ch>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmBO-007VYH-Kj@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tUmBO-007VYH-Kj@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_090820_849262_A699DFB0 
X-CRM114-Status: UNSURE (   7.02  )
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

On Mon, Jan 06, 2025 at 12:26:10PM +0000, Russell King (Oracle) wrote:
> Remove stmmac_lpi_entry_timer_config(), setting priv->eee_sw_timer_en
> at the original call sites, and calling the appropriate
> stmmac_xxx_hw_lpi_timer() function. No functional change.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

