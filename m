Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC11E7718E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2K7rXJuT3cFgdQWdfo5pum7DDp54LcMpjvD4unA4b0=; b=dIdBs6V+uHWmpFvWu5rG+jPgJ7
	OxYzFjTEUb4PzcZppKOnK6vwN3wR39LL4Qu+K38ff+0uGe6dgdWwGvA4/b67k6eTABaJpxsOwGm/M
	v3hC5XB6bcgealjsbWRNjwwCASzanT3Tobe1ZrrtfOY0LdAeUOSn7ZKqeELW+BQzu9OtzDBTktdGI
	dSz22UalfQWlE+aluWzdY8NtscqdeBw0HP/vFznhqDIwC34WLuaaqTbZR2QIdUmYe9gH2A7a+Ni0T
	Fisi7kNr8uCUeG7h0y/FB+aVvMm0VM9XxgcmTVA7TkobxYGH/qdHkecdvvdVyatdNmTvgM7A0k6D5
	WZAxIEEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhCR-00000005hwg-0BTQ;
	Fri, 20 Dec 2024 17:54:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOghh-00000005cRF-3tTB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 17:22:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E70CB5C65F0;
	Fri, 20 Dec 2024 17:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A29C4CECD;
	Fri, 20 Dec 2024 17:22:19 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3] arm64/signal: Silence sparse warning storing GCSPR_EL0
Date: Fri, 20 Dec 2024 17:22:17 +0000
Message-Id: <173471533453.2414588.7044123053780464753.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241214-arm64-gcs-signal-sparse-v3-1-5e8d18fffc0c@kernel.org>
References: <20241214-arm64-gcs-signal-sparse-v3-1-5e8d18fffc0c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_092222_011104_367B7397 
X-CRM114-Status: UNSURE (   7.96  )
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

On Sat, 14 Dec 2024 02:12:06 +0000, Mark Brown wrote:
> We are seeing a sparse warning in gcs_restore_signal():
> 
>   arch/arm64/kernel/signal.c:1054:9: sparse: sparse: cast removes address space '__user' of expression
> 
> when storing the final GCSPR_EL0 value back into the register, caused by
> the fact that write_sysreg_s() casts the value it writes to a u64 which
> sparse sees as discarding the __userness of the pointer.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64/signal: Silence sparse warning storing GCSPR_EL0
      https://git.kernel.org/arm64/c/926e86205897

-- 
Catalin


