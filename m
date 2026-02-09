Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E883E81BD4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 14:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5URA0tMHGdefOQwf3/MLjx/k2IsqT2Df52OwNYX6v6M=; b=GWri4z3ss/9UotRx/PByCA6g2q
	mA0zbJ9UPOhKzHK3YQzxsnL4BqGWDKLi5+In/Fe5qmLN9COxW3mvMO4dYAPhpBgvKK7VJYNsB6nS3
	gEY6KFyPwKeI9DT3Ybg5jl+mE/ah+9jIMFfUrM1j7d8xoAP0RslycIN/ib8i3ybK+omTLzFnyhuS9
	uDz8L9sHqaq/vcjBpM2V5P+Fwr95H7aUaPGJFM6yxuPhp55LWJaqO1wjQqX8UBrzrEiO9AkhzhmFt
	SQc9wrwu2X+6eIrF6bXOfqD6k9QwKFp+3OCO+g1orbIKjd7tXRR239Iu6ohPsJjC7WymrY1zLLLgV
	iuBX+L+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSjo-0000000FYvk-0wc1;
	Mon, 09 Feb 2026 14:59:44 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSjm-0000000FYur-0gtN;
	Mon, 09 Feb 2026 14:59:43 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 74A5268D05; Mon,  9 Feb 2026 15:59:39 +0100 (CET)
Date: Mon, 9 Feb 2026 15:59:38 +0100
From: Christoph Hellwig <hch@lst.de>
To: Yu Kuai <yukuai@fnnas.com>
Cc: axboe@kernel.dk, kbusch@kernel.org, hch@lst.de, sagi@grimberg.me,
	sven@kernel.org, j@jannau.net, linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org, tj@kernel.org, nilay@linux.ibm.com,
	ming.lei@redhat.com, neal@gompa.dev, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] blk-mq: use blk_queue_enter/exit to protect
 debugfs file creation
Message-ID: <20260209145938.GD18315@lst.de>
References: <20260209082953.3053721-1-yukuai@fnnas.com> <20260209082953.3053721-5-yukuai@fnnas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209082953.3053721-5-yukuai@fnnas.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_065942_374995_036E03F5 
X-CRM114-Status: GOOD (  11.24  )
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

On Mon, Feb 09, 2026 at 04:29:53PM +0800, Yu Kuai wrote:
> +	/*
> +	 * Avoid creating debugfs files while the queue is frozen, wait for
> +	 * the queue to be unfrozen and prevent new freeze while creating

I'd say "prevent concurrent freezes" here, but I'm not a native
speaker either.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>


