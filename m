Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E032D5CCA1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 12:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEGSTrpN+iMtwXkQVwK3QYVbYkCWhZ2oikXxGrF/JAQ=; b=gYs+8G29bj0fAHiMmWI+wGf8xw
	X6u/E2tU9eufGYZ469bOzAW5oijIGYIi5S9LE0EmRtvCFrhZdy+sFan1etHz/syDByql0oKjDPiKU
	fbTxroqKDHVQ0Pa0JpjNpyYeA9VevEbNxaOTDNYPdVf4J3fV2C7vQBrBSOt34FZoOIwUNxuegl3su
	9je6uI1ePcpY5RDNNfac3FGattRjSXKnoICOeNai4dumRxONoZevr/Zoc9nAmqhvnH0kA8Wo1Ilvf
	6DwagHaQjUH1XI/WEZrC728v9MA3rbyVW34WIfrG8BD0CcvjVyn6yxPFYi25GSklax8LajZHxBx9e
	XUGW6VAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t680t-00000000LvS-2ACG;
	Wed, 30 Oct 2024 12:41:27 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t67xn-00000000LWY-2sim
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 12:38:17 +0000
Received: from 8bytes.org (p549219d2.dip0.t-ipconnect.de [84.146.25.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 198532A83AF;
	Wed, 30 Oct 2024 13:38:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1730291893;
	bh=J7nmzRywj0qaO/1WPiCgBt1ut1D+D819BCVlsTvDaw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Da0ZS4pWlvbjgdzVD+fdk8Jzd/jG1ijiGPVkptR5cSluYwQ3JTkOqLI4YvaPI2weg
	 D0hPr37s26QLkDzN+GaObVj5QgjnldMcaKj+8wamC1UCOcSpDYLxZARhb67DxO7sPE
	 1/JxKf89DReDfxm/Zg/ccTAR/+92MHey6IDPKX2qjJts9WZZul9wkKmITAmc5HfBpd
	 rDGHBeXeqeGJAzLgr3I7VdBfEgNdNzjMHi3I5zFOnLSUWIpZX1rsHD5vXUhpUwcaBs
	 dT3ywAnZM9T7FeymcLPcixf3mpaG+cnx2bNEZpynXwmGeN8OyheysJ4J3CZm2Opwum
	 ncCrvoMn1T87g==
Date: Wed, 30 Oct 2024 13:38:11 +0100
From: Joerg Roedel <joro@8bytes.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Robin Murphy <robin.murphy@arm.com>, will@kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	mchehab@kernel.org, andersson@kernel.org,
	mathieu.poirier@linaro.org, Beleswar Padhi <b-padhi@ti.com>,
	Andreas Kemnade <andreas@kemnade.info>, iommu@lists.linux.dev,
	arm-soc <linux-arm-kernel@lists.infradead.org>,
	Linux-OMAP <linux-omap@vger.kernel.org>,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/4] Fix omap-iommu bitrot
Message-ID: <ZyIos2Gm1nf5rejI@8bytes.org>
References: <cover.1730136799.git.robin.murphy@arm.com>
 <ZyIClriScBy4s6LX@8bytes.org>
 <515D7932-3939-4C3E-BA3E-CC3152E64749@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <515D7932-3939-4C3E-BA3E-CC3152E64749@goldelico.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_053815_979863_6C273B85 
X-CRM114-Status: GOOD (  12.18  )
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

On Wed, Oct 30, 2024 at 12:20:31PM +0100, H. Nikolaus Schaller wrote:
> Why that? There was a discussion and everyone agreed to remove omap2,
> but not omap3 and later.

I raised this question to make sure the things we maintain are still
relevant. Developer and maintainers time is limited and we should not
spend it on stuff that nobody uses.

> There are some devices besides the PandaBoard. I am aware of these where
> this is relevant: Epson BT200, Samsung Galaxy Tab 2, Pyra Handheld
> (in production) and we are currently thinking about producing a tiny series
> of the DM3730 based GTA04A5 with spare parts.
> 
> And of course we want to participate from the latest and greatest upstream changes.

Okay, if there are still real users for latest mainline kernels on this
hardware, then the effort is justified.

Regards,

	Joerg

