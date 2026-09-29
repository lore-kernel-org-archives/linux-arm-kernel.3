Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7984CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 09:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFQ4vreHXDUaO3HsKcHYviwry83Esj7w8plbIxQJJDY=; b=PLuBRjOISLfdjkxJBGo4tl9p0P
	tG0Z3neSYMoYbmMAx02PiWDXZ+l4JiiCg2t+BPbzNtSWZb+vttNSFTkojLBNxYCUtQr4TULEZkAWL
	KsaqbHiy3GO2JjCYOpfvpHTHhPppoH3T4mmLYYUWOm3pNU3Pj5qzJTYxpDArSlRicrp455OMSdBP2
	owb5tULqrTslEGatFOb3+hPdCbmBmb9j84buDQwCSv2jNPMeSnFk0QBe+caw1W6LDSpPpyfv4/Y0O
	fqdfYEtuUOJg5qGSIELY1fEWRIBVVTlcMm2HNQNVfxjTmACziKR6NHeBOKIYsbZQ3BqzPTb9YYdO6
	vkhYBG5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTp7-00000002vhN-3GUx;
	Tue, 29 Sep 2026 09:08:29 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTp5-00000002vgd-09i4;
	Tue, 29 Sep 2026 09:08:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790672904; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=eFQ4vreHXDUaO3HsKcHYviwry83Esj7w8plbIxQJJDY=;
	b=ez42vH7S94t6cXtoSNdBuRyQlyxr+GU8OoXtEq0RIB/ksRC05exGLaKCVkm+Si/Q4cSProTZYPv90l6OLMejpcIScx093dIvXKBocoDritZrdxZU4OKPMEnB87sTUnpALpmmm9RnB/0y7oCSs+wR6JI0kZKTg9ntGGXNn1+xWpA=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R321e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0XBsgidE_1790672898;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XBsgidE_1790672898 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 29 Sep 2026 17:08:22 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: acme@kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	leo.yan@linux.dev,
	john.g.garry@oracle.com,
	will@kernel.org,
	mike.leach@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	guoren@kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] perf tsc: Replace the compile-time TSC support check with a weak hook
Date: Tue, 29 Sep 2026 17:08:13 +0800
Message-ID: <20260929090818.2651-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929092850.697bce16@pumpkin>
References: <20260928094739.2605-1-cp0613@linux.alibaba.com> <20260928094739.2605-3-cp0613@linux.alibaba.com> <20260929092850.697bce16@pumpkin>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_020827_663549_577BB88D 
X-CRM114-Status: GOOD (  11.53  )
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

Hi David,

Thanks a lot for the review.

> If you mark the prototype in the .h file "weak" you don't need a default
> - instead check the symbol for being NULL.
>
> Then you can do:
> 	if (!rdtsc)  {
> 		pr_debug("Test not supported on this architecture\n");
> 		return TEST_SKIP;
> 	}

I've just sent v2, which declares the support from the build system
instead, following the existing PERF_HAVE_JITDUMP pattern, so the
decision is made at compile time and there is no symbol left to test for
NULL.

Keeping the __weak rdtsc() stub also means the callers that already call
it unconditionally don't have to grow a NULL check.

Thanks again for the suggestion.

Best regards,
Pei

