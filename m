Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0068CF8860
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 14:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDrMTPcV2E6KdklsKs4VanAa6fRG4s/XDQVULNrWOhY=; b=h54OACZjclfRzpzt0fVFozA7LY
	QNUFokgpnpHrzqsYz6yHmI4D8tee83988fz5DYkbJ2RHGMpGXAZXmS30AM/1EuKl+mg6nc2wnh//5
	IVcyAQW5oF0ug6eePXdFu6JB0GZKgecDfTWd2tHsODYRpZg03DNXastFIxkZBwEL/r5kwZ4NpSvY2
	4a7rOEeGyQ56oxvmYMnktZ4nhej3/vEDlRpkSdgu8HYLv24Qz0tPOJ9tei5CoouzquRU7jBvXVDkd
	K8HwTDl5Sq2eC0NoCE0dn21MZAXQ+VW+ts8A2QQC8f/CdA4JziwiqXFjHBsgsZhYeC0CeMbgv3Gv2
	4s/ftqng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5UR-00000006pGH-1EZj;
	Thu, 20 Nov 2025 14:18:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5UP-00000006pFW-0xz2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 14:18:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A03C5339;
	Thu, 20 Nov 2025 06:18:16 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C40EF3F740;
	Thu, 20 Nov 2025 06:18:23 -0800 (PST)
Date: Thu, 20 Nov 2025 14:18:21 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Mike Leach <mike.leach@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 03/13] coresight: Refactor
 etm4_config_timestamp_event()
Message-ID: <20251120141821.GA724103@e132581.arm.com>
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
 <20251118-james-cs-syncfreq-v5-3-82efd7b1a751@linaro.org>
 <CAJ9a7VhYaU=kAtvZtSnkj-9OicCWwqYQBX4Q3zDtCay-8=Y7Cg@mail.gmail.com>
 <4090a47c-2208-486b-bd96-47518d7aa90c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4090a47c-2208-486b-bd96-47518d7aa90c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_061825_328077_68231F83 
X-CRM114-Status: GOOD (  20.28  )
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

On Thu, Nov 20, 2025 at 01:52:03PM +0000, James Clark wrote:

[...]

> > > +       config->cntr_ctrl[ctridx] = TRCCNTCTLRn_RLDSELF |
> > > +                                   FIELD_PREP(TRCCNTCTLRn_RLDSEL_MASK, ETM_RES_SEL_FALSE) |
> > > +                                   FIELD_PREP(TRCCNTCTLRn_CNTSEL_MASK, ETM_RES_SEL_TRUE);
> > > 
> > 
> > So if we define generic event generators:-
> > 
> > #define ETM4_SEL_RS_PAIR BIT(7)
> > #defiine ETM4_RS_SEL_EVENT_SINGLE(rs_sel_idx) (GENMASK(4:0) & rs_sel_idx)
> > #define ETM4_RS_SEL_EVENT_PAIR(rs_sel_pair_idx) ((GENMASK(3:0) &
> > rs_sel_pair_idx) | ETM4_SEL_RS_PAIR)
> > 
> > these are then reuseable for all registers that need the 8 bit event
> > selectors, beyond just this register.
> > 
> > Thus we now accurately define the fields in the TRCCNTCTLRn
> > 
> > #define TRCCNTCTLRn_RLDEVENT_MASK  GENMASK(15, 8)
> > 
> > and use
> > 
> > FIELD_PREP(TRCCNTCTLRn_RLDEVENT_MASK,
> > ETM4_RS_SEL_EVENT_SINGLE(ETM_RES_SEL_FALSE))
> > 
> > etc.
> > 
> > 
> 
> I'm not sure I agree with that, the Arm ARM has CNTEVENT_TYPE as a regular
> bit in the TRCCNTCTLRn register so it should be set like any other. Hiding
> it as a subfield of "EVENT" when it always exists and always does the same
> thing was maybe seen as a bad decision which is why it was updated?
> 
> Also IMO, beyond using labels instead of raw numbers, the code should just
> show what's programmed into the register. ETM4_RS_SEL_EVENT_SINGLE() would
> be one more macro to jump through to see what's actually happening.

Maybe define a general macro but with extra checking:

  #define TRCCNTCTLRn_RLDEVENT_MASK  GENMASK(15, 8)

  #define ETM4_RS_SEL_EVENT(paired, sel) ({  \
      if (paired)                            \
          assert(!(sel & ~GENMASK(3, 0)));   \
      else                                   \
          assert(!(sel & ~GENMASK(4, 0)));   \
      FIELD_PREP(TRCCNTCTLRn_RLDEVENT_MASK,  \
                 ((paird << 7) | sel));      \
  })

Thanks,
Leo

