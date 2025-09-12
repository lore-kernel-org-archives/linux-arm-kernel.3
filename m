Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116A7CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 00:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLEiPZwUo+s4d7QTtl1e3YzsyzzBwr5oQ5ZaA5TSUyw=; b=wqRJpmEqpHaypRNW+VDgb1FARa
	o//5ZWhSVhhlSdu+52aa6TIvgTwDPLVCPBfUpIK3H0etlyB9G7++jc+7OYgCIVuVz3+nTV657nbbK
	goH68yLECCQJFaaD6DrypM3zdCNevCNFJDOfyD+vumDTy3b5jMuIuNsqoynNsw+pz8LuqR3C8Iuwl
	tqCoyMVkWcNrzLw8+5jdJoA8HwTb6tZXgMWcqmxM+UvqjpNR45oB8AxXhfM41yp4G79dBRjA7lty1
	qCwGQB4d/pQ7vprx2YocDH0NZ8W9pjPCxuV0xqtVCAqBKsN/6OVVl2QKkH/5+VfmXXWEepQPBhO58
	kFFd00OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwrEq-00000005zox-34Jl;
	Fri, 12 Sep 2025 00:02:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwrEo-00000005zoZ-0ITQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 00:02:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B31F40501;
	Fri, 12 Sep 2025 00:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03CCC4CEF0;
	Fri, 12 Sep 2025 00:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757635321;
	bh=0wrrUK4oFK61WEcwJoC3CXhY9QFy4rgtgWwUYrq0Opk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kd44Djh7pYO5hpTr2eXfUuw2U3SIZXAP03Bx/lMr6U5OjMqZoVFGwuKp9niagx3mW
	 J7wtpMixRjTORzLjl3S57ubl0+IUzLk2Jwu1UVqVexsGvGbvJnRYY+mfuDQ3hUEkt4
	 y0za4yPT4yyi/dVgIcHUQEK6ourw0nMI3CYlkmVqykCbpokVXyaeIChewqrrWBSgif
	 vZh8FxXMumht53cMKwt5uakXzo17LP/lsOSN5N6iZN7VpaPIeXChx0YXuUVaX+Tf8J
	 wFrn2ZgrkBGKTmDjZs0myx2YZDxAwO2DWG630RBOHmXYddJusBJhctH/sQIZCqypnJ
	 t87HiHPMP/kLg==
Date: Thu, 11 Sep 2025 17:01:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Rohan
 G Thomas <rohan.g.thomas@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Matthew
 Gerlach <matthew.gerlach@altera.com>
Subject: Re: [PATCH net 1/2] net: stmmac: est: Fix GCL bounds checks
Message-ID: <20250911170159.383edcc6@kernel.org>
In-Reply-To: <2d00df77-870d-426c-a823-3a9f53d9eb30@altera.com>
References: <20250911-qbv-fixes-v1-0-e81e9597cf1f@altera.com>
	<20250911-qbv-fixes-v1-1-e81e9597cf1f@altera.com>
	<aMKxc6AuEiWplhcV@shell.armlinux.org.uk>
	<2d00df77-870d-426c-a823-3a9f53d9eb30@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_170202_137514_F333F119 
X-CRM114-Status: GOOD (  17.40  )
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

On Thu, 11 Sep 2025 18:12:16 +0530 G Thomas, Rohan wrote:
> On 9/11/2025 4:54 PM, Russell King (Oracle) wrote:
> > On Thu, Sep 11, 2025 at 04:22:59PM +0800, Rohan G Thomas via B4 Relay wrote:  
> >> @@ -1012,7 +1012,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
> >>   		s64 delta_ns = qopt->entries[i].interval;
> >>   		u32 gates = qopt->entries[i].gate_mask;
> >>   
> >> -		if (delta_ns > GENMASK(wid, 0))
> >> +		if (delta_ns >= BIT(wid))  
> > 
> > While I agree this makes it look better, you don't change the version
> > below, which makes the code inconsistent. I also don't see anything
> > wrong with the original comparison.  
> 
> Just to clarify the intent behind this change:
> For example, if wid = 3, then GENMASK(3, 0) = 0b1111 = 15. But the
> maximum supported gate interval in this case is actually 7, since only 3
> bits are available to represent the value. So in the patch, the
> condition delta_ns >= BIT(wid) effectively checks if delta_ns is 8 or
> more, which correctly returns an error for values that exceed the 3-bit
> limit.

Comparison to BIT() looks rather odd, I think it's better to correct
the GENMASK() bound?

