Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5917C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 15:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUvx27V3Sd227BMsMv72LsCM9yrgIFRPyxFpstefJo0=; b=dfvt4P+e7F8spIkjqfy8oSNBbG
	svUJi2dQxIgWZUF3AtTdGQgltxDYHoStFgajSKe38A272ReeC9LQnjgU7v0XqJM+SR0aUpeEsHp/E
	ItkMziKZ9grci5WWkZHuwPgL6l7miX7IlqeA7yA2BphX//xtRjzbS4TC+UiZ47SSgopKyorscK+QX
	LUoQ3jRD1pTg9I7LeXtD/YQw0T2bNR9Libc3pFRxRLntR4FvBP7Yn9Re0fW24jVJcBpkW3c/tgg3e
	kg0zuwuyO3vHmMjb40X9ISqq/29txJmDmK/Fs6PvjfJ4l33WJV5roKSHmd6Q3YEmaldFhz6Si0665
	8qnEMvRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0MA-00000001Gte-3Hyh;
	Sun, 26 Jul 2026 15:01:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo0Lu-00000001GpF-0e3J
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 15:01:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DBCD144E93;
	Sun, 26 Jul 2026 15:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998361F000E9;
	Sun, 26 Jul 2026 15:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785078077;
	bh=AUvx27V3Sd227BMsMv72LsCM9yrgIFRPyxFpstefJo0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QGtS/EOro0RV2qjoiYi+jM4UaAe9kxDBFlnK29t6SsLqV3Hlf8YIwlF5VMoR6I/DT
	 sDUbTqz9cA6wR8HSxZSJQ+zlFWh+ADD64aAbNRxom8iRfAjxe2aERimSKfzBsib9S5
	 61Dhk1HmEiFsuqT3uhINI48JssW3j8L0lixs9ZwfZckneEA65wTTSALwM8K2TmImIs
	 P1UIJ3JLCSXK1D3Pd3gvMHSmGx5Y/wOBtESQVqX3SYKcLcGsCKIqn8FbvSILvgTW6l
	 UpHVP3RyKU2OkZSbn3ek0FNHxsXCz6yIYiW7s8rX9a9nZKeUWmJg14bHotznDRiIy5
	 HVUYhhJfsg08A==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH v2] arm64: futex: Consolidate 'old == new' check in __lsui_cmpxchg32()
Date: Sun, 26 Jul 2026 16:00:54 +0100
Message-ID: <178507589298.3403568.4086495319859266149.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260723130304.3161-1-will@kernel.org>
References: <20260723130304.3161-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 23 Jul 2026 14:03:04 +0100, Will Deacon wrote:
> The LSUI futex implementation relies on a cmpxchg() loop to implement
> FUTEX_OP_XOR, as the architecture doesn't provide unprivileged *EOR
> atomics. Since the unprivileged 'CAST' instructions used to implement
> the cmpxchg() can only operate on 64-bit memory locations, the
> __lsui_cmpxchg32() helper function performs a song and dance to marshall
> the 32-bit futex value into the correct part of a 64-bit register and
> fill the remaining bytes with the neighbouring data.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: futex: Consolidate 'old == new' check in __lsui_cmpxchg32()
      https://git.kernel.org/arm64/c/25ef34b541eb

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

