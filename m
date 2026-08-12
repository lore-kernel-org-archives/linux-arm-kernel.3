Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018C1C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 12:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXCVFy3Yiy0uZz31vPc+o0EnvztfwFk2wLhWfLPEQy0=; b=pZ73XxFzpbzgFITgHm3YWs4Bci
	x8qtEbAmvoD8LoZDAIqaWM6tKOLOU1Ncsr29n09Gxza8DnHaYA+LHBhyibGbPvLdGdfrFWqs24GSB
	/v62+zzl7/QgwNClk9TWMIwRedynUKI12/wDLk+6F8PrScLVGFpV6/RDiCqkjK+tS4Pr4Gk77SV9g
	H7RTRM1KHzeVVpECo+NAKsTdbFbjq98N4GFipUpM0yP7cRGd17EK/fcUdCDWfdmH8O7/D6PleQjDr
	FtFlQIkokDU2QThuuWH+gsEeMHUMFKUhu80KqCKvYrhQcpuhk5PYI9p5hT2HzB7E9GYU3lPkH1gNT
	VIWvcdUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7lh-0000000G9mQ-0wCw;
	Wed, 12 Aug 2026 12:09:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7le-0000000G9m3-0ikJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 12:09:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B611142B32;
	Wed, 12 Aug 2026 12:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174C01F000E9;
	Wed, 12 Aug 2026 12:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786536548;
	bh=dXCVFy3Yiy0uZz31vPc+o0EnvztfwFk2wLhWfLPEQy0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FDAkffAB+OU34vurLIkM7zx4W46P8zSgyFFcth1g+LOWUw2hurxz3+MdYFjFueu6A
	 W4ky5lwI5mHIFP4YDBgQtWxrzymuszFwphsvDYbbjTvldRzeS5T4ZX51zGer93RBn9
	 4s7Dnj+/OZAd9LsVAmvoFc3h9PQNuaMSiFyjIyZg29eqOhyIq9OGTWdq3EJrkCnn27
	 6jRH2Z5iir4/Ddj0ySN6FNhTxspMp9HcGvlU9rywFB1h7UHN+5q30/q0ma+x8KdEgC
	 FdP/Y3eraKM7ixvqEj3SG9K5fMK67hRG0hiBLDIe0neXeqfCly5Pjp6EWMgq0IZpGk
	 7Uxew/bKgJSHg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Gus Bourg <gus@bourg.net>
Subject: Re: [PATCH] arm64/efi: Avoid voluntary preemption with efi_mm installed
Date: Wed, 12 Aug 2026 13:09:01 +0100
Message-ID: <178653008050.3619485.9655082628156363695.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260811140430.22832-1-will@kernel.org>
References: <20260811140430.22832-1-will@kernel.org>
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

On Tue, 11 Aug 2026 15:04:29 +0100, Will Deacon wrote:
> Gus reports a bad kernel memory access when using software PAN
> (CONFIG_ARM64_SW_TTBR0_PAN=y) on a machine with support for EFI runtime
> services:
> 
>   Unable to handle kernel access to user memory outside uaccess routines
>     at virtual address 00000000f322ff30
>   Mem abort info:
>     ESR = 0x0000000096000004
>     FSC = 0x04: level 0 translation fault
>   Internal error: Oops: 0000000096000004 [#1]  SMP
>   Workqueue: efi_rts_wq efi_call_rts
>   pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>   pc : efi_call_rts+0xd8/0x288
>   Call trace:
>    efi_call_rts+0xd8/0x288 (P)
>    process_one_work+0x178/0x4f8
>    worker_thread+0x194/0x328
> 
> [...]

Applied to arm64 (for-next/mm), thanks!

[1/1] arm64/efi: Avoid voluntary preemption with efi_mm installed
      https://git.kernel.org/arm64/c/e98a9d014637

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

