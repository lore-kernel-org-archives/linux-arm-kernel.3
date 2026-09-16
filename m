Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155C4C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 10:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zn63cm/mRTcrEP1XbNHHeSVGm3J5bUYZLy6K+aCa8t4=; b=wUcGXfbDemlKKFZXQrB7GEdCKB
	B6hP30WYdmjtPuDQ+yisAAkWhKYRvXHf8cwmG1mGhHxdI2/AVmc4ejFJducURw6Q7gaX+5PsDJhR9
	EF93YvEiO5EpKcWORFENaWGNlEWldkiaVVRJin9Yt9Sj4sy4c0Zx2Z3DYSMnM/J97/qr8aVOyBOjn
	oYWU9+SsYR5ETuYB5sYW0ddXZDAv6EOySpRIG5Thtm41qi/soyJPvKtofSCYMNKB427hgRs2Miqjb
	D1YSUsLeYi70Nh0d/7IT7HJgKibiGaqHrf5x8HegPGmltNKuMBemr6ayFue6PLUPwQCcN4nqtfPqP
	ZGRTaIcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6muf-00000008yfX-24Ti;
	Wed, 16 Sep 2026 10:30:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mud-00000008yf5-0POi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 10:30:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 115FD152B;
	Wed, 16 Sep 2026 03:30:41 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D2073F882;
	Wed, 16 Sep 2026 03:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789554644; bh=zn63cm/mRTcrEP1XbNHHeSVGm3J5bUYZLy6K+aCa8t4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y/cNdbP3zllaWYF53BXFM/UbYsHBifjobDxKZbicVgR4+d3X/zvvao5hrk6LDfPjJ
	 ywtt3Is2/VDNoihyEoLO+4Py2hp1bcBD8fS+gENV1YRFDg4jrMj2VfAv87fA9/WnnH
	 X5MCrHsjV6B6nLaQ2LVHGCYi/LDX4jOef4I7PSck=
Date: Wed, 16 Sep 2026 11:30:42 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	kernel@oss.qualcomm.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] coresight: handle runtime PM resume failures
Message-ID: <20260916103042.GH200420@e132581.arm.com>
References: <20260911-b4-coresight-runtime-pm-failures-v1-1-acdf49756e11@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-b4-coresight-runtime-pm-failures-v1-1-acdf49756e11@qti.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_033047_402205_4549EF92 
X-CRM114-Status: GOOD (  10.09  )
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

On Fri, Sep 11, 2026 at 03:28:52AM -0700, Yuanfang Zhang wrote:

[...]

> Replace the remaining pm_runtime_get_sync() calls with
> pm_runtime_resume_and_get(), which restores the runtime PM usage count
> when resume fails. Abort before accessing hardware and propagate the
> error to the caller.

The change makes sense to me.

> In coresight_get_ref(), unwind the module and device references.

Sashiko reported a pre-existing issue where the callers don't handle
errors returned by coresight_get_ref() [1]. In this case, we need to
remove nodes from path->path_list and release them. However, this
should be done in a separate patch.

[1] https://sashiko.dev/#/patchset/20260911-b4-coresight-runtime-pm-failures-v1-1-acdf49756e11%40qti.qualcomm.com

> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>

Thanks for the fix! Feel free to add:

Reviewed-by: Leo Yan <leo.yan@arm.com>

