Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00411C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 07:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8J4kpdpp3XyWEowxfy+e4qKvqbKR/Y7ETsVToACTS0c=; b=k02pmTs9njTL2oRSrKYEqGjchn
	0Ts7SOP4Or8XJAO17JSE65QO1v562dwTF7SKysKtIqpkwC2Lb24NgHb0n9F2cc22LbWf/GFzi36ar
	6W12/WpO3Ps+eQ/ftgAstrnJdq4Czqi/CKK1fdlVyR70ilGak2WC9oE5n/81mDYSfnQUZxSEYZ7b3
	9JcYUDXLdQEB3pnfqQkqspjcHDulzdPo2z7d10m9zdIzZn+9wVYkmJlwDV76bR505mymwK6xaMrxW
	vcZckTD7XakXRWvTPB1VztpZsAw36M2VDgzJQyvpkhHE7Ev5fHfHD9IuJG+xEVpKza+hqf6rsbaRR
	M/U0Qqsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8v5T-00000004Xww-3iBM;
	Tue, 22 Sep 2026 07:38:47 +0000
Received: from out-193.mta1.migadu.com ([2001:41d0:203:375::c1] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8v5Q-00000004XvY-2KQZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 07:38:46 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=KUW89faoHHYWgqCz8nIDgkYnfX7c9yryPkJWlGTaNK8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790062722; v=1; x=1790667522;
 b=OSYdRr0fGPy2D1S9U6xWX44CKWx8Jjqulhl3rC8oOpJmHxUI/awWk1r6QZM5OP8myxIOJ4ok
 2VV1cRSlHUw7Cr9E/KDDuOLQwAgl7TzHbTaEVNDqnjdxaKfCAp9QoqQDs/jNsYTS73ONi/G8Xal
 nsdXNFzMKRDOT0gXbXJuvH1M=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2b90d64f45864352;
	Tue, 22 Sep 2026 07:38:42 +0000
X-Mizu-Trace-ID: 2b90d64f45864352
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	mark.rutland@arm.com,
	vdonnefort@google.com,
	qperret@google.com,
	Sascha.Bischoff@arm.com,
	steven.price@arm.com
Subject: Re: [PATCH 6/7] KVM: arm64: vgic: Do not access the GICv5 CPU interface from EL1
Date: Tue, 22 Sep 2026 08:38:37 +0100
Message-Id: <20260922073837.705872-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260915123846.2317931-7-fuad.tabba@linux.dev>
References: <20260915123846.2317931-1-fuad.tabba@linux.dev> <20260915123846.2317931-7-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_003844_819549_16081C85 
X-CRM114-Status: UNSURE (   8.30  )
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

Hi,

On Tue, 15 Sep 2026 13:38:45 +0100, Fuad Tabba <fuad.tabba@linux.dev> wrote:
> can_access_vgic_from_kernel() excludes only the GICv3 system register
> interface, so on a native GICv5 system without FEAT_GCIE_LEGACY it
> returns true under nVHE. The kernel then saves and restores the CPU
> interface from EL1, where ICH_VMCR_EL2 and the ICH_PPI_* registers are
> UNDEFINED, and the nVHE world switch already does that work at EL2.

FWIW, I've since run this on the FVP GICv5 model (support_virtualization=1, kvm-arm.mode=nvhe). On kvmarm/next at 23ddf997ab16b the vgic_v5 selftest oopses the host at the first KVM_RUN:

  Internal error: Oops - Undefined instruction: 0000000002000000 [#1]  SMP
  pc : __vgic_v5_restore_ppi_state+0x10/0x9c
  lr : vgic_v5_restore_state+0x28/0x3c
  Code: d503245f a941240a d0012448 91160108 (d51cca0a)

d51cca0a is the ICH_PPI_DVIR0_EL2 write, from EL1. With this patch applied the same run passes.

Cheers,
/fuad

