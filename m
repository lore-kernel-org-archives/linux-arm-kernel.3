Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63620D68BDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 23:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpMpS0IQiY6an8UWGWwLEBmqhEy7NKFAs+d1uCx9dMw=; b=H7gVo3JZ5+rMx2fBhZc3NIe4TB
	Epek+4QNuivNJ6s8L7uidsDG7F53J+SiZavzhaEkbhOUhe9lZf0uaZIObdhHHlUkhUYk5LC5wmakv
	GZtrvvaZQ49q8uNjfu6jq0YkleUvLu2j/tMUc232TI6CQU3Tovc7a/cPJeDHFfoFlHrm8UDxSsK2u
	XnZD0hHC3B334Huox3ZKVSpKmPRhoc+JpEFdBmbK6DKD20caxhYxu78dc3W/vgXOKh/gTxWsuQbbx
	jCsXZDYI3vfEjb6KI6U2lxCBsnpKCqTm+NhpgyR0KUyfri2oLJlOXOvRx1ieQ06hzFG68kN2dZ12s
	dscqzV5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC60L-00000004a2T-2d0S;
	Fri, 15 Nov 2024 23:45:33 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC5zQ-00000004ZxF-1OQa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 23:44:37 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1731714274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vpMpS0IQiY6an8UWGWwLEBmqhEy7NKFAs+d1uCx9dMw=;
	b=SUQk/x/oxA5RLzp8LNVdflhV2m+4PPFeFeB7dPQeiO3/Khn74U3psiTrwnpFeiAxK3Npqv
	h9wOYHTb1WSv7UXBzuEeQsnyCsFYw2bpP2oc427+nglG4SpThR6sYq4AjtGrWwsaqlKjEN
	Or/MSVFQX8eHnr/HGkAWLBEGLNZGFmSUdrVjgLF4sPiXlfyzNgLomrok72UnaE6Us51tOQ
	ok16F/sKI8V1Sn8UvjdXtbASc/8fXejrfuUbQhByWYcVqLaVT711BqkD5g4p+UmybO0I2O
	X/FQUQbaqW5ZavpoDdVHx2j7T8+sookeegb/Pm67nqJTO2MhLK9tGf2/yAyNiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1731714274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vpMpS0IQiY6an8UWGWwLEBmqhEy7NKFAs+d1uCx9dMw=;
	b=DrSce24vQjscMxxPy2UFdXvMryeRhk1w/w0cc2+Ik0WSECzrRbRDWR+/p2xIwN0TtwQuqz
	YRYMxNBBgGLifEDw==
To: Zhou Wang <wangzhou1@hisilicon.com>, maz@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 wangwudi@hisilicon.com, prime.zeng@hisilicon.com, Zhou Wang
 <wangzhou1@hisilicon.com>, Nianyao Tang <tangnianyao@huawei.com>
Subject: Re: [PATCH v4] irqchip/gicv3-its: Add workaround for hip09 ITS
 erratum 162100801
In-Reply-To: <20241114082813.3865466-1-wangzhou1@hisilicon.com>
References: <20241114082813.3865466-1-wangzhou1@hisilicon.com>
Date: Sat, 16 Nov 2024 00:44:54 +0100
Message-ID: <87msi0yscp.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_154436_507442_29B1EA6F 
X-CRM114-Status: UNSURE (   8.00  )
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

On Thu, Nov 14 2024 at 16:28, Zhou Wang wrote:

> When enabling GICv4.1 in hip09, VMAPP will fail to clear some caches
> during unmapping operation, which will cause some vSGIs lost.
>
> To fix the issue, invalidate related vPE cache through GICR_INVALLR
> after VMOVP.
>
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Nianyao Tang <tangnianyao@huawei.com>
> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>

This Signed-off-by chain is incorrect. Who authored the patch?

If Nianyao is the author then the changelog lacks a

   From: Nianyao ....

line right at the top.

If you both authored it, then this lacks a Co-developed-by tag.

See Documentation/process/... for further explanation.

Thanks,

        tglx

