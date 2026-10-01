Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122F5CA5FD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8mhUdALf68ZLZyoYPR1latUAnqfrCDXB2hItp/7ays=; b=JkTk2zlBmqGbeh6tEM9omO5nLK
	4wF/5bDMtbxvPWe7bVbR1M80aQ5lTPQ+LgU7kncmYsAptVDFAHKRXGBMVWGzrCVUd5ylxhFxOYqrI
	XC9HPHOczzTNr+uwlR2JpuT/Jri6CDQprZYXX2d6cauoR77eNfTGAmJ1bPaTQfemDsrWgKNwNX0FG
	Ivw0C9gzdyHq0a6cGnf2u/8y/TzEhAn/096lTO/k/yeFcSYeDsFqXt0XnOkjIs8i5fQfk2YhNc3KB
	rlsn/QRrexliy+bqxWgdtJpM3dRv7T1vXjyR7R4Z5zyFp9BKLX5pkJz/NaK4CMiDxP43g7s7k2oK+
	LbMoQ1uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJPI-00000009fdm-0SM1;
	Thu, 01 Oct 2026 16:13:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJPF-00000009fdF-1PqF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 16:13:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A21E0497;
	Thu,  1 Oct 2026 09:13:08 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A23F3F85F;
	Thu,  1 Oct 2026 09:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790871192; bh=0cqJO1i8WSHNskeho44J8qRuYt033EnjtqI998xdVLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DCCcMtQy/wkDs/2F6eLa0NNzINJKgwlyP1VAk0K+TObn28mjmbiGmgHFgvKcIi8dB
	 T2hZQVCrVIRPwI+uir9LnRmql0HhMfI/sAmU2AW41HsLaHtBiXbSnGL+sErlMm791l
	 8nhhbu0fm1G+hPkSbgFB2hEE0ygrfpDvFTMwSpeM=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Xi Ruoyao <xry111@xry111.site>,
	Marc Zyngier <maz@kernel.org>,
	Bradley Morgan <brads@mainlining.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: mpam: Document when to set arm64.nompam
Date: Thu,  1 Oct 2026 17:12:33 +0100
Message-ID: <179087115295.1106801.13408508563792829779.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260908145622.2828319-1-fuad.tabba@linux.dev>
References: <20260908145622.2828319-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_091313_823050_7FB8E169 
X-CRM114-Status: GOOD (  11.81  )
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

On Tue, 08 Sep 2026 15:56:22 +0100, Fuad Tabba wrote:
> arm64.nompam skips the MPAM2_EL2 and MPAMHCR_EL2 writes in
> finalise_el2_state and leaves the ARM64_MPAM cpucap unset. Where EL3
> firmware has cleared MPAM3_EL3.TRAPLOWER, the EL2 trap controls are
> left unwritten, at reset values that are UNKNOWN, and KVM still hides
> MPAM from the guest but no longer enables the traps that stop a guest
> from using it. KVM never saves or restores MPAM0_EL1, MPAM1_EL1 and
> MPAMSM_EL1, so what one guest writes reaches the next guest and the
> host. Nor can the kernel make the EL2 writes unconditionally: they trap
> to EL3 on the firmware the option exists for, and TRAPLOWER cannot be
> read below EL3.
> 
> [...]

Applied to arm64 (for-next/mpam), thanks!

[1/1] arm64: mpam: Document when to set arm64.nompam
      https://git.kernel.org/arm64/c/eb0fde98fee4

(and this wasn't a pure mpam patch, should have picked it directly ;))

