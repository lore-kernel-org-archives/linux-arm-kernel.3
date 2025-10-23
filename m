Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDDFCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 18:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcG50dMMXSISlPBoCDniPpurycAsgd8gSy7s4DyCZOk=; b=AsrPBtWquG49QyH8N1Cm+LvUYR
	jdZhm59QgiTv7+/FsXbP35WXS39NXzficsU0GL04X5csjVgLOsNy//pFI4ApdDQsIK2Fmy0coSQSt
	GaNPBYlzp++JUOo3/tExu+AxmLqZ0XdEIWxkG3JNWCe2bdAItOrRbfVWrzhBRqNkHNUl75PkApwVh
	KOtz/uexgOlx0f8dZS0VjJRa+jy2mZDQ3v4oOGd7WiFKTtAqE36XF9B/Dl4t9EcUB+ZjtXddadi76
	geZ+fhG/1feJ8ZlILFVvKqqp260xqLUkamSnUoVuTpk/ATh/t5sE4U3Det4t+y/vtkHBaN6QrDqoM
	nQaclyYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0Q4-00000007IIt-0351;
	Thu, 23 Oct 2025 18:52:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0Q2-00000007IHv-2oMt
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 18:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CcG50dMMXSISlPBoCDniPpurycAsgd8gSy7s4DyCZOk=; b=XA930+oXygBM4yR3vNS/+EPPk7
	ImZLcachg/hgk9eI2+kMEnxZPeQnqnluLcuGUS4kDoXSn4mQrzJSF7vvKSKmryajfuwwN/LoHoA91
	S/IlmA+jpkWzlY6gr0oeQ9j7VYSdXxVpk12xJedHms6NGutbVLJ4Ez2dyzeALPM2Zrm9oBsXVC/96
	+cqNEEq7SFC8v3waINzuw8pir3KdJoLTs/H6p+hQEbfcLWygmVoTQS0k1gaL5tuIDWKz1ImiyvCyE
	yEhJil97AsWJi6NXxNSIJE9lcsXf0TnEhX8g2n4XU0aWgdJU92WJFmPcHwXCGNJhyfIPF5TXV93p/
	AOti270g==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzYJ-00000001d8l-3yGG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 17:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=CcG50dMMXSISlPBoCDniPpurycAsgd8gSy7s4DyCZOk=; b=4W7Ltb5zwkN/3ATliMvoPnipDN
	J0g3vQ5GBsnTualcKGJnmKIZ2PsMPlUDlQlyfK1mjiNgfZEUxhaq08Yns3cKGW/8NpQcRY50Ga8RH
	DZdtnVT28pIMF9kcje9UbVU13vDCX5aP/x5IcTuJCDdzqC1ZPK1iywCDWOsF0jLO6bYA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vC0Pu-00BufO-UY; Thu, 23 Oct 2025 20:52:06 +0200
Date: Thu, 23 Oct 2025 20:52:06 +0200
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
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next 8/8] net: stmmac: reorganise stmmac_hwif_init()
Message-ID: <d662bea8-2b16-4183-a2b9-e5946f83ae42@lunn.ch>
References: <aPn3MSQvjUWBb92P@shell.armlinux.org.uk>
 <E1vBrlg-0000000BMQS-0QYt@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vBrlg-0000000BMQS-0QYt@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_185644_026938_5B0C1DD9 
X-CRM114-Status: UNSURE (   6.32  )
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

On Thu, Oct 23, 2025 at 10:38:00AM +0100, Russell King (Oracle) wrote:
> Reorganise stmmac_hwif_init() to handle the error case of
> stmmac_hwif_find() in the indented block, which follows normal
> programming pattern.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

