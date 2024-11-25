Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65DED58094
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 12:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j31QpgYkMwRfIDmBSIKwiYoQOk5xxXQgXhenRSn2vl4=; b=QioWpZOFfyepGYc4NZPcwOOqsm
	t7R0nwtLREXeQZg8T0rU5DirXIU2fgniP01+wHl2A3EgeJ317D2tPcjK6i1NV9AzYHUaP7VR7dRnm
	OBggX01Ca6jc4DD39a/mLIWZFgpL+ypJcQFdnbJoCnb8wS/2Xn8+LFuh93iSDe2gl4izBlkrxHr3d
	DqZ13lN2KpebYsDXjTJ+YpdaF1uXXKxxJTvLEgB/57fiMG8yLnr5sMt9EQ/SxsQPIDQaVxDLJXguA
	xow5ZY/BsCrmdYv0XZC9FMjhFYeTcUSyeHqNx6JzP7JyX+XYtLWLO1qsxjRfbpt0WvsJ+DdmEPtHZ
	eX3s/cFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFYZa-000000082XI-13a6;
	Mon, 25 Nov 2024 12:52:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFYYc-000000082Qh-46aQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 12:51:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7DC7E5C5977;
	Mon, 25 Nov 2024 12:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D918DC4CECE;
	Mon, 25 Nov 2024 12:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732539072;
	bh=lL1pzJTJrsl5S8uCJZ6H18Rb7qtHU1zVpOtDA+BLHPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YrPymnv94rBJrNghmVERbLc5IwcUUEZwv045XKUU1q7U4sK80axXF1mdnzw2U/Na2
	 mUHzWYiehMD9vG7b4Zn97ZEB01C9JxCKNJIW7INWYwNakq692DLlbrP42hG11tEFtS
	 5huF/Oj+dgWFaTgoBGWnvU5JjiYnLzSEFWrJSfx+AItiJBCvXRgbkUkxrL73gZwFjR
	 O7RUpzlOpUGh0ufQDbIQ/SQx5TEuckjedXVihBPOa26Obj/iF7xJTign4EBHFFThZZ
	 M/gqA5HR6ybRLrhAotswuNSRb4oiOxEXmEJNqRs42YBbBCv/UGAjh6IwnRqURqJA1d
	 Zzd+ntes+Bzyg==
Date: Mon, 25 Nov 2024 12:51:07 +0000
From: Will Deacon <will@kernel.org>
To: Chun-Tse Shao <ctshao@google.com>, catalin.marinas@arm.com
Cc: linux-kernel@vger.kernel.org, Greg Thelen <gthelen@google.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Tuan Phan <tuanphan@os.amperecomputing.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] perf/arm-smmuv3: Fix lockdep assert in ->event_init()
Message-ID: <20241125125106.GA858@willie-the-truck>
References: <20241108050806.3730811-1-ctshao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108050806.3730811-1-ctshao@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_045115_058038_3DEF6A2E 
X-CRM114-Status: GOOD (  12.37  )
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

On Fri, Nov 08, 2024 at 05:08:05AM +0000, Chun-Tse Shao wrote:
> Same as
> https://lore.kernel.org/all/20240514180050.182454-1-namhyung@kernel.org/,
> we should skip `for_each_sibling_event()` for group leader since it
> doesn't have the ctx yet.
> 
> Fixes: f3c0eba28704 ("perf: Add a few assertions")
> Reported-by: Greg Thelen <gthelen@google.com>
> Cc: Namhyung Kim <namhyung@kernel.org>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Tuan Phan <tuanphan@os.amperecomputing.com>
> Signed-off-by: Chun-Tse Shao <ctshao@google.com>
> ---
>  drivers/perf/arm_smmuv3_pmu.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Catalin -- please can you pick this up for -rc1?

Will

