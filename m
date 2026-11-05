Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B3E606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 18:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LFq+JfNT;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=IX9/1ZIJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gT9TJ0AroGbdxZ4bmFkZaRdEQ2S7wKcPpVq8sxpoWPo=; b=LFq+JfNTE1V8YDv86AeyFvgWea
	rmRoQBosuo83iNwlfuVAL81LUzGHIWS3dOzw7RLJYkFlV4AU+CTcBlO3a2xlbKmLbrKrxFfN5Vo8k
	lPlupUQGSiGV1TrQefx2l/lWT/kSg2XVSrO8esNfbdG0PIJIeibEERK3kAdxDhcN2g0ULgen3XRuP
	nEdSMNY5k+W1uuJSliRa1qywWy/DwcUTpMKI1LMqD27IvGXiwZ/Ib/qUJh0J9I69AdobVsJEBsvOV
	5jY9ZZuqbfyhm3nBTqwF16Y8CD64zhuDmajyyIwxMdkZnBQ9HiwNrPYR+8CpJBbGkAUAe0g+Zv5ZN
	UgkfAMhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2CG-0000000A8NV-0e8y;
	Thu, 05 Nov 2026 18:28:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2C8-0000000A8MW-1gTK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 18:28:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C1CB168F;
	Thu,  5 Nov 2026 10:28:12 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F15963F632;
	Thu,  5 Nov 2026 10:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793903295; bh=Rrkg8DlYAdb9o/4arm7DveLAh4LnWcq3U2R3LPjPA54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IX9/1ZIJKn3cK3ohxV9U4xGE9+NOHDnlMbuM9Y2d3akzE15HCuiAghZqr0swE2jJy
	 JZTdCiRq5woVotgOX1SiqumUsf4iSf9fMPgbKSEysjCUh2Uz7o/Bo8sR5ATlElg+xM
	 QLDcSX+88bMCUYEUS9W230Ely0gArIrFVhW8Q8/g=
Date: Thu, 5 Nov 2026 18:28:07 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	sudeep.holla@kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
	philip.radford@arm.com, david@kernel.org,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v14 01/32] firmware: arm_scmi: Add new SCMIv4.0 error
 codes definitions
Message-ID: <auzKt0tDdn2Kt-vb@pluto>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
 <20261016185553.2794459-2-cristian.marussi@arm.com>
 <20261019133436.000035ae@oss.qualcomm.com>
 <auy0ar-fio9m7EbV@pluto>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auy0ar-fio9m7EbV@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_102816_579865_92051270 
X-CRM114-Status: GOOD (  23.66  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 04:52:58PM +0000, Cristian Marussi wrote:
> On Mon, Oct 19, 2026 at 01:34:36PM -0700, Jonathan Cameron wrote:
> > On Fri, 16 Oct 2026 19:55:22 +0100
> > Cristian Marussi <cristian.marussi@arm.com> wrote:
> > 
> 
> Hi,
> 
> thanks for your feedback, sorry for my generally delayed replies but I
> am drowning in Sashiko reports :P
> 
> > > SCMIv4.0 introduces a couple of new possible protocol error codes: add the
> > > needed definitions and mappings to Linux error values.
> > > 
> > > Note that SCMI_PARTIAL_ERROR has to be handled specially, so it needs to be
> > > distinguishable.
> > > 
> > > Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > 
> > > ---
> > > v12 --> v13
> > >  - use EBADMSG to map SCMI_PARTIAL_ERROR
> > That's a stretch given definition but I looked back at: 
> > 
> > https://lore.kernel.org/all/arK7kLlrg491EsMf@pluto/
> > and appreciate the problem of running out of error codes..
> > 
> 
> Yes indeed it is not ideal BUT I crawled back and forth through errno.h
> and I could not find anything better.
> 
> > Guess it is the best we can do,
> > Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> > 
> > If you do a v15, maybe capture some reasoning in the change
> > log or the patch description itself.
> 
> Yes I will...soon there will be a v15.

...btw...forgot to say that all the SCMI errors definitions and machinery
above will be split next into a dedicated internal header in the next v15
because needs to be accessible by protocols and common.h is huge..

Thanks,
Cristian

