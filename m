Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4796EC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 10:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5GWMgj/3amqdpBVWxSIsX0UzGsUbfcmm/WdWzaOR5mM=; b=k++Jr3lSDWDiuqk9w9I11QLsmX
	DuvOvfX0Bd/M/bZFKnDYitLJDNOyLw+6zwZ5e02ITSq/6TypT7WlPFDp5q8JiDeZ42qufGsV9RjbV
	KGevjNFvLjRkSasT2RdJmutWToqz5vQUl0OfSFI6ios7+69bTNOdqeAuBGIGqrfUeMAS+o98Qiv9D
	g4TpZUBu+qO11AxbFXQlV1EfFqzG2JeThC7PpLQlnAnp2AZJFSDaAad9JAz6B5iKiEr/udNKG9tpB
	RaHkK4Hdq5J4TCpws3j6jLOUePOovecAa71YnUTxSnruGxfjcFLaypycDsmSXg5N5TGM7YEOK9FBA
	+mgs4LoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCc9U-0000000F81N-1T7j;
	Wed, 07 May 2025 10:37:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCc7W-0000000F7kw-2bRz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 10:35:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DF80743768;
	Wed,  7 May 2025 10:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2307C4CEE7;
	Wed,  7 May 2025 10:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746614121;
	bh=C42TwOzo4bEYHYaWCns3jFUDVHKAdqG/MYS13QYBCAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=quH70Q9Fpoe9vAziyUtIBxQQtxnGpYfbU6W/Eirh09Tjozp544MEEIwc3HkLxjgV2
	 Lw7lITivj0HEGdf/mp9ZcZaxzGBdP8eboO50fRe3YrGaAFZUnz2CASP0N3BCr4noSs
	 ZxLIta2lC0oGZHTAzym8G0Ch+qZPrboV6sjEQpHIkKuLtQP/822WW9vlr1v5M6/VwT
	 pqSbEthg5ytcaacEqU++prwb0MNRQutN4BQI0Ra8vPhIADzNAr7LCa3CszncwaQwf0
	 21nIG2zwDWI9PO2SFG0Tep1s+UnE/HFk7450PhNVQgmhGU9idWpIvG6YZagXHSd15s
	 NlgN/n3U/arhw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCc7T-00CZoF-93;
	Wed, 07 May 2025 11:35:19 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mostafa Saleh <smostafa@google.com>
Cc: will@kernel.org,
	oliver.upton@linux.dev,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	kees@kernel.org,
	elver@google.com,
	andreyknvl@gmail.com,
	ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org,
	yuzenghui@huawei.com,
	suzuki.poulose@arm.com,
	joey.gouly@arm.com,
	masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas.schier@linux.dev
Subject: Re: [PATCH v2 0/4] KVM: arm64: UBSAN at EL2
Date: Wed,  7 May 2025 11:35:13 +0100
Message-Id: <174661410588.354102.12581614598575589637.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250430162713.1997569-1-smostafa@google.com>
References: <20250430162713.1997569-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, smostafa@google.com, will@kernel.org, oliver.upton@linux.dev, broonie@kernel.org, catalin.marinas@arm.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, kees@kernel.org, elver@google.com, andreyknvl@gmail.com, ryabinin.a.a@gmail.com, akpm@linux-foundation.org, yuzenghui@huawei.com, suzuki.poulose@arm.com, joey.gouly@arm.com, masahiroy@kernel.org, nathan@kernel.org, nicolas.schier@linux.dev
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_033522_703667_4BBC7228 
X-CRM114-Status: GOOD (  14.57  )
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

On Wed, 30 Apr 2025 16:27:07 +0000, Mostafa Saleh wrote:
> Many of the sanitizers the kernel supports are disabled when running
> in EL2 with nvhe/hvhe/proctected modes, some of those are easier
> (and makes more sense) to integrate than others.
> Last year, kCFI support was added in [1]
> 
> This patchset adds support for UBSAN in EL2.
> UBSAN can run in 2 modes:
>   1) “Normal” (CONFIG_UBSAN_TRAP=n): In this mode the compiler will
>   do the UBSAN checks and insert some function calls in case of
>   failures, it can provide more information(ex: what is the value of
>   the out of bound) about the failures through those function arguments,
>   and those functions(implemented in lib/ubsan.c) will print a report with
>   such errors.
> 
> [...]

Applied to next, thanks!

[1/4] arm64: Introduce esr_is_ubsan_brk()
      commit: dc1fd37a7f501731e488c1c6f86b2f591632a4ad
[2/4] ubsan: Remove regs from report_ubsan_failure()
      commit: d683a8561889c1813fe2ad6082769c91e3cb71b3
[3/4] KVM: arm64: Introduce CONFIG_UBSAN_KVM_EL2
      commit: 61b38f7591fb434fce326c1d686a9793c7f418bc
[4/4] KVM: arm64: Handle UBSAN faults
      commit: 446692759b0732ef2d9a93b7e6730aa762ccf0ab

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



