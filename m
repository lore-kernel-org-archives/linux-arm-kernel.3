Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D77ACD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNLt9eoA/Ea46A3rBLXbraF/YhSuUg6mumyDAMRL3F4=; b=z39+VW56YgCbTRkLf9KuR6zVfK
	SsW1GXQj/CsBDCkfpZzBNBq5fp0v16oPmNwBaMveYq31H3+UGOIdaKuG9iBUdW+LFJf4qxYH4ARYg
	JlqnlXCI6hntUR+Sw0LvQjjSA6VAEZwcs31QBIGWvkZgyiwWs3Hc33oK4NAKuzqGYVp8Xj1lC/TW8
	jW1r50BIIyFdiArBBvCv+9WHHmkZF3gxY0S5jFKH4A+BMoh1koZiBf95EpD6U76PIPCWNMsTnyhY6
	e8G0rwSs5KeYjHMyadnb0OaiadGgL/1BFkjXlH3BCeAaAACfY8YF0KjFjaEAgAqIs3V/sMeEG3LRm
	aM3nay0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNp1v-00000007vrK-3fC1;
	Fri, 15 May 2026 09:40:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNp1s-00000007vqP-1kHK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:40:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B480B43E91;
	Fri, 15 May 2026 09:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1258C2BCB0;
	Fri, 15 May 2026 09:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778838023;
	bh=upN5BjZU0ZFxJqHuEdTcT80edfTVaf1cATCLPEvpHDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dl/Zr9oIDEeC3TCM2/PwvfC+qNDD/WEGZNb9vzTD4bfmj+xRX+8m6VTOb2tVizliP
	 YrO8XlLAx1JWdnrYRU3DAdpwJ2+s4nosWnQUenY0fgI5q/NYDkSw68DUWd9GdcNCqd
	 XB3xsgMO7P2+cUF3MSIU3IzdzwAT1gT9vh8YEcEtfbAyeGKBGCvUf7W3y5AW/yyfZ7
	 pvACbTzCzDQUQPEG4BNTHRFzKPlmpmHbTuZqNlUc6fHaHlpl60dtrQUXCbCBiOVmMh
	 uQLHa1OFrezIbhmhu2OtNZMIAorS1sW5UBzlsUAQWhmwEIJWcdgLR2fxcyyvtVjh3F
	 cSwEJPvN6hzHQ==
Date: Fri, 15 May 2026 10:40:20 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jamie Nguyen <jamien@nvidia.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] firmware: arm_ffa: honor descriptor size in
 PARTITION_INFO_GET_REGS
Message-ID: <20260515-quixotic-active-dragon-2ee2c6@sudeepholla>
References: <20260513032800.68807-1-jamien@nvidia.com>
 <20260514-generous-undetectable-mastiff-cc43d3@sudeepholla>
 <27E42CCD-8518-4802-B549-A79B94B5658A@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27E42CCD-8518-4802-B549-A79B94B5658A@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_024024_500577_8D57B0DA 
X-CRM114-Status: GOOD (  29.31  )
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

On Thu, May 14, 2026 at 05:37:41PM +0000, Jamie Nguyen wrote:
> 
> 
> > On May 14, 2026, at 2:31 AM, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> > 
> > On Tue, May 12, 2026 at 08:28:00PM -0700, Jamie Nguyen wrote:
> >> __ffa_partition_info_get_regs() walks the response with a hardcoded
> >> 24-byte stride (regs += 3) even though the SPMC tells us the actual
> >> per-descriptor size via PARTITION_INFO_SZ in x2[63:48]. The size is
> >> read into buf_sz and then thrown away.
> >> 
> >> That works while every SPMC returns the FF-A v1.1 layout, but it falls
> >> apart against a v1.3 SPMC returning the 48-byte descriptor. The loop
> >> strides over half a descriptor at a time and ends up parsing every
> >> other entry from a slice of two adjacent ones.
> >> 
> >> The FF-A spec (v1.2, section 18.5) says that the producer should
> >> report the descriptor size, and the consumer is supposed to stride by
> >> that size and ignore any trailing fields it doesn't understand. The
> >> non-REGS path (__ffa_partition_info_get) does this already, and the
> >> REGS path should match.
> >> 
> >> Use buf_sz for the stride, and bail out with -EPROTO if the SPMC
> >> reports something we can't safely walk.
> >> 
> >> Fixes: 7bc0f589c81d ("firmware: arm_ffa: Fix big-endian support in __ffa_partition_info_regs_get()")
> >> Signed-off-by: Jamie Nguyen <jamien@nvidia.com>
> >> ---
> >> drivers/firmware/arm_ffa/driver.c | 35 ++++++++++++++++++++++++++++---
> >> 1 file changed, 32 insertions(+), 3 deletions(-)
> >> 
> >> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> >> index c72ee4756585..b712e8a03dab 100644
> >> --- a/drivers/firmware/arm_ffa/driver.c
> >> +++ b/drivers/firmware/arm_ffa/driver.c
> >> @@ -321,6 +321,22 @@ __ffa_partition_info_get(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
> >> #define PART_INFO_ID(x)		((u16)(FIELD_GET(PART_INFO_ID_MASK, (x))))
> >> #define PART_INFO_EXEC_CXT(x)	((u16)(FIELD_GET(PART_INFO_EXEC_CXT_MASK, (x))))
> >> #define PART_INFO_PROPERTIES(x)	((u32)(FIELD_GET(PART_INFO_PROPS_MASK, (x))))
> >> +
> >> +/*
> >> + * FF-A v1.2 section 13.9 Table 13.40: registers x3..x17 carry the partition
> >> + * descriptors, i.e. 15 u64 of payload per FFA_PARTITION_INFO_GET_REGS call.
> >> + */
> >> +#define FFA_PART_INFO_REGS_PAYLOAD_U64	15
> >> +
> >> +/*
> >> + * FF-A v1.1 partition information descriptor (FF-A v1.2 section 6.2.1
> >> + * Table 6.1): id (2) + exec_ctxt (2) + properties (4) + UUID (16) = 24
> >> + * bytes. This is the minimum size the SPMC must report; the kernel reads
> >> + * exactly these fields and ignores any trailing ones per the forward-
> >> + * compatibility rules in FF-A v1.2 section 18.5.
> >> + */
> > 
> > I can't see any such details is the above mention version and section.
> > Can you confirm you are looking at [1] ?
> 
> Yes, I am looking at [1].  The size field and the rule are in two
> different places:
> 
>       - Section 13.9 Table 13.40, page 188:
>           x2 Bits[63:48] = "Size in bytes of each partition information
>           entry descriptor."
>         (read into buf_sz today and discarded)
>

Sorry my bad, I was looking at Section 18 and was confused a bit.

>       - Section 18.5 page 264 rule 4:
>           "A consumer of this data structure uses the size corresponding
>            to the Framework version it implements to consume only fields
>            defined in its version. Additional fields in the producer's
>            version of this data structure are safely ignored enabling
>            forward compatibility."
> 

Now makes sense, was just looking at this w/o reading Section 13.9

>   If you agree, I'll rebase against linux-next and send a v2.
> 

Yes please. Thanks for your patience.

-- 
Regards,
Sudeep

