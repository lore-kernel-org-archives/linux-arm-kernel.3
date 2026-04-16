Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3080EF8D776
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 20:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niMl/eAsWm6lGZ7DPH8AzrV4LU2Ix/5pbN/C+R78wf8=; b=Rz6EJ6PQjxSQQ/pJtNqX5iP2jV
	8dD/xYrDGkggqKCuzZDSZK1nBCIY9TfR+V7d4qLaj8/bWtG1rbRKdc+Ox2jk5up3Vp5LDQZSE4T5o
	bfrkhVOEqNhReXkTRPmYDDbgl4sR4iU/4xRDTzkQiH4+uzHbrhr9ceQMB7+MAsgJRcoqvh9aTZ5Ah
	rwxKCZLyyI2dmKGuxOw4WihSe+wUaGEj+MgH7zCt1i+z7j89BjHJ8f9P2STTgxLQtPyVuHuYeDiGX
	cmu2OWRvBwF3fuZdnmS4LyheBEdA7V1czXa5Uq/pottG1tu6J36YA5Yj0P6XJzwxCIMFzIsRJ4Pi+
	HHWt6VTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDT8M-00000002xYi-2KQC;
	Thu, 16 Apr 2026 20:16:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDT8L-00000002xYU-1obV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 20:16:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 86A4860127;
	Thu, 16 Apr 2026 20:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2FA1C2BCAF;
	Thu, 16 Apr 2026 20:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776370576;
	bh=R/+DzOdGIK0mO9G5ivghTZXgfvc47/DKlFbEl1raOVI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pK43roZiQcqiQnjSJT7dagBUZfApCSNmUvHNa9llT8HcqXlgYEzYyd27qrRJrPD7X
	 GXXLXxW+1p7EiiEFBTUCM1p/1lcQrFPDjrJJ35VNM7jh6Y/fk1dgcmGPYMMMAu/FLA
	 szCyku3OH1MpQZrV7jsY1vacIUOavd1rD71L8pqSOCnztWZI5BSfn+4xdkXBsEonrk
	 1p038auIwS7gTKSHpjKTfERlvzpuB5+vyATcjVIJXo81z8ygfL5+eRsi7L38eYixwz
	 Ue03sIH+igCURCBehG83I9Qrp3CHojxZexJ2XgXeVZH838Vm7r4BVgtM00nEVXJBG9
	 4CDX3fZdXcGtQ==
Date: Thu, 16 Apr 2026 13:16:10 -0700
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
Message-ID: <20260416131610.1bf3bce2@kernel.org>
In-Reply-To: <aeE8mpXy9FRHvN9q@shell.armlinux.org.uk>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
	<5987484.DvuYhMxLoT@steina-w>
	<aeC-tc2CooYDoBok@shell.armlinux.org.uk>
	<2410317.ElGaqSPkdT@steina-w>
	<aeDSTIS9-TDSihbX@shell.armlinux.org.uk>
	<aeDojTdDTELfpT0X@shell.armlinux.org.uk>
	<20260416090826.1c5ca018@kernel.org>
	<aeE8mpXy9FRHvN9q@shell.armlinux.org.uk>
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

On Thu, 16 Apr 2026 20:46:34 +0100 Russell King (Oracle) wrote:
> On Thu, Apr 16, 2026 at 09:08:26AM -0700, Jakub Kicinski wrote:
> > On Thu, 16 Apr 2026 14:47:57 +0100 Russell King (Oracle) wrote:  
> > > The next problem will be netdev's policy over reviews vs patches
> > > balance which I'm already in deficit, and I have *NO* *TIME*
> > > what so ever to review patches - let alone propose patches to
> > > fix people's problems.
> > > 
> > > So I'm going to say this plainly: if netdev wants to enforce that
> > > rule, then I won't be fixing people's problems.
> > 
> > Do you have a better proposal?
> > I'm under the same pressure of million stupid projects from my employer
> > as you are. Do y'all think that upstream maintainers have time given by
> > their employers to do the reviews? SMH.  
> 
> Are you really under the same pressure? I have one of my parents in
> hospital right now, and was in A&E yesterday afternoon through into
> the evening. I've been down at the hospital since 2pm today, only
> just come back to feed the other parent and head back down for what
> could be a long night. Then there's supposed to be an appointment
> that will take up to 3 hours tomorrow morning...
> 
> Yea, I'm sure you have the same pressures and worry from your
> employer - except my pressures are medical, looking after my parents.
> 
> Thank you for your lack of understanding.

Not my point. Sorry to hear about the issues you're facing.

I don't think making vague complaints about the development process
is going to make anything better.

