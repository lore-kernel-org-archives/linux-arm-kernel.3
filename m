Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6F710BA421
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 03:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSPHdHyg+uH9B41/pLMTI1+glPJGMLW1zAyv4w3Z/U0=; b=Q2N5JGXb6gohfDjyLE5Qbi5ji9
	CCim9CkoOcosOxvEZKAUmv/Ix9QKHBYLOHfQbCxMWQnHiTMxbjdYszlBxSaqPNRt86j1/CI3cUKre
	cWl5gFvNoF+f4r1mfZ/wx2r43AXxcs4qjOiv3wM9h3YprWrpg++IApE2jT7zD8j6Kgm0TeqM29srz
	59+iweuV12YrzZEmQTXNJZ5JEYRYz9kYgVpOD+KcNI+tq7Od9YhLMy8NPIovPZ9FCBlMMaAjc4jD2
	UOZgWGfMY0fhFeKD11BBocGSo33J/RqMPKjG6sNz4l85+dESDKq2KYhgxv/sdpczR1bA3QZ+a4270
	LnaCGOKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5xWV-00000006awo-0PY0;
	Fri, 27 Mar 2026 03:06:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5xWR-00000006awE-3v0r;
	Fri, 27 Mar 2026 03:06:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E95343A89;
	Fri, 27 Mar 2026 03:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8165C116C6;
	Fri, 27 Mar 2026 03:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774580767;
	bh=GSPHdHyg+uH9B41/pLMTI1+glPJGMLW1zAyv4w3Z/U0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=i7umSLLH7F7pSYDbl4NzXHQ0/+ryzvhUGshvZhEfrM99aWA9u3sA9d4wdqIVFSM7n
	 1r0versrA4SxwpmwSIvQu6GFPgRSW1s3qR1Yja//u/HolhHcA114r9vbzeL0agNdYC
	 1M/qlqZln64ybSpKJCPEGJcV+TkhOX3PalmnFChaGm32cff6v96BtAi8rnld987iHt
	 9K172xEzUVi6FrdqckncHtXDfDb4vh5M6/3fGpnoXLVo+z+Ct3WwYKbls4BSYZjpoR
	 1v0Lp77mlev+cA7uCm9RomtNklZrjNhwh2a7MbBSEtQGTYZtJ4bv1oMmy9unj44mjN
	 UVLdXPrCKJD9Q==
Date: Thu, 26 Mar 2026 20:06:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Grab flow_offload_mutex running
 airoha_register_gdm_devices()
Message-ID: <20260326200605.39222917@kernel.org>
In-Reply-To: <20260324-airoha-regiser-race-fix-v1-1-6014df55886b@kernel.org>
References: <20260324-airoha-regiser-race-fix-v1-1-6014df55886b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_200608_678589_1282BB93 
X-CRM114-Status: UNSURE (   6.21  )
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

On Tue, 24 Mar 2026 17:54:45 +0100 Lorenzo Bianconi wrote:
> Netfilter flowtable can theoretically try offload flower rules as soon
> as a net-device is registered while not all the other ones are
> registered/initialized, triggering a possible NULL pointer dereferencing
> of qdma pointer in airoha_ppe_set_cpu_port routine. In order to avoid any
> possible race, grab the flow_offload_mutex running
> airoha_register_gdm_devices().

Sashiko says this causes a lock ordering issue:
https://sashiko.dev/#/patchset/20260324-airoha-regiser-race-fix-v1-1-6014df55886b@kernel.org

