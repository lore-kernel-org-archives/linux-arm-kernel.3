Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BC0C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 22:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIQuLoiA7pDA0VgLiNzI0PqSY+3NtPf4r/ivCJMtZ/o=; b=Otom+9xSbnVjmxb2kCmz9TLULC
	SUYFXTv87VuU5e6FOfoKA/mi9ko3WapXMQj9esKjdikk3+BFwNsSJ65Y13xt3NRwaLyQOM6fFHGkr
	xfp8F/Mm6Volbg17ClQAWxAKpHnPtdO6/9wc4/x+6W7OTPuL5IqRNXOb3KKhOK/eGpJ4x3A2lb7Xz
	kN3hmoRTuMbMqDWVNXw0dhlUqGq00hPdzMjU8ESUPdxE3jmSPqRzcC9jWCyTX8BhUoDwx7B7fOyJC
	XTuF2Z+P10TvWtuhVapVYZts8XojJQD7ZpCfLCen1m+TXRYybs/z1p9wn5yWFF8NltBbaaduSgMbu
	N0iTwhmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHViX-0000000EJNF-02PL;
	Tue, 20 May 2025 22:45:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHVcf-0000000EIYL-0jZ7;
	Tue, 20 May 2025 22:39:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 66F9F5C5B2F;
	Tue, 20 May 2025 22:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D70AC4CEE9;
	Tue, 20 May 2025 22:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747780784;
	bh=Ba/FhmLexBi3mPBWZB+4SlEG/6brlQ6vfvQAbNqiwqw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=B0SqrZ2+Pr88VCSbssvnXmw1Bnr/JVMF8S6WA+sisgl1IboJsa6DCT1eWb0nWy4Nu
	 zwLOTn0SCZEIhTA+iA/wpFgEJCwTiyFxPHx4/rFp/b8e0Q1avyYMdrrdXMpAVYmwGO
	 ymIfhJIVNdgdCAHBRtmARdXT8hqZKmdHR81NQqKwgpvl2jyVQsbb5qynAATxqMAT2S
	 rc0/0JVwSHs++YRk2H2ncfnjoQiSToRRzFi+L2yo8TDWjO96+lZl9nPoAl8ngzD6Fy
	 dqTgYe8GkKWNviFC61B3Sy0tsACp5MIiIR46Z08Y2Bo1S+VBILf2icigNAHSgrGQkC
	 vPm9FLBs6Ml5Q==
Date: Tue, 20 May 2025 15:39:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jinjian Song <jinjian.song@fibocom.com>
Cc: andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com,
 chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 corbet@lwn.net, danielwinkler@google.com, davem@davemloft.net,
 edumazet@google.com, haijun.liu@mediatek.com, helgaas@kernel.org,
 horms@kernel.org, johannes@sipsolutions.net,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 loic.poulain@linaro.org, m.chetan.kumar@linux.intel.com,
 matthias.bgg@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 ricardo.martinez@linux.intel.com, ryazanov.s.a@gmail.com, liuqf@fibocom.com
Subject: Re: [net v1] net: wwan: t7xx: Fix napi rx poll issue
Message-ID: <20250520153942.7cb63bac@kernel.org>
In-Reply-To: <20250516084842.26c80cb5@kernel.org>
References: <20250515031743.246178-1-jinjian.song@fibocom.com>
	<20250515175251.58b5123f@kernel.org>
	<20250516084842.26c80cb5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_153945_256707_DA534510 
X-CRM114-Status: GOOD (  11.49  )
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

On Tue, 20 May 2025 15:05:34 +0800 Jinjian Song wrote:
> >Synchronization is about ensuring that the condition validating
> >by the if() remains true for as long as necessary.
> >You need to wrap the read with READ_ONCE() and write with WRITE_ONCE().
> >The rest if fine because netdev unregister sync against NAPIs in flight.
> >  
> 
> Hi Jakub,
>   I think I got your point.
>   I can use the atomic_t usage in struct t7xx_ccmni to synchronization.
>   
>   static void t7xx_ccmni_wwan_dellink(...) {
> 
>   [...]
> 
>   if (WARN_ON(ctlb->ccmni_inst[if_id] != ccmni))
>     return;
> 
>   unregister_netdevice(dev);
> 
>   //Add here use this variable(ccmnii->usage) to synchronization
> 
>   if (atomic_read(&ccmni->usage) == 0)
>      ccmni == NULL;
> 
>   }
> 
>   How about this modify?

Just use READ_ONCE() / WRITE_ONCE() on the pointer as I suggested.

