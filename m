Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AB7FD3760
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 14:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A7jm1Grkm3kwC8i3HQCDJTJL8naE60NHgdGHK7ZyH6M=; b=yPRFFi/HoIoKtKdzC91flm+OEt
	ln92jfg4vPEoWqUv5dxv+auvzAJIOhrRaxJV894ORd91yJ1/2mu64MoVIeFKGNDYQU6TChMUmM2SZ
	9CMJgZADUzF33JnHlY6uQ4buL9AQFYfTYVIHSZWvuAVzFQbMT69Gfnt0EdOYvasjs/KT0dvYuAB/A
	dYwl218x99yEPMCPyLgZFpVjvUzs8P3b3RosXps/Dxb2N+1auwv9qwl5VRAUx6HgsSn2V2S/MDwGB
	81OYDt8S1GT9TTQme5aZbdIoDeNWTdEh+BdEDG+n2OTTZHBSQuo2emNA6438ftgA210U3h+jMEO2C
	nxem8JKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFg5-00000004B0k-2Dfo;
	Wed, 25 Feb 2026 14:15:49 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFg1-00000004Azz-0a2B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 14:15:47 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id EAEAA68B05; Wed, 25 Feb 2026 15:15:38 +0100 (CET)
Date: Wed, 25 Feb 2026 15:15:38 +0100
From: Christoph Hellwig <hch@lst.de>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Christoph Hellwig <hch@lst.de>, kernel test robot <lkp@intel.com>,
	linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Eric Biggers <ebiggers@kernel.org>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: fs/crypto/bio.c:67:17: sparse: sparse: cast to restricted
 blk_status_t
Message-ID: <20260225141538.GA2732@lst.de>
References: <202602230947.uNRsPyBn-lkp@intel.com> <20260224145528.GA13793@lst.de> <aZ3dmvNZnJYxL8vA@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ3dmvNZnJYxL8vA@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_061546_041912_93F274EE 
X-CRM114-Status: GOOD (  14.86  )
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

On Tue, Feb 24, 2026 at 05:19:22PM +0000, Catalin Marinas wrote:
> It looks like sparse doesn't like the __bitwise cast to unsigned long in
> the arm64 cmxchg code. We could force the type cast, not sure whether it
> hides any real issues. Another option is to do the force cast in bio.c
> but I don't think that code is doing anything wrong:

I think that's pretty much what the other architectures do.  Note that
we have a few other places doing the same with blk_status_t, this new
code was just copy and pasted and triggered a new warning.


