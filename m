Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FFEC9EC98
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJRXUcKkDog21NY9arGh1QRo0yXqzWSWI32WfNW/NXU=; b=b8T8x8fgCGo+UpFvzUZZ/qvkRi
	Cnsh7iw6s49d+8U8zgZJnVxUJnMu9gEKeZ6iuWm1nlbEhLtc6WQmtVvQvdZ+XAZf2Mg345jRR0KoU
	4zpO7PQG0qFotIaa0MgWiYs18mVcURFooODcU+OTv5RTLSuubVVxm2dm865v8E0Qx4Sxh4HtsCIFG
	AC7PABNFKOnXg1bjRWg6IGchSG+M6cYXvmua0CylT2cQnK8EvskU3V1kdahbMnaxDZ8Lh+mThcBwH
	8TVwTEZrscJSlW4Y2t5jvdvLjOKvzC6LVJU5op7UAgCx+pBWT0eHOLZH8R9uv6OM56hJR6JwpR6uT
	gZ5gGJRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJIv-00000005ZmK-3DQK;
	Mon, 12 Jan 2026 14:54:01 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJIs-00000005Zkt-1buR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 14:54:00 +0000
Message-ID: <e6499ec9-92d3-4a63-8172-3c09a8b64066@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768229632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WJRXUcKkDog21NY9arGh1QRo0yXqzWSWI32WfNW/NXU=;
	b=CYSKjae3S5FACFkMnLMzwVE2kPTt9AMRFN7mSAGW7ME7h8gCmWVnkY/8iXTwGDn78taKG+
	dlMM0E4bxhFjRCNUCQ0EdYqXcA3SfGlSkxhCK1yFDn7rUu5Sk2zK83MCOlOKqDNNxxeFqM
	XELoFN5cAGbovb03AKSOu9bx+yyVOnI=
Date: Mon, 12 Jan 2026 09:53:28 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] net: axienet: Fix resource release ordering
To: Jakub Kicinski <kuba@kernel.org>, Suraj Gupta <suraj.gupta2@amd.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, radhey.shyam.pandey@amd.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, michal.simek@amd.com, linux@armlinux.org.uk,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bmasney@redhat.com
References: <20260109071051.4101460-1-suraj.gupta2@amd.com>
 <20260109071051.4101460-3-suraj.gupta2@amd.com>
 <20260110115306.4049b2cb@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20260110115306.4049b2cb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_065359_442197_D000680F 
X-CRM114-Status: GOOD (  10.18  )
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

On 1/10/26 14:53, Jakub Kicinski wrote:
> On Fri, 9 Jan 2026 12:40:51 +0530 Suraj Gupta wrote:
>> Device-managed resources are released after manually-managed resources.
>> Therefore, once any manually-managed resource is acquired, all further
>> resources must be manually-managed too.
> 
> only for resources which have dependencies. Please include in the commit
> message what exactly is going wrong in this driver. The commit under
> Fixes seems to be running ioremap, I don't see how that matters vs
> netdev allocation for example..

In the series I originally submitted this in, I wanted to add a devm
resources (mdio bus etc.) at the end of probe that required the clocks
to be running. But as a standalone patch this is more of a cleanup.

>> Convert all resources before the MDIO bus is created into device-managed
>> resources. In all cases but one there are already devm variants available.

