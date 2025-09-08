Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7630DCA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 19:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YC5WyR/0pHBGYN1nLq3nwS1skDVZEaBbuR/oWhp1n8=; b=IQGcYJ4b79urGrpubS3lfXThFh
	20pH601eUkiScJAOOg77yD8QLw+Y6u8OMaUx6FYaQjXRDH66w1rN+DZeAGFaBsl+hACBdlF0fkMXV
	cK6KNBW/PSJkDXbwJ9WisIbwzhC3A7f0dRMVirZhkhAiVEq7W3/7jVTnrStVJuHCSOl2+7OX12TjZ
	hlhG8gmx65wLDGFZPOjzJYsW1FMbqlxrH+M9dBgYOqAzrbe/EFGn3eNfvFbm7nEP77C/JrZU969rL
	Tmuid+XYEijhmjE5FMoEFcxZQ3/+XY2/Op7CpknKjyBjKGbeDE2AtmGLKDAp0ERry9cLTN5y/k1GP
	dIKdHTHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhO7-00000001q66-3CGB;
	Mon, 08 Sep 2025 19:18:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uveDi-00000000aqo-1Zc7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 15:55:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C8D6660054;
	Mon,  8 Sep 2025 15:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C017C4CEF7;
	Mon,  8 Sep 2025 15:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757346953;
	bh=lLhbPcuccrh2iWdqlw6avv6jjc/4//fhsw+RixeJ94U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NuYrAMMWtM7HuqBx808w83itr50EZcctk4Z/E20AFT532ebIk+lM3pt3v2BLIX97h
	 nGkjP55Np3GxsQFYZuo+tzXv9PPcTAg0AnK5pWBpSk9PY9JbJ7VMvF/fzTMq4UI8MX
	 cg7+x9gVmMIx9r26sDTGcZXsu19HbNLkaDharc81foxF0Hq3+2OFSgDIL/bMhHuYpU
	 a23RpTdGvgohZIueqDgVqZMcQbz0QHfo8QW7lUgnjpHZDL1EWcLyvzZpz6ai7ll1SX
	 /5/0u0/Q/lT8pQ0UW7fUbG3BYQSUB8/RUhnsNOvJqL5d3xHBzuTVitCHyB7kHuJ4/r
	 A/AtuSdVXWUVA==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Andy Lutomirski <luto@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	John Stultz <jstultz@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: uapi: Provide correct __BITS_PER_LONG for the compat vDSO
Date: Mon,  8 Sep 2025 16:55:32 +0100
Message-Id: <175734490190.158300.1463560749148120421.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250821-vdso-arm64-compat-bitsperlong-v1-0-700bcabe7732@linutronix.de>
References: <20250821-vdso-arm64-compat-bitsperlong-v1-0-700bcabe7732@linutronix.de>
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

On Thu, 21 Aug 2025 09:56:43 +0200, Thomas Weißschuh wrote:
> The generic vDSO library uses the UAPI headers. On arm64 __BITS_PER_LONG is
> always '64' even when used from the compat vDSO. In that case __GENMASK()
> does an illegal bitshift, invoking undefined behaviour.
> 
> The first patch should go into the 6.17 tree.
> 
> 
> [...]

Applied to arm64 (for-next/vdso), thanks!

[2/3] arm64: vdso32: Stop suppressing warnings
      https://git.kernel.org/arm64/c/80c4e1948908
[3/3] arm64: vdso32: Respect -Werror from kbuild
      https://git.kernel.org/arm64/c/281817dffe28

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

