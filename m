Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE65E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NvC1VxLdveZvwXRFy+Fkjc+M0h/VdtGp6Ud1N4+d00E=; b=Svy9lpJGu0+rB+hDOx+mTnyce0
	IW9ow+YADkky+AXYB3S37DH8kRLNZ1Lf5vNS7U5wr3loR+sM0VR7A65RRA4zzOB+kdNnB3HwJRh8x
	K0ggAGsnUsoe9eeB6Xx9a9xDUviKm0RtGXbloGSwZ8xMlRQk47H6SBvHcRRiaMH3QeTq5mjBp8nqK
	bwRSHO7jN6AY/BACWALDXnvGonfi1/Ce6UASDRMv9+QU/jtK3gX0WNSftok201UofSySrEyziu63i
	PrbE5jdRch9G/12OKlsXP53lxMRbiXlDDxKW2VqWgCCVLYw5F9z6OVITiVsV7tkERZ454tJWGoyXu
	ErlyU/6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBJA-0000000G1H0-1c4l;
	Thu, 05 Dec 2024 12:50:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBI9-0000000G1A9-0sKh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 12:49:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7345FA40342;
	Thu,  5 Dec 2024 12:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE20EC4CED1;
	Thu,  5 Dec 2024 12:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733402952;
	bh=NX65WV8yGDARxy+vn58QtGbfHPztV3lEHWFUXOR1Bm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aCP674tnYTtG1/sShnPtXahYcZP9Pp/xcBbTpwDFSRa+H/wJ+U0npBKfuTgfj2sQn
	 SYx5bWtaOySE97f8VkeEmtLFjv2rRwP30KvJrcDLA6tJW5Zq+WTcJMBi3LY/bdOrc4
	 HreAAFtMOmfp14kAdkkceSlcnp8neyogzq/upGam8HTkVW17H0qEi0KDZ3ik0WNnzH
	 kVhb3wAhmz3W+hCfWpvFlATki+IZ5rqqBZyaOG0Tzt/uLFgAIaAN+hq2+Hto2Nl0Ha
	 pa5gMs2XLBC8USH5CcxQXXk1wIB4Z9BqP4z5XAzqinccNgMYipJGqrTCxrkMsVUVMs
	 6Y01IA5ZDt/Aw==
Date: Thu, 5 Dec 2024 13:49:09 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: carlos.song@nxp.com
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, frank.li@nxp.com, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: fix divide by zero warning
Message-ID: <buy4r64ugalvyfqcctrq5l7ylnryjulf26yohgbzbnsy3asrbg@3ikvipa4keny>
References: <20241125141521.1612947-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125141521.1612947-1-carlos.song@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_044913_308467_E7E38DCB 
X-CRM114-Status: UNSURE (   7.85  )
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

Hi Carlos,

On Mon, Nov 25, 2024 at 10:15:21PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Add "i2c_clk_rate / 2" check to avoid "divide by zero warning".
> i2c_clk_rate may be zero if i2c clock is disabled.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

merged to i2c/i2c-host,

thanks,
Andi

