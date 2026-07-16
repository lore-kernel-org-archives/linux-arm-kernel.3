Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B9BC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 15:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ExhIekzxCh4zJqorxDbL/NrT8u8gcatX9LYZ+QXseY=; b=5CLpO14bEJtRYwRbKXu4dSZ8Qm
	6qwSzEKc6gnjfKRc/yi61GOr+eNCACdTziOG9sFi1SazI82MdqVZMeD+dweZQRKQvMjH1rgFauKO/
	MIKKB+NLw9TqEVKxqMy4CPG6nK1KVByJvonjrt3qpIq/RAWiZKg1BuceEOIjQ+GczrR9h/Ber6j4v
	UjuyxWnq2XlPu7QE81qPVH9u44DWsMzSf4MvN87XY65VcC9Qz7PvwKhhM2EkhQpqmRXVW2wb8GJKJ
	5+WQgF+xlbKie467JYLZEvvjv+6upyQfqGIfuyvkyYfvCgqfwmm2Jzm7pXOLjNENrVIju3DEKHZ/t
	J452FQ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNcC-0000000HZmL-14k1;
	Thu, 16 Jul 2026 15:03:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNcB-0000000HZlj-1Gsj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 15:03:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 60F4B60A5A;
	Thu, 16 Jul 2026 15:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA181F000E9;
	Thu, 16 Jul 2026 15:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784214186;
	bh=+ExhIekzxCh4zJqorxDbL/NrT8u8gcatX9LYZ+QXseY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oHCo3Hu2aZu2ozL+3PeryVZ1Z9x4Sc+FYrlm8ijSwDlzJnp+10aYIb8GdaZUgFLV1
	 3kAIbQuRZQmY6zf3ToCCvha2HnRvFRM9FW4bXl7BQPPB/whMgMsyxusiKflF160KeV
	 tIpYwqfKRI1LkeHoK7CyQSWnB1qEziEkIlmskYVgzXpKKWH8iWOJw7pq+nmHQ/OMM6
	 dMNmeQ8eVbFruzOL1zoXqkLtwucL0spWaIBtOJ2mPLrQWeOxCtIcMfh3ZYM72NTf1e
	 A7vKNMC2RIUNbxnMn9/+Wv/x+DMcjxLT6HWWfCrT95mjVMB1NjfT8TX3X8dkkZiB0f
	 UNMuyq3Ti33cg==
Date: Thu, 16 Jul 2026 17:03:01 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Vincent Jardin <vjardin@free.fr>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Wolfram Sang <wsa@kernel.org>, 
	Kaushal Butala <kaushalkernelmailinglist@gmail.com>, Shawn Guo <shawn.guo@freescale.com>, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>, linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Carlos Song <carlos.song@nxp.com>, Stefan Eichenberger <eichest@gmail.com>
Subject: Re: [PATCH v3 0/2] i2c: imx: fix SMBus block-read of 0 locking the
 bus
Message-ID: <aljyYViyNwN0MjGQ@zenone.zhora.eu>
References: <20260713-for-upstream-i2c-lx2160-fix-v1-v3-0-073ac9e103a5@free.fr>
 <alZZmzQrnBptGEMQ@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alZZmzQrnBptGEMQ@shikoro>
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

On Tue, Jul 14, 2026 at 05:45:31PM +0200, Wolfram Sang wrote:
> On Mon, Jul 13, 2026 at 08:11:58PM +0200, Vincent Jardin wrote:
> > i2c-imx rejects an SMBus Block Read byte count of 0 (valid per SMBus 3.1
> > 6.5.7) as -EPROTO and returns without emitting a NACK + STOP, leaving the
> > target holding SDA so the bus stays stuck until a power cycle.
> 
> Bigger picture: Linux does not support SMBus3 which also allows byte
> counts of up to 255. I started sketching support for all that but could
> never implement it.

Yeah... I have claimed many times to have patches that add
support to smbus3. I also promised many times that I should
update and send them over :-)

Andi

> That being said, despite no SMBus3 support, it should not hang the bus
> like here.

