Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31ABD3EE96
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 17:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkKZJfMjTDB8lAw9IWYb+OaqA51WbP/wnidMObn3Nr0=; b=oYaDA1vIq2KViCRdDJ4mFfcRST
	5ybAurXk7I2XlvmxHVviBWhEIlpwYamTelmFZPQDYaw0AmbzHb0oGlsSzB1VVffwgo6pO4Am34Qqy
	2IQZS05ifQyHZbxDJShYVA5/fCs4QJLfd38UsAKCBbqTqY7Q0Cx8qzgo37uSv0CZKuCumvuuP/mFM
	zLTBZQo9TeJRW2bQGc1/0t+mcfEqV1ek+68XpF0X71/8t2jTYGpyrarZEFg7xDvIhxjwnH8Lh9RMT
	7UxsNJMOErfIFjT4aE2X3WrXS53aS9FaYagrluoIg9ZCvjBGi4vF32pwHfHh5RNnsFsRgZ863A7tj
	rdiPS72g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viy2X-00000007WGH-3Ny8;
	Thu, 22 Jan 2026 17:00:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viy2P-00000007WEF-2C94
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 17:00:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F1102600C3;
	Thu, 22 Jan 2026 17:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C66C116C6;
	Thu, 22 Jan 2026 17:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769101204;
	bh=p2U71IBNMwdMRbRUPojDVJ/6PrIbK24gx2RAKTiUKMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YhQwsgXIc9/1ZX1LAvCh8aGaYnxZJSOO233dLEO+B8AkFDZ9zqsw9ZZSUgOefPq+5
	 C0JUc9kd7p6Z+3qrq++YyBJuFwAHoYROx1OYRN3ZILCy2rqELNx/U/vuWTMIpD9Bfx
	 /Kbf9cAujOcgM1rwNaU/EC6HZwHSKYwh+knXhUtk2Qn2r/6Zgz41lMcmkh5hcJluIh
	 ImOD43sV4vDQNf2puB0/UY5lKFsu5jv2Wjt7za/2Mb3RgKIPOeg4jCFF/NiNb4XJOf
	 1Q1bRrpSdHfeBS6aCSC9wMs6GUOjkZ4NnWNkwUSBfnCQN01XNWEox0XtMDGfXDKFWw
	 8tcpV/krKXhBA==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] kselftest/arm64: Use syscall() macro over nolibc my_syscall()
Date: Thu, 22 Jan 2026 16:59:43 +0000
Message-ID: <176908087035.2055150.7814472104716413827.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260117-nolibc-mysyscall-arm64-v1-1-f70266a3db15@weissschuh.net>
References: <20260117-nolibc-mysyscall-arm64-v1-1-f70266a3db15@weissschuh.net>
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

On Sat, 17 Jan 2026 13:10:51 +0100, Thomas Weißschuh wrote:
> The my_syscall*() macros are internal implementation details of nolibc.
> Nolibc also provides the regular syscall(2), which is also a macro
> and directly expands to the correct my_syscall().
> 
> Use syscall() instead.
> 
> As a side-effect this fixes some return value checks, as my_syscall()
> returns the raw value as set by the kernel and does not set errno.
> 
> [...]

Applied to arm64 (for-next/selftests), thanks!

[1/1] kselftest/arm64: Use syscall() macro over nolibc my_syscall()
      https://git.kernel.org/arm64/c/2a369c494248

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

