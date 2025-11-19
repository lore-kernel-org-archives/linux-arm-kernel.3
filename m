Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71ACCF58C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 19:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1UZvPPdbLe4P3hUEz9EiujTQt9HWJyDm/U3LZSIElA=; b=Hg/qbxQy+qRPFfQPb/QauqSQRI
	/PkdeSPp6u0MZI5zq59GWCpsqOa/CeYCiXn8aikRDkvIV+7v7x1ClO4TxlNsZBR2C9mR8BnEeUiKA
	bted8hnr++3ZPQsphNVWMuLWT3lW7PkmrNzQn3LSwMkr7G7q1x0rQw1cdE2LCkDVS1ZJqDKwcPbO+
	gLRdFX+GvAZ7sxZ05r/cnzBCQ3Xn2vjwcLsW9bFseqW4Opbu3s1HDngeeFLqzUPpz1LHy5pOcsoQg
	rz/ssVwG1TQyrcyZTxUorh0x/8IkFnV5c8XdpyzYva9CD+Itp2RO5X1UdMYyKGE7QZcrHkdSbPxte
	BRpJFAFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLngm-00000004xLN-0eP1;
	Wed, 19 Nov 2025 19:18:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLngh-00000004xIq-3dLz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 19:17:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 37B39401FF;
	Wed, 19 Nov 2025 19:17:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0543BC4CEF5;
	Wed, 19 Nov 2025 19:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763579875;
	bh=JQi84GrjRxDal74Vn3H2ScBlsWz6XMmDJZX90zdNxjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RBAss/d1aX9jIqZ4mGzPS2rYQglhv84BKwKHTuQkOgX+0T3huSIkFimS5mZjCQbHV
	 aWZWYvEnJ6P7tauFGFkU9a3StwzbH063dzVu/D6yEHmOVWcm849oCDwVgXvzVgkxP5
	 WRUyOkb77m43TAdKvkIW5Yuh4jW0pVk5sOJwiH7SKeAYS7eblseFHqRdENyjR7jp/a
	 eDSUAT4kxf2kLH4w/yPGuk2fsLYone4iUgfKnrsuDlwmcZ0Z5/VnVkvBpUHdwlmvmc
	 PTBWbBIkdSK6pCrBTR0FoOBdVOG6bWCOq2AEVJQ1J/ZDq8dqSL+QJ5jLWAn69zeEhm
	 HimCnimqKcTKQ==
From: Catalin Marinas <cmarinas@kernel.org>
To: james.morse@arm.com,
	Ben Horgan <ben.horgan@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	bobo.shaobowang@huawei.com,
	carl@os.amperecomputing.com,
	dakr@kernel.org,
	dave.martin@arm.com,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gregkh@linuxfoundation.org,
	gshan@redhat.com,
	guohanjun@huawei.com,
	jeremy.linton@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org,
	peternewman@google.com,
	quic_jiles@quicinc.com,
	rafael@kernel.org,
	robh@kernel.org,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	sudeep.holla@arm.com,
	tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com,
	reinette.chatre@intel.com,
	David Hildenbrand <david@kernel.org>
Subject: Re: [PATCH v6 00/34] arm_mpam: Add basic mpam driver
Date: Wed, 19 Nov 2025 19:14:52 +0000
Message-ID: <176357969271.2096121.17612291613784127358.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251119122305.302149-1-ben.horgan@arm.com>
References: <20251119122305.302149-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_111757_038456_591213C7 
X-CRM114-Status: GOOD (  17.11  )
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

From: Catalin Marinas <catalin.marinas@arm.com>

On Wed, 19 Nov 2025 12:22:30 +0000, Ben Horgan wrote:
> Just a handful of minor changes based on v5 review comments. See individual
> patches for change lgos. I haven't asked James to host any branches for this
> revision but please let me know if this would be helpful to anyone. Thanks for
> all the help with reviews and testing.
> 
> Previous cover letter from James:
> 
> [...]

I queued the series on a branch to give it a bit of exposure in -next
for the next 10 days or so. If nothing falls apart, it should go
upstream but there's always a risk of the series being dropped at short
notice. I aim to keep the branch stable and only apply fixups on top if
needed.

Greg, I haven't got any acks from you, I assume you don't have any
objections (please let me know otherwise).

Applied to arm64 (for-next/mpam), thanks!

[01/34] ACPI / PPTT: Add a helper to fill a cpumask from a processor container
        https://git.kernel.org/arm64/c/796e29b857ae
[02/34] ACPI / PPTT: Stop acpi_count_levels() expecting callers to clear levels
        https://git.kernel.org/arm64/c/eeec7845e966
[03/34] ACPI / PPTT: Add acpi_pptt_cache_v1_full to use pptt cache as one structure
        https://git.kernel.org/arm64/c/cfc085af8398
[04/34] ACPI / PPTT: Find cache level by cache-id
        https://git.kernel.org/arm64/c/41a7bb39fede
[05/34] ACPI / PPTT: Add a helper to fill a cpumask from a cache_id
        https://git.kernel.org/arm64/c/a39a723a6f1e
[06/34] arm64: kconfig: Add Kconfig entry for MPAM
        https://git.kernel.org/arm64/c/d8bf01d80919
[07/34] platform: Define platform_device_put cleanup handler
        https://git.kernel.org/arm64/c/f5915600cc4c
[08/34] ACPI: Define acpi_put_table cleanup handler and acpi_get_table_pointer() helper
        https://git.kernel.org/arm64/c/96f4a4d53e66
[09/34] ACPI / MPAM: Parse the MPAM table
        https://git.kernel.org/arm64/c/115c5325beae
[10/34] arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate
        https://git.kernel.org/arm64/c/f04046f2577a
[11/34] arm_mpam: Add the class and component structures for firmware described ris
        https://git.kernel.org/arm64/c/01fb4b822472
[12/34] arm_mpam: Add MPAM MSC register layout definitions
        https://git.kernel.org/arm64/c/aa64b9e11051
[13/34] arm_mpam: Add cpuhp callbacks to probe MSC hardware
        https://git.kernel.org/arm64/c/8f8d0ac1da78
[14/34] arm_mpam: Probe hardware to find the supported partid/pmg values
        https://git.kernel.org/arm64/c/bd221f9f82af
[15/34] arm_mpam: Add helpers for managing the locking around the mon_sel registers
        https://git.kernel.org/arm64/c/d02beb06ca2a
[16/34] arm_mpam: Probe the hardware features resctrl supports
        https://git.kernel.org/arm64/c/8c90dc68a5de
[17/34] arm_mpam: Merge supported features during mpam_enable() into mpam_class
        https://git.kernel.org/arm64/c/c10ca83a7783
[18/34] arm_mpam: Reset MSC controls from cpuhp callbacks
        https://git.kernel.org/arm64/c/f188a36ca241
[19/34] arm_mpam: Add a helper to touch an MSC from any CPU
        https://git.kernel.org/arm64/c/475228d15dd6
[20/34] arm_mpam: Extend reset logic to allow devices to be reset any time
        https://git.kernel.org/arm64/c/3bd04fe7d807
[21/34] arm_mpam: Register and enable IRQs
        https://git.kernel.org/arm64/c/49aa621c4dca
[22/34] arm_mpam: Use a static key to indicate when mpam is enabled
        https://git.kernel.org/arm64/c/3796f75aa795
[23/34] arm_mpam: Allow configuration to be applied and restored during cpu online
        https://git.kernel.org/arm64/c/09b89d2a72f3
[24/34] arm_mpam: Probe and reset the rest of the features
        https://git.kernel.org/arm64/c/880df85d8673
[25/34] arm_mpam: Add helpers to allocate monitors
        https://git.kernel.org/arm64/c/c891bae66423
[26/34] arm_mpam: Add mpam_msmon_read() to read monitor value
        https://git.kernel.org/arm64/c/823e7c3712c5
[27/34] arm_mpam: Track bandwidth counter state for power management
        https://git.kernel.org/arm64/c/41e8a14950e1
[28/34] arm_mpam: Consider overflow in bandwidth counter state
        https://git.kernel.org/arm64/c/b35363793291
[29/34] arm_mpam: Probe for long/lwd mbwu counters
        https://git.kernel.org/arm64/c/fdc29a141d63
[30/34] arm_mpam: Use long MBWU counters if supported
        https://git.kernel.org/arm64/c/9e5afb7c3283
[31/34] arm_mpam: Add helper to reset saved mbwu state
        https://git.kernel.org/arm64/c/201d96ca4c86
[32/34] arm_mpam: Add kunit test for bitmap reset
        https://git.kernel.org/arm64/c/e3565d1fd4dc
[33/34] arm_mpam: Add kunit tests for props_mismatch()
        https://git.kernel.org/arm64/c/2557e0eafec1
[34/34] MAINTAINERS: new entry for MPAM Driver
        https://git.kernel.org/arm64/c/ce1e1421f8d8

-- 
Catalin


