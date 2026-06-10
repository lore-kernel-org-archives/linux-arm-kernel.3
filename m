Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DD7CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 05:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GJ7Pj5chXa9KIYTVJaZOEQTB9a9MC+ilmCUwbWdCWU=; b=po6dwVCBecb424/lraftfzLhYZ
	rcC1Wcj+LNfx+aBfTvWHjLALZwndifIgekWXvXFU6KFY1UrOKPivXhS6Ey/5sHvI9rhkSbxrWYw3y
	iGWIunm++osGKrjrhXMA0qYGsyGg+f5DNN0OCPXBihJS9KXSVTnwwCjznaHmPbAGJLOHiWoVNrRld
	abFDoiZWPzKkYKT9+d6NgcB0wOWsY4MhYvaj5bGyXZ4biGwFvblfDTT9jiZ9w6sR+mZQhsXBDrjr2
	onyEvnaO5rGwBqw1Bm4VKkrw3BqQQPDH+NWQtrInrbk1dfiIQ5ET8mikDrpjDB69Gnl3kHF3/xQph
	OpJ9s7PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXBEH-00000006oMw-4Br9;
	Wed, 10 Jun 2026 05:11:54 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXBEF-00000006oMR-1YDl;
	Wed, 10 Jun 2026 05:11:52 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id B6F1168BEB; Wed, 10 Jun 2026 07:11:46 +0200 (CEST)
Date: Wed, 10 Jun 2026 07:11:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] nvme-apple: Only limit admin queue tag space when
 with Linear SQ is present
Message-ID: <20260610051146.GA559@lst.de>
References: <20260606-prevent-tag-collision-t8015-v1-0-93ccf4eca550@gmail.com> <20260606-prevent-tag-collision-t8015-v1-1-93ccf4eca550@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606-prevent-tag-collision-t8015-v1-1-93ccf4eca550@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_221151_578657_934233DF 
X-CRM114-Status: GOOD (  14.19  )
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

On Sat, Jun 06, 2026 at 09:25:25PM +0800, Nick Chan wrote:
> Apple NVMe controllers require tags of pending commands to not be shared
> across admin and IO queues. However, on Apple A11 without linear SQ, it is
> not possible for either queue to skip over some tags and must go from 0 to
> the configured maximum before wrapping around.
> 
> As a result, in order to prevent tag collision, dynamic tag reservation
> while a command is in-flight becomes necessary. In this context, there is
> no reason to limit the admin queue's tag space, as it is not helpful in
> preventing tag collision.

I'm not really into these Apple specific, but what does
"dynamic tag reservation" mean here?


