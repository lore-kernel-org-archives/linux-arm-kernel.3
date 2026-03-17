Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAA5F3381B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 09:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T66eBRKbbWNix74RPrY58QfDr5Ij5mziGlb3TyEF0uI=; b=uuis+RVGVk1z3sYt2vZuRrKrcp
	nxNj5PlqoVAchBCKArv49VpbfW03jPRbeJ2knYzGjFyuzesCJ4qeFK5qDEx6CCZHvoeT3J3VQGI80
	S4cMSjCHZhRh4TgbJrs6boPtooSRSv/rtgqlAm6JefJvulc6NgucRcpDjMm8AFwlEi8RlXk8IzPOP
	zzAv6pQ15usGlJscFXhyyU1fNAcpndkO5K4dQ0OKKjAvsHDmc62Jub70wcJa7oytnud8N0sByMxhz
	DQxcRfeJhZUjKMYzrMLVxTu2nIo7XgUbvBIK7hKfHoGX9wHN2C/4JfhGpIevFYIMw43KFSNJfELMU
	LWnbSdMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QdV-00000005rWG-2XUJ;
	Tue, 17 Mar 2026 09:22:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QdU-00000005rVh-0ekp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 09:22:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0ED331476;
	Tue, 17 Mar 2026 02:22:41 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01E5A3F778;
	Tue, 17 Mar 2026 02:22:44 -0700 (PDT)
Date: Tue, 17 Mar 2026 09:22:38 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v2 11/13] firmware: arm_scmi: Add bound iterators support
Message-ID: <abkdXkA4iyJ5HKH7@pluto>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-12-cristian.marussi@arm.com>
 <abkGQn9ODanEVns5@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abkGQn9ODanEVns5@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_022248_232478_C3EEDE25 
X-CRM114-Status: GOOD (  14.50  )
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

On Tue, Mar 17, 2026 at 03:44:02PM +0800, Peng Fan wrote:
> On Tue, Mar 10, 2026 at 06:40:28PM +0000, Cristian Marussi wrote:
> >SCMI core stack provides some common helpers to handle in a unified way
> >multipart message replies: such iterator-helpers, when run, currently
> >process by default the whole set of discovered resources.
> >
> >Introduce an alternative way to run the initialized iterator on a limited
> >range of resources.
> >
> >Note that the subset of resources that can be chosen is anyway limited by
> >the SCMI protocol specification, since you are only allowed to choose the
> >startindex on a multi-part enumeration NOT the end index, so that the
> >effective number of returned items by a bound iterators depends really
> >on platform side decisions.
> >
> >Suggested-by: Etienne Carriere <etienne.carriere@foss.st.com>
> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >---
> >+static void scmi_iterator_cleanup(void *iter)
> >+{
> >+	struct scmi_iterator *i = iter;
> 
> I see you use no_free_ptr for allocation,
> Do we need to use __free for i or drop the __free usage in allocation? 

Neither I think...iter is allocated by iterator_init() which do use
__free cleanups to simplify error paths, BUT if everything goes fine
iter is returned with no_free_ptr() as a normal pointer and all the
compiler-attached cleanup helpers are removed...

Then you can use in an iterator_run() or iterator_run_bound() and in
borth case it HAS to be manually cleanup by calling this scmi_iterator_cleanup
helper where...

> 
> Regards
> Peng
> 
> >+
> >+	i->ph->xops->xfer_put(i->ph, i->t);
> >+	kfree(i);

..it is finally freed explicitly...

...or I am getting something else wrong around the cleanup helpers :P ?

Thanks,
Cristian

