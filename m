Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D90C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCp9o8Tpknr+HLNfv95Fq9q0yNTjQLDW+MoQACG6EAE=; b=HVoZaGYOd1tJJ6wllx3ZBtKiBl
	/zrB7bqYJkO5FniyUjF231LY5kYLHOc9ivRGMZWcK6QkCcXa58qtrjMee3r2nwHM354NyhjiaAETz
	dVSkiUEvrxmO6VXeEP3ctoZ1WT5NVKCVO/cFdmrOafebzfd7rGfImq3sG2NVnG4ZkvPR8xHJ3WwNR
	g/oEtqnm+xbPJZVHcie39NmeLRAgfVkRt7C4hcFNxXfaeCoyAmV4ek/38NKzWuuVCj3h5u5j53Wqt
	tCGE+tXC93R7dy2jUmJqJCjezNKEViNoT5TiYQ5LeS6jJQior+iFgmtaFy/oyJdB6ds+oZa7BoUpc
	JLdxjDHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiXT-0000000GJXQ-0cDs;
	Wed, 07 May 2025 17:26:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChhS-0000000GAok-1qOx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 16:32:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A9434A4DA7B;
	Wed,  7 May 2025 16:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D341EC4CEE2;
	Wed,  7 May 2025 16:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746635569;
	bh=sYfdB/krsw/EBxR22Kg3ZNA+VeX2W34fW+FnKEqun/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lgm7MR4lvT1kuCyT+mv1OgszYCGAYb40BC/Vc3sR6Ukd4dBC7wVCP/wNPELSYFKsH
	 tSui7EA9e4IYh3lso8EoxvG+B4hBkh6rM1zSXB5H1JdSEtyInNs0qXkqKPQkt9bNDG
	 5JDXeMjB1l2Qche7JB/TOuE4tM+Il8J4yb9ABDLr+cQovEzKqGkkmUTGUnJZ8d0I8O
	 EFfVN4YM1kL8lmOoRA4yJieNxzOfUTuq3H9sQAZYyl/hfZ3HecHkrBskBjcLSLkONy
	 Xu32xHCalcnrkkEneATFjdDRcJlMLmW+9nBEo4JEzD6i/3AZHqRDc2CrPXliUrpBNn
	 mGQhkgZbFmbew==
Date: Wed, 7 May 2025 17:32:43 +0100
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, daniel.kiss@arm.com,
	david.spickett@arm.com, luis.machado@arm.com, maz@kernel.org,
	richard.sandiford@arm.com, sander.desmalen@arm.com,
	tabba@google.com, tamas.petz@arm.com, tkjos@google.com,
	yury.khrustalev@arm.com
Subject: Re: [PATCH 19/20] arm64/fpsimd: ptrace: Gracefully handle errors
Message-ID: <20250507163242.GD2580@willie-the-truck>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
 <20250506152523.1107431-20-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506152523.1107431-20-mark.rutland@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_093250_540233_564890C2 
X-CRM114-Status: GOOD (  17.45  )
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

On Tue, May 06, 2025 at 04:25:22PM +0100, Mark Rutland wrote:
> Within sve_set_common() we do not handle error conditions correctly:
> 
> * When writing to NT_ARM_SSVE, if sme_alloc() fails, the task will be
>   left with task->thread.sme_state==NULL, but TIF_SME will be set and
>   task->thread.fp_type==FP_STATE_SVE. This will result in a subsequent
>   null pointer dereference when the task's state is loaded or otherwise
>   manipulated.
> 
> * When writing to NT_ARM_SSVE, if sve_alloc() fails, the task will be
>   left with task->thread.sve_state==NULL, but TIF_SME will be set,
>   PSTATE.SM will be set, and task->thread.fp_type==FP_STATE_FPSIMD.
>   This is not a legitimate state, and can result in various problems,
>   including a subsequent null pointer dereference and/or the task
>   inheriting stale streaming mode register state the next time its state
>   is loaded into hardware.
> 
> * When writing to NT_ARM_SSVE, if the VL is changed but the resultign VL
>   differs from that in the header, the task will be left with TIF_SME
>   set, PSTATE.SM set, but task->thread.fp_type==FP_STATE_FPSIMD. This is
>   not a legitimate state, and can result in various problems as
>   described above.
> 
> Avoid these problems by allocating memory earlier, and by changing the
> task's saved fp_type to FP_STATE_SVE before skipping register writes due
> to a change of VL. To make this simpler I've pulled the flushing of task
> state earlier and moved the setting of TIF_SVE earlier -- this will be
> cleared when loading FPSIMD-only state, and so moving this has no
> resulting functional change.

Doesn't flushing the state earlier mean that passing a count smaller than
the header size is now potentially destructive to the fpsimd state?

> When changlnig the

This ends mid-sentence and 'changlnig' sounds like a Doors tune.

Will

