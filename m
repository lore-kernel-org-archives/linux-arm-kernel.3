Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B942CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 16:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=POmukRFkjYpNXYmDEPj/7QMdAoS9bsibi9ZYM92l9p4=; b=1FfT0maecbJT33s/dMMVcl8ksw
	y2w/CiPJokIUUuGGrhLA887GpKienqZl3sYlStHI+UVEflsNcMMSAnHlZA6GNlqj66/kZGXCxSV/y
	dqTZZ9lGXZuWmNHbcwxr2IxfMqYu9Dt9L8xVF+fEM2gEIHB8Xc+pnsWMjTb+lZs2fFQoSFAmG8aNV
	XQpCRK3KG1fdH1AMo0nkpJUyMx3ZaJJQaLHhzMDPzZ7Wo9oCAPahTqKk0ir06tCsB7ybWaTJ/rruD
	BxuZZcxnJEeYbLNVnRjUHkuGU7ayIjXLPKx4e5kT29jjUfF2kQOuaoUoBG9ew/ehsEr6J+WlKADbt
	A02nTyjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unfzB-00000005pkZ-2VCd;
	Sun, 17 Aug 2025 16:11:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unfsH-00000005p7H-2u3M
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 16:04:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=POmukRFkjYpNXYmDEPj/7QMdAoS9bsibi9ZYM92l9p4=; b=rC1G319dTDBFPpGTPqkcpbL3HP
	QRy7+PTdl6rXOCpbsnZoW9eRT/HTpDkvV38pa5R3sZaUwBqPhMWRcTJXghaFODfj/1bt9qR/+iSnF
	UFeHFBOmNQ9e/FjkROLMguEQQ1MF7Jm/+OHTPgM25A5hdD2vuWO9nGHI6xIYLJWfmC/8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1unfsD-004ydR-DH; Sun, 17 Aug 2025 18:04:45 +0200
Date: Sun, 17 Aug 2025 18:04:45 +0200
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
Subject: Re: [PATCH net-next 7/7] net: stmmac: explain the
 phylink_speed_down() call in stmmac_release()
Message-ID: <3590bd11-c934-4838-b9c7-87a480dc3696@lunn.ch>
References: <aJ8avIp8DBAckgMc@shell.armlinux.org.uk>
 <E1umsfV-008vKv-1O@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1umsfV-008vKv-1O@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_090449_726852_9C94D840 
X-CRM114-Status: UNSURE (   8.36  )
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

On Fri, Aug 15, 2025 at 12:32:21PM +0100, Russell King (Oracle) wrote:
> The call to phylink_speed_down() looks odd on the face of it. Add a
> comment to explain why this call is there. phylink_speed_up() is
> always called in __stmmac_open(), and already has a comment.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

