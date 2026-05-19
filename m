Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE194CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1/hbYPNneDp+SvF58i1QUKqeXOi96EICdmW8iAUNSc=; b=t6LE2ffFHzFIbdpA7GtIovDrDk
	v0rpszl7Mgxoi17CeYQkkOweCovvAOjkRdaFZtKSytVxO38jeu7dgyZwxu0nzKgn+qN0gXfjfHHqh
	oSrGaneJxUbgwy7hHZikkbY0q9EOr41uDvedwC+OmhWh5juZ3d09gDhUEpCyHUpAHPGVY/tfXK7jL
	AJeN2vG4KI2XE2doprl6UcN+3uL6WnChXJ7Xwbj6SlNLOsRHGXenWTvOUyHKsxsWDlTfOYDR56y8R
	kX6L7dyfsP48M7TVXB6Pjz7SJBciZyIg6nV81u+0qiSx4v+Vv56Al8mh3yF8MpCs3/NBIcW2K1PYG
	8AXE54Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPM4F-00000001wrO-0x6h;
	Tue, 19 May 2026 15:09:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPM4C-00000001wqG-2duK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:09:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A99153536;
	Tue, 19 May 2026 08:09:01 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EA723F632;
	Tue, 19 May 2026 08:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779203346; bh=u1/hbYPNneDp+SvF58i1QUKqeXOi96EICdmW8iAUNSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=codb4ChKIoi5whEYmCXkP3n6DnCqNUq2cUpiF91JSo3XNGBskL6F7/Xa9apmkRYMN
	 EwTX6RlGzxJ/fwzX5pWzN5Qe1gLN9ZV809jz+EgXvZsVGh+DGa0OampFSGwI3w7xS3
	 h9HX3a8n3lqWJmnIeFzzSkzbUFKl+TKTP2YFRj1Y=
Date: Tue, 19 May 2026 16:09:02 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH] arm64: futex: Consolidate 'old == new' check in
 __lsui_cmpxchg32()
Message-ID: <agx9DmAbHdAoSlWU@arm.com>
References: <20260519090823.7216-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519090823.7216-1-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_080908_762798_D20A7FB4 
X-CRM114-Status: GOOD (  13.20  )
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

On Tue, May 19, 2026 at 10:08:22AM +0100, Will Deacon wrote:
> The LSUI futex implementation relies on a cmpxchg() loop to implement
> FUTEX_OP_XOR, as the architecture doesn't provide unprivileged *EOR
> atomics. Since the unprivileged 'CAST' instructions used to implement
> the cmpxchg() can only operate on 64-bit memory locations, the
> __lsui_cmpxchg32() helper function performs a song and dance to marshall
> the 32-bit futex value into the correct part of a 64-bit register and
> fill the remaining bytes with the neighbouring data.

IIRC, the reason for the current __lsui_cmpxchg32() was not EOR but the
expected futex_atomic_cmpxchg_inatomic() semantics. Looking at it again,
we have wake_futex_pi() that does something else if the ret is 0 but the
value differs. Looking at it again, the caller of wake_futex_pi()
retries on -EAGAIN anyway, so I don't see a correctness issue, it will
eventually hit the condition.

(Sashiko complains about the change but I think we can ignore it)

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

