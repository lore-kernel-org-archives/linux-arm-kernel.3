Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE46ED4336B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 14:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dQAd843ES3xmCieQuDm1lBdSMltEfLPQp2fdzWJf88=; b=qM27jxn76EhZgZTR2ls2LzDSdE
	uL/KarZr5z1KSXm5oTtif1vebprNt4/R96NUW21ISyWiEEh9ktge1USIoW2ZQEtxe8SFK3CvaCFYu
	G6C+34Pp4/BAwPgTzADoYh+Kroe9t/dPGKI4C+OdI130DYPAabJlceeCZwbUpiItxeJU3TUdAa+1W
	4fTHGCfNMi59RSix8m31fiIbpJiIi7KOiwcuJBCGXEJVeJKDjPKy9dU9mHpR6o95A8EodD6U2j5we
	qm+U8299DXIgcxpn0hxiyUt7tzw3U5T811fqZ1fSVsKvgfA0W9p5ZIBdYjzFK7ej8sXcFK7/kk29q
	FeWOWxNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t93iC-00000007JLy-0bV0;
	Thu, 07 Nov 2024 14:42:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t93gR-00000007JCk-2Ouk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 14:40:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BB64497;
	Thu,  7 Nov 2024 06:40:54 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEB613F6A8;
	Thu,  7 Nov 2024 06:40:23 -0800 (PST)
Date: Thu, 7 Nov 2024 14:40:18 +0000
From: Leo Yan <leo.yan@arm.com>
To: Steve Clevenger <scclevenger@os.amperecomputing.com>
Cc: namhyung@kernel.org, james.clark@linaro.org, mike.leach@linaro.org,
	suzuki.poulose@arm.com, ilkka@os.amperecomputing.com,
	coresight@lists.linaro.org, linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V10 RESEND 0/2] arm-cs-trace-disasm.py/perf must
 accommodate non-zero DSO text offset
Message-ID: <20241107144018.GB47850@e132581.arm.com>
References: <cover.1728599785.git.scclevenger@os.amperecomputing.com>
 <cover.1728599785.git.scclevenger@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1728599785.git.scclevenger@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_064027_678800_3F43CC49 
X-CRM114-Status: UNSURE (   8.52  )
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

Hi Steve,

On Wed, Nov 06, 2024 at 04:51:11PM -0700, Steve Clevenger wrote:

[...]

> Changes in V10:
>   - Removed errant space in patch file 0002. Passed 'git apply --check'
>     at perf-tools-next, 6.11.0-rc6.
>   - Added back missing prefixes.

The subject prefixes in two patches are not quite right.

The subjects would be:

  perf script python: Add map_pgoff to python dictionary
  perf script cs-etm: Adjust objdump start/end range per map pgoff parameter

With above change, you could keep my review tags.

Please use git commands to generate patches ('git commit --amend' and
'git format-patch').  If directly modify the plain patch files and resend
them, I suspect this is the reason that the archieve website messes up
rendering the patch series v9 and v10 [1].

Thanks,
Leo

[1] https://lore.kernel.org/linux-perf-users/cover.1728599785.git.scclevenger@os.amperecomputing.com/T/#t

