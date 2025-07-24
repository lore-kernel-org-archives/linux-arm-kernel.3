Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A6CC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 06:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fba5bx1Rr99IAgRBh7EOTeNdPdYaOyIv4sbcH95qHg=; b=0Bu76mbL1sdA6LaFBeFV7t9jOf
	ygqqckH+EcEGm3hXewANFmdGmll7pvlUeFP/WrIYFIiaDLZG2esOTbj22PR2DdrsGIafW9iVt7cIr
	VFQNuqLkZtCq4GOPvaS7aaEmtlvS2IIQ8VuGoXkq0L48CFAPag0uWaSNPKbl8idL9eETDD589uOiK
	iZJAjcoqBiQslbRNz/FDT0RtSsMrat2rXAcviZWHpRjREG2s8K+HSAoqA99BNhzxK/itbcwSDMPjN
	V3tEGUj5D20j+gjEP+isjp6oVgjRHovvlbHJXA/Jj5euOocOttV3agrPRSvAatlOFVKLdA23at9LC
	rIt2Fuzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uept9-00000006eBv-1w8M;
	Thu, 24 Jul 2025 06:57:11 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueplq-00000006dNq-1lec
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 06:49:39 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753339775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9fba5bx1Rr99IAgRBh7EOTeNdPdYaOyIv4sbcH95qHg=;
	b=BFwYKgP6btZOTZc1V4H/sD0Of99aayXu7wxw6mgsNirytHgfG7/XOU+tSYf3WnAo0i0sCT
	qCas8wFiGIBltggZo11b9eicJKDtdFr6IfXB6aB3V7x+RL/cyGJPJoK5nO9vuk3GM+5JcP
	JlEztQJTQJvp2N1qSTf1YFJXDHNzdd8=
From: Oliver Upton <oliver.upton@linux.dev>
To: rmk+kernel@armlinux.org.uk,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [resend][PATCH 2/2] arm64: kvm: trace_handle_exit: use string choices helper
Date: Wed, 23 Jul 2025 23:49:15 -0700
Message-Id: <175333974804.2689259.7219492328328147997.b4-ty@linux.dev>
In-Reply-To: <87o6ti5ksx.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6ti5ksx.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_234938_603125_BB78208E 
X-CRM114-Status: UNSURE (   4.91  )
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

On Fri, 18 Jul 2025 01:50:38 +0000, Kuninori Morimoto wrote:
> We can use string choices helper, let's use it.
> 
> 

Applied to next, thanks!

[2/2] arm64: kvm: trace_handle_exit: use string choices helper
      https://git.kernel.org/kvmarm/kvmarm/c/f509de1b0f89

--
Best,
Oliver

