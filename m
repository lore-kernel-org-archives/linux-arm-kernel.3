Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0960DE6F061
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 14:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3HlXpHSJMgFNEpMk7VNpcB1k350RjKgsqLP/yjc2s8=; b=da3HTMxrHLaHNrr14KhJs4GkWP
	Tf2X6d602S+DQ6phFJDtDXQtED2td/R6REEWLWOh9tB3SQrpqWdRmY87boslTr71n0Ri4Pj9fZkMW
	CPhjYZhPiV+5twuUjgYWQffFkvpqFSk1q1UWQ3QLULPkMT2BBmtgroNUOUkL6WdbpPRnhupq/qN0/
	ykBlck+GzGwSRXKuuSTDR7Zs+R2XT0SMj3t00TPYnQRPbZr7qD05eiE2YfDL/U3DXlLYh5cJIC1cz
	8sCl8lfFaFOLY/RORY7Ogm3RYkKtwcb4/v07TT6HpiqP67x62z0vN/+m9O2u4eCEPvYPLnX73efwB
	hlxU1HVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sa3-00000007KIp-0ptS;
	Fri, 01 Nov 2024 14:24:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s9o-00000007Fsz-3evB
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 Nov 2024 13:57:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=t3HlXpHSJMgFNEpMk7VNpcB1k350RjKgsqLP/yjc2s8=; b=XOV8OLhB6q51XDhNTDdyBcck6v
	T/+oKzXUu3RgMWh9L/ZbHyStEf78lKc13g+gP7pkQzoowaHPBX3khPe6PVMblQN0+xX8Poiaq7zaR
	rwVmYH9oPhLLUb5k7/7XaDbRYJ/ozcD+s2EhX2LnoCOQnB8LawHeI4/pc5wFO/hiG4PnRld7pBhR1
	x74lmDVzGck8K7x3aNJZ9gWfaeSNtX3wtxZz6MngUCEdAfFcZbb0h0PQjzpD8v949qhN2kDpVt0pr
	WOOmQnSxC33EifaIzU3VaBvSln3gsYvkPKMAfspyryk67mu+3XmrymCpWP5MMGvrBAXaKzcaryDLR
	dnSDDE8g==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s9j-0000000AjCo-24aT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 13:57:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1AF485C6208;
	Thu, 31 Oct 2024 17:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35127C4CECF;
	Thu, 31 Oct 2024 17:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730394730;
	bh=S6ui0jUNmLRpfkePigYcEav2MlplNOKq2rw+nywpyi0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GXU4H8e25gOVMUlTowR7d9PmglWHqD6Ee97M5jFximnNfE76Nj+dpqir6TMRsI4p/
	 pweyDcFQu1Q1fF3AbyLUz4nJShmf4BqPjgB6+UOeBFrv/vM37voSRcQd7fQHiorR0z
	 x1hye27mSB2cBkYXkD+nlg+tIK2AS2ejgWfB3y1Bq6/e9Woyp9UjhvbtwifcRnS5ox
	 QzuqnM66boRfrFLy2QJA5fNuaC6zjgpiV8HyQJsQ3HMmpEiQpSc1RLm3w6MR3Msq1/
	 XljM7LtBXGFWQipAlvYuXNBwWTcJRo4NXkM/std2bucqfyRx2KusDgZOrGo0na2wG/
	 PgYG6smySMo3Q==
From: Namhyung Kim <namhyung@kernel.org>
To: linux-perf-users@vger.kernel.org, leo.yan@arm.com, 
 James Clark <james.clark@linaro.org>
Cc: Ryan.Roberts@arm.com, Kiel.Friedt@arm.com, Julio.Suarez@arm.com, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 "Liang, Kan" <kan.liang@linux.intel.com>, 
 Besar Wicaksono <bwicaksono@nvidia.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241029143734.291638-1-james.clark@linaro.org>
References: <20241029143734.291638-1-james.clark@linaro.org>
Subject: Re: [PATCH] perf arm-spe: Use old behavior when opening old SPE
 files
Message-Id: <173039473017.1704862.15529653734308857023.b4-ty@kernel.org>
Date: Thu, 31 Oct 2024 10:12:10 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_135739_732452_1BE1F9F7 
X-CRM114-Status: UNSURE (   9.60  )
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

On Tue, 29 Oct 2024 14:37:33 +0000, James Clark wrote:

> Since the linked commit, we stopped interpreting data source if the
> perf.data file doesn't have the new metadata version. This means that
> perf c2c will show no samples in this case.
> 
> Keep the old behavior so old files can be opened, but also still show
> the new warning that updating might improve the decoding.
> 
> [...]

Applied to perf-tools-next, thanks!

Best regards,
Namhyung


