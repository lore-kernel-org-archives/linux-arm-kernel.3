Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BADD29C2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 14:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJuu4ULUfV+umhoxx3amYuxkLqbVUhJCj4GIbe/iJKA=; b=s803vH0OcsJBgch2irqDAt3ThU
	+0R4mHzaaWFl+iC87ZQIE1m4G9DNaORfeOLMB05c5GNkBhMujqCe71BWC7T2S73K6fOFIfb8LLra2
	cA8xH0UQrgANpZduYlJ5dd1FJyxOcmoSqxNfD6obNWLte/zi3rbrX9n8pvxJwRhXDK1+TzuWi8P+m
	NULQa8KV8C8435GtGDxw+7ZUhU5LTe9IwSJcEBTrJ+3E8bfoAjJ7207WMd5pK7zQoBvdAq3QzsoRB
	1YUt/NISbYMCdnf4Pnkyqy6mmaSJusnmt5sewUUtNndDcEVLr4SY339ftIk36gKjUJRDZaxrYrlSC
	jqyLPlKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqb8-00000002IFt-1ai5;
	Mon, 19 Jan 2026 14:51:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqau-00000002IFK-49Ht;
	Mon, 19 Jan 2026 14:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nJuu4ULUfV+umhoxx3amYuxkLqbVUhJCj4GIbe/iJKA=; b=VX3Jj1H7SiOv+CIBb/e3w1AItB
	6u8u9zsEX13PM7NERyGOifWlHVVEp96FSWBES6r5sgEJr49JCw0+vo/uXbbK1wDHDxX8NsuTLrP6u
	f4paQiXC7m3B+zGhE84nJprYbonuR5QHQPNMVfv6SfLdHAPlmMmXQQyUg9Gkg5aRYmFWE6LzHGnty
	7e4EGtRzBjU3FvZ9C/sspGRtemvH6ji8T+Jyw0AqwnaqKkai65Td6AuDzsDNdpiVhvBmcWP/WEp5T
	s05bQ5Qj6xdo+KCKchor02cJ7RvHHpIIfaFiCB98lcnMTecuHY2KRsiDpJMmMWujmfaCpSByMggRZ
	tiJZMICg==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqas-0000000CKP4-14jL;
	Mon, 19 Jan 2026 14:51:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nJuu4ULUfV+umhoxx3amYuxkLqbVUhJCj4GIbe/iJKA=; b=R/bjSLnKaunB5G29hAxpF6TDBK
	ThsxuwI+1mJSRw5P1KA7r8h2JhjdWSS6b6VaBxUNYpaihDc6teH1ReKC+dXBapQzcZu1G9226NfFd
	OGBAeR5n8ZOMIUgcZ8TbKyIMqbIE4Q/+MFgRy+Vcaju6R2o03Z6E98kmpAxAyZZ91N8w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vhqao-003Vvf-L4; Mon, 19 Jan 2026 15:50:58 +0100
Date: Mon, 19 Jan 2026 15:50:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sayantan Nandy <sayantann11@gmail.com>
Cc: lorenzo@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	sayantan.nandy@airoha.com, bread.hsu@airoha.com,
	kuldeep.malik@airoha.com, aniket.negi@airoha.com,
	brown.huang@airoha.com
Subject: Re: [PATCH net-next v3] net: airoha_eth: increase max MTU to 9220
 for DSA jumbo frames
Message-ID: <fa6a4cfa-0169-46e3-8c7e-190b69a97e91@lunn.ch>
References: <20260119073658.6216-1-sayantann11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119073658.6216-1-sayantann11@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_145102_375313_4BD43053 
X-CRM114-Status: UNSURE (   9.51  )
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

On Mon, Jan 19, 2026 at 01:06:58PM +0530, Sayantan Nandy wrote:
> 
> The industry standard jumbo frame MTU is 9216 bytes. When using the DSA
> subsystem, a 4-byte tag is added to each Ethernet frame.
> 
> Increase AIROHA_MAX_MTU to 9220 bytes (9216 + 4) so that users can set a
> standard 9216-byte MTU on DSA ports.
> 
> The underlying hardware supports significantly larger frame sizes
> (approximately 16K). However, the maximum MTU is limited to 9220 bytes
> for now, as this is sufficient to support standard jumbo frames and does
> not incur additional memory allocation overhead.
> 
> 
> Signed-off-by: Sayantan Nandy <sayantann11@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

