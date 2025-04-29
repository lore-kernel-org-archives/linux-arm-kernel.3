Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D99C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 20:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvedrWQOUKa2y7ZklDmmQbgIEgSsUfGOeSSmitQGk3c=; b=42vapgCTWgOo2RuJnmfYDJTOLs
	gHf1g1D74TijNFI12ZYsV0VzmH5sIFjs36zPjNmlW6fXJTHOiG2qhQJ9vFBvWBCCxZVTNvI2uoBqD
	lIHswDZfZOwKoYY38UoN9YA7nycYnfvJnnTVEOthB47gaLFzICUb0ZdXYbrAKntW77rX2Xv2PSb7j
	P9qdgbKs/diHxno1+L7L2Kr2Pd0cDmkKHDE2HjXLrUhHOBaGnv/7tXJ/zsfgUQAcYpGsz3u3Xl+NZ
	2Xqxw2U0FJcZLx08+rByZtOgmg5LRsTVKMnkN09wx2jIseNNKyvHsVYVRfORRmEECGTIGa5Du4wRP
	5XpGCLng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rtV-0000000AnAN-02CC;
	Tue, 29 Apr 2025 20:49:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rZ1-0000000AkYV-3WQw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 20:28:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ED8E76846E;
	Tue, 29 Apr 2025 20:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 858EDC4CEE3;
	Tue, 29 Apr 2025 20:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745958503;
	bh=yVQiGQTIo9RNGx1kcMdYwpv2Iyy6ige9ZYny4OmlJuw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t94tYQyva5/fI1bTsOvrcAuWZgqTtzIRx5afVtXJ9exMTO1hd3U2ECNxmayHBYrEK
	 tDYlVQkhTOx2twKfjj2BY4I0hx1LJA7RKTx6Rj/ftyIWQs2G8Boy6M+1dewrs3xwEQ
	 /REjkLXORQ5poiLHG/sElok6YHGE8GSobRwUb1EHtbrnlujYccq8Ob8FTWm1ptUhYm
	 z9T91wkFj8X4UhQbmaiTkaW9J77yLdQMi7m+lOIT/Ul/8fE/EUd81YPBySTp/7EwWV
	 imRWR+vM+WxKzF8nU9sqUMCyHOAoRDgl/Bl6N2jOJBZ1RQxcjirl1l6leAjN/UR+CK
	 Kx44aNX35py5w==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-users@vger.kernel.org,
	Valentin Schneider <vschneid@redhat.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mike Galbraith <efault@gmx.de>,
	Peter Collingbourne <pcc@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Kristina Martsenko <kristina.martsenko@arm.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Petr Tesarik <ptesarik@suse.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Phil Auld <pauld@redhat.com>
Subject: Re: [PATCH 0/1] arm64: enable PREEMPT_LAZY
Date: Tue, 29 Apr 2025 21:27:52 +0100
Message-Id: <174593068821.431779.9112946165910138990.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250305104925.189198-1-vschneid@redhat.com>
References: <20250305104925.189198-1-vschneid@redhat.com>
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

On Wed, 05 Mar 2025 11:49:24 +0100, Valentin Schneider wrote:
> Hey folks,
> 
> This is a resubmission of Mark's patch [1]. I didn't end up changing anything
> other than fluffing up the changelog.
> 
> I ran this under an arm64 VM, added some trace_printk's and checked that
> sched_switch's between runnable hackbench threads would occurr in the right
> conditions:
> o with TIF_NEED_RESCHED_LAZY set
>   o at the tick
>   o at do_notify_resume()
> o with TIF_NEED_RESCHED set
> 
> [...]

Applied to arm64 (for-next/entry), thanks!

[1/1] arm64: enable PREEMPT_LAZY
      https://git.kernel.org/arm64/c/c8597e2dd8b6

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

