Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9153DC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 17:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCfA58bDdkxPvUJXh8ZLwW18ZiXODFVt6T9NuPneZV0=; b=uH65gY8jibd5dB0r7Uhcp4lpow
	u14p81rDw/PzlINzzuwg/BzsQzEezD4PFsIREaYypOWaAoCsJmvspKmu4SLbZdUPnFZFxcpycy6kp
	NOAvcvHhpnjZZZnBMdgLXDbg6ONhSbk2DvatoS6cKkvUOgWlDmRGPvVFzzQ3pzCyi6zu2zZUIGwm8
	Jr/Ogx+m/fofkCrOQlLuTO32fQ1wLvwb7DrIHEfSDE2SY0D9adIc3ZHDGvNDcETVQ2mrbkTGW00Ut
	fYQfE+UX46XyjQ0lXjXgKiGvLqYp72ain+Gbea8fToBPpwBMrLvYIACnOyREyV3wKysYW91jrMAod
	1QqZRmUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQLm-0000000DdAD-3033;
	Tue, 20 May 2025 17:01:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQJc-0000000Dcr7-2yto
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 16:59:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AE981516;
	Tue, 20 May 2025 09:59:28 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC1F23F5A1;
	Tue, 20 May 2025 09:59:39 -0700 (PDT)
Date: Tue, 20 May 2025 17:59:32 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Song Liu <song@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org,
	live-patching@vger.kernel.org, indu.bhagat@oracle.com,
	puranjay@kernel.org, wnliu@google.com, irogers@google.com,
	joe.lawrence@redhat.com, jpoimboe@kernel.org, peterz@infradead.org,
	roman.gushchin@linux.dev, rostedt@goodmis.org, kernel-team@meta.com
Subject: Re: [PATCH v3 1/2] arm64: Implement arch_stack_walk_reliable
Message-ID: <aCy09N8TwP1wEN-X@J2N7QTR9R3>
References: <20250320171559.3423224-1-song@kernel.org>
 <20250320171559.3423224-2-song@kernel.org>
 <aCs08i3u9C9MWy4M@J2N7QTR9R3>
 <20250520142845.GA18846@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520142845.GA18846@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_095944_790661_010BE6B0 
X-CRM114-Status: GOOD (  11.37  )
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

On Tue, May 20, 2025 at 03:28:45PM +0100, Will Deacon wrote:
> On Mon, May 19, 2025 at 02:41:06PM +0100, Mark Rutland wrote:
> > I've pushed a arm64/stacktrace-updates branch [1] with fixups for those
> > as two separate commits atop this one. If that looks good to you I
> > suggest we post that as a series and ask Will and Catalin to take that
> > as-is.
> 
> Yes, please post those to the list for review.

Sure; I'm just prepping that now...

Mark.

