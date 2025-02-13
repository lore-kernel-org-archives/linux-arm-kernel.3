Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E901C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 18:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sbf17wt1hfkBOGqKu60AYBGrkPfumajN9wGFquDH2wQ=; b=Eef1gJaQfMyaZN2pr6HbAAGnRL
	W2DDAg7QzoTkBlAVO5JZC8minU++tpaH4RdWOTBxhqkyZS6h0nyIegsssKu6oSCwWveTv6rtVnJgt
	zf2YZ4RQUa9JsAGEuvpUSMeMXBWk4OLCDYM1L/CDTT5dAyXX2x5sTztaDuK6bF/dqOk4oTlH4Jz12
	qGNZsQZz9t16VglNne65MLPdvmCbU3d6Fo2+x9RpiBANx2dA5PI2R2LqwveYkyQyd0BShkH2muDeU
	Vs1ZbBhTULXbKKum7jquWvE/8cVARqwq28WBNdjsAb/Oq3hKLZaaanafg7JNV85vSiVh24laqeETU
	k+SwNjwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidmA-0000000CBuy-0Eyq;
	Thu, 13 Feb 2025 18:17:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ticu5-0000000BzTC-3JVI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 17:21:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8D785A42813;
	Thu, 13 Feb 2025 17:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7B8C4CEEB;
	Thu, 13 Feb 2025 17:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739467292;
	bh=G38jDqfl/AF+iPvssalJ9aOICXGh8jdULDsQ+xgpfKM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=LRZop5qORX4szK1LIQGbdbzB71jxszl4oayTvfjXqDTHDJyhOyBLRdwe+pwLA9kAx
	 hQ3m7vi7Z7k15EwdWdxPr2Ikcajh9B/AVB2/XdhuE+Dn/rcC2yJOijc5LhJar0lbDV
	 bnjell3mmboNOWCe2PoIOhTXnv0qYA46M28xL1r4NG3JhuWkuE0TJae8nAKcJADhZg
	 SAd8yh9zeWQpQno2oQu1yfurZAUYedL7BhXtZNC/0bIuk7xHuXuq3Qm/PUkeQCfNv1
	 LqKSpUzTKLliKHjd2wRqX4uPzlL4vbYYdaZIbKoMDjPGm8lRUad8Rqc3S+owfjVJGj
	 l0dM/KGJ11Yig==
From: Namhyung Kim <namhyung@kernel.org>
To: Tavian Barnes <tavianator@tavianator.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Charlie Jenkins <charlie@rivosinc.com>, Andi Kleen <ak@linux.intel.com>, 
 Veronika Molnarova <vmolnaro@redhat.com>, 
 Michael Petlan <mpetlan@redhat.com>, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 coresight@lists.linaro.org, Ian Rogers <irogers@google.com>
In-Reply-To: <20250113194345.1537821-1-irogers@google.com>
References: <20250113194345.1537821-1-irogers@google.com>
Subject: Re: [PATCH v1] perf sample: Make user_regs and intr_regs optional
Message-Id: <173946729207.1291083.11530749886771499675.b4-ty@kernel.org>
Date: Thu, 13 Feb 2025 09:21:32 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_092133_889186_70C3F3B5 
X-CRM114-Status: UNSURE (   6.14  )
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

On Mon, 13 Jan 2025 11:43:45 -0800, Ian Rogers wrote:
> The struct dump_regs contains 512 bytes of cache_regs, meaning the two
> values in perf_sample contribute 1088 bytes of its total 1384 bytes
> size. Initializing this much memory has a cost reported by Tavian
> Barnes <tavianator@tavianator.com> as about 2.5% when running `perf
> script --itrace=i0`:
> https://lore.kernel.org/lkml/d841b97b3ad2ca8bcab07e4293375fb7c32dfce7.1736618095.git.tavianator@tavianator.com/
> 
> [...]
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



