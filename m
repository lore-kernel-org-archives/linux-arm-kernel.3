Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F85C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 16:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDDyjoZTZprDt7lf4HgFNIEtYfMAuyIz4FaZ2Epncis=; b=IoqOEialL+DEzGAxD7iMfsed5E
	EHRcZ7SMWzwl+rp2paoYw4JjE9P0xX7De1oerlikX1oZYqEtiYx7GljYUEVKkzSYn8yym/wZGZqBn
	hmeO42HgAfSoSlfAoqsXtX/MiN5UHNU3Of8SVnfDkDGZIdtQPPHtw/I5WYx3M1bGdaS7hbD6DEmC7
	+tu7G7j9k5HFTPGbaxPtKaDnVgP6gfXYf94QWc0DmropzKjBqDW1mpzmD3cq3OIajaByPKULQNIKp
	uNR4zzx1u6Ci3iLxU0iCGGPdJDpG3na5v+nSRW3lYTnnfrGS5w1bn57j09FErkArG1MZer+DE0q3o
	Bi3EcTgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArkE-0000000GYpA-0zKO;
	Sun, 27 Sep 2026 16:28:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArk7-0000000GYnx-18my
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 16:28:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A58E42D58;
	Sun, 27 Sep 2026 16:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD55E1F000FF;
	Sun, 27 Sep 2026 16:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790526525;
	bh=kDDyjoZTZprDt7lf4HgFNIEtYfMAuyIz4FaZ2Epncis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oL9nLs4ermSQVs41sLxGo4H+/m6Gu4an7pR4I633+8wSH/ucDccrzZoszHYD7dCzL
	 ElUMXZcx1vl1YzrSvqTTp7zLpArutUPMAXVHjC7jWn6jYWLpJ8jiXXFafJ3Hu+xfc9
	 Vj8lHhHYI9JG1cTJJX3vKlwL4m8uZAMOQazOZnsI=
Date: Sun, 27 Sep 2026 18:28:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Fan Wu <fanwu01@zju.edu.cn>
Cc: Jiri Slaby <jirislaby@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] serial: imx: cancel RS485 trigger hrtimers in shutdown
 and remove
Message-ID: <2026092715-deftly-strainer-c8a3@gregkh>
References: <20260819021916.442827-1-fanwu01@zju.edu.cn>
 <2026092332-limes-washhouse-44a5@gregkh>
 <20260927143550.608878-1-fanwu01@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927143550.608878-1-fanwu01@zju.edu.cn>
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

On Sun, Sep 27, 2026 at 02:35:50PM +0000, Fan Wu wrote:
> Hi Greg,
> 
> Honestly: when I sent the patch it was compile-tested only
> (CONFIG_SERIAL_IMX=m, drivers/tty/serial/imx.o rebuilt with no warnings).
> I should have said so.  There was no runtime test behind it.

Sorry, I have no context here as you top-posted and did not include any
context.  Please don't do that.  Remember, some of us get 1000+ emails a
day...

greg k-h

