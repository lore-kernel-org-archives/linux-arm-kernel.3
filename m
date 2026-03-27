Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0235510ED679
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 13:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWaGYGfE09F0kZciAttFzXxqsRdaGsEZKzX4KQOFCyE=; b=gBhvnsyVMFuPQq/gOgbe1Pex7s
	9PcpaAg8aJQ9EP2DPoR6DPiG12MNtHbtRa2Iaxkhtiycm0EXQAwUPqtW5nbHnV42XbWwCtmTimv1B
	GPSniKQOSIGBxLAA+18Ooo49zJY5BDtgLMsnuZwvPjw2pjBPQE/agP7JqIB5UGyxuG2mvYe1U7+J0
	SVqMU0OXaYIN+Lp9EOYlKJImlGzpPOh/rydZZHbhOddEGHNMpqRNuqKk0LdE0onAq1PnGxt1Xa0Kx
	EAUnrWCVLyjpF9/hv5hxSKg40n43eaozPbj87oI7h80h/mgqXN9Unias3K7xOAf3TtQK4BIINMz7s
	SRJOcV9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67aZ-00000007Te4-29wx;
	Fri, 27 Mar 2026 13:51:03 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67aW-00000007TdT-33kf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 13:51:02 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 638E468B05; Fri, 27 Mar 2026 14:50:51 +0100 (CET)
Date: Fri, 27 Mar 2026 14:50:51 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-raid@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH 4/5] xor/arm64: Use shared NEON intrinsics
 implementation from 32-bit ARM
Message-ID: <20260327135051.GA739@lst.de>
References: <20260327113047.4043492-7-ardb+git@google.com> <20260327113047.4043492-11-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327113047.4043492-11-ardb+git@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_065100_911981_FBAAFD0B 
X-CRM114-Status: GOOD (  12.69  )
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

On Fri, Mar 27, 2026 at 12:30:52PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Tweak the arm64 code so that the pure NEON intrinsics implementation of
> XOR is shared between arm64 and ARM.

Instead of hiding the implementation in a header, just split xor-neon.c
into two .c files, one of which could be built by arm32 as well, probably
in the arm/ instead of the arm64/ subdirectory, but we can also add a
new arm-common one if that's what the arm maintainers prefer.


