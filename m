Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF9CD29FF7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 11:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DiiVrnvzlQr5Cq67SbrH7P4Pzbq4h86xOafA0L9a+yk=; b=YaROpccCJa+5tcUXwE43HNuRHt
	q8Ksx3EaEfHDvculF5u5+drG7BgFRFpdPmytOpnFZhX8dqqFOXzULiRJtibM9OGOy4ptbU8OkqXEs
	gsTl/IcUxRDk0E7wE8U+4UXVhr6+WKHfMzufQAigfnt1y5UHVLHmkQPdx5JywIbMSlV4A6x23sH4Q
	RA53xHCyfGS/OzW1eM2DKaG84XNHx58YmrAtsR5LA/fE/Js86AQvrIO4/X+OJrWFsbs/LEaep7fQW
	Z/I20DFy9/QhnRsPviSngJDvru5oEQFmH6l/dkYcAA2MOTRoW+xEQlKsvcqI2oLSB6N58LV7e62UV
	g394bIiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzXC-0000000940J-2oa5;
	Wed, 14 Jan 2026 11:59:34 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzXA-000000093z8-1sYh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 11:59:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=DiiV
	rnvzlQr5Cq67SbrH7P4Pzbq4h86xOafA0L9a+yk=; b=JDhrYuve2lN91zc07CLA
	Y4qtiPhz8jRDv/LHeSwZlAtmMRAPR/WCafJDEsFBOEm5UTxH3otG7ksevUj1j+Xe
	1rGdLnsbbX8xLeVRzR1B3YAjIEZAtGrP0i5lblpvxsPCgo5P6osaEmDMcMBxCBN2
	6Wo2+b/pIRRYIxOm/XEVPFIfthGnnav8+pLWepNqMx8tKKvaPhGsvccIVO1G8O99
	JU1Oe5e9CBc2k6ya3ffn+Bxaky0SmmxOqf2GQkcHVi52fm6rn+v90tRGSwFSyfTX
	4EzFFr6eJPuursUVdbLW4ckOq2d9LjNRem0fXkL+aAawmTdkWE+z8rZwaxPOss6H
	7A==
Received: (qmail 2115980 invoked from network); 14 Jan 2026 12:59:29 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jan 2026 12:59:29 +0100
X-UD-Smtp-Session: l3s3148p1@HeXl1ldIIL8ujnsM
Date: Wed, 14 Jan 2026 12:59:24 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Carlos Song <carlos.song@nxp.com>
Cc: frank.li@nxp.com, aisheng.dong@nxp.com, andi.shyti@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: imx-lpi2c: change to PIO mode in system-wide
 suspend/resume progress
Message-ID: <aWeFHNiNuHLdhZrO@ninjato>
References: <20251121030030.1844530-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121030030.1844530-1-carlos.song@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_035932_783951_F7A8E199 
X-CRM114-Status: GOOD (  10.88  )
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

On Fri, Nov 21, 2025 at 11:00:30AM +0800, Carlos Song wrote:
> EDMA resumes early and suspends late in the system power transition
> sequence, while LPI2C enters the NOIRQ stage for both suspend and resume.
> This means LPI2C resources become available before EDMA is fully resumed.
> Once IRQs are enabled, a slave device may immediately trigger an LPI2C
> transfer. If the transfer length meets DMA requirements, the driver will
> attempt to use EDMA even though EDMA may still be unavailable.
> 
> This timing gap can lead to transfer failures. To prevent this, force
> LPI2C to use PIO mode during system-wide suspend and resume transitions.
> This reduces dependency on EDMA and avoids using an unready DMA resource.
> 
> Fixes: a09c8b3f9047 ("i2c: imx-lpi2c: add eDMA mode support for LPI2C")
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Applied to for-current, thanks!


