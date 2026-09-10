Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B055BC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 10:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVa5/Y7xn1EpqKezVaRBDPkPb7Gx5+V/7vYVwDKr84o=; b=qymqc+KoEGFmBklhFX9tYp+HMr
	uVRYcG84E3IYXIe+p3bHZzNFvIFjELfqynnxJImtmLzCTUy/GQRFgm08xWbQ/cHP5nIPR0s7pgrn9
	UaRNGrDM4Fy7LambtjzO1OBlj5XuQ9ESX4urijlrgcEjhvK9ZejB3FT4ycvlgu+Qp9fsfGMqvP5Q1
	Obq5pCxX6JV02eznz1v2/UFfcJem6YMWg6aJ06XpdHihnedTZxHkZ55I8iInLdv/WX785EiYpqIO+
	f9qNRL2nwKDnnXkIZUq+ahquMRvVbSFu0Gc1+2nDUDEhbFtRRjphPPTKT432uazPaG3CuyTb3My+m
	4FK5jCdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4c6y-0000000E56K-2oz5;
	Thu, 10 Sep 2026 10:34:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4c6w-0000000E55o-3Utu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 10:34:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F0A53600CB;
	Thu, 10 Sep 2026 10:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F101F000FF;
	Thu, 10 Sep 2026 10:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789036469;
	bh=KVa5/Y7xn1EpqKezVaRBDPkPb7Gx5+V/7vYVwDKr84o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FhLSgVGO0X6wgMpX7DG6T3izBHMHrV9JP+kxARDtJ0xIJQBRE2Z4Yq+FhasjrClMm
	 fmGa28mi8hRe8u0uCZicXaSwRQ/wJiYVu2yBEgo5IeNtRcuzuvHp5tgrKzA82fznMm
	 64sDXHsv5KXqc8Z4Cu6YvReBDThrPacpIlfgHpt5FoJsNAgjNvaS+M8jaLUVwK8AQ2
	 OfunWtDDRhDwT7MHakVMphGM8Uw7kQAHmgbgB9+Eg/0fLGQ62gX1rDnuxiI0iMBmaY
	 PNSl1tUwWGVqz2CZLGW6dI811EAOe2q/QBvz/DG/v/w1l1MeJ0gT/WIhLhQ5NXljTt
	 J/ecnYDN1gvlQ==
Date: Thu, 10 Sep 2026 11:34:22 +0100
From: Simon Horman <horms@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Snook <chris.snook@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	GR-Linux-NIC-Dev@marvell.com, Geetha sowjanya <gakula@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>, Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Manish Chopra <manishc@marvell.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Rahul Verma <rahulv@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Russell King <linux@armlinux.org.uk>,
	Shahed Shaikh <shshaikh@marvell.com>, Shuah Khan <shuah@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next v3 08/10] net: hisilicon: fix typos in comments
Message-ID: <20260910103422.GZ40544@horms.kernel.org>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
 <20260908052602.27497-9-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908052602.27497-9-hemanth.selam@gmail.com>
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

On Tue, Sep 08, 2026 at 10:56:00AM +0530, Hemanth Selam wrote:
> Fix misspellings in comments, found with scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Comments only, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Reviewed-by: Jijie Shao <shaojijie@huawei.com>
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>


