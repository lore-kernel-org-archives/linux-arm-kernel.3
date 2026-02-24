Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BDEEFB7EB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 02:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bhqqDp0cBtKICnmQVrmMtxnlMvqrexGutOGquZwg6U=; b=i2HL+Sj+9B/ZXtqBlq/+r59cjs
	8HKaort0GJkBkqL32cX1fX+JigEYN0VLCTSO/v36ygRjue2E9Lspk8B1ltI0UwODaKV51TjdRKxWW
	lPZXgVxJ31dpUhqa/eAAYJ/JuxrnEQu59Y8XY6rwGtUaqYnWSqQYANM+JIdH290c4zFpH9LfqVRb6
	OdFml15hEtuILrmzo2DYeMcNjqSwaleMUuhJMqnxgOlnN1NcGbO5dbNdiHTXqf0r+lnAlhKC91hIc
	Dbfvi42DdC6VSrCsjNQD9G3SbCFKHRmorjWkeF1Zb0ked4+RZltjLscUdJGmFFVdEKbhRyYs3fJDv
	E3mOhNhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuiTd-00000001NE1-1Org;
	Tue, 24 Feb 2026 02:48:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuiTb-00000001NDG-3Tne
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 02:48:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB6D94338F;
	Tue, 24 Feb 2026 02:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43363C116D0;
	Tue, 24 Feb 2026 02:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771901322;
	bh=7PJlfl1E8kHqQjY0Dl7T+Y3HgXwyKOBil5hIKHkainE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=c0r7REpI/o3XSVvBhMUsoa8mVeQQy/N1mZa0h9vor5J2fLnWeZgp1ByFLy0U3jhVp
	 05sQnXKohDzDQRJBAhzOdM/8yhm25w2TSC8P/Bq2M3lVefiF/zJrFrCL89RaKJoYz2
	 MtcrAFUasbYxLh1iT+sUECSU91JmdsIOIFbHSkeGaArrd+kdOYUcLkwV6bNnyJJQTs
	 Yu/TN2dAWBKfdY+aD8QKPApeuaXJogjOKMWlWD7W404Y2kkgfUTTaP71grxOdP8S03
	 KXRDOoUpCZqILopGpBexu9mGPP3QL5JwMyBs/CtegvM2+/rRZZukOCWY9z1nIwg/Lv
	 h4Vo7Rr0azmag==
Date: Mon, 23 Feb 2026 18:48:40 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
 <pabeni@redhat.com>, <danishanwar@ti.com>, <rogerq@kernel.org>,
 <horms@kernel.org>, <mwalle@kernel.org>, <nm@ti.com>, <v-singh1@ti.com>,
 <vadim.fedorenko@linux.dev>, <matthias.schiffer@ew.tq-group.com>,
 <vigneshr@ti.com>, <m-malladi@ti.com>, <jacob.e.keller@intel.com>,
 <stable@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srk@ti.com>
Subject: Re: [PATCH net 2/3] net: ethernet: ti: icssg_common: set
 irq_disabled after disabling TX IRQ
Message-ID: <20260223184840.06069afa@kernel.org>
In-Reply-To: <20260220041431.372610-3-s-vadapalli@ti.com>
References: <20260220041431.372610-1-s-vadapalli@ti.com>
	<20260220041431.372610-3-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_184843_897741_9CE0111E 
X-CRM114-Status: GOOD (  11.27  )
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

On Fri, 20 Feb 2026 09:41:58 +0530 Siddharth Vadapalli wrote:
> The 'irq_disabled' variable indicates the current state of the TX IRQ and
> is used by the TX NAPI handler to determine whether the IRQ should be
> enabled.
> 
> Currently, 'irq_disabled' is set before actually disabling the IRQ by
> invoking disable_irq_nosync(). In an SMP environment, this leads to a race
> condition wherein the processor taking the interrupt sets 'irq_disabled'
> while another processor executing a previous instance of the TX NAPI
> handler sees 'irq_disabled' set and invokes enable_irq() before the TX IRQ
> is actually disabled by disable_irq_nosync(). This results in the following
> warning:
> 	Unbalanced enable for IRQ ...

AFAICT the flow on the Tx bug is not buggy, owner ship of the IRQ
vector passes handler -> NAPI -> timer. I don't see how those can
race.
-- 
pw-bot: cr

