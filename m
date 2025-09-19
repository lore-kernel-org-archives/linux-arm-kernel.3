Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32149CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 07:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ahmi8I+GcTmmAZUmANc9eCnWSPON5wkIuYALFtP4uU=; b=cDzdkYZ/r/7ddcWrfca1bVR5gT
	lCYk65E9d7LN1P+eSdB888ti/zFSV//x9gCDjfdxB5TxeuoZ43yE7yNpXQkRejbhKyafk8JgYpY57
	ZmNdvRPsygyhYE7B6LITSJCktv4GDE/oalze8xe/wf62lu/xvXEUTrDNbNjR9M0R+kDeNaBE2CmDb
	evxXiCHklcyx+yaYkU70wT9/exGltyTUYSy8gXkVjxgF0Og5u9oC8BP6PJSwuwS2LgzYkA11EmsG3
	YQuEEVBmtaN53Fl7PiBXaAz9lw9sPWBeI5T7dzcLDzi9oWoE6iNNU/XTY5tvDMAhBNIgi9f+shOT0
	Jmm9Qw7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVAY-000000020jm-18JA;
	Fri, 19 Sep 2025 07:04:34 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVAU-000000020ae-2J4K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 07:04:33 +0000
Date: Fri, 19 Sep 2025 00:04:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758265449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/ahmi8I+GcTmmAZUmANc9eCnWSPON5wkIuYALFtP4uU=;
	b=P1bMSJkMLHyKesfT0AwsLgU06rAqK8HH8H7JNxf1pZVovtC+a3IwieOtPxAOR5lESys5+a
	uY1UZiiBKw9xLUlmC2bkvQs71/pvsZxJsK5Vk7m5GaLf2ZT8qK+BlJTdEV1bSDZO2scBxh
	T8+Ox9jlcZjN98OjqzJH6w5HZncTdT4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jinqian Yang <yangjinqian1@huawei.com>
Subject: Re: [PATCH v2 00/10] KVM: arm64: Handle effective RES0 behaviour of
 undefined registers
Message-ID: <aM0AYEjk2vgzVzND@linux.dev>
References: <20250918151402.1665315-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918151402.1665315-1-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_000431_924308_9773DE8C 
X-CRM114-Status: GOOD (  18.00  )
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

On Thu, Sep 18, 2025 at 04:13:52PM +0100, Marc Zyngier wrote:
> [After yesterday's blunder, I'm reposting this, with proper commit
>  messages, and having taken Oliver's feedback into account.]
> 
> When a feature is removed from a guest, we ensure that the trap and
> control bits for that particular feature are made RES0.
> 
> For example, SCTLR2_EL2 contains a large number of bits. For any
> feature FEAT_FOO that is controlled by a bit FOO in SCTLR2_EL2, we
> make sure that SCTLR2_EL2.FOO is RES0 if FEAT_FOO is not visible to
> the guest.
> 
> However, nothing makes SCTLR2_EL2 RES0 if FEAT_SCTLR2 is not visible.
> 
> This series aims at solving this sort of situations. It is still quite
> incomplete, but aims at bridging a couple of other series:
> 
> - 20250911114621.3724469-1-yangjinqian1@huawei.com which wants to
>   make EL2-related fields writable to allow migration
> 
> - 20250912212258.407350-1-oliver.upton@linux.dev which wants to align
>   the NV support with the rest of the kernel
> 
> Hopefully this helps getting to a point where we everything is
> sanitised according to the architecture, EL2 on the same footing as
> EL1, and everything migrating in every possible case.

Looks good, let it rip!

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver

