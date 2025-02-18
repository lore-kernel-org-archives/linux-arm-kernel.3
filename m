Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBFEC021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 17:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0BPHDdMFCbMZ0idV3mt5hV/uCpN8cnHh5jYvtwtgN9A=; b=qg5qSQHNnM1F2YqLn1VcJZ75D8
	cLJWZTSuWMW7ps0QPIcArQxxFRgX3i19Ua+XP8WKFXOW9EMW+trOFF70XAmPLL7Li2oDxB2CWCzuH
	f68P0g8wWFqyBTvgzXoIF04JxkP3Gmq3zEt+x7NDG/0Ih3HRkB5Ys+geP1t++j4jdz8JmheijUsWB
	dVkUt90TN5dlyaXBCchPsG3llJ3jO66yL6H5DbrNsYld75c/vq9009LknKthETq7h2L0hFya+W/0I
	Iag8NkM8mrqrQoBnVOeBPqzdBetv2o9Q4WPhfmS7Ssd5MTZ5jaDUllwf3e6s0Lk53TAI4ysnuEtVB
	Ri/lC7yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkR2e-000000095GI-2sYl;
	Tue, 18 Feb 2025 17:05:52 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkR05-000000094m2-0lJw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 17:03:14 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 2D72111401C0;
	Tue, 18 Feb 2025 12:03:12 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-10.internal (MEProxy); Tue, 18 Feb 2025 12:03:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1739898192; x=1739984592; bh=0BPHDdMFCbMZ0idV3mt5hV/uCpN8cnHh
	5jYvtwtgN9A=; b=K+UCww/NIrIrEP8qQiHyMIWxT2XidsJwASKOZ6KQAJdOfuDa
	Q72lSs+o0nLTN6n/tZNOtTxff8LabyFY2K+Y12Ld6d8zjTKSWhqcHqxLsxexIzSW
	u6wccgmFl18vcAO475+b6x7EW0WkM2FdWHSeoV8+uVfhdqaq+BRLTv2xWLN1LuNh
	YKWEjCWZHLPa3oVAq3zQyuP34K7+UBWzCpZpKvGhyIDWslGHmx/g4HfqoMTr3jB9
	5oDMg0rqqnuylseoitz9we/B1oasOgrRzADJCtYCUQhzORcMSG4nhtCUXBedyf+m
	LOZmCkogDDW45O2hq45SG2hZT2qeLlokO1dF/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739898192; x=
	1739984592; bh=0BPHDdMFCbMZ0idV3mt5hV/uCpN8cnHh5jYvtwtgN9A=; b=s
	VNgKfAKtyNlRKtWh3giQ/F6gXvKUDtvLi38mpUiu9rKBpF78xyl/dfbEgsMmPEx6
	2KSbJLPxXJgdM4h0B8/6LyqdZKHzbqq5ILWZB7hX7fJgM1MecXTSoGu3utBMhogf
	qGQjKDF/yoxyoFornmKvm8GgHWcs1FFFteDOVcQEFEpPR3dUQWtp272/qoApkSBz
	vb4oJQs8tL4mHmnIcIo+i2zhu8cmYCW90a1U6WFQr83Jw4ytHWaTqCRU4A/ftI7G
	R5+T6dXfv23dEbNvhj5cift2ta2sl+j9LUjaejYRj3L1m+6x3QoyqXadRD7BbUQi
	8xaFbHzNZ9m9KL2PloQGg==
X-ME-Sender: <xms:T720Z6gKhRoTTVPysiTW7Ew64BVgySoT16Xku7m0VJF4L5xRny_uTg>
    <xme:T720Z7CVDp1Q5BvUePpzJDOhELNKcuXUyxrZGX2JKMrrnGMkc737xGUhXATZbPFGZ
    35KwPDmaaxPfdqJNoI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeiudekiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfuvhgvnhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvg
    hrrdguvghvqeenucggtffrrghtthgvrhhnpeelfeetueegudduueduuefhfeehgeevkeeu
    feffvdffkedtffffleevffdvvdeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdpnhgspghr
    tghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnrgesrg
    hsrghhihhlihhnrgdrnhgvthdprhgtphhtthhopegvrhhrohhrvdejsehgmhgrihhlrdgt
    ohhmpdhrtghpthhtohepjhesjhgrnhhnrghurdhnvghtpdhrtghpthhtoheprgigsghovg
    eskhgvrhhnvghlrdgukhdprhgtphhtthhopegurghnrdgtrghrphgvnhhtvghrsehlihhn
    rghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhish
    htshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhsthhs
    rdhlihhnuhigrdguvghvpdhrtghpthhtohephhgrrhhshhhithdrmhdrmhhoghgrlhgrph
    grlhhlihesohhrrggtlhgvrdgtohhmpdhrtghpthhtoheprghlhihsshgrsehrohhsvghn
    iiifvghighdrihho
X-ME-Proxy: <xmx:T720ZyE0Uo_RL4L9oANkNAaUZlRh00KHTaWthsC-Z-B_i8UdhvcmGg>
    <xmx:T720ZzREJdK2z8O2YRRSO-qR_zQvqGsVEgDoSBRSjx5Rx_mDrmj9nw>
    <xmx:T720Z3yGWCmRZMyB425hdtFL71FJtHMxtTbFz6FRhX0UQkotnwMD0g>
    <xmx:T720Zx5HuyadFMAiE-GH05qWA-d_rhmPai-REEyshc5d0VpYuGROVg>
    <xmx:T720Z8qvHTGNOVPcKX0nakfQEY7M9ziF0EllL3FEx_n2OpdA5SRyiJfS>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 11872BA006F; Tue, 18 Feb 2025 12:03:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 18 Feb 2025 18:02:50 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Harshit Mogalapalli" <harshit.m.mogalapalli@oracle.com>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>, "Janne Grunau" <j@jannau.net>,
 "Asahi Lina" <lina@asahilina.net>, "Jens Axboe" <axboe@kernel.dk>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 "Dan Carpenter" <error27@gmail.com>
Message-Id: <312a397a-ab54-4128-8f90-184ed719a9ac@app.fastmail.com>
In-Reply-To: <6c965dbc-9f01-414a-b218-2fa88155eb52@oracle.com>
References: <20250212085853.1357906-1-harshit.m.mogalapalli@oracle.com>
 <0e609fea-48b0-4b39-aae4-90395a782ed8@app.fastmail.com>
 <6c965dbc-9f01-414a-b218-2fa88155eb52@oracle.com>
Subject: Re: [PATCH] soc: apple: rtkit: Fix use-after-free in apple_rtkit_crashlog_rx()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_090313_289940_CFA261CC 
X-CRM114-Status: GOOD (  11.55  )
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


On Tue, Feb 18, 2025, at 17:01, Harshit Mogalapalli wrote:
> Hi,
>
> On 18/02/25 21:04, Sven Peter wrote:
>> Hi,
>> 
>> 
>> On Wed, Feb 12, 2025, at 09:58, Harshit Mogalapalli wrote:
>>> This code calls kfree(bfr); and then passes "bfr" to rtk->ops->crashed()
>>> which is a use after free.  The ->crashed function pointer is implemented
>>> by apple_nvme_rtkit_crashed() and it doesn't use the "bfr" pointer so
>>> this doesn't cause a problem.  But it still looks sketchy as can be.
>>>
>>> Fix this by moving kfree() after the last usage of bfr.
>>>
>>> Fixes: c559645f343a ("soc: apple: rtkit: Pass the crashlog to the
>>> crashed() callback")
>> 
>> This commit isn't upstream yet afaict, did you mean to post a review comment
>> to [1] instead?
>> 
>
> I made the patch based on linux-next, linux-next has the patch merged.

Whoops, I guess we accidentally already pushed that one to for-next without merging it.
I'll merge both and adjust the commit hash in your Fixes tag.


Thanks,


Sven


