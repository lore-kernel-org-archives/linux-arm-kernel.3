Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18863C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 23:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Eo1Cynkm99g/fvce2xJLW9/liRD3aKZgElFZ+hvJof8=; b=vCcKSvTOgN8f1V
	4KuU3ZlMmozy50qwlPAeeG4YWk5uxlMACspQ6+5laz3VRT9OY7Mz8u6RrhXqUV1nmOqa4c8nGpjzw
	mNVEZlP58ro7+GbtaK7x55UDTKA2TOv74M9JaPyzRf98ex5VHlIG5vIsKibWep+gXZwt8fh7ld3ZM
	WO5HH1qknjR+OQuJJPO7O3NB6Ousk2ubc8k2oK6uLbScuyOjE4vCW3+M0AaHVmZjimuRAeQck+oBC
	t9JncyIy20oIBbG4GL2+uSb+lLerqWscP5vRYPE1bJ67C6QiMlBsgfCUapZwrvEUPg3akkqTXgU2g
	eWeemIlQd20JE51I7WAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsVqy-00000009kYV-2tAx;
	Wed, 12 Mar 2025 23:51:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsVpI-00000009k9S-3q1Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 23:49:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 44F855C420D;
	Wed, 12 Mar 2025 23:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB96C4CEE3;
	Wed, 12 Mar 2025 23:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741823367;
	bh=HbHXJf6SGTZ5u093xJt01x3/Z7InN/X2lZLhzmLppWk=;
	h=From:Subject:Date:To:Cc:From;
	b=Wrpcc18mInGhIMAvU301Kt0+WOZCKCK4muRr95lCvUVzgAMSvkeBVVGzw3B4WHJQK
	 Vr5s5bxY03lor/5TSfQeONaZgM+S5kzGKeAGurPkMw4cPhC4L/xcqiBeq5babGJUf8
	 fTH1bYfhM24w6CSTD8XQqawA4uK6h5fjLYR/pCRyi3nYitzD9ztVOAGg1R9FpSNQFp
	 zuVuYLEDtD6MO9AqAbyfcBUeHsZaCW1P8ZZgsxEcd3wolOtj1fwle4PUuT+Tz+mmBz
	 toi4KNmho1+TI6/X5tV4O0URSciZ8i4jGH6J3i0thTegr9W1IQ4rNOaFB3yFFrXgM9
	 WIq/zbetZ+gTA==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 6.13 0/8] KVM: arm64: Backport of SVE fixes to v6.13
Date: Wed, 12 Mar 2025 23:49:08 +0000
Message-Id: <20250312-stable-sve-6-13-v1-0-c7ba07a6f4f7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHUd0mcC/x3MQQ5AMBBA0avIrI20pYiriEUxZRJBOtJIxN01l
 m/x/wNCgUmgyx4IFFn42BN0nsG0un0h5DkZjDJWGdOgXG7cCCUS1qhLtBM5X6l2tL6BVJ2BPN/
 /sYe60CUM7/sBRZcyo2cAAAA=
X-Change-ID: 20250227-stable-sve-6-13-5ceaf408b5f7
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Fuad Tabba <tabba@google.com>, 
 James Clark <james.clark@linaro.org>, Mark Rutland <mark.rutland@arm.com>, 
 Eric Auger <eauger@redhat.com>, Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 Eric Auger <eric.auger@redhat.com>, Florian Weimer <fweimer@redhat.com>, 
 Jeremy Linton <jeremy.linton@arm.com>, Paolo Bonzini <pbonzini@redhat.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1489; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HbHXJf6SGTZ5u093xJt01x3/Z7InN/X2lZLhzmLppWk=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhvRLsjWeCflZ6+zmKLSzTfzP8knovP+qxI+5qy9tv69X2Kuz
 8JdCJ6MxCwMjF4OsmCLL2mcZq9LDJbbOfzT/FcwgViaQKQxcnAIwkboe9v9Oc6dUejUK7ezc8M1ae0
 fevmzNd06+hj8khB5Lrg82yf38l6njveHjghnnojf9mR4XvO/Y6vqK2Us0i31lni5n4P9bNy2CdyPL
 JZ5iTlZjvUA7TmGLlT4X/YqmpqxxuPE0pdtU8IvMJUvn6KW6gW8FZn3bEvM2L/CdvBpb7/L2Jx7CTY
 Etk+7E98zmz/Nj6/zCdzCO/UNPYG3+GtetM1T7VJud4yw6E36yJ2v4vrtht8aVa0Gy2vULoarHZpW9
 uCL3pOGMTYDdjCBGX77rpc07Hm4q/yywNPr1G6s+D9mCD1+cWxVPhHdXVbp5r339UnR14rH4QrfXTN
 /LRcxztfV+MAYnf1FslW3Y5v8NAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_164929_044677_2E5CE71C 
X-CRM114-Status: UNSURE (   7.04  )
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

This series backports some recent fixes for SVE/KVM interactions from
Mark Rutland to v6.13.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Fuad Tabba (1):
      KVM: arm64: Calculate cptr_el2 traps on activating traps

Mark Rutland (7):
      KVM: arm64: Unconditionally save+flush host FPSIMD/SVE/SME state
      KVM: arm64: Remove host FPSIMD saving for non-protected KVM
      KVM: arm64: Remove VHE host restore of CPACR_EL1.ZEN
      KVM: arm64: Remove VHE host restore of CPACR_EL1.SMEN
      KVM: arm64: Refactor exit handlers
      KVM: arm64: Mark some header functions as inline
      KVM: arm64: Eagerly switch ZCR_EL{1,2}

 arch/arm64/include/asm/kvm_host.h       |  25 ++----
 arch/arm64/kernel/fpsimd.c              |  25 ------
 arch/arm64/kvm/arm.c                    |   9 ---
 arch/arm64/kvm/fpsimd.c                 | 100 ++----------------------
 arch/arm64/kvm/hyp/entry.S              |   5 ++
 arch/arm64/kvm/hyp/include/hyp/switch.h | 133 ++++++++++++++++++++++---------
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  15 ++--
 arch/arm64/kvm/hyp/nvhe/pkvm.c          |  30 -------
 arch/arm64/kvm/hyp/nvhe/switch.c        | 134 ++++++++++++++++++--------------
 arch/arm64/kvm/hyp/vhe/switch.c         |  21 ++---
 10 files changed, 204 insertions(+), 293 deletions(-)
---
base-commit: 251aeb0f2f570db5290d0dc2f8ebf87247b00b85
change-id: 20250227-stable-sve-6-13-5ceaf408b5f7

Best regards,
-- 
Mark Brown <broonie@kernel.org>


