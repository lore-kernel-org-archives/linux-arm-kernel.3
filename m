Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE10C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 03:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXy2sRf3UPjdIHWylaXPiQGMJd9HqpbGIqCOgYXTgM0=; b=VFMD+gbYLIGjLxD+o4JA6icEml
	AnTAddQRpK/V8HUtgs/1dhccn491hiN+8KYTNjV+U+UlZW8nXYKAQ/lxhCYTR8+10g1zXAmUmla2O
	qZZlvfc4knQjM9cMtQ9w509BgWuVzhdSLGDb1wxVM3j3lRipr/8iHKPSz6fVZxlSsQhWD4i0fjo16
	ySFrsculz8CaDIbwK2Uw81fMHWT66fZgoll4i/4FNIbtkh0FF4Ug41q+1eDOGBYiIlz0gOCsMEGN5
	ljl+Nka+yds0Fc0/OhGFr0VVbxZStg5XdHUMlO8fYOhCQm21XLC4um1Nmrr3n7F3FlS0gNz1zOmEt
	TGgA7c/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOhi-00000002Ens-30mH;
	Tue, 29 Sep 2026 03:40:30 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOhg-00000002Emx-1Da4;
	Tue, 29 Sep 2026 03:40:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790653222; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=qXy2sRf3UPjdIHWylaXPiQGMJd9HqpbGIqCOgYXTgM0=;
	b=O7E1oVIvEdiPqu+At1cihpzIAXw1IjdBeKSW9MU2ZDEcRHa7BHHO4pmx9xeWtHvalpgQOUnqSOPpaFnpYWrAEmw8rJl1ReUy//YI1WL/J/N8sRXHyBmPsqqGy5POcQPjGjkfTJjty4lTUhmw/D92x1cN3vcm3lxyFYwpmkUvEko=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XBrsUfB_1790653212;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XBrsUfB_1790653212 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 29 Sep 2026 11:40:21 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: Leo Yan <leo.yan@arm.com>
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
Date: Tue, 29 Sep 2026 11:40:11 +0800
Message-ID: <20260929034013.2110-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928163442.GG14479@e132581.arm.com>
References: <20260928094739.2605-1-cp0613@linux.alibaba.com> <20260928094739.2605-3-cp0613@linux.alibaba.com> <20260928163442.GG14479@e132581.arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_204028_654034_9A9F250B 
X-CRM114-Status: UNSURE (   8.40  )
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

Hi Leo,

Thanks a lot for the review.

> Just a bit on refactoring. You could refer to the implementation of
> PERF_HAVE_JITDUMP in arch Makefile and "CFLAGS += -DHAVE_JITDUMP" and
> do similiar thing for rdtsc.
>
> Seems to me, we can just use build system for configurations.

Makes sense, I'll change it that way in v2, thanks for pointing at the
existing pattern.

Best regards,
Pei

