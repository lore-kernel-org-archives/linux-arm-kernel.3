Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A213CFF60CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 06:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NdJjMx/lqC/WQNfBrTVPj9/7nhqD5t79jBnryfA2q4=; b=1SVDfy6FzR1aTXBIjxgblg8EPo
	H1nQ5KR0ASRZqiMpdBWmLgd4JGZ6ZSP3eFrT2BDjvuUG8OepP61W7XrPyjHP+TQHNOtmkY9zhhrSh
	0eRu8XBRMJM2Ie2IWPTTP8xUkqdKZdRtWIhIMPEsUxVxasj2xEnOU8QIlS6BBVGV2QKf7jkDWvdsc
	5Y2n/hIscWMXTBYPfn9tFhBsiNWW+9nWrjmhhcXVlLLlbWiW8c8U3e/bErmiXsZV2zW1v6bJ+JuvU
	DjYgiolYveFcJsaLn6gX1TJxDL1P8Gr0QMk2TlJrZ68szySTu5LeNEyyEHezmYiiA0TCELX34Gpl/
	kaqXJqpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Siv-0000000COQQ-1bor;
	Tue, 31 Mar 2026 06:37:13 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Sis-0000000COPd-40w2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 06:37:12 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id B9A6168B05; Tue, 31 Mar 2026 08:36:59 +0200 (CEST)
Date: Tue, 31 Mar 2026 08:36:59 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Demian Shulhan <demyansh@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>, Christoph Hellwig <hch@lst.de>,
	Song Liu <song@kernel.org>, Yu Kuai <yukuai@fnnas.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com,
	Li Nan <linan122@huawei.com>, linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] raid6: arm64: add SVE optimized implementation for
 syndrome generation
Message-ID: <20260331063659.GA2061@lst.de>
References: <20260318150245.3080719-1-demyansh@gmail.com> <f9bc0534-4b7a-4b14-974b-4d7811ccd899@app.fastmail.com> <acJhCCPfVxjFUZ5R@J2N7QTR9R3> <CAOLeWCsxhzdxQviizJ4X4VOp_28LCtO-RjWoCcZG29rQw86NVg@mail.gmail.com> <9a12e043-8200-4650-bfe2-cbece57a4f87@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a12e043-8200-4650-bfe2-cbece57a4f87@app.fastmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_233711_136674_4349BA67 
X-CRM114-Status: GOOD (  21.78  )
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

On Mon, Mar 30, 2026 at 06:39:49PM +0200, Ard Biesheuvel wrote:
> I think the results are impressive, but I'd like to better understand
> its implications on a real-world scenario. Is this code only a
> bottleneck when rebuilding an array?

The syndrome generation is run every time you write data to a RAID6
array, and if you do partial stripe writes it (or rather the XOR
variant) is run twice.  So this is the most performance critical
path for writing to RAID6.

Rebuild usually runs totally different code, but can end up here as well
when both parity disks are lost.

> > Furthermore, as Christoph suggested, I tested scalability on wider
> > arrays since the default kernel benchmark is hardcoded to 8 disks,
> > which doesn't give the unrolled SVE loop enough data to shine. On a
> > 16-disk array, svex4 hits 15.1 GB/s compared to 8.0 GB/s for neonx4.
> > On a 24-disk array, while neonx4 chokes and drops to 7.8 GB/s, svex4
> > maintains a stable 15.0 GB/s — effectively doubling the throughput.
> 
> Does this mean the kernel benchmark is no longer fit for purpose? If
> it cannot distinguish between implementations that differ in performance
> by a factor of 2, I don't think we can rely on it to pick the optimal one.

It is not good, and we should either fix it or run more than one.
The current setup is not really representative of real-life array.
It also leads to wrong selections on x86, but only at the which unroll
level to pick level, and only for minor differences so far.  I plan
to add this to the next version of the raid6 lib patches.


