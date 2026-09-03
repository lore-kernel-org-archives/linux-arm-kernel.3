Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF10C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 14:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8X9GwG70UHNRj33Xkhsz17g3PyiEIZVcdUidNwrtGYA=; b=vyjqu44nBWyE9k5cvEoeZ7JSj8
	pt4RntORcSCX9YvoDmTlu1EEMneEBngTC/07aFDcg7ZUXFCiuantQtoVhNoKqkl34Cv7Sk91/P4w+
	s15T9LLJiD70FEmYSu8MpT0QxpwMixIguRPH0y3kD95t2mes9WXUoXqcLfGT3p8rPr+4q+LiEdvey
	j0DA2/jxpdAqwIDTB55eca4YtJ7g81BE8JUmvVWNF2zD/sPQVWzBU4dCROAOhFuylUqVkK+M/nTNA
	0NcFee31mbAnYqj5lh73zmbgAU7stQJQhro/OPa73nJyPa7Q1YCIP6QldAvBev207mqXvS7/jbjWU
	up347u4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28CN-0000000HUFe-3U0j;
	Thu, 03 Sep 2026 14:13:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28CM-0000000HUEp-1cbo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 14:13:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A3FD42A0C;
	Thu,  3 Sep 2026 14:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5211F00A3A;
	Thu,  3 Sep 2026 14:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788444830;
	bh=8X9GwG70UHNRj33Xkhsz17g3PyiEIZVcdUidNwrtGYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gpG5mfyH6G7y3dW3qwtCJq/N6sA2Wh378+wkUXiHC+B58GxdCkEbH4SJ5uMPBU2Kr
	 A7mXBWYFlJWsTak8dnr2iroIZnRwK1a2ntHKCCMF+73bsiU5WGfUMIl2NT2DrdawTz
	 mz6s7CqKO5DvHpphXyGYkcXrRFuY9C0BdcaZMjT1qokTbYnbFMpwpecwBoKQadXxqp
	 jVUfyLfWhMAS6jr9p0waXe3CJMwk6UQN7q1BX1dKFjTwF1rHcv6MXfsAyrE6a1Qhkv
	 /uNi6OA1V53au6xKA7w/KOdM2QXTICKocfQatkHC0U8aLXOhNAk6dtPSNPkECbfDmc
	 8RKw2gJX3t42g==
Date: Thu, 3 Sep 2026 15:13:45 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 1/7] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <20260903-pistachio-tiger-of-sufficiency-eaadcf@sudeepholla>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-2-aneesh.kumar@kernel.org>
 <178794567779.4159892.8785590655735217125.b4-review@b4>
 <yq5ay0diyavw.fsf@kernel.org>
 <20260903125718.GI4157646@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903125718.GI4157646@nvidia.com>
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

On Thu, Sep 03, 2026 at 09:57:18AM -0300, Jason Gunthorpe wrote:
> On Thu, Sep 03, 2026 at 02:22:51PM +0530, Aneesh Kumar K.V wrote:
> 
> > I have updated the bus to match devices using func_id.
> 
> Did you have any thoughts on how to handle ARM's versioning scheme
> too?
> 
> I'm not sure what the rules are but it seems like if the major changes
> then the API is incompatible? So shouldn't every driver advertise a
> supported major, and the major be in the modalias and checked by match
> too?
> 

Just curious as how this should work with any v1.x firmwares in the wild
once the driver updates the supported major version to say v2.0

Is there a way to set the supported major version in the driver via
some module parameter that the old systems then can make use of. Just
random thoughts/queries to understand how they all fit it eventually for
the wild variety of f/w we need to support irrespective of what is the
supported max major version the driver advertises.

-- 
Regards,
Sudeep

