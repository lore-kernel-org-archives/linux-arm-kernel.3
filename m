Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012F1CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 23:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09enGzMdwTHOCzQX+xD5QbhGx6VV9BagPiq49PFDsko=; b=JeduM5kX3g916QZcIV+h8s+TOG
	b/1M2QoPcLp+s3l6bDA/ZzQhHJhqrrA+uLSmLxPzuIlvGARsgWHV5LKCqp84WZhA9vJLtFjfvo+4H
	mHdTCO/iGL6aEONUcBdLAWC/WPhB0vsKUmiYOpw2NxaW30eiLmNofNPU6fIEh1tQaj5ghEczcDBMn
	qnTEN2PWcUJOTWnbri3ZHp1ybYJ6bslmwkXrPkVC8LlNmXS6LLvx2yG/+jOEamn9BFDGggWa7Vxr+
	fNzT8rX9F5TdrU0lQJl6jVeoSHD0KO9OqyErzhF8v5SBrSTBg+UHPQnKuPLtrPhtm8n4ijkg5LlzW
	01x31/Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8RfU-0000000EkMa-1dxP;
	Mon, 13 Oct 2025 23:09:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8RfT-0000000EkMR-10Sw;
	Mon, 13 Oct 2025 23:09:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ECC2461F93;
	Mon, 13 Oct 2025 23:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 315E1C4CEE7;
	Mon, 13 Oct 2025 23:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760396964;
	bh=964GVitSrXLqahOLbp4jSgZ730OorJTlWGJCMIcXas4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rh2r9sI4UF3ByetUy3e+BG0uXq1IeXSKp94k1dy5x6uGSAljYhP2wwHLLqPLQaIPw
	 upE3KDhFZgNaJuZqicNFgeCH3RV540xVQqzIPV6Lh7sSBv4eUO3bmbuGpFDh2GD26b
	 39ue9VXN8AxrHHse2y8BpYLF7pjlxOLGSu6yORmTVVIdA9hWuSGao1PQ6NqexTtP49
	 y/XFsLMr3brrWFBasxgC15nVjDLEDa9bBW0tt9V3QqYmiNm9UfUUwmd6BiwaF1NX62
	 DVsByxsvDDSQ+ZFlqxC3iDxol1DJ8V8paAp5n8bRaTIfbVXmDjkXKB4I/+v6c4IGQY
	 0CKdAnDvt3X5g==
Date: Mon, 13 Oct 2025 17:09:19 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
    aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
    dianders@chromium.org, johannes@sipsolutions.net, lihuafei1@huawei.com, 
    mark.rutland@arm.com, masahiroy@kernel.org, maz@kernel.org, 
    mingo@kernel.org, nicolas.schier@linux.dev, palmer@dabbelt.com, 
    paul.walmsley@sifive.com, suzuki.poulose@arm.com, thorsten.blum@linux.dev, 
    wangjinchao600@gmail.com, will@kernel.org, yangyicong@hisilicon.com, 
    zhanjie9@hisilicon.com, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
    linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/2] riscv: add HARDLOCKUP_DETECTOR_PERF support
In-Reply-To: <20251009032838.63060-3-cuiyunhui@bytedance.com>
Message-ID: <c0050227-a1da-9e87-870e-de73c6164866@kernel.org>
References: <20251009032838.63060-1-cuiyunhui@bytedance.com> <20251009032838.63060-3-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

Hi Yunhui,

On Thu, 9 Oct 2025, Yunhui Cui wrote:

> Enable the HARDLOCKUP_DETECTOR_PERF function based on RISC-V SSE.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>

Looks reasonable to me.  I do like Doug Anderson's feedback about avoiding 
the line continuation in arch/riscv/Kconfig/ ; we already have other lines 
that are longer than 80 characters there.

If you wouldn't mind fixing that, then:

Acked-by: Paul Walmsley <pjw@kernel.org>  # for arch/riscv


- Paul

