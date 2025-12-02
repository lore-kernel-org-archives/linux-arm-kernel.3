Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF353D116F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 14:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3ZlnOg1pjydbqpkKkfxH4cRgNlMQYjpHQdJjXu8IFQ=; b=M4JQEKzCU4VxLjhIxnO98B49o6
	N4NYAki4IM7GcBVvQyWEfYBHVt3y8gfpicRHZAwqR68phQxDV7afgTLdcwcg23twDWPvgKHBtjiph
	aO5A3oW3L1jUphKX8Z9DHOiESdKuCWNXMtwC/hFKEd/crwoHRtNtUvJOnoekO/rFjn2MmOQRS0t/U
	Bt8uCyhtn0lJ6FqaSzyDLHAJ2qfrUtKxg0qjYG+biIMi/AjKgFJwXTp6sbxSPSK76fokrguAxHWBo
	+VMDpbgjJhUrsV9s+DDo2pGAEGoCX2AB/44Gar/yD+ogzw0SZalieHQX1MctZCh2mSX51IFCyQs53
	UWcMNPDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQRIk-00000005V1H-2X9Q;
	Tue, 02 Dec 2025 14:24:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQRIi-00000005V0D-0vOq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 14:24:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B98321477;
	Tue,  2 Dec 2025 06:24:11 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B04D33F73B;
	Tue,  2 Dec 2025 06:24:18 -0800 (PST)
Date: Tue, 2 Dec 2025 14:24:16 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 06/19] coresight: trbe: Refactor syndrome decoding
Message-ID: <20251202142416.GC724103@e132581.arm.com>
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
 <20251201-trbe_buffer_refactor_v1-1-v1-6-7da32b076b28@arm.com>
 <65c84357-0bda-454f-88c3-623b3ff9d29d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65c84357-0bda-454f-88c3-623b3ff9d29d@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_062420_965253_A619E779 
X-CRM114-Status: GOOD (  18.03  )
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

On Tue, Dec 02, 2025 at 11:06:48AM +0000, Suzuki K Poulose wrote:
> Hi Leo
> 
> A couple of minor nits below. Otherwise looks like a nice cleanup
> 
> 
> On 01/12/2025 11:21, Leo Yan wrote:
> > It gives priority to TRBSR_EL1.EA (external abort); an external abort
> > will immediately bail out and return an error.
> > 
> > Next, the syndrome decoding is refactored based on two levels of
> > information: the EC (Event Class) bits and the BSC (Trace Buffer Status
> > Code) bits.
> > 
> > If TRBSR_EL1.EC==0b000000, the driver continues parsing TRBSR_EL1.BSC to
> > identify the specific trace buffer event.  Otherwise, any non-zero
> > TRBSR_EL1.EC is treated as an error.
> > 
> > For error cases, the driver prints an error string and dumps registers
> > for debugging.
> 
> minor nit: Please avoid describing the code, which cod does well.
> Briefly mention what you are doing, giving any additional contexts
> that may not be evident from the code.

Sure, I will note this later.

> e.g:
> 
> "Add support for decoding the syndrome for TRBE, providing a verbose
> description of the code for Fatal/unhandled events.
> While at it add the new definitions from the latest Arm ARM for
> EC and BSC"

Will do this and followed comment.  Thanks for suggestion!

Leo

