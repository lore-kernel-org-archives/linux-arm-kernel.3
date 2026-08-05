Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A43C55184
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 02:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4me6HB/Ie1xpzJpoqjIi4/tsiZ2xqlMSo5EH8f0pa4=; b=O2gAVxggJDe2KdxxCTRBavpLhg
	6PmJXtZi74Fm3gclITFnF+Akr1S/ctaQ7kAESmDLJxjU9e4i9HNoD4vNkGfXDvdbehEu9hXcKCoOo
	Ul/Lct3hCBZRAvD79ED4kRc83u53ks3hAYaAPXz93EgMyne2Rf7wzwm9uQBBbgN+o9yLeOnjB+L74
	gDdpXk3T76o31X43PSxy0Nxy4RwFpLDIvEx20ZdgEec4l4S9EWIXlM5tYciLlZ1lPjRJguHJdPmWJ
	VWiB3WPX8qOlZyx9MwXgo806TIyTf6o5SGpbcZ6HmYecfDO0RVZznzAoHEOquNZBx9vqkC9kTPDkF
	uh4B+3ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrR9d-000000036Gk-1rwl;
	Wed, 05 Aug 2026 02:14:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrR9b-000000036GG-1roB;
	Wed, 05 Aug 2026 02:14:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A689842AAC;
	Wed,  5 Aug 2026 02:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A3C1F000E9;
	Wed,  5 Aug 2026 02:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785896082;
	bh=+4me6HB/Ie1xpzJpoqjIi4/tsiZ2xqlMSo5EH8f0pa4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=bkCDbivQZAn4erV38EslX808WXOkN+F6hiOGZwrcTOSZ3FGEkM8VxlKzLjwwnRTSn
	 IOKeaMYBl8jiJss7NrJcnTsmgJZvtk+L/xPUNND5N3k3Mvg+LarvaJMniM4UFqxP5C
	 4PDYp9TcasmF1uXzGDDslkmWwo9NM+IBE2ZaBRdsRdA1gjqORMNFWb8Lk0uKgZ6xdw
	 YNS39TRhvb+la1WaOmNtHe340JzwB79vI50FBGsefvguy6EPdCa+W8q+apNpyazl5A
	 1o+gyKrEh8h7H+BDWgDjUO91vfVDVbnKdJjWdHxTKQ0I2t6/DHKdNRpdJVkIyzbAj7
	 YfFPdgMStoSGw==
Date: Tue, 4 Aug 2026 20:14:40 -0600 (MDT)
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
Subject: Re: [PATCH v8 00/22] Add Counter delegation ISA extension support
In-Reply-To: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
Message-ID: <09a2dde3-788b-555e-22ba-2f2582a89524@kernel.org>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
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

Hi Atish,

On Wed, 1 Jul 2026, Atish Patra wrote:

> This series adds the counter delegation extension support. It is based on
> very early PoC work done by Kevin Xue and mostly rewritten after that.
> The counter delegation ISA extension(Smcdeleg/Ssccfg) actually depends
> on multiple ISA extensions.

So as you've probably seen, I've started adding some of the prerequisite 
ISA support patches from your series to the RISC-V for-next branch.  
Looks like you're planning to repost the series at least one more time; 
you can either include those patches again, or base it on RISC-V for-next 
as you wish, but if you include those patches again, please note in your 
cover letter if you've changed anything.


thanks,

- Paul

