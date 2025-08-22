Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E684FCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GS/zqLZ7qyXkT4joWGssYQK3kGFHcKwQnTldwg/vqrg=; b=3V/qN1428t1YbsuZOVSI9cVhFI
	KOfF5/4hJ0aprXHtCPxaIAZk96DFGxrPB/Vt4V1/xQ1Ob1D2y4lQ7RSGH86GScHKSTxNIzXgvR/Pu
	7uPLPSeJFwJ7MbEMtqz6S6vovU3btX8joyptRR7tiwkMqA9qTu6/CUEjNRDILK/i6kf85fxQGNmYB
	R6cxhnYOrYROmCBhyq1uDl5oFKYHksRb80ckxwbdgXxzXV+hkEI/pBtUEtY9+LsbUReZkMfatummm
	8ChwdRG8ojEEy6quJZHZKwGnw8Kz9oK8MRcpHQd47o1M1i4TdvYGMoNHxm0RBvvWcJYS0D0VMAa84
	21lmnpPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphnF-0000000418p-0CyA;
	Sat, 23 Aug 2025 06:32:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSue-00000002rG1-11nD;
	Fri, 22 Aug 2025 14:38:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AB8C26026B;
	Fri, 22 Aug 2025 14:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E83C113CF;
	Fri, 22 Aug 2025 14:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755873519;
	bh=0ohbEUcDQtMZ8LIN1dVF0ofMoZ/hGdLyI2kAkLh7ZKA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=V/o4d2lQpWluTRU64SKjomir38I8NJi6S9ntSkoEbKRY6tqm/4BPvkiVX5b8wSp3H
	 +CarlZrKKN46utWL+/QSTCo1IXlBGvkLMHYHOZErae2Z3VlxJoYXn8sQnjlvdoz0x9
	 6cJ17jsyLDY69OMlZJTFrw2aBaa75ACZI0OzNe3DGktGuzAddCX1Mc1mEnomi3XDN/
	 l+03Fiw9Az8B2Kuv73xg6F8CGQLujZBdr4EusRr2d6oyE+mAIm79qatpEcUceo7B9b
	 Z5dDy6ck95qOJc9iMv7sscc40h1F+T+AYsyhBxFarpl1Py5S8YLEZaLr95urPyCgpe
	 62NWVl87KI1lg==
Date: Fri, 22 Aug 2025 07:38:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] net: airoha: Add airoha_ppe_dev struct
 definition
Message-ID: <20250822073838.7da185f9@kernel.org>
In-Reply-To: <aKh9_g7mgvFxMdAz@lore-rh-laptop>
References: <20250819-airoha-en7581-wlan-rx-offload-v1-0-71a097e0e2a1@kernel.org>
	<20250819-airoha-en7581-wlan-rx-offload-v1-2-71a097e0e2a1@kernel.org>
	<20250821183453.4136c5d3@kernel.org>
	<aKgVEYMftYgdynxw@lore-rh-laptop>
	<20250822070440.71bdd804@kernel.org>
	<aKh9_g7mgvFxMdAz@lore-rh-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 22 Aug 2025 16:26:06 +0200 Lorenzo Bianconi wrote:
> > > I moved the of_node_put() here (and in the if branch) in order to fix a similar
> > > issue fixed by Alok for airoha_npu.  
> > 
> > Ah, didn't notice it in the print..
> > maybe remove the empty line between the of_find_device.. and the null
> > check on pdev then?  
> 
> I am fine with it. I did it this way just to be consistent with NPU code:
> https://github.com/torvalds/linux/blob/master/drivers/net/ethernet/airoha/airoha_npu.c#L403
> Do you want me to post v3?

Nah, it's fine.

