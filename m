Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD15C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 07:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30mE6EtS7dAUAXv8g8A2jwbq56uQ2HoBW0bwFwJDf0U=; b=1zT+jcC5/FiInYF2BdelxYcCpc
	FzNI9MRda5E1Ixkf45o8UI91V6gkUdd7hpXn92thsUcJu58ZU9Z28w7xF1KHg4fyRGXOlV6LdRf+S
	p4O2hC9zgwwfn4FABFz8dPgLeZb9Ou8Hpwx9MNmguJUiuaapt24VYADgKSLaSNLaJLGmLvUGQshiZ
	4WbTGiT09lFPacNHmU8JkapJ1D98WlIwXz1ZyRpt41EGXSxZSJKgGHGa2l4YkW1IxdU2MC+pxm0yW
	b8Fa3YyhmA0AdytMDIBVWXPD4xycOg0hN5wrC7kPdn6cwB5nq0xidLsXdqbXPmD/dppF1guriKNsd
	ODm+q9PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDeIa-00000005XFp-3tVB;
	Sat, 10 May 2025 07:07:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDeGb-00000005X8F-1J0w
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 07:05:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E12121595;
	Sat, 10 May 2025 00:04:48 -0700 (PDT)
Received: from bogus (unknown [10.57.45.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC1893F673;
	Sat, 10 May 2025 00:04:57 -0700 (PDT)
Date: Sat, 10 May 2025 08:04:56 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Radu Rendec <rrendec@redhat.com>, Will Deacon <will@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: cacheinfo: Report cache sets, ways, and line size
Message-ID: <20250510-fresh-magenta-owl-c36fb7@sudeepholla>
References: <20250509233735.641419-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509233735.641419-1-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_000501_395081_E6BAD89B 
X-CRM114-Status: UNSURE (   8.86  )
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

On Fri, May 09, 2025 at 07:37:35PM -0400, Sean Anderson wrote:
> Cache geometry is exposed through the Cache Size ID register. There is
> one register for each cache, and they are selected through the Cache
> Size Selection register. If FEAT_CCIDX is implemented, the layout of
> CCSIDR changes to allow a larger number of sets and ways.
> 

Please refer
Commit a8d4636f96ad ("arm64: cacheinfo: Remove CCSIDR-based cache information probing")

-- 
Regards,
Sudeep

