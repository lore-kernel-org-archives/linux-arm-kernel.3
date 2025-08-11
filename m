Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AC9C87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 12:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akg1VPYncJQYtJga7vyBFrDG32QQSfTrI/1dhFFl3BU=; b=s0IGxs67DxZaf8gUk/k1DpBTDN
	qdRseA82XclZe1W8ViCNqel32UQLHpSAD30kx74OlldsAKF6O3vIz3l0HPGwNks+unEnDLo0xAezE
	l3jRLMZbFKD/evNLr9mpQFzS69Ocy1408QWs3Q3ji6Wt9D63ykGxQIszPZkETBN6EjPx9pqsHA/Gy
	6L0gLMiUDSEexDB69om67ZuDtnQuX6Gwb74BdNxSl+RuTeUWp0PU3rrorDkvpdnj6hxw3RBbwDjav
	8nL/Pu68LGwH8Voj0MarVVl1inYKljVVliiuLd0fUETp0qyh25/YM+CL70UwDa4ZgDNlcC5ljuH7u
	avy3iKlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulRqI-00000007hUE-2C1M;
	Mon, 11 Aug 2025 12:41:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulRng-00000007ghV-0xD4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 12:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=akg1VPYncJQYtJga7vyBFrDG32QQSfTrI/1dhFFl3BU=; b=o4MPdHMwnmCiOadxyyWvcFCZo0
	D5kqPdZu1Dvty7VJewOzG62G1zaeIh+Z7ulAfFaKPVV9fcSfUXcJwzZ1wCe4Wl3kS1G89ImbjHAHk
	IckHFPeVP6RNr/RG2sf5Adaz4aN4oOHldJvWad0OPNG85bkfc8sJOnnoUhVZCYoQN2a8a21kdVNL+
	BXtZeoNHXFGtlQErARdOwNuNqx9ANkWt96a4IxVH+UwBByFNsME5MFjZtm12U1u7slPFJ6j4qhTNH
	OWvYevGBGT/BmP1YFAAZtZoVU7qN/r10xuuf5zhfx4jsH93FMoJClbo9o73SEoKViTksc3SfpnY6f
	Gu+DQDTA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33394)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ulRlV-0002vA-1L;
	Mon, 11 Aug 2025 13:36:37 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ulRlR-0003hh-1q;
	Mon, 11 Aug 2025 13:36:33 +0100
Date: Mon, 11 Aug 2025 13:36:33 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: make variable data a u32
Message-ID: <aJnj0e8P8ttlRf1r@shell.armlinux.org.uk>
References: <20250811111211.1646600-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811111211.1646600-1-colin.i.king@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_053852_265548_1A635065 
X-CRM114-Status: GOOD (  10.67  )
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

On Mon, Aug 11, 2025 at 12:12:11PM +0100, Colin Ian King wrote:
> Make data a u32 instead of an unsigned long, this way it is
> explicitly the same width as the operations performed on it
> and the same width as a writel store, and it cleans up sign
> extention warnings when 64 bit static analysis is performed
> on the code.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

