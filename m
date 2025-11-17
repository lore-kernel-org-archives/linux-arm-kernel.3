Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B780CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 13:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=duAx2VgQ0gYY9TJ/L2rcm8J/86SdKdBcCDHwD6qepxI=; b=PmRCTP0VQpGOerkNf6zg5u71Dr
	2VchgsSIBmgCkOrKFARbOmDJ/s7EX5Pvz5XXZGoWnKoYlc3LvwsvOnQt+4keV7inJEf4jI5e/Nt74
	NT4bczKhJ/7WILgbSd8YheLMHLnVc/4okfFofe4xKee5UvLpo+/bmIP1W7SX5HmIOUgNdz8v8Buzb
	EkkaHsjX8cYOJuAuCLx8UxB3MwwuonErUAO+aLxWCFcGnYgVefKrsLel/9AGxgsGnYUQUSBj75k+6
	8lA17kxfXMR0JXWQ+lwOBUbY5BJKzCUfyMaGrXLY/a1q1hdlrh0SArEQG0toDqrKM/hLiZ34bOVHg
	DRQq5Dig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzWK-0000000GCs4-1S6l;
	Mon, 17 Nov 2025 13:43:52 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzWH-0000000GCrN-3MDv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 13:43:50 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763387025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=duAx2VgQ0gYY9TJ/L2rcm8J/86SdKdBcCDHwD6qepxI=;
	b=zewSX/fr0sDpdjN4IQRj9Ut5gWvKRxTTXFxbJzqo5txZRWjHhx+MXfC7E3coy3iUbi+dLX
	Pyq2kXnMrW2QNB9cBwLNhN32KVmwiD7qCgmDl/oG4d25/zY1ves9JK3aYvcgEQqBgnWAH4
	WUxRVXVr7AFaIJJ8W3ittpBONf0W0EsDv+AGLOzzR/AfNjHUNOYSK8EX9uQFfyox284e+U
	Z8EWDc8bg1XZLj6UASkbJ1UZ2HUSbUw9eSR2O+K/fWIfRLRDCKJ/u+foF2y5yrVIO3gTJJ
	CKx1p7YHlBtCx+IAMfheJ5ECyS+SLF8zh+cpqI1H+LvsFR083USI+4H50Eb0jg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763387025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=duAx2VgQ0gYY9TJ/L2rcm8J/86SdKdBcCDHwD6qepxI=;
	b=GM28NwN1RR4HRdFlS6YPhvkWiGVMLC8h8j/wO7UeoJVD+E0y/pJFq7jFjMBv6CAN0uv0L4
	FPXAaS7hMqdXDHDQ==
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, peterz@infradead.org, luto@kernel.org,
 shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 akpm@linux-foundation.org, ldv@strace.io, macro@orcam.me.uk,
 deller@gmx.de, mark.rutland@arm.com, song@kernel.org, mbenes@suse.cz,
 ryan.roberts@arm.com, ada.coupriediaz@arm.com, anshuman.khandual@arm.com,
 broonie@kernel.org, kevin.brodsky@arm.com, pengcan@kylinos.cn,
 dvyukov@google.com, kmal@cock.li, lihongbo22@huawei.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Cc: ruanjinjie@huawei.com
Subject: Re: [PATCH v7 04/11] entry: Add syscall_exit_to_user_mode_prepare()
 helper
In-Reply-To: <20251117133048.53182-5-ruanjinjie@huawei.com>
References: <20251117133048.53182-1-ruanjinjie@huawei.com>
 <20251117133048.53182-5-ruanjinjie@huawei.com>
Date: Mon, 17 Nov 2025 14:43:44 +0100
Message-ID: <87zf8k7p0v.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_054349_979352_FD3366B0 
X-CRM114-Status: UNSURE (   8.13  )
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

On Mon, Nov 17 2025 at 21:30, Jinjie Ruan wrote:

> In the generic entry code, the part before
> syscall_exit_to_user_mode_work() calls syscall_exit_work(), which
> serves the same purpose as syscall_exit_to_user_mode_prepare()
> in arm64.
>
> In preparation for moving arm64 over to the generic entry
> code, extract syscall_exit_to_user_mode_prepare() helper from
> syscall_exit_to_user_mode_work().
>
> No functional changes.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

