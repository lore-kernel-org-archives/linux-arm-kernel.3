Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20FAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 08:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYfz3yK4K1w/gZCorZwFlDEP2G0pWQDxsFdogEGaHWk=; b=kxghTWfBrPlRAgFANhjHzrlt9r
	3fhiZUPXCOaXKSqYJ7Be7JfpuMhQ9xIJi3FZBE7MFXK5CFkhbYpHf/uSTae3Lv39v5toeybALW0lF
	3DjOdFmweArZPE5L+gJ7qdTH2GE/Ch2/BbVPdDc5Cj8FIVOk5XY+xzYl0B2pCGQbrNBcwThoZ+4KK
	kOZkt8mTqsOkVIpsiKYyjlk+rynVjdizEqwmG4dRP1elKHMrdVPMdWUT62gHao/aHZcXrH5ZJC2My
	JajQPxnsn5CuyxsqtOTEpuF+Qf9c7D5xIXA6MaJICbRN0mbsA33zthj2jupDdFPNlPgGM7uzHr+Oy
	nQNzzxiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTkS-0000000GG98-2QZw;
	Tue, 30 Jun 2026 08:23:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTkQ-0000000GG8G-1A4K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 08:23:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0BCF22D9;
	Tue, 30 Jun 2026 01:23:08 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E46943F905;
	Tue, 30 Jun 2026 01:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782807793; bh=O032AETtd2QRdz8mAj4/zj+sMhndZd08wJhinDFxnVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a16LguaA70TV8S9pystkxlAS5iZpyVaTSV4nZx2qtSr4E3LT2Jn416WOEQsNVZrNC
	 eH1ocv+EpYiZGaxmGvoqM6TlXX6h+zbqJ20PbMMLdB988oU4JBbTNQxQZ/9huY7knP
	 2J9KLCb273d6n1N2JIyWtU5op0aqo/fxKz8U5DZo=
Date: Tue, 30 Jun 2026 09:23:10 +0100
From: Leo Yan <leo.yan@arm.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Al Grant <al.grant@arm.com>,
	Paschalis Mpeis <paschalis.mpeis@arm.com>,
	Amir Ayupov <aaupov@fb.com>, linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org, linux-perf-users@vger.kernel.org,
	Leo Yan <leo.yan@linux.dev>
Subject: Re: [PATCH v10 0/9] perf cs-etm: Support thread stack and callchain
Message-ID: <20260630082310.GE1812158@e132581.arm.com>
References: <20260617-b4-arm_cs_callchain_support_v1-v10-0-e8b6e5d63db5@arm.com>
 <akMPoLNBbAEyNU64@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akMPoLNBbAEyNU64@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_012314_356680_E797F060 
X-CRM114-Status: GOOD (  10.23  )
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

Hi Namhyung,

On Mon, Jun 29, 2026 at 05:36:48PM -0700, Namhyung Kim wrote:

[...]

> Will you send a new version or want to merge this?  It seems there are
> some remaining comments from Sashiko.

I prefer to merge this series.

Sashiko reported several critical issues in the common code, they are on
my to-do list.

Thanks,
Leo

