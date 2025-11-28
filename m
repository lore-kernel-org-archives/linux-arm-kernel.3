Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DE3D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 02:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VPCT+v7MU5WUauqFM7FFqJU57Q4jWJv6PiQi49hQ+eg=; b=NhYvrX/bhZ334BdfN6/6zL8uPz
	xxOmtqbdPPMlPWwdEfE+DZ/qLZvQx7e7wXKTU0pFDNvlAY14dxC6+gSUhJwHvauWXHYB3oqJUyydj
	TBScrFnbObTjlrZPxaGg0adkvC9bSn9ZutJlDS5mexh6a6QANu+N2zQT8ghiHe2tgTJfcM6t7MGF4
	fh8tdXmbt/z9MqSB7BJv2Bks90t3YtIffvlHB3Dyo7X5Rhj595L3tbGCatn4THRkEFcD8AgLS1qgZ
	bj88Uj+5c+jSnx8mHYhEouw5cr2l7TdU4r6GqmIzyC19EqWYT6+4IdsNZvAycb2j5WV0CJQiHzCPj
	o2E0RhMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOoSZ-0000000HTJw-2gVC;
	Fri, 28 Nov 2025 02:43:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOoSY-0000000HTJq-01rD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 02:43:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 322EA60251;
	Fri, 28 Nov 2025 02:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F053CC4CEF8;
	Fri, 28 Nov 2025 02:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764297824;
	bh=ln9QIdNfBV9vq6z8MK7E/UKuylweqyhRbQa8dmt+i68=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fEf7MjndT/YLWqGXG4ZHRR77PH79/DpyYBkXcwZSFmw9KJ6R+wS5QVQIltnFah+m5
	 C/t0kuc0xZFK7dPhabIybUIZS4CDi1m2kyvrfMtP86oDoWV3l8QPl5pFBNeacxg8Bh
	 T9yhk8ccSk4vDv4PNSxpAlDoO+ziROKOb/zCY2+t07p5MtnQVYXDfngP1qWDacPq92
	 d1mU92BAKPz70YZsiQI/oKFIDhSS40F9wbM/IiVcByB1XvgO17FML/XtZElYOXUSmw
	 5+g0y3kFidKxcDCX50i5G7IMGoTJBnCpUaaMF8jWHwMpdgOx3PfSD2mF/6cRFDnrx/
	 hLzg/d5OOM7gw==
Date: Thu, 27 Nov 2025 18:43:42 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, danishanwar@ti.com, rogerq@kernel.org,
 pmohan@couthit.com, basharath@couthit.com, afd@ti.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alok.a.tiwari@oracle.com,
 horms@kernel.org, pratheesh@ti.com, j-rameshbabu@ti.com, vigneshr@ti.com,
 praneeth@ti.com, srk@ti.com, rogerq@ti.com, krishna@couthit.com,
 mohan@couthit.com
Subject: Re: [PATCH net-next v8 0/3] STP/RSTP SWITCH support for PRU-ICSSM
 Ethernet driver
Message-ID: <20251127184342.5d15c0e6@kernel.org>
In-Reply-To: <20251126163056.2697668-1-parvathi@couthit.com>
References: <20251126163056.2697668-1-parvathi@couthit.com>
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

On Wed, 26 Nov 2025 21:57:11 +0530 Parvathi Pudi wrote:
> Changes from v7 to v8:
> 
> *) Modified dev_hold/dev_put reference to netdev_hold/netdev_put in patch 2 of the series.
> *) Rebased the series on latest net-next.

The only acceptable reason for reposting within 24h is when a reviewer
/ maintainer explicitly and clearly asks for it. Please (re-)read:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html
-- 
pv-bot: 24h

