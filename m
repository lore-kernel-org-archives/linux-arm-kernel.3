Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33CBD2FEC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 17:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQ3uqbxArlD82rm1kTTeHgP3Ca521qNmsUHhaKMB6Tc=; b=tQKyeIYtGHUsBZs1B4hJkPtb8X
	yEx+t2wR5YOz6JozzeGRIn9PnTSE2jj2eb9guzH9pt/WpimNCzIvMk0AUdgjuCmnRxtg275dygYhQ
	lq1/vYCaumdiBVvLhMq9lk9k3z+INL8WIF19FlnnVS5Zhj3E08QtviQ4eHDLf5rfEYdNiQHgxmHjF
	fSWKuXHlBRvxPpM9AC0HLLj0sV3uv+NK2h6AxELMAb1ACg+JkGiQYD2vZahNn3yFqFofoVHnkfYhG
	RZUmbHGrXmsNwMjIaxe4I7CkZjotIBIbCctzc74/HjAWIzkzoKxcMEQIyjDxliLoPMBZYQkEAZuKG
	eEZdLJ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkn6M-0000000EkWa-3wVJ;
	Tue, 27 Jan 2026 17:43:42 +0000
Received: from flow-b3-smtp.messagingengine.com ([202.12.124.138])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkn6J-0000000EkWA-2j0S;
	Tue, 27 Jan 2026 17:43:41 +0000
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailflow.stl.internal (Postfix) with ESMTP id F20CC1300410;
	Tue, 27 Jan 2026 12:43:32 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Tue, 27 Jan 2026 12:43:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serhei.io; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1769535812; x=
	1769543012; bh=rQ3uqbxArlD82rm1kTTeHgP3Ca521qNmsUHhaKMB6Tc=; b=A
	JXBEeKk/Q356D1zWF2OTHz9HlU6wIYBJXLVWiszNJrdrffvoz2MFbrAjMD50AsIq
	ifeZ7f4c0x19ijxJ5lTKu70aVkcIxknhtfMCp4aCEGHTwdoZaFdTWCmrKWH2+79U
	qjfIoYcazDvNxEmhhV4A9s6Uz0AW/GfgvEXEPUcp9zYaAYXoR/KY6OnVDbtNtSV6
	hAHmaGo29hiNPQAZw6Ae5DbCvpx/EfOOq38Wq9hHfGqj9zJ8FaLdz7e5MZ4draBq
	/T8Vmpz7m5uhajyphuld2dAVt2dgofiz/Txbm1SsJEoTGIJU5lY6xTZ3aO2LYb9O
	lDKr7GY2fObLnhDzYsYRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1769535812; x=1769543012; bh=r
	Q3uqbxArlD82rm1kTTeHgP3Ca521qNmsUHhaKMB6Tc=; b=FRmdgELeq3pT017oe
	MiHeYPYQPyIReVrGSQoxz7ZABXhXc5HxTv54fRcfUJ2oB3HKueFpcxb7qP17u4l2
	2TziSFwlFUQgVM7Jagzmwuujf6ND/Q92hQuUyidVhbBdGGCTRO8NTZkrvCtuOHAI
	trK8JfcBFNWHwojMcKpUNxRgRTKhaqU2zLPlEP9c4QcKmMB58yyNG++2vDIad+BE
	IBz1AqFF4b7ndwIfA2XDrurcuyJiltRedbeoLCubtwkP7gXNlzIVAxwhWtFqzsmr
	soiP5MxHBirjwFH+3QomuXsEUcsWywzRO63730c6ZegGLgdps6rwpgyC1DGxx9nE
	GI9lg==
X-ME-Sender: <xms:Qvl4aZhCUGOoG5kC5D-HHpOhXJ-WxhEPPARCh_n0vi1CcGUmO4gxiQ>
    <xme:Qvl4af5SD_wAmhJMCXRLhtBRfrLmB5K-wV2OPXqmJlDJ-JhWKgBWbysNbklnOaCkX
    l8JEx4R-HI3aknzOq8i551QEkk24_Gp1nAi0H9V48R8E_pRMIZ2cQ>
X-ME-Received: <xmr:Qvl4advG_ufoq8l9X0G8LZcO3fgGk8cRmu58Q5YPuXB0Fpy-95ptiJMFTa9D_GFWle3dhwY4J4It4GjLVkBCBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieduuddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpefuvghrhhgvihcuofgrkhgrrhhovhcuoehsvghrhhgvihesshgv
    rhhhvghirdhioheqnecuggftrfgrthhtvghrnheptdeuudfftdehgfetheehlefghefffe
    egieekheefgfdufefgudeifefhvefgudeknecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepshgvrhhhvghisehsvghrhhgvihdrihhopdhnsggprh
    gtphhtthhopeefhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepihhrohhgvghr
    shesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprggtmhgvsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopegrughithihrgdrsgdusehlihhnuhigrdhisghmrdgtohhmpdhrtghp
    thhtoheprggurhhirghnrdhhuhhnthgvrhesihhnthgvlhdrtghomhdprhgtphhtthhope
    grkheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopegrlhgvgiesghhhihht
    ihdrfhhrpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprh
    gtphhtthhopegrthhrrghjvggvvheslhhinhhugidrihgsmhdrtghomhdprhgtphhtthho
    pegtthhshhgrohesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:Qvl4acy1cH04rHlU2cxdH9PyrcA8QjQb6liH6SeoYVyYqnWq_4b3TA>
    <xmx:Qvl4aWwl7x1gkczU8HsCUUNImOpruQNSyJGhziDOeN8hbN-ZI_oM0g>
    <xmx:Qvl4aRiY_iDr_TdIhSOrPJYj22bjq7aLMxxWKNibpaTBYmjPK0FbvA>
    <xmx:Qvl4aUjnjA1bBPCMy2wC_-H2p8DKVLkjg2eqtE6ZnAJtc1DLZctBXw>
    <xmx:RPl4aeUujcDdEW4kYQe7ll4i21W8Nm0g3J1N_mS0buHiLGfO4labLlBv>
Feedback-ID: i572946fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Jan 2026 12:43:29 -0500 (EST)
From: Serhei Makarov <serhei@serhei.io>
To: irogers@google.com
Cc: acme@kernel.org,
	aditya.b1@linux.ibm.com,
	adrian.hunter@intel.com,
	ak@linux.intel.com,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	atrajeev@linux.ibm.com,
	ctshao@google.com,
	dvyukov@google.com,
	guoren@kernel.org,
	haibo1.xu@intel.com,
	howardchu95@gmail.com,
	james.clark@linaro.org,
	john.g.garry@oracle.com,
	jolsa@kernel.org,
	krzysztof.m.lopatowski@gmail.com,
	leo.yan@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux@treblig.org,
	mark@klomp.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	palmer@dabbelt.com,
	peterz@infradead.org,
	pjw@kernel.org,
	shimin.guo@skydio.com,
	slyich@gmail.com,
	stephen.s.brennan@oracle.com,
	thomas.falcon@intel.com,
	will@kernel.org
Subject: Re: [PATCH v1 22/23] perf unwind-libdw: Don't discard loaded ELF/Dwarf  after every unwind
Date: Tue, 27 Jan 2026 12:42:53 -0500
Message-ID: <20260127174253.396766-1-serhei@serhei.io>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117052849.2205545-23-irogers@google.com>
References: <20260117052849.2205545-23-irogers@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_094340_340128_192D58FE 
X-CRM114-Status: GOOD (  11.11  )
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

> As removing the dwfl didn't prove possible, an alternative is to just not discard the dwfl when the unwind ends. The dwfl is valid for a process unless a dso is loaded at the same address as a previous one. So keep the dwfl with the maps, invalidate it if a map is removed (in case a new map replaces it) and recycle the dwfl in the unwinding code.

Relevant note:

I'm looking at whether elfutils libdwfl_stacktrace might further help with these issues. The libdwfl_stacktrace library is currently shipped as an experimental addon to libdwfl in elfutils 0.194, but I'm intending to stabilize the API this year. There's code for some analogous functions: translating perf->dwarf register files, and caching Dwfl and Elf data to speed up unwinding across multiple processes. (Thus, if unwinding a collection of perf_events from 16 processes that use libc, we don't need to load the CFI for libc.so 16 times.)

I think once I've stabilized the libdwfl_stacktrace API and expanded the register support to a larger set of perf-supported architectures, it makes sense for me to author a corresponding set of patches for perf. I'll see if it's worth adding more libdwflst functionality to elfutils 0.195 in anticipation of this.

-- Serhei Makarov

