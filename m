Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7F2C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MRhI0mI11kgaitYzy4CQ3MeHqnt7ExWsX2e8Zdl1MwY=; b=mguNGT86j83OLqOTpW1lKwbomZ
	R4/9rQPfK7hTk3Khy0gcS2T46MH9vEtl0zZzg2ZSSCqOzMsSMheaHU+jZtMDZyFiVf7EEZWVM1b7L
	Of+oRbdZFRBi3UhZYJrQtJHrpPXKE3XBd8YPmsE1YE+/sLtbaEBpfuGjWIlHwdPmUvJKxVUjkqt9R
	MFmulIW0ez39JCLOTfq+qQhdNEQ1fTVKt8KiTQDncpcaI/7FpA0oyi6+5MMQG7LKa6Cp5/oeNAipV
	6A89nsbh6x5jxbp1qLaC5VxZFL32RRPUC8m/wh7SniDDK0KNp7y0gkiM59pLbsceRGoe4dXRZw0ob
	E6wjC1WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YaF-0000000EVA1-3Cg9;
	Fri, 18 Sep 2026 13:24:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YaD-0000000EV9h-0CdI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:24:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8178443D5D;
	Fri, 18 Sep 2026 13:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3F91F000FF;
	Fri, 18 Sep 2026 13:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789737892;
	bh=MRhI0mI11kgaitYzy4CQ3MeHqnt7ExWsX2e8Zdl1MwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wzio8KE1T0CrR6QvBoc9JJCxsOYMCQdBWtoonLvp5/Yk4l2hj4W7Tw0Zxw1bpVZkD
	 OuvssS9SdIXaERnW9MTMcl+4iFICFTlG40sWIaM4YRSgF1EXYUXJy04QNNtsFC/YJL
	 H1UH3xWSe2XIRSrgh5LsbPE5u/TbesP0Q73b5XqP/WYiQnyctKAZ+xivA1g9yBx9SW
	 0A151U/kXxpqGU+ve0oqKlxqkhr4AwSeaw6cUNSz9AUllX5f5+bCc+BDmhHKoBaz0h
	 1w784+j28IoIHJ9YfQ7T7TpysUHNUG7iT9ShW6LI/i/0kHetnFwLSJrl9RkcOZRYGY
	 X3SYdGN6h8yLQ==
Date: Fri, 18 Sep 2026 14:24:46 +0100
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, oupton@kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, mark.rutland@arm.com, steven.price@arm.com,
	vdonnefort@google.com, qperret@google.com
Subject: Re: [PATCH v3 15/18] KVM: arm64: Reject host access to protected VM
 private state
Message-ID: <aq07ngt4hV2gcz7y@willie-the-truck>
References: <20260914113338.159227-1-fuad.tabba@linux.dev>
 <20260914113338.159227-16-fuad.tabba@linux.dev>
 <86a4ph5fb9.wl-maz@kernel.org>
 <CA+EHjTzCQkeXQQcCDwABLR2w+NTmKTG3V6RSmhzYNayaoYXw3g@mail.gmail.com>
 <865x045mke.wl-maz@kernel.org>
 <aq0628Ci4pfEj0KG@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aq0628Ci4pfEj0KG@willie-the-truck>
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

On Fri, Sep 18, 2026 at 02:21:31PM +0100, Will Deacon wrote:
> In our recent investigation, it turned out that both kvmtool and crosvm
> were perfectly happy with ONE_REG returning an error in normal operation
> but we needed a handful of fixes for kvmtool [1] to handle things like
> the 'debug' command.

... and here's the link I forgot:

[1] https://lore.kernel.org/all/20260831192406.1341841-2-fuad.tabba@linux.dev/

Will

