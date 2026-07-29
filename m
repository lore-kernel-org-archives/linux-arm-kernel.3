Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09D8C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 14:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPM1uu5fpn+tun/ggpxhHadjLMW87KYXfYbrFYkrODg=; b=rsMcVUWjTqJ7ZurkN6dQ49W5NT
	JJxm7/AlYo3702xrwi9l4M0ywLRtzOe0Il4N9n0/pB8Vn7mpHVd5C6wtNkPjoRs/w5t7UG7B/129e
	R5INM971ZsgUu1uauTmfpQ7KUU8sr6u1tiyRc1UgIB0Sui/c2WREQ2ezFMQW9bB35nJ/Km+5dSquc
	GE5zfakfdEXOTRreDVEmVVHpcXzs8ICc9gIz4tzrWewdAc18g1hJTSJHefNnytEV6mRdCN2wzjU58
	Ohi4wdJTyxR2vU1V8v0qIUIjGGtiRQd2HOA8WIx+QkyTOldDAXpzUxpIbWnprvuc/vPanqp151tzy
	iovojo5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp56A-00000008EqE-3I9j;
	Wed, 29 Jul 2026 14:17:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp569-00000008Epj-2Edd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 14:17:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D403F600B0;
	Wed, 29 Jul 2026 14:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5351F000E9;
	Wed, 29 Jul 2026 14:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785334648;
	bh=iPM1uu5fpn+tun/ggpxhHadjLMW87KYXfYbrFYkrODg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JifVll/Cn2UrNEN8rfjQE705up2gFEmr4FVSTutFacF4Gwira5XZZNMuKePnbed+R
	 LY+VJ+NLHQkdhkzxwvNYWUSjSaYekxCpsowpUFGBO3/mdRixxjA7dz0kVZuIro5ujE
	 lKYC5DGN4a02R5pXZzOa9ZMWn98QAhvWQqvnJIedca+TAvWW33dwH4AvO8SSCEoo6F
	 O+ZgVVilyoOm6pdiFq2wqETNS4lmfmYggjA+muYgrY58HhpQKBkA09UHv7F9nPeqse
	 sqzVzzqcfzqzeUvrd8z+kUPA9BVdXt3PETuzh4hBYgaob6RsJ5Htt85ISCBUJQQFRc
	 0EudEO6w0CpRg==
Date: Wed, 29 Jul 2026 15:17:25 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, guomin_chen@sina.com,
	linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
	quic_xinqzhan@quicinc.com
Subject: Re: [RFC PATCH 2/2] firmware: arm_scmi: Add bus support for
 autoloading
Message-ID: <20260729-optimistic-lemon-myna-a14bbf@sudeepholla>
References: <Z6CNWOp8B_ghIrJt@pluto>
 <20250203100154.140877-1-cristian.marussi@arm.com>
 <20250203100154.140877-2-cristian.marussi@arm.com>
 <aibW10NMmzw3QnZ5@mai.linaro.org>
 <aibzLcZiVwtUHAgV@pluto>
 <20260609-upbeat-bullfrog-of-enrichment-0f44aa@sudeepholla>
 <282af085-1669-4d9d-9c1d-2fc232252be0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <282af085-1669-4d9d-9c1d-2fc232252be0@oss.qualcomm.com>
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

On Wed, Jul 29, 2026 at 04:11:18PM +0200, Daniel Lezcano wrote:
> 
> Hi Cristian,
> 
> On 6/9/26 11:01, Sudeep Holla wrote:
> > On Mon, Jun 08, 2026 at 05:51:57PM +0100, Cristian Marussi wrote:
> 
> [ ... ]
> 
> > > Thoughts ? Plans ?
> > > 
> > 
> > Just repost as non-rfc after next merge window and we will see if there is
> > much interest to get it merged for the following one and take it from there.
> 
> Are you planning to resend the series ? I can test them on my laptop
> 

I thought [1] from Bjorn was addressing the same issue ?

-- 
Regards,
Sudeep


[1] https://lore.kernel.org/all/20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com

