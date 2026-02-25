Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6A9F55438
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 01:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIRBSCQrfKRVrEGu/bvRSHAo36ijB+9RpC167KvgkuA=; b=CZQ4QdN2BqWbkJmnIaH+isoghI
	Nb/c21phszKHa1w0P+BFar7tfzZuBo3LaCIb2WiP0yTSRO4JvOWmdxl+qKQbqXC/A9hMGfw7dCHV+
	352jley/c5T6Pdx7IAMQ3/Cr0IdMX9KaNRM/c0MKkGArp6Uhza/p+1jwSWOHCyZXQVf9Kn/kTODM0
	ECSyPjVUwU3etczMvhIj0BuIbNYRX0OghUTUrV1Osh7la4cLZyt/ijEcE1RlH7Tm/yIYSjLylliPy
	HA73msTFtDF4aibmBOj1FQQ+BWZaNRBb1a/PJ035rQGthqbF2TdFsxeld6h91eL8QFmOeZ7H2uGkH
	ElvuvZUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv47X-000000033aq-0Wul;
	Wed, 25 Feb 2026 01:55:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv47V-000000033ah-0ILp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 01:55:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F3B2C60053;
	Wed, 25 Feb 2026 01:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00765C116D0;
	Wed, 25 Feb 2026 01:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771984519;
	bh=wai5ctQjllxH/CyiupuFCePSUyKayiUbmb+UdSGsD40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tUjjOztaISRqAaKg7pJmNx+H6fEeo9AaWbgjJdnnKR7V6A3uCZzbt5Ze08NYzOz0J
	 KhEvRb7SyAPCfTK9LSNn+pMV0AQhBae+uDMXpsnO+nuzB5BojvZZ+hnBd8N2GeD9qu
	 Lvi/Q4LM5WzYr3UvASFxF2F+nw/O3gUXNMNjoQRjTxrp4ByjLQt4VCQ28GjpMitOLh
	 rqZvQT7MPATcx1a/yvEqrjCfJgl4g5I47u8ki4c2KCGySX5D9wkfRb9/xl3xplJ1R+
	 ujrUdtC9ztIDV/MUx8Qb+/4Om4AdVsDpMO2HhwOnTzS4RkKlHJ5bLIoDBXI4IvafWF
	 hQ3OOp2a75pDw==
Date: Tue, 24 Feb 2026 17:55:17 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jay Wang <wanjay@amazon.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
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
Message-ID: <20260225015517.GA162634@quark>
References: <20260212024228.6267-1-wanjay@amazon.com>
 <20260212024228.6267-18-wanjay@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212024228.6267-18-wanjay@amazon.com>
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

On Thu, Feb 12, 2026 at 02:42:21AM +0000, Jay Wang wrote:
> With this feature, FIPS certification is tied only to the crypto
> module. Therefore, once the module is certified, loading this
> certified module on newer kernels automatically makes those kernels
> FIPS-certified. As a result, this approach can save re-certification
> costs and 12-18 months of waiting time by reducing the need for
> repeated FIPS re-certification cycles.

Let's be clear: this is possible only when the kernel has a stable ABI
to the crypto module, which realistically isn't something that is going
to be supported upstream.  The Linux kernel is well-known for not
maintaining a stable in-kernel ABI, for good reasons.

So, the only case where this feature would have a benefit over the
kernel's existing approach to FIPS 140 is in downstream kernels that
maintain a stable in-kernel ABI.  There would be no benefit to direct
users of the mainline kernel or even the stable release series.

For this to be considered for upstream there would need to be some level
of consensus in the community to support this feature despite this.

- Eric

