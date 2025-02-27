Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA960C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 11:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WXa9AKEQWsJS0qlIdmxsS169ALGmo3k/WyoWT1mHauU=; b=rcnjgb73FB0+mZmkKKCfcQq5lw
	y1BUQxABzR/Lb3eXJRSSY7QEiPmeAu2fipKyZBf08Pgr0u4KEyv0rEE04Dc1Vd8Lfi/ccsimjHdjc
	s7x6Ckg20CUnrimbt14+lhfLCQblcPJ9Oh6reKazCeX+jbx/qBr/LcWvz/ONUg3hWbfxYdjOUwb5G
	TJ6m2lBG0n4DkA6ReWta8BGOoDXEiJUqzwOuqAQVkxhr8saLuJ+QwMCPVO4Jc3P5FYqRgwPnNHXkT
	BfYNeaq4j89FsvynYOMMY7EbM67JWeWqO7GQGO7ipsX6eqRxT6HW5p8G9HrvWiUcllX3ShuTqbeny
	K8qEPjgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncWg-00000007GKC-1jTC;
	Thu, 27 Feb 2025 11:58:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbxF-000000079fk-14m5;
	Thu, 27 Feb 2025 11:21:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C58915C4A38;
	Thu, 27 Feb 2025 11:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D8AC4CEDD;
	Thu, 27 Feb 2025 11:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1740655284;
	bh=bF3bvoCvsJ6ElRLIsgG+zyDMBrm+a5kCvyQlSQ6eyZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dze0FuYMlh2Qw4IBL6eaaSz99/fEsu8+R2Dh5+adaYZ1fzvLz93L0RVRVFpxjwAYi
	 qBsQlWRl3br84j5sOMTUT0GKX0720eIB8lP+AWI5rUbqGrv9OwaRrSYJZmmNoOZTVr
	 WEYVo650sBdfFOwpkJX9vvW/wMAhS2zOm4RYQP7o=
Date: Thu, 27 Feb 2025 03:20:15 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: rafael@kernel.org, dakr@kernel.org, hjc@rock-chips.com,
	andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, quentin.schulz@cherry.de
Subject: Re: [PATCH 1/2] drivers: base: component: add function to query the
 bound status
Message-ID: <2025022705-boat-overhaul-0ed3@gregkh>
References: <20250220234141.2788785-1-heiko@sntech.de>
 <20250220234141.2788785-2-heiko@sntech.de>
 <2025022153-outdoors-snugly-3967@gregkh>
 <12995210.iMDcRRXYNz@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12995210.iMDcRRXYNz@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_032125_335211_35506AD4 
X-CRM114-Status: GOOD (  20.96  )
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

On Thu, Feb 27, 2025 at 09:44:23AM +0100, Heiko Stübner wrote:
> Hi Greg,
> 
> Am Freitag, 21. Februar 2025, 07:14:07 MEZ schrieb Greg KH:
> > On Fri, Feb 21, 2025 at 12:41:40AM +0100, Heiko Stuebner wrote:
> > > The component helpers already expose the bound status in debugfs, but at
> > > times it might be necessary to also check that state in the kernel and
> > > act differently depending on the result.
> > > 
> > > For example the shutdown handler of a drm-driver might need to stop
> > > a whole output pipeline if the drm device is up and running, but may
> > > run into problems if that drm-device has never been set up before,
> > > for example because the binding deferred.
> > > 
> > > So add a little helper that returns the bound status for a componet
> > > device.
> > > 
> > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > ---
> > >  drivers/base/component.c  | 14 ++++++++++++++
> > >  include/linux/component.h |  4 +++-
> > >  2 files changed, 17 insertions(+), 1 deletion(-)
> > 
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> just for safety and not stepping on people's toes, does the Acked-by mean
> that this patch can go together with its user through the drm-misc tree?

Yup, merge away!

