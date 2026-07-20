Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741E6C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 21:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a305+/dqeGqdMetl9gdzRzOZIEZNcEFzXc13nYcj1B8=; b=V2uk8IOC4Kri0P5mZDH71PWAMp
	XGZyHXueZKIOufyB4wooYTKf8NK4I4WT1gHp+QmjJ2gs1AATL8fM2NP5hABhis//6bl3ZBq84Q1tw
	xYCf9tlN+V15ryRzX7xAcj5E0oZDKO3YakFpeCOSCOYBXYCSfGzysl2m18lpVGFBy3MaZFvOmSQv4
	jNKr3hh87rj5HJrxTR2GtXgxjr0SVS7R5KCOiVKBnpHYqf2g7qwCeMY1WNE9TlXskCMx/UmZB8UV2
	lT0MayRSrJApDDbvtUeI+9r4EfCwCdv6N+d+0z9Q1pqJgCGlykp5xQikt6ZgW6D5jEvriB52+2Wxl
	n+L2DNzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvru-00000007yp7-0BRp;
	Mon, 20 Jul 2026 21:49:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvrs-00000007yox-2Nqt;
	Mon, 20 Jul 2026 21:49:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 550CE438BE;
	Mon, 20 Jul 2026 21:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21371F000E9;
	Mon, 20 Jul 2026 21:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784584184;
	bh=a305+/dqeGqdMetl9gdzRzOZIEZNcEFzXc13nYcj1B8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=g0SEFFG2bQOVF5ay6vR8eSQj8SMppWEK4zQEg54fA4wKQQL2UaNittn7FN3d1vLSv
	 yHWCyDWlKR9HYzjhqR/r6L3y+nhip8g7ojU6WYgF12ueFPCWEh0u1kLaOz70Tznwxe
	 Lvz+eZ4YgUxHwqJvWCNWxJDSd4WFK7cZw4v7z8gXnCtUG9i5dP2dPU7pPvV/9i3VXn
	 Aqu69a/YPyv1baqJO11m27b2tcEk97vSWJtuwGRvnMFkV6efT7hOUzezdaNpiIEQ6T
	 H+2/DAk7I8W2/9+v83SWkZZCzn0L4mJRPwWJxt2Nd4foa6WRO2d9t+wvhIKk+77hvw
	 qvIh1TWpgkVlw==
Date: Mon, 20 Jul 2026 14:49:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Wayen Yan <win847@gmail.com>, netdev@vger.kernel.org, horms@kernel.org,
 pabeni@redhat.com, edumazet@google.com, andrew+netdev@lunn.ch,
 angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: airoha: fix HTB class modification offload
Message-ID: <20260720144943.0f4d1771@kernel.org>
In-Reply-To: <akthM-O5eea52MN6@lore-desk>
References: <178332096675.2250671.599544331813347302@gmail.com>
	<akthM-O5eea52MN6@lore-desk>
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

On Mon, 6 Jul 2026 10:02:59 +0200 Lorenzo Bianconi wrote:
> > HTB core does not populate parent_classid for TC_HTB_NODE_MODIFY.
> > Airoha currently checks parent_classid against TC_HTB_CLASSID_ROOT
> > in a helper shared by both TC_HTB_LEAF_ALLOC_QUEUE and
> > TC_HTB_NODE_MODIFY. Since the modify path leaves parent_classid as
> > zero, the check always fails and changing parameters of an already
> > offloaded HTB class is rejected with -EINVAL.
> > 
> > Move the root-parent check into the allocation path and validate
> > modify requests using the per-netdev QoS channel bitmap, consistent
> > with the delete and query paths.
> > 
> > Fixes: ef1ca9271313 ("net: airoha: Add sched HTB offload support")
> > Signed-off-by: Wayen Yan <win847@gmail.com>  
> 
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

ditto, please repost

