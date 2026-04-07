Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621F3FF5104
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 15:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTvV9YLVvZhmS7mJkrm0gxwvvoNnc/i1YqJ+eF0WO9g=; b=0r77f8Io3sbuDasOKywatUOE7B
	LTPVfvNDPwljlnga/zQB+4KaBTyI2iQdFLy0XyNJQ5MoM3VlKNpXm1l6Gh7XEYknqASEPjXNgjFCG
	rAp2X+/TKHBrTnha4N44xGe25YkW+WykSyUTTSR5HbM9GCDAC2LVqEB3+Fgr3wEovunJyVK9/Zai7
	cWWWCkOBhe9nOX4Z0ULjzPL6qwwkgaq7DxT8902TaPXz8n60f8ygg9FzkZBLWRFqwpl3ixsx9cD2B
	kEd/NYLqlw3YYsIo/Z0CYYSVaRe+L8Q4iMRCBsomw+BKdiK0P2CM6wxIfOrXkvfkpom9veF1ZT2iU
	8B4NWdwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8Yr-00000006jDk-42vi;
	Tue, 07 Apr 2026 15:41:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8Yp-00000006jCu-2eao
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 15:41:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 974BC16F2;
	Tue,  7 Apr 2026 08:41:44 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D69713F7D8;
	Tue,  7 Apr 2026 08:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775576510; bh=B/C0KOl9abFbjCqd6ewO80I01HoxY7R6TSKOFKKUbWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=olDYGExnb2BRryrQ3AtMwDZntGxBVZHYUk+6tlB1uh+ATBbPKb4++pThCg0SDl4lu
	 Ypl8+Nk0vJCUA9LXLbPMushHfRTUqd8y3vqNHH7ReH1g3cAPqtbnxzFfkgz2cnT3hE
	 OJLmtPjtBmt8UlIA+ghcAXFxINPAN8T7Bn4NUO14=
Date: Tue, 7 Apr 2026 16:41:47 +0100
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
Subject: Re: [PATCH v2 3/6] perf arm_spe: Store MIDR in arm_spe_pkt
Message-ID: <20260407154147.GO356832@e132581.arm.com>
References: <20260407-james-spe-impdef-decode-v2-0-55d3ef997c48@linaro.org>
 <20260407-james-spe-impdef-decode-v2-3-55d3ef997c48@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-james-spe-impdef-decode-v2-3-55d3ef997c48@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_084151_713521_589F88F9 
X-CRM114-Status: GOOD (  15.09  )
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

On Tue, Apr 07, 2026 at 03:05:17PM +0100, James Clark wrote:
> The MIDR will affect printing of arm_spe_pkts, so store a copy of it
> there. Technically it's constant for each decoder, but there is no
> decoder when doing a raw dump, so it has to be stored in every packet.
> It will only be used in raw dump mode and not in normal decoding for
> now, but to avoid any surprises, set MIDR properly on the decoder too.
> 
> Having both the MIDR and the arm_spe_pkt (which has a copy of it) in the
> decoder seemed a bit weird, so remove arm_spe_pkt from the decoder. The
> packet is only short lived anyway so probably shouldn't have been there
> in the first place.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

