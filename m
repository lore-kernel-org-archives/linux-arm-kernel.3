Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F09C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 12:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eg9+kBMWvPedjZGNuy7bvcmP/WEsIuEspvyWucWbORw=; b=KSVluohLwrvLAV8Hha5sAPawR0
	3UqnA0lx0bGE9soTabhk/fn4bHJ7/A4p+ZzA7yUHcJLc/SaXYZfcEQrIsxHmUO7EWfrejVMYyOO8/
	XEY3+LtcqakoXpjs92UJkMwGD9+PA73QhVHwllCNGYZPVci/Jm1SdAu8clzSG6ldFXV2R9+qpxCL7
	tzqsnvvql9s2DJ5/LunxEdI47NvwES3Mj8shee6t1JJPdSIR8nhioNIN53o1ycCgnZxurTt2Rb2J+
	G6XqbqGcL1/fqFuD3i+hmc/WRDLBBowVj2YlapUWG/sMLnTblHPyTNe21UrxNpD4MUSt83vreNQLn
	bP2yu0zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9kN6-00000009gHg-0nVT;
	Tue, 29 Apr 2025 12:47:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9kLB-00000009g1d-0EZ4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 12:45:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8ABC2614FE;
	Tue, 29 Apr 2025 12:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2485AC4CEEB;
	Tue, 29 Apr 2025 12:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745930736;
	bh=6+2F9d2vQJBN+qiFNCygGrCDiRttfJH3PpspPZdJpHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f83v9cDXKLb1VwZ/DAPpgaGXVtLDI+kpIKw5NMOzQ4qa6A5nicXNdkPDgTrtU/voo
	 g5rBqU2eJq1Bo1J4jjqOWZAjueEC8rpxcJui3Ah1q6HjyJSoCs6H5pmDmiYD97MWQJ
	 58upXHW+LefVfSV0qnJCWAICk7A27SvEd4htO43DF/Z5aFxL2+zSaEAKRgXfVxQKd8
	 6ZqeZU8wVcMO0Stvx4aKB97s4Y2y4UvANw046gzyM8fYiu4Kc8y4KEUBir7/hhqX9L
	 D6V4xZ30oNREaq9zY3/6ycZtGrGVMHSsk+bcXKZxDqaj8r4JMHJbegyNCv7gAbnkDv
	 ZPLbRDCkqiNNA==
Date: Tue, 29 Apr 2025 13:45:29 +0100
From: Will Deacon <will@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-users@vger.kernel.org, Mike Galbraith <efault@gmx.de>,
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
Message-ID: <20250429124528.GA25752@willie-the-truck>
References: <20250305104925.189198-1-vschneid@redhat.com>
 <20250305104925.189198-2-vschneid@redhat.com>
 <Z8hAZ09Q40fxLJSk@J2N7QTR9R3>
 <20250331090756.L7iXi1Ee@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331090756.L7iXi1Ee@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Mon, Mar 31, 2025 at 11:07:56AM +0200, Sebastian Andrzej Siewior wrote:
> On 2025-03-05 12:15:35 [+0000], Mark Rutland wrote:
> > Catalin, Will, given this is small and self-contained, I reckon it makes
> > sense to pick this up ahead of Jinjie's series to move arm64 over to the
> > generic entry library (which is on my queue of things to review). Even
> > if we pick up both, it'll be easier to bisect and debug issues caused by
> > this patch alone.
> 
> Any updates here? I know it is the merge window but I don't know if
> upstream considers this or wants to sit on it until the generic entry
> gets in.
> In the meantime I stuff it into my RT tree so it does not get lost.

Sorry for the delay; I'll pick this up in the arm64 tree today.

Will

