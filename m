Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0ECBF99344
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 07:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAzDT6Z7eZO7Rr6K9Bc6eJ54nlJYiBkwAxPG7qREtw0=; b=lX1eYVXKhHvWcb68cm8zh/Dfdv
	0lUmfyBpYfOr3Gycdrz2IjG6HXxx2w7PFDgUME9mYZMYu/lzFIki4xPWZoc1q0aTs8xzeAS1+aBcm
	A1C0TUabsBPM7Kh0YiZ2k39l0x7t+jLTCMpXJdj51A6qJFQdGzIdMMvLZFg/MvxqU8y/Vn8/4tkva
	01tTn9MzSsCkG1ZMyOqJBLXXC34U/2Y5tWlMI6BzwprjwlGVUEvrtQ9nV+CVDzyyKlE/NGbrcKd3u
	HHYfIfuzOdELWW/fsy9a7KNsLQYSdJqoyIe027jERlSIGuZ/j6XUvrTDTtv5SPvyMqzKWzNEYn3E9
	qA3mUDAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFomS-0000000BBC3-2lIz;
	Thu, 23 Apr 2026 07:47:24 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFomM-0000000BBBR-0F7E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 07:47:23 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id BAEA568D05; Thu, 23 Apr 2026 09:47:12 +0200 (CEST)
Date: Thu, 23 Apr 2026 09:47:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-raid@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH 7/8] lib/raid6: Include asm/neon-intrinsics.h rather
 than arm_neon.h
Message-ID: <20260423074712.GC31018@lst.de>
References: <20260422171655.3437334-10-ardb+git@google.com> <20260422171655.3437334-17-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422171655.3437334-17-ardb+git@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_004718_965800_1F3D9D24 
X-CRM114-Status: GOOD (  14.31  )
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

On Wed, Apr 22, 2026 at 07:17:03PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> arm_neon.h is a compiler header which needs some scaffolding to work
> correctly in the linux context, and so it is better not to include it
> directly. Both ARM and arm64 now provide asm/neon-intrinsics.h which
> takes care of this.


This could potentially clash with the raid6 library rework I'm doing
for 7.2. Although git has become pretty good about renamed files, so
maybe it won't be so bad.


