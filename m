Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF54DC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWLwX8DWyk6tmDOQHHgr36r/+cwmqwe2iEQzYwuHPtE=; b=D56hh579Z/dI1icaRhcosTUAH7
	73NnwTuD4fpVG1RzlBdn7IUQVIei0qWzeMiT2js8Zk6ylJmTrZaKNkx6ohFqvMF4F8MHArYl9I68t
	WA0Izpet9PVYAOw+Xkuao9OSX4Qnc6a33+fsliG5qxGps/MjII4Wr85o982SvamkDSKsPVfSq7yGz
	bXv3svKb+4WgrKNi89dIxBgb/Tnf6YnfBqu+LF8jh0FxoWAwI4Om2y7XwiHCEvngv6L02Mr77reXJ
	kHJNdDSJAwDx+Przo44nteFyEySUHMIej7RfwvkQjzH9/4S+t89Mxyv6ZSj5W5aPUvk7QOmXjsZKD
	n8Psf5rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8g3q-00000002dgP-2rc3;
	Mon, 21 Sep 2026 15:36:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8g3p-00000002dg7-4BR1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 15:36:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 764E241B55;
	Mon, 21 Sep 2026 15:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB1AF1F000FF;
	Mon, 21 Sep 2026 15:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790004965;
	bh=pWLwX8DWyk6tmDOQHHgr36r/+cwmqwe2iEQzYwuHPtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EMnoPuYp13fVCB8vNKTXhfp8D8qzmQaNvuw6mSpQJGKfejInySU5UrPMvwcChxX5D
	 hDkL6HZHAByR0MIgSvO5tXeOjEdxedG4qDfIRgR8eM0LXZLmtN00MGMOsJMVHDQ3Os
	 69RHu6JRspxP+9H6uS7/lizG943Q8Y5zUZmTCHV0CYIGPvH7OU5DHDM2A26fil5ZDQ
	 msfYA42yd5QZPiKTsmgiqHF4hlyqHKu+SyIiblciVBf3GSGI2EUo98+7eid5M5E1ht
	 3uQbzgb44afu2cYRW0Q8zju4Fy5swIkqvJ1TsiIDSZ0G4/7D5xHeBbjL0V2IRzbQ0q
	 xDXfD6GPYTN0Q==
Date: Mon, 21 Sep 2026 16:36:00 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v4 3/8] firmware: smccc: lfa: Add timeout and trigger
 watchdog
Message-ID: <20260921-elastic-impartial-pig-ea6b58@sudeepholla>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
 <20260918141112.2115555-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918141112.2115555-4-andre.przywara@arm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2026 at 04:11:06PM +0200, Andre Przywara wrote:
> From: Vedashree Vidwans <vvidwans@nvidia.com>
> 
> Enhance PRIME/ACTIVATION functions to touch watchdog and implement
> timeout mechanism. This update ensures that any potential hangs are
> detected promptly and that the LFA process is allocated sufficient
> execution time before the watchdog timer expires. These changes improve
> overall system reliability by reducing the risk of undetected process
> stalls and unexpected watchdog resets.
> 

I assume this change is separate from 2/8 for authorship purposes.
Otherwise it should ideally be part of the original driver. It is prone
to firmware bugs without these changes.

-- 
Regards,
Sudeep

