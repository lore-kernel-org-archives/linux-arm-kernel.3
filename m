Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E70DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 16:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QwB8FGCq3eCoQl3SKVpOQbv8DuiqoTDev9lDz7Av2U4=; b=hOpA/Yx5zQ3pslfNSOL0fmmaSJ
	gwY+4t419NmKHoYy7rY6LJ0rYDtTyPoGWX6ETd9dI6PbEIQTUHc69LaSBrW8rf3jTv0bHMJuFLBsU
	8G8m2oufAak6EUCB6Z/7fGHF+BLVbEw+xpZtIvgmVbTShZeINNoXIqdZ4myHrmWrelKTG2IoVKvyv
	/9BDJw5e9hvvuai6eltxbHeC8z1u/6JpLLX2ChdiG7fJjFr+m6w5zoK2/Hf81gxCEaFbrW5EIkM1/
	pgu3ctahl8VOmj5stXwrbcWXvZ1Uj5pQyZKfc5Vl/GoPi97x5KwJzoyxLK2dd5OTDzuVthDra4EhF
	f4i0la6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg2xO-00000008Ymn-1k6h;
	Sat, 04 Jul 2026 16:11:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg2xM-00000008Yme-3SW5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 16:11:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A76343900;
	Sat,  4 Jul 2026 16:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A297D1F00ACA;
	Sat,  4 Jul 2026 16:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783181463;
	bh=QwB8FGCq3eCoQl3SKVpOQbv8DuiqoTDev9lDz7Av2U4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oYAHUVAoFAGAcpfKtqekWqpffNDz+hwxnk5I3Q1D+I8295A3l8IX0I8eeft6zARIH
	 nXEMMi2/E8LXi0/uhHWh5ka3UTZjKQtAA8TrMHetqWarEX7JD7XJ+O6sPWOWfiN0QN
	 q5bgZqHULAuBgC8er0u1168POq/OWw8AJ+C5zM/uC69rSbeyzFjNXUSSQJ5VYQmgbc
	 xhS0detE1cmPOPS9UCv9o2m5+yFf084VPqSQoamEQvQOkNvv860gUdLhaml39nbHcr
	 1DU7HB8ZtzNbZAVo/zFFfhISkIfWzELg3koSx2NrrOa8whM8t0mgKpKgJ/VccbWL3A
	 EAHl58FPpeewQ==
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>, 
 Paschalis Mpeis <paschalis.mpeis@arm.com>, Amir Ayupov <aaupov@fb.com>, 
 Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, Leo Yan <leo.yan@linux.dev>
In-Reply-To: <20260702-b4-arm_cs_callchain_support_v1-v11-0-846abbf600d7@arm.com>
References: <20260702-b4-arm_cs_callchain_support_v1-v11-0-846abbf600d7@arm.com>
Subject: Re: [PATCH v11 0/9] perf cs-etm: Support thread stack and
 callchain
Message-Id: <178318146263.1194818.17858862135868990368.b4-ty@kernel.org>
Date: Sat, 04 Jul 2026 09:11:02 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
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

On Thu, 02 Jul 2026 20:51:35 +0100, Leo Yan wrote:
> This series adds thread-stack and synthesized callchain support for Arm
> CoreSight, which comes from older series [1] but heavily rewritten.
> 
> CS ETM previously kept last-branch state in a per-trace-queue buffer.
> That effectively makes the state per CPU, while the call/return history
> belongs to a thread. This series moves branch tracking to the common
> thread-stack code.
> 
> [...]
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



