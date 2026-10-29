Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A02606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 16:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KwJ3sbXy;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nN6JY19m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SVlNIJ0m9KSL5RpU3jpMg6g2yP/IAuLk6Q6u60owZeI=; b=KwJ3sbXys/oFvP/A1ff/88h9B9
	cPz6G+w9RvkIKdIcpG9h5qQFGxy0SD9fdH+ose8u6bL6rgC9D8P54klNIyaFxwDsS1xMBRbcLtIvw
	+WE5UQWTqItj8irVGkS58R85TIrDLCLOZBG52FJfPpkhSy7hi6lGmHvTwyhEfMUblJtEGLPJmWsje
	edByZTrO6Wsm2CUB7uZK3FOHbCE+XSKdmuiQln2znp6YbOK4D4t0aSNlrOn4sy5zTWzOrB/G5/ZzZ
	17gwe7livaSFOeYHhzhBVv0fo4BqpbMmD6PZoqTAUX1XciqUtlw2uonRl14r4i5dZhbI0F9dBgcxj
	r31Ug0Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSzN-00000009nEu-3oLJ;
	Thu, 29 Oct 2026 16:28:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSzL-00000009nEV-3fZT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 16:28:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 398CD1682;
	Thu, 29 Oct 2026 09:28:21 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6CF83F673;
	Thu, 29 Oct 2026 09:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793291304; bh=IlWKCr8cNX3eq8NiYg9hKE4gBjr06Z9/SknZ4Ts7Dxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nN6JY19mfyUMqvluRTYDrKSmxGyf23n6H2G/YVGdfW8NXXJ2J1wnrs7Umo+RKtKzL
	 09W89bxYqPu/lm7kLuFKY9M5R6uriETsId7sDuSOFf9hNZGtVCiASjdsMGXUXzmKzP
	 0F9FMrok57JscYGM7QjbqyCCYCB7beymYG2bAgsE=
Date: Thu, 29 Oct 2026 16:28:21 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mike Leach <mike.leach@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Subject: Re: [PATCH v2 05/14] perf cs-etm: Use the recorded instruction size
 for A32 and A64
Message-ID: <20261029162821.GB9176@e132581.arm.com>
References: <20260923-perf_cs_etm_fix_non_taken-v2-0-6ab8c07a5455@arm.com>
 <20260923-perf_cs_etm_fix_non_taken-v2-5-6ab8c07a5455@arm.com>
 <3852b153-9be1-4ab4-803e-cb8a6de34879@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3852b153-9be1-4ab4-803e-cb8a6de34879@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_092827_959094_E8D96402 
X-CRM114-Status: GOOD (  21.21  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Sep 29, 2026 at 02:55:28PM +0100, James Clark wrote:
> 
> 
> On 23/09/2026 16:21, Leo Yan wrote:
> > Use packet->last_instr_size in cs_etm__instr_size() instead of a
> > hard-coded value, allowing the decoder to supply the instruction size.
> > 
> > Keep per-address decoding for T32. A range can mix 16-bit and 32-bit
> > instructions, so last_instr_size describes only the final instruction
> > and cannot determine the size at an arbitrary address in the range.
> > 
> > Assisted-by: Codex:gpt-6
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >   tools/perf/util/cs-etm.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> > index 2d1ab34f7b6b5a6331005c16c6a418d123c815eb..0163d93ac2d537a2190536e77d24628b4d707751 100644
> > --- a/tools/perf/util/cs-etm.c
> > +++ b/tools/perf/util/cs-etm.c
> > @@ -1358,8 +1358,7 @@ static inline int cs_etm__instr_size(struct cs_etm_queue *etmq,
> >   	if (packet->isa == CS_ETM_ISA_T32)
> >   		return cs_etm__t32_instr_size(etmq, tidq, packet, addr);
> > -	/* Otherwise, 4-byte instruction size for A32/A64 */
> > -	return 4;
> > +	return packet->last_instr_size;
> 
> Why not use last_instr_size for CS_ETM_ISA_T32 too?

T32 needs per-address decoding because a range can mix 2-byte and
4-byte instructions.

> I'm wondering how and when this change actually makes a difference?
> last_instr_size isn't any better than '4' for any instruction in the
> range other than the last one, so it's not clear what the issue is.

It prepares for the later patch that synthesizes exception entries
separately, where an exception packet can carry last_instr_size = 0.
Preserving that zero avoids advancing the reconstructed return address
by four bytes.

I will update the commit message for this.

Thanks,
Leo

