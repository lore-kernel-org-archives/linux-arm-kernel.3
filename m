Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5227AD11081
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 14:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnBUFuHQ8wxisDfmkv/SVcgdxffw2NF75fIbS6RYg6M=; b=KikAcEtLAIk0NydTfVzaJiX5uS
	gUcnzKSroR9ji+sc3OpuHF0CcAxarFu4YEVbJR5K2DFU2jpOA4vg0InHscJPglAosU1leKk9ZzQD0
	CNy1iIqs+7cD8AfXs7Q2Mjg6hgQEdJvMNc8itqblvZ6Gr+Y8lKrKgbfl1RUcRKMmJG1Hsd5MDLoWE
	iSq0pMBYcti5NIhKO3PWw9+LTXJqS1GX13PiRCTW/cX6mjL+2xeTWrZ6yXOwm0IZPRaEbAlZKbcus
	YJ2T4WKDPHGqbPvWWOtLQgpW9JgbgU17rvL/GXbpX9iVEt66TH72VgT1/t89uP0Jl46Y2gtEGAYoh
	CoERdI2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7b9s-0000000BVpH-03mV;
	Sun, 03 Nov 2024 14:00:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7b6k-0000000BVO1-2C26;
	Sun, 03 Nov 2024 13:57:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 337C15C4336;
	Sun,  3 Nov 2024 13:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014DBC4CECD;
	Sun,  3 Nov 2024 13:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730642252;
	bh=VxXH6aqpqHLHF5oRJ5vnT5vpm2uvtxBA9AHVL/CAjN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EgyAPyUVzD+RX89LUiOchP3Aw0Js3GqP/DtnP8pAtBfaDedVT967mnJ82pBpE9KRN
	 ftK066xUf9/ky+dJfz8zo3ZrlOBBIwzAtGdFfjJW9BVBxme/2A7kncMayzUKYZ5xhE
	 Vmbx+QZrBR8d8lG3rs/hr5GcPBgei7uWbzXvPZxURjQuM+X2Jr3q9fjSTk/A+86b8b
	 PyY1dLiWpn2qN/lGx/OjiSXOJsgO36lUUbVoSgk7DuHWX2RDImBvvO7ui25Wr0tZYV
	 0Xe+h5Xj9lpyGr/BCNqgwMBTm5cG9eqiST44/fbsaiqt3sqcAsOAptCwqbnUAM9n9Z
	 n3EbHG0jaagjw==
Date: Sun, 3 Nov 2024 05:57:30 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: ardb@kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, kernel@xen0n.name, chenhuacai@kernel.org,
	xry111@xry111.site, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 06/18] loongarch/crc32: expose CRC32 functions through
 lib
Message-ID: <20241103135730.GA813@quark.localdomain>
References: <20241025191454.72616-7-ebiggers@kernel.org>
 <DA8BCDFFEACDA1C6+20241103133655.217375-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA8BCDFFEACDA1C6+20241103133655.217375-1-wangyuli@uniontech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_055734_636141_1A1B0A0B 
X-CRM114-Status: UNSURE (   8.75  )
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

On Sun, Nov 03, 2024 at 09:36:55PM +0800, WangYuli wrote:
> Even though the narrower CRC instructions doesn't require GRLEN=64, they still *aren't* part of LA32 (LoongArch reference manual v1.10, Volume 1, Table 2-1).
> Link: https://lore.kernel.org/all/0a7d0a9e-c56e-4ee2-a83b-00164a450abe@xen0n.name/
> 
> Therefore, we could not directly add ARCH_HAS_CRC32 to config LOONGARCH.
> 

There's still a runtime CPU feature check of cpu_has(CPU_FEATURE_CRC32).
See arch/loongarch/lib/crc32-loongarch.c.  So it's the same as before.
ARCH_HAS_CRC32 just means that the file will be compiled.

If you're trying to say that you think this file should be built only when
CONFIG_64BIT=y, then that would be an existing bug since the existing file
arch/loongarch/crypto/crc32-loongarch.c was built for both 32-bit and 64-bit.
But if you think this is a bug, I can fix this too.

- Eric

