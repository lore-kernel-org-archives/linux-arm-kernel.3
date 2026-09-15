Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0607C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqxuhklxm3wMqMiqJjzJAQ6bz6QwRVOq1Bpdvcb5rkk=; b=0CXSWTM/FycpPZTeFedIUtieX0
	BX9k2wFU5V2Ps+4ZVHzsxXcoiI5DjTm6DsraP3Awt1R8opZjpOSPKkGSW5ahsfeWVIRIlkdgjVTY6
	xrKT2ZF8Xm5XVirgRjFWPiPnLLKGqT2ibeya9CyrrpSBnhnRp4M4mQCIXyBzaapJZJ5NgXvwcyKUr
	qrk4CRPTj3TS4ZK1kd0rB6PXXY3hoOmedKdny8tZqWKWn4bF0/hBO6o2gVzp3kW+cT6pLpkamePiE
	oehBCl7dkYrc/SMyUCj58BOXBKihSseKyyTpfbiw5oITYSra6kTBbZXFsu16ehXlPH3rNeUy2fPFG
	JWbys/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QNo-00000005ujB-4415;
	Tue, 15 Sep 2026 10:27:24 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6QNm-00000005uiV-3QQk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yqxuhklxm3wMqMiqJjzJAQ6bz6QwRVOq1Bpdvcb5rkk=; b=GMdzIQ7cB+pUr6XJoRX+kn4BpR
	QAa7Xq1deVr2ugxKOPxscTo4Wmd/PR/P2YT3jAlWuGg6a75wtQN8ZiSouRICsqiRSTtBSV5sWtnZ6
	82ZmYTPfRXiglaSM2JhFU1VL0+QdKbEr5RZW9orpMY0hCOacKqkSiZ5ug2czJ3/mP04IGhwsIae6y
	IEviqdBDUQEy/DjyUQ0weYRTzqCaPeBXCcbepvIv7Hu7cdBB7IC7ZAi432ureBaDbEly5l0Pz8O8q
	iY2PlxNWjJkZPzeET2U1fvzM8VqKADKsvCnOADLjhmqpWQPJdAaEGBlRLjGuAK+q/7fguIChqZ5q6
	0edPlNHg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x6QNg-004KHd-0x;
	Tue, 15 Sep 2026 10:27:16 +0000
Date: Tue, 15 Sep 2026 03:27:10 -0700
From: Breno Leitao <leitao@debian.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] arm64/sve: Don't zero the SVE state buffer when the SVE
 state is live
Message-ID: <aqkdWl7NemLu_iim@gmail.com>
References: <20260914-b4-arm64-sve-acc-memset-v1-1-67866e442393@debian.org>
 <aqkEPCrWXxaU-mNs@J2N7QTR9R3>
 <aqkUU-kSTOz8NntH@gmail.com>
 <aqkapYE-xtS91laq@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqkapYE-xtS91laq@J2N7QTR9R3>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_032722_867074_02132EE1 
X-CRM114-Status: GOOD (  20.96  )
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

On Tue, Sep 15, 2026 at 11:15:01AM +0100, Mark Rutland wrote:
> On Tue, Sep 15, 2026 at 02:50:27AM -0700, Breno Leitao wrote:
> > On Tue, Sep 15, 2026 at 09:39:24AM +0100, Mark Rutland wrote:
> >
> > I've also dropped few other lines, but kept the benchmark values I've
> > collected. Does this look better now?
> 
> Yep, that looks good to me, with one minor nit below.
> 
> With that fixed up, this all looks good. I assume you'll send a v2.
> 
> > Author: Breno Leitao <leitao@debian.org>
> > Date:   Fri Sep 11 02:57:34 2026 -0700
> > 
> >     arm64/sve: Don't zero the SVE state buffer when the SVE state is live
> > 
> >     Currently do_sve_acc() always zeroes current->thread.sve_state. This is
> >     not necessary in the common case, and avoiding the zeroing has a
> >     measurable impact on some benchmarks.
> > 
> >     In the common case where the task is not preempted and its state is not
> >     altered by a tracer, do_sve_acc() will observe that TIF_FOREIGN_FPSTATE
> >     is clear. In such cases, only the live register values matter, and the
> >     in-memory copy is stale regardless of whether it is saved in
> >     FP_STATE_FPSIMD format or FP_STATE_SVE format.
> > 
> >     This is worth doing because the SVE state is discarded on syscall entry,
>       ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> That should say something like "It is worth skipping the zeroing
> because". We deleted the line saying that skipping the zeroing was safe,
> and so it's not clear what "this" is referring to.

Ack, thanks for the feedback. I will send a v2 shortly.

--breno

