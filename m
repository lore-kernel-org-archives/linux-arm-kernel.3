Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221C1C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 14:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzs1/XsOw/+25WoVVLAe+g+91NV0fBp7ZfzpBfGnwO0=; b=yOG/XROpGBrCu4dP/GJ6LdqC/z
	98FUgUmBoZPzr5DulZSJyOqm/jZ8VOIDn1pveOtqjbrx7C5D3A0BbvODOB9hIj4d/3rk9BqP8jYb5
	xHmyZqa9snZyA0J62tGUC8ix+B+KRGbrNWcTT25fPWtAs0tp83QxEVYpwAUD1ih1wMykJ07jVnX1n
	+77xv8GlpR9Z7gbA+6IhVtQ/O1US87z5nsRol/A2AJLTH7qwRF5HkpXcYlgfzu3NOG3XKYxhTJvKC
	I8ETAncIQXcoUup5Pg3ytIOObbQTWHqliO+RN9sJ2kaAkLxbXYvigjftfrPX9x21wwORMNC44AVhu
	Usy0T6nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlTb4-00000005jdi-1UF8;
	Fri, 21 Feb 2025 14:01:42 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlTZa-00000005jIJ-2uSs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 14:00:12 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 4D8A942B10;
	Fri, 21 Feb 2025 15:00:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1740146409;
	bh=58xAn4U0wInTpg79aVG+cwEwl25B8pi/XQxIUWwayXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PUDVv62eIVNURun6OWy6vI5skGuAuixbLdu/u89o+onhQTeQ7AZDi4md+LEAOcvnm
	 MmIpk/JAieySNjsSCJ7xL2wu+NUxrBf+GXr/I1wPiqKPnP+3eEtyHUB6K02Knx4qBX
	 +OdkBD8PrVInIzE5B2c0zq1GZ5lVI5MjnZ6zbMWpXfqNQO+WsLxIAp2GNWZgX5//oh
	 mwDjWWfxZLyDcX+bRKmDPLkOokWU31147S7wTF7ryvdSsX2YIwzEW2frHpN4I3Q6dg
	 SZLCa98nmwYQWBotri91Rt9sz4kK6nUDEFJGKv95Yfw4+k4txqEgbSDhsVHx1Yj/zi
	 aLma1KTCZLOvw==
Date: Fri, 21 Feb 2025 15:00:08 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
	Thomas Gleixner <tglx@linutronix.de>, kevin.tian@intel.com,
	maz@kernel.org, will@kernel.org, robin.murphy@arm.com,
	shuah@kernel.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, eric.auger@redhat.com,
	baolu.lu@linux.intel.com, yi.l.liu@intel.com, yury.norov@gmail.com,
	jacob.pan@linux.microsoft.com, patches@lists.linux.dev
Subject: Re: [PATCH v2 1/7] genirq/msi: Store the IOMMU IOVA directly in
 msi_desc instead of iommu_cookie
Message-ID: <Z7iG6NArgozXFZJ5@8bytes.org>
References: <cover.1740014950.git.nicolinc@nvidia.com>
 <a4f2cd76b9dc1833ee6c1cf325cba57def22231c.1740014950.git.nicolinc@nvidia.com>
 <87ldtzhcjv.ffs@tglx>
 <Z7hfNlnSj8BI6C7l@8bytes.org>
 <20250221134112.GK50639@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221134112.GK50639@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_060010_947483_35123D78 
X-CRM114-Status: UNSURE (   9.70  )
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

Hi Jason,

On Fri, Feb 21, 2025 at 09:41:12AM -0400, Jason Gunthorpe wrote:
> Can I send you a PR instead? I'd like it on a branch so we can work on
> the iommufd specific bits that where in v1.

Yes, that works as well.

Thanks,

	Joerg

