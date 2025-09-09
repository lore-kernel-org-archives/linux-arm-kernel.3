Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AC9CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 18:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GoWaMGtmO7GtecByd9ScLgw4xQtIu7jVJCDLaaAkc9M=; b=Q/4KtRRW8MIRfdhZ7nQg6NIRYg
	REXpVncgeHc0e/oLvI2SvRzNNXHy3G9tus1kLkn5GkjOZ7YIBXIRxfBEiWlPz5X9pO+kDcJ5hzdzT
	4i6NN49isR2l24P6wNXKlCpOUSa1HM4AxD3B4RyldwI8l7SrhRsLoaMOMV4skLzT7zZV6Gm+DVLZL
	cgdIeIveMbbJTjafS5fCV725PbanfB5esVrAX23Vp7DQhFW7wpYLqFcTv70tQAmxS0nmIFVWaL5Os
	rX5h3SFyl8K/a4roUKPuBgzrgMli5dHXZK0H8B4K4g2yyi7t9UeyFb2Syky7L24qJCkY0B4ypkWfz
	VLA0wKvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw2vW-00000009MzZ-2tPh;
	Tue, 09 Sep 2025 18:18:46 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw2vU-00000009Mxk-29eO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 18:18:45 +0000
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 1A429C06B6;
	Tue,  9 Sep 2025 18:18:40 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id B1F662F;
	Tue,  9 Sep 2025 18:18:36 +0000 (UTC)
Date: Tue, 9 Sep 2025 14:19:24 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 03/24] tracing: Introduce trace remotes
Message-ID: <20250909141924.2f17f1a5@gandalf.local.home>
In-Reply-To: <aMBRaPzjR4OJVIWn@google.com>
References: <20250821081412.1008261-1-vdonnefort@google.com>
	<20250821081412.1008261-4-vdonnefort@google.com>
	<20250908193606.47143d09@gandalf.local.home>
	<aMAYvA9LSvfxvt_C@google.com>
	<20250909093848.402674b7@gandalf.local.home>
	<aMBRaPzjR4OJVIWn@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: eqc7w7y8zn6us7jyigopqwf3nc7ynjtf
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: B1F662F
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+42t01sKe6NN3Yv3aPETwZq7DQof3HuwQ=
X-HE-Tag: 1757441916-886505
X-HE-Meta: U2FsdGVkX1/FkbATY5c/bszCpTxcE2Cn42lYpIlf0+M2DnBLkDpeiDnFpxC7EnRVRWD7bBFR2LjqPKnXdu1P9EKDSXtR8hvE7QrEkuS23WAKU0+q8dSKFLWS6N09CoZuqDFBzUC6JBO9+ehpwvzhwv+MRRoJKAOqD2hA/RvOMNI9mPvrU7rSjtczYd0M1o8dnaq3smAVl3E7hIw6B9IvF8IaP8iFSh5u5E8Q6yYK9zKMSBT2wxyFEpcqxQl9a5pBntG8IUIljfZxm8tIcO54NkMEyojXNkhab20elYHd/QR1soOKOMhADArVAJrmA2hitNlYDnbzyXFuq6lpHdLW75t+Br0U3Akn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_111844_612004_81F6AA0B 
X-CRM114-Status: GOOD (  16.20  )
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

On Tue, 9 Sep 2025 17:10:16 +0100
Vincent Donnefort <vdonnefort@google.com> wrote:


> > I'm more worried about the allocation not being big enough for the rb_desc
> > being filled. I just noticed that the trace_remote_register() function is
> > missing a kerneldoc header. Please add one and specify what the parameters
> > are for as well as their requirements.
> > 
> > It's fine to state that the allocation of desc must match what the cpumask
> > is. But the lack of comments about what the function does and what is
> > expected of the parameters makes it hard to know if it is performing
> > properly.  
> 
> Ok, will do!
> 
> I could also add a desc_size parameter to make sure we won't overflow the given
> desc?

I wonder if we should just to make sure things are checked. Having a
bitmask determine the size is kinda strange.

-- Steve


