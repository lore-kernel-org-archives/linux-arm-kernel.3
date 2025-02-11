Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F61AC021A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 07:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:To:From:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxB3/5WwQz68fg3MoEi71/v426Fi20HIksm5loNdxsU=; b=AKaX+6qvyWsNzV45VqbcxedxyW
	ll/wQOCO33i2WH9Pq7hv4dmNCpr2uwmLlklxq8XqKH2yOotio29njNt3CqUog4Tc/V4OhD4g/CyaF
	+Txs0fj9HD2nIG0e6MZMYWnm+/pVLIwmQa6t2pbRQ0psLcbs4M666eJT9V4aHS8i41/XGFKFWa5KC
	HjmYB9/NEh+vo7N7Ah/dtLVtK1tiyi0ozdGyOq6wUaP4pCeDlpi9RH9lRsq1SJdnjnjtmSDiiPFrO
	s+VxTzgjdgB3/YKdR4F2TRqu3rZ7hR3U/APNGY8lusejIGfrOG+KaEI/vsS4MXJfEzN2zOPnsE5Ay
	u6sEB//A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thl3l-00000002tLC-0lRS;
	Tue, 11 Feb 2025 07:51:57 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thl0m-00000002seq-0IWU;
	Tue, 11 Feb 2025 07:48:53 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id B00B513802BF;
	Tue, 11 Feb 2025 02:48:48 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Tue, 11 Feb 2025 02:48:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1739260128;
	 x=1739346528; bh=ZxB3/5WwQz68fg3MoEi71/v426Fi20HIksm5loNdxsU=; b=
	2/HEGcR9OGOaAwRQO6L6sMF2KbOtsNplv7MNsDt/YCxHuhPRcqAYtEiGoZgIwOfc
	uL3sX3JSq1cawjwJkoxV3QTUgisQ3ya7PSS1ytut1LTD8PGj+BKk96+KJE65RNBW
	Tsphgr7hCXE4tVIJ34oYnPVbiB4vjSTfc9/NOGeoGbswiwgC1a+6NHKuopy+NWom
	W8Aye1T6NHlCILvx9Uo/L5Kan0YegyE5vRZFt0JnSxM/E7xAAFXkVMgaJLxHkNSW
	7vSPcFaDVUCUX03VcnEb5QcRWhgQe/5RuBfnXo/EPUTyYvPI+L0q+ljabvM280SI
	8+YYDn0Hmr5uRCF9PS3rqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739260128; x=1739346528; bh=Z
	xB3/5WwQz68fg3MoEi71/v426Fi20HIksm5loNdxsU=; b=I4IxVtCnnAUwaMwdS
	HBPGl0s8Bs7N5OvfxUUj7rmVpwUDenuSUtoWA8qW7iOVzTrXUCYnMvk85s2z0xoR
	WwjfijsoIZ2gTZvqKVWotAOhcud1aPNGWjwV5EUeMHeY8JPZJfZ+Xl8EawFUVWba
	L3G6vsOf9tVmmeY9c0Wm3+WHg4QEmtkIr425BlwrsmYGhpE/Bmny9s4MR27hsZYL
	y6+mygr/MkXkIGwZMSloEQsmGVX47ObWdyppCTZAe/elBW2w3wJ2xxOqyqnb6WE1
	pUlHrn/PNj4fbO2AgIJp64uaid65I+6U3nPUa7F1LIYYVGTHDQvsRUDBL0TAlSC2
	PtUrg==
X-ME-Sender: <xms:3wCrZ2JHs4IEKLoCYrrqhDKpD0sECcz6XTbclk5k5JQOCStIbUrLoA>
    <xme:3wCrZ-KMxcrDJeRW5DKhBWQAbB8In_PeccU4ovCK8v_85BQrb0r0MSUwuSRA9sLTX
    4SX2c5Sd_RQzhV7q7Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegtdegfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfekledtffefhffghfetteehuefhgfetgefhtdeu
    feduueeltefghedtjeeifffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfedu
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrg
    hssegrrhhmrdgtohhmpdhrtghpthhtohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgt
    ohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoh
    eprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehhohifrghr
    uggthhhuleehsehgmhgrihhlrdgtohhmpdhrtghpthhtohepihhrohhgvghrshesghhooh
    hglhgvrdgtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhg
    pdhrtghpthhtoheprggurhhirghnrdhhuhhnthgvrhesihhnthgvlhdrtghomhdprhgtph
    htthhopegrtghmvgeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:3wCrZ2tgaKZd-r19tJFBLx1c9olIzWTs4ZaRSponWadm2LzZ8pniRQ>
    <xmx:3wCrZ7abmJIQQGxBya7YEj5PHj7E42WKmlGvJuuqMoyGm5CmplJPQg>
    <xmx:3wCrZ9aU6yItPSC8xJtXsBq-fJNVShJH7DJB1OOPcE4_GM_L7YKmfw>
    <xmx:3wCrZ3A_NdBF4H9b_qRB98P-LNzrFo0iZkHCoC5kpllQIinlE4Y6uA>
    <xmx:4ACrZwlxbCT18wcLzBJjhR0WUz3hezoGAamIPURRlc7nthRHwLvQT-fx>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 374062220072; Tue, 11 Feb 2025 02:48:47 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 11 Feb 2025 08:48:26 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ian Rogers" <irogers@google.com>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Ingo Molnar" <mingo@redhat.com>,
 "Arnaldo Carvalho de Melo" <acme@kernel.org>,
 "Namhyung Kim" <namhyung@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Alexander Shishkin" <alexander.shishkin@linux.intel.com>,
 "Jiri Olsa" <jolsa@kernel.org>,
 "Adrian Hunter" <adrian.hunter@intel.com>,
 "Kan Liang" <kan.liang@linux.intel.com>,
 "John Garry" <john.g.garry@oracle.com>, "Will Deacon" <will@kernel.org>,
 "James Clark" <james.clark@linaro.org>,
 "Mike Leach" <mike.leach@linaro.org>, "Leo Yan" <leo.yan@linux.dev>,
 guoren <guoren@kernel.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Charlie Jenkins" <charlie@rivosinc.com>,
 "Bibo Mao" <maobibo@loongson.cn>, "Huacai Chen" <chenhuacai@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Jiri Slaby" <jirislaby@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>,
 "Howard Chu" <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-riscv@lists.infradead.org
Message-Id: <07c5c3ad-5a6d-4eda-95f2-ed16e7504d4c@app.fastmail.com>
In-Reply-To: <20250210165108.95894-4-irogers@google.com>
References: <20250210165108.95894-1-irogers@google.com>
 <20250210165108.95894-4-irogers@google.com>
Subject: Re: [PATCH v2 3/7] perf syscalltbl: Remove struct syscalltbl
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_234852_187398_0E766FD9 
X-CRM114-Status: GOOD (  20.40  )
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

On Mon, Feb 10, 2025, at 17:51, Ian Rogers wrote:
> The syscalltbl held entries of system call name and number pairs,
> generated from a native syscalltbl at start up. As there are gaps in
> the system call number there is a notion of index into the
> table. Going forward we want the system call table to be identifiable
> by a machine type, for example, i386 vs x86-64. Change the interface
> to the syscalltbl so (1) a (currently unused machine type of EM_HOST)
> is passed (2) the index to syscall number and system call name mapping
> is computed at build time.
>
> Two tables are used for this, an array of system call number to name,
> an array of system call numbers sorted by the system call name. The
> sorted array doesn't store strings in part to save memory and
> relocations. The index notion is carried forward and is an index into
> the sorted array of system call numbers, the data structures are
> opaque (held only in syscalltbl.c), and so the number of indices for a
> machine type is exposed as a new API.
>
> The arrays are computed in the syscalltbl.sh script and so no start-up
> time computation and storage is necessary.
>
> Signed-off-by: Ian Rogers <irogers@google.com>
> Reviewed-by: Howard Chu <howardchu95@gmail.com>

Your changes look fine to me, but I noticed one part that may
be wrong before and after your patch:

> 
> -const int syscalltbl_native_max_id = SYSCALLTBL_MAX_ID;
> -static const char *const *syscalltbl_native = syscalltbl;
> +const char *syscalltbl__name(int e_machine __maybe_unused, int id)
> +{
> +	if (id >= 0 && id <= (int)ARRAY_SIZE(syscall_num_to_name))
> +		return syscall_num_to_name[id];
> +	return NULL;
> +}

The syscall numbers on mips (and previously on ia64) are offset by
a large number depending on the ABI (o32/n32/n64). I assume what
we want here is to have the small numbers without the offset in
syscall_num_to_name[], but that requires adding the offset during
the lookup. Can you check if this is handled correctly?

      Arnd

