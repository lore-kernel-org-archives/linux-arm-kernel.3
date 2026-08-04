Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FC9C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 23:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5BnPeKvczl/zISKgX37K17ckkiwNLgaO+M8ruB7c7I=; b=NLgomywrVxzm1i0ToAhiin1jrP
	PavH5+yqnmCuEHid4mXMwGzxk34yV2AU6WMh9CHoAUkrypM2CibR/ot8igqUZmUhb9v5lYbwLl9ny
	NQ2bUfcLGOrzX6NyfYgdn+8MFlrckv7NVoA/xginnllKCHbDBWpAwaJN7vsHQdtNpET5PYeys59wM
	rkxjEJuYlUQa06T6v38tfFk1TubjSKF3FFzfhfyaqYFkUrCIEXhMw4QsmOhTDuolWQGyXJCTDucWc
	396z8QQ+TmGOi1A1n1GCHyGEOXWgrsTPd9A75qRIdokyIoa29aHGgKII6bLZwgrZ4laaRFrw9cNBs
	sef/YvmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrOmV-00000002w1S-2QQV;
	Tue, 04 Aug 2026 23:42:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrOmU-00000002w17-0R3s;
	Tue, 04 Aug 2026 23:42:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2670C60A6A;
	Tue,  4 Aug 2026 23:42:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3871F000E9;
	Tue,  4 Aug 2026 23:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785886964;
	bh=u5BnPeKvczl/zISKgX37K17ckkiwNLgaO+M8ruB7c7I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=MuFb2EhUMGKv9T3C+Jhu0VcsE44lgi3XhzC5eAfYnv/Cs3K1trwEXDT2bK1YWU4MX
	 dsr97o7JyThLFSC3zRJYlH7B2vx5Hb7OUO324gfctsQLYEKjxKxc060D0vuSS5ZpUV
	 KQezz+f10Cz5mMaUdfPIvQYWIHwqJwwxgz2sXdkcZMTF1vwDXfFeN2NdtY4R3bpRyk
	 sU00diBykYGnZDDIQmBdXQ7KNG6v+U2Z9OGHmDhxSjOKp12rJEceytJ6CkFAdCGpgH
	 1NuP86rxRkGikyyLRNdxirdaKvEfl6dMXt3+Zd6bZ4qwP5wVJAX+oOY+LekIrY/dGf
	 VOfnRTDmDZSQw==
Date: Tue, 4 Aug 2026 17:42:43 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
cc: Atish Patra <atish.patra@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
    Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
    Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>, 
    Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
    linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
    linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v8 02/22] RISC-V: Add Sxcsrind ISA extension CSR
 definitions
In-Reply-To: <3d1f698c-6b76-5252-4e8f-b61671e309c7@kernel.org>
Message-ID: <a890951f-e3e7-6d72-9e83-e4818cab552c@kernel.org>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com> <20260701-counter_delegation-v8-2-7909f863a645@meta.com> <3d1f698c-6b76-5252-4e8f-b61671e309c7@kernel.org>
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

On Tue, 4 Aug 2026, Paul Walmsley wrote:

> Thanks.  It's easier for folks to grep and cross-reference if the official 
> RISC-V extension names are used whenever possible, rather than something 
> like Sxcsrind.  Queued the following patch for v7.3.

...

> 
> RISC-V: Add Smcsrind and Sscrind ISA extension CSR definitions
> 
> From: Kaiwen Xue <kaiwenx@rivosinc.com>
> 
> This adds definitions of new CSRs and bits defined in the Smcsrind and
> Sscrinq ISA extensions.

This was a slightly earlier version of the patch here; what was actually 
queued reads:

> RISC-V: Add Smcsrind and Sscsrind ISA extension CSR definitions
> 
> From: Kaiwen Xue <kaiwenx@rivosinc.com>
> 
> This adds definitions of new CSRs and bits defined in the Smcsrind and
> Sscsrind ISA extensions.


- Paul

