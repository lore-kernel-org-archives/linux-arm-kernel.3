Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06B5E68949
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 03:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JU5mWi+4xOc6kAhkGMfdVmB9NWczUXuOyU69dRDI3rw=; b=o+lETtVO+D8xcwMkiqjpGhCoIz
	Rw4EqUrf6FndeKZ4Z9GnGsCVdTGdsdiHr77OONwjgqSfr1RQJk3ROOcDKq/lkg/vroT1KV9omY2CO
	saMZZP2pj9uv0cDKKHWFt9U7aQ5EMCt7oqA9lAZH3SUvXqoP23El1gDPQVe+saxJTMjVc+0AC/JLl
	/OKo+odJ3+ZKHrkzULQUBOjr/q/uJLR9Hj7mdZBNrP07+KSAABZHi3+zlv61eHd91x/gQ9P1i+1FU
	QAcTa0NqJ1gMFAB0/RoQXsRmaueaK2OimdyQ+7NeifHIR0Zc/Ppo/q2+e19FgrbwT8hL0fTJo3taB
	TVvOAQyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6LVk-00000002Ow7-3HsR;
	Thu, 31 Oct 2024 03:06:12 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6LU6-00000002OqX-3Jme
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 03:04:32 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730343866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JU5mWi+4xOc6kAhkGMfdVmB9NWczUXuOyU69dRDI3rw=;
	b=RFgN+t8nlHdRDO7Tq3qufprYhgnhMTvP9uJxwNm982IprAiC5GQlbWBWkl4BP25LdZV/iq
	LNOFM4AAk3zcPkoKmyt5ymCo3aSylAhV2tGm+t1uuouHD+/jpAYrJjP10pV9NUhgpfqSXI
	tYCMRquzrIudpNJ6x+v9PpPbzwCWJys=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v5 00/37] KVM: arm64: Add EL2 support to FEAT_S1PIE/S1POE
Date: Thu, 31 Oct 2024 03:04:14 +0000
Message-ID: <173034380993.2566795.1591637584460232637.b4-ty@linux.dev>
In-Reply-To: <20241023145345.1613824-1-maz@kernel.org>
References: <20241023145345.1613824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_200431_200269_E6EC71E3 
X-CRM114-Status: UNSURE (   8.81  )
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

On Wed, 23 Oct 2024 15:53:08 +0100, Marc Zyngier wrote:
> This series serves a few purposes:
> 
> - Complete the S1PIE/S1POE support to include EL2
> - Sneak in the EL2 system register world switch
> 
> As mentioned in few of the patches, this implementation relies on a
> very recent fix to the architecture (D22677 in [0]).
> 
> [...]

Applied to kvmarm/next, thanks!

[01/37] arm64: Drop SKL0/SKL1 from TCR2_EL2
        https://git.kernel.org/kvmarm/kvmarm/c/d41571c7097a
[02/37] arm64: Remove VNCR definition for PIRE0_EL2
        https://git.kernel.org/kvmarm/kvmarm/c/5792349d0cce
[03/37] arm64: Add encoding for PIRE0_EL2
        https://git.kernel.org/kvmarm/kvmarm/c/4ecda4c67961
[04/37] KVM: arm64: Drop useless struct s2_mmu in __kvm_at_s1e2()
        https://git.kernel.org/kvmarm/kvmarm/c/a5c870d0939b
[05/37] KVM: arm64: nv: Add missing EL2->EL1 mappings in get_el2_to_el1_mapping()
        https://git.kernel.org/kvmarm/kvmarm/c/dfeb91686992
[06/37] KVM: arm64: nv: Handle CNTHCTL_EL2 specially
        https://git.kernel.org/kvmarm/kvmarm/c/164b5e20cdf6
[07/37] KVM: arm64: nv: Save/Restore vEL2 sysregs
        https://git.kernel.org/kvmarm/kvmarm/c/b9527b38c667
[08/37] KVM: arm64: Correctly access TCR2_EL1, PIR_EL1, PIRE0_EL1 with VHE
        https://git.kernel.org/kvmarm/kvmarm/c/14ca930d828b
[09/37] KVM: arm64: Extend masking facility to arbitrary registers
        https://git.kernel.org/kvmarm/kvmarm/c/a0162020095e
[10/37] arm64: Define ID_AA64MMFR1_EL1.HAFDBS advertising FEAT_HAFT
        https://git.kernel.org/kvmarm/kvmarm/c/9ae424d2a1ae
[11/37] KVM: arm64: Add TCR2_EL2 to the sysreg arrays
        https://git.kernel.org/kvmarm/kvmarm/c/69c19e047dfe
[12/37] KVM: arm64: Sanitise TCR2_EL2
        https://git.kernel.org/kvmarm/kvmarm/c/ad4f6ef0fa19
[13/37] KVM: arm64: Add save/restore for TCR2_EL2
        https://git.kernel.org/kvmarm/kvmarm/c/5055938452ed
[14/37] KVM: arm64: Add PIR{,E0}_EL2 to the sysreg arrays
        https://git.kernel.org/kvmarm/kvmarm/c/5f8d5a15ef5a
[15/37] KVM: arm64: Add save/restore for PIR{,E0}_EL2
        https://git.kernel.org/kvmarm/kvmarm/c/b3ad940a0887
[16/37] KVM: arm64: Handle PIR{,E0}_EL2 traps
        https://git.kernel.org/kvmarm/kvmarm/c/874ae1d48e60
[17/37] KVM: arm64: Sanitise ID_AA64MMFR3_EL1
        (no commit info)
[18/37] KVM: arm64: Add AT fast-path support for S1PIE
        https://git.kernel.org/kvmarm/kvmarm/c/23e7a34c8397
[19/37] KVM: arm64: Split S1 permission evaluation into direct and hierarchical parts
        https://git.kernel.org/kvmarm/kvmarm/c/4967b87a9ff7
[20/37] KVM: arm64: Disable hierarchical permissions when S1PIE is enabled
        https://git.kernel.org/kvmarm/kvmarm/c/5e21b2978722
[21/37] KVM: arm64: Implement AT S1PIE support
        https://git.kernel.org/kvmarm/kvmarm/c/364c081029a6
[22/37] KVM: arm64: Add a composite EL2 visibility helper
        https://git.kernel.org/kvmarm/kvmarm/c/ee3a9a0643c5
[23/37] KVM: arm64: Define helper for EL2 registers with custom visibility
        https://git.kernel.org/kvmarm/kvmarm/c/997eeecafeba
[24/37] KVM: arm64: Hide TCR2_EL1 from userspace when disabled for guests
        https://git.kernel.org/kvmarm/kvmarm/c/0fcb4eea5345
[25/37] KVM: arm64: Hide S1PIE registers from userspace when disabled for guests
        https://git.kernel.org/kvmarm/kvmarm/c/a68cddbe47ef
[26/37] KVM: arm64: Rely on visibility to let PIR*_ELx/TCR2_ELx UNDEF
        https://git.kernel.org/kvmarm/kvmarm/c/b4824120303f
[27/37] arm64: Add encoding for POR_EL2
        https://git.kernel.org/kvmarm/kvmarm/c/b9ed7e5dfbe9
[28/37] KVM: arm64: Drop bogus CPTR_EL2.E0POE trap routing
        https://git.kernel.org/kvmarm/kvmarm/c/b17d8aa20126
[29/37] KVM: arm64: Subject S1PIE/S1POE registers to HCR_EL2.{TVM,TRVM}
        https://git.kernel.org/kvmarm/kvmarm/c/f7575530df43
[30/37] KVM: arm64: Add kvm_has_s1poe() helper
        https://git.kernel.org/kvmarm/kvmarm/c/26e89dccdf63
[31/37] KVM: arm64: Add basic support for POR_EL2
        https://git.kernel.org/kvmarm/kvmarm/c/5970e9903f03
[32/37] KVM: arm64: Add save/restore support for POR_EL2
        https://git.kernel.org/kvmarm/kvmarm/c/de5c2827fb44
[33/37] KVM: arm64: Add POE save/restore for AT emulation fast-path
        https://git.kernel.org/kvmarm/kvmarm/c/846c993df982
[34/37] KVM: arm64: Disable hierarchical permissions when POE is enabled
        https://git.kernel.org/kvmarm/kvmarm/c/8a9b304d7e22
[35/37] KVM: arm64: Make PAN conditions part of the S1 walk context
        https://git.kernel.org/kvmarm/kvmarm/c/7cd5c2796cb0
[36/37] KVM: arm64: Handle stage-1 permission overlays
        https://git.kernel.org/kvmarm/kvmarm/c/e39ce7033c70
[37/37] KVM: arm64: Handle WXN attribute
        https://git.kernel.org/kvmarm/kvmarm/c/1c6801d565ec

--
Best,
Oliver

