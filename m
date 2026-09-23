Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E810C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31m4kBtJG53TQrTG7hqGBHSkyJ+L7gUId4Fv9o7IGTU=; b=2E2asG5RFBeZVoru3vxB2CVERh
	fQE/Y/lWUTgyAHY88RUx+A7d0CfYbOjpQRoqCyJ8s4AZdtF61ypVFkFpE+IAYlCtQn0BqM7UlbcMB
	ETe2jq02Km3VWw0Vkpj5T1S5Y+AE5is7DSvPHP9bLH8YPE3g8au2Yz8Ts+blD251gSyBux++aThq9
	JnqR5GCm4Z2gqkx+sxYwwx/3hYpUJxVzC/qRiZtb9gxlL8aQWnnBbPs2+MZX0BFPQq6nnJI1YwHuc
	TrC1QHfJXzKRALkjWsdeWVqng0BpRW51+mN6M6G02//KEWMwPCi88agZqeYKQ/oanDQ0/FMSpOCbw
	d751dzJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RZA-00000009AEs-2gq5;
	Wed, 23 Sep 2026 18:19:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RZ8-00000009AER-0iSE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:19:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 817E71476;
	Wed, 23 Sep 2026 11:19:28 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80D7A3F632;
	Wed, 23 Sep 2026 11:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790187572; bh=k27GcWWMkRGuBaHvtiyzVovjQZNu7zMzILjuwfvM2gw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qr0vlXDy/+n98St+Rw1mAZvR39IHvW9vAVDGs3QPXPOaf2X5wr0HajtLEnwzcv3Fi
	 0v6WV9/U6WkhKydtNcr2BMCgeCUaPAZ22SdZcanPaJIog4zh1Fh6HWefSKssPMs9sI
	 tv5KQWI9rBv0Lgo1jL7BnkBpOKxlkENr8BeYFa74=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v3 00/14] arm64: Remove unused big-endian support
Date: Wed, 23 Sep 2026 19:18:43 +0100
Message-ID: <179018752374.2942518.17477333903673435626.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918145217.1669-1-will@kernel.org>
References: <20260918145217.1669-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_111934_249436_DC941AB7 
X-CRM114-Status: GOOD (  10.41  )
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

On Fri, 18 Sep 2026 15:52:02 +0100, Will Deacon wrote:
> This is version three of the big-endian removal series previously posted
> here:
> 
> v1: https://lore.kernel.org/r/20260811140132.22778-1-will@kernel.org/
> v2: https://lore.kernel.org/r/20260907163726.17104-1-will@kernel.org
> 
> Changes since v2 include:
>   * Retain support for emitting absolute symbol references with PIE
>   * Retain endianness handling on EFI MMU-enabled boot path
>   * Invert compile-time endianness check in Hisilicon sec2 driver
>   * Added some tags
> 
> [...]

Applied to arm64 (for-next/be-gone), thanks!

I added a patch before 12 to allow GVE on arm64, as discussed offline.

[01/13] selftests/arm64: Remove big-endian support
        https://git.kernel.org/arm64/c/97c1757db39d
[02/13] arm64: bpf: Remove big-endian support from the JIT compiler
        https://git.kernel.org/arm64/c/883247de6500
[03/13] arm64: crypto: Assume a little-endian kernel
        https://git.kernel.org/arm64/c/2768ccadc1b4
[04/13] arm64: lib: Assume a little-endian kernel in custom library routines
        https://git.kernel.org/arm64/c/42b69efd3418
[05/13] arm64: lib: Assume a little-endian kernel in optimised string routines
        https://git.kernel.org/arm64/c/fcec2a198957
[06/13] arm64: assembler: Remove endianness helper macros
        https://git.kernel.org/arm64/c/6a1aeecf3db9
[07/13] arm64: vdso32: Always build compat vDSO object as little-endian
        https://git.kernel.org/arm64/c/b8409b9eb74d
[08/13] KVM: arm64: Remove support for a big-endian hypervisor object
        https://git.kernel.org/arm64/c/9afaed358394
[09/13] arm64: Remove all usage of CONFIG_CPU_BIG_ENDIAN
        https://git.kernel.org/arm64/c/eab76a8e1880
[10/13] arm64: Remove all usage of __AARCH64EB__
        https://git.kernel.org/arm64/c/e93a371bb49f
[11/13] crypto: hisilicon/sec2: Remove check of CONFIG_CPU_LITTLE_ENDIAN
        https://git.kernel.org/arm64/c/bbce799407f9
[12/13] arm64: Kbuild: Remove vestigial big-endian support
        https://git.kernel.org/arm64/c/134b0fbc5c24
[13/13] drivers: Kconfig: Simplify dependencies on ARM64 && !CPU_BIG_ENDIAN
        https://git.kernel.org/arm64/c/d80ff69c9a37

