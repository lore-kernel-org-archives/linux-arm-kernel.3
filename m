Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A615D42BA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 16:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N37ehf3PxYHYaLX8Up0WBX4OQOETNPGOn/gaWZlHqfg=; b=x2KpS7Z6i9XVoi1dsYPseiQ/6X
	nXcERTAbrXxlsaYyhJXxBplZVZisHrTlLvSoDnvpMJM4BfRucosV74vhE6Ftd1yoF6fOIldUp5C6Z
	YBkZRzXhmHDtPFSGeaOyHqtLCfvGNG0Qj/vR2rhW8Z90UNPZ6i9/32zR4mdcVxtKmGAM/qMYEbTep
	Gd5QWXHMmgThvBLUEczeLonfX1B2BspSkgx4fEAK9GF2lPMmbooeXjEXRRNqeIitgD6uCebwJ+xVr
	XNhsgEKf+6OAkycQWD5HDY0798B7/iDN9QkUFK6MCHDQlNzEF+vT62t1tKfuAWWpoFo0XhR1Gc6Hg
	Hj/J7+Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtaj-0000000473Y-07FG;
	Tue, 12 Nov 2024 16:18:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtQp-000000044zO-3MZT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 16:07:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DB68BA41E39;
	Tue, 12 Nov 2024 16:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD84C4CECD;
	Tue, 12 Nov 2024 16:07:52 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 0/3] kselftest/arm64: fp-ptrace enhancements
Date: Tue, 12 Nov 2024 16:07:34 +0000
Message-Id: <173142698242.893467.659853152392768670.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241112-arm64-fp-ptrace-fpmr-v2-0-250b57c61254@kernel.org>
References: <20241112-arm64-fp-ptrace-fpmr-v2-0-250b57c61254@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_080755_946480_FC74C930 
X-CRM114-Status: GOOD (  11.55  )
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

On Tue, 12 Nov 2024 13:08:13 +0000, Mark Brown wrote:
> This series contains a bit of a grab bag of improvements to the floating
> point tests, mainly fp-ptrace.  Globally over all the tests we start
> using defines from the generated sysregs (following the example of the
> KVM selftests) for SVCR, stop being quite so wasteful with registers
> when calling into the assembler code then expand the coverage of both ZA
> writes and FPMR (which was not there since fp-ptrace and the 2023 dpISA
> extensions were on the list at the same time).
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[1/3] kselftets/arm64: Use flag bits for features in fp-ptrace assembler code
      https://git.kernel.org/arm64/c/c0350076c13e
[2/3] kselftest/arm64: Expand the set of ZA writes fp-ptrace does
      https://git.kernel.org/arm64/c/7e9c5b00009a
[3/3] kselftest/arm64: Add FPMR coverage to fp-ptrace
      https://git.kernel.org/arm64/c/7dbd26d0b22d

-- 
Catalin


