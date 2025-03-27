Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17BBC36010
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 16:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfJim8DeBHNipjHRIJRylVAYkOzlvX7pl+lO0KnP9P0=; b=t8wjGPKmClS5kX0wRzpwEyKDAL
	tAUn1nriPekunZC7BILk2iH/Ni+ZoKJ/bkGEW2dHdNUgtrc5ZJrPqFr2r+TBeqAUHDixe6DzQyEnv
	X7UR2mRZ5G7Raq2bRRA2YTU1W4fR7w+6Pr58cSN7hrFMHYgfEHmKu9WHPIejm9mBCwWDiB7l4owN0
	8erhzWU4Z/LKYzIVni5QuDRqNgM309+2HRXbHLEXt6voQ+zlb+FJbFF+sViQjMb66cmGNAbW8mz1L
	0sRa9Sm7LxEHnifS5TPkBlb/d0vAcU2Zpt2vIBpTdlimxaexsSIRqBn8p7j6yBEwby7yAc0qZJp13
	ph6jsDcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqSM-0000000BZwm-1xvy;
	Thu, 27 Mar 2025 16:51:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqJN-0000000BYE3-3NwC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 16:42:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1FC1C5C5420;
	Thu, 27 Mar 2025 16:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A43C4CEDD;
	Thu, 27 Mar 2025 16:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743093752;
	bh=QyH77tECH3lylpaKyou3K7E3snQSAJIhR+N1IUAgi74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eKzFd5Q1gv6S4vMmsJlrOy8tVOkL3QoYdYVyoWXZHR8rCdqsBWNeeoThrTDPKrGJ/
	 P5hUtgsIfH7HMHZ+nIjVS7TmPSu5MyENL7uXNuY+3bENEclSCwoovuR8sw2LLD3yGM
	 ZSspOavMRFSBPPiIk6/tb+EiVNiSSwGhkxX2GSMMVuf2mBqebTQ0HUCCVcEp5pGKDl
	 en0jKCEWsM3Iier9NbtVzy6sk32xNuDkMe25Edq32hyl8M7ZfZY4O//VjuRCr7SkBB
	 98Hoxh9L5YNeAyyvTewGFzzuPyxUmYEAnW8R5XjRlmQ9hMh6WALQYW0Ny0k4GYZ/xL
	 LPt97A7IHKojA==
Date: Thu, 27 Mar 2025 09:42:31 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
	stable@vger.kernel.org, David Binderman <dcb314@hotmail.com>
Subject: Re: [PATCH] arm/crc-t10dif: fix use of out-of-scope array in
 crc_t10dif_arch()
Message-ID: <20250327164231.GD1425@sol.localdomain>
References: <20250326200812.125574-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326200812.125574-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_094233_899753_D7145455 
X-CRM114-Status: GOOD (  11.16  )
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

On Wed, Mar 26, 2025 at 01:08:12PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Fix a silly bug where an array was used outside of its scope.
> 
> Fixes: 1684e8293605 ("arm/crc-t10dif: expose CRC-T10DIF function through lib")
> Cc: stable@vger.kernel.org
> Reported-by: David Binderman <dcb314@hotmail.com>
> Closes: https://lore.kernel.org/r/AS8PR02MB102170568EAE7FFDF93C8D1ED9CA62@AS8PR02MB10217.eurprd02.prod.outlook.com
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/arm/lib/crc-t10dif-glue.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied to https://web.git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=crc-next

- Eric

