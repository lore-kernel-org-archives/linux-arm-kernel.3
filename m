Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7275EEA8134
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 15:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2rI3ezgSJDvYU/zB9i3pbGBVSddFqhX+QJFcTpTwhA=; b=ELmu1DQBg+cNxI2vMyP9cKDl8L
	qDJMzcDOXg2hyBLW+NzWhoGPIxXkvHF7Ogak8ZUXn5st1Qq5Hh3ubItLqmZCU2a3uUZvITp42GHy2
	0wE4nlaLfmvopO/Py3YcdTMgzQOgoOCAkITwI7LAt18cBlWECp5mgYjsprP5ZBkZ37u7O1/94WxUP
	wBAtws33ThJtvHSERJ0Z+4pZtjJ451H1THz1o/Am99jIQHfcInpVzYvqmcmafrTmuQF1fGgimGYoC
	EC/8zJDtoZPQyer82xKN4cI7ncWDInZhXEGzrL/3ZgJ1DWfIywOJcsCBK58uElxViyRGdQxAwKZ25
	RDVFKE+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpprd-0000000H8Vj-2UxT;
	Tue, 10 Feb 2026 15:41:21 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpprZ-0000000H8Uo-1BFf;
	Tue, 10 Feb 2026 15:41:19 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2779868CFE; Tue, 10 Feb 2026 16:41:09 +0100 (CET)
Date: Tue, 10 Feb 2026 16:41:08 +0100
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Yu Kuai <yukuai@fnnas.com>, Christoph Hellwig <hch@lst.de>,
	axboe@kernel.dk, sagi@grimberg.me, sven@kernel.org, j@jannau.net,
	linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
	tj@kernel.org, nilay@linux.ibm.com, ming.lei@redhat.com,
	neal@gompa.dev, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Daniel Wagner <dwagner@suse.de>
Subject: Re: [PATCH 3/4] nvme-apple: move blk_mq_update_nr_hw_queues after
 nvme_unfreeze
Message-ID: <20260210154108.GB2484@lst.de>
References: <20260209082953.3053721-1-yukuai@fnnas.com> <20260209082953.3053721-4-yukuai@fnnas.com> <20260209145832.GC18315@lst.de> <aYn-xwFHCpd7sITJ@kbusch-mbp> <e3e7d95b-2712-4365-922d-731449e7193a@fnnas.com> <aYtKFNm-wRKn6l66@kbusch-mbp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYtKFNm-wRKn6l66@kbusch-mbp>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_074117_464247_3DA4D7FC 
X-CRM114-Status: GOOD (  15.03  )
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

On Tue, Feb 10, 2026 at 08:09:08AM -0700, Keith Busch wrote:
> If you leave the queue quiesced, pending IO will form requests that are
> entered and waiting in the block layer. You can't freeze a queue with
> entered requests.
> 
> We unquiesce first to flush any pending IO that had entered during the
> prior reset. It's not the best way to handle this situation. It would be
> smarter to steal the bio's from all the entered requests, then end those
> requests, then resubmit the bios after the hw queues are initialized. We
> don't do that because no one's really complained, probably because the
> queue counts don't usually change after a reset.

FYI, Daniel Wagner had been thinking about doing this reinsert for
something (I forgot what exactly), and this kind of reinserting from
kblockd would also finally make REQ_NOWAIT practically useful for
file system initiated writes.  So I hope we can eventually get to it,
and it should help to sort out various problems.


