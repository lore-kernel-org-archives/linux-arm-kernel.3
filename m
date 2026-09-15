Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A606C982C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 22:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/lBbhtTE2HQN9x+xVp3jc8ZwjbTlxs/8mbmhmvVWeY=; b=AEQi/Ltn7HZqhW9v3bxW/4mCrC
	eMm3GvcnqPXr3R8t76VbwZvSSCaS+/grf1RA6mm9660KfOhUO7fl7G8C9pE6wNUpTo29lF7dhQg/E
	qwWi+U1dyZcjPaFetY3k24bkhyFDyeLA8Hs41E3X2eJl6hHI03gpZ3H1/VIs17XIdhmRjSbhUZQhJ
	WPN6JnkIFw2fn4KJmgfneUo/asE/odRkiFpP23MhSZMgmVKm6k4SDuYJwexYVr8adMB+vKzw1UgB8
	Nh30aJdmFRsRQfddkxkgrq/6JlDkKOXSH8F0XM5HmA8fH+GzdGpNZsO3MhtNlUoYVKFsF7UmMta5E
	JQh9p6Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bbW-000000080OS-1tMr;
	Tue, 15 Sep 2026 22:26:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bb2-000000080Jh-3S0k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 22:25:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 911F6602C2;
	Tue, 15 Sep 2026 22:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 005591F0089B;
	Tue, 15 Sep 2026 22:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789511147;
	bh=E/lBbhtTE2HQN9x+xVp3jc8ZwjbTlxs/8mbmhmvVWeY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZWeWHJPumUljTcS9NiLuZBiYB9NAYMhX1qlg8GwqdgqQeB5XeqVmEScLsiOaJVtxe
	 6wAY6MOfFlgXKj2O59kPOKqw4cWF9Ci/27xm5YK35yYKdOsDWSFBMaFW8fCbV1Ohue
	 F3u3Jd4MMs9Aiv8iAcDcocxC5y0gw3tH7jvtfzqj25GyM2BXQFBLSCdLqkSFkKs/91
	 EsK5ENL+IPqQSs9UUNxOwDDUM6X60fAMoJOsFvQOMf50gj0fQVIgqqxp/37xYLB0UJ
	 c6g0eiGuKIjq5HIsHPGGDdM1ExwLYkAUIsOfgrVCJW/dulm/xzYhNcJX+aVYeIv6ck
	 o22wrnObxKOCw==
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	kvmarm@lists.linux.dev,
	Karl Mehltretter <kmehltretter@gmail.com>
Cc: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/2] KVM: arm64: Return -EINVAL for an empty SMCCC filter range at base 0
Date: Tue, 15 Sep 2026 15:25:37 -0700
Message-ID: <178951103699.10790.2965757289938875509.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260829054856.70549-1-kmehltretter@gmail.com>
References: <20260829054856.70549-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Sat, 29 Aug 2026 07:48:54 +0200, Karl Mehltretter wrote:
> KVM_ARM_VM_SMCCC_FILTER rejects an empty range (nr_functions == 0) with
> -EINVAL for every base except 0. kvm_smccc_set_filter() only rejects a
> range if its inclusive end, base + nr_functions - 1, is below base; for
> base 0 that end wraps to U32_MAX, and KVM then tries to insert
> [0, U32_MAX], which overlaps the reserved Arm Architecture Calls
> ranges, so the attribute returns -EEXIST instead of -EINVAL.
> 
> [...]

Applied to fixes, thanks!

[1/2] KVM: arm64: Return -EINVAL for an empty SMCCC filter range at base 0
      https://git.kernel.org/kvmarm/kvmarm/c/64dc6f1db7e6
[2/2] KVM: arm64: selftests: Test empty SMCCC filter range at base 0
      https://git.kernel.org/kvmarm/kvmarm/c/0a46eb5719fa

--
Best,
Oliver

