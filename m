Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB1DD2E021
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 08:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=teYggURLbUjXgFRHPCAKbw5hoATyYK9evePO5wWpqTA=; b=US0kaBY/rn+kl3cQJKbJ+dVSXg
	roAhyUb1DbijhAAmj0zgc8mCfh7eNQU7BXG+bqBHCvfD9KsTC5lZDoSVzWhq6i6RqmznYNKk8jvQX
	A3wwz3N4xEK5OTgCY1KMBAJ0f6pdC0KNzUM4pNnMk0f0989drfuC6Sfz1TroMioZC4lP13hB5V0M4
	ZY4tIQDIoN03Lyrng6ublov6luiQvO9K4Znqf2exB8iVbSAfjhT//V2TXms2i/u018sw3GY0Ns5Hh
	YD7k36dzGhbyEtQl/hkfrYTJzBjn0YKu/sjye4UQpNqmHP/iFza82phBj164FzVfquTbyAzc6OpNv
	X7orhMVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WUp-0000000DWDC-3f8w;
	Wed, 23 Oct 2024 08:13:35 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WL9-0000000DUQP-1y5G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 08:03:51 +0000
Date: Wed, 23 Oct 2024 10:03:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729670611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=teYggURLbUjXgFRHPCAKbw5hoATyYK9evePO5wWpqTA=;
	b=sPDdRRVOK/BRFeylVX6pQb8u2pmD+W6zOscYPoChOie42lXP49yfifD6utdrdabfMJD6V4
	ILpmwG0MzVwevOAjpFVtv/e+tzyt1E4LJ1NH3eQyWpnVns3vSiXEVvScZIGEgqQL0u7J7b
	ihAFQOXn/oScaioOeSTcMl60DNPP1QY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Subhasish Ghosh <subhasish.ghosh@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [kvm-unit-tests PATCH 0/3] Fix arm64 clang errors on fpu tests
Message-ID: <20241023-f6a2a8d9fdea565838175648@orel>
References: <20241022004710.1888067-1-rananta@google.com>
 <20241022-2c60a0bcbb908435aa91d1ff@orel>
 <CAJHc60wraJEBTAj-MCTA4QC6cEikvxfMcFRX8Ook9EVYKQu_Tw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJHc60wraJEBTAj-MCTA4QC6cEikvxfMcFRX8Ook9EVYKQu_Tw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_010336_096330_5DCD51D2 
X-CRM114-Status: GOOD (  16.55  )
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

On Tue, Oct 22, 2024 at 01:31:24PM -0700, Raghavendra Rao Ananta wrote:
> Hi Andrew,
> 
> >
> > With clang 18.1.8 (Fedora 18.1.8-1.fc40) I get a bunch of errors like
> > these
> >
> >     arm/fpu.c:281:3: error: instruction requires: fp-armv8
> >
> > I used my cross-clang series[1] and configured with
> >
> >     ./configure --arch=arm64 --cc=clang --cflags='--target=aarch64'
> --cross-prefix=aarch64-linux-gnu-
> >
> > [1]
> https://lore.kernel.org/all/20240911091406.134240-7-andrew.jones@linux.dev/
> >
> > Thanks,
> > drew
> 
> I was able to reproduce the errors by pointing to a newer clang (20) and
> applying your series.
> I think we see the errors because llvm decided to disable loads and stores
> on FP registers with "-mgeneral-regs-only" [1]. Explicitly adding
> ".arch_extension fp" for the fp_reg_{read,write}() helped with the build:
> 
> diff --git a/arm/fpu.c b/arm/fpu.c
> index 6b0411d3..f44ed82a 100644
> --- a/arm/fpu.c
> +++ b/arm/fpu.c
> @@ -38,7 +38,8 @@ static inline bool arch_collect_entropy(uint64_t *random)
>  #define fpu_reg_read(val)                              \
>  ({                                                     \
>         uint64_t *__val = (val);                        \
> -       asm volatile("stp q0, q1, [%0], #32\n\t"        \
> +       asm volatile(".arch_extension fp\n"             \
> +                    "stp q0, q1, [%0], #32\n\t"        \
>                      "stp q2, q3, [%0], #32\n\t"        \
>                      "stp q4, q5, [%0], #32\n\t"        \
>                      "stp q6, q7, [%0], #32\n\t"        \
> @@ -71,7 +72,8 @@ static inline bool arch_collect_entropy(uint64_t *random)
>  #define fpu_reg_write(val)                             \
>  do {                                                   \
>         uint64_t *__val = (val);                        \
> -       asm volatile("ldp q0, q1, [%0], #32\n\t"        \
> +       asm volatile(".arch_extension fp\n"             \
> +                    "ldp q0, q1, [%0], #32\n\t"        \
>                      "ldp q2, q3, [%0], #32\n\t"        \
>                      "ldp q4, q5, [%0], #32\n\t"        \
>                      "ldp q6, q7, [%0], #32\n\t"        \
> 
> If you are fine with this, I can push it as a separate patch in v2.

The fix works for me too. Please post v2.

Thanks,
drew

