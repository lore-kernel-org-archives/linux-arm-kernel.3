Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA86C3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 12:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIXcUY/fSCMcDvHSWI4IRhB/8040uy1a8GFVe9KfPlY=; b=i3U7YFl0fxszTP4wWAzdpGQbgL
	2v1IXJCtYLtBU1yaWJ6P5rR7dfg4PRoxHgBB1Mug0h7OQ1CViYJo0k3HESrjQzuPUst87CtSoU+3o
	3m/2VUgPxpug1v2xxWA9IqQ8zE3AvZkWi6gRBjXy43PfoFHCMlSKyLaxEB3kQ6YYmXM2HeOIc1VVm
	4Duay/8OT1kw05EPZnBPX/VQOjEfLQrMCi5eaCyZNvToPyGbtQgRDDIGaBbU/2E+w90wc+TjPSOCw
	ttlYNJpae/byx5IcRdG3aST236WHCUPKHT0kBL+6SEcuuesCgKHjempaSb9utd+KzTkNkaJ+9A8Ik
	G4YahxRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESbm-00000009RHY-00at;
	Mon, 12 May 2025 12:50:14 +0000
Received: from out-180.mta1.migadu.com ([2001:41d0:203:375::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uES3M-00000009MB0-0r66
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 12:14:41 +0000
Message-ID: <5b9d9a5c-b647-4d56-ac04-d1c04a97bc30@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747052075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YIXcUY/fSCMcDvHSWI4IRhB/8040uy1a8GFVe9KfPlY=;
	b=wkwgEuwdgorTynaAGELwho4Dfk7DDSRlySUulcM0tru1JWDeHzdZsavuVSvUxhdFBpKb1p
	DuzHYHBPzx/9dz5LFKO0irWoBnjbjquskxzpTp6m+duI1eVbWWFkwDU0GTDOoDRiVO+ncd
	dnIvwibYdNaa6FidajdK11ZA1i6jrZo=
Date: Mon, 12 May 2025 13:14:32 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: ixp4xx_eth: convert to ndo_hwtstamp_get()
 and ndo_hwtstamp_set()
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, =?UTF-8?Q?K=C3=83=C2=B6ry_Maincent?=
 <kory.maincent@bootlin.com>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, linux-arm-kernel@lists.infradead.org,
 Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>, linux-kernel@vger.kernel.org
References: <20250508211043.3388702-1-vladimir.oltean@nxp.com>
 <dfb57a6c-8db7-4ab5-9d51-eec40cf8662e@linux.dev>
 <20250512120659.r7dmrugocat7ou3t@skbuf>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250512120659.r7dmrugocat7ou3t@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_051440_705921_94BE7F26 
X-CRM114-Status: GOOD (  11.73  )
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

On 12/05/2025 13:06, Vladimir Oltean wrote:
> On Thu, May 08, 2025 at 11:45:48PM +0100, Vadim Fedorenko wrote:
>>> The remainder of eth_ioctl() is exactly equivalent to
>>> phy_do_ioctl_running(), so use that.
>>
>> One interesting fact is that phy_do_ioctl_running() will return -ENODEV
>> in case of !netif_running(netdev) while previous code would return
>> -EINVAL. Probably it's ok, but may be it's better to have consistent
>> error path for both options.
>>
>> Otherwise LGTM,
>> Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
> 
> Thanks for the review. Indeed, I hadn't noticed the -EINVAL vs -ENODEV
> difference.
> 
> Are you suggesting that I first create a patch which replaces -EINVAL
> with -ENODEV in eth_ioctl(), so that ixp4xx_hwtstamp_get/set() is
> consistent with phy_do_ioctl_running() in returning -ENODEV?

The patch to net to make things consistent would be great, but no strong
opinion as there were no complains I believe.

