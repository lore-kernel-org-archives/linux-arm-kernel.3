Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19451C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 08:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5hZ22QT8RyLsAdZuaKt1QczN1BYUT1xrNG23rF5y4k=; b=x6eNZg6iaAOP0uP216EVr/7dMh
	ne6Sipz5UxdRF5ISQ5gThzA0tKzHUszmHkhLzRzC2n5Hf+nH2Tt1P1GedObxkBgdunJk+0CZ8Xrlz
	wKjEasO4iJvDz8i32SBSlcCPLaR71uy1wJEN4832Xb0rvAxCaptXYAEipDr/0EewvbAiKaaURf28/
	whQCWGjIofYt0RCFOns/jKLq3/e214yJi+OeSUNCmuBRc3JwS4bL5NVSAV+C+1VxzdC03YxWpDVfZ
	oG1S9ENvrhT90RQ1SVpoXiIrrNRYLCXAKkX8VbKhKoDI32pDkXMMo7VvQkYwsfE2YTuFV4QSsenSl
	LCUmfIeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0pj-0000000EPpc-43IQ;
	Tue, 07 Jul 2026 08:07:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0pg-0000000EPnl-1URU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 08:07:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EAFF1BCA;
	Tue,  7 Jul 2026 01:07:02 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F345D3F85F;
	Tue,  7 Jul 2026 01:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783411626; bh=sX5EZVB1oH6zpg7xImmTctzFiDXuMYq5ff7tEmh8srU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BWSdSlSUWi/i+8R9Rwqt13/A4lRDyMQiKHmpd+S/MVokGklEgEtGj5nBElK3DzPer
	 00RuQT3IL8dsj29H0B4J5tr/8FDpz5BbRP9Y7F+KxQD0qFJmm1Q+1f0jk7Md4E6QNS
	 m2eA6BqpBKqLTXVUuAGml7AfiY0BxMZ1bGdfTXSE=
Date: Tue, 7 Jul 2026 09:07:03 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v8 08/13] coresight: etm4x: fix inconsistencies with
 sysfs configuration
Message-ID: <20260707080703.GC1024232@e132581.arm.com>
References: <20260629090007.1718746-1-yeoreum.yun@arm.com>
 <20260629090007.1718746-9-yeoreum.yun@arm.com>
 <20260706173940.GB1024232@e132581.arm.com>
 <akvyAOJZDqB4yG3m@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akvyAOJZDqB4yG3m@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_010708_663903_BF5FD125 
X-CRM114-Status: GOOD (  13.95  )
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

On Mon, Jul 06, 2026 at 07:20:48PM +0100, Yeoreum Yun wrote:

[...]

> > However, a corner case was mentioned by Sashiko:
> > 
> >  | It appears etm4_enable_hw() modifies drvdata->ss_status while executing
> >  | via IPI, but sshot_ctrl_store() can modify the same array concurrently
> >  | from process context since the lock is no longer held across the
> >  | smp_call_function_single() call.
> > 
> > "drvdata->ss_status" is a race condition between SMP call and sysfs
> > knobs. Should we change to spinlock_irqsave/irqrestore when access
> > drvdata->ss_status?
> 
> I know this, but  This is currently ignorable since
> whatever perf or sysfs session, the ss_status is always clear
> the PENDING and STATUS bits (and we make a compromise for this right now).
> 
> And the sshot_ctrl_store()'s action is always clear above bits.
> 
> So, This is ignorable comment from Sashiko.

I understand it now, we can ignore it. Thanks for explanation.

