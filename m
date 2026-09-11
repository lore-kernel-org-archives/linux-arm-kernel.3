Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C9DC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 07:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:To:From:References:CC:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIPghYDjldaQhWAAAGEJ/xvZF4ExUts68Xdqztjk628=; b=XVOUvBnC289gBh+RROMOzsPsC3
	5niozkNNK5Hg4zjnyTmVPnq2EQZIG2o9FdRprOJ1Mv/rwSFmm6Ai0NrZJZZUGbM940eoBrDSweUuq
	FrOTisdpApq2UkLK3PYHHEUVwsmOAAV36BcYFL7WRNyeXQo1cyUnqdyCSFO/Cq4Pjx8Azidz1xaL9
	cBTsrJe78AGXNP6r1f84S93N817NN8UsZLzEVDAowDVGl8RXW+P6yd2HjiPBihAsRWFqh2rtDoBqT
	WiFp+EEVqdhD07znW+UsstZyRJhvZu9o8sP9DyFl4SCZMT5HpdymDtp9EveMDyq7vqVvU6E6AWQDf
	R6fX1ffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4uxd-0000000FxMw-3mXj;
	Fri, 11 Sep 2026 06:42:09 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4uxZ-0000000FxM7-3m9T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 06:42:08 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=bIPghYDjldaQhWAAAGEJ/xvZF4ExUts68Xdqztjk628=;
	b=GIIMTrkXpqOqobIhcZXPy2aapSwvv1ajs9SmI2b4KVEHN2OH174sPwQ5kyIdAFR8KzyW793Hk
	35P4G8ADMp0dxlidnCJ9WqB82klTzW32sH/2Kj0/YpwEEQ+Q7LB7vtrChIFEqnWucFlouvDVAUp
	6rybl2B2o7iGh2R+eYM5ZlA=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hh4Rz4CYxz1prKW;
	Fri, 11 Sep 2026 14:30:55 +0800 (CST)
Received: from whupemo200004.china.huawei.com (unknown [7.152.184.18])
	by mail.maildlp.com (Postfix) with ESMTPS id 8F41A40575;
	Fri, 11 Sep 2026 14:41:52 +0800 (CST)
Received: from [10.67.120.233] (10.67.120.233) by
 whupemo200004.china.huawei.com (7.152.184.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 11 Sep 2026 14:41:49 +0800
Message-ID: <4019452b-b25f-4c17-bc5c-570a28782bf1@huawei.com>
Date: Fri, 11 Sep 2026 14:41:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] Enhance TLP packet decoder with field-level
 parsing and versioning
CC: <rostedt@goodmis.org>, <mhiramat@kernel.org>,
	<mathieu.desnoyers@efficios.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <bhelgaas@google.com>, <yangyccccc@gmail.com>,
	<jic23@kernel.org>, <john.g.garry@oracle.com>, <will@kernel.org>,
	<james.clark@linaro.org>, <mike.leach@arm.com>, <leo.yan@linux.dev>,
	<peterz@infradead.org>, <mingo@redhat.com>, <namhyung@kernel.org>,
	<mark.rutland@arm.com>, <alexander.shishkin@linux.intel.com>,
	<jolsa@kernel.org>, <irogers@google.com>, <adrian.hunter@intel.com>,
	<wangyushan12@huawei.com>, <wuzongyu1@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, Arnaldo Carvalho de Melo <acme@kernel.org>
References: <20260908140509.2485649-1-liusizhe5@huawei.com>
 <aqB37YCMUYKodo3N@x2>
From: Sizhe Liu <liusizhe5@huawei.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <aqB37YCMUYKodo3N@x2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.233]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 whupemo200004.china.huawei.com (7.152.184.18)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_234206_617974_2A4926B6 
X-CRM114-Status: GOOD (  19.79  )
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

On 2026/9/9 5:02, Arnaldo Carvalho de Melo wrote:
> On Tue, Sep 08, 2026 at 10:05:01PM +0800, Sizhe Liu wrote:
>> The original hisi-ptt-decoder only prints raw hex values with
>> generic field names for DW0/DW1/DW2/DW3, without classifying TLP
>> types or decoding DW0/DW1/DW2/DW3 fields according to the hardware-
>> defined packet format.
>> 
>> This series enhances the HiSilicon PTT (PCIe Trace and Tuning) packet
>> decoder in perf tool to provide detailed field-level parsing of TLP
>> headers based on message type, and adds a versioning mechanism for
>> backward compatibility both in hisi_ptt driver and perf tool.
> 
> Series is sashiko clean by now, has a Reviewed-by, but it touches both
> kernel and tools, I wouldn't have a problem if it was processed by whoever
> maintains the kernel part.
> 
> - Arnaldo
> 

Hi Suzuki,

The series is now Sashiko-clean and has Reviewed-by tags. It touches both
driver and tools. Arnaldo is fine with the tools part. Would you mind
reviewing the driver part and picking it up through your tree if it looks good?

If there are any changes needed, please let me know.

Link: https://lore.kernel.org/all/20260908140509.2485649-1-liusizhe5@huawei.com/

Thanks for your time!
Sizhe

>> --- Changes in v4: - Add missing space in hisi-ptt.rst (Sashiko). -
>> Widen the pattern bit field in struct hisi_ptt_trace_ctrl (Sashiko). 
>> - Add protocol defined TLP header length parsing in patch 05/08. -
>> Add MRd and DMRr message types parsing in patch 05/08. - Add comment
>> for enum hisi_ptt_pkt_msg_type in patch 05/08. - Add DW0 and DW1
>> fields analysing in patch 06/08. - Refine bit-fields parsing of DW0/
>> DW1/DW2/DW3 based on different requests in patch 06/08. - Refine the
>> description of pattern=1 in the document in patch 07/08. - Extract
>> the bit-field printing of v1 version into functions in patch 08/08. -
>> Link to v3: https://lore.kernel.org/linux-
>> pci/20260903075241.1445338-1-liusizhe5@huawei.com/
>> 
>> Changes in v3: - Add explicit inclusion of <stdbool.h> (Sashiko). -
>> Make patch 07/08 apply cleanly to mainline (Yushan). - Pick up the
>> reviewed-by tag (Yushan). - Link to v2: https://lore.kernel.org/
>> linux-pci/20260827140442.2031128-1-liusizhe5@huawei.com/
>> 
>> Changes in v2: - Split patch 01/10 and patch 02/10 from series v1
>> into independent patch series for backporting (Bjorn). - Use bitwise
>> operations instead of C bitfields for cross-platform cases (Sashiko).
>> - Add `pattern` parameter in hisi_ptt driver for layout
>> compatibility. - Link to v1: https://lore.kernel.org/linux-
>> pci/20260604075005.2219785-1-liusizhe5@huawei.com/
>> 
>> --- Sizhe Liu (8): perf hisi-ptt: Abstract trace data buf and offset 
>> perf hisi-ptt: Complete the field names for 4DW and 8DW packets perf
>> hisi-ptt: Extract the raw data printing part perf hisi-ptt: Merge
>> 4DW and 8DW HEAD0 printing perf hisi-ptt: Add parsing of supported
>> message types and proto length perf hisi-ptt: Add field-level
>> parsing for header DW0/DW1/DW2/DW3 hwtracing: hisi_ptt: Add pattern
>> PMU config for trace format selection perf hisi-ptt: Pass pattern
>> version to decoder for compatibility
>> 
>> Documentation/trace/hisi-ptt.rst              |  26 +- drivers/
>> hwtracing/ptt/hisi_ptt.c              |  25 +- drivers/hwtracing/ptt/
>> hisi_ptt.h              |   4 + tools/perf/arch/arm64/util/hisi-
>> ptt.c         |  18 + .../hisi-ptt-decoder/hisi-ptt-pkt-decoder.c
>> | 593 ++++++++++++++++-- .../hisi-ptt-decoder/hisi-ptt-pkt-
>> decoder.h   | 241 ++++++- tools/perf/util/hisi-
>> ptt.c                    |  51 +- tools/perf/util/hisi-
>> ptt.h                    |   9 +- 8 files changed, 872
>> insertions(+), 95 deletions(-)
>> 
>> -- 2.33.0


