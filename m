Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF59C624DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 10:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MS+xJQNxLdGqKYm3UoolvVPTT5UdPibXHtDgluZIrTk=; b=XAuBRObZslPbZUQDFDQhS5rg6D
	lr5Cby/6tPHpHMT+QZsgQdEZW5zx+Wn0sFJbwTXL7ey1OXfnHp7P8Nhr2S+HDhuT03lScS7jD3KJV
	RFkj7P1rNu83ewS8iz9vFcitMBcxoYaj033N+T/RNB0rJrIVek1J33oLgzEK7OygOSwSWbKo91e6d
	cJiiQkAnaDMkqwBMtXLZWUm6qxrbQAcF65hITAZUjxUrkVi6j8MJbdNbXsFTM8640o85Fqu6RaeMB
	bUOSQfHlGgf2fa00povHRy1DOz0Dx6DvkzDHqKL99Y8Q3MKByE0ncR/49nVbFyWXgH3jCwHGzJVyB
	MnoGGKcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x256I-0000000H930-04za;
	Thu, 03 Sep 2026 10:55:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x256G-0000000H92e-3mLT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 10:55:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4AEAB412D7;
	Thu,  3 Sep 2026 10:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77E91F000E9;
	Thu,  3 Sep 2026 10:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788432920;
	bh=MS+xJQNxLdGqKYm3UoolvVPTT5UdPibXHtDgluZIrTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ShAwQheQuHIXroeVMwUOAKxfDDGxf+Kjf5b1+cIW4NasQjSoB48stQnAGHdwlbZ2p
	 3EgtO9d+OmzXlpqUsK+0ygDClfybT0H/l/Oo2ay0Pq8mDQ3B1+9Ohj/AUcpmcSxkxE
	 9/o+60V7uhkZ9EKw0+44aMCQNNlEpKURjScsxmvr75acJU8lwEw6aDxYhSInQJrQnS
	 auzyA+A5V125G5Oc4U+63Op5miLvv73nr0NEcwRwOwE3OxpZ7tJKQ2s1wmsy0ELjTu
	 /z9O3hGFSAO9nem0mk/7cDagknWz3Y2a9XryXEe380ehCsIWI3iT4/AmMaxZN0hC1m
	 vSsuzEGHIE9zQ==
Date: Thu, 3 Sep 2026 11:55:14 +0100
From: Will Deacon <will@kernel.org>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	David Matlack <dmatlack@google.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Andreas Grapentin <gra@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Martin <dave.martin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 0/2] Use __u128 in arm64 UAPI headers
Message-ID: <aplSEuD_h9OPOZoD@willie-the-truck>
References: <20260626141730.5976-1-will@kernel.org>
 <d11026b0-1faf-4de1-b562-f6e46e60ef92@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d11026b0-1faf-4de1-b562-f6e46e60ef92@arm.com>
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

On Wed, Sep 02, 2026 at 09:21:32PM -0500, Jeremy Linton wrote:
> On 6/26/26 9:17 AM, Will Deacon wrote:
> > This is version two of the patch I previously sent here:
> > 
> >    https://lore.kernel.org/r/20260619130835.5678-1-will@kernel.org
> > 
> > I even briefly queued that version up, but it exploded spectacularly
> > when building the kselftests for arm64 [1] [2]. So the only change since
> > v1 is the addition of a preliminary patch that adds the '__u128' typedef
> > to the private copy of linux/types.h used by the tools/ directory.
> > 
> > I plan to take this all via the arm64 tree unless anybody objects.
> 
> This seems to be creating a interesting situation that the follow-on commit:
> 10a47fb67340 tools: linux/types.h: Add 128-bit integer types for arm64 UAPI
> structures
> 
> Is missing from older kernel tooling/etc, which means the tools that end up
> pulling this header in won't build on machines running 7.3 kernel headers.
> 
> AKA, build/install master, switch back to an older branch and discover say
> bpftool won't build anymore.

Ah, I guess we need to backport 10a47fb67340 to stable, then?

Will

