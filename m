Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4ECCC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 07:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xj4hLpHjzheP4AEGLpAFn5JMjwlG+fQsoZ3qshX2rR0=; b=hK1m+Hozmli1Msq+H8+3GsNnG5
	+axe+bYmeb61Ro/9xrZIgWo7WHOfuylehb2GMafingrYkRs0qZlyTKuljjySDeJ1Kv03RsIsWOolU
	VJclBj/X/XpqkxPieEX2z92S3a8lVA3UQKjKGigsICNH4Lnlddh/0jahVmi9RZAbRYy9uaTxzol+2
	o1RwQ9V+DIh+8vYwlunBoyqrwtRI34Cx3RGjl/hOtKbKR73n32YmuUF+sQFHxZdIJtWjs9bxFnI9f
	TzBFEMGd0yNvV9jkliYUpH0z1LWggLB2MWcjbc4qKC62QZ/ky4sfB0A774RnGX9mhbnTOOsQmgbH9
	d/MjAinA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGB7-0000000H4JV-42iB;
	Thu, 15 Oct 2026 07:47:05 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGB4-0000000H4Gf-2jDM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 07:47:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B820F4E41246;
	Thu, 15 Oct 2026 07:46:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73D0960360;
	Thu, 15 Oct 2026 07:46:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B966010328B8D;
	Thu, 15 Oct 2026 09:46:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792050414; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Xj4hLpHjzheP4AEGLpAFn5JMjwlG+fQsoZ3qshX2rR0=;
	b=I4aZWQJa5eiMyD2REL02NTzzy7IuxQ8lj0letekuQ91rK5zrme4YUkJhRJysD+FfKkEYuT
	PEkt0FYKr1T6q2KU797FoRXLy7yRKSncC0itrLXXM3ogzKDH12QxTatZIPgFeiginCetqK
	wBObo6K1YafbwYlRDsar1dzlynLMsRa/2JFV3KWAYffJA0xLoLskd9OQ13dVitcYQcdL3k
	y+od1ZIbNhZcK8fkgkx1zCtPpem8AlyfVrri8SQRzW7d340wK5lXpTRlZWN2kjEBDHTFbc
	dgB9wfe1wfWQLBdqqk0XkA/thJiXwYCdxMwbOr9qZqyzH6zQEZl5PWG7/Tadsw==
Message-ID: <cccfd292-6169-449e-a675-a9bb54ec4191@bootlin.com>
Date: Thu, 15 Oct 2026 09:46:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/3] net: selftests: use skb_share_check() in the
 loopback receive hook
To: Nicolai Buchwitz <nb@tipi-net.de>, netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, o.rempel@pengutronix.de,
 andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, Jose.Abreu@synopsys.com, saeedm@nvidia.com,
 tariqt@nvidia.com, mbloch@nvidia.com, leon@kernel.org, dtatulea@nvidia.com,
 alazar@nvidia.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org
References: <20261007-nb-net-selftest-shared-net-v1-1-458369bfa1ba@tipi-net.de>
 <179149509090.434549.9918598206439291164@kernel.org>
 <533b88ce917b59f4f59f52145d2f035f@tipi-net.de>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <533b88ce917b59f4f59f52145d2f035f@tipi-net.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_004702_837152_3A7A3D67 
X-CRM114-Status: GOOD (  10.08  )
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

Hi,

On 10/9/26 08:49, Nicolai Buchwitz wrote:
> Hi Clashiko
> 

[...]

>>
>> Could an IPv4 frame that arrives during ethtool -t make the hook read up
>> to about 64 bytes past skb->tail? Examples would be a minimum-size TCP
>> segment or a frame with ihl=15.
>>
>> The over-read seems to stay inside the skb head allocation, because
>> skb_shared_info follows skb->end. If so, the only effect is a possibly
>> wrong selftest result.
> 
> The length check is pre-existing, will address that in a follow-up patch.

I'm unsure about this, Can we instead assume that when one is running the
"ethtool -t" selftests on a machine, they are doing so in some controlled
conditions ?

IOW can we take the assumption that we won't get incoming traffic at the same
time as we run the selftests, and if we do get some and that triggers a wrong
result, this is expected ? ethtool selftests are very cheap to run, only a
handful of seconds, and don't require any extra dependency, it doesn't cost
much to re-run them if something unexpected happens during them.

ofc. getting a stray frame during the selftests mustn't crash :)

That's my take on these tests, but feel free to disagree :)

Maxime

