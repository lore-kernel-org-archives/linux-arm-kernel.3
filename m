Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9152E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 09:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZKUG8/7+vJ4CurxMusMNyHDShZvXwj62eE8NC9Ca7Q=; b=esxYc2q14AwXQgjKFxEZ1x+wY/
	h106/UuwvV9A83laCQaSc0VMLKoKLvP7dlnIZpE+x+juZMBHfKbO3U/Xk5xU/hWy3UDZ2jEJ7+qv7
	NCwMWud874shxQIWsHpT7aCydghfih/SXNWWrhQ785JqjUWFQWVKT64UXWQQcGp33k1vnMy8w4Zdp
	NzhRYFEf7GjIR+balG0Mxgh672XMBRHWESMGtvEnav2sfRikbzABt8RKeKoKVWMVg1apqE7fFlsRq
	gX4/GH6ElHgftsaVQeu8h01DwU+1pFLQsVa8Yq4CKlUhQGAhxOB6UCJB9wGK3DkBE2xPhTt1iY9S4
	Wwh/lusQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUDw-0000000Czov-44jA;
	Tue, 17 Dec 2024 09:50:41 +0000
Received: from out-187.mta0.migadu.com ([2001:41d0:1004:224b::bb])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTjj-0000000Csn0-2EMi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 09:19:29 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734427161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jZKUG8/7+vJ4CurxMusMNyHDShZvXwj62eE8NC9Ca7Q=;
	b=WHpy04qaYGREjmB9I2/bNT8q0m7Itc52aKyA9xJajoh+1emO/0eQkVG6ByQGwbulu5cX95
	DT4W/0kqJw0uaQLyYojOEXXIluGm1OcG12N90rW77922WcYJ2cwf+/t67g4GhM0+N+BsBl
	1zlMqLY42kC+0W/KVjLCPuXFNif6dKA=
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Brown <broonie@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix set_id_regs selftest for ASIDBITS becoming unwritable
Date: Tue, 17 Dec 2024 01:19:08 -0800
Message-Id: <173442713502.3654654.5293442477717772457.b4-ty@linux.dev>
In-Reply-To: <20241216-kvm-arm64-fix-set-id-asidbits-v1-1-8b105b888fc3@kernel.org>
References: <20241216-kvm-arm64-fix-set-id-asidbits-v1-1-8b105b888fc3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_011927_853635_A54E53F5 
X-CRM114-Status: UNSURE (   7.64  )
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

On Mon, 16 Dec 2024 19:28:24 +0000, Mark Brown wrote:
> In commit 03c7527e97f7 ("KVM: arm64: Do not allow ID_AA64MMFR0_EL1.ASIDbits
> to be overridden") we made that bitfield in the ID registers unwritable
> however the change neglected to make the corresponding update to set_id_regs
> resulting in it failing:
> 
> # ok 56 ID_AA64MMFR0_EL1_BIGEND
> # ==== Test Assertion Failure ====
> #   aarch64/set_id_regs.c:434: masks[idx] & ftr_bits[j].mask == ftr_bits[j].mask
> #   pid=5566 tid=5566 errno=22 - Invalid argument
> #      1	0x00000000004034a7: test_vm_ftr_id_regs at set_id_regs.c:434
> #      2	0x0000000000401b53: main at set_id_regs.c:684
> #      3	0x0000ffff8e6b7543: ?? ??:0
> #      4	0x0000ffff8e6b7617: ?? ??:0
> #      5	0x0000000000401e6f: _start at ??:?
> #   0 != 0xf0 (masks[idx] & ftr_bits[j].mask != ftr_bits[j].mask)
> not ok 8 selftests: kvm: set_id_regs # exit=254
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Fix set_id_regs selftest for ASIDBITS becoming unwritable
      https://git.kernel.org/kvmarm/kvmarm/c/212fbabe1dfe

--
Best,
Oliver

