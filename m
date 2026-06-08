Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0890CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 13:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OutRhBbS1FgllrvUBkpJuryfLvPR2Z56/LX+4uNbCdQ=; b=cVDJP6MSUUWuRQAv4AqGTCxWLN
	onVEZJ0aCLtwRm1/O5c4r+CzmYwiTija7Bp7HJ37b0V8ibL3ctGKo+mUT1wgWvvTAfiudkRgO5BKp
	BclZ1p4T7loO2LRVm4BHw6vASltM0ERp2+XwMcmLLh00RZ9zsO/owXUeINnpnebHH/iWRbSsI7kRz
	3z9+N+DqSYjyq9lDndD6+CRWss3ZlU2UfHefqmF4U3QPuS5zTizirDkSoRQ5yl7O/EofQ9TIDFIf9
	4YCSOFR/lm4WZ7EcEVMh5SwH5RZsJCkpoqRCzxP+m7ETDXHnDanDn6WCZN/c7ve2LBSTy49D7fNzd
	8c6csmAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZje-00000003akb-0l9g;
	Mon, 08 Jun 2026 13:09:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZjc-00000003akC-0kUy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 13:09:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D02B71E4D;
	Mon,  8 Jun 2026 06:09:37 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3450B3F86F;
	Mon,  8 Jun 2026 06:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780924182; bh=OutRhBbS1FgllrvUBkpJuryfLvPR2Z56/LX+4uNbCdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a0KPzHINKIXAlM+/jwHIUlNNlw+i6YJIm++EoUWaVbab9HZ2oV1Sjf+kpreV53hJQ
	 ihuq7zWVJZh/Bhl3fkH4I4sHMrOKBySawl14BinH//uKiwep4ik2vPA9fb6kANHA0n
	 xIZbMIOHtdufso4FlApC7z0ongUF2xoMl9zcaG2o=
Date: Mon, 8 Jun 2026 14:09:39 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
	linux-perf-users@vger.kernel.org, Leo Yan <leo.yan@linux.dev>,
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
Subject: Re: [PATCH v6 6/8] perf cs-etm: Filter synthesized branch samples
Message-ID: <20260608130939.GO101133@e132581.arm.com>
References: <20260526-b4-arm_cs_callchain_support_v1-v6-0-f9f49f53c9dd@arm.com>
 <20260526-b4-arm_cs_callchain_support_v1-v6-6-f9f49f53c9dd@arm.com>
 <fbe0a097-ced7-44c6-ada1-01c3e9c1d7e7@linaro.org>
 <20260608112834.GM101133@e132581.arm.com>
 <b122283d-f3a7-4174-8c13-2ae9f6d1e79b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b122283d-f3a7-4174-8c13-2ae9f6d1e79b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_060944_260081_1083D4E5 
X-CRM114-Status: GOOD (  11.23  )
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

On Mon, Jun 08, 2026 at 01:35:24PM +0100, James Clark wrote:

[...]

> Ah I missed that. In that case maybe it makes sense to break it and treat it
> as a bug fix. 'c' is quite clearly documented as calls only, and the
> workaround you suggested above makes it impossible to get only calls so it
> makes separate options for call and return a bit useless.

Okay, I'll change this as the first patch and include a Fixes tag.

Thanks,
Leo

