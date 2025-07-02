Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111D5C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 18:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PV30rtIh3kmtgKuqYUvSSkibRY8I8jvASjBgIcI+kUE=; b=IaZoAxZlT5s7v47FBtc/chiLZ4
	wVBUTevghiyq8ZbD7yLvD4F+AfClUeGwvG5Rq3OFGo2OmCUka8wFrkzEqkcp7S22elv4a9D8aTGNp
	ggesMYanaM3Xjv0teNDysNGvE94oHJ/IbD1pJKpR/+MTPgxds5Mm4jrRl25ZXU3RzIR15A90FlPq6
	BAMQUMgjHhsfo1h2Be1s+ibWenV7ASVzOjp60szrhRy1Q1nSIf9MJbnUZURxQ9XSmK3s5ysY9Fume
	/VyA/tsacj7rulVrq0CBSiI2qWzkOFu6SXwmRXL/yqCr8SJirqti1hiVVeFQ6mQrXb3WEGhcBNKH2
	kjhzmydA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2MD-00000009IBV-06Ah;
	Wed, 02 Jul 2025 18:38:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2Hv-00000009HmA-0NyU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 18:34:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4CAF9A53257;
	Wed,  2 Jul 2025 18:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3510C4CEE7;
	Wed,  2 Jul 2025 18:34:25 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	hardevsinh.palaniya@siliconsignals.io,
	samuel.holland@sifive.com,
	palmer@rivosinc.com,
	charlie@rivosinc.com,
	thiago.bauermann@linaro.org,
	bgray@linux.ibm.com,
	tglx@linutronix.de,
	puranjay@kernel.org,
	david@redhat.com,
	yang@os.amperecomputing.com,
	mbenes@suse.cz,
	joel.granados@kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/8] support FEAT_MTE_STORE_ONLY feature
Date: Wed,  2 Jul 2025 19:34:23 +0100
Message-Id: <175148125054.2930777.8008346134199454923.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618092957.2069907-1-yeoreum.yun@arm.com>
References: <20250618092957.2069907-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_113431_202871_4CA1038F 
X-CRM114-Status: UNSURE (   9.72  )
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

On Wed, 18 Jun 2025 10:29:49 +0100, Yeoreum Yun wrote:
> ARMv8.5 based processors introduce the Memory Tagging Extension (MTE) feature.
> MTE is built on top of the ARMv8.0 virtual address tagging TBI
> (Top Byte Ignore) feature and allows software to access a 4-bit
> allocation tag for each 16-byte granule in the physical address space.
> A logical tag is derived from bits 59-56 of the virtual
> address used for the memory access. A CPU with MTE enabled will compare
> the logical tag against the allocation tag and potentially raise an
> tag check fault on mismatch, subject to system registers configuration.
> 
> [...]

Applied to arm64 (for-next/feat_mte_store_only), thanks!

[1/8] arm64/cpufeature: add MTE_STORE_ONLY feature
      https://git.kernel.org/arm64/c/33e943a22853
[2/8] prctl: introduce PR_MTE_STORE_ONLY
      https://git.kernel.org/arm64/c/b1fabef37bd5
[3/8] arm64/kernel: support store-only mte tag check
      https://git.kernel.org/arm64/c/4d51ff5bba00
[4/8] arm64/hwcaps: add MTE_STORE_ONLY hwcaps
      https://git.kernel.org/arm64/c/f620372209bf
[5/8] arm64/kvm: expose MTE_STORE_ONLY feature to guest
      https://git.kernel.org/arm64/c/7502bdb43aa2
[6/8] kselftest/arm64/abi: add MTE_STORE_ONLY feature hwcap test
      https://git.kernel.org/arm64/c/964a07426eb8
[7/8] kselftest/arm64/mte: preparation for mte store only test
      https://git.kernel.org/arm64/c/391ca7c81b85
[8/8] kselftest/arm64/mte: add MTE_STORE_ONLY testcases
      https://git.kernel.org/arm64/c/1f488fb91378

-- 
Catalin


