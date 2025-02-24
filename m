Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001A2C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 18:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jyfu63sfgIIzRlQ97A+OgOAA0wyg2MUg45/jU8ca2fA=; b=x5xL9XzadfY47YP0HX94IblyTh
	Rks6gcdXIRbuMs0mlkCFP1uhCAkN8zVC5ZpnzePbSffucM6t0xcHxMXfOoEwwOfRMgpJbS9PvzL0D
	KW0/bJVhcyMQ//giwZsBT+03tQSatD7j9NgvwTdDpUTgbgalgyRim+Vj1bGp4WyxdiG0vuVHOUkpg
	VlaIO+YXmBpngTdfizhcB+ySNHfRfc2ETIlivYQZc4U5D+BO4hcwFweaeDXgK3EoSJGfzntP2PLB9
	KwsbWNkRGQaTi1DAy4gfq0n38nrFgAaFCvXQuyD8WriQ4Y4BkfhqoW6O0aP5Oy7IhtP1WxeU1LErZ
	NsytzJ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmd6x-0000000En0d-03Dn;
	Mon, 24 Feb 2025 18:23:23 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcy2-0000000ElCz-1gbm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 18:14:11 +0000
Date: Mon, 24 Feb 2025 13:14:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1740420849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jyfu63sfgIIzRlQ97A+OgOAA0wyg2MUg45/jU8ca2fA=;
	b=aduryPCeM4tYkhcg7JxYGA3aRnwlpUI1Cqzuy3sVeDAA0L48aQpcZ1bZwNGSlWhZ3w1dNr
	M22gflzi1zaZGF+1ATAGhaYUrHhRiDO5bcWElFAMfvY6sYED66CiygBcpjtoQJCCierjoo
	WHw3oT1zrv2m181ST4yvz2KBT7q4tAfHUCFo8tFyafzjfV1GBF9GF0V3XFFRifqDZQGF2L
	MMt+13+CjKteS6y3hyeQRFtMDCjcYm/sjxyw1j59m5aZnMa9YQ+tbPkGsN/r46yRo1FXGg
	wRPsPIBQzcKuVIX+3mn0W5aZFiFJYBSS6hqAvwg9t0xibzpOULojUQ9SDljZnQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 0/4] Apple/PASemi i2c error recovery fixes
Message-ID: <Z7y26r88nrK2QKVN@blossom>
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_101410_581131_DD6BFB88 
X-CRM114-Status: GOOD (  12.96  )
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Sat , Feb 22, 2025 at 01:38:32PM +0000, Sven Peter via B4 Relay a écrit :
> Hi,
> 
> This series adds a few fixes/improvements to the error recovery for
> Apple/PASemi i2c controllers.
> The patches have been in our downstream tree and were originally used
> to debug a rare glitch caused by clock strechting but are useful in
> general. We haven't seen the controller misbehave since adding these.
> 
> Best,
> 
> Sven
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
> Hector Martin (3):
>       i2c: pasemi: Improve error recovery
>       i2c: pasemi: Enable the unjam machine
>       i2c: pasemi: Log bus reset causes
> 
> Sven Peter (1):
>       i2c: pasemi: Add registers bits and switch to BIT()
> 
>  drivers/i2c/busses/i2c-pasemi-core.c | 121 ++++++++++++++++++++++++++---------
>  1 file changed, 92 insertions(+), 29 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250220-pasemi-fixes-916cb77404ba
> 
> Best regards,
> -- 
> Sven Peter <sven@svenpeter.dev>
> 
> 

