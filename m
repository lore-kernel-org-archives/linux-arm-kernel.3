Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3DCC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 12:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOoonUpRqPNjkNQ4QpxIoYxN7kGTACv6RWczqVQsTyA=; b=hYStfH/lBW/lQdn4Q4cWVJ2OTu
	5mjnp2pJG4GuDe2jocVKyLdM3To0n7EOtILYpduERruauNDnsYKFh9I/SGRGcfcm8zO1QLnv4/At9
	D7q+JxAV9tzrIPGsHb3bVYWwv/Fl+5puHXQynCYl9TAB3GtpG6v+CTv6v0o9UraqG/+AV2LbBgqCf
	B3cfZWRCuiieDzy1jYU6SdHMaRyVlLe53ydD51MAbt/yekYGnHl7SRSh1zhOp915LDqwvstWRWgsd
	zjs2+1CmLhIO3u9AX9LeMVrNeva10S4YFV7zP6lTGkjOpeHRniUgTmgzYNxwVVSVlrCWxVs62buVX
	XQpo8HCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoCr-000000084zH-2RR6;
	Wed, 05 Mar 2025 12:50:37 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoAr-000000084JQ-1ygV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 12:48:34 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741178911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gOoonUpRqPNjkNQ4QpxIoYxN7kGTACv6RWczqVQsTyA=;
	b=Tw78+aD2h4Q9bJxkPET5ggTa0QOFh7B77Nmks06j5mAbVWcNFNVap3iMchhvravH5Q91wO
	apwsgFcp/8WB1IoHmJRjs+C9AZSgjweHdzptvazFiOEABNKOImRQBgejoMiRr9eQAjg89I
	csJ6iv+lD26eTKcCm5TNs9rBCDsI6UxsGMedLoPiDEr2GKAppOqZOlgz1bBK8YKwENu5LK
	8q6ixkDUbCoRZGmMOcv8obqfEcB+s3Nnx6gzyFm9/JhX4JTWwYDFP3Wo9Q3nZYBhVZhDSl
	ND4dGQQDWXEKfsb3XbTw8AiwGnxLckKAY86xlUcypC0c1mSwmWNm78bDWl7bHw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741178911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gOoonUpRqPNjkNQ4QpxIoYxN7kGTACv6RWczqVQsTyA=;
	b=fmJ56wTB1MtRovyNVQEoH5tvswtVy3ruIssA+yqjmGNDv4QDUm3QYMDYGjoIwmnB0Uf4Zp
	2Kuaj9lNmt0kEXAQ==
To: Valentin Schneider <vschneid@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-users@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Mike Galbraith <efault@gmx.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Peter Collingbourne <pcc@google.com>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Thiago Jung Bauermann
 <thiago.bauermann@linaro.org>, Mark Brown <broonie@kernel.org>, Kristina
 Martsenko <kristina.martsenko@arm.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Petr Tesarik <ptesarik@suse.com>, Jinjie Ruan
 <ruanjinjie@huawei.com>, Juri Lelli <juri.lelli@redhat.com>, Phil Auld
 <pauld@redhat.com>
Subject: Re: [PATCH 1/1] arm64: enable PREEMPT_LAZY
In-Reply-To: <20250305104925.189198-2-vschneid@redhat.com>
References: <20250305104925.189198-1-vschneid@redhat.com>
 <20250305104925.189198-2-vschneid@redhat.com>
Date: Wed, 05 Mar 2025 13:48:30 +0100
Message-ID: <87cyev63tt.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_044833_651445_6DB99A88 
X-CRM114-Status: GOOD (  13.54  )
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

On Wed, Mar 05 2025 at 11:49, Valentin Schneider wrote:
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

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

