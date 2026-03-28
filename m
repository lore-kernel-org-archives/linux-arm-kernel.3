Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647DA10F3DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 11:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pW5fXVyzbdHbEg83k44bBzzLv33tzAf/1X2o5lf/oxQ=; b=QmkFC9DqDWW0Y2RtEI4sJR9u4z
	+v/LB3HhLbkviAVtsSRf7DEcoCGde9e+gONIclIHIeAWM8gzGxWF3mRItMzNLG8036O8IyHt0SzHm
	BlFTb8QuWPRxYgZtS5xssAJ/n2vmEP0JEBFrZRQI+hVR1yikwQXNAaNF1F9EYb+86iXw/ochShURQ
	t0nvwGu8YtVj1GLAuZyd0L5xsEXRwPXLO0lYxZfrJ2FOkQcSVzbV1Mhcy7bq0XSsXhdsUQbIaXvXW
	S8IdymWwKUJmSR5WIagagV/Jiy3jO++OgjfBeVvIbxvra8HyOu0EASJDGO8vH2kQOqiFqTtQLDqHZ
	dKkbnwUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Rbj-00000008rwP-135S;
	Sat, 28 Mar 2026 11:13:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Rbh-00000008rw6-08aO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 11:13:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E96664449D;
	Sat, 28 Mar 2026 11:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC116C4CEF7;
	Sat, 28 Mar 2026 11:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774696410;
	bh=LZvpywDsRxTdCKgR0wUedtBmll3ecpmF+HbZFuxFE7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EVaiUMtu/96JeY66SHNIG+6s9+Qpy6TiSR63+I9bReWvctOglnedTvYfMuh5vA4bP
	 MyhL0us1aSIarmX4pq2SHbjqd6cU8k3UvRphUOhMvuLXEyOf8IptBi5s/iSkFT4um1
	 dTNUTgFSNptdcQuKuxrddm2ZlPylqMnFiDFlwA6We/p50SmxYrdwk+8DnHTeh4KdK8
	 QwIn27VxLaHN5XTFbCnguw+bE7PgLR40J6vDV5VUOyljta4cgZJ4J3k3VGYS3qh/Dt
	 r4nSA7PhuYUFYZpnoP2HTr0Ho1yhwpf4SFyuiPjBn8nP/KjKWYR8C4jjOhtUIt2PL+
	 kidHOiAxbjJRg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w6Rbc-00000006cyA-1ofc;
	Sat, 28 Mar 2026 11:13:28 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Zenghui Yu <zenghui.yu@linux.dev>
Cc: oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com
Subject: Re: [PATCH] KVM: arm64: ptdump: Initialize parser_state before pgtable walk
Date: Sat, 28 Mar 2026 11:13:25 +0000
Message-ID: <177469640014.4072287.7784370743375832384.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260328053155.12219-1-zenghui.yu@linux.dev>
References: <20260328053155.12219-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, zenghui.yu@linux.dev, oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_041333_092468_0B67DFED 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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

On Sat, 28 Mar 2026 13:31:55 +0800, Zenghui Yu wrote:
> If we go through the "need a bigger buffer" path in seq_read_iter(), which
> is likely to happen as we're dumping page tables, we will pass the
> populated-by-last-run st::parser_state to
> kvm_pgtable_walk()/kvm_ptdump_visitor(). As a result, the output of
> stage2_page_tables on my box looks like
> 
> 0x0000000240000000-0x0000000000000000   17179869175G 1
> 0x0000000000000000-0x0000000000200000           2M 2   R   px ux  AF BLK
> 0x0000000000200000-0x0000000040000000        1022M 2
> 0x0000000040000000-0x0000000040200000           2M 2   R W PXNUXN AF BLK
> [...]
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: ptdump: Initialize parser_state before pgtable walk
      commit: 570428601ba506e76c265a65626524ef3c5cbc04

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



