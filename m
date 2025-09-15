Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0DCCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 16:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCBYprqnCAui1Y9yA5Rnh0XOuIx2VMNSekAkTzQdC7s=; b=ayBEc7DU8TNfZA3X37e/DjWcfJ
	x5/5p+T/D5s1poSuBXIgVDncK1H+I9z+igmAwzUWbCnLWML9pjSA/4cM7gwktUBO3XelQsup2lBu+
	JD7U7dAr9aIvqmK+H/JViFR2TC/EO/2zHF16rtQq7VDNbVSFlKv/Fcmu8wAdxlV+L1L/DowLh17gX
	PxOcXcEu0F6vEdaqWWENeoTK/6DV6V1a5riLvCXHUXapmCKvAfBP/PgA5/PJ9tegnQuetMB947Co/
	Wj+k5Gg060NUDkOXqD2nQyti8S1PzgUO8I3jhocVCEYmm3pDBYZYaXcO0h3Gy3RS9zxYcYgNd10um
	2Qm/0qMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyBhq-000000053Cl-3hDN;
	Mon, 15 Sep 2025 16:05:30 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyBhp-000000053CM-0wMk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 16:05:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1757952328;
	bh=xCBYprqnCAui1Y9yA5Rnh0XOuIx2VMNSekAkTzQdC7s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hPs/bBAPCaFLuPghdzk/XRSqW4i98Gy4h1H2qJpa6/WGYR2SuKBpJUqS9B3uEJvnZ
	 KN/xyyYMZ2cxsYBoUF8SvMz8KwELep19ZNSb74hFeUEUCTNT+4mEfv9Ay9P/IYuLz3
	 1p2Jmqnlt4TNrYRTt7gaUrruy0V2uVqOlKxDb8Ks=
Received: by gentwo.org (Postfix, from userid 1003)
	id 7B5E84034A; Mon, 15 Sep 2025 09:05:28 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 7A8F840345;
	Mon, 15 Sep 2025 09:05:28 -0700 (PDT)
Date: Mon, 15 Sep 2025 09:05:28 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Catalin Marinas <catalin.marinas@arm.com>
cc: Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, James Morse <james.morse@arm.com>, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 0/2] Don't broadcast TLBI if mm was only active
 on local CPU
In-Reply-To: <aLcfvIfFb6xD-NXp@arm.com>
Message-ID: <783f9164-f92e-4a94-cc6f-ad75c83b273b@gentwo.org>
References: <20250829153510.2401161-1-ryan.roberts@arm.com> <aLcfvIfFb6xD-NXp@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_090529_298118_F7C045DC 
X-CRM114-Status: GOOD (  12.28  )
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

On Tue, 2 Sep 2025, Catalin Marinas wrote:

> Christoph Lameter (Ampere) also followed with some refactoring in this
> area to allow a boot-configurable way to do TLBI via IS ops or IPI:
>
> https://lore.kernel.org/linux-arm-kernel/20231207035703.158053467@gentwo.org/
>
> (for some reason, the patches did not make it to the list, I have them
> in my inbox if you are interested)

The patchset is available from kernel.org. Sorry about the mailing list
problems at that time.

https://git.kernel.org/pub/scm/linux/kernel/git/christoph/linux.git/log/?h=tlb

