Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23949C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 06:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LeFQS5hveKm4hU0ToXW/iCGDnVMDNWtKTvmZJLGW35s=; b=TpHUvNBXO7ehrgFzy6DzeNKMzC
	W14Ifxo8X2cPzLA9KuXI02kpB4jzHH5oTtMH9dwK9tCONMWbBaytDi/9b+Dobw0e36Oha18zdNe0K
	yd7o7x7ZRvtjz//ULVi/OdRhbo0H47fGVz7CeJYQYDddaCPYMnutW+v6wmSJsYPY0Ijnp8UfW+ZdH
	QDW5f/+9xs/YKpgA6vZCQNI0D7IH76YBY3ug60vqSZ+t0XgYgwe853S3h5eWSSyooulxKdP4zrHCa
	EsQUBNHU3Ux8Fqo7k+QGxNXep8eY7qv3S/+fSeR5rL1I4ov/J/gKaRZL4eLmBfuBUT4iE8Z7UEGwe
	8i+3IopQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uepqi-00000006dty-2YJx;
	Thu, 24 Jul 2025 06:54:40 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueplp-00000006dNg-211c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 06:49:39 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753339773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LeFQS5hveKm4hU0ToXW/iCGDnVMDNWtKTvmZJLGW35s=;
	b=bz90vry+UZ7I7N7iDhq/F2EgBvJoxdq7WqdyYpQhRpfxU9F+rIGQ5lDFuCIaZ44BHsymq7
	h03hw6qGswvz3oEK25H4yPQ5Unno5bQHPU9JEOBrpyP0QPn3WSqoBZsUkq1qNRR1XvmpFL
	uZvRt1zhvjYkAc4uIAQ5Gv0cKe3cwOU=
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
Subject: Re: [resend][PATCH 1/2] arm64: kvm: sys_regs: use string choices helper
Date: Wed, 23 Jul 2025 23:49:14 -0700
Message-Id: <175333974804.2689259.25654822874492399.b4-ty@linux.dev>
In-Reply-To: <87pldy5ktb.wl-kuninori.morimoto.gx@renesas.com>
References: <87pldy5ktb.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_234937_776990_A7236D80 
X-CRM114-Status: UNSURE (   5.01  )
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

On Fri, 18 Jul 2025 01:50:24 +0000, Kuninori Morimoto wrote:
> We can use string choices helper, let's use it.
> 
> 

Applied to next, thanks!

[1/2] arm64: kvm: sys_regs: use string choices helper
      https://git.kernel.org/kvmarm/kvmarm/c/30a597e19f24

--
Best,
Oliver

