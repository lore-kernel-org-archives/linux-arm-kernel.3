Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA884CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 08:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lVUttG8iRwcZ+EEkZGFkY8VCO4ZqOKXFF79fwhVmDpU=; b=sOr8hUmiS01k8Kv1MiJwt6xI+C
	q2SPgPtY96inIMmBujYLFENYFkM5d2kjJ4wcC/Z9+uO6OC9IpgD9m6j8tk81+sD0yGMHxNXUsVMEo
	jPYxARN83CVosMAoatepsyj1eRTmVbzUS83jVPe2DRBN63CubeZl+ISuT6MHQQm3UinenRr5o3Wfd
	FHFG28V4a2TbgmUEYDaTz3ZCfmaUHO1+5LSfTieM/0Sg4iDDkjgWAubg2wbXaTdsj9UGAutREhOXy
	3iqPqTShiOfNJeCvjCxoIVT5u2cWpL0La9V8lYCdcWhZISAs3gV3d+E9+uFcM851Mk4EmXv17MaD1
	ym0EdX+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGPc-0000000H65N-0Cjb;
	Thu, 15 Oct 2026 08:02:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGPa-0000000H65F-2hNt
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 08:02:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lVUttG8iRwcZ+EEkZGFkY8VCO4ZqOKXFF79fwhVmDpU=; b=hUNJ+brSszwWiYYEQF3E/j1ET7
	LDscJV0R9StRzmPAVt4v35/52YgfLYummK/+PJZunO8dW7aX8yh2bzZlNr2h+G81LJex4u68YlVqu
	iUy9VHahtvXSEa0VM9MTV1Fcf3MUum69aTTPW7u7rJfFGXQbj95hVPZljpVqU+RiuFefEvL9qaVB4
	bC8h/G7Z0vsc9pZv6Q1ak3jrEs/7xX/M34rZkMK/rUfc7YuE/bKEeZzj88CSz6NTg74t6vE94PB2D
	C6q5pfZM4I7GTvJj565atbH9So8yVdX7rOhwCQr5bYZXi5agR99QiibMTFNmKsUj6rSkXBDXUwUPt
	fO+UOqHA==;
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHGPX-000000004fw-1PjL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 08:02:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 685AFA1544;
	Thu, 15 Oct 2026 10:01:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1792051306; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lVUttG8iRwcZ+EEkZGFkY8VCO4ZqOKXFF79fwhVmDpU=;
	b=u2mCl7oyCi8dyZxjmVyFnt8dJgiEPaEMIOtQGIeJPZSatiNCMbd3UKDKNqpes8pwee5u/F
	lbvZUwDtJIoRyCjQ/+cS3jNdZajXUjYoxOvqPHBqSmlR9BUNcynm2DieqAh4giytIEf2hk
	CEwrarokbGLOInTIARveF4YGWoW+66ac4BkojHGFTcV8lCZDnywS+oZHmodumC9PcXZoqa
	IbiLemW1IXQ5T9xu0JwDwPa61Pzc6ENAVMVimKSjQRHtU25i0FoGXF+Fu+X2WaJyFt68gY
	94Gh8P+/sVSBhjl1S9eV8VXeuhpqyGzyrpmP2Wq92Uk3tNqbLdWqCGVxCWhfuA==
MIME-Version: 1.0
Date: Thu, 15 Oct 2026 10:01:41 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev-bot+sashiko@kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 o.rempel@pengutronix.de, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, Jose.Abreu@synopsys.com, saeedm@nvidia.com,
 tariqt@nvidia.com, mbloch@nvidia.com, leon@kernel.org, dtatulea@nvidia.com,
 alazar@nvidia.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org
Subject: Re: [PATCH net-next 1/3] net: selftests: use skb_share_check() in the
 loopback receive hook
In-Reply-To: <cccfd292-6169-449e-a675-a9bb54ec4191@bootlin.com>
References: <20261007-nb-net-selftest-shared-net-v1-1-458369bfa1ba@tipi-net.de>
 <179149509090.434549.9918598206439291164@kernel.org>
 <533b88ce917b59f4f59f52145d2f035f@tipi-net.de>
 <cccfd292-6169-449e-a675-a9bb54ec4191@bootlin.com>
Message-ID: <d28efab10f43a46d51cdfd978b0a1e90@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_090159_741952_8A5733A8 
X-CRM114-Status: GOOD (  14.47  )
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

Hi Maxime

On 15.10.2026 09:46, Maxime Chevallier wrote:

> [...]

>>> Could an IPv4 frame that arrives during ethtool -t make the hook read 
>>> up
>>> to about 64 bytes past skb->tail? Examples would be a minimum-size 
>>> TCP
>>> segment or a frame with ihl=15.
>>> 
>>> The over-read seems to stay inside the skb head allocation, because
>>> skb_shared_info follows skb->end. If so, the only effect is a 
>>> possibly
>>> wrong selftest result.
>> 
>> The length check is pre-existing, will address that in a follow-up 
>> patch.
> 
> I'm unsure about this, Can we instead assume that when one is running 
> the
> "ethtool -t" selftests on a machine, they are doing so in some 
> controlled
> conditions ?
> 
> IOW can we take the assumption that we won't get incoming traffic at 
> the same
> time as we run the selftests, and if we do get some and that triggers a 
> wrong
> result, this is expected ? ethtool selftests are very cheap to run, 
> only a
> handful of seconds, and don't require any extra dependency, it doesn't 
> cost
> much to re-run them if something unexpected happens during them.
> 
> ofc. getting a stray frame during the selftests mustn't crash :)
> 
> That's my take on these tests, but feel free to disagree :)

Also fine with me. A stray frame just fails the magic check and gets
dropped anyway, so the test result doesn't even change...

Two patches less to fight with Clashiko over :)

Regards
Nicolai

