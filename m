Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29D6E9A05F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 19:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3w7pmw/wKbb3HtA7ljGzrXlBgApnedzk1FmbGFZepk=; b=2qfKuhoIGujYbgn6rXNiwsgpb4
	ie/cUxlo0KcS5wX49QmAbG7MjCAxoObNjQbaWCXOLgzHLbgryIHpuozGEiI5iX9CppFzc5RGD3izC
	bSR2QJPJftvSkz9EU3KRa7QmFQKWSwFsq/ri1XMZleie0jR5h/sCoYBp7IEwe4m6kMLEqdVWVa9jc
	wr1Yj3Uav8fupv9KRCHLFdYtJkWgakZHcE5uPGV8ThTCdwUZM0ZAc7+tH+ZectT7eR4QFKGzZQCKr
	IOXYfbmCDjCAeB7NCBQEqtymsiBIE6O+ock2CKplH4+y6iSyVxL5I+i2UG27xi2PK8KiU/ha13Zmn
	qhAJKOqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9tu-0000000BrFb-0uju;
	Thu, 19 Feb 2026 19:41:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9tt-0000000BrFS-1dLT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 19:41:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 27BBB60054;
	Thu, 19 Feb 2026 19:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2130C4CEF7;
	Thu, 19 Feb 2026 19:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771530083;
	bh=X/YpBpZHELPnaJx/3vhuFsswpFYW6glhYMozRGxU4LA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Mkl2KvYUp1F20IHclNSctcmg7lauq73IyKRQVwNswPbGoI6InqBDg3hg3+ZZjrC5+
	 5xmyGuTkpEHJV0pwMOSQD/AGbI7y/Gfu2tlqomWKRqJxzs0k7iyB5FgUZmbvEJN1Jr
	 143Utb+tQnNMyiVaUvN5yMocMVNw6pxSL0gpl782Qnl4kmKLvcRuzlSKeI/6HvCO0O
	 cEdBu7hbLoRa5DdaMkj5qAYzVx+cSc6FNnedSBfqttW3KBbws4+0p75nGaviS2XlKy
	 /DcvgKUxO7GDfsM+RyLVLnUcTPCg3V0w1icecFDyLIzQuKI5jIz6oCCYC+oui9lbvo
	 ctR3U1d0NfrUQ==
Date: Thu, 19 Feb 2026 11:41:20 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Yury Norov <ynorov@nvidia.com>
Cc: linux-kernel@vger.kernel.org, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, "David S. Miller" <davem@davemloft.net>, "Peter
 Zijlstra (Intel)" <peterz@infradead.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Andrew Morton <akpm@linux-foundation.org>, Antoine Tenart
 <atenart@kernel.org>, Christian Brauner <brauner@kernel.org>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Eric Dumazet <edumazet@google.com>,
 Geetha sowjanya <gakula@marvell.com>, Ingo Molnar <mingo@kernel.org>, James
 Clark <james.clark@linaro.org>, Jerin Jacob <jerinj@marvell.com>, Linu
 Cherian <lcherian@marvell.com>, Lukasz Luba <lukasz.luba@arm.com>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Mike Leach <mike.leach@linaro.org>, Moritz Fischer <mdf@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Simon Horman
 <horms@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Subbaraya Sundeep
 <sbhatta@marvell.com>, Sunil Goutham <sgoutham@marvell.com>, Suzuki K
 Poulose <suzuki.poulose@arm.com>, Tom Rix <trix@redhat.com>, Xu Yilun
 <yilun.xu@intel.com>, Yajun Deng <yajun.deng@linux.dev>, Yury Norov
 <yury.norov@gmail.com>, Zhang Rui <rui.zhang@intel.com>, hariprasad
 <hkelam@marvell.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org,
 linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH 00/12] cleanup bitmaps printing in sysfs
Message-ID: <20260219114120.0f4408f7@kernel.org>
In-Reply-To: <20260219181407.290201-1-ynorov@nvidia.com>
References: <20260219181407.290201-1-ynorov@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 19 Feb 2026 13:13:52 -0500 Yury Norov wrote:
>  .../marvell/octeontx2/af/rvu_debugfs.c        | 28 +++----------
>  drivers/net/ethernet/meta/fbnic/fbnic_tlv.c   |  6 +--
>  drivers/s390/net/qeth_core_main.c             |  6 +--
>  net/core/net-sysfs.c                          |  2 +-

Please split these changes out and submit them to the correct subsystem
after the merge window. Then push patch 12 during the next merge window.

