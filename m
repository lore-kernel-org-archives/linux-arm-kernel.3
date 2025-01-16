Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BA0C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 18:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=abK26/le1QQsVLEcf0SVhI1PkI9iNoYWNXZOyH2b47I=; b=qq1Zu7jOWRjz0HXoMsVH0zRpaA
	McilLVEvG4HXL3gyxf0XNDOu+1CdXLa2zOPGveeGZHrZhGSAQWe9QHfPpuRuBrLYWY+DMwl31eM4y
	BbNAbZr0PkbhsNG6IUfRwBdtdtTEPU/aA1IOapNRYMuQPm7ZBvroftWHlgKcMsNZHsDXkOP5Hz5WA
	g+FPOc9igEhO8eyiMoYBzo+Z6uinfvGQX9Z6MRawcZvH6y0u+N8K31UKpZrluI1DB4uAzkxLo/ctL
	gq5xkbgzic2uWEvLlXrc2wp0WNOdzrpBm/NYZK9Eg+5Dz51mB8Yfpb1hBbzWue6qnvJ30DDZd0b2f
	ske9wLeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYV5Q-0000000FpsE-1ikO;
	Thu, 16 Jan 2025 18:59:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYV38-0000000FpeV-0wEj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 18:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737053821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=abK26/le1QQsVLEcf0SVhI1PkI9iNoYWNXZOyH2b47I=;
	b=LXMlOvvJaDs0bpjzHTJU7tXn9wwUGq8qOD2SdEUma1IwjTS5PAbJJk2hBkCc2DxKxey40x
	mj9Bb7iwr6XNefLVheczGnbBEdB30UHneLgXoreh5A1VdeQLGIoGHfo8S/NafrEPYAxN6r
	woNfetWxRIA1QpqWpwfi3k2tsy8Xt7Y=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-156-V8YBea52OhayHexia9GVyw-1; Thu,
 16 Jan 2025 13:55:16 -0500
X-MC-Unique: V8YBea52OhayHexia9GVyw-1
X-Mimecast-MFC-AGG-ID: V8YBea52OhayHexia9GVyw
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0D2AE1955D80;
	Thu, 16 Jan 2025 18:55:14 +0000 (UTC)
Received: from thinkpad-p1.localdomain.com (unknown [10.22.64.94])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 821951955BE3;
	Thu, 16 Jan 2025 18:55:12 +0000 (UTC)
From: Radu Rendec <rrendec@redhat.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Borislav Petkov <bp@alien8.de>
Subject: [RFC PATCH 0/1] arm64: cacheinfo: Avoid out-of-bounds write when DT info is incorrect
Date: Thu, 16 Jan 2025 13:54:57 -0500
Message-ID: <20250116185458.3272683-1-rrendec@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8CyHMjuOC3f6vxDGbnr7qIgOgvrtxuYicyBCGL8_Y88_1737053714
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_105702_329796_2E39AFDC 
X-CRM114-Status: GOOD (  21.33  )
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

Hi all,

I found an out-of-bounds write bug in the arm64 implementation of
populate_cache_leaves() and I'm trying to fix it. The reason why this
is an RFC is that I'm not entirely sure these changes are sufficient.

The problem is described in detail in the patch itself, so I won't
repeat it here. The gist of it is that on arm64 boards where the device
tree describes the cache structure, the number of cache leaves that
comes out of fetch_cache_info() and is used to size the cacheinfo array
can be smaller than the actual number of leaves. In that case,
populate_cache_leaves() writes past the cacheinfo array bounds.

The way I fixed it, the code doesn't change too much and doesn't look
ugly but it's still possible to write past the array bounds if the last
populated level is a separate data/instruction cache. But I'm not sure
if this is a real-world scenario, so this is one of the areas where I'm
looking for feedback. For example, the DT may define a single unified
level (so levels=1, leaves=1) but in fact L1 is a split D/I cache. Or
the DT defines multiple levels, the last one being a unified cache, but
in reality the last level is a split D/I cache. I believe the latter
scenario is very unlikely since typically only L1 is a split D/I cache.

The other thing that doesn't look right is that init_of_cache_level()
bumps the level at each iteration to whatever the node corresponding to
that level has in the `cache-level` property, but that way one or more
levels can be skipped without accounting any leaves for them. This is
exactly what happens in my case (the Renesas R-Car S4 board, described
in arch/arm64/boot/dts/renesas/r8a779f0.dtsi). In this case, even if
populate_cache_leaves() is fixed, the cache information in the kernel
will be incomplete. Shouldn't init_of_cache_level() return -EINVAL also
when a level is skipped altogether?

Last, and also related to the previous question, is a device tree
definition that skips a cache level correct? Or, in other words, should
the definition in r8a779f0.dtsi be fixed?

Thanks!

Radu Rendec (1):
  arm64: cacheinfo: Avoid out-of-bounds write when DT info is incorrect

 arch/arm64/kernel/cacheinfo.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.47.1


