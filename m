Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B920CCA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 12:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j6RJiG9LKdMiF6JHUgt/C676r7v1TC9rEint4KQ3yj4=; b=DZ/zw9PUFr18Whmy9I2Dwozp+U
	E4oxaBBw0LhdHH0ZwOHX7JiEmPtyU0KibG0QzSsLMmrdIKVPiKovdcNu2mVadIxsNSMzC6fC1Abzq
	EVKNDqpk+8T+VrDSnXAE/MGh28xcQxh+1R2j/QVpsILVQhvEN0YzQszCXKG3xMuw607E17owUDdvd
	IxEquCe2ETR46hfNuyFGESmAuIpdCYXD7rJ480HJnGnJWtKgfMzEvxUj8IEmc71KtumY41SOg+c1r
	2jDePH4Jzzr710RneRanlwHpKs4TciTmI4+hiAYCOjLaH6AaZcGsVb+xDyqIeaUTXQTq+btIf1vSx
	Surn5OHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmBs-00000006JiS-0E5v;
	Wed, 03 Sep 2025 12:02:16 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utl3z-000000068ez-1Qai
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 10:50:04 +0000
Date: Wed, 3 Sep 2025 12:49:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756896599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j6RJiG9LKdMiF6JHUgt/C676r7v1TC9rEint4KQ3yj4=;
	b=Edp5VoE1mfxAQsPaKzt2DFJgUvT2YTcfW4Fs825/HOglXQzoMIoUM0J5gc/EQ7i0+nAopc
	r+84KlJ3Ak0A5juv7Q4Cj1AVXHtAYpgXEX5sg0x1iWxqtDDTq4darlByJeoTIEJZuYwAgf
	Na89kCg+E4PKsKkko58WOPoVTjSfsUAtgUiAADiOwTd/tsGmb08UaYslJjmdETPrbS0XA8
	+lEeT9NmcExZtlV54ghoEiNVPekg3fUxN8k3pZaci+pJgrVD4FB+ld3Gy3XJ1nZ/FHeu+K
	gcFcBo9qm8cMRzO8a+DDOP1ejRWRTaexXFBRH/J4CA6d6eOTa3lfBVhjdXZilA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756896599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j6RJiG9LKdMiF6JHUgt/C676r7v1TC9rEint4KQ3yj4=;
	b=8g7ZmmO/QT8/F2MQldoLuxcXIMLtJdf6KmIJgbamVe7nrdXUyrz4JIIhtCluFUSERUhA9/
	W1Sw3g5HXR9NxRBQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>, 
	Andy Lutomirski <luto@kernel.org>, John Stultz <jstultz@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: uapi: Provide correct __BITS_PER_LONG for the
 compat vDSO
Message-ID: <20250903124853-7dd41845-8939-4a01-b50d-42f87cc6583d@linutronix.de>
References: <20250821-vdso-arm64-compat-bitsperlong-v1-0-700bcabe7732@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821-vdso-arm64-compat-bitsperlong-v1-0-700bcabe7732@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_035003_524117_DDD4B64A 
X-CRM114-Status: GOOD (  14.12  )
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

Hi arm64 folks,

On Thu, Aug 21, 2025 at 09:56:43AM +0200, Thomas Weiﬂschuh wrote:
> The generic vDSO library uses the UAPI headers. On arm64 __BITS_PER_LONG is
> always '64' even when used from the compat vDSO. In that case __GENMASK()
> does an illegal bitshift, invoking undefined behaviour.
> 
> The first patch should go into the 6.17 tree.

Could you take this series?


Thanks,

> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
> Thomas Weiﬂschuh (3):
>       arm64: uapi: Provide correct __BITS_PER_LONG for the compat vDSO
>       arm64: vdso32: Stop suppressing warnings
>       arm64: vdso32: Respect -Werror from kbuild
> 
>  arch/arm64/include/uapi/asm/bitsperlong.h |  5 +++++
>  arch/arm64/kernel/vdso32/Makefile         | 13 +------------
>  2 files changed, 6 insertions(+), 12 deletions(-)
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250820-vdso-arm64-compat-bitsperlong-4f59ae7ef6e7
> 
> Best regards,
> -- 
> Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 

