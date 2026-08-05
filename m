Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714F1C55184
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 00:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFCTgjq/Or5ODBbk63bIcNg5rXXpjU6nYEFW2W/vpgM=; b=VZaw3oSjqQbvlbD2vrqkLsVzls
	1GU+oe8BhRUftpxpa7/lqbsKlKmqiUASasrTiNCvugvN7ugCbmUsP1bGKYiHmyWL3+tuyjoea2lvG
	QNTAo5GSertr4BpZQJ9dkhVgbeRJfyuj2ZexyRQbdgCMmHVjgXrmmBmkddmhsdnBm2vewDVqRSgPp
	+gnq8hraqGGqmfMMFFtQEbrO8aDB61kECRFVfAboYqlhMhGKioQNC2Z2qyG97Bx0J7NjWK4aAYvEg
	ejjCVFkFm6GHDAkkbgkgIHJsWKcMFHen/T1J33BSaT+bZYv+fhb/nahyY5lEJ3d/by4eXAIp1XcnW
	6OxjWRsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPkJ-0000000302a-2hSc;
	Wed, 05 Aug 2026 00:44:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPkI-0000000302I-3lmG;
	Wed, 05 Aug 2026 00:44:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4ADFD4098F;
	Wed,  5 Aug 2026 00:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 667CB1F000E9;
	Wed,  5 Aug 2026 00:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785890674;
	bh=wFCTgjq/Or5ODBbk63bIcNg5rXXpjU6nYEFW2W/vpgM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=I6BCuT7oNHKdpzh8SNOspbcleBbAqGTe1saidqIrXWaZdnn1avMTLm1xQACJ3gxlE
	 53zyVvDbW4Ts5xLDPQJXAANNAAkKVMRcgwYF4rij4+sFW0oHVCWgucuK8KFoi+ZcCX
	 Vx09j/Av84C04PfSnF1f4/4YlLtn4ooGL4ZFb02MTQ1enhzlbZ2GIPJkU7exwvOJ1C
	 hHGfEA/tUV3MS4Bc3XBqKzfwiBrjdGr5RlT0SvLwe2EsI0R1EaPP8m2jWEw8mbJXRU
	 T3cGf/OZvQRK6uK01NUECxV3CqoDG1I8Q7ltnBoLVDPUggjAyGbf7Eua7nqP6u02aq
	 hoZZOhobHuyHQ==
Date: Tue, 4 Aug 2026 18:44:31 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Atish Patra <atish.patra@linux.dev>
cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
    Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
    Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>, 
    Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
    linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
    linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v8 06/22] RISC-V: Add Smcntrpmf extension parsing
In-Reply-To: <20260701-counter_delegation-v8-6-7909f863a645@meta.com>
Message-ID: <ef66e907-5049-57d1-d22b-0052085f8de3@kernel.org>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com> <20260701-counter_delegation-v8-6-7909f863a645@meta.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-408665861-1785890674=:1383527"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-408665861-1785890674=:1383527
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Wed, 1 Jul 2026, Atish Patra wrote:

> From: Atish Patra <atishp@rivosinc.com>
> 
> Smcntrpmf extension allows M-mode to enable privilege mode filtering
> for cycle/instret counters. However, the cyclecfg/instretcfg CSRs are
> available in Ssccfg only if Smcntrpmf is present.
> 
> That's why, kernel needs to detect presence of Smcntrpmf extension and
> enable privilege mode filtering for cycle/instret counters.
> 
> Reviewed-by: Clément Léger <cleger@rivosinc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Thanks, queued for v7.3.


- Paul
--8323329-408665861-1785890674=:1383527--

