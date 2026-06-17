Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB4CCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 11:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcBIvnIE/g5EcJrZxW2ze7Q0xQHoWl7xN2Q+k05HnXs=; b=WMKr6eJCAgASJzzVTpm7GM2sMU
	u5csswkUoKRKHalGBdj/uOfSKuAEil2ZkTw7278YxQMEnAy8CTMbh7HjzPWqlaX+DsdvBiZyqJPzD
	KoEPe/NKTtQPuaOECMy2v7Rn3FQXSkpY97WsPi548GrFRmuiTvqyCtguIcF7Q34YK7uKTgSGb0xkJ
	k8TPTA6saz0xJDSxsO6kdf7MKbanZLtn995RnlXfvVmhkGI5V+I/96l5/e3RFZW4dvYUmoWzZAfIn
	CypzhX/vNyH9d/IAAXGwxALgLmb037TQclgRGKRGcNjRWOOGGiBzQviIgqWBxAMq+iJSRteaQhP/Y
	zI3MY3Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZoBY-0000000HD9n-2A7h;
	Wed, 17 Jun 2026 11:11:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZoBV-0000000HD9Q-45al
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 11:11:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 013972D97;
	Wed, 17 Jun 2026 04:11:47 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C4413F915;
	Wed, 17 Jun 2026 04:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781694711; bh=sV4JLlxysKqqLtfS+lU5GOlCV5cwun57z/a79Z97I9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fuz4zdPNdxaOaJJpgqLpgcyPxV6sWHE6vOdrGxcupMpy0DOg1Jty4hUHezyjcYd99
	 OGRLPz+mcBNKf5m0TajaNyE9SzRF/jre8UiRkNC9RiWLAFnnOSZBegyrXG5ziPJPcV
	 vuDlW/iS6Kmh6H8p45y57XbC/MNA1JiQmwfyr3+Y=
Date: Wed, 17 Jun 2026 12:11:49 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
	linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Al Grant <al.grant@arm.com>,
	Paschalis Mpeis <paschalis.mpeis@arm.com>,
	Amir Ayupov <aaupov@fb.com>
Subject: Re: [PATCH v9 9/9] perf test: Add Arm CoreSight callchain test
Message-ID: <20260617111149.GC31870@e132581.arm.com>
References: <20260616-b4-arm_cs_callchain_support_v1-v9-0-f8fad931c413@arm.com>
 <20260616-b4-arm_cs_callchain_support_v1-v9-9-f8fad931c413@arm.com>
 <00183ce3-e387-4ca3-9eb8-67aa6a1221e5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00183ce3-e387-4ca3-9eb8-67aa6a1221e5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_041154_147257_97DA5D2B 
X-CRM114-Status: GOOD (  12.23  )
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

On Wed, Jun 17, 2026 at 09:38:42AM +0100, James Clark wrote:

[...]

> > +noinline void callchain_do_syscall(void)
> > +{
> > +	syscall(SYS_getpid);
> 
> I get this error when compiling for x86, but it works on Arm:
> 
> tests/workloads/callchain.c:17:10: error: use of undeclared identifier
> 'SYS_getpid'; did you mean '__getpgid'?
>         syscall(SYS_getpid);
>                 ^~~~~~~~~~
>                 __getpgid
> /usr/include/unistd.h:659:16: note: '__getpgid' declared here
> extern __pid_t __getpgid (__pid_t __pid) __THROW;

Thanks for finding this.

This is not the issue for program itself actually, it contains
tools/arch/x86/include/uapi/asm/unistd_64.h rather than uAPI headers
provided in toolchain or kernel.

At current stage, we can simply change to syscall(SYS_gettid) to
workaround the issue.

