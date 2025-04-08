Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9ECC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rB/dIvd7bU6zo6n9YdzMajIzzeCmS1EwGXtnalG5tYI=; b=bLemSODuz57gJL31+scGTXnvVZ
	8yVPvOozZXXeWz4tgOrI8SeU7NQRho1JVZrfFcKaLCyNQSjIk7uxTywqN4AC285OkL45qnI7XEhwz
	9LwxD3tiklDozMsRsYlhS3Fw9UK49lKy/q+Rxw5hxNfkcW4mNVdO3sYfAM99YMhh0DySRONfBwvw5
	NzQxUF6PYfjxYNj8X0mDGbidjO9uB/4H+bTScg2LYEu7aikcRtDTcAPrjmp9/E5K6IfA/qd1bUVXZ
	JbL84ymRcCuxWcsieU35JRM4wW1GELNNHbFZF3XcJe2VdbDsRjpDIUtR+X5ISemGBDHJ7abnFycYZ
	Ie2Bp1Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2AA3-00000004REJ-2z5y;
	Tue, 08 Apr 2025 14:42:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28ch-000000044Ui-0ShA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 13:04:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rB/dIvd7bU6zo6n9YdzMajIzzeCmS1EwGXtnalG5tYI=; b=Qdnrm8BEZBNy23lYC19M1XF7Et
	Kp+5vAHIJY07hxFNlG2cyzxI82LuGlxAdpnBCSX1HCcmFT4O2k4peaJQhTQDULdEaO6iZa8YuYRla
	OJ/P5KfclV+qVRbN3/GE5+LzbjNWkeAwXt8MPqNdiJPCdno71A5qqo/rDuqQXh6GCksQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u28cc-008OFV-52; Tue, 08 Apr 2025 15:04:10 +0200
Date: Tue, 8 Apr 2025 15:04:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwc-qos: use
 stmmac_pltfr_find_clk()
Message-ID: <0f370f79-6221-48e4-a700-86fc26547f95@lunn.ch>
References: <Z_Qbw0tZ2ktgBf7c@shell.armlinux.org.uk>
 <E1u1rMv-0013ON-TJ@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u1rMv-0013ON-TJ@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_060415_144004_16D79022 
X-CRM114-Status: UNSURE (   6.06  )
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

On Mon, Apr 07, 2025 at 07:38:49PM +0100, Russell King (Oracle) wrote:
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

