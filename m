Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60FFFF887E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 01:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WW5+pyeIE8PJ5bvKs+bHI18ZKTMJxRWuN32oC6MumwE=; b=P+n260ms57Vj1amTwdJef41V70
	3tXFPxpGvohh2zSdIGaMibg3iPUpoXSLjYpRLLfThKNAlJDX4mfYzD5gSmRvEpzP4U2RODrYzCZZ1
	vfsNp1mBcqeg2j45JPuCTmveS99D356nwaLRpqfR3PFmGHpoE5De7XcgN6abZf9EEfM/olHgJAvCE
	KxuGN3vxvIZrZxVGDN/ku20dnOzYa4KZT1YaPNewWKa9dvC3ipbFOsfgmFGKTLZcDtQCikA73F4z4
	ieAjz5Jetkavzz6i2KrB4EiEik2u5OKwHBp1ankM5dQnuT0z25ics+BjtZOu24+E69zF7XqJBKmuv
	YJagAHng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGDT-00000004NUd-1t2m;
	Thu, 30 Apr 2026 01:29:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGDQ-00000004NUF-44wg;
	Thu, 30 Apr 2026 01:29:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2281842AFE;
	Thu, 30 Apr 2026 01:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C96C19425;
	Thu, 30 Apr 2026 01:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777512559;
	bh=7AMc2xtDJZHbbx6E8fFOl3b0dTV0r3JCWZmEz2YDezw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=F+thYEcL7OQllfsHv+cY0yB8u4ltpP5XuVjLsny8ZVjwN8/Irz//7rBQvixZSDRiQ
	 C13Ap4OyGAT9ar7euxeciGUxZf1hUWfBdakhQpTChm6f6cm3RIHv0FxKoIY+u/wIsI
	 yaRFD92HSOjHkHGs+PVfKMQTrQLrOGOu/nXg6buZOfhqwDzhvWLaSIav7EAZUZx1jF
	 95dpfFFf6HrYx2kw+vtofa71zP+so3E2AuWEfeZXCFVppogPeBW6wHTJ/RVR1qTj4M
	 d5d+h9FMf+9OKsV7JKhAknvI1uqPrJ43OqMm0GOD+uu1vJKG+XnhHr7LZ2V87Rq0aq
	 A4nH1ZFISwR/g==
Date: Wed, 29 Apr 2026 18:29:17 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Daniel Golle <daniel@makrotopia.org>, chester.a.unal@arinc9.com,
 olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux@armlinux.org.uk,
 ansuelsmth@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v4] net: dsa: mt7530: fix .get_stats64 sleeping in
 atomic context
Message-ID: <20260429182917.20f96df5@kernel.org>
In-Reply-To: <52d69a5d-a951-4a65-a947-7aaf41bc3daf@lunn.ch>
References: <16efd278e4f17776ccfbf8491e5be71a4689c137.1777385305.git.daniel@makrotopia.org>
	<20260429234612.2240476-2-kuba@kernel.org>
	<afKaVQ27GUQiWZTb@makrotopia.org>
	<52d69a5d-a951-4a65-a947-7aaf41bc3daf@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_182921_058442_B8779C69 
X-CRM114-Status: GOOD (  12.23  )
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

On Thu, 30 Apr 2026 02:12:47 +0200 Andrew Lunn wrote:
> > > The priv->bus pointer is initialized during probe. However,
> > > INIT_DELAYED_WORK() is only called in mt753x_setup(), which might never
> > > execute if the DSA tree remains incomplete.  
> 
> The opposite of .setup() is .teardown(). So if the delayed work is
> setup is setup() it should be cancelled in .teardown, to keeps things
> symmetric.

The code does that, but also cancels again in remove.
IDK if that's just "for good measure", or motivated by a previous AI
complaint :(

But I think your point stands, as is the driver is not symmetric,
if we want to cancel in .remove it has to init in .probe.

