Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D83C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 16:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gqtoaveW3tqdtaQS0Vi7cwFNhmu0Lytm/je7MHxV/JA=; b=jAKwJq4uSFhQrwOCLt3NVXyrfq
	y0r39C78I21vjo2FrIbkDGCPqHlNYnfQl1ssAzXIUekioJY1EwdrEdrGO3YH5p90hdTRyXlR68mlc
	L+XHZKRcm2oIE99gohOlLuLPmfJ+se74S5D3OCa3taw46bBj9HS/pcnU5hlPCKmRqTxiaTh0V1CmM
	h5M3vrhnp4/4IYb47jF3KkNIfCTHXm3ThNAb5FgEP46cZIAGbIxnSD6Q1VcJ85sIGua6DE5ClKOm1
	5S7qyzSZgL2/Y4ukF7qViAq87OfXhl7hnb/tkSvANZur5B/NjB5uKANyypNjZSGfoLpssIG2L9v0V
	CeBNrJ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvINo-0000000CdRD-1o7N;
	Thu, 20 Mar 2025 16:04:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvIK3-0000000CbIH-1N8d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 16:00:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96DB85C6BDC;
	Thu, 20 Mar 2025 15:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD052C4CEEF;
	Thu, 20 Mar 2025 16:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742486442;
	bh=4jMeTtmBaorbabAAMf8Jl20J3QEuUuQqaOeS/cfvbVE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=bKgqTLseJXr5xwhHH7jTr31YoA+ZRf0Oud2KDRzsCc8LZoXonIx+HmEMC4z2vHL1p
	 dcjIPnRt30XzJfzKx6q/FcqyH2jYP8cXSseJykxuRKisM4lv2VkNPxgpV3x2ctKgAI
	 x+5rw0urbnK88dXu5ogeDMpO99Y/tDWZz4t9o5y4nhViZzU/ttCcYo2IRmi9bXAnLQ
	 q4Xl+0NgEe13b8DD+wnw60FhJNGHfbDT8P7gbNxQaEp9vEdJ5rSOZIr5iLCcBXlM90
	 4z7xHv+COCeUQ+4oAylIB5m+APtsFEfY4cPDiVn52Px0cJTQQKjPYVKcYstLgXHB/6
	 ul8FkfNcRAsEQ==
From: Namhyung Kim <namhyung@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Kan Liang <kan.liang@linux.intel.com>, Howard Chu <howardchu95@gmail.com>, 
 Levi Yun <yeoreum.yun@arm.com>, 
 "Dr. David Alan Gilbert" <linux@treblig.org>, 
 Thomas Falcon <thomas.falcon@intel.com>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
In-Reply-To: <20250318171914.145616-1-irogers@google.com>
References: <20250318171914.145616-1-irogers@google.com>
Subject: Re: [PATCH v1] perf cpumap: Increment reference count for online
 cpumap
Message-Id: <174248644166.3704425.11921703615469719002.b4-ty@kernel.org>
Date: Thu, 20 Mar 2025 09:00:41 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_090043_431402_2100238C 
X-CRM114-Status: UNSURE (   8.47  )
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

On Tue, 18 Mar 2025 10:19:14 -0700, Ian Rogers wrote:
> Thomas Richter <tmricht@linux.ibm.com> reported a double put on the
> cpumap for the placeholder core PMU:
> https://lore.kernel.org/lkml/20250318095132.1502654-3-tmricht@linux.ibm.com/
> Requiring the caller to get the cpumap is not how these things are
> usually done, switch cpu_map__online to do the get and then fix up any
> use cases where a put is needed.
> 
> [...]
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



