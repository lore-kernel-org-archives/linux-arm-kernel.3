Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66918C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 06:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QcXOYRCH0+rzrtF5eKJ9mNGNA8kBZEbH+ucO4R4KXyE=; b=hr3wgTBZo0so14epRAbimpZoEI
	2qBcGWDm4HAq0fBZCV2g8NGPOozSppK+c1M977U7E4m4OowydkFy+WU5VXhNpbxVEm722eoQm12hM
	+Fipasm/BLGJDG9sYJa0T17c+XQPmdMBWrDQnlwUqsQYR8WWVPyGhvy7SFtdqwVOo7YrOUVII7Fri
	UnznRyYMPPX/lRBDI9o7PX9fS6aqjPc+QlsAFE5042evrDjHU9+VhvdW/KMcC4iyXPGBfGf8njzsC
	m2ezBX+j3HtgKTSgESc+v02vO8d412yFMhSuNdzgSxkiEWNmoA19O59JAIYmij0sZobgB0rBDB0om
	u0YR6JpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsF9v-00000007YaR-2Ezd;
	Wed, 12 Mar 2025 06:01:39 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tsF8E-00000007YHO-3CIm;
	Wed, 12 Mar 2025 05:59:54 +0000
Date: Tue, 11 Mar 2025 22:59:54 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
	Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	Alan Adamson <alan.adamson@oracle.com>,
	virtualization@lists.linux.dev, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Hannes Reinecke <hare@suse.de>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: Re: [PATCH v2 2/2] block: change blk_mq_add_to_batch() third
 argument type to bool
Message-ID: <Z9Ei2t7z_7QbEWXW@infradead.org>
References: <20250311104359.1767728-1-shinichiro.kawasaki@wdc.com>
 <20250311104359.1767728-3-shinichiro.kawasaki@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311104359.1767728-3-shinichiro.kawasaki@wdc.com>
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

On Tue, Mar 11, 2025 at 07:43:59PM +0900, Shin'ichiro Kawasaki wrote:
>  /*
>   * Batched completions only work when there is no I/O error and no special
>   * ->end_io handler.
> + *
> + * @req: The request to add to batch
> + * @iob: The batch to add the request
> + * @is_error: Specify true if the request failed with an error
> + * @io_comp_batch: The completaion handler for the request
>   */

This needs more work to be a proper kerneldoc comment, i.e. start with
"/*8", mention the function name, etc.

The logic changes themselves look good.

