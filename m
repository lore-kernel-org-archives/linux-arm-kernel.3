Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFB8E6B278
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 14:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czuRdb33nJ9B02aIMvZz3fSDl2SwHqqbdfhjqG9pdWw=; b=37mvOa3XX/ARBtOxOegZc/YQyW
	ESvgbXVGfxgs3XaOm/QiiSSctWCagyp9BxhC666gLfUOt+ThsnHIrjjabDcTvAJu2s+f4iOT0smFc
	gkSnjvXaoYbXIV2zzc8OKS2gDCa2qm4Kbnebgaj+hd8xEbER9FiNVFjWdgAqcAtiTe/JeoUVVmNh7
	oSKqNhV5eAGs+WTf1FkKfOcE4dIyvD+aw6ovJVXxre0ldp4znsq3P34qrGnze2vGBscTwD3HtDxk5
	pCZn7omaLyTyKYPj9vB5vrOF4PKXkETHe4QoCVLzJY8UQlKgAEEPWu6oCZlEHL9r+wuTEbharjSL9
	jB1cffiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sHj-00000007GwV-18yw;
	Fri, 01 Nov 2024 14:05:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s5U-00000007Eb8-06Yo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 13:53:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B9575CAFC1;
	Fri,  1 Nov 2024 01:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8EDC4CEC3;
	Fri,  1 Nov 2024 01:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730426347;
	bh=e/5+w9O+7c3DfCZH0rpgxQmU5SaumU3upXo1zXNjSmg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=D2xWVFQSchYgDt7XMziCsV/TwybO5ItBh8+biDjxhSe+OJJKaqZw1LG+w93C+23pi
	 +xHrn6F0t2A5SFyOo7XPS8iwvT8pi1LN66ECI60EKWYFMkZCKlWsw1ZAEkZNHPKHIc
	 A76Ecesjm5jK0TU/5tAW56twZvG+CN6+IBZN3CT6uCApoo1e1JRPf5cJ6ZUad4q1oL
	 0nNvLeLs7cycdJiODevXkLt54trgSv/pEzibbOZdrxl/5F//TQw09omCcmrZ2uCQqe
	 z64EX+lQh+ayjIHnCvFHL/jD1iMiru8gMUPskGRqQNsfIGXWRpw0T8ruHhHMc1pjv8
	 9rqCnFkOspyjA==
Date: Thu, 31 Oct 2024 18:59:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: <vigneshr@ti.com>, <grygorii.strashko@ti.com>, <horms@kernel.org>,
 <jan.kiszka@siemens.com>, <diogo.ivo@siemens.com>, <pabeni@redhat.com>,
 <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Roger Quadros
 <rogerq@kernel.org>, <danishanwar@ti.com>, "Vadim Fedorenko"
 <vadim.fedorenko@linux.dev>
Subject: Re: [PATCH net v3] net: ti: icssg-prueth: Fix 1 PPS sync
Message-ID: <20241031185905.610c982f@kernel.org>
In-Reply-To: <20241028111051.1546143-1-m-malladi@ti.com>
References: <20241028111051.1546143-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_065316_132195_62E130F4 
X-CRM114-Status: GOOD (  10.63  )
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

On Mon, 28 Oct 2024 16:40:52 +0530 Meghana Malladi wrote:
> The first PPS latch time needs to be calculated by the driver
> (in rounded off seconds) and configured as the start time
> offset for the cycle. After synchronizing two PTP clocks
> running as master/slave, missing this would cause master
> and slave to start immediately with some milliseconds
> drift which causes the PPS signal to never synchronize with
> the PTP master.

You're reading a 64b value in chunks, is it not possible that it'd wrap
in between reads? This can be usually detected by reading high twice and
making sure it didn't change.

Please fix or explain in the commit message why this is not a problem..
-- 
pw-bot: cr

