Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22C7CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 22:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjcaBZqFZNCGe9H1/MCNirEqRZBfI8Lc/aIcYxuLN+0=; b=yeyCxhSkMqztPAqKrX6O4tVWsN
	i9WCjx1WWh1B62PKfhQE5K/Ge+eroESex5j2GJV1mVhjdWXlnSCBw3xvCtJvgu1GW0vJlSe1glp5M
	eqFltEmz5ys6s26Gt5VKBxxnxVdDbmNuRft0mBvy7Sf5Oi9+mu1Pb7Dc/NTotwRQbE0u7ZdzjwFFl
	ei5VdPflJihhRUrzmq7VmYt1h3bI2IBt4OoxEvnu0pHyGbZK25x7Penoy620KZRd6lgOfJuG2CeJd
	FZ0YmFLDxprDqDad3qkumDpA58DSear/paAj8tSMY0IzHomUKidcnQMVYRAv7Aho3kC6ZRrl8B8E5
	qi9y7Pzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEE59-00000001TJk-36XZ;
	Tue, 06 Oct 2026 22:56:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEE53-00000001TIM-2pEH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 22:56:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 544611477;
	Tue,  6 Oct 2026 15:56:12 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BFAB3F86F;
	Tue,  6 Oct 2026 15:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791327375; bh=c4b8vJUIyHvBPnYvfzT9hEIi5nCjAL01RpiqWzEUBF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ST+2A727f7o2+P2zUbhBzO0CJOpTe+58ldfIhmUO1ebSoDgoF6U0vPytj9xNXyORW
	 TmjtRcj2BRyV444iAzhAAlsZ9rbc5clxQb50i7ljV1PmDCAitowztqt61YwEfFkgsm
	 t+N6L5+rWioNTL8hSV8648UiTijO1VwJ0NEFNzlE=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-kselftest@vger.kernel.org,
	Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	shuah@kernel.org,
	broonie@kernel.org,
	usama.anjum@arm.com,
	mark.rutland@arm.com
Subject: Re: [PATCH 0/2] kselftest: Make MTE memory access robust
Date: Tue,  6 Oct 2026 23:56:08 +0100
Message-ID: <179132735993.1339931.13899856903297261117.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922105959.129380-1-vladimir.murzin@arm.com>
References: <20260922105959.129380-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_155620_144343_8F821835 
X-CRM114-Status: UNSURE (   8.47  )
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

On Tue, 22 Sep 2026 11:59:57 +0100, Vladimir Murzin wrote:
> Currently MTE selftests assume that they can skip (expected) MTE
> faults by advancing the PC by 4 in mte_default_handler(), but this is
> not generally safe, as the faults are triggered from arbitrary library
> functions (e.g. memset() and memcpy()). For instance, memset() could
> be implemented as simple as:
> 
>       mov   x3, x0       // copy pointer
>       add   x4, x0, x2   // calculate end
>     loop:
>       strb  w1, [x3], #1 // faulting access
>       cmp   x3, x4
>       b.ne  loop
>       ret
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[1/2] kselftest/arm64/mte: Introduce MTE safe memory accessors
      https://git.kernel.org/arm64/c/1cd024f3f6ae
[2/2] kselftest/arm64/mte: Use MTE safe memory accessors
      https://git.kernel.org/arm64/c/9f7af3cf5cc7

