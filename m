Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA40CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 11:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Aav8vC1kBiZLSytXBOY1Hp59IeN1c9jlZTiIehRe9g=; b=e7b9rMOkzr9gxR6ykyeTYawsHt
	kKAn/WZlqcjw8Wiqu5S0xmwmiwx4TPSlO5Lo9OtRgs5yKpr3YvSlIOzUU6ApDakegZnmp+FHbihEj
	fXDrxDHayjiwNO3v+KDksjZb+zSJzyTYSlKlF+tMfTi6VhIvm8i1or8JbyjiSIZ52DchEeHt/pyX4
	Q+sNDdvlZC5smRpnEasDfkMVgCvXi/t+tB+AOE1cKB6uCyi5B6rbhlokTMQ3J0LX+bwTTMcnkSECd
	q2jHcIyODUSgXsymaw2olsd7v/w2X00B8VAub2483NmEc/UT3dzc7CF3Sx4FmWahiMF8v/pTuF76H
	m0ntMxwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqRS-000000088kg-3TuH;
	Fri, 15 May 2026 11:10:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqRQ-000000088jr-1Ag0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 11:10:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B37C22FC;
	Fri, 15 May 2026 04:10:44 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AA993F85F;
	Fri, 15 May 2026 04:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778843449; bh=a22gACOL+4o9LB9ZYMEhdwcOlUOLQoOvT1cPJ/bW5i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eDagEWBeUxnhn4JedIAUBQZ5fOJdr7ZAYVL4QjdrQM3OtN2tZrn2vEGyBKGO+Oxws
	 RXW1qRglKr5kSy6uWVZrA140Dgj2Mes0d2txNzrF/0xX/U2thFC2jkVb6C8u8CPPf6
	 nYWrgsgDvcZNoGMu0MA89HnXVZq+/XvpKGJTxErs=
Date: Fri, 15 May 2026 12:10:45 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v6 02/13] coresight: etm4x: fix underflow for nrseqstate
Message-ID: <agb/NdYS/2jXdog0@e129823.arm.com>
References: <20260422132203.977549-1-yeoreum.yun@arm.com>
 <20260422132203.977549-3-yeoreum.yun@arm.com>
 <20260505161905.GA3778514@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505161905.GA3778514@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_041052_773466_E6BF1F0D 
X-CRM114-Status: GOOD (  12.60  )
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

Hi Leo,

> On Wed, Apr 22, 2026 at 02:21:52PM +0100, Yeoreum Yun wrote:
> > TCRSEQEVR<n> is implemented only when TCRIDR5.NUMSEQSTATE is 0b100,
> > in which case n ranges from 0 to 2; otherwise, TCRIDR5.NUMSEQSTATE is 0b000.
> > 
> > Therefore, drvdata->nrseqstate should be checked before entering the loop.
> 
> Since TRCSEQEVRn (n=0~2), to avoid confusion, we also need to rename
> ETM_MAX_SEQ_STATES to ETM_MAX_SEQ_TRANSITIONS and define it as 3:
> 
>    #define ETM_MAX_SEQ_TRANSITIONS      3
> 
> Then we don't allocate 4 items but use only 3 of them.

TBH, the number of transition is determinied by the MAX number of
SEQ_STATE that's why I think define the ETM_MAX_SEQ_TRANSITIONS with

     #define ETM_MAX_SEQ_TRANSITIONS (ETM_MAX_SEQ_STATE - 1)

and uses ETM_MAX_SEQ_TRANSITIONS for the TCRSEQEVR and seq_ctrl.

Thought?

-- 
Sincerely,
Yeoreum Yun

