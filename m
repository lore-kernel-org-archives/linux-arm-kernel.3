Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB83C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 15:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=io7fziVF0EDiJceoQQ23O8K+4Z5fhxhO3oQyipBc12U=; b=0VcD/Nd9DqjVk1B7i42p0MplXt
	sN8atV9CjPsPVkrCNNLRzYADpImOZuXWFVhtyUI8DSsvEVtWVUkSdU4sfqMNN88MsJtDxtQggOLk2
	dOZyai4tz8RPc6oEQ/dx6W5x8746lqzfBUPVaIQGNOyTblYRFITOmnq0EGBG7d7NcmlZbV8JWtABp
	tQ8TOGwhywfz5WoFyrE6gfbHI/Ktc1MNzGuTb+NV91URkD4X4+p/UPyr07oVbCq5z8H9U7FU0cFh6
	MAfVXPG+0XCPV99KKlFSZX7ev2A0SKm5+pS01Og24wGkP58jINNhWgvBZYTab/SgC/iwLyQrT3Bcr
	eG82X2Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgP1T-00000009SPT-3UR8;
	Sun, 05 Jul 2026 15:44:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgP1R-00000009SOw-3D33
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 15:44:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9676E1D6F;
	Sun,  5 Jul 2026 08:44:36 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 880F83F85F;
	Sun,  5 Jul 2026 08:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783266280; bh=fQRjZa+S6Xi4bdBWEAt7FeBg9kKZ3+ndjEKF5cmPHI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FuaHMpLNu43wurjTvtxwwOOHAXtbuv6ityFN4KpZ96sYeTxyVgh7SUBsMrHrNgsIz
	 BeY6TEBFeo0INWLRxcBlM/yUgRiQpSHbp1CQgW2elJbs/jlWAEdWpianencZSbKkfN
	 IsrqB0VbIH5z59QsRNV7UUp3uh6FTVCzVb9Oqh9I=
Date: Sun, 5 Jul 2026 16:44:38 +0100
From: Leo Yan <leo.yan@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, ilkka@os.amperecomputing.com
Subject: Re: [PATCH 3/5] perf/arm-cmn: Refactor event filter data
Message-ID: <20260705154438.GA710301@e132581.arm.com>
References: <cover.1782830759.git.robin.murphy@arm.com>
 <d638212f5a5993eae5e262dd5be596b8d2b8fa5f.1782830759.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d638212f5a5993eae5e262dd5be596b8d2b8fa5f.1782830759.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_084445_933004_5556DF8E 
X-CRM114-Status: UNSURE (   9.02  )
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

On Tue, Jun 30, 2026 at 04:19:18PM +0100, Robin Murphy wrote:

[...]

> +struct arm_cmn_filter_attr {
> +	enum cmn_filter_select sel;
> +	u8 val;
> +};

> -#define _CMN_EVENT_ATTR(_model, _name, _type, _eventid, _filter, _fsel)\
> +#define _CMN_EVENT_ATTR(_model, _name, _type, _eventid, _filter, ...)	\
>  	(&((struct arm_cmn_event_attr[]) {{				\
>  		.attr = __ATTR(_name, 0444, arm_cmn_event_show, NULL),	\
>  		.model = _model,					\
>  		.type = _type,						\
>  		.eventid = _eventid,					\
> -		.filter = _filter,					\
> -		.fsel = _fsel,						\
> +		.filter = {{_filter}},					\

This patch might break as the "val" field is never initialized. Should
it use two parameters "_fa, _fb" instead?

#define _CMN_EVENT_ATTR(_model, _name, _type, _eventid, _fa, _fb, ...) \
      (&((struct arm_cmn_event_attr[]) {{                              \
              ...                                                      \
              .filter = {{_fa, _fb}},                                  \

Although the issue is fixed by a later patch, I think it is good to
correct this patch for bisection.

Thanks,
Leo

