Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3493FC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 10:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvNK7T3zH0fzn4zq1Q+HDzlH0q+EO8s3/+84Yfx3rJQ=; b=rXbbl736UtSPlHQQutHfrrZW8d
	ndsUddSSiUqUPS2Ln+FADWzH5308lcgZH6Lra/zhBve4WcDR/8cEhpTwmag0rR982LSzjtJcSzCf3
	8AX/7R5URv+OfB4gCQSkBNNIgEtYS3VZiTEw5x2PYOcyQGrRIpZluJH28CyIwDrwRx8msX8RatVVk
	pdzEzVItXYCA/nEFTIKSRSzd+Mip9hJuukL30xFAq/d7XznLjSxIHhCUkYESWEo6Ql97AaUMIScLo
	s36xeY9+upSMCoF2RMalZAe5Huoqa2GWJCwzxDEKAFN5/n2z6vFoMNEVDAJt/ghFwghIs3wiho18q
	8jkTYJkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x39vJ-00000004vcR-11xv;
	Sun, 06 Sep 2026 10:16:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x39vI-00000004vcH-0QKB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 10:16:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A175600AA;
	Sun,  6 Sep 2026 10:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADAF21F00A3A;
	Sun,  6 Sep 2026 10:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788689784;
	bh=nvNK7T3zH0fzn4zq1Q+HDzlH0q+EO8s3/+84Yfx3rJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hy93BAmpcuVm8PuBkqCf8XO2NQmzpXcagxY7Wlvx2XEbymcBwQbD+XfJUxG0or7wn
	 YuE5sr+moKQlHP0RRYBktFuZDjK5Q7AIFlnLS1F73EFcEAKbmtpDdGNkzuZJzE2bL5
	 yn68wrbYWZ6eEXzIeEkYGh7GOCcn6lGNK17jJkILAkltQ+48/LTWwBqCfpjdNuJ/Iz
	 l871wGzA66XqS01sn83Nqc5EJt0m1hStpseYyI7rTBiqT7xdNchU2STc7JsZAzmJzk
	 CU9M8027h3MAGBNlAsB8LIA1hES+w1bHS+F96AySiHbVyQRD4dA9+7cBoOLySpA4Qf
	 EqNojmLSsCOQQ==
Date: Sun, 6 Sep 2026 11:16:19 +0100
From: Simon Horman <horms@kernel.org>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Kees Cook <kees@kernel.org>, linux-ide@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-serial@vger.kernel.org,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH] ecard: use module_driver() to avoid repeated boilerplate
 code
Message-ID: <20260906101619.GG40544@horms.kernel.org>
References: <20260906040153.105692-1-enelsonmoore@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906040153.105692-1-enelsonmoore@gmail.com>
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

On Sat, Sep 05, 2026 at 09:01:46PM -0700, Ethan Nelson-Moore wrote:
> Many Acorn expansion card drivers have module_init and module_exit
> functions that only call ecard_register_driver() and
> ecard_remove_driver(). The module_driver() macro automatically
> generates these functions given the register and unregister functions.
> Switch to it to simplify the code.
> 
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
>  drivers/ata/pata_icside.c            | 13 +------------
>  drivers/net/ethernet/i825xx/ether1.c | 13 +------------
>  drivers/net/ethernet/seeq/ether3.c   | 13 +------------
>  drivers/scsi/arm/acornscsi.c         | 13 +------------
>  drivers/scsi/arm/arxescsi.c          | 14 +-------------
>  drivers/scsi/arm/cumana_1.c          | 13 +------------
>  drivers/scsi/arm/cumana_2.c          | 13 +------------
>  drivers/scsi/arm/eesox.c             | 13 +------------
>  drivers/scsi/arm/oak.c               | 14 +-------------
>  drivers/scsi/arm/powertec.c          | 13 +------------
>  drivers/tty/serial/8250/8250_acorn.c | 13 +------------

I think it would be best to split this patch up on a per-subsystem
of per driver basis. And send patches to appropriate subsystems.

In particular, please break out the net/ changes into a patchset
with one or two patches for net-next.

-- 
pw-bot: changes-requested

