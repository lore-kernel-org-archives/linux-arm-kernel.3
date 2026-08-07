Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8274AC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 14:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8S/id+omyM4vKn2ckYq5dh9Dzt1Bm2W54fj720q0Ts=; b=DNcQoXnd5z3h+19rfw3RkNz7us
	WdbXpwiAVlUPKSOcezl5nxI2W+HLwsgmyk0kgMJkKdEdRkMas+SYFf+VnzYwgxpqHmVY++dfISlg6
	Bm9kyyuRc4VuAfjYKQ5Ow1h6tSb5N7EPiZ6DuirDIQ085GTjz2mS9qEzANCFZZxabhggfn0RmJ+My
	cZ0Bg41oe5U+U9tTUj456O36xzfguOKsE2tomSm1LeBFXr/F3GPCvTjg4yCp6fUJFSA6Ib4IREq5+
	j5XtQH5NNI+Gs/Yx7iH/UozUO9NrHri/5k3Iw58FWg1bVHd2M4wOR8ohTzw0asFv4l5aH/DnJ6seC
	OqO9rbbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLX2-00000008Gep-0F1C;
	Fri, 07 Aug 2026 14:26:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLX0-00000008Geh-2GUc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 14:26:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A4D08600D8;
	Fri,  7 Aug 2026 14:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CBF21F000E9;
	Fri,  7 Aug 2026 14:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786112801;
	bh=p8S/id+omyM4vKn2ckYq5dh9Dzt1Bm2W54fj720q0Ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cFHIudcQGgXx5j/gJeB/4JuPfhSSlcSmky8ZXosc/dHZxujfTEujrqR3oo/vD4YYa
	 OWJ7uSJCJU1MfUIlIUWAFoQxWJ1sF4T6iSZUVSibwzKMGlUbR6WEfA+cdh2EB+L3jI
	 vcxb1OC+Se3aXtSb2d0dovWjfs4Tcnmv72N3kBb6nfzQ5c8JjzskJ9AG7zdzUmbFcV
	 SuHpAU83REu4UJrgfvfhc6c6edbs4pC9uH7QJK+RGISisE08lhqthcc896s3QeZC3K
	 046jy3hEk6y4oJ0odOK2c1gTypx/eA6sh5wtu+tU0NksGTXi3NBRS4K7NbE/nh7qog
	 jyl+C0j/j6bMw==
Date: Fri, 7 Aug 2026 15:26:36 +0100
From: Will Deacon <will@kernel.org>
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	dave.martin@arm.com, andre.przywara@arm.com,
	catalin.marinas@arm.com
Subject: Re: [PATCH v1 0/2] MPAM Fixes for UAF and NPE on unbind
Message-ID: <anXrHH4ZwoNTLqI-@willie-the-truck>
References: <20260806144631.2502918-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806144631.2502918-1-ben.horgan@arm.com>
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

On Thu, Aug 06, 2026 at 03:46:29PM +0100, Ben Horgan wrote:
> The MPAM driver expects to manage all the MSC in a system. At boot it
> delays its initialization until it has probed all of them but once
> running it is unprepared to have the MSC taken away and that can trigger
> UAF and NPE. Workaround this by ensuring it never relinquishes the MSC.
> 
> Ben Horgan (2):
>   arm_mpam: Fix a NULL pointer dereference on unbinding after an error
>     interrupt
>   arm_mpam: Disable driver unbind to avoid UAF
> 
>  drivers/resctrl/mpam_devices.c | 4 ++++
>  1 file changed, 4 insertions(+)

Thanks, I've applied these but you got Catalin's email address wrong
(I've fixed it for this reply) so the thank you email failed to go out.

Will

