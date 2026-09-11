Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A86C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 12:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqq4GZUkH2jdAshgaO7CtrxI6Q1SGWpfFlboqDbRmvw=; b=KnBmbKwbDmEZpDhIeIOj98jsf5
	8VUHOBE4QxoHjfD50LVirghIyOLZxrGsz8aq1CdG3MiHLE/Vol2tS2KOqTfLKBt7UqKjPnbFccu17
	rT4lATe+P3Z2aLb+w8qcC1yGXn/1Drb6fuusNUJCAwBn8iN2BdK3uL1G75nEhOZEBxLoR1NgHEBnj
	zL8lwuLH4r82DyBoM2cT+KuuFTM4IX7NKc7BG0ivAFWx5gLSI9T7R4BuldtQcCxdIX62FXwQfkfz5
	20zaopN3Xk9rIgOf/TsENa1egPVrWpql5yy00jSwEvZNtEpJNKQlIkNDSDeJZiP/PmADSbLMejzPT
	CO8N5PQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50kU-0000000GgLX-0vg4;
	Fri, 11 Sep 2026 12:52:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50kS-0000000GgLQ-2TAR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 12:52:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B888F6020C;
	Fri, 11 Sep 2026 12:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A7471F000FF;
	Fri, 11 Sep 2026 12:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789131175;
	bh=hqq4GZUkH2jdAshgaO7CtrxI6Q1SGWpfFlboqDbRmvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZUaH+nILEYyaoHpGgf4b3D7HTRRz9tPzgrnsw+TJcX/kxoI+2rvjHfDVUliK9Mkx1
	 R6ywyUKJWn+3AYh+eCXukGBMeNCHdQYZR9V02TVEj3DTXhMa1pxiT0I4LezuwGZS7V
	 lLU2gx7N0TaWKTFBpYEAk8fQ8oX2RqOYCfNPlrjv9YG7pzTynXFL4GNIVOrqemnp7x
	 bywHkxEJqba13xShTPGpzCsbgvzxenjYhD8P82STxESpkVz+UZYLlAIOXF99eETgWx
	 TF7DyktN4XIMl3tn5YHx3N6g0NrLaKjAUPQcuPSxNeaZVzynoJ6AImFfk8svrI1ahb
	 GCMTX/Lhw7hTA==
Date: Fri, 11 Sep 2026 13:52:49 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 09/19] arm64: smp: Defer RCU registration during
 secondary CPU bringup
Message-ID: <aqP5ofIC8rkmtBtK@willie-the-truck>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-10-will@kernel.org>
 <45c37592-f05d-4b1c-812b-0cb38d1c3e24@huawei.com>
 <ap_hR1mntzm-TZOP@willie-the-truck>
 <f01fc59e-5254-484d-adf9-8dd1c2e58d91@huawei.com>
 <aqFS58mJ4GJNrbZ2@willie-the-truck>
 <19ba4bb9-e2c4-4956-bd8d-b8f50259a422@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19ba4bb9-e2c4-4956-bd8d-b8f50259a422@huawei.com>
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

On Thu, Sep 10, 2026 at 10:47:58AM +0800, Jinjie Ruan wrote:
> 在 2026/9/9 20:36, Will Deacon 写道:
> > I was about to say "don't do this" but then I realised two things:
> > 
> > 1. update_siblings_masks() can trigger lockdep splats outside of
> >    pr_debug() if RCU isn't up and running, e.g.:
> > 
> >     [    0.524042]  show_stack+0x18/0x24 (C)
> >     [    0.524519]  __dump_stack+0x28/0x38
> >     [    0.524546]  dump_stack_lvl+0x64/0x84
> >     [    0.524562]  dump_stack+0x18/0x24
> >     [    0.524576]  lockdep_rcu_suspicious+0x134/0x1cc
> >     [    0.524591]  __lock_acquire+0xee8/0x2cb0
> >     [    0.524606]  lock_acquire+0x11c/0x2fc
> >     [    0.524621]  _raw_spin_lock_irqsave+0x64/0x84
> >     [    0.524641]  of_find_property+0x2c/0x8c
> >     [    0.524659]  detect_cache_attributes+0x1c0/0x6d0
> >     [    0.524676]  update_siblings_masks+0x38/0x288
> >     [    0.524692]  store_cpu_topology+0x4c/0x58
> >     [    0.524706]  secondary_start_kernel+0xdc/0x1c8
> >     [    0.524722]  __secondary_switched+0x120/0x124
> > 
> > 2. This code is running _after_ cpuhp_ap_sync_alive().
> > 
> > So for the next version, I'll reintroduce the call to
> > rcutree_report_cpu_starting(), but move it immediately after the call to
> > cpuhp_ap_sync_alive(). I think that will solve these issues, without
> 
> pr_crit() and pr_warn() (such as vec_verify_vq_map()) in
> check_local_cpu_capabilities() can also trigger lockdep splats as below.
> 
> But I think this is not common on the failure path, so it seems to have
> little impact..

I agree that we shouldn't bend the code out-of-shape to squash a debug
warning on an error path (ideally, printk would handle this internally),
especially as the original message does seem to get printed in the end.

> [    0.158619] smp: Bringing up secondary CPUs ...
> [    0.173958] CPU1: missing HWCAP.
> [    0.174071]
> [    0.174088] =============================
> [    0.174099] WARNING: suspicious RCU usage
> [    0.174197] 7.3.0-rc2-00020-gef0bd63bdd97-dirty #504 Tainted: G        W
> [    0.174217] -----------------------------
> [    0.174226] kernel/locking/lockdep.c:3845 RCU-list traversed in
> non-reader section!!

However, if this is caused by vec_verify_vq_map(), then how are you getting
that to run on the early boot path? check_local_cpu_capabilities() only
calls verify_local_cpu_capabilities() if system_capabilities_finalized().

Or is the backtrace for something else?

Will

