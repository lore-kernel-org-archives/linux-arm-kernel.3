Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C93BC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 18:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=diyRKzeq2UY3pZeElrJlysTMUvqbBORqIBMpES8t+7g=; b=OePCb+3jwg0SsMYCNsV60J65me
	3vKWkKE82JSM30jQp0nNgNAdDbZbU2EqOFdzMTK6PM+kLQpbZ451SxFJKZA2lavwn5U7X+NHpgUKl
	Q/kPalCiwZtzTUW1I6o4QSHfcLm/HbPWsM6JLqNB6pGK2vMaxHS4oLLHtDs4jc4GyPu3Tj6YgeDJf
	kDKZwQh1S2+STaOHQCRE1SxLPUIypAcH64jMO7PXkPTNTuL47TKwCIYBLpK6CULetWUKUDuVbYCfg
	UuqBWcnL9k3gMhMN1nlyFFVBoqacm3ehWU5tFzMVxK/N473zxpq0S/6D++OzkCBavCHKKXJaDfKHc
	wzJTQsjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhBa-0000000FrsX-1a5d;
	Fri, 21 Mar 2025 18:33:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvh8J-0000000FqyS-2Y6Y
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 21 Mar 2025 18:30:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=diyRKzeq2UY3pZeElrJlysTMUvqbBORqIBMpES8t+7g=; b=PM2yhGHIA4yeVYyMlOYMg5Xk70
	1gGrWq5tPpdpTWpFjj6creMahUrMK3vX2uvuGBxI3i3weDza1fTCDRyBlSXcVhk7mKFXa4GOTT5e8
	NtckJYLbRLlPBPV0XuKKRF0hcP/tqbKNUMflEeYEYEkNEbPPLrg+v/KZMhoDhuwTi16/X7ZXZWMv3
	ihn3B5tCEOkzaN8wjsHvCdY50KsnGyC8upzvDN5Jm3pRgcGNQu5kVefH7ULIEQVToLFQLypo+8GKm
	rw4eEwjp9w3dMjH/NJsSHkAcyqhWOltKorqywVsyTK3pD2+OlkExjDtY8S68EYPKX0H8uFeIOuykb
	P2RoGpmA==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvh8G-00000004V2z-2Rvg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 18:30:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2A610A494E6;
	Fri, 21 Mar 2025 18:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8EE5C4CEF2;
	Fri, 21 Mar 2025 18:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742581809;
	bh=yr0HsmTDZnI304hBonkyEV4widgyTxAQ69tprlnifKM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ni9zuw0GoBvQ/nQmMiZoTDkaeyPusps56xz52dal3hCVmy6cOnaj7uA2oHk8nMuEg
	 MF+egbCGjmN6YQKNDfI0zIIIf8A9WNsEpAqCOJxgwLwJ2OOeLQYIYpz6js/b5QAQsN
	 75fPXXC86LJoFNgLjs3LK7BOH9gotB9ggCh54BIKsqVCTdjjiTE1aauT60bjNPt8SZ
	 tTGCgtPKHGyRgqTIkU3a2VuZT695pdmaJ6XJnfVP4Nk3uN6YFjbzvXUIjdjHjbiUOY
	 UJguw0i2deMRQ+NF5dFEbfgfu7+Awuor0BryFYx5+RKsiQu/VA7stk6fbToPXqntjD
	 7GQcf1CSG+Lcg==
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Ian Rogers <irogers@google.com>, John Garry <john.g.garry@oracle.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 "Liang, Kan" <kan.liang@linux.intel.com>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Ilkka Koskinen <ilkka@os.amperecomputing.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250313201559.11332-1-ilkka@os.amperecomputing.com>
References: <20250313201559.11332-1-ilkka@os.amperecomputing.com>
Subject: Re: [PATCH 0/2] perf vendor events arm64: AmpereOne/AmpereOneX:
 Add a new errata and fix metrics calculations
Message-Id: <174258180865.163787.7449214813728278320.b4-ty@kernel.org>
Date: Fri, 21 Mar 2025 11:30:08 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_183012_842975_2E5D0EEE 
X-CRM114-Status: UNSURE (   7.65  )
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

On Thu, 13 Mar 2025 20:15:57 +0000, Ilkka Koskinen wrote:
> Add an errata reference to a impacted event and fix metrics calculation
> caused by a scaling issue.
> 
> Ilkka Koskinen (2):
>   perf vendor events arm64: AmpereOne/AmpereOneX: Mark LD_RETIRED
>     impacted by errata
>   perf vendor events arm64 AmpereOneX: Fix frontend_bound calculation
> 
> [...]
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



