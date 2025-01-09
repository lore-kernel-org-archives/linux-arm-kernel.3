Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE306E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 16:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PO7wuLHYhu/sQrWAn1EFZqnOUEQDBFIEM+k5Z1OmnmQ=; b=GzzghZQjXxQdgQNd927uqCX1HW
	1ueb/esOFplKPeyPkbXx3zOgTa5qyr3ABnbTy+r2TZ7aOp6Ax3Kn2uyLDjTzwMrxz4xpUjQ5Vbv4m
	tF1kdrSx+d0wct4KeBrIodzGE8kcJlQJixL4JTUikwk+/Zz6JpTZ+V2i0R2b543xXKkjaj3OWYy4n
	Q7K57xhvz7MLbhCFx4CNsQOGv4b1QtGhrP1r9G9eJoozcwZ2NCkqzhX3o7wxufEmj9PDnEnLyEbLF
	2lgNcTdz39Al86u0n9npCvjnlQAgZgtoz1vSWqwmVSXa+6mdEIb6n/Ur0uaDG409Zq09C7iqK2FIe
	RLsB1f3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvWU-0000000Ci8W-3c2h;
	Thu, 09 Jan 2025 16:36:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvVI-0000000Chv4-2NGE;
	Thu, 09 Jan 2025 16:35:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PO7wuLHYhu/sQrWAn1EFZqnOUEQDBFIEM+k5Z1OmnmQ=; b=kMlDLiTc5hvTawJZvGgze+qe7A
	0zNC2p2TLWGmQYE6pzWq8fjWjfmXYnSjHPhldHz/NcBWqrxD/uQjWnAzt7SGCyzICr0/jk2CwPkY9
	YjV1i4tZkfyLOwMXRMFAsFXw+mrlLPfZIVUDZtGaxB5tI3wwiHmBu+AdIZq1U87C0VJ5YvSwFtLOX
	ubkvWwflJ3wk/YF6wm/mjSBmv1DvWjCJnNJUXRQMWCXnGrhFg0r3/yCmBm1uZb4o2y5DncSuN9pBm
	xDt2+pher60dmedVjHjMgtZTs7e28RT3RWUc6jqGH9M6gyfz4cnXAZ8mjqTZTRek2+W1zLDm8Ed9l
	DSqkLrmg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvVF-00000009bVO-29SH;
	Thu, 09 Jan 2025 16:35:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A1565C57EC;
	Thu,  9 Jan 2025 16:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3EAEC4CED2;
	Thu,  9 Jan 2025 16:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736440524;
	bh=HDQtOjWNaRleopOkQnGRfrXNxLHahRI8E0I9sjfOfnY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VSqE0hUJKRcCz4rH9kffObdwQa7VDkZl2buEK49F3k3K3U1hhe2QwJeWl2P1527cK
	 PFa5tPbUwvGi/tMTvLpE2CJCe4Z/UQoEfb1XYW6Mso646Vvp79fqcb0EQKC3zN73wW
	 23VPOTOXccDyUJ+2QDxBSagQ9uDXG+Ml75+R2ToU728COqju265Cp6Q3oA/Q5tKCa1
	 hPPaCAX5W2KbNHu46RGnJqmZ+S+8YIBjWjzVBvbNBb9dKUdUl1L5spW0Cm3W5ssZc/
	 pIn4McrOnStB7fmxE5Kdti3QIJhN4RMOGJaeDIpX2qsqgy2MTmviZL6NaG9XtW95KK
	 4u54OIpIfu20g==
Message-ID: <fccedc26-0bb9-4078-8a94-4199f6b383c1@kernel.org>
Date: Thu, 9 Jan 2025 18:35:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] phy: cadence-torrent: Add PCIe multilink
 configuration for 100 MHz refclk
To: Siddharth Vadapalli <s-vadapalli@ti.com>, vkoul@kernel.org,
 kishon@kernel.org, sjakhade@cadence.com, thomas.richard@bootlin.com,
 christophe.jaillet@wanadoo.fr, u.kleine-koenig@baylibre.com,
 eballetb@redhat.com
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com
References: <20250109121614.754466-1-s-vadapalli@ti.com>
 <20250109121614.754466-2-s-vadapalli@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250109121614.754466-2-s-vadapalli@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_163525_859603_358DD514 
X-CRM114-Status: UNSURE (   4.69  )
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



On 09/01/2025 14:16, Siddharth Vadapalli wrote:
> From: Swapnil Jakhade <sjakhade@cadence.com>
> 
> Add register sequences to support PCIe multilink configuration for 100MHz
> reference clock. Maximum two PCIe links are supported.
> 
> Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Reviewed-by: Roger Quadros <rogerq@kernel.org>


