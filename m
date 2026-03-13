Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03183105A586
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 00:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HgjySDVNwgDQicznMS5CDu6nrUoMEBeK9VpMOFLo3PA=; b=i3Uf/I/jIoJnvi3v0EHSK10nY7
	BVay24AwzbajLpxsCBf3bUZjJlMGkYm31QDZGYCoHHbcYjwF1q5jMOwZLEkffpWY96xPcK2eCiuEN
	tFLr9d7C11Lk1rq2jsYmY9ZUNc50YwUS4Yud5S76kottVeboTgIddFiUAg79cu4QAFuqNOolmEOOp
	q1nEeoD0FzgelWo7jwGGoaPMDFgc+om8Vxg5UxlIQ8PbCXIlQbp84q0c1jmRVBhyQbxczkngM18VT
	6LKFK6gGMID5F6GOClomamOzashkQ4stCiUqfo6mifEzke2sk1cK/r9JKUtcCcuz8XxTh+0b/HbFh
	62wS/LRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0qIl-0000000Fudu-2saM;
	Fri, 13 Mar 2026 00:22:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0qIk-0000000Fudc-2rU4;
	Fri, 13 Mar 2026 00:22:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D1FEA60142;
	Fri, 13 Mar 2026 00:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2455FC4CEF7;
	Fri, 13 Mar 2026 00:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773361369;
	bh=wI1M2N3RZJ2ZGEFBVZ0oz+Ohx1k+qHSBfOqMj5JSSV4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gq9nHXeu+kEHaXkEFRtydIr1EtZQSG7QgbgG215lIgYebbhnpVIuXvY1VhlnK1bDq
	 IzZIR4Poy9LRkeBH7U2Eb6vXo6G6XYXQailY5puZOY9d+Byq07nfffRyh6bLSOaE1D
	 dYHVmdANm2v8xvZQhLo+zOMjQP6u0SXElZcDvyMVZROyKlL808xB1sPvUjHxyszUBY
	 t4bQSmaYWFIdLKiosStIwC+v/s9xbpeAgKayhr7jwPM6CAptO4X3Ljbkhfcg+hvL0E
	 I0EfKtAbFFaCxNK3+gvCbb2NT9LhrpLg4LHmGTtXHuvi35BCOg3J2dyiv89ubWAAhW
	 SoLtBjMKvVM4Q==
Date: Thu, 12 Mar 2026 17:22:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: select QDMA block according
 LAN/WAN configuration
Message-ID: <20260312172248.68742f98@kernel.org>
In-Reply-To: <abMsvOMnnuTdoG-9@lore-desk>
References: <20260310-airoha-qdma-lan-wan-mode-v1-1-64ec74dea872@kernel.org>
	<20260312172430.GA1267298@kernel.org>
	<abMsvOMnnuTdoG-9@lore-desk>
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

On Thu, 12 Mar 2026 22:14:36 +0100 Lorenzo Bianconi wrote:
> > Is this a bug fix?
> > If so, perhaps it is for net with a fixes tag.  
> 
> I guess we do not need to target net tree since airoha_eth driver currently
> supports just the LAN interface via the MT7530 DSA switch connected to GDM1
> and there are no WAN interfaces officially supported (PCS/external phy is not
> merged mainline yet, it is only available in OpenWrt).
> 
> > 
> > And at any rate, could you add some description of the before and after
> > behaviour?  
> 
> Theoretically, before this patch, GDM ports were equally distributed between
> QDMA0 and QDMA1 while this patch assigns LAN interfaces to QDMA0 and WAN
> interface to QDMA1. However, for the reason explained above, this change is
> not currently visible to the user.

Please update the commit message. And please try harder to explain 
the patches, this happens a lot with your submissions..

