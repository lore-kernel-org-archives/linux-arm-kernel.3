Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22340CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 01:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJG4XoNLe+HrOhW9uLO9r9lFJaRihaK5ZlquYGNlnDY=; b=FkgS/MAkY0agi574dE5xDKxy4S
	iKCwjLJhhLrTx0227Xtkx1TjFRvTgUxWrJOlAOHgYK2jS6hM9F6s60fraTBbQ1R1VYpyGeYa81WlI
	MFlqdhEJNiPnmInUfeJxuYBvi1oDMAbt3wLQ2YDX5j9qeEKjvpkNKVIz0MdjlajWXLdiqHpxBtNb9
	wD83ilSqWRtNjCFJm2kKutphOZu/1Z/ZReeU/KAzA0YZi06jjSszFlJSezZdzuDQtUudaxPLi9sFZ
	ejpuvRTmkLbG7T8Dq5BLU5FdCSpuz0jA743KBuVfziyxE3C7FawLT8+pewKiIcplS2K+nJtH1WGMQ
	o1rRmX+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHYAD-000000021uC-2ukt;
	Sat, 08 Nov 2025 01:54:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHYAC-000000021tT-1YcJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 01:54:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7047A60194;
	Sat,  8 Nov 2025 01:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EBE8C4CEF5;
	Sat,  8 Nov 2025 01:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762566887;
	bh=KwsTq0eN5+f8YdZnUHqQpE5xoyBoiV9hCa9F5h/P17o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Mf+Gza0JFU9wwYzaaLr+Yz+a/NK52E0dh7W0GPm5dBRZRLEOWC1aoz67jd6UiXZWN
	 ggugPJh3Rg4bNcs3N4qCQzqznHh0xcz1m8CbkRqwTFfohJ0meHtsYwdDwL9s8sl2lJ
	 3a+mBCq6YiSdLHlhQ60jbpdiMIZzsZw58o/QpPzYYETu5oaaKm2chHyHNDd4Gt5Tyw
	 V67EoOgzymb0GmmZMZgazI7b9yPArdQk+846eQQXKxWHFgrZOxzznH/XkOtvfQziCO
	 vYen+B+Jdbu+C1c5Sb/fhOtVMLquY0lG83/vFpnHKEUdQqUsQnH4rV0CdBnXDahCst
	 IKf0IseIm7i/A==
Date: Fri, 7 Nov 2025 17:54:45 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: netdev@vger.kernel.org, Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?=
 <toke@toke.dk>, Eric Dumazet <eric.dumazet@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 ihor.solodrai@linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
 makita.toshiaki@lab.ntt.co.jp, toshiaki.makita1@gmail.com,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-team@cloudflare.com
Subject: Re: [PATCH net V3 1/2] veth: enable dev_watchdog for detecting
 stalled TXQs
Message-ID: <20251107175445.58eba452@kernel.org>
In-Reply-To: <b9f01e64-f7cc-4f5a-9716-5767b37e2245@kernel.org>
References: <176236363962.30034.10275956147958212569.stgit@firesoul>
	<176236369293.30034.1875162194564877560.stgit@firesoul>
	<20251106172919.24540443@kernel.org>
	<b9f01e64-f7cc-4f5a-9716-5767b37e2245@kernel.org>
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

On Fri, 7 Nov 2025 14:42:58 +0100 Jesper Dangaard Brouer wrote:
> > I think this belongs in net-next.. Fail safe is not really a bug fix.
> > I'm slightly worried we're missing a corner case and will cause
> > timeouts to get printed for someone's config.
> 
> This is a recovery fix.  If the race condition fix isn't 100% then this
> patch will allow veth to recover.  Thus, to me it makes sense to group
> these two patches together.
> 
> I'm more worried that we we're missing a corner case that we cannot
> recover from. Than triggering timeouts to get printed, for a config
> where NAPI consumer veth_poll() takes more that 5 seconds to run (budget
> max 64 packets this needs to consume packets at a rate less than 12.8
> pps). It might be good to get some warnings if the system is operating
> this slow.
> 
> Also remember this is not the default config that most people use.
> The code is only activated if attaching a qdisc to veth, which isn't
> default. Plus, NAPI mode need to be activated, where in normal NAPI mode
> the producer and consumer usually runs on the same CPU, which makes it
> impossible to overflow the ptr_ring.  The veth backpressure is primarily
> needed when running with threaded-NAPI, where it is natural that
> producer and consumer runs on different CPUs. In our production setup
> the consumer is always slower than the producer (as the product inside
> the namespace have installed too many nftables rules).

I understand all of this, but IMO the fix is in patch 2.
This is a resiliency improvement, not a fix.

> >> +static void veth_tx_timeout(struct net_device *dev, unsigned int txqueue)
> >> +{
> >> +	struct netdev_queue *txq = netdev_get_tx_queue(dev, txqueue);
> >> +
> >> +	netdev_err(dev, "veth backpressure stalled(n:%ld) TXQ(%u) re-enable\n",
> >> +		   atomic_long_read(&txq->trans_timeout), txqueue);  
> > 
> > If you think the trans_timeout is useful, let's add it to the message
> > core prints? And then we can make this msg just veth specific, I don't
> > think we should be repeating what core already printed.  
> 
> The trans_timeout is a counter for how many times this TXQ have seen a
> timeout.  It is practical as it directly tell us if this a frequent
> event (without having to search log files for similar events).
> 
> It does make sense to add this to the core message ("NETDEV WATCHDOG")
> with the same argument.  For physical NICs these logs are present in
> production. Looking at logs through Kibana (right now) and it would make
> my life easier to see the number of times the individual queues have
> experienced timeouts.  The logs naturally gets spaced in time by the
> timeout, making it harder to tell the even frequency. Such a patch would
> naturally go though net-next.

Right, I see how it'd be useful. I think it's worth adding in the core.

> Do you still want me to remove the frequency counter from this message?
> By the same argument it is practical for me to have as a single log line
> when troubleshooting this in practice. 

IOW it makes it easier to query logs for veth timeouts vs non-veth
timeouts? I'm tempted to suggest adding driver name to the logs in
the core :) but it's fine, I'm already asking you to add the timeout
count in the core.

I'm just trying to make sure everyone can benefit from the good ideas,
rather than hiding them in one driver.

> BTW, I've already backported this watchdog patch to prod kernel
> (without race fix) and I'll try to reproduce the race in staging/lab
> on some ARM64 servers.  If I reproduce it will be practical to have
> this counter.

