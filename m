Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F3BC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 15:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vxNedAjVSukjlPsPkPSM2hsqyg7r1pIanZ7gFNuJhA=; b=MVyqqHpFZX8zjyw/CLma04sjsi
	KGO+3ukJQuCN2lZvv8rHnPb3Kxi8uqttUoqfgTJs6F7r6+ThRrC+sFIMm1B+2EC09MKH51hFBWv9K
	cyivjn2jdpWVwpona+/RMw74JXVmvNh1bnvHcbW2gY3GzVPXmmP9wAe5df0/Q5ukzywJdAT2oq8LC
	9oWqUc9/FRfgfuxdy4xB1ITHxE7nRp1PDcn88qdMdYDNoULOSxc3VL28LRa8tGjlNLYVDqSZfB2HB
	/2NJxno4fxG+xQyFAxiXpcwINoWWUx1UXdp8zv1ug4hlr+1FwIrmV4kY9JLSP8HskrRJPXKbnI+AV
	IyJHe8tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdwv-0000000G2TB-0Fgv;
	Fri, 20 Jun 2025 15:46:41 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdsc-0000000G1D8-3iHr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 15:42:16 +0000
Message-ID: <56f52836-545a-45aa-8a6b-04aa589c2583@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750434131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5vxNedAjVSukjlPsPkPSM2hsqyg7r1pIanZ7gFNuJhA=;
	b=I8GAJEjtP32F6Q/LrmgaBIS5PQsFSM5HwZwx0rWj3XnRmwTe/El0Ii75HYP9sLU6d/ZOJ1
	cVI/VZ6Wu44tRXNFU6169t1XuPyIfdInIkwtFErnMxZeu+yhZmUbYey44qlIToRwds80dF
	1U8WRtNlQekNfmts8HlBdehctnL7cJ0=
Date: Fri, 20 Jun 2025 11:41:52 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net 0/4] net: axienet: Fix deferred probe loop
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
 Saravana Kannan <saravanak@google.com>, Leon Romanovsky <leon@kernel.org>,
 Dave Ertman <david.m.ertman@intel.com>, linux-kernel@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, linux-arm-kernel@lists.infradead.org,
 Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
References: <20250619200537.260017-1-sean.anderson@linux.dev>
 <2025062004-sandblast-overjoyed-6fe9@gregkh>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <2025062004-sandblast-overjoyed-6fe9@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_084215_144792_5C04E1DF 
X-CRM114-Status: GOOD (  10.44  )
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

On 6/20/25 01:10, Greg Kroah-Hartman wrote:
> On Thu, Jun 19, 2025 at 04:05:33PM -0400, Sean Anderson wrote:
>> Upon further investigation, the EPROBE_DEFER loop outlined in [1] can
>> occur even without the PCS subsystem, as described in patch 4/4. The
>> second patch is a general fix, and could be applied even without the
>> auxdev conversion.
>> 
>> [1] https://lore.kernel.org/all/20250610183459.3395328-1-sean.anderson@linux.dev/
> 
> I have no idea what this summary means at all, which isn't a good start
> to a patch series :(
> 
> What problem are you trying to solve?

See patch 4/4.

> What overall solution did you come up with?

See patch 4/4.

> Who is supposed to be reviewing any of this?

Netdev. Hence "PATCH net".

And see [1] above for background. I will quote it more-extensively next time.

--Sean



