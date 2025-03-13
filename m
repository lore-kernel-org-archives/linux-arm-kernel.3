Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770F8C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 22:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGTlMNHCa7C+A7AKqq9ehG7FOSf1xIqof5PWqvP0CNo=; b=1CEQZy0AvSYgfSTnBV0xC7qQW+
	RC7opPSTW5RDBE732YgTqSnetnVqAD4uW4XwydMjxX/LnOdClU/5X04jG3jqAt8p/cPf0R5A4GkTF
	zQtS7M9yPEp2dBYhbMguGVztvYqQHpW2kDBm7EVf++oCtIWynuaOzb+fvvhkgq7kbhygIOl2HPdaX
	6WttUTl8cK3dmnBHHTqB0xWRwSUzwefV0aqqQo77pgnyYgpb7iwnzbErpbaO12lvJE6hzghdbdPrt
	XjFqqW2rZBXLXQeN2OBwnF9G1zk+cUEHjovU6yrXUxeW5cV0QKeWCkinq5EZhX1OtqSbAUJeAemfW
	m+ALNYtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsqkz-0000000Cb14-0AaV;
	Thu, 13 Mar 2025 22:10:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsqjJ-0000000Cakw-1aqG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 22:08:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 040395C104E;
	Thu, 13 Mar 2025 22:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE56C4CEDD;
	Thu, 13 Mar 2025 22:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741903720;
	bh=ezBvF8CtGQo3h+RgO+IQTdZTkG8bJwCjFg1T82y9dbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sS3s1Ufp3kDkfWGxADijig3PYyitlaCg+XrAKu1lGl+vBlpnu0+IbvHLmWpqCZx0H
	 F6zkFbefnAll2pjJf2QKkO0Vc/vUbX6WhYSvb6dYl8llLOcCjdn7rg76Jepuctgg67
	 IBHlYwtcDnAEWnBmJzwgw9MkAVLmhQ/F5b816EQLVUUgIW3evLX6TtoIT7HhK+4GIh
	 0y3ob7aiKHoj77gBgGn4l8xDpD4X+/x9+dsSMd5PERuKA5oOephtN87xp6dVO5bBkh
	 6/O8el+cpTtpWaObpzoYcoOzSVhg9ygOTLlQH9VmCrW8y4zuVQI/82S1kYsCtQ2So5
	 79CLWTaIWvGcw==
Date: Thu, 13 Mar 2025 22:08:36 +0000
From: Will Deacon <will@kernel.org>
To: Emanuele Rocca <emanuele.rocca@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [BUG] ARM64 regression: NULL pointer dereference in
 arm_smccc_version_init+0x90/0x1ac
Message-ID: <20250313220835.GD8101@willie-the-truck>
References: <Z5tuaxgDyFJPAvR0@J2N7QTR9R3>
 <Z5uTCnhfKo5D-_bV@NH27D9T0LF>
 <20250131124103.GA29766@willie-the-truck>
 <Z5zWMU4M_L5k6kII@J2N7QTR9R3>
 <20250204100014.GA777@willie-the-truck>
 <Z6OWxUFxkK9plrm0@NH27D9T0LF>
 <20250206131154.GD3204@willie-the-truck>
 <Z6TqBQKSILZUnYbJ@NH27D9T0LF>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6TqBQKSILZUnYbJ@NH27D9T0LF>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_150841_461339_9DBF0812 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

On Thu, Feb 06, 2025 at 05:57:41PM +0100, Emanuele Rocca wrote:
> On 2025-02-06 01:11, Will Deacon wrote:
> > In your screenshot, x6 looks like it's retained its poison value, but
> > that was the register being corrupted in the initial report. Maybe you
> > could share the diff you made?
> 
> Sure, please see [1]. A kernel built with that patch crashes and all
> registers retain their poison values.

Okey doke, at least it sounds like the firmware isn't taking advantage
of the broken spec, then.

In any case, I think the right way forward here is to use the
out-of-line 1.2 helpers whenever we can (the spectre mitigations can
stay as they are).

Will

