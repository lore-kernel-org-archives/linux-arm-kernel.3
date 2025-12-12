Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BABD43361
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 01:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hWXJxhX5wME82FGFIrBRzJRgBsQr+OdqP9sUt7Njis=; b=2+gYvHH0jntZNRHZWqBz56vBU0
	gzusGHsn/r9hSOCZay6mqoLJO/+hkQoeV6odQEwT06OS75XrLuJIkiv8zZhbT2FuOgpzkD0OELU51
	u3osPqX0jo28+kLUDdjEU1GC7AgUyifxe3/85THwBa90sHrO2ZeZU51ylxoDRPRQ+dxM3QRSjSBg1
	3lCyiJwVhbj23BqiGkYX57mnbcL8mSrSrbeVhift6+39igGQk8sEYWXNr+nmb+iuG+8kGPNREX7j6
	bnffvTrIZQrIrTDB2SYjZoqr9YTVfZ2Yv105HDzbZOLlSjX9Ybqt6OHFxt5HIyRrUiayoHcaVfnG3
	ngm0gYhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTrhm-0000000HTcb-3Vc8;
	Fri, 12 Dec 2025 01:12:22 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTrhj-0000000HTcC-28lT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 01:12:20 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1765501936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5hWXJxhX5wME82FGFIrBRzJRgBsQr+OdqP9sUt7Njis=;
	b=VI3pH1VcrifbeS9kA3FPBSHylFeLOXjGAye2KPD1jpu3JUjgxWpVrJ7FpQfVodUHXTPATC
	PQlw6QNdJC8x3jc3F7/cvot67LJEbPwOVjjCuGOKF06aYRXBEKuXVBjTQO3rNVN8b2hBhQ
	Yl3yor8zKz7LVv5/SB23naFPfsbs5EwQ7Sn0p2S7wqJ1UN1eZTVTiZ2WWwZW//z9vYv3rD
	OhKN3zFynVYPnDa1v3JPtxSB+ZVXKoeQCfCyW7TiojfhNwEq77I79urwK+TPPzwrc5K/mN
	UpjuzcfUNuBZI3bD4d7Ah5IJ51GjTwUwJC5bk3pkqA4qB+e4NbGbrSFULQvOTw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1765501936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5hWXJxhX5wME82FGFIrBRzJRgBsQr+OdqP9sUt7Njis=;
	b=wX3HdKaaXflaOMKhWkolNsCkdzaVm6/IgPyOJ8qgM/d5MMYeT9V0ed4WOBgPjrqHHa52MA
	7L1NceDmnev/reDQ==
To: Kevin Brodsky <kevin.brodsky@arm.com>, Jinjie Ruan
 <ruanjinjie@huawei.com>, catalin.marinas@arm.com, will@kernel.org,
 oleg@redhat.com, peterz@infradead.org, luto@kernel.org, shuah@kernel.org,
 kees@kernel.org, wad@chromium.org, deller@gmx.de, macro@orcam.me.uk,
 charlie@rivosinc.com, ldv@strace.io, mark.rutland@arm.com,
 song@kernel.org, ryan.roberts@arm.com, ada.coupriediaz@arm.com,
 anshuman.khandual@arm.com, broonie@kernel.org, pengcan@kylinos.cn,
 dvyukov@google.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v9 15/16] entry: Inline syscall_exit_work()
In-Reply-To: <e55e9aae-1d84-42a2-bf6a-edc73608733a@arm.com>
References: <20251204082123.2792067-1-ruanjinjie@huawei.com>
 <20251204082123.2792067-16-ruanjinjie@huawei.com>
 <b382cc8a-3ce9-4fb1-bc0a-a3d9796251d1@arm.com> <87345hfqyh.ffs@tglx>
 <e55e9aae-1d84-42a2-bf6a-edc73608733a@arm.com>
Date: Fri, 12 Dec 2025 10:12:13 +0900
Message-ID: <87wm2sec5u.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_171219_710980_32226644 
X-CRM114-Status: GOOD (  10.93  )
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

On Thu, Dec 11 2025 at 10:52, Kevin Brodsky wrote:
> On 11/12/2025 07:55, Thomas Gleixner wrote:
>> I have a suspicion that it is TIF_NOTIFY_RESUME. If that's the case
>> you're seing the RSEQ overhead, which should be completely gone with the
>> rewrite that got just merged into Linus tree.
>
> I don't think this is related. This patch inlines syscall_exit_work(),
> which is called if some flag in SYSCALL_WORK_EXIT is set. This includes
> syscall-specific stuff like tracing and singlestep. TIF_NOTIFY_RESUME is
> part of EXIT_TO_USER_MODE_WORK, handled in exit_to_user_mode_prepare(),
> and isn't specific to syscall handling.

Indeed. Confused myself.

