Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07516D42BA2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 16:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Imv7zoQ5hKuqdS5Rdx1MXW+cfyZXMkbl7fXrLo/Vo+4=; b=ZJ/UVx9uOrqVzy41Wg3xVwHAjJ
	LIa1n9fMAxhFZ5xMAKm4GtiVF5ipJs+rwVj0jaumUYe03JZtcyvhNDEx2Vd8qAeoGDHXrkFflF2DR
	6gsEIvkPqJ2N9z47DRd6VJMO1BRTCa+pMajW7s2apsyjmC5R7Bi/WjXkRGWHwLvZZSOONqfWGWTKE
	rMkueIzhUYLBl881ImQj/8Wj/OY1m5qj5RnmY6bhlxgKI5PnSI72bioR+XvOjZW8Dut1Q8tavYmvh
	8d9Rcuo+mERH+c9uWhgnWuBQ4KpnCIB+wwLIUko7AB0yS8HuZ+TCeAgh9qh7c6BinXYXyoxRUftS0
	04vd+0FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtXB-000000046IK-37iU;
	Tue, 12 Nov 2024 16:14:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtQl-000000044x6-16Mo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 16:07:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E61815C563E;
	Tue, 12 Nov 2024 16:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C1DC4CEDA;
	Tue, 12 Nov 2024 16:07:45 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] kselftest/arm64: Enable build of PAC tests with LLVM=1
Date: Tue, 12 Nov 2024 16:07:32 +0000
Message-Id: <173142698242.893467.5720909659251120583.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241111-arm64-selftest-pac-clang-v1-1-08599ceee418@kernel.org>
References: <20241111-arm64-selftest-pac-clang-v1-1-08599ceee418@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_080751_433222_F1844631 
X-CRM114-Status: GOOD (  11.95  )
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

On Mon, 11 Nov 2024 18:32:58 +0000, Mark Brown wrote:
> Currently we don't build the PAC selftests when building with LLVM=1 since
> we attempt to test for PAC support in the toolchain before we've set up the
> build system to point at LLVM in lib.mk, which has to be one of the last
> things in the Makefile.
> 
> Since all versions of LLVM supported for use with the kernel have PAC
> support we can just sidestep the issue by just assuming PAC is there when
> doing a LLVM=1 build.
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[1/1] kselftest/arm64: Enable build of PAC tests with LLVM=1
      https://git.kernel.org/arm64/c/c297aa7d3fb6

-- 
Catalin


