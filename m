Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12E4606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 19:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZwCx8OAd;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=CGLhjyKg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eTWKPeuIfwz59bOI90UrR6h7ffnV8rooQ0s4fjwH6to=; b=ZwCx8OAd/+1XJS
	3fCDBU2e/a/TZk/OiZEBIywdAF+EsWYSpMxRGNeB0xdg2VUZZCKRAnNV2VK0ebQizNEBKt5/epFFh
	SKwHyAH/xMjA5yBowW3HQVh/qnJXuu8BsxIDbDZ3GxQk/eev/baRUQMX+jZXSAqmgzn37yGweIJ8y
	2DNmY0Fk+EAOWyLYG8IcYqc0HWVFPEv2aRPQOnLJa9uhngQH1f7iE8eviW4Jk40tRJBbf0cp0+MBj
	jTBQPE3ffQC0l1l4wnf8EjkEqqkgtvBmcTcV8nE1c3ybTs8VMUgaEQ9Z4fjv2D+U9GmLEqihvo7cM
	mA/ckfI1oTMrMVv1PKnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2i5-0000000AGwq-1pmE;
	Thu, 05 Nov 2026 19:01:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2f0-0000000AEnd-1O8j;
	Thu, 05 Nov 2026 18:58:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D78D6430BC;
	Thu,  5 Nov 2026 18:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855751F000C1;
	Thu,  5 Nov 2026 18:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793905085;
	bh=eTWKPeuIfwz59bOI90UrR6h7ffnV8rooQ0s4fjwH6to=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=CGLhjyKgWomfz/N9rLywF0JGTQnu/X45vFcQj/GzW2/mbEOIjiEToLnWzyZ3qYxaz
	 Ycbvz5GtB8scM7ctYofpZlsc5VvaXvw3GEwAnuiivvudNdYoDivNjbLBnHZkgQQ9Fh
	 W1fFZs3s/y7eqTom1+28r5K60LUWjkLGhxarzwrE=
Date: Thu, 5 Nov 2026 10:58:05 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: rafael@kernel.org, tglx@kernel.org, peterz@infradead.org, Heiko Stuebner
 <heiko@sntech.de>, "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH 0/2] powercap: idle_inject: Create threads on demand
Message-Id: <20261105105805.a6d1b38585290ab73597aa6b@linux-foundation.org>
In-Reply-To: <493b853d-fe45-4058-914b-a9ee684701db@oss.qualcomm.com>
References: <cover.1793660202.git.daniel.lezcano@oss.qualcomm.com>
	<493b853d-fe45-4058-914b-a9ee684701db@oss.qualcomm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 5 Nov 2026 19:46:13 +0100 Daniel Lezcano <daniel.lezcano@oss.qualcomm.com> wrote:

> On 11/3/26 00:09, Daniel Lezcano wrote:
> > Idle injection currently registers per-CPU kernel threads during early
> > initialization, including on CPUs for which no idle injection device
> > will be registered.
> > 
> > This series makes thread creation follow the lifetime and CPU mask of
> > each idle injection device.
> > 
> > The first patch adds an optional CPU mask to smpboot thread descriptors.
> > The mask restricts thread creation, CPU hotplug handling and teardown,
> > while preserving the existing behavior for descriptors without a mask.
> > 
> > The second patch uses this support to register idle injection threads
> > when a device registers and destroy them when it unregisters. CPU
> > ownership claims, registration rollback and thread teardown are
> > serialized to prevent overlapping registrations from sharing threads.
> > 
> > Validation includes W=1 builds of the affected objects, whitespace
> > checks and static review of the teardown locking paths. Concurrent
> > registration and CPU hotplug runtime testing remains outstanding.
> > 
> > The series was tested on Rockchip RK3588.
> 
> One thing not specified in this cover is which tree these changes have 
> to go through ?

I'd volunteer Rafael's, after peterz/tglx review.

Please!  Removing one kernel thread per cpu makes the world a better
place.


