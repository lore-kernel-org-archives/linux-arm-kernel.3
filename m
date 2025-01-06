Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247ACE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 16:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGk3XnDVBBgGI23iHvUxp5yLbTGC9ExrtL/00GwpF7Y=; b=XVAQQAvXgTsqUJiDaxJdDEwAzF
	7mLwxZvBixS+HHhG5BJ6tyRIkAIN18SKoyoOQpm2am+sJYD7B29AblDaN0Yys31hAIsONmGDxiQ20
	dp+TfjaxqHXlBBVo09OYU8Bw89+9Nbr+0/nXg/AMGbH5yPXqkmSRWCJFaG7bL75/Wt1ZtIChzPK3g
	z6zHjKra6GOmd6l7yeJLUtFRQ6L1rkt4dwgmKQYYnGDVPRl4hmjiUXszmC1Fx3i4MUKUlK+DzU52m
	UCJylQJgy56wAtBkXmqavDy/bRM2oyTUhCRg+xMBraLkXCN79rUMgV5AlKds9HWjI2HK0DFv0aI/l
	gUws/Rvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqOR-000000022WH-0rYT;
	Mon, 06 Jan 2025 16:55:55 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqKU-000000021GO-2wtA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 16:51:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=EGk3XnDVBBgGI23iHvUxp5yLbTGC9ExrtL/00GwpF7Y=; b=uEGv49UAPICl7wgeWt00F/clnm
	KEFPnPsFwc4v48nHmw4rNqYeJ7CVdSXL975hV9MSdyr7zKaeulHvjTgN42bfExye1fdpuigqF8SDJ
	WoZ3OM5sDmjoO/DwnQzBbL/JQSuIpSX2H4lEr7NTNzW3j38/LHX5ptfe5DpObV5BzIKI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tUqKM-001w3I-Pl; Mon, 06 Jan 2025 17:51:42 +0100
Date: Mon, 6 Jan 2025 17:51:42 +0100
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
Subject: Re: [PATCH net-next v2 08/17] net: stmmac: report EEE error
 statistics if EEE is supported
Message-ID: <a72bd3d3-9cfe-4f25-a9e8-c6dccaf21a15@lunn.ch>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmAe-007VXP-Hm@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tUmAe-007VXP-Hm@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_085150_738617_BFE0ED77 
X-CRM114-Status: UNSURE (   9.83  )
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

On Mon, Jan 06, 2025 at 12:25:24PM +0000, Russell King (Oracle) wrote:
> Report the number of EEE error statistics in the xstats even when EEE
> is not enabled in hardware, but is supported. The PHY maintains this
> counter even when EEE is not enabled.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

