Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F10BC3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 08:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHAbVa6E1A/wHvD5/4+iVSocKc6b/G3IZErcqqcFL0s=; b=talQqtZXfp2Xu891VYhnOo9BxZ
	gYrBJtFb3VYqH+5XxvhKFxhgLrULa5qCyIIMumfXEQvDtcHbpXCmvWHZB+cxUG4eDINvl+zNeLGds
	c5MEgzqPs7zYKlzFOtidWlFIuZ2rE06jmLEVaenU2y//lTQGNMkOQ6D+F8ohoVGPiu36DBW7YAIID
	JF2TAd384vyFnrlNcMmMNLtEYwlBIUXovGl95NQpR16i53qYAPKzPwT4VrGB4Jvhga9NBiJ6pi1i1
	w8F+Hg2HubbAj9NHBG7M289ylqibgFhcvhuDX/O4MPCKGK+LUffjUW/F1pGpGrIvunqIkvZiUNaKQ
	SfKnMJWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCaWU-0000000EpEw-07s1;
	Wed, 07 May 2025 08:53:02 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZeQ-0000000EcsR-3JdH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 07:57:12 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746604626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nHAbVa6E1A/wHvD5/4+iVSocKc6b/G3IZErcqqcFL0s=;
	b=krCymqbLFkpq88vV/Mhy4It39SJqdhzNcJtBDki6dLsYGxo/0LkfTarWJ4hw2m9MsghJ/K
	dUDJZJvsi5y+TSOOUJd78Eap71hGr0jO49hbYlhznHBcDrCkTufg5nfuPxwd6IIuomgo+X
	NfzwyoYrIAvLzcA73mtDg0KTiSdOQAI=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: Re: [PATCH 0/2] KVM: arm64: Make AArch64 support sticky
Date: Wed,  7 May 2025 00:56:49 -0700
Message-Id: <174660459090.2542293.281555922316726481.b4-ty@linux.dev>
In-Reply-To: <20250429114117.3618800-1-maz@kernel.org>
References: <20250429114117.3618800-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_005710_980714_22F16FD4 
X-CRM114-Status: UNSURE (   7.98  )
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

On Tue, 29 Apr 2025 12:41:15 +0100, Marc Zyngier wrote:
> It's been recently reported[1] that our sorry excuse for a test suite
> is writing a bunch of zeroes to ID_AA64PFR0_EL1.EL{0,1,2,3},
> effectively removing the advertised support for AArch64 to the guest.
> 
> This leads to an interesting interaction with the NV code which reacts
> in a slightly overzealous way and inject an UNDEF at the earliest
> opportunity.
> 
> [...]

Applied to fixes, thanks!

[1/2] KVM: arm64: Prevent userspace from disabling AArch64 support at any virtualisable EL
      https://git.kernel.org/kvmarm/kvmarm/c/7af7cfbe78e2
[2/2] KVM: arm64: selftest: Don't try to disable AArch64 support
      https://git.kernel.org/kvmarm/kvmarm/c/b60e285b6acd

--
Best,
Oliver

