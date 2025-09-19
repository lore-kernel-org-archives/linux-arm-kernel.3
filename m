Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E875CCAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 01:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUYIOhYTS8GSXt0ehdXRSmVcCtNUdsb0oM5mZ89sNBc=; b=5CpaF3dsHdhZbnly+Qr0h7PRG+
	0Expian85RbqFWkD5EnXTHpz5J3+luxqXX27CXx+oYfhCKEp/s1QJj09sNmbo/nZhAMnajsresgUs
	Jbmy6yuEIoFEoGn+QxdTF0VC7y0F3qzEKiAOUnDt/MSWyq53Y0yyGCDzmyiX/1rycT0r3S412fwk9
	n4MjkHNDL7ARdyG2KHgO9acSgkO2ClHS9JGyDbmqGxhqVhkBHGrll6aZ1iqTZb+SkrbfXrnMAb894
	ku9V2dv/uM5/PYAPoJW+J2iXpjMQazAmXV5H1+NuXviscETNCtcuZdPkC1VhPlqHNnY/6WTgL+49A
	4H/muV4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzQ7P-00000001cU2-2ltM;
	Fri, 19 Sep 2025 01:40:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzQ7O-00000001cTq-3hi0;
	Fri, 19 Sep 2025 01:40:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C46DB601F9;
	Fri, 19 Sep 2025 01:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B717FC4CEE7;
	Fri, 19 Sep 2025 01:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758246057;
	bh=zPbgxi7Uh2u+IDqPDqnm42rsQFRLGFodybHJ11ddTzU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tpQMoHhm47Bs5bDLnjwYUKoQdkRK6kFewwAFoABQx6dGjucIipLdDoTG4QOsQ1WN8
	 8nambApnBgJ3JlJcfCCPxjjldlmCihFYtrJxmwm4CIHtewRAE3Roq9GtyDVnacIdnD
	 DKY4SL9xmCPM+gjejNtOWFSxBVlnhE1dfmr3qDSb3T5YmGe5Db/g+kbuv/vebqpltQ
	 sd86jUKXvZGL+hlgSwasSUqalKzP0ubsMNteO6cWvpHwDoUv6BiQi+Y/kmtOl+LXC+
	 0DkbpptdV37BY+EasHh/dmeVZ2wDIuLR67LxGREu0wHtn+eKsu/D6pBZYaGAK50oW9
	 IXVuEPf9WFEpA==
Date: Thu, 18 Sep 2025 19:40:55 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
cc: atish.patra@linux.dev, anup@brainfault.org, will@kernel.org, 
    mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
    aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org, 
    linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf: riscv: skip empty batches in counter start
In-Reply-To: <20250804025110.11088-1-cuiyunhui@bytedance.com>
Message-ID: <57999508-fa1d-f6a1-4f40-188a61f54307@kernel.org>
References: <20250804025110.11088-1-cuiyunhui@bytedance.com>
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

On Mon, 4 Aug 2025, Yunhui Cui wrote:

> Avoid unnecessary SBI calls when starting non-overflowed counters
> in pmu_sbi_start_ovf_ctrs_sbi() by checking ctr_start_mask.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>

Thanks, queued for v6.18.


- Paul

