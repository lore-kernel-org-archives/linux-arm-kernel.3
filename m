Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D809BF364A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 18:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M26QCs6HwhTFfZyBSXEz5xqMjxxOGhDwHNJ/iaMfG2I=; b=f9HvzSJoaZh88LB3b47fgplURH
	Qav4hVzw7vT3xJP/RHlYGj/gagxoP7NIRes7uIPq1+UdM+Isg3NqgQ3sF6Kq16PAEf+F3vsoS608z
	USKEF8mHnk6XlL0b14UzclvrWJJLjRykhsqaL2OAqWz5dqMayt0Rp/caIdoF9sXIZknh8vUb23flP
	5WE0btLJ74wcI9JtuPaLQw3O8Krog2z2YYQKcgklmNlcUd6Ztkudf8sAw5oUo6j6o0zpbVpD4QiGf
	pIe16TbIjAVlNO6j1F/H6nRAxEE79z6fhiGc4GPpnky+5WyCwkgv6Wq0gt8GCXUHPzAhibABCBZ3L
	XroGGWNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAuF1-0000000B6Ek-0M7P;
	Thu, 09 Apr 2026 18:36:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAuEy-0000000B6EC-0q0x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 18:36:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E35416F3;
	Thu,  9 Apr 2026 11:36:24 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AFC83FAF5;
	Thu,  9 Apr 2026 11:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775759790; bh=vhaTaS+I0ispCPoVsE0c6h4Z/axqbsHv07VodjiFYds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gcOFdvwoN1UmteXI/cDb4y9h1sxDsg847QlQiRGkj1TNEMD9/efui7tbWdMR85Cmr
	 DKVohDJdtYaMCXoadaIehRHCSb+gm7nMxpJrf1t8jxDdiIBSnER4relRqJlsQcAVXW
	 hApYiqqUcuGPD76n18LGDZfRqKePYx7XTMi2WqKM=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: (subset) [PATCH 0/8] arm64: Implement support for 2025 dpISA extensions
Date: Thu,  9 Apr 2026 19:35:02 +0100
Message-ID: <177575970227.3883927.939712260390088306.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
References: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_113632_299338_82BD7FDB 
X-CRM114-Status: GOOD (  11.00  )
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

On Mon, 02 Mar 2026 22:53:15 +0000, Mark Brown wrote:
> The 2025 dpISA extensions introduce a number of architecture features
> all of which are fairly straightforward from a kernel point of view
> since they only introduce new instructions, not any architecture state.
> 
> All the relevant newly added ID registers are already exported by KVM,
> all non-RES0 bits in ID_AA64ZFR0_EL1 and ID_AA64FPFR0_EL1 are writable
> and the updates to ID_AA64ISARx_EL1 are all additional values in already
> exported bitfields.
> 
> [...]

Applied to arm64 (for-next/sysreg), thanks! That's only the sysreg
definitions as these are stable. I also applied the KERNEL_HWCAP_*
generation on a different branch.

[2/8] arm64/sysreg: Update ID_AA64ISAR0_EL1 description to DDI0601 2025-12
      https://git.kernel.org/arm64/c/b964aa8d68f7
[3/8] arm64/sysreg: Update ID_AA64ISAR2_EL1 description to DDI0601 2025-12
      https://git.kernel.org/arm64/c/bb5e1e540501
[4/8] arm64/sysreg: Update ID_AA64FPFR0_EL1 description to DDI0601 2025-12
      https://git.kernel.org/arm64/c/d74576b51ba6
[5/8] arm64/sysreg: Update ID_AA64ZFR0_EL1 description to DDI0601 2025-12
      https://git.kernel.org/arm64/c/bf56250f34a4
[6/8] arm64/sysreg: Update ID_AA64SMFR0_EL1 description to DDI0601 2025-12
      https://git.kernel.org/arm64/c/306736fd5155

