Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADA7D7832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KTK1Ae8Hx5JwKBP6HH+e0KYk+oHKH1vKMjWWBX9x5i4=; b=N6etvJKl4dv5t0k73b5CawXhsf
	LgrRCsUWcV+HAhljzxJG7nAfVrxPTl8nX30SvKueuHd/RhyzHhV9g1D5yFwNcfrIG2Mm3rD+FYOIL
	vFwwULlV2tRyBaEZ4w/SQ3cuK/Jig2cFBoAxzf5u3rSpUCz1TgXEOy5AvxaT+ppagy/FyQgJvrcQm
	XIZiVcxCf09bRbc3lK6WEIkKS7pYxPCp5NhungyAFSbcA9c8HDwjpqGMPl2N2sS7VVD1JQ3PDPKpj
	9kS+oq4lRa0SpQQKiIBb3KYZHFHnoAai+WkSENf1fbEXLQybjNLko66NLyDj5HUQnGkHE0idtqomV
	w3EE5c6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8Vj-00000006gLr-1AZ3;
	Mon, 02 Dec 2024 15:38:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8Ui-00000006gAj-3djC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:37:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 09E505C621A;
	Mon,  2 Dec 2024 15:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5688AC4CED9;
	Mon,  2 Dec 2024 15:37:50 +0000 (UTC)
Date: Mon, 2 Dec 2024 10:38:53 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Yeo Reum Yun <YeoReum.Yun@arm.com>
Cc: Suzuki Poulose <Suzuki.Poulose@arm.com>, "mike.leach@linaro.org"
 <mike.leach@linaro.org>, "james.clark@linaro.org" <james.clark@linaro.org>,
 "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
 "bigeasy@linutronix.de" <bigeasy@linutronix.de>, "clrkwllms@kernel.org"
 <clrkwllms@kernel.org>, "coresight@lists.linaro.org"
 <coresight@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-rt-devel@lists.linux.dev"
 <linux-rt-devel@lists.linux.dev>, nd <nd@arm.com>
Subject: Re: [PATCH 1/9] coresight: change coresight_device lock type to
 raw_spinlock_t
Message-ID: <20241202103853.26db0c13@gandalf.local.home>
In-Reply-To: <GV1PR08MB10521520ABD7B72D92FD60DE9FB292@GV1PR08MB10521.eurprd08.prod.outlook.com>
References: <20241125094816.365472-1-yeoreum.yun@arm.com>
	<20241125094816.365472-2-yeoreum.yun@arm.com>
	<20241127120954.0facd34f@gandalf.local.home>
	<GV1PR08MB10521520ABD7B72D92FD60DE9FB292@GV1PR08MB10521.eurprd08.prod.outlook.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_073752_953370_2CF88B30 
X-CRM114-Status: GOOD (  19.01  )
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

On Thu, 28 Nov 2024 07:39:22 +0000
Yeo Reum Yun <YeoReum.Yun@arm.com> wrote:

> Hi Steven,
> 
> > We should start documenting what is not real-time "safe". That is, if this
> > code is executed, we have a loop here that holds a raw spin lock. This
> > appears to make the time the raw spin lock held to be non deterministic.
> > 
> > If someone is running PREEMPT_RT and expects deterministic behavior, they
> > cannot be using this code. That is fine, but we should probably create a
> > document somewhere that notes this.
> >
> > -- Steve  
> 
> I think it's quite deterministic becase the number of loop currently
> determined by the number of preload_feats.
> 
> Also, I don't think the number of  feats will be loaded as much as
> it can do undeterministic behavior since 
> the number is not many and it is quite predictable.

Still should be documented somewhere. It should describe the maximum number
of feats that will ever be loaded. If there's a max, it makes it back to
O(1). With a 'k' of how long it takes to process the max number of feats.

-- Steve


