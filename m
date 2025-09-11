Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DD5CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 16:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6XjKkezdj8Z3Y1gALJMdspVbPepv5OIpfHOCKq54XY=; b=Kj9bxLWnrdyUYv8C0XMdFdnmG3
	1qJTpQLjlumtw63h+aLpRqL0789Pdnp3fcrMSsnUmOmymln6CQv5YwyRRF3bHXUi98eb9wBECvOBX
	Mev+gHX5wmLwsWq8hZMNuOebtwPMsnsRjDB0ZpdEGwXZ0yLS91ep9f6NtzY/EVg9D10HaeUSmdByg
	rnnW/NHyj/0GEDuHGhn/u2ZG0xcwmpPO7iObee5j6k6LRzJPgSw22u5Oy5U4Q09mwrFX93eN65bEi
	61/CVnOfjbqZ0Il7Vxg2fe/z7sjUKcCc4Qdx5bOf4o4m619eMhFOMijyMXYN+4GYGtRCxjjwXK2Vh
	IV7mfi5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwk46-00000004B1l-0Uxo;
	Thu, 11 Sep 2025 16:22:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwk45-00000004B0y-0W2o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 16:22:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6BF12601D6;
	Thu, 11 Sep 2025 16:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A51CC4CEF0;
	Thu, 11 Sep 2025 16:22:25 +0000 (UTC)
Date: Thu, 11 Sep 2025 17:22:22 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, james.morse@arm.com,
	ardb@kernel.org, scott@os.amperecomputing.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v7 0/6] support FEAT_LSUI and apply it on futex
 atomic ops
Message-ID: <aML3Ps1xeTCVCdTn@arm.com>
References: <20250816151929.197589-1-yeoreum.yun@arm.com>
 <aMLmNnehYX6gqEIf@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMLmNnehYX6gqEIf@willie-the-truck>
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

On Thu, Sep 11, 2025 at 04:09:42PM +0100, Will Deacon wrote:
> On Sat, Aug 16, 2025 at 04:19:23PM +0100, Yeoreum Yun wrote:
> > Since Armv9.6, FEAT_LSUI supplies the load/store instructions for
> > previleged level to access to access user memory without clearing
> > PSTATE.PAN bit.
> > 
> > This patchset support FEAT_LSUI and applies in futex atomic operation
> > where can replace from ldxr/stlxr pair implmentation with clearing
> > PSTATE.PAN bit to correspondant load/store unprevileged atomic operation
> > without clearing PSTATE.PAN bit.
> > 
> > (Sorry, I've sent wrongly for patch version 7 and resend it.
> >  Again, sorry for mail-boom).
> 
> I tried to review this but I can't find any details about FEAT_LSUI in
> the latest Arm ARM. Where should I be looking for the architecture spec?

Unfortunately, it's just in the public xml at the moment. Hopefully
we'll get a release of the Arm ARM by the end of the year. Otherwise, in
the private 2024 arch spec. Not ideal though.

If you'd rather wait until in turns up in the public spec, fine by me.

-- 
Catalin

