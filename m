Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A041E10F9965
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 17:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GDkEJTGdsCuf/90+9MFhUJVtu1LLkzjA5Q8IZs1x6VI=; b=pJ242n5eNNk29c
	kkgZba2M+g4i6v35itYKVjA81pdcYiwrG9p5GfFm25Z2mtcFHSeajyWbhScQD86yoeMk02jiDQdhP
	0wv86gnztce/mO2/x6/1gjPzHOIdwqQGh4Q6M4lGlKfxkIAifu3LxteoFsuP317UetPfK3Y3XeZHK
	DtfZdmXqNKIbIt3TlGdcvIpUbh9hYSO3TU5vk/X4l8MHsTqDQwh77R48hUfd6eh+nHEMvucbuN1dx
	mSq0pHqpEaXn21lXvh0zjWPkVXdB856SZoyICxoGFJzbQQJw9Un5eMfYyFWWHOaWuKbykpL3f9Xck
	6E8sB2IaRm983LSGPTEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWfO-00000009BNV-1M4V;
	Wed, 08 Apr 2026 17:26:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWfM-00000009BN6-004a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 17:26:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED0912D95;
	Wed,  8 Apr 2026 10:26:04 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 426DE3F641;
	Wed,  8 Apr 2026 10:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775669170; bh=dVCW774j28Njus5lKB0GpNhJZjePb8kSwsI+ZFpj9Tg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BLA67r99koS9C5ZVf4VyDF9N5S78rnWfaC1TAENEWWyBaxX3BFGEVfRBLvrJxMJ7c
	 O44fg39bl6ovrlfn1cCRSrqLzP+CpujYXPU6/8GP6VlDD0rAvnDda3U2Hg4FJlVWgw
	 RObrvfarESMOnFR6tQVTzoh3zZL5h5Zb3mS/+sQM=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: (subset) [PATCH 00/10] arm64/entry:
Date: Wed,  8 Apr 2026 18:25:07 +0100
Message-ID: <177566910725.3319633.9849961191720632419.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407131650.3813777-1-mark.rutland@arm.com>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_102612_094683_3C2C4DAF 
X-CRM114-Status: UNSURE (   8.56  )
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
Cc: ruanjinjie@huawei.com, vladimir.murzin@arm.com, linux-kernel@vger.kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, 07 Apr 2026 14:16:40 +0100, Mark Rutland wrote:
> Since the move to generic IRQ entry, arm64's involuntary kernel
> preemption logic has been subtly broken, and preemption can lead to
> tasks running with some exceptions masked unexpectedly.
> 
> The gory details were discussed in the thread for my earlier attempt to
> fix this:
> 
> [...]

Applied to arm64 (for-next/generic-entry) on top of Thomas' tip branch.
Thanks Mark for the patches and Thomas for providing the entry branch.

[06/10] arm64: entry: Don't preempt with SError or Debug masked
        https://git.kernel.org/arm64/c/2371bd83b3df
[07/10] arm64: entry: Consistently prefix arm64-specific wrappers
        https://git.kernel.org/arm64/c/6879ef130223
[08/10] arm64: entry: Use irqentry_{enter_from,exit_to}_kernel_mode()
        https://git.kernel.org/arm64/c/a07b7b214240
[09/10] arm64: entry: Use split preemption logic
        https://git.kernel.org/arm64/c/ae654112eac0
[10/10] arm64: Check DAIF (and PMR) at task-switch time
        https://git.kernel.org/arm64/c/8d13386c7624

