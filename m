Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2435BC021B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 18:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLv+p1BA+5rZo4oUi+F3AFP3VuFrWmoWPURZ4a85iVs=; b=FQT3B379rJPaJ+2TXciALlalcb
	xJwZ8imeQCQUgRD9mJlG94F1M8+rZ6ZGGs58Jw9cu0q0VXYS6PKwRy5QXPD5j+ZM253Z+CnxyRzCA
	rmbeN3/Dh9Aym5tDFu4yHv6qZ4zfLOZTf5D0PotA1xLbG6M/DQLjaPB+Qh+MvZ4mp4XQdjfzmgJ5Q
	u+p7kUEfFPuF7ZSPxSjCZ04rWxH7U+CPhlb+oN7DMsH6v44yWK9lIX+2Qjgpz8J58cVGjdlbusHxV
	GKCGOJkicZSvPl8QlxwI0bfyr0UZE3ky932hXCg+TN4D+9wwR1pZegRnoDkRS1Dhk1R5LRHehzJC0
	XoqCaunQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBM1-00000002O7i-39ck;
	Thu, 20 Feb 2025 18:32:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBFW-00000002MCp-3BUs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 18:26:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 88CA661638;
	Thu, 20 Feb 2025 18:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 739D6C4CED1;
	Thu, 20 Feb 2025 18:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740075974;
	bh=fF4NKFqp3EuYjj6or+U2IeqKQJgw+vQ+u4MMJj32JQE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=euOOVVtLqPzlw1UQDh/Wx8fAHZxaeMSnHXPcyiN63ND+appVtRtsRdh/4dzsyELwy
	 JnZ/5+X+xLs7k4HXvt3GWmzn4gDoSeyWZNIAi0cbXRT3sPBdFs17ByTl4dwvuruJ5h
	 ekI7lBWOHd18nUbOJDl1sbhhIw2ht9LcP9dgKOJEGZkXHvlqjJaW+xJRvm0NW2mKPl
	 jOeCgnTZt9+Hm6aeIQ+MWA1H2IKbfw5rbqBMYjW3oomUdmqhf0GDGE1Ds6vfjXdWfe
	 jUr9IONXB9a6euNjjpf4JfB75tmVJgtom0TJaQDzz1RvYI7uQGVHcWxsF3mrRemavh
	 u/wxt+y46fHzQ==
From: Namhyung Kim <namhyung@kernel.org>
To: linux-perf-users@vger.kernel.org, james.clark@linaro.org, 
 irogers@google.com, Yangyu Chen <cyy@cyyself.name>
Cc: acme@kernel.org, adrian.hunter@intel.com, 
 alexander.shishkin@linux.intel.com, fj3333bs@aa.jp.fujitsu.com, 
 fj5100bi@fujitsu.com, john.g.garry@oracle.com, jolsa@kernel.org, 
 kan.liang@linux.intel.com, leo.yan@linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 mark.rutland@arm.com, mike.leach@linaro.org, mingo@redhat.com, 
 peterz@infradead.org, will@kernel.org
In-Reply-To: <tencent_D4ED18476ADCE818E31084C60E3E72C14907@qq.com>
References: <tencent_D4ED18476ADCE818E31084C60E3E72C14907@qq.com>
Subject: Re: [PATCH] perf vendor events arm64: Fix incorrect CPU_CYCLE in
 metrics expr
Message-Id: <174007597343.1790567.6925222970795406098.b4-ty@kernel.org>
Date: Thu, 20 Feb 2025 10:26:13 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_102614_887132_37302D64 
X-CRM114-Status: UNSURE (   9.24  )
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

On Thu, 13 Feb 2025 16:44:09 +0800, Yangyu Chen wrote:
> Some existing metrics for Neoverse N3 and V3 expressions use CPU_CYCLE
> to represent the number of cycles, but this is incorrect. The correct
> event to use is CPU_CYCLES.
> 
> I encountered this issue while working on a patch to add pmu events for
> Cortex A720 and A520 by reusing the existing patch for Neoverse N3 and
> V3 by James Clark [1] and my check script [2] reported this issue.
> 
> [...]
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



