Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F66CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 07:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0UKg1s0YVqcKspA8T+qvDLFzrwE2Nyk3FttwK4GUlA=; b=Gdihesk/B4wayHZX5j5JbLFR4U
	LhsgPJCKM4+OZ/1OTfrfyMp3dID36klz0bpA887HUeXQWQxcBj2baEQh3iZUL+fZB7hHucNnU0Xb1
	qDvetFph32pZVOI3YSx3v4c75Iea04SSZ98OiJkLFHkkUAV0Mou6y4I1EAwoJvuoQp4pbPLzNl70l
	zAhdKP+2vyFnSsOov7ADJ/NlPZOExavddWTVCXRoL3OtIMz3yvnqbNXZVRdN9bJUytR59r9dazsHB
	cO9VN4+chW8fZRmj1eCSIGPDwsh52oDOoRIRgp71VFRFUoZzrgt37yLxO0eyvRYQ9r6PvpilvfDlZ
	rU17xmHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEN0d-00000003cxP-45jQ;
	Thu, 30 Oct 2025 07:23:47 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEN0b-00000003cx0-0NWN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 07:23:46 +0000
Date: Thu, 30 Oct 2025 08:23:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761809021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R0UKg1s0YVqcKspA8T+qvDLFzrwE2Nyk3FttwK4GUlA=;
	b=qpct3k3rVBvatgBKRTOxrZf5oB9Jqi5BsS/7afPd1iblyTUd9udc5xd5XKdb1bUC7nVWbj
	Ji9cFZniHZmIegtKRhjGzYAPlTvNEA+QNJKU84pZ6w41V6Bqd0AkERcutJIDWmNvo4eL62
	HBJYwDURGGDpjhSjQdBO9P+CI8ci5lccMqHG/tjcHCgZRO6xoJuSfyi5qG15ap4Te9ITug
	kk82e9AgyjaPlzEgZqrIVEmHJe4XIWBHk1WjyLRg2qDyvVDTmPUjpZhY3yhgvdmmwGyymQ
	EDrx9jPTu7mY29wP9xKmAjASV8I+oSCXTYwLUAG5ZUbyfkcudZIvWQVlV9eXyg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761809021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R0UKg1s0YVqcKspA8T+qvDLFzrwE2Nyk3FttwK4GUlA=;
	b=MRut4j+SlWicT4fAROkg13ftS7GmIdFBbYQJE9Nok0ppJzqZKtgAPKtniYY1iNkqEGSKTX
	7dZ+lGMo0vbe4YBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev, linux@armlinux.org.uk,
	tglx@linutronix.de
Subject: Re: [PATCH 4/5] ARM: Disable jump-label on PREEMPT_RT.
Message-ID: <20251030072339.63vdFNo3@linutronix.de>
References: <20251029155918.503060-5-bigeasy@linutronix.de>
 <20251030023959.5416-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251030023959.5416-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_002345_290458_F2713A73 
X-CRM114-Status: GOOD (  16.54  )
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

On 2025-10-30 10:39:59 [+0800], Xie Yuanbin wrote:
> On Wed, 29 Oct 2025 16:59:17 +0100, Thomas Gleixner wrote:
> > jump-labels are used to efficiently switch between two possible code
> > paths. To achieve this, stop_machine() is used to keep the CPU in a
> > known state while the opcode is modified. The usage of stop_machine()
> > here leads to large latency spikes which can be observed on PREEMPT_RT.
> >
> > Jump labels may change the target during runtime and are not restricted
> > to debug or "configuration/ setup" part of a PREEMPT_RT system where
> > high latencies could be defined as acceptable.
> >
> > Disable jump-label support on a PREEMPT_RT system.
> 
> This sounds like a performance issue rather than a feature issue.
> Banning users from using the jump label because of a performance problem
> seems like throwing the baby out with the bathwater.
> Perhaps we could add a config like CONFIG_ARM_JUMP_LABEL_RT_FORCE that
> allows users to select, and inform users in the description about
> potential latency.

It is not a performance issue, it is a latency issue. If the scheduling
latency increases by 300us because of this then the PREEMPT_RT system
becomes worthless.

> Xie Yuanbin

Sebastian

