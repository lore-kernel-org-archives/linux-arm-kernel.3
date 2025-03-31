Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFE8C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 09:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJpsG0NuVPyTrNtoLgQWDGGd++w5Px7qO6TwmxaM6KA=; b=2GN4pfjdDtywnh/wFNQT5I6kb4
	ZcODEHcAUb2DD8jr4KygVFaqGrdZb8A8VRl0Pn2wIQiWLSbnO9fTx9qUxuSAEnqBLDGIwD5dE3ta5
	0llUbdPG/BrePy+YIHcYCMt/NlfVzswPgPSUGpOYx5QRkEfasNFSTGCEN7KVY2NhDTQetYSLp2Zua
	yu/vffASNN1Sf6ix9dxbLj4Y53tq36PNs2GVa7ylFfYfc0M+mCKsQTHyqnob7b9/89nO9Idn4JhoA
	5kS79fBWAIisd8HE7knT03nL7XuZ3NVF90dqxBn8XDN/OWRgNIEeDWqZZ2/PpXnR/678kWl69jW7d
	zkhIHpOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBAQ-0000000HSUy-18RH;
	Mon, 31 Mar 2025 09:10:50 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzB7g-0000000HSCO-2SQK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 09:08:02 +0000
Date: Mon, 31 Mar 2025 11:07:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743412077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cJpsG0NuVPyTrNtoLgQWDGGd++w5Px7qO6TwmxaM6KA=;
	b=ljapDT1U59tqFPqTNSUBYDGOV93YFhboQJkTd95+tbNoESkCXOr+YiUuFn/HZRdQ+7GZeg
	HapYHJNVe9jzE2X5qk9aUdQAB2X1im997mh73gLD+XelCoPFM35X/WsbzfSK8K6JzkQtwX
	IRiT9Ks+43+UXItNNPFdbvMp8l8od3ikZI0p8+9vkrgt5AyjsUxcSu6SnOYwHIO92wITeC
	x9SI+r5n4EHS4/O6qmXbem1GgMXoZmpMvWgUMOfFkGCed5jnAcf25yN2QOeYC8SvPdguw1
	r3HbnhdPv4GLMkRygqm7XSGKOsP9f1XPm4UI6lD4vR1Kqm8uKffUfriEgIORvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743412077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cJpsG0NuVPyTrNtoLgQWDGGd++w5Px7qO6TwmxaM6KA=;
	b=Q66gDQxoAFrIFRlfBtupn6o7SJo99Hdz2bxCh9rlU+qsBsGft9E9GEVtc1hjd8p3pXzf+T
	M/ISyYGZwoFeOQAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rt-users@vger.kernel.org,
	Mike Galbraith <efault@gmx.de>,
	Peter Collingbourne <pcc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Kristina Martsenko <kristina.martsenko@arm.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Juri Lelli <juri.lelli@redhat.com>, Phil Auld <pauld@redhat.com>
Subject: Re: [PATCH 1/1] arm64: enable PREEMPT_LAZY
Message-ID: <20250331090756.L7iXi1Ee@linutronix.de>
References: <20250305104925.189198-1-vschneid@redhat.com>
 <20250305104925.189198-2-vschneid@redhat.com>
 <Z8hAZ09Q40fxLJSk@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z8hAZ09Q40fxLJSk@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_020801_409793_89060C26 
X-CRM114-Status: GOOD (  10.14  )
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

On 2025-03-05 12:15:35 [+0000], Mark Rutland wrote:
> Catalin, Will, given this is small and self-contained, I reckon it makes
> sense to pick this up ahead of Jinjie's series to move arm64 over to the
> generic entry library (which is on my queue of things to review). Even
> if we pick up both, it'll be easier to bisect and debug issues caused by
> this patch alone.

Any updates here? I know it is the merge window but I don't know if
upstream considers this or wants to sit on it until the generic entry
gets in.
In the meantime I stuff it into my RT tree so it does not get lost.

> Mark.

Sebastian

