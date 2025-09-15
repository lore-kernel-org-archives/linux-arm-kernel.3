Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C190CCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 08:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzTfZ6OkL6obc9RRZlXoM/ipHMTfVXpFSNM7FHA1pyY=; b=rKdTYIQtM5BBDHIP54mfUwXp8u
	uyju40bH22tv1B/Bg/pTHS1RBhzddmckPJmdmt3WPoO/7LGOpEWU8DOjsZclUkzv98uChDEJkrOA9
	jQlHfuVUNWn7+nmlLuNE9XplWVBxbFKwm+uLepH39KhdgS69vjknmxWzI6drz7IWcWjxRygHvUTRK
	PqYBkqD/9FVkWTYeFz+PzTjn7P9AWh1x5MBVfqlzoMr269+b9omwccTm3BsZdzKYbuGGJy+P6OPCi
	A7pzHP0sfC1B0o1Z20gqYFALnR2HNLi9BII9SKBm9BTdZDGksrKV+fsn9xMNbgUqcBVo2lZRxt38z
	cS1FIrUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4xA-00000003I4P-3lpG;
	Mon, 15 Sep 2025 08:52:52 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4x7-00000003I27-3v2r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 08:52:51 +0000
Date: Mon, 15 Sep 2025 10:52:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1757926366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DzTfZ6OkL6obc9RRZlXoM/ipHMTfVXpFSNM7FHA1pyY=;
	b=Mi6ywzPPfRmBkAmPmmB94PBsG5oAxNjMQaRNxHmpFFRQte/ejEj+iFvVnSU059WrUIJWPZ
	We53G9QOrAp0d3hHq9hkC+xDGZvWtoQmIyeRcHLWiAHtW5rwfmj8hzj0BBor/WXWLljKHr
	sb7mlc6wfgkb8y6RwFyC/ePJ+r7gwciLWdGro1KISwtBDOtnW5sFSBcASghzouJssqAZFl
	6P72GjWYOQxrnm1zDq/kraIMBZZd+OjeyjWSpWaMoEO4TLYN1Q2++Fi76HJoLGeAx5xsai
	74/lbH+OPgC4Agtx3TebC1R7gcr6b6upBqDqTUNkSLqWyJknMgoVvEGDzUMgiQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1757926366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DzTfZ6OkL6obc9RRZlXoM/ipHMTfVXpFSNM7FHA1pyY=;
	b=/8h1CSO8vFJcz/ZTIkGrrYdbGZzg3Kci40oMB631Wj5xPFCVqiizAdgJR29SEmSbNeFaaq
	WYGQ/mjmGmv/g1Dw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 0/7] arm64: Make EFI calls preemptible
Message-ID: <20250915085244.JLUfpdSP@linutronix.de>
References: <20250905133035.275517-9-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250905133035.275517-9-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_015250_116669_FDC4E391 
X-CRM114-Status: UNSURE (   8.16  )
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

On 2025-09-05 15:30:36 [+0200], Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>=20
=E2=80=A6
> Note that this is only a partial solution in terms of RT guarantees,
> given that the runtime services execute at the same privilege level as
> the kernel, and can therefore disable interrupts (and therefore
> preemption) directly. But it should prevent scheduling latency spikes
> for EFI calls that simply take a long time to run to completion.

That sounds nice. There is no feature flag that could tell if a specific
EFI-call (or any) will disable interrupts, right? But if the source code
is available, you could check.

Sebastian

