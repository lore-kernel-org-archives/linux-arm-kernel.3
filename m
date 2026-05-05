Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CF6FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1Q/i16vT4kHZC4qX7damR2u9RpeHx3gkxF3SAX6J/0=; b=IoIqrZ83idsnZwkagA7TRWP7Pa
	kbK+815DG85jVJzSME68Hv5AlCqX2tcvNfQ2KUAm3hcEp2kuHkg23QC9hwOnZGszAdk6NlRKM2JCK
	9UBNjfSR9ABRPEi+rgipD7ZbsxCcx2yEF34V644nZeZ4v5NVWn9z4TNZtSVXJGVQJSqptPAHWBd9+
	H4hAOqJp3Jqts+n6fdIFgaTA7DgIyk/D/tpOmsamaaMa3YppJG1yVvEo3wKlb7BcZgXmIi0ia42uy
	Hfuh+BQvguTzllKqlh4EPcpwtodgy3sHuMBiVkDSatKTm3EoHTN5bof9T22kJd0NUvgHzt3gmzjZF
	VZximJhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIUK-0000000GqyS-062N;
	Tue, 05 May 2026 16:19:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIUI-0000000Gqwr-0Rto
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:19:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48AC71C2B;
	Tue,  5 May 2026 09:19:02 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41F1C3F763;
	Tue,  5 May 2026 09:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777997947; bh=0FGci3zE/Iz+tnNnq/MJWTPU0O3SqHroJAcKL8EBw2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=my0HE1dJYtMJcmTfB2IP3Fi2ad+vPk24XOy1aJWhajcIpcYNeGp3nR9aXY0mMRQwB
	 jcnJeUyjXVV9N/bo03sDOOBcL3afSQYwSRkGgHy/kvLpc42HdWGLX+9kJApyuNvp18
	 olgXgI+RS5mqPpM//FdB6BVWwaEVL16Qqs2TaXOc=
Date: Tue, 5 May 2026 17:19:05 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v6 02/13] coresight: etm4x: fix underflow for nrseqstate
Message-ID: <20260505161905.GA3778514@e132581.arm.com>
References: <20260422132203.977549-1-yeoreum.yun@arm.com>
 <20260422132203.977549-3-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422132203.977549-3-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_091910_187029_B024F732 
X-CRM114-Status: UNSURE (   8.25  )
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

On Wed, Apr 22, 2026 at 02:21:52PM +0100, Yeoreum Yun wrote:
> TCRSEQEVR<n> is implemented only when TCRIDR5.NUMSEQSTATE is 0b100,
> in which case n ranges from 0 to 2; otherwise, TCRIDR5.NUMSEQSTATE is 0b000.
> 
> Therefore, drvdata->nrseqstate should be checked before entering the loop.

Since TRCSEQEVRn (n=0~2), to avoid confusion, we also need to rename
ETM_MAX_SEQ_STATES to ETM_MAX_SEQ_TRANSITIONS and define it as 3:

   #define ETM_MAX_SEQ_TRANSITIONS      3

Then we don't allocate 4 items but use only 3 of them.

Thanks,
Leo

