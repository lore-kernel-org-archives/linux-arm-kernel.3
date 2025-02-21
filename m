Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A47C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 06:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkLisxz4QHeIORxyHmZ8VZ2mx9f3YDBeffj8tK914Is=; b=sESfYbriPTWkMt15GDx5+2pt9L
	MmRTEqINl2G9kf58TwHcTFpPL/uKDdcOYXQyj9P2tj8TGqJ1vtCZzowbxJ7y+c1KKV2sGO+6oI2R/
	zv5sGwmbjEV6lwzEgH6POxQSmxxstDI+UjP49eaGloEOVJynkRPrgo78S5JidsBgSpN+cui2GLOJv
	NhpRVS8rsqQ0n0Hmx1Z5siEzPtG9nGQ/TkXD2p4QA/FeaaFgqEooK++Zn/dulDd4nDFxTrRbNToUE
	OYbhA93u6F3p6NWcmR++wvksfSjf0VRurUfCgg8EdQNkdauQx4xKf+jzbtSumBtTOSH3TWjYJ1zOU
	KGHppwhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlMO1-00000004MMh-2ybP;
	Fri, 21 Feb 2025 06:19:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlMJf-00000004LYI-238R;
	Fri, 21 Feb 2025 06:15:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9FF465C4B05;
	Fri, 21 Feb 2025 06:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD440C4CEE2;
	Fri, 21 Feb 2025 06:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1740118514;
	bh=TNEPPBEWgJ1Kqz7U9WT5DXUrTiqsvq3N42p4JeVhfvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gVifSG+f0bxi6tkq9WGtsxqoZkGLInTFdg5jmOduZAx8ebkuCQdysZekvfztvFCm3
	 QB02DbBzyg2CPIaIg1SK04s/BUyG/Cj/reO6qE+B+WHJqYimvryS3TjuxutXp08Nnw
	 +eePKs2csULAR6GdtygHf6F5aUAjxUkVuqL7aoAE=
Date: Fri, 21 Feb 2025 07:14:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: rafael@kernel.org, dakr@kernel.org, hjc@rock-chips.com,
	andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, quentin.schulz@cherry.de
Subject: Re: [PATCH 1/2] drivers: base: component: add function to query the
 bound status
Message-ID: <2025022153-outdoors-snugly-3967@gregkh>
References: <20250220234141.2788785-1-heiko@sntech.de>
 <20250220234141.2788785-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220234141.2788785-2-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_221515_597126_2861A742 
X-CRM114-Status: GOOD (  16.60  )
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

On Fri, Feb 21, 2025 at 12:41:40AM +0100, Heiko Stuebner wrote:
> The component helpers already expose the bound status in debugfs, but at
> times it might be necessary to also check that state in the kernel and
> act differently depending on the result.
> 
> For example the shutdown handler of a drm-driver might need to stop
> a whole output pipeline if the drm device is up and running, but may
> run into problems if that drm-device has never been set up before,
> for example because the binding deferred.
> 
> So add a little helper that returns the bound status for a componet
> device.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/base/component.c  | 14 ++++++++++++++
>  include/linux/component.h |  4 +++-
>  2 files changed, 17 insertions(+), 1 deletion(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

