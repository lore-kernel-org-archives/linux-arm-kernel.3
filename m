Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B35E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=US0sNSA9+vWU77C0dKGx5HEPtf3IqHGi45uXTp6uT90=; b=WaOQ8n5Ly4kmCX
	r1D5wASOEFPqlpW0fjNi00CNuTBc2A6D0Ixcv49OVdzrLOxC75OuptNTpQzILTmUPDjSzrYZ6nTfc
	h/7uC0wWhAdamkyEw62y8gB1izN/PWWw9vbykbwNni4OVnPUR+7Qb41BLQO987OUu3kUuJknfsW0o
	rWBOJGbHf7xQuucJaN/BWBY4QBqyBzUJjunPFo0glFy1CPG8FnHt4osjG2IuQjLhnwxBvdrnc+1lx
	Kdbeaf/+59J4HnYB82NR5I5cYR7dacblc+m0RLwOVxHZtAbpBBT7KCXMUgj+fkOn06xlu3a70Wc5m
	MKfrlb8xoXN540X0SeFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmim-0000000181m-2gC7;
	Thu, 12 Dec 2024 17:11:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlqZ-00000000vYz-1IHt;
	Thu, 12 Dec 2024 16:15:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1AB5DA428B1;
	Thu, 12 Dec 2024 16:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C380AC4CECE;
	Thu, 12 Dec 2024 16:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734020126;
	bh=US0sNSA9+vWU77C0dKGx5HEPtf3IqHGi45uXTp6uT90=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=bo3M0O7NEW5DrPsa+237O22XtQJZW9dTotn6RtDp6LWegudmtbYElUOb0y9R041UG
	 643Kb6M1zNYDFRdRKdUfVg65klYDRBVhNHuRQBulAPSSSwnJYZp+8mG6in53Cc7DxX
	 iVxeLqwMJpXwgHVj/Fu8fne8LxtofEKK/PkuDCMi45i7rvue7UO56qehqi1o0lem2K
	 RAtPmxHOLbgbqf8kt4YvRl/BDPvCg2P3VO6H/olO99JX7VoBVk272msh9SzXNxDjKA
	 cgb3anQh+slDUqL1MTZZ32GhUEDqp6mmu+72Sq4lBcuZpetk7sn6O1cnoOYZOEtWop
	 wVhHYLRvHkxGQ==
Date: Thu, 12 Dec 2024 10:15:24 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jinjian Song <jinjian.song@fibocom.com>
Cc: chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
	haijun.liu@mediatek.com, m.chetan.kumar@linux.intel.com,
	ricardo.martinez@linux.intel.com, loic.poulain@linaro.org,
	ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
	corbet@lwn.net, linux-mediatek@lists.infradead.org,
	danielwinkler@google.com, korneld@google.com, andrew+netdev@lunn.ch,
	horms@kernel.org
Subject: Re: [net-next v1] net: wwan: t7xx: Fix FSM command timeout issue
Message-ID: <20241212161524.GA3345429@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212105555.10364-1-jinjian.song@fibocom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_081527_409485_4508E1D7 
X-CRM114-Status: UNSURE (   6.19  )
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

On Thu, Dec 12, 2024 at 06:55:55PM +0800, Jinjian Song wrote:
> When driver processes the internal state change command, it use
> asynchronous thread to process the command operation. If the main
> thread detects that the task has timed out, the asynchronous thread
> will panic when executing te completion notification because the
> main thread completion object is released.

s/it use/it uses an/
s/te/the/
s/is released/has been released/

