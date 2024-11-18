Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9CAD4923E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 15:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2IqWQ81Ao+E96llOLHTt9C7QGCu4EsNJxOL3jnug9E=; b=SIq2S8Ki+kNjz8f5419NbLXlP0
	+PWxQi4tj2y7HQ/O/HndZdXNuEO8terDQXPUWiFILjWk6dPH/ysEmiLC6YYcMFYP24BTX7TV3D+Kf
	OpQRxcAZNBU8OTT3L17iIDu9SShwyLJ7aQagFwmWqPmIeSdVIyixvEV2mFTxIxc4sbuU9hVmdHnlx
	HjjWaelDH6haBBB1ZGFsW8/PkTH/QvKRY8hmR/GVJuheid4P55bdh7FL/5LPOBP7EqrJzzPt0nCYu
	RT4uHvsxcWpgYPUmTZjg1VNDHGpnsBRLWcL00z2kKzabosIcZ1ugeDP00/1c3YJAPg4s9KRTGs4xl
	FPKkzMMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD3wE-00000009xki-2IoO;
	Mon, 18 Nov 2024 15:45:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD3vI-00000009xZu-1xpF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 15:44:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0CFB6A40D18;
	Mon, 18 Nov 2024 15:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46FFCC4CECC;
	Mon, 18 Nov 2024 15:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1731944659;
	bh=6lfS5m0L5sAIIFt8Olzxk6U3G2hwwOEHH7gfpjErpxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ckg/Vk0sB0utTnyYclq9aYw8ZIt6rOgyYWigZJV+xIyZ90ZFurgr/jmJ0XITw4Hxs
	 AYQHlUUJAD6TBWqWhidg89x4ildm/+wSHYeDtX9m19PRqUo5UU06vKefhAg4xNjF4f
	 wGDEhxe1xbd6p5nHKb0MKlonT3X9I1Y90krxcnDY=
Date: Mon, 18 Nov 2024 16:22:08 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH 0/3] sysfs: treewide: Remove spurious NULL in
 attribute_group definition
Message-ID: <2024111856-busboy-unglue-1022@gregkh>
References: <20241118-sysfs-const-attribute_group-fixes-v1-0-48e0b0ad8cba@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241118-sysfs-const-attribute_group-fixes-v1-0-48e0b0ad8cba@weissschuh.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_074420_578924_2F98187A 
X-CRM114-Status: GOOD (  11.72  )
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

On Mon, Nov 18, 2024 at 04:02:46PM +0100, Thomas Weiﬂschuh wrote:
> Generated with the following coccinelle script:
> 
> virtual patch
> 
> 	@@
> 	identifier ag, pattrs;
> 	@@
> 
> 	  struct attribute_group ag = {
> 	    .attrs = pattrs,
> 	-   NULL
> 	  };
> 
> This series is meant to be applied through the driver-core tree.
> 
> See also:
> https://lore.kernel.org/lkml/71fe4030-d6a1-47da-b8a7-28b899187168@t-8ch.de/
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

All now applied, thanks!

greg k-h

