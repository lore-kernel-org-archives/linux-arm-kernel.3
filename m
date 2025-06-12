Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7306EC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzmRU8e0Q9GIzwuNdLe4pkXfG5Ts0iaAXYrkLn/GG3U=; b=YVDSusgxGDZoOro/LyZznEdhQg
	B7yDqbfM0g+mZ14K+3InIrk0TulzCalMSMDSzmJluWUSgzjf6Pp6XhdsvvZdaZ3tXH0YLVfakR7rj
	6FFjKn/JhbDKn7SLKBh0CvcBy74WAZD6k4a+SVAPhoi2jt4mesZ5AigbU9j4uOTWbzSEMgRVoALL5
	bcayQU2Ftg/wym9e63ml8JftO5Qhbt6mOSbWeLEXQYqC79xlsYrg6LD4Uu0WA7Lw4uHUuf/KZX8jU
	w/Sne3wgHzReOmY2/KeSHOBtiSCDYhFrl0VAAQ60nNkxzW26R40MKqKYP9wYeBECwOKgSgumyPbjJ
	YZ6/gYeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPqtU-0000000EpWU-2i0j;
	Thu, 12 Jun 2025 22:59:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPqrM-0000000EpRj-0RZd;
	Thu, 12 Jun 2025 22:57:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B35775C697B;
	Thu, 12 Jun 2025 22:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF88C4CEEA;
	Thu, 12 Jun 2025 22:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749769043;
	bh=ykd8RMALh+FdUALg8KX24gUcm7zV+uiH0gak7IN+QcA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bassEZNry6kd0FxoEjj3OZds11wg8zyXxiinwQKUNNZ9d1DWAymwA9WtsM60Zm/A1
	 Qc9n+tB88AX3JOeZ6aB7sAooB+oDrBJZd60+6IjglPshNVx7FJei6c0a/kkIwp3tPN
	 75Z5kgoPW5boNXY8b/dwsUiRLVYr/kH5Gr9IcNSFFHVDSEDRj5NtCCykhkp6TkkO6s
	 4OYf1sohglFKMx3W1naaWODcpQIqIaIsTZVujtLmsGm4jAE6tNVkXb+jacNtqAROb2
	 BVhv3SbYtOJC7TLvZdVoDagGoQEEAYfzGiSinwI5+nS6AOeORKdn7Oiz9iUHFj5jO6
	 0bqn68VgBUrTw==
Date: Thu, 12 Jun 2025 15:57:21 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Add TCP LRO support
Message-ID: <20250612155721.4bb76ab1@kernel.org>
In-Reply-To: <aEtAZq8Th7nOdakk@lore-rh-laptop>
References: <20250610-airoha-eth-lro-v1-1-3b128c407fd8@kernel.org>
	<CANn89iJsNWkWzAJbOvaBNjozuLOQBcpVo1bnvfeGq5Zm6h9e=Q@mail.gmail.com>
	<aEg1lvstEFgiZST1@lore-rh-laptop>
	<20250611173626.54f2cf58@kernel.org>
	<aEtAZq8Th7nOdakk@lore-rh-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_155724_188860_1DAA6AB8 
X-CRM114-Status: GOOD (  11.08  )
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

On Thu, 12 Jun 2025 23:02:30 +0200 Lorenzo Bianconi wrote:
> > I'm not Eric but FWIW 256B is not going to help much. It's best to keep
> > the len / truesize ratio above 50%, so with 32k buffers we're talking
> > about copying multiple frames.  
> 
> what I mean here is reallocate the skb if the true size is small (e.g. below
> 256B) in order to avoid consuming the high order page from the page_pool. Maybe
> we can avoid it if reducing the page order to 2 for LRO queues provide
> comparable results.

Hm, truesize is the buffer size, right? If the driver allocated n bytes
of memory for packets it sent up the stack, the truesizes of the skbs
it generated must add up to approximately n bytes.

So if the HW places one aggregation session per buffer, and the buffer
is 32kB -- to avoid mem use ratio < 25% you'd need to copy all sessions
smaller than 8kB?

If I'm not making sense - just ignore, I haven't looked at the rest of
the driver :)

