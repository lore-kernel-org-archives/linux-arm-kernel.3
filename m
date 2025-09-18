Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24A4CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 11:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCt28Hl1d1yAQvcP+HSxWneHj3GqV+GLJ6lHGDVlH4A=; b=S/ijtyfQGO9ht0nfZVEDu4m0dG
	G2dCTE6XmaatLlOWWwtB2NWoiukUFMKttR+YPUy5aKcDUFRa/Hr/QHo/TFMZnHNxjlmBS3Chi/K+P
	T5CwA+aulaPLV2S6nRfvEXOk0BRuPPiyZQTzfb+/1REprZftZd1ZRthRomiFb3CLHoSIbrraxlobA
	GYcWdZKHlEknkiwgzxRSm6/cCxYxhdZHkbxf0vKBEr6+12oHZAfqXl6QHV7vhg5IsVAVPud1pbkxq
	pyW9nPgjKPLrcwN0P9BgIQcy1b4TZU0co7SJ7jPkCToKd0r9etQiou4prmj8iSvC7xPEeXDJWtdv8
	0WviVRKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCTa-0000000HB1l-0YqX;
	Thu, 18 Sep 2025 11:06:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCTY-0000000HB1b-3Uvc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 11:06:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E9F660207;
	Thu, 18 Sep 2025 11:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C330FC4CEEB;
	Thu, 18 Sep 2025 11:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758193615;
	bh=NpAPPFF/yuRMT+fZ+lNvZK5IuyxseW1m/ZM8WE7yyA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jxDjo7Dlh4cat8V+DFX0tGwOab5YO0Mq5EbhkpwO8jTQm6fF0LCFC4v+NZspjwsXp
	 G4FQUB6OOg+LGgkFU65eRPlJ4/xm41JkDMkBcQQMOSHgVLsckbToTS6L1PeOjYnfsw
	 mxqtfoYVA2YqYapAih3FT4fR6g5/zOeVsRWEOEa5BlFA/V4Fp15MMg9UjGrkbllJw4
	 pydcRWePrPjMSXj2uupkY4lZcJpYkeweVSi0LWDo/kh5V/chKnv0xFuSOiIT+V9ZYV
	 MIGfrTt4ZV8+8cic9+L5iPB0FpeFOkCsOgqWa+T9Hyb0MaqJgsM7bicBBOMYxI+SfW
	 rrQN+cHXmZelw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: [PATCH] kselftest/arm64/gcs/basic-gcs: Respect parent directory CFLAGS
Date: Thu, 18 Sep 2025 12:06:36 +0100
Message-Id: <175812312276.1711921.12702494152718461208.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250916-arm64-gcs-nolibc-v1-1-ee54aa65fc26@weissschuh.net>
References: <20250916-arm64-gcs-nolibc-v1-1-ee54aa65fc26@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 16 Sep 2025 18:51:35 +0200, Thomas Weißschuh wrote:
> basic-gcs has it's own make rule to handle the special compiler
> invocation to build against nolibc. This rule does not respect the
> $(CFLAGS) passed by the Makefile from the parent directory.
> However these $(CFLAGS) set up the include path to include the UAPI
> headers from the current kernel.
> Due to this the asm/hwcap.h header is used from the toolchain instead of
> the UAPI and the definition of HWCAP_GCS is not found.
> 
> [...]

Applied to arm64 (for-next/selftests), thanks!

[1/1] kselftest/arm64/gcs/basic-gcs: Respect parent directory CFLAGS
      https://git.kernel.org/arm64/c/5b7bdc4402b1

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

