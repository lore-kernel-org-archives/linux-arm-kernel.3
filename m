Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E5AF8D761
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 16:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbTzyQR7VFkrRaQR+omuVgOle2hiVBW88xTP8/GIGxw=; b=i66fRzHVHMP9eDG8jWf5OXhIou
	jObUkZ4SCYnOP41QivcTyMDAGUr+ZSfhUZTAU7WGE1ptJVmJ3eqdCmJWm67rBuM7/56ymOluXsQ5l
	P5oFd4WUu25n5lo9gpgOiuThM8HiGSY482j4OEzMNrYPicxcsHEMrANA/cRuz3lvpHyRt37hLd5AN
	tMUhVyxZ6jm946bhq/e8gt5jNYklJOkX1s+jBCHcoVao0kdBlYtmToYoDLvoF7kHmMqW2GsYjNJJh
	rJWHopbDnwO5utY1h/1jgSRiq2SkHBTdNLwh6AahLslqffKTNnvMqzNUPnw83jKu+/syEADdOVDWm
	vjWD1n5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDPGj-00000002ePu-0t8b;
	Thu, 16 Apr 2026 16:08:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDPGi-00000002ePi-0u1D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 16:08:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D06860126;
	Thu, 16 Apr 2026 16:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 777B4C2BCAF;
	Thu, 16 Apr 2026 16:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776355718;
	bh=blfLhEBoi0Jo2O7QmaSG1KknkwFty/RTOwjSNlNAq2g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lCQwztZ6rZGKQF3hDG1tpdLN32/+spbnaWx/az7G37E7GpPped5+BEE9XJEPnA2y5
	 fpTn2r+zI1yF5jnpvdLMT6LGbKCXxApZ547uyUsZFNGtT5ydINPmkfpFjhSk47NpXY
	 1AJknVDSbjv8yb7HOQwTzGBofXg9eFUw1ti09WYmOdLYfoYWd8hqr1YCYzV8trtvfL
	 5dASKr46AG33P5ttniZLBrRCQLJzDf/YJueqy8WQEqmCQD3AgGfrtLKYPs7drulcuf
	 WDq2lsU2EFjpK8zlNrmcxLV7hKSUeSVKEfHPmEp/ZJaD8KnWmGuPz77HLmoDmfNAW9
	 lSaB1mZ37GlRA==
Date: Thu, 16 Apr 2026 09:08:26 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>
Subject: Re: [PATCH net-next 5/6] net: stmmac: move PHY handling out of
 __stmmac_open()/release()
Message-ID: <20260416090826.1c5ca018@kernel.org>
In-Reply-To: <aeDojTdDTELfpT0X@shell.armlinux.org.uk>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
	<5987484.DvuYhMxLoT@steina-w>
	<aeC-tc2CooYDoBok@shell.armlinux.org.uk>
	<2410317.ElGaqSPkdT@steina-w>
	<aeDSTIS9-TDSihbX@shell.armlinux.org.uk>
	<aeDojTdDTELfpT0X@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 16 Apr 2026 14:47:57 +0100 Russell King (Oracle) wrote:
> The next problem will be netdev's policy over reviews vs patches
> balance which I'm already in deficit, and I have *NO* *TIME*
> what so ever to review patches - let alone propose patches to
> fix people's problems.
> 
> So I'm going to say this plainly: if netdev wants to enforce that
> rule, then I won't be fixing people's problems.

Do you have a better proposal?
I'm under the same pressure of million stupid projects from my employer
as you are. Do y'all think that upstream maintainers have time given by
their employers to do the reviews? SMH.

