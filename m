Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313631077603
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 18:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7Gfrplkeunsw+GsTWk5N+XVZ5xF7WM6YrQ9z11Ft9M=; b=BtjAZbc+sLG9PsL3HrEUh0OOHH
	T2XSUZSnxHkPCdYXKn9IjDoRqwHUnCo7BGzwTUjM6ap+c28hDJhrdL5aD79AWIkpL50oNCWHpO0ez
	LC9YT8en3/VITqxjYOYx19OeZB2my0HotK57j5RBhQNH3nuRJoMh6zoHq93A3DSdPUwjFNBucyDJ2
	wIW6qQFTs+7TOZwdwld4KblbHOG52p1QlyLfSF/kcdw66xNouG4a3hpm2xsgNYykqwvp3Z1nfA7U1
	gCXrCSV0w1O4FSkj4NPn7o9Wz7VkI2NdqiapDnOHJRw/bjeiLkjnvGjjSvga2a7koUCc6qbJcYEUa
	sVwDex2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vtU-00000009BVA-2tbX;
	Wed, 18 Mar 2026 18:45:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vtS-00000009BUc-34P7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 18:45:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7BFFB4165B;
	Wed, 18 Mar 2026 18:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DFDC2BC9E;
	Wed, 18 Mar 2026 18:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773859521;
	bh=himTCW9DpnMPSH4C7lM9gVIRHLaru/ofni7RbptCs6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bWjG0NsazqSaSfHrUH2YnU0E8lvVrCs+0CnlrGP+KB7XzbAU0dfRQH8YWEBCBq7oI
	 E1+g6s8ANVf6XZl6zAWHWQXVt3mzN90mgNZrhwPmkSzWfvy6DaCZMZEglNuCc+k8DQ
	 PxKKvqJBEvjYgA8oAwsEHNH3tb+FK/8i7Ipm61AL88hiIg99K4NGt7r6A0JHqiDNun
	 9VJsuKoWBg+wx92ez2JpUAGzgraDHJIXh+PrKjezo2Xah9ce3ENpmOl9VB8XiotVUX
	 Q/bF8hDYvS6IyPtgt5Xlm2TuqDme8W3Al6yhTkcVsofmOfJAq9JmcSJrzERWU/8W0F
	 uv9MzPOw6EdtA==
Date: Wed, 18 Mar 2026 11:45:19 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
	linux-kernel@vger.kernel.org, leo.yan@linaro.org,
	peterz@infradead.org, mingo@redhat.com, will@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@redhat.com
Subject: Re: [PATCH 2/2] perf: tools: cs-etm: Enhance raw Coresight trace
 debug display
Message-ID: <abryv7FhSguOq929@google.com>
References: <20260313132129.2743468-1-mike.leach@arm.com>
 <20260313132129.2743468-3-mike.leach@arm.com>
 <20260313144518.GN4153946@e132581.arm.com>
 <abqg-uKHqobUTn3n@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <abqg-uKHqobUTn3n@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_114522_791144_040A9387 
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

Hello,

On Wed, Mar 18, 2026 at 09:56:26AM -0300, Arnaldo Carvalho de Melo wrote:
> On Fri, Mar 13, 2026 at 02:45:18PM +0000, Leo Yan wrote:
> > LGTM and I tested it:
> 
> > Tested-by: Leo Yan <leo.yan@arm.com>
> 
> I think this is perf-tools-next material, Namhyung, please pick this
> one.

Sure, will pick up v2.

Thanks,
Namhyung

> 
> Acked-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> 
> Ah, BTW, this one I picked up by perusing the https://sashiko.dev list
> of reviewed patches that were CCed to linux-perf-users:
> 
> https://sashiko.dev/#/?list=org.kernel.vger.linux-perf-users
> 
> Thanks,
> 
> - Arnaldo

