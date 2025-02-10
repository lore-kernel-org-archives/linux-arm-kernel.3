Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD66C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 16:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHblpPj4/pHlzNalnQXFr3E/60E4xGmWn914YGsrK8A=; b=276gX1Pgx+XJQld0wSvZGc2979
	HgVmSSNELLldnUyTF8YhZNbZjE6fceR7w8mx/Bv75KPRd+jWacrA0eGpRMr9DjvHrJoveogn4IpwT
	YLDv+9XJXWNbpGutOR98XUjWuFZQ+Hse9y8rM9N6BME+Qf1nCG7GMJ31F5Ke8EgyjVyyjmaxVHx7g
	yPYVl+uP7guH75rw4CGWbBGw+7lhl27kQGkgYXUj6y4Fz4V2StncgpcW31W3EL38dEFl6TYLlaaAA
	NzrZmAP1gaCt9e7Z3ONowJAEcLFSM/Yl3h7EBzwdKpGdsHh1LbLZPkGR8MH6oRI+UujhOJiN3Q8bg
	GeAYhaVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thWpA-00000000YFW-2uXE;
	Mon, 10 Feb 2025 16:39:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWnO-00000000XzZ-1nKr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 16:38:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0B506A41AB4;
	Mon, 10 Feb 2025 16:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2189C4CED1;
	Mon, 10 Feb 2025 16:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739205485;
	bh=CpnvGWn9LObSDvCOUkk4A82aFysg9bYSFv6Z/NeUo64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UHOyquvKQYClxarZzFakPsDnC+F0MBb/5fr/Wn+7eF7S2lDuM+u4ydlKNF5TdgOy0
	 U+XvVPvixZQplNaaTABdEPS7ozNSB7HJ6sUM5M1Rw9W8Y+w7OkSx5V9NaYQLiSB8CM
	 Zf8lMAYyUib9MqYIG8D/ELNz8r5LLc9ADEU6MsgTNOE7tMOdmgfEjwA5BcVQ9M7weH
	 IR2jtRrfx/5cON+7TUd/xyiYX0DstWQlO/4aPonGpgjLPOwehplGh3dOXJIzgcTrHX
	 HPfSoHKo4W9z7fxzhcILyB40I43iiOqWAjCo8m2SeSUleHNtu5Ew8H8Es6gXLGIaXL
	 /IuUTCcsW46Hg==
Date: Mon, 10 Feb 2025 16:37:59 +0000
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, eauger@redhat.com, eric.auger@redhat.com,
	fweimer@redhat.com, jeremy.linton@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, pbonzini@redhat.com, stable@vger.kernel.org,
	tabba@google.com, wilco.dijkstra@arm.com
Subject: Re: [PATCH v2 6/8] KVM: arm64: Refactor exit handlers
Message-ID: <20250210163758.GG7568@willie-the-truck>
References: <20250206141102.954688-1-mark.rutland@arm.com>
 <20250206141102.954688-7-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206141102.954688-7-mark.rutland@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_083806_535548_E948A232 
X-CRM114-Status: GOOD (  16.54  )
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

On Thu, Feb 06, 2025 at 02:11:00PM +0000, Mark Rutland wrote:
> The hyp exit handling logic is largely shared between VHE and nVHE/hVHE,
> with common logic in arch/arm64/kvm/hyp/include/hyp/switch.h. The code
> in the header depends on function definitions provided by
> arch/arm64/kvm/hyp/vhe/switch.c and arch/arm64/kvm/hyp/nvhe/switch.c
> when they include the header.
> 
> This is an unusual header dependency, and prevents the use of
> arch/arm64/kvm/hyp/include/hyp/switch.h in other files as this would
> result in compiler warnings regarding missing definitions, e.g.
> 
> | In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:8:
> | ./arch/arm64/kvm/hyp/include/hyp/switch.h:733:31: warning: 'kvm_get_exit_handler_array' used but never defined
> |   733 | static const exit_handler_fn *kvm_get_exit_handler_array(struct kvm_vcpu *vcpu);
> |       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
> | ./arch/arm64/kvm/hyp/include/hyp/switch.h:735:13: warning: 'early_exit_filter' used but never defined
> |   735 | static void early_exit_filter(struct kvm_vcpu *vcpu, u64 *exit_code);
> |       |             ^~~~~~~~~~~~~~~~~
> 
> Refactor the logic such that the header doesn't depend on anything from
> the C files. There should be no functional change as a result of this
> patch.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kvm/hyp/include/hyp/switch.h | 30 +++++--------------------
>  arch/arm64/kvm/hyp/nvhe/switch.c        | 30 ++++++++++++++-----------
>  arch/arm64/kvm/hyp/vhe/switch.c         |  9 ++++----
>  3 files changed, 27 insertions(+), 42 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

