Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E47D5CC81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 09:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agReVmhKtZaS1hfcER+LTIfmVxw8NkGzl6/LjkoODtQ=; b=1YXdo4hCQwG72sgR5OKDEZEW1b
	lc7U3O/2gxQqOSvR738vUAW9ZmQKIsx1tFZj1sfMUp9OCmJnf2IYEVnCqIjqck8Sf5XboJ9YHE6VI
	f3wo02Qk1npNAT5QyngvCLquyw076279GJ5Xjl4Jvn7fY6QslJsq9p+djgYpyYSmYOTKxYZEDKjMQ
	3FMn6JafxU7/noE96i//AJTbzqpA1MmFvzpnbIj2lFWQeZ16anlUblXityBoI8z1uRitkiAuQKHi2
	v8GEDGnbUenGEtM49yIIxCC5cuRO5Is3MNkFfLwkfH4KDKulrh1DRvkyCf1kQIi8A83j5+Xhsx+y9
	4pVrFNaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t65Sc-0000000HT7I-1d0O;
	Wed, 30 Oct 2024 09:57:54 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t65QT-0000000HSc7-175g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 09:55:43 +0000
Received: from 8bytes.org (p549219d2.dip0.t-ipconnect.de [84.146.25.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B402D2A8ABF;
	Wed, 30 Oct 2024 10:55:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1730282135;
	bh=gMC0AIiI/Y2DVK7hFH5y4phwR672FvvHc69yRw+0m/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l9Y8+XJfPeU4YrZn/iITWmNXxiGDKQc9qI1YRQlNIxSR9WumxuMkbyjgpbnyMkeNc
	 ZpvMFMOwCsn1RapHptt06thUPjJFkh44+dXEpEpDR1EkEf0Kl4DwpXawIXfAbmNRts
	 X63R4zz+B5UrrHYkv5a6NF3OQr+shqw3no07xjIksEN6S1sLX+KlH/PbooL+mR2bi5
	 mCU3WRDKz9hL+qgpaEX/7fIrDszVtauESl3Fv/cZH6HLx9d7pIgk1bl6c1oGUZK96m
	 yBkcjkzNUZpDlpxcqfg8cm6Cnu6KcLLwcOuaCo1N3vspd6UsoZzChLL1PdTwreFLvE
	 u3klQH+uJSSyw==
Date: Wed, 30 Oct 2024 10:55:34 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
	andersson@kernel.org, mathieu.poirier@linaro.org, hns@goldelico.com,
	b-padhi@ti.com, andreas@kemnade.info, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/4] Fix omap-iommu bitrot
Message-ID: <ZyIClriScBy4s6LX@8bytes.org>
References: <cover.1730136799.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1730136799.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_025541_558500_3AA42CC0 
X-CRM114-Status: GOOD (  11.18  )
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

On Mon, Oct 28, 2024 at 05:58:34PM +0000, Robin Murphy wrote:
> It seems omap-iommu hasn't had enough mainline users to avoid bitrotting
> through the more recent evolution of the IOMMU API internals. These
> patches attempt to bring it and its consumers sufficiently up-to-date
> to work again, in a manner that's hopefully backportable. This is
> largely all written by inspection, but I have managed to lightly boot
> test patch #3 on an OMAP4 Pandaboard to confirm iommu_probe_device()
> working again.

My initial reflex would have been to just wipe the omap drivers,
hardware is 10+ years out of production, no? So who is still using this
hardware with recent kernels for other purposes than kernel testing?

> This supersedes my previous patch[1]. Patches #1 and #2 are functionally
> independent, and can be applied directly to their respective trees if
> preferred.

I applied patches 3 and 4 to the ti/omap branch.

Regards,

	Joerg

