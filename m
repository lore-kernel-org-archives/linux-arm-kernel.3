Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40393C55184
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 00:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Y/GClhk5EHpUKcceQDAHdolG3lD11V+IrqaCA9JD5k=; b=c8NUPAVe15gb2xXz4/A1qcBcg3
	cy07Cazvds1orVKd6Y4Guj9vFwAXzEvnU3fzSWGhhxbz7i7DSOZA46HqwPPBnJPkj91KGZEljCSdX
	+Ry2Owo7+YlPGxpRy1YWLSGr+i4AomiwrsUQUdHUW+NesZH8AHDuSKRg46V4Zdgd/i6nG3gZPrKNL
	0avJkneOZZPNAsCT2l8z6/u4O14qvgYB0YtAWMLMpwiRYFG+/wZHzDLvDMU4oOEJOLZwUx7HT+0Gh
	PosGwTWoblj2fLXH04zXymvjzAW5aLl4eU9Lr+zO1nrPgML1mF6Ksj8nGtLrM4+NjkL0UTfsAOo5N
	khqY93Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPkd-000000030AN-3YHg;
	Wed, 05 Aug 2026 00:44:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPkc-0000000309B-1FYd;
	Wed, 05 Aug 2026 00:44:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BB48360052;
	Wed,  5 Aug 2026 00:44:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F8BD1F000E9;
	Wed,  5 Aug 2026 00:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785890693;
	bh=2Y/GClhk5EHpUKcceQDAHdolG3lD11V+IrqaCA9JD5k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=jU9CCpmhzzEP1GFHQ6gK4+x//Tb+0spelDugOnnD+bjbCQCRdG4IPzg87xS3QU+ob
	 sFHmrFBGDF2+L5ojKPsrjf4GcMJMqaKRKAbxLAqu6z+aMaBrGTwzwvvHn9zCb9l4gV
	 6Qd/081cBFxAewpTrs6vtM5eSlEkbZ156WbjMT4Z7bHP/7Kw/otNzRBB+MEM1laYjm
	 c/G2U+wUJ/YS+EZ5pUvVE1YQtZndPGBvxUmTHSOxKkgX/T7GecH8iRdRpycocW02Sy
	 BdLa+3tQeH2kcgPWuJyO5Lz4ByoS9hu2YjkDYzS3GvHhXOn/GhfiJbRQKvuqoYrrPo
	 8LC54yQzLVdVQ==
Date: Tue, 4 Aug 2026 18:44:50 -0600 (MDT)
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
Subject: Re: [PATCH v8 07/22] dt-bindings: riscv: add Smcntrpmf ISA extension
 description
In-Reply-To: <20260701-counter_delegation-v8-7-7909f863a645@meta.com>
Message-ID: <a2f138eb-480a-bd74-0a10-7c699d5f6e1c@kernel.org>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com> <20260701-counter_delegation-v8-7-7909f863a645@meta.com>
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

On Wed, 1 Jul 2026, Atish Patra wrote:

> From: Atish Patra <atishp@rivosinc.com>
> 
> Add the description for Smcntrpmf ISA extension
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Thanks, queued for v7.3.


- Paul

