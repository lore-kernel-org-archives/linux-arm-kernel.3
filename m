Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCF1C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 17:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNIyxQnq4qOIP+xnPLHAwxkA0IPHV/f4fUHTAmQLjuw=; b=jM5bgtq9rqQoauekt+ixp5H3OW
	EWLzF5PVqLJ5tCyLi9KE+6a3K+1ViqDlv01Nx2x+qMV+iEGnDSoRcYnxZQ/hfBJ9ZLnkiiFsPTjmG
	O7w28BxenmwFNMXsMxpiQAqpAapWIqyGIWfoxCtn5O66xou1ejJCoXtMS4ZPVI5kXn2cSDTcUpn5Q
	7lEUgvoVuzknQ4VtNDA+DlfDMtItPedrGtedGGcl3ua9va0j8kMpGJpn/xDRIvrWp9kq1pj4zGdKs
	pMQuraVTLJyPA53Qg9tD0VWFRZ1EDM78Dq3ufrcxEaGLpOJF73Ett/3F1orgxTWTKnfw2i7CoY/df
	KeGltRvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRpX-0000000F7g1-34aT;
	Mon, 28 Jul 2025 17:40:08 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRSV-0000000F5In-42Nj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:16:21 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753722974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bNIyxQnq4qOIP+xnPLHAwxkA0IPHV/f4fUHTAmQLjuw=;
	b=h5llobWTLuMaFo5A3Cq7Tjd1EiNa2zYRY3PDfKichyGAgZVwEpoCgvQi0UdUKJdqaHnoNr
	cG92D+zy7qSmlPnRg2yG6tXu/EFQPKsonVfzgTo8A4vpM6YH991dsU/ADVz40wE5DtTVfP
	I4QIBRBgnd4wXaQbhhOh+gYkzOPKOCs=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 0/4] KVM: arm64: Userspace GICv3 sysreg access fixes and testing
Date: Mon, 28 Jul 2025 10:15:49 -0700
Message-Id: <175372292706.2891555.8608447828922447726.b4-ty@linux.dev>
In-Reply-To: <20250718111154.104029-1-maz@kernel.org>
References: <20250718111154.104029-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_101620_144792_CC53BC2A 
X-CRM114-Status: GOOD (  10.57  )
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

On Fri, 18 Jul 2025 12:11:50 +0100, Marc Zyngier wrote:
> As a follow-up to my earlier series at [1], here's a small set of
> fixes to address an annoying bug that made ICH_HCR_EL2 unreachable
> from userspace -- not something you'd expect.
> 
> So the first patch fixes the ordering the the sysreg table, which had
> ICH_HCR_EL2 at the wrong spot. The next two ensure that we now check
> for the table to be sorted (just like all the other tables). Finally,
> the last patch augments the vgic_init selftest to actually check that
> we can access these registers
> 
> [...]

Applied to next, thanks!

[1/4] KVM: arm64: vgic-v3: Fix ordering of ICH_HCR_EL2
      https://git.kernel.org/kvmarm/kvmarm/c/0f3046c8f68c
[2/4] KVM: arm64: Clarify the check for reset callback in check_sysreg_table()
      https://git.kernel.org/kvmarm/kvmarm/c/f5e6ebf285e1
[3/4] KVM: arm64: Enforce the sorting of the GICv3 system register table
      https://git.kernel.org/kvmarm/kvmarm/c/8af3e8ab09d0
[4/4] KVM: arm64: selftest: vgic-v3: Add basic GICv3 sysreg userspace access test
      https://git.kernel.org/kvmarm/kvmarm/c/3435bd79ec13

--
Best,
Oliver

