Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A16DFF493A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 05:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QFBQfsZr5GhDBdJSNw2P+ylTzm0pNue9CjzoFJeGiD0=; b=eDGs4ny5ZhCepwYag4Ur5uleE9
	r9U4fj3ThjKWg7JX5jLbESK7oY2pJ0ayJ3NmqumhAFxIibRrSDAmNMmXpfC0pXkQvyCbsp9b2VofE
	lz672LdzRTA1jD6w2hmCk+RnTV8vUgVQz3MgPH3zFHuYiGMGOa4FN1WHHg4mcJSApx7cUHymcqnhE
	ZRnKkPkaEXYrE1Xfnr6NnNQP3E5ENUkREoj5FdVVG298rbYYPbTmt3Q5ImY/90yVCx6Yi1dug5Mlh
	CwfE2rSDVRfpBnlOSS7JflRo3ia1fzA61w/X7mEfoiCES9nnz9K2pbvy+6FOimHKpHqwkFjYPlJZf
	9QfwMwsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w75CX-0000000Adit-2Bgm;
	Mon, 30 Mar 2026 05:30:13 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w75CU-0000000Adhs-14GD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 05:30:11 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2EBDF68B05; Mon, 30 Mar 2026 07:30:04 +0200 (CEST)
Date: Mon, 30 Mar 2026 07:30:03 +0200
From: Christoph Hellwig <hch@lst.de>
To: Demian Shulhan <demyansh@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fnnas.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>, broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com,
	Li Nan <linan122@huawei.com>, linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] raid6: arm64: add SVE optimized implementation for
 syndrome generation
Message-ID: <20260330053003.GA4736@lst.de>
References: <20260318150245.3080719-1-demyansh@gmail.com> <f9bc0534-4b7a-4b14-974b-4d7811ccd899@app.fastmail.com> <acJhCCPfVxjFUZ5R@J2N7QTR9R3> <CAOLeWCsxhzdxQviizJ4X4VOp_28LCtO-RjWoCcZG29rQw86NVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOLeWCsxhzdxQviizJ4X4VOp_28LCtO-RjWoCcZG29rQw86NVg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_223010_460295_362BA41F 
X-CRM114-Status: GOOD (  16.42  )
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

On Sun, Mar 29, 2026 at 04:01:06PM +0300, Demian Shulhan wrote:
> Furthermore, as Christoph suggested, I tested scalability on wider
> arrays since the default kernel benchmark is hardcoded to 8 disks,
> which doesn't give the unrolled SVE loop enough data to shine. On a
> 16-disk array, svex4 hits 15.1 GB/s compared to 8.0 GB/s for neonx4.
> On a 24-disk array, while neonx4 chokes and drops to 7.8 GB/s, svex4
> maintains a stable 15.0 GB/s — effectively doubling the throughput.I
> agree this patch should be put on hold for now. My intention is to
> leave these numbers here as evidence that implementing SVE context
> preservation in the kernel (the "good use case") is highly justifiable
> from both a power-efficiency and a wide-array throughput perspective
> for modern ARM64 hardware.
> 
> Thanks again for your time and time and review!

To me this sounds like an interesting case for a SVE kernel API.
But I'm not relly knowledgeable enough to provide one to help
with testing this further.


