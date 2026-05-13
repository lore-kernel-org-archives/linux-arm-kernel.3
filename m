Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1091FCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 17:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6qKdTJ7oG7yr8UP9hTCpZ1kiwSkbejeoRXLIT/tixo=; b=Svi7QiXgRN0HQt9KJBEk2yJQQ0
	3JWR6RV4kgo/hIPsAhiJpt/g+H1oJFgKdojHnduTIDRrrsG4Xyfs1qEtjMEyeLCwUj9ClXAo2RyEJ
	VtJ2dYjvV/3ZBqbP3PTFIoWThk/QeIrhY2ABhAac5I0L8kNP9HJKh2/UQ3RIc4R5UuaamGYraY5Pj
	WLncsXrJU27+nq9U2C3SdTYoY/7jOTlrFVSXoAihhPDeKznkU83cn5AbV49v3/WxQwN8yJdsmUuaS
	biZ0tFQHC8qXHrsE9izQOP+aCYNqpQT2rCCoS0ofi8On/4RaB0rwHBv9dnQere5ClCmWdMOAGzp3Y
	JIPTRR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDBj-00000003JoU-48mp;
	Wed, 13 May 2026 17:16:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDBi-00000003JoN-3pYZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 17:16:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 602736012A;
	Wed, 13 May 2026 17:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C0EC19425;
	Wed, 13 May 2026 17:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778692562;
	bh=nRZP6LKuEzzracjuGw68q45/oGYJDcvKC/EhfBOCW8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G87FR0co1Q1SO5vv4csjGaFLr7HFN8TB7qOraNCmPluF3HE/qCp6hkiCIsYvlYK3i
	 iEyjxFRgvnjyXZHsQHc/eUYjIF53xoi5nElH7KZVnGltA/8FDku4CqEH2LlEv6SwDS
	 m0HcgNBcB7lebY+hOddUGHsGFeSDDm2Ek64M7L0nvOjyJ/JDh1+ElGz45J35Y1J3lu
	 bGbQJimAzo8G7l/6fKbdLHUDqOeF/FcbhDYx1FKEv1jlfeh6SokAxljAkoqQsEcCo9
	 6LMuqrbE4InDFKcVwKaUAc6s2Nwgqp8yp6CV3MtJM1WCQX78M+bnE5Sy7yEwEF9Isp
	 J6yf1E5f38aiA==
Date: Wed, 13 May 2026 18:15:58 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jamie Nguyen <jamien@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH] firmware: arm_ffa: honor descriptor size in
 PARTITION_INFO_GET_REGS
Message-ID: <20260513-tremendous-conscious-sunfish-06eecb@sudeepholla>
References: <20260513032800.68807-1-jamien@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513032800.68807-1-jamien@nvidia.com>
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

On Tue, May 12, 2026 at 08:28:00PM -0700, Jamie Nguyen wrote:
> __ffa_partition_info_get_regs() walks the response with a hardcoded
> 24-byte stride (regs += 3) even though the SPMC tells us the actual
> per-descriptor size via PARTITION_INFO_SZ in x2[63:48]. The size is
> read into buf_sz and then thrown away.
> 
> That works while every SPMC returns the FF-A v1.1 layout, but it falls
> apart against a v1.3 SPMC returning the 48-byte descriptor. The loop
> strides over half a descriptor at a time and ends up parsing every
> other entry from a slice of two adjacent ones.
> 
> The FF-A spec (v1.2, section 18.5) says that the producer should
> report the descriptor size, and the consumer is supposed to stride by
> that size and ignore any trailing fields it doesn't understand. The
> non-REGS path (__ffa_partition_info_get) does this already, and the
> REGS path should match.
> 
> Use buf_sz for the stride, and bail out with -EPROTO if the SPMC
> reports something we can't safely walk.
> 

Can you check if the issue is addressed in -next by:
Commit 3974ea193840 ("firmware: arm_ffa: Bound PARTITION_INFO_GET_REGS copies")

-- 
Regards,
Sudeep

