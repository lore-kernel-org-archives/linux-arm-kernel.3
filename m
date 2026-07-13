Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16C6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 17:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=jt6It+v7z+tXpx1Z7OeXNKteySBBPvQKPn1/Qt4r5FU=; b=FeQu+12ZgcAUaU
	6Rt6Z7w4IFcXxOGFgDkGpV7sYO1R0xapsUghiZNH+3Z+i+PPJajcT1xUXH+PuMXCY2WY4ZBwSWQLG
	TFDR1LmsK6MgmQFENuUapZTHxAKm5IBbhoQl170JAoVw1toB710V6DPKj8Ef3i2xiag5UE1B4v+o3
	1pKT7vPX1/EAaDB6wi3EA0qyNHIBpuEnC6ANXpL2IoWbfTwGBIHGA3PMHXSdmmUXfxXq9MNHCC0Jv
	HfXC7i7dt1WRonB/EyGeNmusFtt8jdYX4F74IgiGzkUu2HK5328bnys21N5MTuw6pqqp2AgLIGGru
	8cUUS+ck+CbVLuDrrykQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKmx-0000000A95k-02uG;
	Mon, 13 Jul 2026 17:49:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKmv-0000000A95d-3pgi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 17:49:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 67200408DF;
	Mon, 13 Jul 2026 17:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1B21F000E9;
	Mon, 13 Jul 2026 17:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783964993;
	bh=jt6It+v7z+tXpx1Z7OeXNKteySBBPvQKPn1/Qt4r5FU=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=C9Dv8C/lGyayTy+Fug0LPOFQy2hccYVCmLvkAyaF7kCWiT3G/CPG6Gze7vr0WUMEw
	 WNDwfh+7VsCHWtFQ40w3Gixzo21G/Z1pFarQ5zBBFegCOpDsmYOGbPw3r6SKH25c04
	 tRaReXfY4sWnGg0xqUbMDb5jD20OaA7KS6c9cHU42ZH6kO3xM/cFTWpGXnvn9IZMbD
	 AZIIXSMabIkcggdqizIwO0AB/WmiNars9yhd/CVosbvl+4PAfmPcuwlHhf+Fy4SnBG
	 pJGJr8li4zukZXJvuz7+jztQ8scI4tZsKfeE0jElKLM/wwnvLNh108edkfq01yuguf
	 XmCfmFkBrbNNw==
Date: Mon, 13 Jul 2026 12:49:51 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sizhe Liu <liusizhe5@huawei.com>
Cc: rostedt@goodmis.org, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, corbet@lwn.net,
	skhan@linuxfoundation.org, bhelgaas@google.com,
	yangyccccc@gmail.com, jic23@kernel.org, john.g.garry@oracle.com,
	will@kernel.org, james.clark@linaro.org, mike.leach@arm.com,
	leo.yan@linux.dev, peterz@infradead.org, mingo@redhat.com,
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	wangyushan12@huawei.com, shenyang39@huawei.com,
	gaozhihao6@h-partners.com, yuzhichengcheng@h-partners.com,
	liyihang9@h-partners.com, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linuxarm@huawei.com, prime.zeng@hisilicon.com, fanghao11@huawei.com,
	wuyifan50@huawei.com
Subject: Re: [PATCH 10/10] perf hisi-ptt: Add decoder version compatibility
Message-ID: <20260713174951.GA1245033@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604075005.2219785-11-liusizhe5@huawei.com>
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

On Thu, Jun 04, 2026 at 03:50:05PM +0800, Sizhe Liu wrote:
> The hisi_ptt packet decoder now performs detailed field-level parsing
> of TLP header DW2 and DW3 based on the message type classified from
> DW0 (added in the previous patches). However, trace data recorded
> with older versions of the tool does not contain the information
> needed for this detailed parsing, and should continue to use the
> generic field-name-only output.

Add blank line between paragraphs.  Also applies to 05/10.

> Introduce a version field (V1/V2) in the auxtrace info record to
> distinguish between the two data formats:

IMO a blank line here would also improve readability.  And consider
indenting bullet points a couple spaces.  Also applies to other commit
logs in this series, including sample formats.

> - V1 (legacy): auxtrace priv contains only PMU type. DW2 and DW3
>   are printed with generic field names only, no message-type-based
>   field decoding.
> - V2 (current): auxtrace priv contains PMU type and version. DW2
>   and DW3 are decoded according to the TLP message type (MWr, Msg,
>   Atomic, IO, CPL, Cfg) with detailed field names.

Could use imperative mood, e.g.,

  - V1 (legacy): auxtrace priv contains only PMU type. Print DW2 and
    DW3 generic field names only, no message-type-based field
    decoding.

  - V2 (current): auxtrace priv contains PMU type and version. Decode
    DW2 and DW3 according to the TLP message type (MWr, Msg, Atomic,
    IO, CPL, Cfg) with detailed field names.

> At recording time, set the version to HISI_PTT_DECODER_V2 in the
> auxtrace info. At decoding time, determine the version from the
> priv data size and the version field:
> - If priv_size >= V2, read the version from priv[1].
> - If priv_size < V2, assume V1 for backward compatibility.
> - If version is unknown (future), warn and decode auxtrace as v2.
> 
> Also add the version to the dump output alongside the PMU type.
> Adjust hisi_ptt_pkt_size position to adapt to compilation.

AFAICS this series adds new functionality and probably doesn't qualify
for "stable" tags, given the documented rules.  But I think the
maintainers are pretty aggressive about backporting things anyway.

