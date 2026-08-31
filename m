Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD056C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 20:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58qzWRlFT+1LEsCbv2NU3eA6ucyiCa9T+H9aKr1gZ+E=; b=VwGdTeVZvMTjNlMHjDR74vpBo7
	MZT2s2zTuoDHICoMWI709zP8wlYW/qyZLOVNNd/lr9ZfkoEXQhd3tBC9BA2CKWPJZFMxxaR3vFTwn
	04gF0zRnki9gjxXATIlRiLUP/qa8EWAEynNcJJisZWAg7hBPXdYCAYC+llGeQMTs/zpa9bOpYITe8
	eZJT0+W9EmTLGBQLxfS5yq2WJGqxWVWKdnPt6XlIEiHELIq2bwSc1sHl7IU2K5X6KgYHs8mn+vbPW
	QqkKc5rBPLUWVgTI9RAKLV/EhPv7b09QcYeTt0Rccn6f48mL+Qu+zhl337zohmpFMbXQwa9xJsgA4
	1Oc6+4YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x18p6-0000000AUQt-3l42;
	Mon, 31 Aug 2026 20:41:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x18p6-0000000AUQj-0Lsd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 20:41:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 22CA8602D4;
	Mon, 31 Aug 2026 20:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8387C1F00A3D;
	Mon, 31 Aug 2026 20:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788208902;
	bh=58qzWRlFT+1LEsCbv2NU3eA6ucyiCa9T+H9aKr1gZ+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cZRuDUb6UDYEUMwbqZvOWZV7DspR+NZNocPKIuoQAoyTZ/s0hzPoo8bOQL9Es8FC4
	 l3xGoUsnoEf0RvEhwcfYqvRjrGikuZ7NEn010wl3/rKteOolN5w1q0L5B7SxdYX2Jt
	 qGnjGWjpa5z+1RfcTS4oE/YDkZ20gZPx85d4cp3NFvpa427ijPxRUMZCvlgSq782I/
	 HaIAvZkjtmonvbo6cNYuVblmEKdAeZwbXmtHoiSJDopKl6cnIvTVsIpfEmagESZO4v
	 08JfJsb3g0oOsYfvr5LPEldqn5wZhBJQFdruBoJjtaFr+exZIjbMG4IrtQdaQRYBTs
	 CHioeyU/9rQcw==
Date: Mon, 31 Aug 2026 13:41:41 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Cheng-Yang Chou <yphbchou0911@gmail.com>,
	Kees Cook <kees@kernel.org>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: arm64/aes-neonbs: transition to kmalloc_obj()
Message-ID: <20260831204141.GD86114@quark>
References: <20260830101714.625728-3-manuelebnerli@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830101714.625728-3-manuelebnerli@mailbox.org>
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

On Sun, Aug 30, 2026 at 12:17:14PM +0200, Manuel Ebner wrote:
> Convert to type aware allocation as suggested in commit 2932ba8d9c99
> ("slab: Introduce kmalloc_obj() and family")
> 
> CC: Kees Cook <kees@kernel.org>
> Fixes: 652a3017c485 ("crypto: arm64/aes-neonbs - Move key expansion off the stack")
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>

Please don't use the Fixes tag for behavior-preserving conversions like
this.

- Eric

