Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3987CC55174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 17:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Rp3p9+KzYQ9Znhhoh1ycYs7eQjez3sPulHcLx1j/3c=; b=oAy1xVqHG1HnnFrCiqmzn0yqQM
	poQ6n/X9myf41sWv/ADywgsINvypo4QZA1r7/nTGUm54vLlswM8wjlR9+L2hmT2OPDDPBBGfTu5Gm
	hHT1WEDDcUXQhUBBqNhioFuVm2bOaHlCJ8e/hPqcvIwQ30eMPstBcrxFUqutw931Zeh6Q6P/j8Obh
	kruwmVIbbHLc0gBfIPYxjksMOmeC5ZyjyMiL37YgV5Q8CSnr45vZAXPmJCegcPEIyGaGTx3+fbZZv
	JwfWOL2kO2n6s+C3BLebADyYHjHJQqktIa/u/EQkh6FSsz1Bzgeta+ImAj4LQorP+DPw5BpdwNkxD
	ivi3CVhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wskyZ-00000009YXh-1X1U;
	Sat, 08 Aug 2026 17:36:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wskyX-00000009YXV-0QXk;
	Sat, 08 Aug 2026 17:36:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D8E1242A57;
	Sat,  8 Aug 2026 17:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D1F1F000E9;
	Sat,  8 Aug 2026 17:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786210607;
	bh=3Rp3p9+KzYQ9Znhhoh1ycYs7eQjez3sPulHcLx1j/3c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=NTO45Tr40cyUy5n+37USC3LS8AwFa0hTN2h+XTtPQkMsuhtKbfVEGYxPrhY4t2qIH
	 ZrY+kewpmQdkZMqnSyVZ8B4ppKebGfFgUacecJiTJxGPxLuosOIBI6DJVynR7aiCic
	 +iROFZhlPFW0rttORDANMlbMbaq4qhwXJ+VYsEEtcCZ/ezXHfceCCxn2p7M803K9iB
	 dNesTABHyw0mE1/Ody4EvWtOeTFYgjD0Fhnfz8U7A80RQc1cnOcsglMq4Xi3x8MbrV
	 pAfFFewa7/Wvtv5SgCCqpjcTDO29tNcDqFoESv3mHFdHGoe3H/faI/97LqM4+Pmr1m
	 h1RH7peTuBXsA==
Date: Sat, 8 Aug 2026 11:36:46 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Atish Patra <atish.patra@linux.dev>
cc: Will Deacon <will@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Anup Patel <anup@brainfault.org>, Ian Rogers <irogers@google.com>, 
    Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>, 
    linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
    Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
    linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v9 00/20] Add Counter delegation ISA extension support
In-Reply-To: <20260807-counter_delegation-v9-0-58658104e487@meta.com>
Message-ID: <42cea3ec-5f9d-7f47-bb8c-ab2789246918@kernel.org>
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com>
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

On Fri, 7 Aug 2026, Atish Patra wrote:

> This series adds the counter delegation extension support. It is based on
> very early PoC work done by Kevin Xue and mostly rewritten after that.
> The counter delegation ISA extension(Smcdeleg/Ssccfg) actually depends
> on multiple ISA extensions.

I'll put the first ten patches in riscv/for-next, replacing the ones I 
queued up earlier.  Let's take a look at the remaining patches in the v7.4 
time period, due to the other recent updates.


thanks

- Paul

