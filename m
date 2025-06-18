Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A1EC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 18:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3wTddqyQREB9JRNgHluam73CuuYCuztZ1xmk26tEDUQ=; b=uB032L1E8NRr/lHEAsu7ypIP0S
	xivCteNebTNrBUMF/PRbX9+ljHUUT/gg5xMwEjdIJrJNjLJMNV3tke60bzazQPNzucwBFNn37YFdM
	DTnZcS0oFLCr5LZHHPxraTGTxYliPHnF4Khzl9MMHrtcS2KEXpg4tu3OY6XBv2nX+g1WOAjJPH3hK
	Z48G6WsiGn+/qDZmQxxIOVTp9C2D3atTQM1MTYd8Y5aMr8DFSytYN+eDlpIjz82vighvKDX9chXO+
	UG3wXsgJ1qNcZ9BDA6dW8H+Q3Uex5XPpu4nVgeTFDtJnbNcsuIXzD4NxmH394dgan0ntuq7qI83hT
	FWTPEzow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRxH0-0000000B2SQ-18mG;
	Wed, 18 Jun 2025 18:12:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwFK-0000000AoI9-48se
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Jun 2025 17:06:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3wTddqyQREB9JRNgHluam73CuuYCuztZ1xmk26tEDUQ=; b=MQVjdYZACJ/68/vIhsKs0hLgyW
	uMLS2sPc3afyNjwzl2YZian7Yv8HJ/9lggR7u7UARiHFU7V3aSbkRhuiDAbqkg1GxvO8kqhO53SSN
	EQJXmdDHRS7UC7SmM+mgn2R8VO+I3D1LzREceQfGsK2PMvjD/oy9FGKgzh8N5K/b111hgYMjd7e1E
	pDTI7Pmi6cvypGCTLlvgZ0lPnOzcriCepiu2MGqY0KNhtc7FicWjtM6XTNtJob2/jCQWWY3gR9X6G
	z1ty8rqYBqGQFXsQrPIm2OEl+NwlTZ9dbWlWoxJ9056ydlPxdoyhsvalscbSIFjg9uulQfQjsoprU
	02e9fJ4Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwFE-00000004DYX-0FwC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 17:06:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C31661424;
	Wed, 18 Jun 2025 10:06:10 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DA693F58B;
	Wed, 18 Jun 2025 10:06:30 -0700 (PDT)
Date: Wed, 18 Jun 2025 18:06:28 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Subject: Re: [PATCH v3 12/13] arm64: debug: split bkpt32 exception entry
Message-ID: <aFLyFOALjQyFUt15@J2N7QTR9R3.cambridge.arm.com>
References: <20250609173413.132168-1-ada.coupriediaz@arm.com>
 <20250609173413.132168-13-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609173413.132168-13-ada.coupriediaz@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_180640_378349_1E9E9B41 
X-CRM114-Status: GOOD (  17.01  )
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

On Mon, Jun 09, 2025 at 06:34:12PM +0100, Ada Couprie Diaz wrote:
> Currently all debug exceptions share common entry code and are routed
> to `do_debug_exception()`, which calls dynamically-registered
> handlers for each specific debug exception. This is unfortunate as
> different debug exceptions have different entry handling requirements,
> and it would be better to handle these distinct requirements earlier.
> 
> The BKPT32 exception can only be triggered by a BKPT instruction. Thus,
> we know that the PC is a legitimate address and isn't being used to train
> a branch predictor with a bogus address : we don't need to call
> `arm64_apply_bp_hardening()`.
> 
> The handler for this exception only pends a signal and doesn't depend
> on any per-CPU state : we don't need to inhibit preemption, nor do we
> need to keep the DAIF exceptions masked, so we can unmask them earlier.
> 
> Split the BKPT32 exception entry and adjust function signatures and its
> behaviour to match its relaxed constraints compared to other
> debug exceptions.
> 
> This replaces the last usage of `el0_dbg()`, so remove it.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>

> +#ifdef CONFIG_COMPAT
> +void do_bkpt32(unsigned long esr, struct pt_regs *regs)
> +{
> +	arm64_notify_die("aarch32 BKPT", regs, SIGTRAP, TRAP_BRKPT, regs->pc, esr);
> +}
> +NOKPROBE_SYMBOL(do_bkpt32);
> +#endif /* CONFIG_COMPAT */

Trivial nit: we can drop NOKPROBE_SYMBOL() here, since do_bkpt32() can't
be recurse within kprobes.

Otherwise this all looks good to me!

Mark.

