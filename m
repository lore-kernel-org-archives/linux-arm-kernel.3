Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DBCF99340
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 07:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6muK0UIkQpf1BdVuJEdrCxVp76ny5DYCeVPUDS0YjQ=; b=W1ih8HeLJfUp6o2Hjo11enjXPs
	Ad5Y5MNYkenrSwjyXEfrMUmljiOkcmKO1+Mk5MBzeQteMeH9bPU1s4qWQyuNfGlqSaNUG6gvK2dUA
	ooTCLcLQENT65mGvgSyz1fyosu36e/gq723elcvPy8RVzbJe0ta6D77azMYnNVG5KTV+Scz1q+5tE
	/L9MNOqo8wAOL8StWcCFhjBSfZ0g62n2aMZkWVgkFH868ntHMUnOwL0D7P3/mhupdE1Hy3oGKMPN2
	JqWBArgSeebuA3+6AfC7jOGyd8Nner/encFZtWBqOfmeS07itaDr/BE0MB/Cpx6/CMHatLxX6La4K
	/9J46MYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFolT-0000000BB5g-1FLl;
	Thu, 23 Apr 2026 07:46:23 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFolQ-0000000BB5L-2CIP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 07:46:21 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7176E68D05; Thu, 23 Apr 2026 09:46:15 +0200 (CEST)
Date: Thu, 23 Apr 2026 09:46:14 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-raid@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH 3/8] xor/arm64: Use shared NEON intrinsics
 implementation from 32-bit ARM
Message-ID: <20260423074614.GB31018@lst.de>
References: <20260422171655.3437334-10-ardb+git@google.com> <20260422171655.3437334-13-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422171655.3437334-13-ardb+git@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_004620_726378_D8853A24 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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

> +extern void __xor_eor3_2(unsigned long bytes, unsigned long * __restrict p1,
> +		const unsigned long * __restrict p2);

Does the alias magic prevent this from being in a header?  If so a comment
would be nice, otherwise moving it to a header would be even better.


