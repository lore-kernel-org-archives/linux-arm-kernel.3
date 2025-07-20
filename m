Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91527C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 08:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3CtsWPc6sAJEoKTVwIDvEc3RD+jVQAfzGv1fq4mmqVA=; b=gRFVT0kD3zN/N+jlsO/fdKyHnM
	974w1a7fZ7kMiWjX8ff2UxkQK92QlsTeU/ijxOmKcadQzRxh2dR/5FLtVtgxmUh096UG1lCl84AG9
	XCHn8Xa1bNGjPIaPK6kAIu6mtnwk4E8m/VpcHa6dnKIn4/3Nv6MQzJ1IWVypghlejOaTJyFvO96lC
	UM01wpu9rDfxL0cS8Yn0Ye2NSUGh0x14Xq4MDQUlLaWmy/C1v/98oL0MTOdEINvIVUwfZTcp2t4tp
	Do3YlGqU4GRQ6S/wYMOg/p/FHajGk29vT29Kx6vpIIQ5/xCj6Ie5JsZFCrhaF7tiQ9nHq6kEdI1sA
	mjoT6oug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udPGv-0000000F1UR-48Oa;
	Sun, 20 Jul 2025 08:19:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udPEU-0000000F1Ln-1WXd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 08:17:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 127635C463F;
	Sun, 20 Jul 2025 08:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A046C4CEE7;
	Sun, 20 Jul 2025 08:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752999431;
	bh=uz+9uwg5GzsKa58Af9yysdJmmc/CEhLqyfvKNBmM2Y0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=otYFuESwe3oz6MhxHNte9zld6+C9v6bkFJFgXopq1hRRzIkjZXyzbuaAwRLoxMO2Y
	 SDfl+sadjw3MG5m9iO3OI9qeasqWg8j0C9jXaPGgJEjf/NLAeNpq4Q7u6AMGclU5Tw
	 PEmSz/RqowOJi5T+a/4nXVMnnsCXmvdNc59jE9bjDEVS0wKeMZuOsjbtLr1lYeMzS9
	 WGS5UhowiasmktVQ/Nf/ngB0lSdc6ObVu+v6fPM/UpcxuxvZyFIP/4aaMbaNNudgRA
	 O4N9k8aaFdcIvPTEtq2Gd30+gwdFatsEt1bKDKx14GKfPGrzAr5XjAxjVwTS3lRFEJ
	 xOYiuQNt0vWcA==
Date: Sun, 20 Jul 2025 11:17:05 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, Dave Ertman <david.m.ertman@intel.com>,
	Saravana Kannan <saravanak@google.com>,
	linux-kernel@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH net v2 1/4] auxiliary: Support hexadecimal ids
Message-ID: <20250720081705.GE402218@unreal>
References: <20250716000110.2267189-1-sean.anderson@linux.dev>
 <20250716000110.2267189-2-sean.anderson@linux.dev>
 <2025071637-doubling-subject-25de@gregkh>
 <719ff2ee-67e3-4df1-9cec-2d9587c681be@linux.dev>
 <2025071747-icing-issuing-b62a@gregkh>
 <5d8205e1-b384-446b-822a-b5737ea7bd6c@linux.dev>
 <2025071736-viscous-entertain-ff6c@gregkh>
 <03e04d98-e5eb-41c0-8407-23cccd578dbe@linux.dev>
 <2025071726-ramp-friend-a3e5@gregkh>
 <5ee4bac4-957b-481a-8608-15886da458c2@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ee4bac4-957b-481a-8608-15886da458c2@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_011718_447083_82ACDA39 
X-CRM114-Status: GOOD (  10.66  )
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

On Thu, Jul 17, 2025 at 01:12:08PM -0400, Sean Anderson wrote:
> On 7/17/25 12:33, Greg Kroah-Hartman wrote:

<...>

> Anyway, if you really think ids should be random or whatever, why not
> just ida_alloc one in axiliary_device_init and ignore whatever's
> provided? I'd say around half the auxiliary drivers just use 0 (or some
> other constant), which is just as deterministic as using the device
> address.

I would say that auxiliary bus is not right fit for such devices. This
bus was introduced for more complex devices, like the one who has their
own ida_alloc logic.


> Another third use ida_alloc (or xa_alloc) so all that could be
> removed.

These ID numbers need to be per-device.

Thanks

> 
> --Sean

