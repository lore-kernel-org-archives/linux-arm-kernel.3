Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88AFF3D60E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 14:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRgCbss9okgtwE/2HXiSyI8ABM3ZDM2tNsJxq7osZa8=; b=F7ERdNtuGDVdivhPDEptbSBHzE
	5dEOvoBEf6pYpM+iHFk5cAdHKGWNLl2x8lzmInkIPBs7XngZo18tVpRcPoZ67628jafIb4iAaQMso
	7qwfxzMIqiVBmca470RCqf5UqujqZwJJcl98rN7lzMssXrdLJTDubebm+jCZzZsLKd9iA9d0JDg2q
	ZfEv7Fck1AzbiJ/qbZfiexwTyshk4atV3NJ8Pr6cPls1zaPoiozPjfXX5bdfTe5Hh3kS7RaImLp7K
	EEeFSZMTWT4bJUNnCQAdu/3yaRpBTcZgjNo3wjS21cxe/fd9jMnbWoxAPOmUluifyQl8jIJL9W2OG
	WVGMi0Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6qjR-0000000A0DF-1aNk;
	Sun, 29 Mar 2026 14:03:13 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6qjP-0000000A0Ct-2Sj0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 14:03:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bRgCbss9okgtwE/2HXiSyI8ABM3ZDM2tNsJxq7osZa8=; b=Us/+mpYgv6eUGjYc1vS/hNrfmz
	kPeWCFn3DBHz25QHgHPOpiPcNxOvOp0Pmy1T4K+cR8VSpkEiUW5qH1tuyLtO9Lrz8/Z8uXAgdBhEr
	UrYZWz52uqkDWibfDwXrXTlHZgUa7+7xojnCWT8fl6VSz/QWXF0yvMcqWEssWi7ipZuM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w6qjI-00Dtwh-8A; Sun, 29 Mar 2026 16:03:04 +0200
Date: Sun, 29 Mar 2026 16:03:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 01/10] net: stmmac: fix TSO support when some
 channels have TBS available
Message-ID: <33c656fa-9286-48ef-83de-287b88f88bc7@lunn.ch>
References: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
 <E1w6bKj-0000000ELtf-3md9@rmk-PC.armlinux.org.uk>
 <acjzmxY9xmBInSwm@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acjzmxY9xmBInSwm@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_070311_646523_EE70560B 
X-CRM114-Status: UNSURE (   8.99  )
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

>          * Packets that won't trigger the COE e.g. most DSA-tagged packets will
>          * also have to be checksummed in software.
>          */

I doubt DSA will work with TSO, it would have to include the DSA
header into the replicated header when doing segmentation.

I thought we had some code in DSA to turn off features which are
likely to cause issues. But i don't see it.

Hardware checksumming has been an issue in the past with DSA. Some MAC
hardware from switch vendors, Marvell, Broadcom etc, understand the
DSA header and so can do the checksum correctly when the DSA tag is
present. MAC hardware from other vendors often get confused so
software checksumming is needed.

	 Andrew

