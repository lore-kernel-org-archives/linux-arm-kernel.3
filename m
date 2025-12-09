Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D00D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 11:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DwKdmCUbXETjxy9fokPP+UnDSthHBd6FAyICBa61gQE=; b=FbYAV5pQn2OhuUAsRBZ/KY85iY
	09B6xTIPfnl7NohEIH7e9b9EKG3o1k33/tWjXUGeYEccxYNVtlmhDJ60ulgR+Pw4sKWivW6RXe7oP
	Su5ggqftXGgVJM0ygI028tB8gn5qzXRXWv4zeqyBpRQ/ZXZEcB8Fn7yChwvcrYampTGK7EIbihup9
	EPgaqAxs+I+XHjJQkblTXPv4+SJYVZ0Xe4v8zwkoq8EAn50lSSM+xmll6SF5JBiK860IK/secyyAl
	rhnoABSMd2/4Km4H4mtKHgADDHfFRSUlUJ8+kmBq1qxsR2ux3QVjxyfID+Isg2ifZGEueFpp53pim
	0IaBGujQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvtM-0000000EBVE-3CPG;
	Tue, 09 Dec 2025 11:28:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvtJ-0000000EBUl-3mEX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 11:28:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DwKdmCUbXETjxy9fokPP+UnDSthHBd6FAyICBa61gQE=; b=D9rFHetJk7ay/DXTWcogtOMRUt
	jy1aVrj+NO6xKIk/M8evsvfydfIZJbYw5Ui+Ujn56/7VBa305YJ9I7tF7Rtd+9Yr1dniHavtI1T+J
	sWcFLnp2VymQ0Ze+CS0nFMDv67CRoP0GIL2q0izyU6yk6GwFYSXMqyF4PZKzrdEhZKKIL+fM1Tcmf
	uajhTlqMaBxi6tMsohBHsXEkWI+D7+HWVpXqc9TaX4mZpY71tyG6ualnvhbg9oEo2Vfl8NS4fcZdk
	4zdhlgTxaqpZXtjYRbmfefhLWrvcEjUh+WsNaxL2SLa5xXbs3D7yZYrmRUqclUH7fNT8haY2vupJ6
	GFS6nqQw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34968)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vSvsw-000000000Nz-0ADF;
	Tue, 09 Dec 2025 11:28:02 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vSvsr-000000005xz-34kQ;
	Tue, 09 Dec 2025 11:27:57 +0000
Date: Tue, 9 Dec 2025 11:27:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Potin Lai <potin.lai@quantatw.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: mdio: aspeed: add dummy read to avoid
 read-after-write issue
Message-ID: <aTgHva-UVEPl9EAR@shell.armlinux.org.uk>
References: <20251209-aspeed_mdio_add_dummy_read-v2-1-5f6061641989@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209-aspeed_mdio_add_dummy_read-v2-1-5f6061641989@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_032826_211122_C6C65032 
X-CRM114-Status: GOOD (  11.09  )
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

On Tue, Dec 09, 2025 at 07:15:31PM +0800, Jacky Chou wrote:
> +	/* Workaround for read-after-write issue.
> +	 * The controller may return stale data if a read follows immediately
> +	 * after a write. A dummy read forces the hardware to update its
> +	 * internal state, ensuring that the next real read returns correct data.
> +	 */
> +	(void)ioread32(ctx->base + ASPEED_MDIO_CTRL);

What purpose does this cast to void achieve in an already void context?

We have plenty of functions that get called in the kernel that return a
value which the caller ignores, never assigning to a variable, none of
these warn.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

