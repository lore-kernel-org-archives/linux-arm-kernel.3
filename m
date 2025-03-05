Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A5AC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 11:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRDDORjE6c+3nRL9vKLH4Ti8p7Y+SPyMQXlyJKMzRy0=; b=j20+OJeO6+xMGwB5dmOFeFtItT
	fh+Xaie65YdwtvU2f+lxHw6MCdvUh6aKxVwoDDDs03hSD55Rmt/kqspr2GouTj0uHwfeiu2saZEz4
	q07G78e2FnCD3e9oej5HRHlPcg9sWZy0bFn1Jm/PF2VR+R83bfhiNnEQ3tXIOBNTQrXc+fV6MwmJa
	JeZeDh1999EgCTcL8uQeXzro46a9wEFrgNQ25gOLMkR/OzW1UxGMbt9vb56nFsTK1/y0lkhRaHHUn
	bXfXxKEjxZRqnnxOXL8Xs9QT3jTrGMydehqo9JnxOpd7YGkaqRxu3PFrJZXHgIWzEKypv5ewkKUGG
	0qWDvy4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnMF-00000007vfX-2e48;
	Wed, 05 Mar 2025 11:56:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmak-00000007nmT-3Szr
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 11:07:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hRDDORjE6c+3nRL9vKLH4Ti8p7Y+SPyMQXlyJKMzRy0=; b=JlZvMJflxpt0Ha83c2DDCAD7ea
	I/aBkW14BIGAd+gWT55VXfvOm0NEHiQMpsgoia7FHuDMVK4/1Oo0rWWYTGALYoBe/SE4mZfoZFYTO
	q5Fxe4KKkEKwwkGAwK5NTlA0+MHwEvab8FI1RviKTF69P+d73y0mVxH8xemnyejXEJNdApIp1SQdD
	Zo+DGZadEFuIyXfCvrxnHQfGiBV4gHXDsk+pf9JxNg8lX2/1L7RNvvlsnapGMDLozd8ba4DRoXKCa
	vwYosy26oyc6oHwF9gz1iGXU8FL3nRRJCJkNpV7TVS7nqc6XRyuBYGRrV0+5BpXFmE41PcveIoqaS
	qPLIzWEQ==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmah-00000005MLC-3B6P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 11:07:09 +0000
Date: Wed, 5 Mar 2025 12:06:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741172813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hRDDORjE6c+3nRL9vKLH4Ti8p7Y+SPyMQXlyJKMzRy0=;
	b=FOrDYa7eQN2jlxC7ytKE6bZhjfO/OBUqgLqGbkrFA5fvTVCt2scQkvIpVo8XEzaGPVUqIW
	ImijYvC//gJbvhgeN8kvEURLP/h/uOk5Dcp9Gx6cM7bfuRHTzaIB9hTgux+SDY9NeKWtXi
	sBUHAtMZ1RiufG8mqzdHHmd1wm6G9xn1AiBdj0W5JrgmKjqvcCv92hRxrWBrXm5VLB/15m
	+1mmCCJyIzlEgIwDdwmP3IlYcfUckjEV4+3yeAcQXWXuFzfA89Rp/HvLYn/ax/sLtQ/jtK
	QQcZXkoLtUwTX9yl95joOSLvJfl/eEUc2gSpLu330aRnwkyFAIfa3VGdZPGz3g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741172813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hRDDORjE6c+3nRL9vKLH4Ti8p7Y+SPyMQXlyJKMzRy0=;
	b=DIlPIwOmLWYvROvTLasNI3rDu4PycI1v0bprCTpjbEZIK4uMe5rJo/G29nDf/j3Fa05igb
	QUSO4Nm56ZoZU9DQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-users@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Mike Galbraith <efault@gmx.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Peter Collingbourne <pcc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Kristina Martsenko <kristina.martsenko@arm.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Juri Lelli <juri.lelli@redhat.com>, Phil Auld <pauld@redhat.com>,
	Clark Williams <williams@redhat.com>
Subject: Re: [PATCH 1/1] arm64: enable PREEMPT_LAZY
Message-ID: <20250305110651.6dpe0xQU@linutronix.de>
References: <20250305104925.189198-1-vschneid@redhat.com>
 <20250305104925.189198-2-vschneid@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250305104925.189198-2-vschneid@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_110707_832604_E7750788 
X-CRM114-Status: GOOD (  11.44  )
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

On 2025-03-05 11:49:25 [+0100], Valentin Schneider wrote:
> From: Mark Rutland <mark.rutland@arm.com>
> 
> For an architecture to enable CONFIG_ARCH_HAS_RESCHED_LAZY, two things are
> required:
> 1) Adding a TIF_NEED_RESCHED_LAZY flag definition
> 2) Checking for TIF_NEED_RESCHED_LAZY in the appropriate locations
> 
> 2) is handled in a generic manner by CONFIG_GENERIC_ENTRY, which isn't
> (yet) implemented for arm64. However, outside of core scheduler code,
> TIF_NEED_RESCHED_LAZY only needs to be checked on a kernel exit, meaning:
> o return/entry to userspace.
> o return/entry to guest.
> 
> The return/entry to a guest is all handled by xfer_to_guest_mode_handle_work()
> which already does the right thing, so it can be left as-is.
> 
> arm64 doesn't use common entry's exit_to_user_mode_prepare(), so update its
> return to user path to check for TIF_NEED_RESCHED_LAZY and call into
> schedule() accordingly.
> 
> Link: https://lore.kernel.org/linux-rt-users/20241216190451.1c61977c@mordecai.tesarici.cz/
> Link: https://lore.kernel.org/all/xhsmh4j0fl0p3.mognet@vschneid-thinkpadt14sgen2i.remote.csb/
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> [testdrive, _TIF_WORK_MASK fixlet and changelog.]
> Signed-off-by: Mike Galbraith <efault@gmx.de>
> [Another round of testing; changelog faff]
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>

I somehow assumed it was already merged. For what it is worth, this
looks like patch Mike posted in
	https://lore.kernel.org/a198a7dd9076f97b89d8882bb249b3bf303564ef.camel@gmx.de

and tested 

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian

