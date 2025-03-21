Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A58AC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 07:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5R65J2g0FNgw1XSWKz2USfjnrYTMfGdQgrNz7k86SSg=; b=x5azF/NcpWUF0xzQ8H3yd86H8J
	+LyfrohsGq/WzFdmOQlrlE3VCtc6Ly6nU3fBQdf9IIW6+WzxIrmWwbUK440DIPoJFHOMscJSLbuiD
	jmyx0gBXvvnd0Lo2h4YbpHGF/Pn0kz9h9XRaNpfJzvdWA+H+vzPXg53X2/9HBp6VlALnhSRgZ5pN0
	BckpH/RmvRYSN/yF1CpHUqGdtTYbTWpBrBCS/ke238W/tvtXckMzPL1LwQnfKkkLlwoql4dXsXS3O
	9PLA2mwDO19M0Z3ZbfA3tzMRR/igI415O8it+7UjZPmj3ijixxMzOtT4qp/9JhQyKjeE3VXG5ykOf
	HlujF2kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWZc-0000000E4S1-0Qx0;
	Fri, 21 Mar 2025 07:13:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWXv-0000000E4Ka-2sMs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 07:12:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4A6CCA490D1;
	Fri, 21 Mar 2025 07:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D46C4CEE8;
	Fri, 21 Mar 2025 07:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742541118;
	bh=LudmvTxSdtMKoCGghxA/xCu1HALOjr3FVanGtdDN6VI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nX+OR3/JMJ4fn3FGm4PDb/rQ03GQ7tdgCyI6MNpkteWlE7XFsBOTnIJeTVaDbOEqJ
	 YwG3lhJVKBJxuLJNwbUoKQejA2nNXR5tYKo3Ym3aQP/TWAOM9FuU1BTVL0gORaGR0i
	 S9azE0cUwgubeLAXXdGmyBglyuIotoKDx4mCVyewudX8iVHqUpMrwRJm666DUZxbSA
	 50tKZY84fUuvQCs4s8/Xjd1fxjhlFvoJKB0ng8+G1KmyT3hAyn/RTKegJOcdmNdgjR
	 xYbQSInOJpfmm8+YuDDqwLucXYea+eG03AUghYbeHnxL9n/LKtJw7dh+hes02Q+Qz/
	 AqpXvIRsEbkvw==
Date: Fri, 21 Mar 2025 00:11:55 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Song Liu <song@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org, indu.bhagat@oracle.com, 
	puranjay@kernel.org, wnliu@google.com, irogers@google.com, joe.lawrence@redhat.com, 
	mark.rutland@arm.com, peterz@infradead.org, roman.gushchin@linux.dev, 
	rostedt@goodmis.org, will@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3 1/2] arm64: Implement arch_stack_walk_reliable
Message-ID: <etrj2xdtc6djnwtwlghymlu4c3gg5wnyg3qqfdiod4g6hjgzzi@yxj6no3stqjv>
References: <20250320171559.3423224-1-song@kernel.org>
 <20250320171559.3423224-2-song@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250320171559.3423224-2-song@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_001159_780783_5D77703D 
X-CRM114-Status: UNSURE (   7.45  )
X-CRM114-Notice: Please train this message.
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

On Thu, Mar 20, 2025 at 10:15:58AM -0700, Song Liu wrote:
> With proper exception boundary detection, it is possible to implment
> arch_stack_walk_reliable without sframe.
> 
> Note that, arch_stack_walk_reliable does not guarantee getting reliable
> stack in all scenarios. Instead, it can reliably detect when the stack
> trace is not reliable, which is enough to provide reliable livepatching.
> 
> Signed-off-by: Song Liu <song@kernel.org>

Reviewed-by: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
Josh

