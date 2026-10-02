Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF6ACA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 11:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4VkGgo7n4HBEs/biZdCD1XgB9q8yhaoXFYL/V/DAco=; b=eIec2zTw8JVuMXhxHTlTwVJMhT
	Lv07PsaZpWuo0rQ4oswWwMGYpHQBDSIfgW+funVJhUmlkNx6RS7gRfS87/lP7rsSonImH2Lw6WUzX
	fAG/oO+LO1fbs4yZ/mGuLvLtqYfTSN7RE7QnXhgPA3JzbrgWe5jZPsbyY5m+xglBTNw2RlizcjA44
	szPvMD0EgcWjq+J+8z8jbywAzg2KgL8OhpdQYX1qoHaIyrukf+YQnYzuUkjxjKmQ1ymvgCkq02g+D
	1H9IchTdtYfRTp+k1hms7yoK+UaEUypt7M7UqeT6Ao0OwgFmGJko0lGmkw96nvkaeJtccsMBsjItf
	o+466x3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbUR-0000000BU7e-01Um;
	Fri, 02 Oct 2026 11:31:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbUP-0000000BU7V-2hOS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 11:31:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E59940C59;
	Fri,  2 Oct 2026 11:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE901F000FF;
	Fri,  2 Oct 2026 11:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790940704;
	bh=b4VkGgo7n4HBEs/biZdCD1XgB9q8yhaoXFYL/V/DAco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UxdCzIX2CLZmFKixnPhH65yspvPyLQ3+OjjciejtBxFsTdRXWJFKkJpOEJQ1BC6az
	 CSbLZuxNDj8RMKpd4CAVu4c8gxsTY2ESy5fmy0i4THj6sXxDzOzS+OGorQk21k7P1F
	 8YbpFnf7AoieMwzO+GlLzVQP0bggxMzTtCJtbyD2izLXBzxlNwh5GQOLMMAx/TxmbZ
	 uOFrTkXNaFy5tlphaaxvxHX+e+JsnOc+jk7Y/UxoYw7vXLyfKNKcrILk/yxY+6cPaQ
	 rM4HJxW48SjXtn4NtMN3OxhFBeXEkzlzfy0PiNzVk38NCOgEJ6L8OcOSdyi3QOsL0b
	 cbEMgQ5WgZ5iQ==
Date: Fri, 2 Oct 2026 12:31:38 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Peter Maydell <peter.maydell@linaro.org>, 
	Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 14/15] tools: Synchronise the kernel esr.h
Message-ID: <ar-V6snJbqFEmHp-@gremlin>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
 <20260930-arm64-gcs-v21-14-3556644cd927@kernel.org>
 <ar6NXWzQ1rMb1aId@gremlin>
 <680fe21e-beca-4056-84e3-f501fdfed902@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <680fe21e-beca-4056-84e3-f501fdfed902@sirena.org.uk>
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

On Thu, Oct 01, 2026 at 06:27:56PM +0100, Mark Brown wrote:
> On Thu, Oct 01, 2026 at 05:47:42PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Wed, Sep 30, 2026 at 10:48:24PM +0100, Mark Brown wrote:
> > > To pick up definitions for GCS.
> > >
> > > Reviewed-by: Leonardo Bras <leo.bras@arm.com>
> > > Signed-off-by: Mark Brown <broonie@kernel.org>
> >
> > This seems to be out of date, with your series applied to next:
>
> Yeah, though some of those are changes that are in -next only so
> possibly slightly premature.  I'll resync with mainline, really this
> shouldn't be a manual sync :/

Thanks! + Yeah agreed, it's definitely a pain.

--
Cheers, Lorenzo

