Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF59106705A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8HbCvSykX7ZmgucfH6PbGdWb632GfI3G5bafomIm20=; b=pzd1BDWHvFi9B57ccH+IanCkxc
	v63vnoc08uu2SOzFjM0UQ2WATT03+rDtxvDxcK25MAmJwaly1QciSlGcn/XqriP8Hp1DMbTtRTXBW
	M+0ognBIjHSeGvzbtCK9yvIvyYtAnFLjq4HVxHZkeBZWZdjYTSMATRg8P5mu/RmUmqvybyiwj7Wq0
	N4GhhQzAMtQAxjEYbmooY248IOib+DyY5FjZNIAjMxQwxJWy8MBqE7QEmlJ+GDatP+AFs6PxlcXnM
	bX3/k6C7lDikNiXJKL6+O5tpzakHzOvzo9SzYwv1qIf7RV73OYnlBkxWuCJiBMp59xNhNcordfw/T
	uOdJ/qZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iEB-0000000EQny-2MF1;
	Thu, 12 Mar 2026 15:45:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iE9-0000000EQnL-1om9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 15:45:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 759C761334;
	Thu, 12 Mar 2026 15:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2892BC4CEF7;
	Thu, 12 Mar 2026 15:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773330332;
	bh=r4ecxK7RLvhzWNftWFyOdBdmsz/jUx8HG/r0fLOrUSs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dHjniYvnm/uMgZW6+uciOd+tGvW104oPd5LLDNdjH4ntpnEkE8H2yhnZRdvquGp9J
	 eex7rnhO9Rso97s5HrRgfrzXrgSvRGx9VR9RfbkP1/2J6tJL3bCZnKjnKnEJ3Mdisn
	 GFHEkhqcR+FgcpsDnsng+GIVEAmZTm5Ha0Jd5ERntJTrg2nYz/f/SJ0hyjLS8+2GFJ
	 WuRd8/eaneaqtbuEl0nz0s5ZUd6vzD+tYSCHtlDe62pQIxpLE6hjWIEoAuks4LXRVp
	 tVWvYx9DIQfzCv/atbf6imG1Sx1rhKJWqXeq1Fgen0fODBtD/N/8tgnaYH9fZJXC67
	 DKN8VTne4Byvw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w0iE5-00000001KVA-2ccN;
	Thu, 12 Mar 2026 15:45:29 +0000
From: Marc Zyngier <maz@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 1/3] KVM: arm64: fix include path for ring buffer implementation
Date: Thu, 12 Mar 2026 15:45:26 +0000
Message-ID: <177333027972.824271.5682048908167993643.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260312123601.625063-1-arnd@kernel.org>
References: <20260312123601.625063-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: vdonnefort@google.com, arnd@kernel.org, rostedt@goodmis.org, oupton@kernel.org, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Thu, 12 Mar 2026 13:35:42 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The simple_ring_buffer.c file is in the source tree rather than
> generated at build time, so the include path is wrong when using
> separate object trees:
> 
> arch/arm64/kvm/hyp/nvhe/trace.c:16:10: fatal error: simple_ring_buffer.c: No such file or directory
>    16 | #include "simple_ring_buffer.c"
> 
> [...]

Applied to next, thanks!

[2/3] tracing: add more symbols to whitelist
      commit: 7e4b6c94300e355a72670c5b896ccc26ac312c63
[3/3] KVM: arm64: tracing: add ftrace dependency
      commit: 9e5dd49de5d82401e92098c03e0a0e978ddd515a

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



