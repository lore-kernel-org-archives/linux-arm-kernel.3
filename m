Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D50B106ACC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 16:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twDTejgFiYBq/oNh2tbzlE4khCqdmTOxTL0v/WfIyHg=; b=sGgFnStnrhInV5Ip09VDihEphs
	NkavbycRbV3fDz4V96y2423E+EiV7VNFIicTA6MuUc+S6YLZRe4g0OcfgEC+5mXsqIENBhY+6pLz2
	BGM7GqHHZNTmt9453F0hLLZq6IpU8JT6V97uh4olV9Tmnxn87s3ESIf/Hch8Z5YRm39aO1SsJww0I
	xe3ZLDKXrsDGi822ZOO8sqR4BhGPbo5a/CEaz92C9M471NGdxRz3HegS5kMUT48ZwcM73DnCteamd
	lQZMOfmUmFHt0b9AnTJ5O5IJHbz/RZ67VnP1VS6rMzHZDY0gpLTjrwX6G0oSI/YB6p0pYGu/d/qfo
	T7BcMCCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iaF-0000000EUmA-2FPL;
	Thu, 12 Mar 2026 16:08:23 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ia9-0000000EUkL-0SBH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 16:08:22 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260312160810euoutp01e40142a543925bbcb3589d4064408f7c~cI8bsjYCg0580405804euoutp01E
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 16:08:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260312160810euoutp01e40142a543925bbcb3589d4064408f7c~cI8bsjYCg0580405804euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1773331690;
	bh=twDTejgFiYBq/oNh2tbzlE4khCqdmTOxTL0v/WfIyHg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AH0N8IMRI4fvbzQnNTqfCJxy+BGBh2RhaXCAVdKLuajJaXzFhOgbjhknKrgIgPOyx
	 WvLSQR+NZMI03G8VBjUjW1vOhqITOp7mcxoKKyaS6HR1VsB0QNy6LWgHKknO3QiEYx
	 z0TmZJygFekR6aeoZPq/Gs5NVvLBW6vyE0GLtx6w=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260312160809eucas1p1fc79e4d333f3995a48b68ff07ec7726c~cI8bJgs8W2038520385eucas1p1m;
	Thu, 12 Mar 2026 16:08:09 +0000 (GMT)
Received: from AMDC4515.digital.local (unknown [106.120.51.28]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260312160809eusmtip2a5fe35af5b658b73c3a82109e2b4333e~cI8aQCmCI3247232472eusmtip2_;
	Thu, 12 Mar 2026 16:08:08 +0000 (GMT)
From: Mateusz Majewski <m.majewski2@samsung.com>
To: alexey.klimov@linaro.org
Cc: alim.akhtar@samsung.com, bzolnier@gmail.com, conor+dt@kernel.org,
	daniel.lezcano@linaro.org, devicetree@vger.kernel.org, krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux.amoon@gmail.com, lukasz.luba@arm.com, m.majewski2@samsung.com,
	m.szyprowski@samsung.com, rafael@kernel.org, robh@kernel.org,
	rui.zhang@intel.com, semen.protsenko@linaro.org
Subject: Re: [PATCH v4 0/7] Add initial Exynos850 support to the thermal
 driver
Date: Thu, 12 Mar 2026 17:07:55 +0100
Message-ID: <20260312160755.150657-1-m.majewski2@samsung.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <DGYRJ0FUBJIB.3HUS30VW280A4@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260312160809eucas1p1fc79e4d333f3995a48b68ff07ec7726c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260312160809eucas1p1fc79e4d333f3995a48b68ff07ec7726c
X-EPHeader: CA
X-CMS-RootMailID: 20260312160809eucas1p1fc79e4d333f3995a48b68ff07ec7726c
References: <DGYRJ0FUBJIB.3HUS30VW280A4@linaro.org>
	<CGME20260312160809eucas1p1fc79e4d333f3995a48b68ff07ec7726c@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_090818_469100_5848FB52 
X-CRM114-Status: GOOD (  11.22  )
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

> I am looking at enabling ACPM thermal thingy but so far I see similar
> issue that temp of all sensors is reported as 10 C regardless via ACPM.
>
> Having said that I am not going to oppose this series moving forward if
> you wish.

Sure, I will probably get back to this when the other series are more
resolved like I said in the last email :) Or maybe by this time I will
learn more about ACPM but I doubt it.

Kind regards,
Mateusz Majewski

