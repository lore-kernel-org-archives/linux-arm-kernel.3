Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4618FD3760
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 14:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWRvKSrVzQxumCJr/FJXMqnLK+ok9RFugzOcVZ5aYRY=; b=yWMb+tvviuwxNMniJ7hWHaFSml
	7geloMYpiY4g11hXsuWOfU/beaY4nMdSYbsJl0YEWrAFI0Cx8Cl5oXVRq+c4/ipkX/FLqqxRumBCv
	Ur6/piCbaLXWlSv07UazFuePWt4AgmA+UcliKqr/uFHBtklhx19UWs6gDKsLDRpERb65R7a1UI8s7
	Rboj3Srt6Ns84P/0S3Nv84n5ezlRbGabrsDhC88PX5mOEMlEk14zaFWXi9X4Jq1pnEqvTs0JGqtcP
	7LOUe4ILo7QLEKwollyPsA9MGLCJWsv4qcJzyZQYtu6I0ovG+pYZElbYvFJz3kn1lc7DtZpIogei4
	dioOONaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFZU-00000004AMo-0Kxi;
	Wed, 25 Feb 2026 14:09:00 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFZO-00000004AMD-2PsX;
	Wed, 25 Feb 2026 14:08:54 +0000
Date: Wed, 25 Feb 2026 06:08:54 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Jay Wang <wanjay@amazon.com>, Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org,
	Jay Wang <jay.wang.upstream@gmail.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Nicolai Stange <nstange@suse.de>,
	Ilia Okomin <ilya.okomin@oracle.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org
Subject: Re: [PATCH 17/17] Add standalone crypto kernel module technical
 documentation
Message-ID: <aZ8Cdq2doSHlPG9-@infradead.org>
References: <20260212024228.6267-1-wanjay@amazon.com>
 <20260212024228.6267-18-wanjay@amazon.com>
 <20260225015517.GA162634@quark>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225015517.GA162634@quark>
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

On Tue, Feb 24, 2026 at 05:55:17PM -0800, Eric Biggers wrote:
> Let's be clear: this is possible only when the kernel has a stable ABI
> to the crypto module, which realistically isn't something that is going
> to be supported upstream.  The Linux kernel is well-known for not
> maintaining a stable in-kernel ABI, for good reasons.
> 
> So, the only case where this feature would have a benefit over the
> kernel's existing approach to FIPS 140 is in downstream kernels that
> maintain a stable in-kernel ABI.  There would be no benefit to direct
> users of the mainline kernel or even the stable release series.
> 
> For this to be considered for upstream there would need to be some level
> of consensus in the community to support this feature despite this.

That's a very nice way to say this goes against all the established
principles for kernel development.


