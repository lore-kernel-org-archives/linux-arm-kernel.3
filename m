Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC7AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 17:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGCnFlH8pbxIAGdz6IAVkgSGQui0ocCTD+X7bmrRdFA=; b=oM4b4NfBwV2H+S91XgMFpz5dQI
	MJH2t0SBdbKZ3iydLY1oVoBp/CSshdD590+1bhI0qHx2qHLcW2HJswNa5M0c3mkXWXlcQ2Kpvwkuo
	/5UOEYFxxN/SLdIXJtiztjZe/pPf9dkozBQAoVihXtpeFllMnuF4ZdZpZP7NAh3qiops/hxFFRbHm
	iJ2Hdg4F1PSqRw4plfUjEQ5Bi/DWSgZ41xw6FQ1xGdN0kZCpq/0Gyti8TamFC3xr7cYayrPdLduZO
	we0RuMHxWUKcHRlS+/EjMWUtqs7Ikw0BRIOq4DSEk5soX91kHj8XEy6JzFbCWQsXZpo2Q0ajj9rp8
	wfUMylxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqWw-000000023ol-4BEB;
	Mon, 06 Jan 2025 17:04:42 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqVL-000000023b6-0YbC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 17:03:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=LGCnFlH8pbxIAGdz6IAVkgSGQui0ocCTD+X7bmrRdFA=; b=rvacBcgp3SHY7omBg26TDsGvpT
	bAyI6uQu/tRRL5YNrJMAyTClVw7j5FKNINiPvIIOLpAbHcnWrZ99StHqzYeQJw4/BbjBjeqLyQrzR
	PUifrZaSskOuyMuq2QOrgXgicNIWFYPkA5cuXsloa5ZChfgXOGohgxT7nrK0uRW0Q1aw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tUqVD-001wIc-LP; Mon, 06 Jan 2025 18:02:55 +0100
Date: Mon, 6 Jan 2025 18:02:55 +0100
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
Subject: Re: [PATCH net-next v2 10/17] net: stmmac: remove priv->eee_tw_timer
Message-ID: <463c0ebc-629c-4597-947e-57cab60fc45a@lunn.ch>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmAo-007VXb-Pg@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tUmAo-007VXb-Pg@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_090303_167164_625E2CF6 
X-CRM114-Status: UNSURE (   8.11  )
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

On Mon, Jan 06, 2025 at 12:25:34PM +0000, Russell King (Oracle) wrote:
> priv->eee_tw_timer is only assigned during initialisation to a
> constant value (STMMAC_DEFAULT_TWT_LS) and then never changed.
> 
> Remove priv->eee_tw_timer, and instead use STMMAC_DEFAULT_TWT_LS
> for both uses in stmmac_eee_init().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

