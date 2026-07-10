Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73AFC44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 21:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6ZivBYGr8LA2bUO7cgwXGSWiepiPbzSVpCEbDDI1mc=; b=vk6kfR+QzlKkiE6fCzIyqjm2TZ
	SMRwS51Ym9IXYftcjqaaB5GBArbutwS7XYNcRegQHdWYWP+9vZ04DW5P8InLy1BrfUmuslv2fMEig
	g9fmFGwHeJ3BJldGL8F/+9b9M6VwL+bKYSXN8e2G2O6k5EowAoxOBFxwy6Ljg9CBObSMEXcjRuh2F
	Q1CZVorvw5bjBT/r/NNTIdJyNsIws32RCmtDnf6X66DTQnSizwgxqKAbUbag1QOuWm3gPz2/s/P8G
	3ZebaF2nbbe3mTaspk+kni0Osh5RQ0CP2269eusUlUumw6RR5ce4oDb36qyQ5DQbMYH38MRK+fDtf
	3kwSfCvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiINk-00000005l1v-2rfG;
	Fri, 10 Jul 2026 21:03:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiINj-00000005l1a-18Xs;
	Fri, 10 Jul 2026 21:03:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E25F43F07;
	Fri, 10 Jul 2026 21:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05B61F00A3D;
	Fri, 10 Jul 2026 21:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783717414;
	bh=A6ZivBYGr8LA2bUO7cgwXGSWiepiPbzSVpCEbDDI1mc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TbNNNPckQrdYDAlUSL/va76XXbFFV/M71lQjXSYpZT/R5DWVOE9hLvDwyepCkV+zw
	 ew9ZsWbwWN3d2JL3oWsBOBLyE83y4owtF0+Eyss+Ai0jBE88hI7KMHwNyYgVLs0tgc
	 R5LE4B1uMRLduiGro3EUze2g8wiC5dBhPdAjQ/NM73CB5K0KQKdHKAEfsrl78RVPG6
	 c1ric7fIVn82IzCB6bfwmTx6BFo+538W0J9wxsGDn5F9e+dvjbVsL8qBKk44CWUlaE
	 c3IW3rfAYZ38PYZ6FJ2XJCt7tcoLdN+QSeg5ptN2Cn+4OZp0QKT8LywmIqJJEXlp6z
	 8TOdPmDMZ7dHw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Subject: Re: [PATCH 7.1.y 0/6] cBPF JIT spray hardening
Date: Fri, 10 Jul 2026 17:03:07 -0400
Message-ID: <20260710163023.agent5-0011@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260709-cbpf-jit-spray-hardening-7-1-y-v1-0-5ac5a2d6797f@linux.intel.com>
References: <20260709-cbpf-jit-spray-hardening-7-1-y-v1-0-5ac5a2d6797f@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Thu, Jul 09, 2026 at 03:22:54PM -0700, Pawan Gupta wrote:
> These backports harden BPF JIT against spectre-v2 class of attacks. Without
> a predictor flush, execution of new BPF program may use stale prediction
> left behind by the freed one.
>
> To avoid this, issue an IBPB flush on all CPUs on JIT program allocation.
> The flush is conditional to spectre-v2 mitigation applied.

Queued the series for 7.1, thanks.

-- 
Thanks,
Sasha

