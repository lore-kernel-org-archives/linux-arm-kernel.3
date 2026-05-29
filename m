Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C70CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PaOL9OFYQHOiY4nBl5UhDkML+6X5notbspaX2VqRNd4=; b=gSNsBR7+tkyzQV7ArRfSMfhQXc
	5Rw2YnRwxXXbZoYfxRSwGFE5t7AO01vHsa7ny3CxaOy5kq+2efjP+tTMkWnvMgW53UHYf11HQV4cQ
	2G68a8MJv3iuH6+o9nJigAvR00WuCQrFeJzHHNVyrD19QwB2wXckbvZpEwj2GUS4hcxPggSwbgb/p
	4fBSgUEztw5s8pPZY/3DXEQZP5dJ/ciw0/Q8ymHOEz5356zcmrQKY3+py3v31xlxHodl/j085Ro12
	GbaqWShG2Z/5v5HIQ/ccYgyi2O3vjm+IBTPD9E1KYdRvfDG+gIj5107AkmVvDoF8lzqLIZ1JMO5eG
	8tknGk0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzCL-00000007i7d-3r0p;
	Fri, 29 May 2026 15:32:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzCJ-00000007i6u-2ACl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:32:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C40843A63;
	Fri, 29 May 2026 15:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DABD1F00893;
	Fri, 29 May 2026 15:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780068751;
	bh=PaOL9OFYQHOiY4nBl5UhDkML+6X5notbspaX2VqRNd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HMvL7YXkOKjoSHY3EbotLPeMvGmQ92s0pJvOwoTsS6LqXH8rZWyQILgrQm7p2sGo9
	 8cz4W+VbLPqZDup2cB3toxzjsbFLthob4OxFGghE1957lBTT3K9Xm3QPK6SXRKEL7c
	 U1kf+F6G7PEMiYkHyE2saaJoX8At7+hUR5fKVz8h+EAL80aujSzmAt7kCimQ4ARTSL
	 lMWEgylkqNPlTzQFWyfMrAFJPMjM7RTE0EMLTWvhZfep92xiOFn/DeoeQz6nBsSIVN
	 r/YSeyeJLygcv8I51MAu8jo1WVKzJTmUXx9HlZXUmj/gprRAPHBctOPUwTryz4wEqF
	 NVxTu3RH4Zdkw==
Date: Fri, 29 May 2026 16:32:24 +0100
From: Will Deacon <will@kernel.org>
To: Sebastian Ene <sebastianene@google.com>
Cc: Marc Zyngier <maz@kernel.org>, catalin.marinas@arm.com,
	oupton@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, vdonnefort@google.com, yuzenghui@huawei.com,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH] KVM: arm64: Forward FFA_NOTIFICATION* calls to TrustZone
Message-ID: <ahmxiFXXTupafbXw@willie-the-truck>
References: <20260501114447.2389222-2-sebastianene@google.com>
 <86wlxgy00t.wl-maz@kernel.org>
 <afxuDpecPCVA56cL@google.com>
 <86se83xrwx.wl-maz@kernel.org>
 <afyd8u85L5XIl6dh@google.com>
 <86qznnxptx.wl-maz@kernel.org>
 <af3fW468-f1KXCrC@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af3fW468-f1KXCrC@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_083231_580557_FA4022C8 
X-CRM114-Status: GOOD (  15.62  )
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

On Fri, May 08, 2026 at 01:04:27PM +0000, Sebastian Ene wrote:
> While at it I discovered that none of the FF-A calls in the proxy
> currently check for these SBZ registers. Would you be ok with a diff that
> fixes this before the patch with the notifications ?

I'd probably structure it as a separate patch per call, tbh. That way,
the commit message can talk about the specific fields that are reserved
for a given call. See below.

> Refactor the handling logic in pKVM FF-A proxy to support checking for
> SBZ/MBZ values. While at it, drop the do_ffa_mem_xfer macro and replace
> it with two functions that make it clear that we re-write the
> function-id with a 64-bit variant, to keep the same behavior as before.
> Keep each handler in an array of structures together with a mask that
> corresponds to the SBZ registers the spec expects.

Although I agree that we should be enforcing SBZ/MBZ paramaters (because
we have no idea what they might do in future versions of the spec), I
also think that doing this at the register level is too coarse.

For example, the VM ID parameter to FFA_NOTIFICATION_BITMAP_CREATE has bits
31:16 as MBZ. So I think we probably need to do the checking on a
per-function basis, like Per is doing in his series:

https://lore.kernel.org/r/20260501-host-direct-messages-v6-0-3f4af727ed85@google.com

Will

