Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60779CF58C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 18:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AEZMfQTq+ouhC1k+UjJDuvou9KJW8Ujzl1m3AOYIpIo=; b=qFAro978LK+kTmH7ZN5cNiTpGC
	/Wufh7Nb3WKNBoKjnq4bAuwUU2MVgpvY2QIVb0QgJSsVGYvpqCzGn1/IWNrPEOMjcaKV42iG+YSKa
	/lPg5SWp9vh0yczA4gT9gXF6kia1rJ76I0xCoK5nKXPQSivJLCNxq6xqKuj+xW63p29EJuUPF2vEi
	HhBfRlFnzEk775Ie+ztFZ05ZHtV36z+sgBgEux9WGBI2uau2xBmA6OJhVOmWKEP3inrE67LaTIoI7
	W30QoxvoGUAAlvkZdaL30O8N0BW61xpePpz6VrLsv1RwVFVDnoaSMX8jLO3is2LWPDuNZgxe2LDhM
	5vrwU61w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmdt-00000004RwX-0kbE;
	Wed, 19 Nov 2025 18:10:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmds-00000004RvV-07s5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 18:10:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 18D296019F;
	Wed, 19 Nov 2025 18:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 628AFC4CEF5;
	Wed, 19 Nov 2025 18:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763575854;
	bh=thAoQXPWlRcAg2sv0bwCR2R0jc757B9rzQhplUIw8Pc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VS+LHCwuBlxvJ0bl2a6iCHFRRewgu2a4r+PWRbMJZlinQTrhfTClumsbE9uyGBjiK
	 b6QOk8qOW4ltpNpsbau/a0xlPwJvWdzLVlKkGwtVdukj0IyVFO3wOgFReRvMP5evXo
	 XNPCbC99TEuO0PHURm8ylXluT/t3hlJE0Eo9MHf3iwluRTIUSURlobaQf/JLPWFV8O
	 MucxSH/4ACDIB/6ppjxNhUsaFzEDQQXsE7kP5FzBM/qfoTl7sC+g7KIV2WdmryxYV3
	 4Tihct0P62hR+uytFK0ATZMu1dEnZazjzTzl98GDZVJTi19LLrER4dVRnMzCC8jInc
	 JjrU8/beWf6cQ==
Date: Wed, 19 Nov 2025 10:10:51 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Leo Yan <leo.yan@arm.com>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/25] perf arm_spe: Extend operations
Message-ID: <aR4IK-3rcbdbv2Er@google.com>
References: <20251112-perf_support_arm_spev1-3-v3-0-e63c9829f9d9@arm.com>
 <CAP-5=fXiiWRDPzONNNZQZc4QOBQoz=kRnJq77on5r4w9aDx-XA@mail.gmail.com>
 <aRrM2y4O_3aaa2Ee@google.com>
 <ed4a5e23-f2f0-4f02-8b0a-e97329cb313f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed4a5e23-f2f0-4f02-8b0a-e97329cb313f@linaro.org>
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

On Tue, Nov 18, 2025 at 10:23:57AM +0000, James Clark wrote:
> 
> 
> On 17/11/2025 7:20 am, Namhyung Kim wrote:
> > Hello,
> > 
> > On Thu, Nov 13, 2025 at 09:01:47AM -0800, Ian Rogers wrote:
> > > On Wed, Nov 12, 2025 at 10:24 AM Leo Yan <leo.yan@arm.com> wrote:
> > > > 
> > > > This series enhances tooling to support new operations:
> > > > 
> > > >    - Support for MTE tag since Arm SPE v1.3;
> > > >    - Support for Advanced SIMD extension and SVE operations;
> > > >    - Support memcpy, memset and GCS operations;
> > > >    - Support extended operations for atomic, Acquire/Release and
> > > >      Exclusive instructions.
> > > >    - Enhance the data source for associated info, like floating-point,
> > > >      conditional, data processing, etc.
> > > > 
> > > > This series is divided into three parts:
> > > > 
> > > >    Patches 01 ~ 06: Support raw dump for new operations;
> > > >    Patches 07 ~ 17: Export the operation info into records, so that the
> > > >                     information can be later consumed by samples.
> > > >    Patches 18 ~ 25: Set the operation info into sample's data source and
> > > >                     SIMD flag, and updated the document.
> > > > 
> > > > This patch series is tested on FVP for native parsing and x86_64 for
> > > > cross parsing.
> > > > 
> > > > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > > 
> > > Reviewed-by: Ian Rogers <irogers@google.com>
> > 
> > Can I get some comments from ARM folks?  I think I can merge part 1 and
> > 2 before changing the kernel interface.
> > 
> > Thanks,
> > Namhyung
> > 
> 
> Reviewed-by: James Clark <james.clark@linaro.org>
 
Thanks, applied the patch up to 17 to perf-tools-next!

Best regards,
Namhyung


