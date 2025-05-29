Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7100C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 16:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ROEfGs105IHaeH5xuCxgG1C8SsFk2j1G03w+ZOsJUg=; b=Y3kBWIq8+ShNh62DeysmgI4yCa
	5YDf+i+eb7VKkHgArnEZI+sLY2fE/ZKIvZ0orA4tntbCa2tGTrMneNXAXuV9ltnchHxrJvMOj0Xbs
	0q8iBVrGdbJLg1UQmgxVckQfooRoTKpYM+qBZP4TzV0OWzy0nPRuGgC5OAnUOBkmWWIixAuNGlBas
	XCYvb3y68Xq4MpkRklWi4Lu9aafjCOMWgd0HE6j06nrfRsspq99XrDZWd/+S8TYZ1QDf/z1zgT8ZZ
	SSsIATnE4yxipMdNwQY6USrdnonAgqS0m1RXydqgYXjYr21gli3cx1lG1N7A2LEcbdVudhslHzb4s
	J+EXCK/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKgAu-0000000GBq5-1bwa;
	Thu, 29 May 2025 16:32:12 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKg8k-0000000GBUO-3LuO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 16:29:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2ROEfGs105IHaeH5xuCxgG1C8SsFk2j1G03w+ZOsJUg=; b=aNADSTtTgd5KKMFX4Rm0nf0gHl
	HzZWzw7JvPDyh9a18qfJZxA/TUZljPkO7xFQdYpTgj+hmSgqlctoifkmV3ngNW5RF4ELFPpRuTW8d
	IZMMlCgcvUcX4dzZGbjF5JKsD54f/Wz5TGgwK5aBDbdib3jANcJNiRNSxCA9tAyfpw0E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uKg8W-00EHbS-FC; Thu, 29 May 2025 18:29:44 +0200
Date: Thu, 29 May 2025 18:29:44 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: "Gupta, Suraj" <Suraj.Gupta2@amd.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"vkoul@kernel.org" <vkoul@kernel.org>,
	"Simek, Michal" <michal.simek@amd.com>,
	"Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
	"horms@kernel.org" <horms@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"git (AMD-Xilinx)" <git@amd.com>,
	"Katakam, Harini" <harini.katakam@amd.com>
Subject: Re: [PATCH net-next] net: xilinx: axienet: Configure and report
 coalesce parameters in DMAengine flow
Message-ID: <6c99b7f5-b529-4efd-a065-1e0ebf01468e@lunn.ch>
References: <20250525102217.1181104-1-suraj.gupta2@amd.com>
 <679d6810-9e76-425c-9d4e-d4b372928cc3@linux.dev>
 <BL3PR12MB6571ABA490895FDB8225CAEBC967A@BL3PR12MB6571.namprd12.prod.outlook.com>
 <d5be7218-8ec1-4208-ac24-94d4831bfdb6@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5be7218-8ec1-4208-ac24-94d4831bfdb6@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_092958_835152_1F83C3EF 
X-CRM114-Status: GOOD (  12.45  )
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

> Yeah, but the reason is that you are trading latency for throughput.
> There is only one queue, so when the interface is saturated you will not
> get good latency anyway (since latency-sensitive packets will get
> head-of-line blocked). But when activity is sparse you can good latency
> if there is no coalescing. So I think coalescing should only be used
> when there is a lot of traffic. Hence why I only adjusted the settings
> once I implemented DIM. I think you should be able to implement it by
> calling net_dim from axienet_dma_rx_cb, but it will not be as efficient
> without NAPI.
> 
> Actually, if you are looking into improving performance, I think lack of
> NAPI is probably the biggest limitation with the dmaengine backend.

It latency is the goal, especially for mixing high and low priority
traffic, having BQL implemented is also important. Does this driver
have that?

	Andrew

