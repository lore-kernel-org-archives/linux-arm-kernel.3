Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3461CC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 14:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwP3iiHUdo3WYIE4U/rmzHQQI8mgTeHIwy9gC0VsJR8=; b=4JNr13sqtebusKOiaCkfDw+NP3
	xLuHjo7O+RI2hEmpRykwXDzkXNAvTLSrDA2+d+quSpcIfd6o+pC7Vfee3CWWeCIouvk01ncUE3Udv
	lJbNY2fUthqQz3oPzEHl2ZiPnMO6UalSh8i9hTJi9jgn3VeyAOu9aqsuRcO0vK0VaCp0+XbPODZmO
	J25sflqjPyxRiFlizLEHR29FXVE8wk360dFcHzL3M2/iZ1e44xh0psXvxrz3vK5KrnAtJZWWpjjQM
	iKlmAPWsvE3Oyeutn5LTnItLYeUpIoaSvnM1SmqBCxzzOYXhCsCWUXfV3MggCwyaaXgoCTblyjsKJ
	OvkeWfdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqYOd-0000000EQEC-0Fcv;
	Fri, 07 Mar 2025 14:09:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqYN0-0000000EPyX-3mij
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 14:08:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=FwP3iiHUdo3WYIE4U/rmzHQQI8mgTeHIwy9gC0VsJR8=; b=ctpK6XhV3YMg2AEEUobFxoscTG
	YP19Rj4sKMPdFZfgy8tpLZu1OL44A4HNGkT5Vm9gZ0BrSkz8Yz7YKtnCGoSImfRhgbBI/uo8EKfC3
	FMMnUw4vDkJMpi1ATncwZI7z94sAFsR4Ga21vb52k9IrFdmJKHrOOCLy89O6Xfq5ogTE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tqYMu-0039mE-Io; Fri, 07 Mar 2025 15:08:04 +0100
Date: Fri, 7 Mar 2025 15:08:04 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: remove write-only priv->speed
Message-ID: <eef38dd5-63f6-4771-bf43-a55ba3ce98e0@lunn.ch>
References: <E1tqLJJ-005aQm-Mv@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tqLJJ-005aQm-Mv@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_060810_941862_2842C933 
X-CRM114-Status: UNSURE (   6.72  )
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

On Fri, Mar 07, 2025 at 12:11:29AM +0000, Russell King (Oracle) wrote:
> priv->speed is only ever written to in two locations, but never
> read. Therefore, it serves no useful purpose. Remove this unnecessary
> struct member.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

