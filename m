Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C427D39404
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 09:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6lbBJjztI3wSz2zGUJCR8V6BGZpqifVz4rcafBOMo8=; b=4HVVGdSlqZZKO8cDsNYpw7yUat
	DWXQ1dD2Y26/R5bH90hOIn7OErwNqSMeDwe7kdwDIVgESsgUBy2Vrw6DxO9HwbVXsPeaQ4hsHtq1d
	jUZdmxrj3fRovb9JvngSD5g486uE+Nqs+RqbT/l9GjJz6AuvmGcZ8HVDK322nvuxZr4alAg0wFpNn
	yInM86t0H+8FdoCiEAg3vjdpGjIiuIjqMNE8TjPLE0VpYhkI98oMXBGBlk2ILFSNglwbafFHVfiOs
	3KgDJGrQuz4vmzZE39oSFOzLPkO8MrKGbmTQBEiXBImxMF+j7TInLgOFc+YdUUxM0XGWJyIPkts4I
	29aisnUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EPp-0000000HHd7-0m3N;
	Thu, 02 Apr 2026 09:32:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EPm-0000000HHcm-1zfm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 09:32:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9165C2C43;
	Thu,  2 Apr 2026 02:32:31 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4AB83F641;
	Thu,  2 Apr 2026 02:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775122357; bh=sbzbA6SNescnwNKRvB8i7ZMu72AEh9iVWS/mHuNQ10U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NoLkWdrF8PEjH8QdzJjqekgGTj2EhdNn1NkXKhD10AkGai/IDiWG1k1dpZp65URyi
	 u4xWsf0gTCOgdHV11Q3CQQRvCdxvUh47CTVMZd66fGa2u7gLns/ofQ59ZM9xwRJzGt
	 CyDCi87DM8SrfGjdaGgAIyTaHlQI8Zvu4McEYLr0=
Date: Thu, 2 Apr 2026 10:32:34 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Al Grant <al.grant@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] perf arm_spe: Decode Arm N1 IMPDEF events
Message-ID: <20260402093234.GG356832@e132581.arm.com>
References: <20260401-james-spe-impdef-decode-v1-0-ad0d372c220c@linaro.org>
 <20260401-james-spe-impdef-decode-v1-3-ad0d372c220c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-james-spe-impdef-decode-v1-3-ad0d372c220c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_023238_730717_F0FAAED1 
X-CRM114-Status: UNSURE (   9.49  )
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

On Wed, Apr 01, 2026 at 03:25:51PM +0100, James Clark wrote:

[...]

>  static int arm_spe_pkt_desc_event(const struct arm_spe_pkt *packet,
> -				  char *buf, size_t buf_len)
> +				  char *buf, size_t buf_len, u64 midr)

Just wandering if we can add a "midr" field into struct arm_spe_pkt ?
Then we don't need to change many functions for populating midr.

The rest is good for me.

Thanks,
Leo

