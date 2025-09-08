Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6E2CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=etBes6rNq0N6EdboZXhSXADAiom+XokC8IiTX0nXoE4=; b=ZDky7IJT7bYGsc4Vq2HL+IQufX
	4haagJnHbR40TN9Ug90MK7R6aaXys1BgnpWX9DxOuHaaghGyRYrBJSSM6eOtOrRFttwseTKCjraEE
	BPE+xhfv7yaFnft0GoJYrqTYxHWlopyioXg2H1C0mZjhiCh+WiBX5z180Q3rDFBB4zpmwzJRREkJU
	SqME1//tZQu8s5khzuAyH1rn0M/8+9mm90gBgUX7o+J6w/U/ln00IpofBtz+82vv53JdxtohZPDdK
	riz7XIyPA2n/KLrA5NXTiYaPcLKS+CtBNHTKVvnnv3yM5QAg7e3Oq0zKfnZFnW7ZQqZmKld7NUCxB
	5YslO4cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfd5-00000001BxE-1RMB;
	Mon, 08 Sep 2025 17:26:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvd1O-00000000AQj-1UFV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 14:39:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B8BF0600AC;
	Mon,  8 Sep 2025 14:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37243C4CEF1;
	Mon,  8 Sep 2025 14:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757342345;
	bh=fo3RLTyhb+adys/SOtTG9n/0o2IcMmVHW/wAiLg65MY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OaFddIXhCb8Zkuv1OCwkv/5KJxiaVgnjZNWZfU8ZYPk7HN3HSoGx1Yz2hC2r6SmkM
	 Di/FLf4YoVLva7I+yJz0T8DpJI0uoj+e3oDBtVoMNNFcDOMdGvLAHr1vXi9XdGk2X8
	 6SHdAQTigoo/DYXLWctawGcRUNOWZNBSegktWxWJNY91a0wKPqyirR5f7DWakD6arQ
	 nPqaM4RvzKly1uty/z1/TLcnwLfnN3+menpmIa+pz+iO4thhN0wPQFOFKInOJrYT/6
	 HiX5BaNpy+pcjG+K4xjIga+w7XT76EdxIvhpoO1X6y8PU/BJ/Ixd3DHQ2usn5mxlf7
	 pHBcCb8CZyiGA==
Date: Mon, 8 Sep 2025 15:38:58 +0100
From: Will Deacon <will@kernel.org>
To: perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, ahomescu@google.com,
	armellel@google.com, arve@android.com, ayrton@google.com,
	qperret@google.com, sebastianene@google.com, qwandor@google.com
Subject: Re: [PATCH v11 2/6] KVM: arm64: Use SMCCC 1.2 for FF-A
 initialization and in host handler
Message-ID: <aL7qghmPfM3NMyMz@willie-the-truck>
References: <20250820-virtio-msg-ffa-v11-0-497ef43550a3@google.com>
 <20250820-virtio-msg-ffa-v11-2-497ef43550a3@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-virtio-msg-ffa-v11-2-497ef43550a3@google.com>
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

On Wed, Aug 20, 2025 at 01:10:06AM +0000, Per Larsen via B4 Relay wrote:
> From: Per Larsen <perlarsen@google.com>
> 
> SMCCC 1.1 and prior allows four registers to be sent back as a result
> of an FF-A interface. SMCCC 1.2 increases the number of results that can
> be sent back to 8 and 16 for 32-bit and 64-bit SMC/HVCs respectively.
> 
> FF-A 1.0 references SMCCC 1.2 (reference [4] on page xi) and FF-A 1.2
> explicitly requires SMCCC 1.2 so it should be safe to use this version
> unconditionally. Moreover, it is simpler to implement FF-A features
> without having to worry about compatibility with SMCCC 1.1 and older.
> 
> SMCCC 1.2 requires that SMC32/HVC32 from aarch64 mode preserves x8-x30
> but given that there is no reliable way to distinguish 32-bit/64-bit
> calls, we assume SMC64 unconditionally. This has the benefit of being
> consistent with the handling of calls that are passed through, i.e., not
> proxied. (A cleaner solution will become available in FF-A 1.3.)
> 
> Update the FF-A initialization and host handler code to use SMCCC 1.2.
> 
> Signed-off-by: Per Larsen <perlarsen@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/Makefile |   1 +
>  arch/arm64/kvm/hyp/nvhe/ffa.c    | 193 +++++++++++++++++++++++++--------------
>  2 files changed, 125 insertions(+), 69 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

